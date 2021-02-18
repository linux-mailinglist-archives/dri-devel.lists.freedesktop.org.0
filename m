Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BB431EB2C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 15:56:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3596EA22;
	Thu, 18 Feb 2021 14:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E936EA22
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 14:56:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 842D8ACD4;
 Thu, 18 Feb 2021 14:56:01 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: hch@lst.de, Greg KH <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@redhat.com>
Subject: Regression: 6eb0233ec2d0 ("usb: don't inherity DMA properties for USB
 devices")
Message-ID: <ef15869a-fe87-aef2-591d-2ca909a66217@suse.de>
Date: Thu, 18 Feb 2021 15:56:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
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
Cc: USB list <linux-usb@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1644788859=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1644788859==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="z0zI6XyKrL56cYHmy2nySYSMFBVmYPEGN"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--z0zI6XyKrL56cYHmy2nySYSMFBVmYPEGN
Content-Type: multipart/mixed; boundary="kOt9AnaWVJM2mIE9yHK0juKP0vqfWusYN";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: hch@lst.de, Greg KH <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@redhat.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 USB list <linux-usb@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Message-ID: <ef15869a-fe87-aef2-591d-2ca909a66217@suse.de>
Subject: Regression: 6eb0233ec2d0 ("usb: don't inherity DMA properties for USB
 devices")

--kOt9AnaWVJM2mIE9yHK0juKP0vqfWusYN
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

commit 6eb0233ec2d0 ("usb: don't inherity DMA properties for USB=20
devices") creates a regression with the udl driver. udl is a DRM driver=20
for USB-based DisplayLink adapters.

It's no long possible to join/mirror displays in X. STR and an error log =

is shown below.

STR:
	* use internal GFX card (radeon, i915)
	* attach udl adapter
	* start Gnome/x11 via startx
	* try to configure joined/mirrored screens

Expected Result:
	* both adapters show the Gnome desktop

Actual result:
	* the udl-driven display remains dark
	* error in the dmesg log

I only have udl devices, but I expect that other DRM USB adapters are=20
also affected.

How to fix this?

Best regards
Thomas


[   60.050199] ------------[ cut here ]------------
[   60.055092] WARNING: CPU: 0 PID: 1403 at kernel/dma/mapping.c:190=20
dma_map_sg_attrs+0x8f/0xc0
[   60.064331] Modules linked in: af_packet(E) rfkill(E) dmi_sysfs(E)=20
intel_rapl_msr(E) intel_rapl_common(E) snd_hda_codec_realtek(E)=20
snd_hda_codec_generic(E) ledtrig_audio(E) snd_hda_codec_hdmi(E)=20
x86_pkg_temp_thermal(E) intel_powerclam)
[   60.064801]  wmi(E) video(E) btrfs(E) blake2b_generic(E) libcrc32c(E) =

crc32c_intel(E) xor(E) raid6_pq(E) sg(E) dm_multipath(E) dm_mod(E)=20
scsi_dh_rdac(E) scsi_dh_emc(E) scsi_dh_alua(E) msr(E) efivarfs(E)
[   60.170778] CPU: 0 PID: 1403 Comm: Xorg.bin Tainted: G            E=20
    5.11.0-rc5-1-default+ #747
[   60.179841] Hardware name: Dell Inc. OptiPlex 9020/0N4YC8, BIOS A24=20
10/24/2018
[   60.187145] RIP: 0010:dma_map_sg_attrs+0x8f/0xc0
[   60.191822] Code: 4d 85 ff 75 2b 49 89 d8 44 89 e1 44 89 f2 4c 89 ee=20
48 89 ef e8 62 30 00 00 85 c0 78 36 5b 5d 41 5c 41 5d 41 5e 41 5f c3 0f=20
0b <0f> 0b 31 c0 eb ed 49 8d 7f 50 e8 72 f5 2a 00 49 8b 47 50 49 89 d8
[   60.210770] RSP: 0018:ffffc90001d6fc18 EFLAGS: 00010246
[   60.216062] RAX: 0000000000000000 RBX: 0000000000000020 RCX:=20
ffffffffb31e677b
[   60.223274] RDX: dffffc0000000000 RSI: ffff888212c10600 RDI:=20
ffff8881b08a9488
[   60.230501] RBP: ffff8881b08a9030 R08: 0000000000000020 R09:=20
ffff888212c10600
[   60.237710] R10: ffffed10425820df R11: 0000000000000001 R12:=20
0000000000000000
[   60.244939] R13: ffff888212c10600 R14: 0000000000000008 R15:=20
0000000000000000
[   60.252155] FS:  00007f08ac2b2f00(0000) GS:ffff8887cbe00000(0000)=20
knlGS:0000000000000000
[   60.260333] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   60.266150] CR2: 000055831c899be8 CR3: 000000015372e006 CR4:=20
00000000001706f0
[   60.273369] Call Trace:
[   60.275845]  drm_gem_map_dma_buf+0xb4/0x120
[   60.280089]  dma_buf_map_attachment+0x15d/0x1e0
[   60.284688]  drm_gem_prime_import_dev.part.0+0x5d/0x140
[   60.289984]  drm_gem_prime_fd_to_handle+0x213/0x280
[   60.294931]  ? drm_prime_destroy_file_private+0x30/0x30
[   60.300224]  drm_ioctl_kernel+0x131/0x180
[   60.304291]  ? drm_setversion+0x230/0x230
[   60.308366]  ? drm_prime_destroy_file_private+0x30/0x30
[   60.313659]  drm_ioctl+0x2f1/0x500
[   60.317118]  ? drm_version+0x150/0x150
[   60.320903]  ? lock_downgrade+0xa0/0xa0
[   60.324806]  ? do_vfs_ioctl+0x5f4/0x680
[   60.328694]  ? __fget_files+0x13e/0x210
[   60.332591]  ? ioctl_fiemap.isra.0+0x1a0/0x1a0
[   60.337102]  ? __fget_files+0x15d/0x210
[   60.340990]  __x64_sys_ioctl+0xb9/0xf0
[   60.344795]  do_syscall_64+0x33/0x80
[   60.348427]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   60.353542] RIP: 0033:0x7f08ac7b53cb
[   60.357168] Code: 89 d8 49 8d 3c 1c 48 f7 d8 49 39 c4 72 b5 e8 1c ff=20
ff ff 85 c0 78 ba 4c 89 e0 5b 5d 41 5c c3 f3 0f 1e fa b8 10 00 00 00 0f=20
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 75 ba 0c 00 f7 d8 64 89 01 48
[   60.376108] RSP: 002b:00007ffeabc89fc8 EFLAGS: 00000246 ORIG_RAX:=20
0000000000000010
[   60.383758] RAX: ffffffffffffffda RBX: 00007ffeabc8a00c RCX:=20
00007f08ac7b53cb
[   60.390970] RDX: 00007ffeabc8a00c RSI: 00000000c00c642e RDI:=20
000000000000000d
[   60.398221] RBP: 00000000c00c642e R08: 000055831c691d00 R09:=20
000055831b2ec010
[   60.405446] R10: 00007f08acf6ada0 R11: 0000000000000246 R12:=20
000055831c691d00
[   60.412667] R13: 000000000000000d R14: 00000000007e9000 R15:=20
0000000000000000
[   60.419903] irq event stamp: 672893
[   60.423441] hardirqs last  enabled at (672913): [<ffffffffb31b796d>]=20
console_unlock+0x44d/0x500
[   60.432230] hardirqs last disabled at (672922): [<ffffffffb31b7963>]=20
console_unlock+0x443/0x500
[   60.441021] softirqs last  enabled at (672940): [<ffffffffb46003dd>]=20
__do_softirq+0x3dd/0x554
[   60.449634] softirqs last disabled at (672931): [<ffffffffb44010f2>]=20
asm_call_irq_on_stack+0x12/0x20
[   60.458871] ---[ end trace f2f88696eb17806c ]---



