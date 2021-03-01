Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A41C327926
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 09:27:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 005566E4F8;
	Mon,  1 Mar 2021 08:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A64F6E4F8
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 08:27:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EE1CEAF57;
 Mon,  1 Mar 2021 08:26:58 +0000 (UTC)
To: Tong Zhang <ztong0001@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20210228044625.171151-1-ztong0001@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/fb-helper: only unmap if buffer not null
Message-ID: <da187130-8a73-8490-4c70-aed3055081bf@suse.de>
Date: Mon, 1 Mar 2021 09:26:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210228044625.171151-1-ztong0001@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1956316864=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1956316864==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="2gaxzLuaBxKNi8jonaw1h25DxRkGPJur0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2gaxzLuaBxKNi8jonaw1h25DxRkGPJur0
Content-Type: multipart/mixed; boundary="vk3q8Gd4T06b8hmS6a4wlgtSjvS4R02LM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tong Zhang <ztong0001@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <da187130-8a73-8490-4c70-aed3055081bf@suse.de>
Subject: Re: [PATCH] drm/fb-helper: only unmap if buffer not null
References: <20210228044625.171151-1-ztong0001@gmail.com>
In-Reply-To: <20210228044625.171151-1-ztong0001@gmail.com>

--vk3q8Gd4T06b8hmS6a4wlgtSjvS4R02LM
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 28.02.21 um 05:46 schrieb Tong Zhang:
> drm_fbdev_cleanup() can be called when fb_helper->buffer is null, hence=

> fb_helper->buffer should be checked before calling
> drm_client_buffer_vunmap(). This buffer is also checked in
> drm_client_framebuffer_delete(), so we should also do the same thing fo=
r
> drm_client_buffer_vunmap().

I think a lot of drivers are affected by this problem; probably most of=20
the ones that use the generic fbdev code. How did you produce the error?

What I'm more concerned about is why the buffer is NULL. Was ther eno=20
hotplug event? Do you have a display attached?

Best regards
Thomas


>=20
> [  199.128742] RIP: 0010:drm_client_buffer_vunmap+0xd/0x20
> [  199.129031] Code: 43 18 48 8b 53 20 49 89 45 00 49 89 55 08 5b 44 89=
 e0 41 5c 41 5d 41 5e 5d
> c3 0f 1f 00 53 48 89 fb 48 8d 7f 10 e8 73 7d a1 ff <48> 8b 7b 10 48 8d =
73 18 5b e9 75 53 fc ff 0
> f 1f 44 00 00 48 b8 00
> [  199.130041] RSP: 0018:ffff888103f3fc88 EFLAGS: 00010282
> [  199.130329] RAX: 0000000000000001 RBX: 0000000000000000 RCX: fffffff=
f8214d46d
> [  199.130733] RDX: 1ffffffff079c6b9 RSI: 0000000000000246 RDI: fffffff=
f83ce35c8
> [  199.131119] RBP: ffff888103d25458 R08: 0000000000000001 R09: fffffbf=
ff0791761
> [  199.131505] R10: ffffffff83c8bb07 R11: fffffbfff0791760 R12: 0000000=
000000000
> [  199.131891] R13: ffff888103d25468 R14: ffff888103d25418 R15: ffff888=
103f18120
> [  199.132277] FS:  00007f36fdcbb6a0(0000) GS:ffff88815b400000(0000) kn=
lGS:0000000000000000
> [  199.132721] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  199.133033] CR2: 0000000000000010 CR3: 0000000103d26000 CR4: 0000000=
0000006f0
> [  199.133420] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000=
000000000
> [  199.133807] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000=
000000400
> [  199.134195] Call Trace:
> [  199.134333]  drm_fbdev_cleanup+0x179/0x1a0
> [  199.134562]  drm_fbdev_client_unregister+0x2b/0x40
> [  199.134828]  drm_client_dev_unregister+0xa8/0x180
> [  199.135088]  drm_dev_unregister+0x61/0x110
> [  199.135315]  mgag200_pci_remove+0x38/0x52 [mgag200]
> [  199.135586]  pci_device_remove+0x62/0xe0
> [  199.135806]  device_release_driver_internal+0x148/0x270
> [  199.136094]  driver_detach+0x76/0xe0
> [  199.136294]  bus_remove_driver+0x7e/0x100
> [  199.136521]  pci_unregister_driver+0x28/0xf0
> [  199.136759]  __x64_sys_delete_module+0x268/0x300
> [  199.137016]  ? __ia32_sys_delete_module+0x300/0x300
> [  199.137285]  ? call_rcu+0x3e4/0x580
> [  199.137481]  ? fpregs_assert_state_consistent+0x4d/0x60
> [  199.137767]  ? exit_to_user_mode_prepare+0x2f/0x130
> [  199.138037]  do_syscall_64+0x33/0x40
> [  199.138237]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [  199.138517] RIP: 0033:0x7f36fdc3dcf7
>=20
> Signed-off-by: Tong Zhang <ztong0001@gmail.com>
> ---
>   drivers/gpu/drm/drm_fb_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_h=
elper.c
> index b9a616737c0e..f6baa2046124 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -2048,7 +2048,7 @@ static void drm_fbdev_cleanup(struct drm_fb_helpe=
r *fb_helper)
>  =20
>   	if (shadow)
>   		vfree(shadow);
> -	else
> +	else if (fb_helper->buffer)
>   		drm_client_buffer_vunmap(fb_helper->buffer);
>  =20
>   	drm_client_framebuffer_delete(fb_helper->buffer);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--vk3q8Gd4T06b8hmS6a4wlgtSjvS4R02LM--

--2gaxzLuaBxKNi8jonaw1h25DxRkGPJur0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmA8pVEFAwAAAAAACgkQlh/E3EQov+Bf
yA//bWkzWWVyyv4cxfhtRfNrC7GZd+DrKRIfSEB4ejyKzkn6PilvtdIQ92ZiI03jqbut/tYXXX3k
Zy1YB/TQOsfZaCdG63IpN5HfCameZihKx0JyatfVTqjXnn8Z0iUsVu+zWl9mwC3ZGR+6AwBeJ2hT
bgePBOMki+B45TwvAqdxmHkJbNe5edF929FBUpxguy1P6ZA7qJi3o1xJBZhKopsUsXO0oAPdS7/v
6VdcG5m1k3O632mo481QL9k0wmD+xK6/tQDg3jT4ZpSa2J9ZcEkt38tr4IBEVfw0r5cLloPRYFh2
CmLdQoUKypYqrjG1VTDVIlNagTeUW3x8Fn67KNedLU7Gl35lc8gl+Blu61bNEIIRPm7kjudk6PqW
j7x2BZHiXeEFKtFqcUWPxCx1xz7LO+Q81w0vnsVimYTymg/Ffu4PubB4Ah/vfiKmG2sGeNDsQ/Tb
rjjCcpQjXl/2Hou4c1NkORTU0vXr4n5gS20WebtQiNwxza4s0VYAiNAUv+YXkPelliOkk/JDNqSP
DVcauz8eG4jHtWTyE1ynIgXx6FuE0TKyog3PDsiMhTdfyUAERboeIpdkts/QrpfkQuIeCBKCow+8
omWbqYTm6SFBnHd1X5meAoNe65Ixe6BALbAIfoqLV8m2hIigmyHQ+RHEsV7hio1VGlUovpfuXRXE
Szs=
=ie+l
-----END PGP SIGNATURE-----

--2gaxzLuaBxKNi8jonaw1h25DxRkGPJur0--

--===============1956316864==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1956316864==--
