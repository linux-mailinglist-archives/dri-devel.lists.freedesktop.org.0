Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF6432991E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 11:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2519889359;
	Tue,  2 Mar 2021 10:06:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687BE6E0CA
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 10:06:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0053BABF4;
 Tue,  2 Mar 2021 10:06:02 +0000 (UTC)
Subject: Re: [PATCH] drm/fb-helper: only unmap if buffer not null
To: Tong Zhang <ztong0001@gmail.com>
References: <20210228044625.171151-1-ztong0001@gmail.com>
 <da187130-8a73-8490-4c70-aed3055081bf@suse.de>
 <CAA5qM4BunmAAgq3jf7+=3H_z+RN4EriuJbpmyMOi3JioUOFwbQ@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <fdcf68c4-23f0-880a-a010-1d511f810e7d@suse.de>
Date: Tue, 2 Mar 2021 11:06:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAA5qM4BunmAAgq3jf7+=3H_z+RN4EriuJbpmyMOi3JioUOFwbQ@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0144039697=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0144039697==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="UR6HGHl5SwziLkRa34OA3h2t6nxsXScDF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UR6HGHl5SwziLkRa34OA3h2t6nxsXScDF
Content-Type: multipart/mixed; boundary="q5iyFweml60dc9jnjLlAwm9du02Ui7rOB";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tong Zhang <ztong0001@gmail.com>
Cc: David Airlie <airlied@linux.ie>, open list
 <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Message-ID: <fdcf68c4-23f0-880a-a010-1d511f810e7d@suse.de>
Subject: Re: [PATCH] drm/fb-helper: only unmap if buffer not null
References: <20210228044625.171151-1-ztong0001@gmail.com>
 <da187130-8a73-8490-4c70-aed3055081bf@suse.de>
 <CAA5qM4BunmAAgq3jf7+=3H_z+RN4EriuJbpmyMOi3JioUOFwbQ@mail.gmail.com>
In-Reply-To: <CAA5qM4BunmAAgq3jf7+=3H_z+RN4EriuJbpmyMOi3JioUOFwbQ@mail.gmail.com>

--q5iyFweml60dc9jnjLlAwm9du02Ui7rOB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 02.03.21 um 04:29 schrieb Tong Zhang:
> Hi Tomas,
>=20
> I think the issue could be possibly caused by the following,
> Please correct me if I'm wrong.
>=20
> drm_fb_helper_single_fb_probe() can fail with
> "Cannot find any crtc or sizes"
> which will cause fb_helper->funcs->fb_probe not being called,
> thus fb_helper->buffer remains NULL --
> Since there could be the case that the fb_probe is never called,
> a subsequent modprobe -r will cause the following
> drm_client_buffer_vunmap(NULL) in drm_fbdev_cleanup()

Thanks! I added Fixes tags to your patch and merged it into drm-misc-fixe=
s.

Best regards
Thomas

