Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 328A891A342
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 11:58:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F6F10E1DC;
	Thu, 27 Jun 2024 09:58:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Og8M8Avb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE40910E1C3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 09:58:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 30B3CCE2DA9;
 Thu, 27 Jun 2024 09:58:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C68DC2BBFC;
 Thu, 27 Jun 2024 09:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719482322;
 bh=0vBwwuMPCscrY/Ggxc9pElmDUVLfIyE+fUQIbl54jas=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Og8M8Avb7iT4oGcyk9oVrhPmxYID/CITJm1q+cWhbv/72Q1hHU9f2m7lQv9l8745j
 caYW5ig9BC3UdZFlL+bTbmFlI7uTqlPf1lPJ3kjSDQbsMsK+ewwQiYrWA5QFJOG9M/
 Rr/2YyrAV4tpTT+PiMP0FJScxhAt82zTYJKmTsLoxKTMctO9DMtew/hzP23cnHY2ip
 l9g5XPwOBLfYxm52JFOFLsKURRGIa8WJtIZ5xq6cX8edJZVS9ZrjUDXMQT21ra1XT1
 tifqSzWw+P/JK54Wr2E+xBabh5J/id3Lhnh481UlbDirlvD+eeDcs11CwJxSDlXMDU
 LxjHceN+wc8Ng==
Date: Thu, 27 Jun 2024 11:58:39 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Melissa Wen <mwen@igalia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 linux-pm@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: vc4: WARNING during suspend to idle of Raspberry Pi 3 Plus
Message-ID: <20240627-tentacled-dancing-ladybug-bbd004@houat>
References: <7003512d-7303-4f41-b0d6-a8af5bf8e497@gmx.net>
 <20240624-furry-kangaroo-of-flowers-85ecdf@houat>
 <26c16ecc-408a-4f7e-a98c-dc36adcc7ac6@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bhy6tnx7ksntf3tj"
Content-Disposition: inline
In-Reply-To: <26c16ecc-408a-4f7e-a98c-dc36adcc7ac6@gmx.net>
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


--bhy6tnx7ksntf3tj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 04:21:11PM GMT, Stefan Wahren wrote:
> Am 24.06.24 um 14:57 schrieb Maxime Ripard:
> > On Sun, Jun 16, 2024 at 11:27:08AM GMT, Stefan Wahren wrote:
> > > Hi,
> > > i'm currently experiment with suspend to idle on the Raspberry Pi [1].
> > >=20
> > > During my tests, i noticed a WARNING of the vc4 during suspend incl.
> > > Runtime PM usage count underflow. It would be nice if someone can look
> > > at it. In case you want to reproduce it, i can prepare a branch with
> > > some improvements/hacks. For example i disabled dwc2/USB because it
> > > cause a lot of trouble during resume.
> > >=20
> > > Here are the steps to trigger this issue:
> > > - make sure necessary kernel options are enabled ( CONFIG_SUSPEND,
> > > CONFIG_PM_DEBUG, CONFIG_PM_ADVANCED_DEBUG )
> > > - make sure no HDMI cable is connected to Raspberry Pi 3 Plus
> sorry, i forgot the specific type of the Raspberry Pi 3 B Plus, but the
> issue on Pi 3 A Plus is the same.
> > > - Add "no_console_suspend" to cmdline.txt and reboot
> > > - Connect via Debug UART:
> > >=20
> > > echo 1 > /sys/power/pm_debug_messages
> > > echo platform > /sys/power/pm_test
> > > echo freeze > /sys/power/state
> > >=20
> > > Here is the output:
> > >=20
> > > [=A0=A0 75.538497] PM: suspend entry (s2idle)
> > > [=A0=A0 76.915786] Filesystems sync: 1.377 seconds
> > > [=A0=A0 79.678262] rpi_firmware_set_power: Set HDMI to 1
> > > [=A0=A0 79.678634] rpi_firmware_set_power: Set HDMI to 0
> > > [=A0=A0 79.850949] Freezing user space processes
> > > [=A0=A0 79.852460] Freezing user space processes completed (elapsed 0=
=2E001
> > > seconds)
> > > [=A0=A0 79.852484] OOM killer disabled.
> > > [=A0=A0 79.852493] Freezing remaining freezable tasks
> > > [=A0=A0 79.853684] Freezing remaining freezable tasks completed (elap=
sed
> > > 0.001 seconds)
> > > [=A0=A0 80.892819] ieee80211 phy0: brcmf_fil_cmd_data: bus is down. w=
e have
> > > nothing to do.
> > > [=A0=A0 80.892843] ieee80211 phy0: brcmf_cfg80211_get_tx_power: error=
 (-5)
