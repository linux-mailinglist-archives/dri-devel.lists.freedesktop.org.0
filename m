Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5C044E9FD
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 16:26:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BB86EC95;
	Fri, 12 Nov 2021 15:26:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 548646EC95
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 15:26:19 +0000 (UTC)
Date: Fri, 12 Nov 2021 15:26:06 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm/cma-helper: Release non-coherent memory with
 dma_free_noncoherent()
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-Id: <IJTG2R.XL24166ZB1AM2@crapouillou.net>
In-Reply-To: <36f8fdd6-13dc-7a68-6365-ab2152337c33@suse.de>
References: <20210708175146.10618-1-tzimmermann@suse.de>
 <36f8fdd6-13dc-7a68-6365-ab2152337c33@suse.de>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

I never received the original patch and I can't find it online either?

Anyway:
Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul


Le ven., nov. 12 2021 at 16:05:47 +0100, Thomas Zimmermann=20
<tzimmermann@suse.de> a =E9crit :
> Ping for review.
>=20
> Am 08.07.21 um 19:51 schrieb Thomas Zimmermann:
>> The GEM CMA helpers allocate non-coherent (i.e., cached) backing=20
>> storage
>> with dma_alloc_noncoherent(), but release it with dma_free_wc(). Fix=20
>> this
>> with a call to dma_free_noncoherent(). Writecombining storage is=20
>> still
>> released with dma_free_wc().
>>=20
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Fixes: cf8ccbc72d61 ("drm: Add support for GEM buffers backed by=20
>> non-coherent memory")
>> Cc: Paul Cercueil <paul@crapouillou.net>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: David Airlie <airlied@linux.ie>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: dri-devel@lists.freedesktop.org
>> ---
>>   drivers/gpu/drm/drm_gem_cma_helper.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c=20
>> b/drivers/gpu/drm/drm_gem_cma_helper.c
>> index d53388199f34..9d05674550a4 100644
>> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
>> @@ -210,8 +210,13 @@ void drm_gem_cma_free_object(struct=20
>> drm_gem_object *gem_obj)
>>   			dma_buf_vunmap(gem_obj->import_attach->dmabuf, &map);
>>   		drm_prime_gem_destroy(gem_obj, cma_obj->sgt);
>>   	} else if (cma_obj->vaddr) {
>> -		dma_free_wc(gem_obj->dev->dev, cma_obj->base.size,
>> -			    cma_obj->vaddr, cma_obj->paddr);
>> +		if (cma_obj->map_noncoherent)
>> +			dma_free_noncoherent(gem_obj->dev->dev, cma_obj->base.size,
>> +					     cma_obj->vaddr, cma_obj->paddr,
>> +					     DMA_TO_DEVICE);
>> +		else
>> +			dma_free_wc(gem_obj->dev->dev, cma_obj->base.size,
>> +				    cma_obj->vaddr, cma_obj->paddr);
>>   	}
>>=20
>>   	drm_gem_object_release(gem_obj);
>>=20
>=20
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Ivo Totev


