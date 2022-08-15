Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2391B593112
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 16:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26684C50FC;
	Mon, 15 Aug 2022 14:55:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7676B9D4A;
 Mon, 15 Aug 2022 14:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RrH4eWU03e065wwHvvpiAmOHxfpRqSBh3MQbyr57ReI=; b=WAvG11EmjzW4oK+0A7ZPf9a1j0
 iYi3AcXBSLN/BrHJht0qSlZ3bvqLKEmslbPvZIm0O9+LdIPjWkR4ZZpQa9y36Wi76cnNlQ11l1xGv
 EQbdJyepYSkBfLyyTbAqmx1jAZuf5aarq9Fiq7udqArovs6iMeJv9Z2zo1lNF6iMr0L3AhtvGU3eW
 46iD4R65elSiiw/CJXfJwm0dtrhHVfUGXtMnlU9GUKCzobdHvTb6FLr8zjGokEeP9prkWMRr8a3mE
 Dhca5XZ7BUz7gr7vE2HA2lYrupflI6iRh0gY4RNzO5/86tq3k5M7LguZtufLAbwEcyDCrbmmk0H1H
 E9VKTgqQ==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oNbUW-009U0o-9L; Mon, 15 Aug 2022 16:54:56 +0200
Date: Mon, 15 Aug 2022 13:54:41 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>
Subject: Re: [PATCH] drm/amdgpu: Fix use-after-free on amdgpu_bo_list mutex
Message-ID: <20220815145441.scqsi4udv2t7z57k@mail.igalia.com>
References: <20220815113931.53226-1-mairacanal@riseup.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="giisndjw5d6njnaf"
Content-Disposition: inline
In-Reply-To: <20220815113931.53226-1-mairacanal@riseup.net>
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
Cc: David Airlie <airlied@linux.ie>, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--giisndjw5d6njnaf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 08/15, Ma=EDra Canal wrote:
> If amdgpu_cs_vm_handling returns r !=3D 0, then it will unlock the
> bo_list_mutex inside the function amdgpu_cs_vm_handling and again on
> amdgpu_cs_parser_fini. This problem results in the following
> use-after-free problem:
>=20
> [ 220.280990] ------------[ cut here ]------------
> [ 220.281000] refcount_t: underflow; use-after-free.
> [ 220.281019] WARNING: CPU: 1 PID: 3746 at lib/refcount.c:28 refcount_war=
n_saturate+0xba/0x110
> [ 220.281029] ------------[ cut here ]------------
> [ 220.281415] CPU: 1 PID: 3746 Comm: chrome:cs0 Tainted: G W L ------- --=
- 5.20.0-0.rc0.20220812git7ebfc85e2cd7.10.fc38.x86_64 #1
> [ 220.281421] Hardware name: System manufacturer System Product Name/ROG =
STRIX X570-I GAMING, BIOS 4403 04/27/2022
> [ 220.281426] RIP: 0010:refcount_warn_saturate+0xba/0x110
> [ 220.281431] Code: 01 01 e8 79 4a 6f 00 0f 0b e9 42 47 a5 00 80 3d de
> 7e be 01 00 75 85 48 c7 c7 f8 98 8e 98 c6 05 ce 7e be 01 01 e8 56 4a
> 6f 00 <0f> 0b e9 1f 47 a5 00 80 3d b9 7e be 01 00 0f 85 5e ff ff ff 48
> c7
> [ 220.281437] RSP: 0018:ffffb4b0d18d7a80 EFLAGS: 00010282
> [ 220.281443] RAX: 0000000000000026 RBX: 0000000000000003 RCX: 0000000000=
000000
> [ 220.281448] RDX: 0000000000000001 RSI: ffffffff988d06dc RDI: 00000000ff=
ffffff
> [ 220.281452] RBP: 00000000ffffffff R08: 0000000000000000 R09: ffffb4b0d1=
8d7930
> [ 220.281457] R10: 0000000000000003 R11: ffffa0672e2fffe8 R12: ffffa058ca=
360400
> [ 220.281461] R13: ffffa05846c50a18 R14: 00000000fffffe00 R15: 0000000000=
000003
> [ 220.281465] FS: 00007f82683e06c0(0000) GS:ffffa066e2e00000(0000) knlGS:=
0000000000000000
> [ 220.281470] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 220.281475] CR2: 00003590005cc000 CR3: 00000001fca46000 CR4: 0000000000=
350ee0
> [ 220.281480] Call Trace:
> [ 220.281485] <TASK>
> [ 220.281490] amdgpu_cs_ioctl+0x4e2/0x2070 [amdgpu]
> [ 220.281806] ? amdgpu_cs_find_mapping+0xe0/0xe0 [amdgpu]
> [ 220.282028] drm_ioctl_kernel+0xa4/0x150
> [ 220.282043] drm_ioctl+0x21f/0x420
> [ 220.282053] ? amdgpu_cs_find_mapping+0xe0/0xe0 [amdgpu]
> [ 220.282275] ? lock_release+0x14f/0x460
> [ 220.282282] ? _raw_spin_unlock_irqrestore+0x30/0x60
> [ 220.282290] ? _raw_spin_unlock_irqrestore+0x30/0x60
> [ 220.282297] ? lockdep_hardirqs_on+0x7d/0x100
> [ 220.282305] ? _raw_spin_unlock_irqrestore+0x40/0x60
> [ 220.282317] amdgpu_drm_ioctl+0x4a/0x80 [amdgpu]
> [ 220.282534] __x64_sys_ioctl+0x90/0xd0
> [ 220.282545] do_syscall_64+0x5b/0x80
> [ 220.282551] ? futex_wake+0x6c/0x150
> [ 220.282568] ? lock_is_held_type+0xe8/0x140
> [ 220.282580] ? do_syscall_64+0x67/0x80
> [ 220.282585] ? lockdep_hardirqs_on+0x7d/0x100
> [ 220.282592] ? do_syscall_64+0x67/0x80
> [ 220.282597] ? do_syscall_64+0x67/0x80
> [ 220.282602] ? lockdep_hardirqs_on+0x7d/0x100
> [ 220.282609] entry_SYSCALL_64_after_hwframe+0x63/0xcd
> [ 220.282616] RIP: 0033:0x7f8282a4f8bf
> [ 220.282639] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10
> 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00
> 0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00
> 00
> [ 220.282644] RSP: 002b:00007f82683df410 EFLAGS: 00000246 ORIG_RAX: 00000=
00000000010
> [ 220.282651] RAX: ffffffffffffffda RBX: 00007f82683df588 RCX: 00007f8282=
a4f8bf
> [ 220.282655] RDX: 00007f82683df4d0 RSI: 00000000c0186444 RDI: 0000000000=
000018
> [ 220.282659] RBP: 00007f82683df4d0 R08: 00007f82683df5e0 R09: 00007f8268=
3df4b0
> [ 220.282663] R10: 00001d04000a0600 R11: 0000000000000246 R12: 00000000c0=
186444
> [ 220.282667] R13: 0000000000000018 R14: 00007f82683df588 R15: 0000000000=
000003
> [ 220.282689] </TASK>
> [ 220.282693] irq event stamp: 6232311
> [ 220.282697] hardirqs last enabled at (6232319): [<ffffffff9718cd7e>] __=
up_console_sem+0x5e/0x70
> [ 220.282704] hardirqs last disabled at (6232326): [<ffffffff9718cd63>] _=
_up_console_sem+0x43/0x70
> [ 220.282709] softirqs last enabled at (6232072): [<ffffffff970ff669>] __=
irq_exit_rcu+0xf9/0x170
> [ 220.282716] softirqs last disabled at (6232061): [<ffffffff970ff669>] _=
_irq_exit_rcu+0xf9/0x170
> [ 220.282722] ---[ end trace 0000000000000000 ]---
>=20
> Therefore, remove the mutex_unlock from the amdgpu_cs_vm_handling
> function, so that amdgpu_cs_submit and amdgpu_cs_parser_fini can handle
> the unlock.
>=20
> Fixes: 90af0ca047f3 ("drm/amdgpu: Protect the amdgpu_bo_list list with a =
mutex v2")
> Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> Signed-off-by: Ma=EDra Canal <mairacanal@riseup.net>
> ---
> Thanks Melissa and Christian for the feedback on mutex_unlock.
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_cs.c
> index d8f1335bc68f..b7bae833c804 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -837,16 +837,12 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_p=
arser *p)
>  			continue;
> =20
>  		r =3D amdgpu_vm_bo_update(adev, bo_va, false);
> -		if (r) {
> -			mutex_unlock(&p->bo_list->bo_list_mutex);
> +		if (r)
>  			return r;
> -		}
> =20
>  		r =3D amdgpu_sync_fence(&p->job->sync, bo_va->last_pt_update);
> -		if (r) {
> -			mutex_unlock(&p->bo_list->bo_list_mutex);
> +		if (r)
>  			return r;
> -		}
Nice catch, Ma=EDra!

