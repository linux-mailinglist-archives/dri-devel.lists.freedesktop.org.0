Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DAB93E4C9
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2024 13:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EBCB10E138;
	Sun, 28 Jul 2024 11:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="XXp0k5iw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1FAB10E138
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 11:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1722166927; x=1722771727; i=wahrenst@gmx.net;
 bh=t9RUGYIzPmImI5RdyBcGPuYt4Ch3P3xZu5S+hkMDf8o=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
 MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=XXp0k5iwZir7n83XQ087VX+4Acj8Dh7Oc+qgMih5geYrDKIcnfyIj3ZXa/GiuBHx
 YOiBztY8UCKtHnLEizMh1IOC8W5gfHhJXECtis4z46DC4arFtGJmXPv49T8U56Ur+
 qRonJ8oOf5uxSNpkU32ep+vzK/KzkYfAIPapweF1PkPi8uffRq4lf4fJgKkrgkbqv
 cgqr5bXzoOv9a+5X/6fA2deVAbgBc5dmwD7FQASC/BdB5I1FlpXNaR4c58K04bP4G
 i/GDS4vI4+iDCHeWPxkDHBu7g7W58nuLHG5mNOn9l8h6AIXkdPFdzPhZjvcQxN/t6
 VYXCvpf1rJGp8oKGxg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYvcG-1slHrT2n32-00N5HR; Sun, 28
 Jul 2024 13:42:07 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Jiri Slaby <jirislaby@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-list@raspberrypi.com,
 Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 00/16] ARM: bcm2835: Implement initial S2Idle for Raspberry
 Pi
Date: Sun, 28 Jul 2024 13:41:44 +0200
Message-Id: <20240728114200.75559-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YNorNR+1omM35M/GKScFU7LvaIEeYUoyTg7TYTYVxeo3HqCms2E
 dBa0huxhCkBAH10O57ek73gOEy4q2qr7qfZ6U8wUZ6etP2maMxihZhUcCKNNV9a5dM4Cxlf
 C1sc9GJfzt22UGFKOPHVB6XUr5ce+QvlqfFH2cIYllyOo8h98YLGhlNwcO6Z9FCUyZEiYbL
 LUXkcX26tvWx2Qk+8w1Uw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WNzqUOykDu4=;CemkE6JrPK/fmO7QQsIf0PXdrqq
 jD4X9TBuBB9UTe169GfebsNmSBw73UVxVDTrFAoO8+qDGhu1MKzSDTCxsPhDb9TfaWVs2M2YM
 dLPPZTuiSkGlFsJ289uwm/BKkdfB5S4kKguffFLqxMAXWpJ4F0eqAjrKcy17BQ0yU50dQaZrB
 38KO0+djyJcBNbgNEWeBfqXw6SHiul8QE21dSLYmo30mNSzWPZVWcvk2DU+vQ1IaQxX+da/Vq
 k88MYUq6yRVVfzMDdrWiV5pKt/tPovi+jrtjMyTa3tsNd1u4qIY02/3fAHfYshb5P46i36rFV
 PDI2PQQo/eRjLMGiFzEQTO3B2tqiLggsSUsPzs86ECpEUbduisCH3bLxYHA8h/m0o6XAQQOYk
 Hd+LG7Dg/tl1Bct6MJ8Z3eiwoC+Kf7CzSiA+RcwsI5hn4kA0eYxep2VT1Qj+leFPZwBJuK4NH
 qF0yXMwSQBRbig/DGyziSiilnE1EIecqavalD1Gl/zjTiMXz0he8pL0vnqFFi1zz3F1tJnKrB
 vLhUzb1WU+1uIRiYmhjxhJG7BRIsuL/c7jbRXXSVAyZvbfDlZ1g9Z4nduET/i2Ci3eUG1d1i7
 OOSWwKXXvXky3iRPP2IAZIgyA5TeXGAK1VEaKa0tnVabHaXSz+qcUWD5Udbm3aOdKPKSrptqt
 iMAOxqoyyH0k7hQsIP/IO4SdpP9KEotg64JzegYLOqFzDKpsWmGUfLhHexl1wZSXqWc4BXXPh
 OVd/UcmrBy9CIBPdGeHJnhfEHIsL0r5aLNHZBPaLxNw65ox7YV2AcLs+3/PiXTSmCRl3JuyfJ
 x2mvWOFmCajsBqv/xmNfeYxg==
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

This series implement the initial S2Idle support for
the Raspberry Pi, which was a long time on my TODO list [1]. The
changes allow to suspend and resume the Raspberry Pi via debug UART.
The focus is on the BCM2835 SoC, because it's less complex than its
successors and have enough documentation.

The series can be roughly separated in 3 parts:
 1. base patches (1-5, 15, 16) which allows S2Idle support for BCM2835
 2. drm vc4 patches which implement S2Idle support (mostly new and not
    really BCM2835 specific)
 3. dwc2 patches which handle BCM2835 specific issues (still in progress,
    but works fine)

Cherry-picking of patches should be fine.