> > > [=A0=A0 81.514053] PM: suspend of devices complete after 1659.336 mse=
cs
> > > [=A0=A0 81.514089] PM: start suspend of devices complete after 1660.3=
86 msecs
> > > [=A0=A0 81.515616] PM: late suspend of devices complete after 1.509 m=
secs
> > > [=A0=A0 81.515938] rpi_firmware_set_power: Set VEC to 0
> > > [=A0=A0 81.516010] rpi_firmware_set_power: Set V3D to 0
> > > [=A0=A0 81.516998] PM: noirq suspend of devices complete after 1.239 =
msecs
> > > [=A0=A0 81.517016] PM: suspend debug: Waiting for 5 second(s).
> > > [=A0=A0 89.598310] rpi_firmware_set_power: Set V3D to 1
> > > [=A0=A0 90.078228] ------------[ cut here ]------------
> > > [=A0=A0 90.078240] WARNING: CPU: 1 PID: 216 at
> > > drivers/gpu/drm/vc4/vc4_hdmi.c:477
> > > vc4_hdmi_connector_detect_ctx+0x2e4/0x34c [vc4]
> > > [=A0=A0 90.078344] Modules linked in: aes_arm aes_generic cbc crypto_=
simd
> > > cryptd algif_skcipher af_alg brcmfmac_wcc brcmfmac vc4 brcmutil
> > > snd_soc_hdmi_codec snd_soc_core ac97_bus sha256_generic
> > > snd_pcm_dmaengine libsha256 snd_pcm sha256_arm snd_timer hci_uart
> > > cfg80211 btbcm snd bluetooth soundcore drm_dma_helper crc32_arm_ce
> > > ecdh_generic ecc raspberrypi_hwmon libaes bcm2835_thermal
> > > [=A0=A0 90.078551] CPU: 1 PID: 216 Comm: kworker/1:2 Not tainted 6.9.=
3-dirty #30
> > > [=A0=A0 90.078568] Hardware name: BCM2835
> > > [=A0=A0 90.078580] Workqueue: events output_poll_execute
> > > [=A0=A0 90.078610] Call trace:
> > > [=A0=A0 90.078624]=A0 unwind_backtrace from show_stack+0x10/0x14
> > > [=A0=A0 90.078660]=A0 show_stack from dump_stack_lvl+0x50/0x64
> > > [=A0=A0 90.078688]=A0 dump_stack_lvl from __warn+0x7c/0x124
> > > [=A0=A0 90.078723]=A0 __warn from warn_slowpath_fmt+0x170/0x178
> > > [=A0=A0 90.078760]=A0 warn_slowpath_fmt from
> > > vc4_hdmi_connector_detect_ctx+0x2e4/0x34c [vc4]
> > > [=A0=A0 90.078862]=A0 vc4_hdmi_connector_detect_ctx [vc4] from
> > > drm_helper_probe_detect_ctx+0x40/0x120
> > > [=A0=A0 90.078951]=A0 drm_helper_probe_detect_ctx from
> > > output_poll_execute+0x160/0x24c
> > > [=A0=A0 90.078982]=A0 output_poll_execute from process_one_work+0x16c=
/0x3b4
> > > [=A0=A0 90.079012]=A0 process_one_work from worker_thread+0x270/0x488
> > > [=A0=A0 90.079036]=A0 worker_thread from kthread+0xe0/0xfc
> > > [=A0=A0 90.079060]=A0 kthread from ret_from_fork+0x14/0x28
> > > [=A0=A0 90.079080] Exception stack(0xf0af9fb0 to 0xf0af9ff8)
> > > [=A0=A0 90.079096] 9fa0:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 00000000
> > > 00000000 00000000 00000000
> > > [=A0=A0 90.079113] 9fc0: 00000000 00000000 00000000 00000000 00000000
> > > 00000000 00000000 00000000
> > > [=A0=A0 90.079129] 9fe0: 00000000 00000000 00000000 00000000 00000013=
 00000000