>=20
> Best,
> - Tong
>=20
> On Mon, Mar 1, 2021 at 3:26 AM Thomas Zimmermann <tzimmermann@suse.de> =
wrote:
>>
>> Hi
>>
>> Am 28.02.21 um 05:46 schrieb Tong Zhang:
>>> drm_fbdev_cleanup() can be called when fb_helper->buffer is null, hen=
ce
>>> fb_helper->buffer should be checked before calling
>>> drm_client_buffer_vunmap(). This buffer is also checked in
>>> drm_client_framebuffer_delete(), so we should also do the same thing =
for
>>> drm_client_buffer_vunmap().
>>
>> I think a lot of drivers are affected by this problem; probably most o=
f
>> the ones that use the generic fbdev code. How did you produce the erro=
r?
>>
>> What I'm more concerned about is why the buffer is NULL. Was ther eno
>> hotplug event? Do you have a display attached?
>>
>> Best regards
>> Thomas
>>
>>
>>>
>>> [  199.128742] RIP: 0010:drm_client_buffer_vunmap+0xd/0x20
>>> [  199.129031] Code: 43 18 48 8b 53 20 49 89 45 00 49 89 55 08 5b 44 =
89 e0 41 5c 41 5d 41 5e 5d
>>> c3 0f 1f 00 53 48 89 fb 48 8d 7f 10 e8 73 7d a1 ff <48> 8b 7b 10 48 8=
d 73 18 5b e9 75 53 fc ff 0
>>> f 1f 44 00 00 48 b8 00
>>> [  199.130041] RSP: 0018:ffff888103f3fc88 EFLAGS: 00010282
>>> [  199.130329] RAX: 0000000000000001 RBX: 0000000000000000 RCX: fffff=
fff8214d46d
>>> [  199.130733] RDX: 1ffffffff079c6b9 RSI: 0000000000000246 RDI: fffff=
fff83ce35c8
>>> [  199.131119] RBP: ffff888103d25458 R08: 0000000000000001 R09: fffff=
bfff0791761
>>> [  199.131505] R10: ffffffff83c8bb07 R11: fffffbfff0791760 R12: 00000=
00000000000
>>> [  199.131891] R13: ffff888103d25468 R14: ffff888103d25418 R15: ffff8=
88103f18120
>>> [  199.132277] FS:  00007f36fdcbb6a0(0000) GS:ffff88815b400000(0000) =
knlGS:0000000000000000
>>> [  199.132721] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [  199.133033] CR2: 0000000000000010 CR3: 0000000103d26000 CR4: 00000=
000000006f0
>>> [  199.133420] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 00000=
00000000000
>>> [  199.133807] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 00000=
00000000400
>>> [  199.134195] Call Trace:
>>> [  199.134333]  drm_fbdev_cleanup+0x179/0x1a0
>>> [  199.134562]  drm_fbdev_client_unregister+0x2b/0x40
>>> [  199.134828]  drm_client_dev_unregister+0xa8/0x180
>>> [  199.135088]  drm_dev_unregister+0x61/0x110
>>> [  199.135315]  mgag200_pci_remove+0x38/0x52 [mgag200]
>>> [  199.135586]  pci_device_remove+0x62/0xe0
>>> [  199.135806]  device_release_driver_internal+0x148/0x270
>>> [  199.136094]  driver_detach+0x76/0xe0
>>> [  199.136294]  bus_remove_driver+0x7e/0x100
>>> [  199.136521]  pci_unregister_driver+0x28/0xf0
>>> [  199.136759]  __x64_sys_delete_module+0x268/0x300
>>> [  199.137016]  ? __ia32_sys_delete_module+0x300/0x300
>>> [  199.137285]  ? call_rcu+0x3e4/0x580
>>> [  199.137481]  ? fpregs_assert_state_consistent+0x4d/0x60
>>> [  199.137767]  ? exit_to_user_mode_prepare+0x2f/0x130
>>> [  199.138037]  do_syscall_64+0x33/0x40
>>> [  199.138237]  entry_SYSCALL_64_after_hwframe+0x44/0xae
>>> [  199.138517] RIP: 0033:0x7f36fdc3dcf7
>>>
>>> Signed-off-by: Tong Zhang <ztong0001@gmail.com>
>>> ---
>>>    drivers/gpu/drm/drm_fb_helper.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb=
_helper.c
>>> index b9a616737c0e..f6baa2046124 100644
>>> --- a/drivers/gpu/drm/drm_fb_helper.c
>>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>>> @@ -2048,7 +2048,7 @@ static void drm_fbdev_cleanup(struct drm_fb_hel=
per *fb_helper)
>>>
>>>        if (shadow)
>>>                vfree(shadow);
>>> -     else
>>> +     else if (fb_helper->buffer)
>>>                drm_client_buffer_vunmap(fb_helper->buffer);
>>>
>>>        drm_client_framebuffer_delete(fb_helper->buffer);
>>>
>>
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> (HRB 36809, AG N=C3=BCrnberg)
>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--q5iyFweml60dc9jnjLlAwm9du02Ui7rOB--

--UR6HGHl5SwziLkRa34OA3h2t6nxsXScDF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmA+DgkFAwAAAAAACgkQlh/E3EQov+DZ
Ng//Wifw9xv8zKgJXA+OQ+Maa07DNde7HZIyARHUtmlWjFPcehf+8XPOHIBQEOSVestA0A1pxg/w
p6BGDyV50LMBvxaHPaff7Gp5gfMbfC14I/vIfKa57lPU3ODKHzvF1Erv0aMOn+AuSxH1LWNpndfb
VVunWWyMz5Xi07p7o/eD5CJPHWZmvEoiTicL4SLgyyY5YgOxLeRtqb9+wQVqDRj+bz96PWdeKhqT
FuDVZ4OLp6qiISz3dMWQlMdKF6ObfpHswfmbfTxNCYgOeSSeLjhErgIH2yuRN0gFpFeniTCwvdfv
L+AqIwuOF8Xiomc1/CS+lX2RouFq7ulWFF+PwCowmL3NWmcWMaRNuTjW4PVeUT/5UzT1sQ7qWG9n
9vEbDxgtKmX7mcEJtpVcAKezKm8BwXwpjc5HmFQahCbcP+Ogsdj9adAMbkB/34PDio1molAeIwBL
BSvXGhOKn6OQYwMV8oSmCyVrQ1wBZDelJFCvGUcqykvzb2jGKjsBKu8cxG1tMaeg0b9IVZ5kVMfx
ZHtvoSYrwCf6hLDvYNFV6p+tZ1vdgMaeYyIXqgWSydRSZAlNh0CieZC7PmBIOV9AHVwvwnMhzIf6
OGEbO3Nuoq++vMba3ewa+IbVFirrmXlpZmZbnsDm6I/JEfWukpJjdXxNYrDFLbS6BvPQEWEMNcPK
O7E=
=yjkf
-----END PGP SIGNATURE-----

--UR6HGHl5SwziLkRa34OA3h2t6nxsXScDF--

--===============0144039697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0144039697==--