Test steps:
- configure debug console (pl011 or mini UART) as wakeup source
- send system to idle state

  echo freeze > /sys/power/state

- wakeup system by console traffic

The DWC2 part of the implementation isn't complete yet (especially patch 1=
4),
but much better than the first version. The USB domain is now powered down=
 and
the USB devices are still usable after resume. There is still room for
improvements, but at least the system won't freeze forever as before [2].

Here are some figures for the Raspberry Pi 1 (without any
devices connected except of a debug UART):

running but CPU idle =3D 1.67 W
S2Idle               =3D 1.33 W

In comparison with HDMI & USB keyboard connected (but neither active
nor wakeup source):

running but CPU idle =3D 1.82 W
S2Idle               =3D 1.33 W

The series has been successfully tested on the following platforms:
Raspberry Pi 1 B
Raspberry Pi 3 B+

Changes in V2:
- rebased against todays mainline
- added Reviewed-by from Florian
- added Acked-by from Minas
- dropped "irqchip/bcm2835: Enable SKIP_SET_WAKE and MASK_ON_SUSPEND"
  because it has been applied by Thomas Gleixner
- dropped "pmdomain: raspberrypi-power: Avoid powering down USB"
  because this workaround has been replaced by patch 14
- use drm_err_once instead of DRM_ERROR and return connector_status_unknow=
n
  in patch 6
- add new patch in order to clean-up all DRM_ERROR
- add new patch to improve raspberrypi-power logging
- add new patch to simplify V3D clock retrieval
- add new patch 5 to avoid power down of wakeup devices
- add new patch 12 to avoid confusion about ACPI ID of BCM283x USB
- add new patch 8 & 10 which address the problem that HDMI
  is not functional after s2idle
- add more links and fix typo in patch 13
- add new WIP patch 14 which recover DWC2 register after power down
- take care of UART clock in patch 15 as commented by Florian
- use SYSTEM_SLEEP_PM_OPS in patch 15

[1] - https://github.com/lategoodbye/rpi-zero/issues/9
[2] - https://bugzilla.redhat.com/show_bug.cgi?id=3D2283978

Stefan Wahren (16):
  firmware: raspberrypi: Improve timeout warning
  mailbox: bcm2835: Fix timeout during suspend mode
  pmdomain: raspberrypi-power: Adjust packet definition
  pmdomain: raspberrypi-power: Add logging to rpi_firmware_set_power
  pmdomain: raspberrypi-power: set flag GENPD_FLAG_ACTIVE_WAKEUP
  drm/vc4: hdmi: Handle error case of pm_runtime_resume_and_get
  drm/vc4: Get the rid of DRM_ERROR()
  drm/vc4: hdmi: add PM suspend/resume support
  drm/vc4: v3d: simplify clock retrieval
  drm/vc4: v3d: add PM suspend/resume support
  usb: dwc2: debugfs: Print parameter no_clock_gating
  usb: dwc2: Add comment about BCM2848 ACPI ID
  usb: dwc2: Skip clock gating on Broadcom SoCs
  WIP: usb: dwc2: Implement recovery after PM domain off
  serial: 8250_bcm2835aux: add PM suspend/resume support
  ARM: bcm2835_defconfig: Enable SUSPEND

 arch/arm/configs/bcm2835_defconfig        |  2 -
 drivers/firmware/raspberrypi.c            |  3 +-
 drivers/gpu/drm/vc4/vc4_bo.c              | 14 ++---
 drivers/gpu/drm/vc4/vc4_dpi.c             | 14 ++---
 drivers/gpu/drm/vc4/vc4_dsi.c             | 32 ++++++-----
 drivers/gpu/drm/vc4/vc4_gem.c             | 11 ++--
 drivers/gpu/drm/vc4/vc4_hdmi.c            | 70 +++++++++++++++++------
 drivers/gpu/drm/vc4/vc4_hvs.c             |  4 +-
 drivers/gpu/drm/vc4/vc4_irq.c             |  2 +-
 drivers/gpu/drm/vc4/vc4_v3d.c             | 21 +++----
 drivers/gpu/drm/vc4/vc4_validate.c        |  8 +--
 drivers/gpu/drm/vc4/vc4_vec.c             | 10 ++--
 drivers/mailbox/bcm2835-mailbox.c         |  3 +-
 drivers/pmdomain/bcm/raspberrypi-power.c  | 43 ++++++++------
 drivers/tty/serial/8250/8250_bcm2835aux.c | 37 ++++++++++++
 drivers/usb/dwc2/core.c                   | 16 ++++++
 drivers/usb/dwc2/core.h                   | 17 ++++++
 drivers/usb/dwc2/debugfs.c                |  1 +
 drivers/usb/dwc2/gadget.c                 | 49 ++++++++++++++++
 drivers/usb/dwc2/hcd.c                    | 49 ++++++++++++++++
 drivers/usb/dwc2/params.c                 |  2 +
 drivers/usb/dwc2/platform.c               | 32 +++++++++++
 22 files changed, 339 insertions(+), 101 deletions(-)

=2D-
2.34.1

