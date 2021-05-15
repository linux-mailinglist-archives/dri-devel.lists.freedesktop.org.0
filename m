Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B1A38171C
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 11:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F6C6E0C6;
	Sat, 15 May 2021 09:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09D56E0C6
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 09:14:31 +0000 (UTC)
Date: Sat, 15 May 2021 10:14:17 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 1/3] drm: Add support for GEM buffers backed by
 non-coherent memory
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-Id: <TN55TQ.WL68QNFRU9LG2@crapouillou.net>
In-Reply-To: <738660d9-495b-a9b5-b371-a2e4364ee9b8@suse.de>
References: <20210514201138.162230-1-paul@crapouillou.net>
 <20210514201138.162230-2-paul@crapouillou.net>
 <738660d9-495b-a9b5-b371-a2e4364ee9b8@suse.de>
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
Cc: David Airlie <airlied@linux.ie>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, od@opendingux.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Le sam., mai 15 2021 at 11:03:34 +0200, Thomas Zimmermann=20
<tzimmermann@suse.de> a =E9crit :
> Hi
>=20
> Am 14.05.21 um 22:11 schrieb Paul Cercueil:
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
>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>> ---
>>   drivers/gpu/drm/drm_gem_cma_helper.c | 41=20
>> +++++++++++++++++++++++++---
>>   include/drm/drm_gem_cma_helper.h     |  7 ++++-
>>   2 files changed, 43 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c=20
>> b/drivers/gpu/drm/drm_gem_cma_helper.c
>> index 7942cf05cd93..81a31bcf7d68 100644
>> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
>> @@ -115,8 +115,15 @@ struct drm_gem_cma_object=20
>> *drm_gem_cma_create(struct drm_device *drm,
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
>> @@ -499,8 +506,13 @@ int drm_gem_cma_mmap(struct drm_gem_object=20
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
>>   	if (ret)
>>   		drm_gem_vm_close(vma);
>>   =7F@@ -556,3 +568,24 @@=20
>> drm_gem_cma_prime_import_sg_table_vmap(struct drm_device *dev,
>>   	return obj;
>>   }
>>   EXPORT_SYMBOL(drm_gem_cma_prime_import_sg_table_vmap);
>> +
>> +/**
>> + * drm_gem_cma_prime_mmap - PRIME mmap function for CMA GEM drivers
>> + * @obj: GEM object
>> + * @vma: Virtual address range
>> + *
>> + * Carbon copy of drm_gem_prime_mmap, but the 'map_noncoherent'=20
>> flag is
>> + * disabled to ensure that the exported buffers have the expected=20
>> cache
>> + * coherency.
>> + */
>> +int drm_gem_cma_prime_mmap(struct drm_gem_object *obj,
>> +			   struct vm_area_struct *vma)
>> +{
>> +	struct drm_gem_cma_object *cma_obj =3D to_drm_gem_cma_obj(obj);
>> +
>> +	/* Use standard cache settings for PRIME-exported GEM buffers */
>> +	cma_obj->map_noncoherent =3D false;
>> +
>> +	return drm_gem_prime_mmap(obj, vma);
>> +}
>> +EXPORT_SYMBOL(drm_gem_cma_prime_mmap);
>> diff --git a/include/drm/drm_gem_cma_helper.h=20
>> b/include/drm/drm_gem_cma_helper.h
>> index 0a9711caa3e8..b597e00fd5f6 100644
>> --- a/include/drm/drm_gem_cma_helper.h
>> +++ b/include/drm/drm_gem_cma_helper.h
>> @@ -16,6 +16,7 @@ struct drm_mode_create_dumb;
>>    *       more than one entry but they are guaranteed to have=20
>> contiguous
>>    *       DMA addresses.
>>    * @vaddr: kernel virtual address of the backing memory
>> + * @map_noncoherent: if true, the GEM object is backed by=20
>> non-coherent memory
>>    */
>>   struct drm_gem_cma_object {
>>   	struct drm_gem_object base;
>> @@ -24,6 +25,8 @@ struct drm_gem_cma_object {
>>   =7F  	/* For objects with DMA memory allocated by GEM CMA */
>>   	void *vaddr;
>> +
>> +	bool map_noncoherent;
>>   };
>>   =7F  #define to_drm_gem_cma_obj(gem_obj) \
>> @@ -119,7 +122,7 @@ int drm_gem_cma_mmap(struct drm_gem_object *obj,=20
>> struct vm_area_struct *vma);
>>   	.prime_handle_to_fd	=3D drm_gem_prime_handle_to_fd, \
>>   	.prime_fd_to_handle	=3D drm_gem_prime_fd_to_handle, \
>>   	.gem_prime_import_sg_table =3D drm_gem_cma_prime_import_sg_table, \
>> -	.gem_prime_mmap		=3D drm_gem_prime_mmap
>> +	.gem_prime_mmap		=3D drm_gem_cma_prime_mmap
>=20
> gem_prime_mmap is deprecated and on the way out. Only mmap in=20
> drm_gem_object_funcs should be used. I have patches for other drivers=20
> that convert everything to drm_gem_prime_mmap. Afterwards the pointer=20
> can be removed.
>=20
> Rather than writing a custom prime mmap function, update=20
> drm_gem_cma_prime_import_sg_table() so that it disables non-coherent=20
> mappings for imported buffers. For an example, see how SHMEM's=20
> internal create function uses the 'private' parameter. [1]

Alright, I can do that.

Cheers,
-Paul

> Best regards
> Thomas
>=20
> [1]=20
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_gem_sh=
mem_helper.c#L39
>=20
>>   =7F  /**
>>    * DRM_GEM_CMA_DRIVER_OPS - CMA GEM driver operations
>> @@ -181,5 +184,7 @@ struct drm_gem_object *
>>   drm_gem_cma_prime_import_sg_table_vmap(struct drm_device *drm,
>>   				       struct dma_buf_attachment *attach,
>>   				       struct sg_table *sgt);
>> +int drm_gem_cma_prime_mmap(struct drm_gem_object *obj,
>> +			   struct vm_area_struct *vma);
>>   =7F  #endif /* __DRM_GEM_CMA_HELPER_H__ */
>>=20
>=20
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
>=20


