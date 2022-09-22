Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D70CD5E663A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 16:55:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB8810E2E9;
	Thu, 22 Sep 2022 14:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 566C610E2E9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 14:54:52 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1obNbF-0003Jm-RO; Thu, 22 Sep 2022 16:54:49 +0200
Received: from pengutronix.de (unknown
 [IPv6:2a01:4f8:1c1c:29e9:22:41ff:fe00:1400])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id EB648EA55D;
 Thu, 22 Sep 2022 14:54:48 +0000 (UTC)
Date: Thu, 22 Sep 2022 16:54:48 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org
Subject: Raspberry Pi 3 Model B+ hangs in vc4_hdmi_runtime_resume()
Message-ID: <20220922145448.w3xfywkn5ecak2et@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oznmxn6oin25gkca"
Content-Disposition: inline
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--oznmxn6oin25gkca
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I'm on a Raspberry Pi 3 Model B+ running current Debian testing ARM64,
using Debian's v5.19 kernel (Debian's v5.18 was working flawless).

| [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]   =
                                                                           =
                                           =20
| [    0.000000] Linux version 5.19.0-1-arm64 (debian-kernel@lists.debian.o=
rg) (gcc-11 (Debian 11.3.0-5) 11.3.0, GNU ld (GNU Binutils for Debian) 2.38=
=2E90.20220713) #1 SMP Debian 5.19.6-1 (2022-0
9-01)                                                                      =
                                                                           =
                                         =20
| [    0.000000] Machine model: Raspberry Pi 3 Model B+          =20
| [    3.747500] raspberrypi-firmware soc:firmware: Attached to firmware fr=
om 2022-03-24T13:21:11=20

As soon a the vc4 module is loaded the following warnings hits 4
times, then the machine stops.

| [   66.839210] Console: switching to colour dummy device 80x25
| [   66.861282] vc4-drm soc:gpu: bound 3f400000.hvs (ops vc4_hvs_ops [vc4])
| [   66.868418] ------------[ cut here ]------------
| [   66.873110] WARNING: CPU: 3 PID: 611 at drivers/gpu/drm/vc4/vc4_hdmi_r=
egs.h:456 vc4_hdmi_reset+0x3e8/0x540 [vc4]
| [   66.883495] Modules linked in: vc4(+) ccm cpufreq_userspace cpufreq_po=
wersave cpufreq_ondemand cpufreq_conservative nls_ascii nls_cp437 vfat fat =
ext4 mbcache jbd2 hci_uart btqca btrtl btbcm btintel btsdio bluetooth bcm28=
35_v4l2(C) bcm2835_mmal_vchiq(C) jitterentropy_rng
| videobuf2_vmalloc sha512_generic videobuf2_memops rt2800usb snd_soc_core =
videobuf2_v4l2 rt2x00usb microchip videobuf2_common snd_bcm2835(C) rt2800li=
b snd_pcm_dmaengine sha512_arm64 bridge videodev snd_pcm rt2x00lib snd_time=
r aes_neon_bs lan78xx mc cec stp snd mac80211 aes_n
| eon_blk rc_core brcmfmac llc drm_display_helper soundcore drm_cma_helper =
of_mdio cpufreq_dt drbg libarc4 fixed_phy drm_kms_helper brcmutil fwnode_md=
io libphy ansi_cprng cfg80211 vchiq(C) ecdh_generic raspberrypi_cpufreq ecc=
 bcm2835_rng crc16 bcm2835_thermal rng_core rfkill
| pwm_bcm2835 bcm2835_wdt leds_gpio fuse drm configfs lz4 lz4_compress zram=
 zsmalloc ip_tables x_tables autofs4 btrfs blake2b_generic xor xor_neon rai=
d6_pq zstd_compress libcrc32c
| [   66.883758]  crc32c_generic xxhash_generic dwc2 udc_core roles usbcore=
 sdhci_iproc sdhci_pltfm crct10dif_ce crct10dif_common usb_common sdhci bcm=
