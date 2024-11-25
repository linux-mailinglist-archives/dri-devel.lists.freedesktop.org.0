Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A999D934B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 09:27:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA6010E7E8;
	Tue, 26 Nov 2024 08:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linumiz.com header.i=@linumiz.com header.b="MQ98TSnw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from omta36.uswest2.a.cloudfilter.net
 (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B217D10E6B8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 16:37:38 +0000 (UTC)
Received: from eig-obgw-6003a.ext.cloudfilter.net ([10.0.30.151])
 by cmsmtp with ESMTPS
 id FawVtmtigqvuoFc5itQrnM; Mon, 25 Nov 2024 16:37:38 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182]) by cmsmtp with ESMTPS
 id Fc5ft23CXCgT6Fc5htG9UT; Mon, 25 Nov 2024 16:37:38 +0000
X-Authority-Analysis: v=2.4 cv=XvwxOkF9 c=1 sm=1 tr=0 ts=6744a7d2
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=_CNdjClPJo_0AlPSAu4A:9 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
 ; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gwl6rW5/vPt5JBHz3XIzY0yjV5RcrGlmAAilgoFy4TQ=; b=MQ98TSnwomYCUUnXHh8qPIN7PN
 guT2WXlfQJF3o7wz9lwrLrmT2sV+0xMr5i3xi5ldOtzWvJcGplaTE7j7q63irxFNEZl7ZkoOoUQhH
 y/7XnyJvulT7fPPW1oWQBJId0FLENybgIbVOLUMOUUz/2+PG0pSLcLDzYW+Cq+9pRlw7If/vCedSf
 Mzv2J5oav3E+eMsHES6NP17G8tBKUSiYipwSJQE68hqftT9+2gJbH0i5ezbiW8m0zbt/bYOqnhjxO
 ETJ6ln+Z9rG8MypNNjF1bEtNGVAFzx/iN5mJrz/KLLltZqN/U1Um85s4Sfc/e7RCnTxZD94rp1czj
 uDlvU6vg==;
Received: from [122.165.245.213] (port=38110 helo=[127.0.1.1])
 by md-in-79.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <parthiban@linumiz.com>) id 1tFc5b-001iXQ-17;
 Mon, 25 Nov 2024 22:07:31 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
Date: Mon, 25 Nov 2024 22:07:04 +0530
Subject: [PATCH 2/2] drm/imagination: add reset control support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241125-pvr-reset-v1-2-b437b8052948@linumiz.com>
References: <20241125-pvr-reset-v1-0-b437b8052948@linumiz.com>
In-Reply-To: <20241125-pvr-reset-v1-0-b437b8052948@linumiz.com>
To: Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Parthiban Nallathambi <parthiban@linumiz.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732552647; l=3446;
 i=parthiban@linumiz.com; s=20241125; h=from:subject:message-id;
 bh=fOL6L5TlnzXNAKOAwbLxcTtHOaazgxdBU1plUoQ8Jzw=;
 b=b5t26Ndgj56MR2TOf8LgFXM36QxrcEz5U7oErfYXAw6qN5v+DaZzO20DX4Zb3bWg+evkKxHFo
 9guvoLRCY90BWvRlawQIweJXlrhUKyTqVGlXyIyWttA0QtEzkD76Hkh
X-Developer-Key: i=parthiban@linumiz.com; a=ed25519;
 pk=PrcMZ/nwnHbeXNFUFUS833wF3DAX4hziDHEbBp1eNb8=
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1tFc5b-001iXQ-17
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([127.0.1.1]) [122.165.245.213]:38110
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 29
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfAcSOS9/6ayA6Y0+afPhAH3lXK0Xghd131K9fEegI5rDhtDsPKdtyzB/XtQGrPUgG34c623tz/+E7Xoytx8StDOJT4rlUW7z5Bye8qnQjtESNJFsTdZA
 n2tcA+pA6EB/qgWrTZ6m58MCbCNFyUqEzwfWK4xKc0obdYnacyc/x6gcESWg/OhwoTJXauib4JEdFkMB206VAXIehYFiqDfWWysPXow9jqicmkx1tYzmxxLL
