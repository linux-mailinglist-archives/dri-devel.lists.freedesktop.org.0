Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBA93B2CC7
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 12:47:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56AC6EAAA;
	Thu, 24 Jun 2021 10:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E80B6EAAA;
 Thu, 24 Jun 2021 10:47:10 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 37C981FD66;
 Thu, 24 Jun 2021 10:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624531629; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UNfHcBXqek7GmcoTem/XaPIlRCO4owlftQR+4qNc1sU=;
 b=TIENSl/xed98EHHfBGhkil7nXfYffEymael3OoB0EMt6cgy+inSdsoZ+5no9hHHMBd2ieX
 CyZxPnO1tCIzXlhonnOIacrq7gh/0IjLiD0bEffxlUpMw3M99+Oqsv+aoagjKgM3ZLdF3y
 +H9dfsf8JQ6xkU9VPhAuzSvdbuWpNdY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624531629;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UNfHcBXqek7GmcoTem/XaPIlRCO4owlftQR+4qNc1sU=;
 b=Piv66TwyItPMiBoxILH16/KXu6jKy+/oG+V9RsFfE0lwWN6BMbYI95V4iHa/p/wAyQA12C
 fO/BE20vSyUwE4DA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 0EC3E11A97;
 Thu, 24 Jun 2021 10:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624531629; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UNfHcBXqek7GmcoTem/XaPIlRCO4owlftQR+4qNc1sU=;
 b=TIENSl/xed98EHHfBGhkil7nXfYffEymael3OoB0EMt6cgy+inSdsoZ+5no9hHHMBd2ieX
 CyZxPnO1tCIzXlhonnOIacrq7gh/0IjLiD0bEffxlUpMw3M99+Oqsv+aoagjKgM3ZLdF3y
 +H9dfsf8JQ6xkU9VPhAuzSvdbuWpNdY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624531629;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UNfHcBXqek7GmcoTem/XaPIlRCO4owlftQR+4qNc1sU=;
 b=Piv66TwyItPMiBoxILH16/KXu6jKy+/oG+V9RsFfE0lwWN6BMbYI95V4iHa/p/wAyQA12C
 fO/BE20vSyUwE4DA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 8URMAq1i1GAsbQAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Thu, 24 Jun 2021 10:47:09 +0000
To: Lucas Stach <l.stach@pengutronix.de>, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, airlied@linux.ie, daniel@ffwll.ch
References: <20210624085800.7941-1-tzimmermann@suse.de>
 <657956dded241192bbd9ca59f6e9d58a9283f972.camel@pengutronix.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/etnaviv: Implement mmap as GEM object function
Message-ID: <ddae9158-0aa7-f861-2c61-5d8f8d28fb62@suse.de>
Date: Thu, 24 Jun 2021 12:47:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <657956dded241192bbd9ca59f6e9d58a9283f972.camel@pengutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="9whhkr99B8vSFzvU8i8gyIsbiZ9JU9mVK"
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9whhkr99B8vSFzvU8i8gyIsbiZ9JU9mVK
Content-Type: multipart/mixed; boundary="6PnOJQNR11FtVB716HJNJkKCm3mR3ZLIZ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Lucas Stach <l.stach@pengutronix.de>, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, airlied@linux.ie, daniel@ffwll.ch
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <ddae9158-0aa7-f861-2c61-5d8f8d28fb62@suse.de>
Subject: Re: [PATCH] drm/etnaviv: Implement mmap as GEM object function
References: <20210624085800.7941-1-tzimmermann@suse.de>
 <657956dded241192bbd9ca59f6e9d58a9283f972.camel@pengutronix.de>
In-Reply-To: <657956dded241192bbd9ca59f6e9d58a9283f972.camel@pengutronix.de>

--6PnOJQNR11FtVB716HJNJkKCm3mR3ZLIZ
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 24.06.21 um 11:11 schrieb Lucas Stach:
> Am Donnerstag, dem 24.06.2021 um 10:58 +0200 schrieb Thomas Zimmermann:=

>> Moving the driver-specific mmap code into a GEM object function allows=