Reviewed-by: Melissa Wen <mwen@igalia.com>

>  	}
> =20
>  	r =3D amdgpu_vm_handle_moved(adev, vm);
> --=20
> 2.37.2
>=20

--giisndjw5d6njnaf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmL6XisACgkQwqF3j0dL
ehwNyhAAl08bFtnkOEzrR9xOQOi+okthKLBgO6CRI1YDHyByBJlJ+lr+XCTvRpWU
V2uU9l+qt3IuZ2vdm+INU3x5+ftcbxuZPawSU1Dv0bMbvtfBsee9V/vh+HRW0fDi
8tkBLBrQv/J2HdZAN5CXB+or/M7Mjil0J0//RA16vxzLHyVc28wRGtTO4ntck+Uu
P+2ON9tYzOVsbhTMuILfBH1P/nQzPYhZQK3Aahdex7TGyngYS5FQZ4e2bTGOGWd9
17YL+qkL20CwRGnC1LCLT7/yxA/9KhYmfzAOJ9rs8OS6KS/w5G1BTTfIeg1uJA7N
umT97eBdl4TRhUIxOgcN7n/i6oyoR7aMwUIa0HpeSDK/EKNxZkdNeSr3Mrflo4wN
jGGN1Gw2BDDVNvH5pBe97TrinEMUzjKhaNNt98D68iE2OEBTEP6LHj1fC+oYmjZR
pKegZZEkVTNum4YgSnVfAq53FxwBaUVUazKam/VA37UHlmY1qpwpAMG0SPby1HfB
f4kYtbEW9UQ6ePmu9WDdUVTJjgjuzAdbh4Dy1o1YiudyMpjIb3MCX+90tL6ouihC
M11cfF4R3Bdi9NSDVTZIgM51gZ/BgnrsPVsjbGN4DGc+Hf6kdwIdZcxmfg3+OhXw
V5aKSvbZOFS+kEtKawE+afkwczT4t0s8S+wYy9bBvehLiyJH9AY=
=yLta
-----END PGP SIGNATURE-----

--giisndjw5d6njnaf--
