Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD64482893
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jan 2022 22:38:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D773210E1CF;
	Sat,  1 Jan 2022 21:38:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B086310E1CF
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jan 2022 21:38:17 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3A749811B2;
 Sat,  1 Jan 2022 22:38:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1641073095;
 bh=o2NjKJzCrEv+KYKcYng4a50RKsGSkJ4NW+RVWn0nB/E=;
 h=From:To:Cc:Subject:Date:From;
 b=Fkr/VibtEdC/P3zF39VBuMe1Un11on6i9XYxox/z5AvnMEdstKOJHgV2EOSRJ/A4b
 Y/D0+I9N5bngly5hc1otaO1Y7O9gupBborifrGuIXQUqODYfhw5B9YFHMLXLsB9fQM
 fP0ylPUzcM3H9CU+DPeRzP7rNbXZoVh3g20HMKa3spLALLUKWxAZ33uNHvloDoY9Sa
 zBnkN5tYSV2UfGAXcJMzsx/L4qX02viSgF+t/YKJIoaym+aupm12Bo66+K8OQ+XL0d
 vrPHD2CZgJlKKmb10NXkuGNbHK8YAJelFaSVkeJHLSeOI+K+wMX1Ey61VMuoFHahbm
 CB08Q3FSfWljA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: mxsfb: Shutdown the display on system shutdown
Date: Sat,  1 Jan 2022 22:37:55 +0100
Message-Id: <20220101213755.506404-1-marex@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the system shuts down or warm reboots, the display may be active.
Implement the platform_driver .shutdown() operation and shut down the
display.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 6d7a3aeff50b0..375f26d4a4172 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -381,6 +381,13 @@ static int mxsfb_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void mxsfb_shutdown(struct platform_device *pdev)
+{
+	struct drm_device *drm = platform_get_drvdata(pdev);
+
+	drm_atomic_helper_shutdown(drm);
+}
+
 #ifdef CONFIG_PM_SLEEP
 static int mxsfb_suspend(struct device *dev)
 {
@@ -404,6 +411,7 @@ static const struct dev_pm_ops mxsfb_pm_ops = {
 static struct platform_driver mxsfb_platform_driver = {
 	.probe		= mxsfb_probe,
 	.remove		= mxsfb_remove,
+	.shutdown	= mxsfb_shutdown,
 	.driver	= {
 		.name		= "mxsfb",
 		.of_match_table	= mxsfb_dt_ids,
-- 
2.34.1

