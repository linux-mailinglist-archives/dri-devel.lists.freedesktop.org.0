Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED74393278
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 17:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D2A6F413;
	Thu, 27 May 2021 15:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1046F413
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 15:31:40 +0000 (UTC)
Date: Thu, 27 May 2021 13:43:13 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 1/3] drm: Add support for GEM buffers backed by
 non-coherent memory
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-Id: <1CNRTQ.12RZKDP9M4XR3@crapouillou.net>
In-Reply-To: <26b5424a-ff4c-090b-a08f-0e3e32278180@ideasonboard.com>
References: <20210523170415.90410-1-paul@crapouillou.net>
 <20210523170415.90410-2-paul@crapouillou.net>
 <26b5424a-ff4c-090b-a08f-0e3e32278180@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Lokesh Vutla <lokeshvutla@ti.com>,
 dri-devel@lists.freedesktop.org, list@opendingux.net, "Yadav,
 Pratyush" <p.yadav@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Le jeu., mai 27 2021 at 13:40:07 +0300, Tomi Valkeinen=20
<tomi.valkeinen@ideasonboard.com> a =E9crit :
> On 23/05/2021 20:04, Paul Cercueil wrote:
>> Having GEM buffers backed by non-coherent memory is interesting in=20
>> the
>> particular case where it is faster to render to a non-coherent buffer
>> then sync the data cache, than to render to a write-combine buffer,=20
>> and
>> (by extension) much faster than using a shadow buffer. This is true=20
>> for
>> instance on some Ingenic SoCs, where even simple blits (e.g. memcpy)
>> are about three times faster using this method.
>>=20
>> Add a 'map_noncoherent' flag to the drm_gem_cma_object structure,=20
>> which
>> can be set by the drivers when they create the dumb buffer.
>>=20
>> Since this really only applies to software rendering, disable this=20
>> flag
>> as soon as the CMA objects are exported via PRIME.
>>=20
>> v3: New patch. Now uses a simple 'map_noncoherent' flag to control=20
>> how
>>      the objects are mapped, and use the new dma_mmap_pages function.
>>=20
>> v4: Make sure map_noncoherent is always disabled when creating GEM
>>      objects meant to be used with dma-buf.
>>=20
>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/drm_gem_cma_helper.c | 38=20
>> +++++++++++++++++++++-------
>>   include/drm/drm_gem_cma_helper.h     |  3 +++
>>   2 files changed, 32 insertions(+), 9 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c=20
>> b/drivers/gpu/drm/drm_gem_cma_helper.c
>> index 7942cf05cd93..235c7a63da2b 100644
>> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
>> @@ -46,6 +46,7 @@ static const struct drm_gem_object_funcs=20
>> drm_gem_cma_default_funcs =3D {
>>    * __drm_gem_cma_create - Create a GEM CMA object without=20
>> allocating memory
>>    * @drm: DRM device
>>    * @size: size of the object to allocate
>> + * @private: true if used for internal purposes
>>    *
>>    * This function creates and initializes a GEM CMA object of the=20
>> given size,
>>    * but doesn't allocate any memory to back the object.
>> @@ -55,11 +56,11 @@ static const struct drm_gem_object_funcs=20
>> drm_gem_cma_default_funcs =3D {
>>    * error code on failure.
>>    */
>>   static struct drm_gem_cma_object *
>> -__drm_gem_cma_create(struct drm_device *drm, size_t size)
>> +__drm_gem_cma_create(struct drm_device *drm, size_t size, bool=20
>> private)
>>   {
>>   	struct drm_gem_cma_object *cma_obj;
>>   	struct drm_gem_object *gem_obj;
>> -	int ret;
>> +	int ret =3D 0;
>>   =7F  	if (drm->driver->gem_create_object)
>>   		gem_obj =3D drm->driver->gem_create_object(drm, size);
>> @@ -73,7 +74,14 @@ __drm_gem_cma_create(struct drm_device *drm,=20
>> size_t size)
>>   =7F  	cma_obj =3D container_of(gem_obj, struct drm_gem_cma_object,=20
>> base);
>>   =7F-	ret =3D drm_gem_object_init(drm, gem_obj, size);
>> +	if (private) {
>> +		drm_gem_private_object_init(drm, gem_obj, size);
>> +
>> +		/* Always use writecombine for dma-buf mappings */
>> +		cma_obj->map_noncoherent =3D false;
>> +	} else {
>> +		ret =3D drm_gem_object_init(drm, gem_obj, size);
>> +	}
>>   	if (ret)
>>   		goto error;
>>   =7F@@ -111,12 +119,19 @@ struct drm_gem_cma_object=20
>> *drm_gem_cma_create(struct drm_device *drm,
>>   =7F  	size =3D round_up(size, PAGE_SIZE);
>>   =7F-	cma_obj =3D __drm_gem_cma_create(drm, size);
>> +	cma_obj =3D __drm_gem_cma_create(drm, size, false);
>>   	if (IS_ERR(cma_obj))
>>   		return cma_obj;
>>   =7F-	cma_obj->vaddr =3D dma_alloc_wc(drm->dev, size, &cma_obj->paddr,
>> -				      GFP_KERNEL | __GFP_NOWARN);
>> +	if (cma_obj->map_noncoherent) {
>> +		cma_obj->vaddr =3D dma_alloc_noncoherent(drm->dev, size,
>> +						       &cma_obj->paddr,
>> +						       DMA_TO_DEVICE,
>> +						       GFP_KERNEL | __GFP_NOWARN);
>> +	} else {
>> +		cma_obj->vaddr =3D dma_alloc_wc(drm->dev, size, &cma_obj->paddr,
>> +					      GFP_KERNEL | __GFP_NOWARN);
>> +	}
>>   	if (!cma_obj->vaddr) {
>>   		drm_dbg(drm, "failed to allocate buffer with size %zu\n",
>>   			 size);
>> @@ -432,7 +447,7 @@ drm_gem_cma_prime_import_sg_table(struct=20
>> drm_device *dev,
>>   		return ERR_PTR(-EINVAL);
>>   =7F  	/* Create a CMA GEM buffer. */
>> -	cma_obj =3D __drm_gem_cma_create(dev, attach->dmabuf->size);
>> +	cma_obj =3D __drm_gem_cma_create(dev, attach->dmabuf->size, true);
>>   	if (IS_ERR(cma_obj))
>>   		return ERR_CAST(cma_obj);
>>   =7F@@ -499,8 +514,13 @@ int drm_gem_cma_mmap(struct drm_gem_object=20
>> *obj, struct vm_area_struct *vma)
>>   =7F  	cma_obj =3D to_drm_gem_cma_obj(obj);
>>   =7F-	ret =3D dma_mmap_wc(cma_obj->base.dev->dev, vma, cma_obj->vaddr,
>> -			  cma_obj->paddr, vma->vm_end - vma->vm_start);
>> +	vma->vm_page_prot =3D vm_get_page_prot(vma->vm_flags);
>> +	if (!cma_obj->map_noncoherent)
>> +		vma->vm_page_prot =3D pgprot_writecombine(vma->vm_page_prot);
>> +
>> +	ret =3D dma_mmap_pages(cma_obj->base.dev->dev,
>> +			     vma, vma->vm_end - vma->vm_start,
>> +			     virt_to_page(cma_obj->vaddr));
>=20
> This breaks mmap on TI's J7 EVM (tidss driver). All DRM apps just die=20
> when doing mmap. Changing these lines back to dma_mmap_wc() makes it=20
> work.
>=20
> Is dma_alloc_wc() even compatible with dma_mmap_pages()?

My bad, dma_mmap_wc() is not just a regular mmap with writecombine page=20
protection.

The solution, I guess, would be to call dma_mmap_wc() if=20
(!cma_obj->map_noncoherent). I can send a patch later this week, unless=20
you already have one?

Cheers,
-Paul


