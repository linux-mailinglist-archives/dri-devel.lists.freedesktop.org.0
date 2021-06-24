Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD2A3B2ED7
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 14:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE616EB78;
	Thu, 24 Jun 2021 12:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9022D6EB04;
 Thu, 24 Jun 2021 12:22:27 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 15A321FD40;
 Thu, 24 Jun 2021 12:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624537346; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uVCWXfGwsMtvlgoDJgd345cXDffbTOcIc9HGIvruMJg=;
 b=NigQFtVaHBGSLM7mNe03/ErRVL2UkhO1d3acZJIlzf7TDanAj62O87F1EEo+9g5+dFAxCg
 c61qhYkdEEi7TN0GsdJ/0BRKo7HWMR9zGtk8cPwpLOE4AByxVxj4EqMmUCAEqZJ716cIQJ
 VO9tRmOZ5Lsf57tBtbWT15qy1yU+BVk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624537346;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uVCWXfGwsMtvlgoDJgd345cXDffbTOcIc9HGIvruMJg=;
 b=OXF1XqpmzE6d6OwiGBANMFRvbWGkbScwLQT7HdrHLU4irMrpqgqvwaVuAyZGAdfLzDlzVU
 TucPJzip+SynQyBQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id E019311A97;
 Thu, 24 Jun 2021 12:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624537346; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uVCWXfGwsMtvlgoDJgd345cXDffbTOcIc9HGIvruMJg=;
 b=NigQFtVaHBGSLM7mNe03/ErRVL2UkhO1d3acZJIlzf7TDanAj62O87F1EEo+9g5+dFAxCg
 c61qhYkdEEi7TN0GsdJ/0BRKo7HWMR9zGtk8cPwpLOE4AByxVxj4EqMmUCAEqZJ716cIQJ
 VO9tRmOZ5Lsf57tBtbWT15qy1yU+BVk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624537346;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uVCWXfGwsMtvlgoDJgd345cXDffbTOcIc9HGIvruMJg=;
 b=OXF1XqpmzE6d6OwiGBANMFRvbWGkbScwLQT7HdrHLU4irMrpqgqvwaVuAyZGAdfLzDlzVU
 TucPJzip+SynQyBQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id rUrHNQF51GAgOQAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Thu, 24 Jun 2021 12:22:25 +0000
To: Lucas Stach <l.stach@pengutronix.de>, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, airlied@linux.ie, daniel@ffwll.ch
References: <20210624085800.7941-1-tzimmermann@suse.de>
 <657956dded241192bbd9ca59f6e9d58a9283f972.camel@pengutronix.de>
 <ddae9158-0aa7-f861-2c61-5d8f8d28fb62@suse.de>
 <d31b8b5237695d9bea3ad52b9be410249d12d652.camel@pengutronix.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/etnaviv: Implement mmap as GEM object function
Message-ID: <42715b01-9944-ef8e-b41a-895d60a7ba09@suse.de>
Date: Thu, 24 Jun 2021 14:22:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d31b8b5237695d9bea3ad52b9be410249d12d652.camel@pengutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="panByKjY2sm1QniZUy1QocR3mq6l2mDVG"
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
--panByKjY2sm1QniZUy1QocR3mq6l2mDVG
Content-Type: multipart/mixed; boundary="vcLI4jpqVyhEiFTPNeytzWxxCHymvk5Ei";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Lucas Stach <l.stach@pengutronix.de>, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, airlied@linux.ie, daniel@ffwll.ch
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <42715b01-9944-ef8e-b41a-895d60a7ba09@suse.de>
Subject: Re: [PATCH] drm/etnaviv: Implement mmap as GEM object function
References: <20210624085800.7941-1-tzimmermann@suse.de>
 <657956dded241192bbd9ca59f6e9d58a9283f972.camel@pengutronix.de>
 <ddae9158-0aa7-f861-2c61-5d8f8d28fb62@suse.de>
 <d31b8b5237695d9bea3ad52b9be410249d12d652.camel@pengutronix.de>
In-Reply-To: <d31b8b5237695d9bea3ad52b9be410249d12d652.camel@pengutronix.de>

