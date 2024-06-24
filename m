Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFA4914DCC
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 14:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF5310E422;
	Mon, 24 Jun 2024 12:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aohB5A8O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD8E10E422
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 12:57:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5436BCE10C2;
 Mon, 24 Jun 2024 12:57:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CBF5C2BBFC;
 Mon, 24 Jun 2024 12:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719233842;
 bh=d3771zC8yUvjtMviu7KRlfggu03pX6iFdn23jREue6U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aohB5A8Ooais2d/ceAFf9VeOd3XN5DvjN0OQYFtQuMIz7tdrX3SMIA7FPZnjfsqg1
 hRyyPO5S3aijWiFrD9P7oWz3Ey6v/mjk0Rzb4IrLvlP/T+WpEiuUb8E9OxAh/cWWbX
 83YMyhcoC/hAcRGGrDnTT7u7y+HZ7q9EjkI1IVJuN6dN64s1txWuTUTjYQv6z25mqN
 hjVH0VrGmzYhdQ0rd5z3VUa4QK6fO6K0xK8WXBMwUPo2G7Yes+P7Y7ZAYwXm8C8Tzr
 ach00ihSp88Av/oVqqzd/3a1nIOaVHvUEwc7LTjgnWE22itYnfu9dMFt0b6LnskqAi
 k/pT06jczLLsA==
Date: Mon, 24 Jun 2024 14:57:18 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Melissa Wen <mwen@igalia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 linux-pm@vger.kernel.org
Subject: Re: vc4: WARNING during suspend to idle of Raspberry Pi 3 Plus
Message-ID: <20240624-furry-kangaroo-of-flowers-85ecdf@houat>
References: <7003512d-7303-4f41-b0d6-a8af5bf8e497@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qrsmrs6hyeaaw4h7"
Content-Disposition: inline
In-Reply-To: <7003512d-7303-4f41-b0d6-a8af5bf8e497@gmx.net>
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