X-Mailman-Approved-At: Tue, 26 Nov 2024 08:26:46 +0000
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

On some platforms like Allwinner A133 with GE8300 includes
reset control from reset control unit. Add reset control
optionally from the devicetree.

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
 drivers/gpu/drm/imagination/pvr_device.h |  8 ++++++++
 drivers/gpu/drm/imagination/pvr_drv.c    |  5 +++++
 drivers/gpu/drm/imagination/pvr_power.c  | 16 +++++++++++++++-
 3 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index 6d0dfacb677b..21ec7dd64415 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -23,6 +23,7 @@
 #include <linux/kernel.h>
 #include <linux/math.h>
 #include <linux/mutex.h>
+#include <linux/reset.h>
 #include <linux/spinlock_types.h>
 #include <linux/timer.h>
 #include <linux/types.h>
@@ -131,6 +132,13 @@ struct pvr_device {
 	 */
 	struct clk *mem_clk;
 
+	/**
+	 * @reset: Optional reset control
+	 *
+	 * This may be used on some platforms to reset the GPU module/IP.
+	 */
+	struct reset_control *reset;
+
 	/** @irq: IRQ number. */
 	int irq;
 
diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index fb17196e05f4..d9b918410ea9 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -36,6 +36,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/xarray.h>
 
 /**
@@ -1427,6 +1428,10 @@ pvr_probe(struct platform_device *plat_dev)
 	pm_runtime_use_autosuspend(&plat_dev->dev);
 	pvr_watchdog_init(pvr_dev);
 
+	pvr_dev->reset = devm_reset_control_get_optional_exclusive(&plat_dev->dev, "ahb");
+	if (PTR_ERR(pvr_dev->reset) == -EPROBE_DEFER)
+		return PTR_ERR(pvr_dev->reset);
+
 	err = pvr_device_init(pvr_dev);
 	if (err)
 		goto err_watchdog_fini;
diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/imagination/pvr_power.c
index ba7816fd28ec..a24ed85f36c7 100644
--- a/drivers/gpu/drm/imagination/pvr_power.c
+++ b/drivers/gpu/drm/imagination/pvr_power.c
@@ -15,6 +15,7 @@
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/timer.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
@@ -252,6 +253,9 @@ pvr_power_device_suspend(struct device *dev)
 	clk_disable_unprepare(pvr_dev->sys_clk);
 	clk_disable_unprepare(pvr_dev->core_clk);
 
+	if (!IS_ERR(pvr_dev->reset))
+		reset_control_assert(pvr_dev->reset);
+
 err_drm_dev_exit:
 	drm_dev_exit(idx);
 
@@ -270,9 +274,15 @@ pvr_power_device_resume(struct device *dev)
 	if (!drm_dev_enter(drm_dev, &idx))
 		return -EIO;
 
+	if (!IS_ERR(pvr_dev->reset)) {
+		err = reset_control_reset(pvr_dev->reset);
+		if (err)
+			goto err_drm_dev_exit;
+	}
+
 	err = clk_prepare_enable(pvr_dev->core_clk);
 	if (err)
-		goto err_drm_dev_exit;
+		goto err_reset_exit;
 
 	err = clk_prepare_enable(pvr_dev->sys_clk);
 	if (err)
@@ -301,6 +311,10 @@ pvr_power_device_resume(struct device *dev)
 err_core_clk_disable:
 	clk_disable_unprepare(pvr_dev->core_clk);
 
+err_reset_exit:
+	if (!IS_ERR(pvr_dev->reset))
+		reset_control_assert(pvr_dev->reset);
+
 err_drm_dev_exit:
 	drm_dev_exit(idx);
 

-- 
2.39.2

