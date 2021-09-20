Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1750741133E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 13:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06DBB6E4A6;
	Mon, 20 Sep 2021 11:00:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 399 seconds by postgrey-1.36 at gabe;
 Mon, 20 Sep 2021 09:12:06 UTC
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC0D6E452
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 09:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=k1; bh=8Ic7rPl8wS6tSUDgDBOpnPfgXT8
 diIPVuuJEV7+3x14=; b=y3zScd6qLqQkIP3VZO9fvHA8J6/TlWpstJuxEWG+2wh
 RSUW1mVxF26O2U33Dq6EbBJ3XmayRck4KWgT5z4BxcgklO7B+9wEmZO5zVAmdCUU
 eq691H+mkSBSVXJ5b+Z4iTQ6tBhA1RnGtNmi7NlL+YGjQ7U1KmJ/dc6bhwHIpZnk
 =
Received: (qmail 2412526 invoked from network); 20 Sep 2021 11:05:23 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 20 Sep 2021 11:05:23 +0200
X-UD-Smtp-Session: l3s3148p1@Lz7AlGnMBosgAwDPXwlxANIWpbLKE1Uh
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, dmaengine@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org
Subject: [PATCH 0/9] treewide: simplify getting .driver_data
Date: Mon, 20 Sep 2021 11:05:12 +0200
Message-Id: <20210920090522.23784-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 20 Sep 2021 11:00:52 +0000
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

I got tired of fixing this in Renesas drivers manually, so I took the big
hammer. Remove this cumbersome code pattern which got copy-pasted too much
already:

-	struct platform_device *pdev = to_platform_device(dev);
-	struct ep93xx_keypad *keypad = platform_get_drvdata(pdev);
+	struct ep93xx_keypad *keypad = dev_get_drvdata(dev);

A branch, tested by buildbot, can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git coccinelle/get_drvdata

I am open for other comments, suggestions, too, of course.

Here is the cocci-script I created:

@@
struct device* d;
identifier pdev;
expression *ptr;
@@
(
-	struct platform_device *pdev = to_platform_device(d);
|
-	struct platform_device *pdev;
	...
-	pdev = to_platform_device(d);
)
	<... when != pdev
-	&pdev->dev
+	d
	...>

	ptr =
-	platform_get_drvdata(pdev)
+	dev_get_drvdata(d)

	<... when != pdev
-	&pdev->dev
+	d
	...>

Kind regards,

   Wolfram


Wolfram Sang (9):
  dmaengine: stm32-dmamux: simplify getting .driver_data
  firmware: meson: simplify getting .driver_data
  gpio: xilinx: simplify getting .driver_data
  drm/msm: simplify getting .driver_data
  drm/panfrost: simplify getting .driver_data
  iio: common: cros_ec_sensors: simplify getting .driver_data
  net: mdio: mdio-bcm-iproc: simplify getting .driver_data
  platform: chrome: cros_ec_sensorhub: simplify getting .driver_data
  remoteproc: omap_remoteproc: simplify getting .driver_data

 drivers/dma/stm32-dmamux.c                         | 14 +++++---------
 drivers/firmware/meson/meson_sm.c                  |  3 +--
 drivers/gpio/gpio-xilinx.c                         |  6 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 13 +++++--------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |  6 ++----
 drivers/gpu/drm/msm/dp/dp_display.c                |  6 ++----
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  6 ++----
 drivers/gpu/drm/msm/msm_drv.c                      |  3 +--
 drivers/gpu/drm/panfrost/panfrost_device.c         |  6 ++----
 .../common/cros_ec_sensors/cros_ec_sensors_core.c  |  3 +--
 drivers/net/mdio/mdio-bcm-iproc.c                  |  3 +--
 drivers/platform/chrome/cros_ec_sensorhub.c        |  6 ++----
 drivers/remoteproc/omap_remoteproc.c               |  6 ++----
 13 files changed, 28 insertions(+), 53 deletions(-)

-- 
2.30.2