--qrsmrs6hyeaaw4h7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 16, 2024 at 11:27:08AM GMT, Stefan Wahren wrote:
> Hi,
> i'm currently experiment with suspend to idle on the Raspberry Pi [1].
>=20
> During my tests, i noticed a WARNING of the vc4 during suspend incl.
> Runtime PM usage count underflow. It would be nice if someone can look
> at it. In case you want to reproduce it, i can prepare a branch with
> some improvements/hacks. For example i disabled dwc2/USB because it
> cause a lot of trouble during resume.
>=20
> Here are the steps to trigger this issue:
> - make sure necessary kernel options are enabled ( CONFIG_SUSPEND,
> CONFIG_PM_DEBUG, CONFIG_PM_ADVANCED_DEBUG )
> - make sure no HDMI cable is connected to Raspberry Pi 3 Plus
> - Add "no_console_suspend" to cmdline.txt and reboot
> - Connect via Debug UART:
>=20
> echo 1 > /sys/power/pm_debug_messages
> echo platform > /sys/power/pm_test
> echo freeze > /sys/power/state
>=20
> Here is the output:
>=20
> [=A0=A0 75.538497] PM: suspend entry (s2idle)
> [=A0=A0 76.915786] Filesystems sync: 1.377 seconds
> [=A0=A0 79.678262] rpi_firmware_set_power: Set HDMI to 1
> [=A0=A0 79.678634] rpi_firmware_set_power: Set HDMI to 0
> [=A0=A0 79.850949] Freezing user space processes
> [=A0=A0 79.852460] Freezing user space processes completed (elapsed 0.001
> seconds)
> [=A0=A0 79.852484] OOM killer disabled.
> [=A0=A0 79.852493] Freezing remaining freezable tasks
> [=A0=A0 79.853684] Freezing remaining freezable tasks completed (elapsed
> 0.001 seconds)
> [=A0=A0 80.892819] ieee80211 phy0: brcmf_fil_cmd_data: bus is down. we ha=
ve
> nothing to do.
> [=A0=A0 80.892843] ieee80211 phy0: brcmf_cfg80211_get_tx_power: error (-5)
> [=A0=A0 81.514053] PM: suspend of devices complete after 1659.336 msecs
> [=A0=A0 81.514089] PM: start suspend of devices complete after 1660.386 m=
secs
> [=A0=A0 81.515616] PM: late suspend of devices complete after 1.509 msecs
> [=A0=A0 81.515938] rpi_firmware_set_power: Set VEC to 0
> [=A0=A0 81.516010] rpi_firmware_set_power: Set V3D to 0
> [=A0=A0 81.516998] PM: noirq suspend of devices complete after 1.239 msecs
> [=A0=A0 81.517016] PM: suspend debug: Waiting for 5 second(s).
> [=A0=A0 89.598310] rpi_firmware_set_power: Set V3D to 1
> [=A0=A0 90.078228] ------------[ cut here ]------------
> [=A0=A0 90.078240] WARNING: CPU: 1 PID: 216 at
> drivers/gpu/drm/vc4/vc4_hdmi.c:477
> vc4_hdmi_connector_detect_ctx+0x2e4/0x34c [vc4]
> [=A0=A0 90.078344] Modules linked in: aes_arm aes_generic cbc crypto_simd
> cryptd algif_skcipher af_alg brcmfmac_wcc brcmfmac vc4 brcmutil
> snd_soc_hdmi_codec snd_soc_core ac97_bus sha256_generic
> snd_pcm_dmaengine libsha256 snd_pcm sha256_arm snd_timer hci_uart
> cfg80211 btbcm snd bluetooth soundcore drm_dma_helper crc32_arm_ce
> ecdh_generic ecc raspberrypi_hwmon libaes bcm2835_thermal
> [=A0=A0 90.078551] CPU: 1 PID: 216 Comm: kworker/1:2 Not tainted 6.9.3-di=
rty #30
> [=A0=A0 90.078568] Hardware name: BCM2835
> [=A0=A0 90.078580] Workqueue: events output_poll_execute
> [=A0=A0 90.078610] Call trace:
> [=A0=A0 90.078624]=A0 unwind_backtrace from show_stack+0x10/0x14
> [=A0=A0 90.078660]=A0 show_stack from dump_stack_lvl+0x50/0x64
> [=A0=A0 90.078688]=A0 dump_stack_lvl from __warn+0x7c/0x124
> [=A0=A0 90.078723]=A0 __warn from warn_slowpath_fmt+0x170/0x178
> [=A0=A0 90.078760]=A0 warn_slowpath_fmt from
> vc4_hdmi_connector_detect_ctx+0x2e4/0x34c [vc4]
> [=A0=A0 90.078862]=A0 vc4_hdmi_connector_detect_ctx [vc4] from
> drm_helper_probe_detect_ctx+0x40/0x120
> [=A0=A0 90.078951]=A0 drm_helper_probe_detect_ctx from
> output_poll_execute+0x160/0x24c
> [=A0=A0 90.078982]=A0 output_poll_execute from process_one_work+0x16c/0x3=
b4
> [=A0=A0 90.079012]=A0 process_one_work from worker_thread+0x270/0x488
> [=A0=A0 90.079036]=A0 worker_thread from kthread+0xe0/0xfc
> [=A0=A0 90.079060]=A0 kthread from ret_from_fork+0x14/0x28
> [=A0=A0 90.079080] Exception stack(0xf0af9fb0 to 0xf0af9ff8)
> [=A0=A0 90.079096] 9fa0:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 00000000
> 00000000 00000000 00000000
> [=A0=A0 90.079113] 9fc0: 00000000 00000000 00000000 00000000 00000000
> 00000000 00000000 00000000
> [=A0=A0 90.079129] 9fe0: 00000000 00000000 00000000 00000000 00000013 000=
00000
> [=A0=A0 90.079141] ---[ end trace 0000000000000000 ]---
> [=A0=A0 90.079155] vc4_hdmi 3f902000.hdmi: vc4_hdmi_connector_detect_ctx:
> pm_runtime_resume_and_get failed: -13
> [=A0=A0 92.638262] rpi_firmware_set_power: Set HDMI to 1
> [=A0=A0 95.678251] rpi_firmware_set_power: Set VEC to 1
> [=A0=A0 95.678380] PM: noirq resume of devices complete after 9160.930 ms=
ecs
> [=A0=A0 95.679604] PM: early resume of devices complete after 1.069 msecs
> [=A0=A0 95.812230] brcmfmac: brcmf_fw_alloc_request: using
> brcm/brcmfmac43455-sdio for chip BCM4345/6
> [=A0=A0 95.812282] PM: resume of devices complete after 132.657 msecs
> [=A0=A0 95.813246] vc4_hdmi 3f902000.hdmi: Runtime PM usage count underfl=
ow!
> [=A0=A0 95.814456] OOM killer enabled.
> [=A0=A0 95.814466] Restarting tasks ... done.
> [=A0=A0 95.817193] random: crng reseeded on system resumption
> [=A0=A0 95.819813] rpi_firmware_set_power: Set HDMI to 0
> [=A0=A0 95.827808] PM: suspend exit
>=20
> [1] - https://github.com/raspberrypi/firmware/issues/1894

The code itself looks fine to me still, but It's not clear to me why it
getting called during suspend in the first place. IIRC, it's in the HPD
interrupt handler path, could it be that the interrupt fires during
suspend?

Maxime

--qrsmrs6hyeaaw4h7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZnltLgAKCRDj7w1vZxhR
xX4IAP0bynG/MlyGeyGHDOySXB0r3ioUiv2ZfPtBx7kRWneChwEAw6Rdz0OacmMI
aaHK7rfYZaV+K5hRISYd4WvwcEbLxAA=
=XWx1
-----END PGP SIGNATURE-----

--qrsmrs6hyeaaw4h7--