2835 i2c_bcm2835 phy_generic
| [   66.987722] CPU: 3 PID: 611 Comm: insmod Tainted: G         C        5=
=2E19.0-1-arm64 #1  Debian 5.19.6-1
| [   66.997253] Hardware name: Raspberry Pi 3 Model B+ (DT)
| [   67.002549] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
| [   67.009610] pc : vc4_hdmi_reset+0x3e8/0x540 [vc4]
| [   67.014426] lr : vc4_hdmi_reset+0x24/0x540 [vc4]
| [   67.019153] sp : ffff80000ab83660
| [   67.022510] x29: ffff80000ab83660 x28: 00000000055fd460 x27: ffff00000=
9465080
| [   67.029753] x26: 0000000000000000 x25: ffff800008fbe740 x24: ffff80000=
9d582f0
| [   67.036995] x23: ffff00000dabb000 x22: ffff000005144000 x21: ffff00001=
3dc7180
| [   67.044237] x20: 0000000000000000 x19: ffff000009465080 x18: fffffffff=
fffffff
| [   67.051479] x17: 0000000000000000 x16: 0000000000000000 x15: ffff00001=
3dc7f14
| [   67.058721] x14: ffffffffffffffff x13: ffff000013dc7f10 x12: 010101010=
1010101
| [   67.065963] x11: 0000000000000040 x10: fffffffff8858c10 x9 : ffff80000=
173ceb4
| [   67.073205] x8 : 0101010101010101 x7 : 0000000000000000 x6 : ffff00000=
b3ad140
| [   67.080447] x5 : ffff000009465ca8 x4 : 0000000000000000 x3 : ffff00000=
9465ca8
| [   67.087689] x2 : 0000000000000001 x1 : 0000000000000002 x0 : ffff80000=
1753090
| [   67.094932] Call trace:
| [   67.097407]  vc4_hdmi_reset+0x3e8/0x540 [vc4]
| [   67.101869]  vc4_hdmi_runtime_resume+0x74/0x360 [vc4]
| [   67.107036]  vc4_hdmi_bind+0x218/0xa20 [vc4]
| [   67.111407]  component_bind_all+0x130/0x290
| [   67.115653]  vc4_drm_bind+0x10c/0x2e0 [vc4]
| [   67.119936]  try_to_bring_up_aggregate_device+0x230/0x320
| [   67.125411]  component_master_add_with_match+0xd4/0x11c
| [   67.130710]  vc4_platform_drm_probe+0xd0/0x110 [vc4]
| [   67.135787]  platform_probe+0x74/0xf0
| [   67.139501]  really_probe+0x19c/0x3f0
| [   67.143213]  __driver_probe_device+0x11c/0x190
| [   67.147719]  driver_probe_device+0x44/0xf4
| [   67.151872]  __driver_attach+0xd8/0x220
| [   67.155760]  bus_for_each_dev+0x7c/0xe0
| [   67.159649]  driver_attach+0x30/0x40
| [   67.163272]  bus_add_driver+0x154/0x240
| [   67.167162]  driver_register+0x84/0x140
| [   67.171051]  __platform_driver_register+0x34/0x40
| [   67.175821]  vc4_drm_register+0x5c/0x1000 [vc4]
| [   67.180456]  do_one_initcall+0x50/0x240
| [   67.184347]  do_init_module+0x50/0x1fc
| [   67.188150]  load_module+0x1c5c/0x2060
| [   67.191951]  __do_sys_finit_module+0xac/0x130
| [   67.196369]  __arm64_sys_finit_module+0x2c/0x40
| [   67.200964]  invoke_syscall+0x50/0x120
| [   67.204766]  el0_svc_common.constprop.0+0x4c/0x100
| [   67.209626]  do_el0_svc+0x3c/0xd0
| [   67.212987]  el0_svc+0x3c/0x100
| [   67.216174]  el0t_64_sync_handler+0xbc/0x140
| [   67.220502]  el0t_64_sync+0x18c/0x190
| [   67.224216] ---[ end trace 0000000000000000 ]---
| [   67.228942] ------------[ cut here ]------------

Is this a known problem?

regards,
Marc

--
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--oznmxn6oin25gkca
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEBsvAIBsPu6mG7thcrX5LkNig010FAmMsdzUACgkQrX5LkNig
013zkQf6AmRWvL/ZR9aJGeIJl2y8UTd4Xu4Xu7YwjU2Z5mBNJyT1YsFDTheVkjys
8Iu9+aPNztI6TbtHMdIZzWAm8k5+/q9Au64j2lXWIwbxQZKv1qJKqICrCR/5iLn3
gkhFA8gKdxm9MozZbDq3YK3tAgMqddh40GMKXkK2PADRJNa9KvAkwMXeZ3ClVffC
zzPp5aJEy3v8IpyReVZPue+t0ulj2BfSaVFyzbBwfSxgCtimJ9E0DbW06KOlsvtT
Li2YnF5sJLNzqB7DI60y6cv8Jle7qGVRKsS1EgRNuO0Xdh4TncTZF8xhXVLphjYl
jP/usp6I5CFqT1zF7/z5rqDS6TXfOg==
=aH60
-----END PGP SIGNATURE-----

--oznmxn6oin25gkca--