--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--kOt9AnaWVJM2mIE9yHK0juKP0vqfWusYN--

--z0zI6XyKrL56cYHmy2nySYSMFBVmYPEGN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAugAAFAwAAAAAACgkQlh/E3EQov+DR
wxAAgef+MFiga9P/j93gZAWVVbG75IYLTULykeRlwk50Tv+ovDtxQSgDN/19u+kbYFPHk6kfEFCM
dYAZ3IjAxpULrejO7N3krCVjAVhXZKOmHZsLbflBe4G+TgcLiTETYUok0fZ2ZM6/0l+M+wlkGUBN
E7WO7GnTrjcDq60rkLOhYfrEKevmL20cqcmVXWRKvSkyHQRNrufkm0H5JegK5Mx/yC67hqfswWnx
uESozkkXMjEgTnRkqtJzcJlGSaBe8/N+dh9hXB0Oh+N+xcIaWVzLGTCGXP9PGoiz/+5H/99pRmct
TpRClppU9UDGiAopA1VMUqmoJuBFg1rmsbmzeH6tdPATOYtoHsNZqWRUKsGRFHvfYln3AumKMXUU
w0M4FowBtkQQO1vtWN753j78Xjox6uDXlN6DY647UVd+iBpcVZ+LrXHxboPjvX5h1feYq0F6HHB6
YWUsx/zRM8ThTtJcr3BDtpUTWTe85dw5JMuxHs3g4ocoklW+PlHISgT2peBpN8oY3DwCoINU7eDg
06T8L/AWmu6DddRv6Uin9d8yi4siSmFuvO4UvxgWj1bAbJdtAijMUxkvNgMxQo6qq+nghuuhCZhU
EiYPK0gjHqyuxAVWaqkSmi2qPndIC2cAzgv1fYv0zkYTfeIHTT4hpj51pnwhf6qycLgcIuNLiqZa
Hnc=
=eEAm
-----END PGP SIGNATURE-----

--z0zI6XyKrL56cYHmy2nySYSMFBVmYPEGN--

--===============1644788859==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1644788859==--
