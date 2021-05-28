Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBCC3940AF
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 12:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0551F6E4AE;
	Fri, 28 May 2021 10:11:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC096E4AE
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 10:11:11 +0000 (UTC)
Date: Fri, 28 May 2021 11:10:54 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm: Fix for GEM buffers with write-combine memory
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-Id: <6YATTQ.MSZ3AMJZMTBZ1@crapouillou.net>
In-Reply-To: <b3ae134e-2494-82ce-d8d2-ca7284129075@ideasonboard.com>
References: <26b5424a-ff4c-090b-a08f-0e3e32278180@ideasonboard.com>
 <20210527230334.151947-1-paul@crapouillou.net>
 <b3ae134e-2494-82ce-d8d2-ca7284129075@ideasonboard.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, list@opendingux.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Le ven., mai 28 2021 at 08:59:15 +0300, Tomi Valkeinen=20
<tomi.valkeinen@ideasonboard.com> a =E9crit :
> On 28/05/2021 02:03, Paul Cercueil wrote:
>> The previous commit wrongly assumed that dma_mmap_wc() could be=20
>> replaced
>> by pgprot_writecombine() + dma_mmap_pages(). It did work on my setup,
>> but did not work everywhere.
>>=20
>> Use dma_mmap_wc() when the buffer has the write-combine cache=20
>> attribute,
>> and dma_mmap_pages() when it has the non-coherent cache attribute.
>>=20
>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>> Reported-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> Fixes: cf8ccbc72d61 ("drm: Add support for GEM buffers backed by=20
>> non-coherent memory")
>> ---
>>   drivers/gpu/drm/drm_gem_cma_helper.c | 16 ++++++++++------
>>   1 file changed, 10 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c=20
>> b/drivers/gpu/drm/drm_gem_cma_helper.c
>> index 235c7a63da2b..4c3772651954 100644
>> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
>> @@ -514,13 +514,17 @@ int drm_gem_cma_mmap(struct drm_gem_object=20
>> *obj, struct vm_area_struct *vma)
>>   =7F  	cma_obj =3D to_drm_gem_cma_obj(obj);
>>   =7F-	vma->vm_page_prot =3D vm_get_page_prot(vma->vm_flags);
>> -	if (!cma_obj->map_noncoherent)
>> -		vma->vm_page_prot =3D pgprot_writecombine(vma->vm_page_prot);
>> +	if (cma_obj->map_noncoherent) {
>> +		vma->vm_page_prot =3D vm_get_page_prot(vma->vm_flags);
>> +
>> +		ret =3D dma_mmap_pages(cma_obj->base.dev->dev,
>> +				     vma, vma->vm_end - vma->vm_start,
>> +				     virt_to_page(cma_obj->vaddr));
>> +	} else {
>> +		ret =3D dma_mmap_wc(cma_obj->base.dev->dev, vma, cma_obj->vaddr,
>> +				  cma_obj->paddr, vma->vm_end - vma->vm_start);
>>   =7F-	ret =3D dma_mmap_pages(cma_obj->base.dev->dev,
>> -			     vma, vma->vm_end - vma->vm_start,
>> -			     virt_to_page(cma_obj->vaddr));
>> +	}
>>   	if (ret)
>>   		drm_gem_vm_close(vma);
>>   =7F
>=20
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>=20
> and
>=20
> Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Thanks, I applied it now.

>=20
> Thanks!
>=20
> Btw, the kernel-doc for drm_gem_cma_create doesn't quite match, as it=20
> says wc is always used.

Alright, I'll send a patch later for this one too.

Cheers,
-Paul