--vcLI4jpqVyhEiFTPNeytzWxxCHymvk5Ei
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 24.06.21 um 12:50 schrieb Lucas Stach:
> Am Donnerstag, dem 24.06.2021 um 12:47 +0200 schrieb Thomas Zimmermann:=

>> Hi
>>
>> Am 24.06.21 um 11:11 schrieb Lucas Stach:
>>> Am Donnerstag, dem 24.06.2021 um 10:58 +0200 schrieb Thomas Zimmerman=
n:
>>>> Moving the driver-specific mmap code into a GEM object function allo=
ws
>>>> for using DRM helpers for various mmap callbacks.
>>>>
>>>> The respective etnaviv functions are being removed. The file_operati=
ons
>>>> structure fops is now being created by the helper macro
>>>> DEFINE_DRM_GEM_FOPS().
>>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> ---
>>>>    drivers/gpu/drm/etnaviv/etnaviv_drv.c       | 14 ++------------
>>>>    drivers/gpu/drm/etnaviv/etnaviv_drv.h       |  3 ---
>>>>    drivers/gpu/drm/etnaviv/etnaviv_gem.c       | 18 +++++-----------=
--
>>>>    drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 13 -------------
>>>>    4 files changed, 7 insertions(+), 41 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm=
/etnaviv/etnaviv_drv.c
>>>> index f0a07278ad04..7dcc6392792d 100644
>>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>>>> @@ -468,17 +468,7 @@ static const struct drm_ioctl_desc etnaviv_ioct=
ls[] =3D {
>>>>    	ETNA_IOCTL(PM_QUERY_SIG, pm_query_sig, DRM_RENDER_ALLOW),
>>>>    };
>>>>   =20
>>>> -static const struct file_operations fops =3D {
>>>> -	.owner              =3D THIS_MODULE,
>>>> -	.open               =3D drm_open,
>>>> -	.release            =3D drm_release,
>>>> -	.unlocked_ioctl     =3D drm_ioctl,
>>>> -	.compat_ioctl       =3D drm_compat_ioctl,
>>>> -	.poll               =3D drm_poll,
>>>> -	.read               =3D drm_read,
>>>> -	.llseek             =3D no_llseek,
>>>> -	.mmap               =3D etnaviv_gem_mmap,
>>>> -};
>>>> +DEFINE_DRM_GEM_FOPS(fops);
>>>>   =20
>>>>    static const struct drm_driver etnaviv_drm_driver =3D {
>>>>    	.driver_features    =3D DRIVER_GEM | DRIVER_RENDER,
>>>> @@ -487,7 +477,7 @@ static const struct drm_driver etnaviv_drm_drive=
r =3D {
>>>>    	.prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
>>>>    	.prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
>>>>    	.gem_prime_import_sg_table =3D etnaviv_gem_prime_import_sg_table=
,
>>>> -	.gem_prime_mmap     =3D etnaviv_gem_prime_mmap,
>>>> +	.gem_prime_mmap     =3D drm_gem_prime_mmap,
>>>>    #ifdef CONFIG_DEBUG_FS
>>>>    	.debugfs_init       =3D etnaviv_debugfs_init,
>>>>    #endif
>>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm=
/etnaviv/etnaviv_drv.h
>>>> index 003288ebd896..049ae87de9be 100644
>>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
>>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
>>>> @@ -47,12 +47,9 @@ struct etnaviv_drm_private {
>>>>    int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
>>>>    		struct drm_file *file);
>>>>   =20
>>>> -int etnaviv_gem_mmap(struct file *filp, struct vm_area_struct *vma)=
;
>>>>    int etnaviv_gem_mmap_offset(struct drm_gem_object *obj, u64 *offs=
et);
>>>>    struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_ob=
ject *obj);
>>>>    int etnaviv_gem_prime_vmap(struct drm_gem_object *obj, struct dma=
_buf_map *map);
>>>> -int etnaviv_gem_prime_mmap(struct drm_gem_object *obj,
>>>> -			   struct vm_area_struct *vma);
>>>>    struct drm_gem_object *etnaviv_gem_prime_import_sg_table(struct d=
rm_device *dev,
>>>>    	struct dma_buf_attachment *attach, struct sg_table *sg);
>>>>    int etnaviv_gem_prime_pin(struct drm_gem_object *obj);
>>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm=
/etnaviv/etnaviv_gem.c
>>>> index b8fa6ed3dd73..8f1b5af47dd6 100644
>>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
>>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
>>>> @@ -130,8 +130,7 @@ static int etnaviv_gem_mmap_obj(struct etnaviv_g=
em_object *etnaviv_obj,
>>>>    {
>>>>    	pgprot_t vm_page_prot;
>>>>   =20
>>>> -	vma->vm_flags &=3D ~VM_PFNMAP;
>>>> -	vma->vm_flags |=3D VM_MIXEDMAP;
>>>> +	vma->vm_flags |=3D VM_IO | VM_MIXEDMAP | VM_DONTEXPAND | VM_DONTDU=
MP;
>>>
>>> I don't fully understand why this change is needed and the commit log=

>>> is silent about it. Excuse my ignorance, but can you please explain t=
he
>>> reasoning behind this change?
>>
>> Sure, sorry for being brief.
>>
>> I worked on cleaning up the deprecated gem_prime_* callbacks in struct=

>> drm_driver. These are supposed to be GEM object functions. The only
>> obsolete gem prime callback in drm_driver is gem_prime_mmap.
>=20
> Sorry, that's a misunderstanding. I see the justification for the patch=

> as a whole. I was asking specifically about the hunk above my comment.
> Why are the vm_flags changed and how did you come up with this exact
> combination of flags?

I took the existing implementation and looked through it for the current =

combination of flags.

Etnaviv calls etnaviv_gem_prime_mmap(), which in turn calls=20
drm_gem_mmap_obj(). [1] Because etnaviv doesn't have a gem object mmap=20
callback, drm_gem_mmap_obj() sets some default flags. [2] VM_PFNMAP=20
later gets cleared by the current code, so I left it out. And that's=20
where these flags come from.

I should add that I don't have the HW to test this change. If you can,=20
maybe give it a try.

Best regards
Thomas

[1]=20
https://elixir.bootlin.com/linux/v5.12/source/drivers/gpu/drm/etnaviv/etn=
aviv_gem_prime.c#L43

[2]=20
https://elixir.bootlin.com/linux/v5.12/source/drivers/gpu/drm/drm_gem.c#L=
1084

>=20
> Regards,
> Lucas
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--vcLI4jpqVyhEiFTPNeytzWxxCHymvk5Ei--

--panByKjY2sm1QniZUy1QocR3mq6l2mDVG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDUeQEFAwAAAAAACgkQlh/E3EQov+CD
EA//dJ0odBeFVO41WD4hmu12Hb92X+anh0/5eRZfczN/RLsBM8HuhFs9zht4bf8OcuvMdJGVtPvO
YChBbjo4wkwHnBGi4AMfaQrtOpL03shIgDdTZaQiuWr+15cba5NzDoAojZC3d1G4R8vAjVsXlF31
EAJqM6GitJwpJ+FkWkAqbsKHhQUeIYQV2j6nuBBN764He8rardpjVvqYidYkwSdYCYhPBDUO5rcH
fgDSHxUO8F3a3umrIAgZPO90D8v0QNgGkLnwrUzQ88G+L4aJVYOAV+Hq7wJLx11vIXlEWiFtp5Df
In/LoOOd9n1AF1lctSAhdGGjAATmqpC1e20cZ1w82I2HmgtpjBvZRp3NrUxwmnLi6CtCY9Cikzpg
V8UERKM/jKmCrDmZnmVSeT2BVBW345URDEGY1SjSNyuo/Wa+CwayDtDevngyWoNeYRlFEY0bGzoC
Ag9m2pJrPkQ+Mia+lmVZ/jsLTnoy5empMbHVDGoBPTyX5QP4SnM52qJ/o/+fTUIAlH0qGXBPHxwy
TFXnQ0KkPeYeiTOgwjqDuFt2YDntaNZagrHMROPDEuPwlFqiWM5+WBGi8qVshNYUn5Q9RobOmqPi
AtqaKNmUD2S7U3dv/CjYc11xsPtBaTLgrhnyERatGf6NvMvuxQ95J1jLjma0I5P1abYEukQ5hMVf
rxg=
=yWUc
-----END PGP SIGNATURE-----

--panByKjY2sm1QniZUy1QocR3mq6l2mDVG--