>> for using DRM helpers for various mmap callbacks.
>>
>> The respective etnaviv functions are being removed. The file_operation=
s
>> structure fops is now being created by the helper macro
>> DEFINE_DRM_GEM_FOPS().
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/etnaviv/etnaviv_drv.c       | 14 ++------------
>>   drivers/gpu/drm/etnaviv/etnaviv_drv.h       |  3 ---
>>   drivers/gpu/drm/etnaviv/etnaviv_gem.c       | 18 +++++-------------
>>   drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 13 -------------
>>   4 files changed, 7 insertions(+), 41 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/e=
tnaviv/etnaviv_drv.c
>> index f0a07278ad04..7dcc6392792d 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>> @@ -468,17 +468,7 @@ static const struct drm_ioctl_desc etnaviv_ioctls=
[] =3D {
>>   	ETNA_IOCTL(PM_QUERY_SIG, pm_query_sig, DRM_RENDER_ALLOW),
>>   };
>>  =20
>> -static const struct file_operations fops =3D {
>> -	.owner              =3D THIS_MODULE,
>> -	.open               =3D drm_open,
>> -	.release            =3D drm_release,
>> -	.unlocked_ioctl     =3D drm_ioctl,
>> -	.compat_ioctl       =3D drm_compat_ioctl,
>> -	.poll               =3D drm_poll,
>> -	.read               =3D drm_read,
>> -	.llseek             =3D no_llseek,
>> -	.mmap               =3D etnaviv_gem_mmap,
>> -};
>> +DEFINE_DRM_GEM_FOPS(fops);
>>  =20
>>   static const struct drm_driver etnaviv_drm_driver =3D {
>>   	.driver_features    =3D DRIVER_GEM | DRIVER_RENDER,
>> @@ -487,7 +477,7 @@ static const struct drm_driver etnaviv_drm_driver =
=3D {
>>   	.prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
>>   	.prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
>>   	.gem_prime_import_sg_table =3D etnaviv_gem_prime_import_sg_table,
>> -	.gem_prime_mmap     =3D etnaviv_gem_prime_mmap,
>> +	.gem_prime_mmap     =3D drm_gem_prime_mmap,
>>   #ifdef CONFIG_DEBUG_FS
>>   	.debugfs_init       =3D etnaviv_debugfs_init,
>>   #endif
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/e=
tnaviv/etnaviv_drv.h
>> index 003288ebd896..049ae87de9be 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
>> @@ -47,12 +47,9 @@ struct etnaviv_drm_private {
>>   int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
>>   		struct drm_file *file);
>>  =20
>> -int etnaviv_gem_mmap(struct file *filp, struct vm_area_struct *vma);
>>   int etnaviv_gem_mmap_offset(struct drm_gem_object *obj, u64 *offset)=
;
>>   struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_objec=
t *obj);
>>   int etnaviv_gem_prime_vmap(struct drm_gem_object *obj, struct dma_bu=
f_map *map);
>> -int etnaviv_gem_prime_mmap(struct drm_gem_object *obj,
>> -			   struct vm_area_struct *vma);
>>   struct drm_gem_object *etnaviv_gem_prime_import_sg_table(struct drm_=
device *dev,
>>   	struct dma_buf_attachment *attach, struct sg_table *sg);
>>   int etnaviv_gem_prime_pin(struct drm_gem_object *obj);
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/e=
tnaviv/etnaviv_gem.c
>> index b8fa6ed3dd73..8f1b5af47dd6 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
>> @@ -130,8 +130,7 @@ static int etnaviv_gem_mmap_obj(struct etnaviv_gem=
_object *etnaviv_obj,
>>   {
>>   	pgprot_t vm_page_prot;
>>  =20
>> -	vma->vm_flags &=3D ~VM_PFNMAP;
>> -	vma->vm_flags |=3D VM_MIXEDMAP;
>> +	vma->vm_flags |=3D VM_IO | VM_MIXEDMAP | VM_DONTEXPAND | VM_DONTDUMP=
;
>=20
> I don't fully understand why this change is needed and the commit log
> is silent about it. Excuse my ignorance, but can you please explain the=

> reasoning behind this change?

Sure, sorry for being brief.

I worked on cleaning up the deprecated gem_prime_* callbacks in struct=20
drm_driver. These are supposed to be GEM object functions. The only=20
obsolete gem prime callback in drm_driver is gem_prime_mmap.

Currently drivers
  implement mmap in via callbacks in struct file_operations.mmap, struct =

drm_driver.gem_prime_mmap and struct drm_gem_object_funcs.mmap (and=20
sometimes an additional mmap for fbdev emulation). That's way too much=20
duplication. The correct place to implement mmap is in struct=20
drm_gem_object_funcs.

I'm consolidating DRM mmap code in struct drm_gem_object_funcs.mmap.=20
There's even a fixme comment about this. [1] With the cleaned up mmap,=20
DRM drivers can switch to DRM helpers and macros for all other instances =

of mmap.

And only a
  handful of drivers if left to convert. For these final drivers (e.g.,=20
etnaviv) I replace the driver code with the generic helpers and move the =

specific flags and setup into the GEM object's mmap function.

Once finished, all DRM drivers will implement gem_prime_mmap with=20
drm_gem_prime_mmap().
  The core code can be further simplified from there and this will allow =

to remove gem_prime_mmap and the occasional fbdev mmap.


Best regards
Thomas

[1]=20
https://elixir.bootlin.com/linux/latest/source/include/drm/drm_drv.h#L388=


>=20
> Regards,
> Lucas
>=20
>>  =20
>>   	vm_page_prot =3D vm_get_page_prot(vma->vm_flags);
>>  =20
>> @@ -154,19 +153,11 @@ static int etnaviv_gem_mmap_obj(struct etnaviv_g=
em_object *etnaviv_obj,
>>   	return 0;
>>   }
>>  =20
>> -int etnaviv_gem_mmap(struct file *filp, struct vm_area_struct *vma)
>> +static int etnaviv_gem_mmap(struct drm_gem_object *obj, struct vm_are=
a_struct *vma)
>>   {
>> -	struct etnaviv_gem_object *obj;
>> -	int ret;
>> -
>> -	ret =3D drm_gem_mmap(filp, vma);
>> -	if (ret) {
>> -		DBG("mmap failed: %d", ret);
>> -		return ret;
>> -	}
>> +	struct etnaviv_gem_object *etnaviv_obj =3D to_etnaviv_bo(obj);
>>  =20
>> -	obj =3D to_etnaviv_bo(vma->vm_private_data);
>> -	return obj->ops->mmap(obj, vma);
>> +	return etnaviv_obj->ops->mmap(etnaviv_obj, vma);
>>   }
>>  =20
>>   static vm_fault_t etnaviv_gem_fault(struct vm_fault *vmf)
>> @@ -567,6 +558,7 @@ static const struct drm_gem_object_funcs etnaviv_g=
em_object_funcs =3D {
>>   	.unpin =3D etnaviv_gem_prime_unpin,
>>   	.get_sg_table =3D etnaviv_gem_prime_get_sg_table,
>>   	.vmap =3D etnaviv_gem_prime_vmap,
>> +	.mmap =3D etnaviv_gem_mmap,
>>   	.vm_ops =3D &vm_ops,
>>   };
>>  =20
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu=
/drm/etnaviv/etnaviv_gem_prime.c
>> index d741b1d735f7..6d8bed9c739d 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
>> @@ -34,19 +34,6 @@ int etnaviv_gem_prime_vmap(struct drm_gem_object *o=
bj, struct dma_buf_map *map)
>>   	return 0;
>>   }
>>  =20
>> -int etnaviv_gem_prime_mmap(struct drm_gem_object *obj,
>> -			   struct vm_area_struct *vma)
>> -{
>> -	struct etnaviv_gem_object *etnaviv_obj =3D to_etnaviv_bo(obj);
>> -	int ret;
>> -
>> -	ret =3D drm_gem_mmap_obj(obj, obj->size, vma);
>> -	if (ret < 0)
>> -		return ret;
>> -
>> -	return etnaviv_obj->ops->mmap(etnaviv_obj, vma);
>> -}
>> -
>>   int etnaviv_gem_prime_pin(struct drm_gem_object *obj)
>>   {
>>   	if (!obj->import_attach) {
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--6PnOJQNR11FtVB716HJNJkKCm3mR3ZLIZ--

--9whhkr99B8vSFzvU8i8gyIsbiZ9JU9mVK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDUYqwFAwAAAAAACgkQlh/E3EQov+DL
LxAAxZM6h+x9ve0m5nHmXa2fGuTs84Qyyt7ez4Uhfr25q2GSMAhzilyzBWlZ57E/N/XIC4u2eo9P
awRYBXXHq+kdg34FLhmbL5UK4s+XtN1LKbDCF7+faO9dKsof6sQGXNnwpM4rKuDRiG/6xeqtKf9r
u+ySe6QaX2sDFNSnssbaUS5sDlFm6hQJj787NaGQdqm0ea4tXeCZfTMwsonjhmXyLf+jOAb138Rl
B5deamru1332kZvHLsUV4VNsuZWperkTac5PjlB//+Pn42mV/ziL13NE6s3WPHCYjSGKm0MXSsDs
vs5ig8vS9ZnHSfhlFtS4LMBZWn4r0U8qgLfyH77deCkajWTVae3c1+DlN1tuJdndqj62mAeENtLL
VeAfFFhmOMubf2Ai9hwHH/nx3NoCtnqeWyDPd/Z/iPG4gRvmpI5+lJSbd5mJkIn3aYMssNYh8d3A
Uc2bxn2DcaCzEA3rf2o/D2gLY2YafiKHsfiIJIHwyC90psX+9RBKGPKNWaTn6sJWsPVsadwWaQHR
UEjidRltQ1t+mRoqJyE9rWbf5GrxDEbF7zOSAQuDTzX/gOB30F7VeZKJZIgmPDZmFX1OPmSRJ72j
LEnfQnKR8HDNSEmD25W6cZBQewhsUB1zGLeL3VKZ5Cfl47erftdwmjHkjFrcxC8g3Z4fy3xFAGDo
E8Y=
=BLu7
-----END PGP SIGNATURE-----

--9whhkr99B8vSFzvU8i8gyIsbiZ9JU9mVK--