> > > [=A0=A0 90.079141] ---[ end trace 0000000000000000 ]---
> > > [=A0=A0 90.079155] vc4_hdmi 3f902000.hdmi: vc4_hdmi_connector_detect_=
ctx:
> > > pm_runtime_resume_and_get failed: -13
> > > [=A0=A0 92.638262] rpi_firmware_set_power: Set HDMI to 1
> > > [=A0=A0 95.678251] rpi_firmware_set_power: Set VEC to 1
> > > [=A0=A0 95.678380] PM: noirq resume of devices complete after 9160.93=
0 msecs
> > > [=A0=A0 95.679604] PM: early resume of devices complete after 1.069 m=
secs
> > > [=A0=A0 95.812230] brcmfmac: brcmf_fw_alloc_request: using
> > > brcm/brcmfmac43455-sdio for chip BCM4345/6
> > > [=A0=A0 95.812282] PM: resume of devices complete after 132.657 msecs
> > > [=A0=A0 95.813246] vc4_hdmi 3f902000.hdmi: Runtime PM usage count und=
erflow!
> > > [=A0=A0 95.814456] OOM killer enabled.
> > > [=A0=A0 95.814466] Restarting tasks ... done.
> > > [=A0=A0 95.817193] random: crng reseeded on system resumption
> > > [=A0=A0 95.819813] rpi_firmware_set_power: Set HDMI to 0
> > > [=A0=A0 95.827808] PM: suspend exit
> > >=20
> > > [1] - https://github.com/raspberrypi/firmware/issues/1894
> > The code itself looks fine to me still, but It's not clear to me why it
> > getting called during suspend in the first place.
>
> This is a good question. I don't have idea why this should be necessary.
>=20
> But according to the kernel docs the worker output_poll_execute can be
> disabled with drm_kms_helper_poll_disable().

Yeah, we might need to disable polling during suspend. I must admit I
don't have much experience with suspend, so I won't be of much help.

> Btw do we need to use SET_SYSTEM_SLEEP_PM_OPS here?
> >   IIRC, it's in the HPD
> > interrupt handler path, could it be that the interrupt fires during
> > suspend?
>
> Based on the trace and my further investigations the function is called
> vc4_hdmi_connector_detect_ctx every 10s while no HDMI connector is
> plugged by output_poll_execute. This has the advantage that also the
> GPIOs from the expander could be used as HPD. Since the suspend test is
> 5 sec long, there is a high chance for this warning.

That's slightly unrelated, but we can actually use that GPIO for HPD
since it supports interrupts. I did a patch quite some time ago that was
never merged for a good reason, but I can't remember what it was
exactly:

https://github.com/raspberrypi/linux/pull/4327

> Here is my current workaround:
>=20
> drm/vc4: hdmi: Handle error case of pm_runtime_resume_and_get
>=20
> The commit 0f5251339eda ("drm/vc4: hdmi: Make sure the controller is
> powered in detect") introduced the necessary power management handling
> to avoid register access while controller is powered down.
> Unfortunately it just print a warning if pm_runtime_resume_and_get()
> fails and proceed anyway.
>=20
> This could happen during suspend to idle. So we must assume it is unsafe
> to access the HDMI register. So bail out properly.
>=20
> Fixes: 0f5251339eda ("drm/vc4: hdmi: Make sure the controller is powered
> in detect")
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
> =A0drivers/gpu/drm/vc4/vc4_hdmi.c | 7 ++++++-
> =A01 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
> index d30f8e8e896717..2c1d59a181d833 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -462,6 +462,7 @@ static int vc4_hdmi_connector_detect_ctx(struct
> drm_connector *connector,
> =A0{
> =A0=A0=A0=A0 struct vc4_hdmi *vc4_hdmi =3D connector_to_vc4_hdmi(connecto=
r);
> =A0=A0=A0=A0 enum drm_connector_status status =3D connector_status_discon=
nected;
> +=A0=A0=A0 int ret;
>=20
> =A0=A0=A0=A0 /*
> =A0=A0=A0=A0 =A0* NOTE: This function should really take vc4_hdmi->mutex,=
 but
> @@ -474,7 +475,11 @@ static int vc4_hdmi_connector_detect_ctx(struct
> drm_connector *connector,
> =A0=A0=A0=A0 =A0* the lock for now.
> =A0=A0=A0=A0 =A0*/
>=20
> - WARN_ON(pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev));
> +=A0=A0=A0 ret =3D pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev);
> +=A0=A0=A0 if (ret) {
> +=A0=A0=A0 =A0=A0=A0 DRM_ERROR("Failed to retain HDMI power domain: %d\n"=
, ret);
> +=A0=A0=A0 =A0=A0=A0 return status;
> +=A0=A0=A0 }
>=20
> =A0=A0=A0=A0 if (vc4_hdmi->hpd_gpio) {
> =A0=A0=A0=A0 =A0=A0=A0 if (gpiod_get_value_cansleep(vc4_hdmi->hpd_gpio))
>=20

Yeah... I think we should really just fix the "why is detect even called
in the first place" issue rather than merge something like that.

Maxime

--bhy6tnx7ksntf3tj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZn03zwAKCRDj7w1vZxhR
xcreAQDtN6habbZst6DK2E49yAQW8VLjl+lrsCPLKMkJz3DozAD+PikN3pIjQHqF
TZQsodWPmnrcFCtb/hAmOxyxALb3oAA=
=TK2s
-----END PGP SIGNATURE-----

--bhy6tnx7ksntf3tj--
