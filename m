Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 354F0749865
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 11:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B47B10E4B0;
	Thu,  6 Jul 2023 09:27:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA1610E4B0
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 09:27:45 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qHLGz-0003il-G2; Thu, 06 Jul 2023 11:27:37 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qHLGy-00CTMC-BF; Thu, 06 Jul 2023 11:27:36 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qHLGx-002hJz-Ed; Thu, 06 Jul 2023 11:27:35 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Shawn Guo <shawnguo@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH] drm/imx/lcdc: Fix double-free of driver data
Date: Thu,  6 Jul 2023 11:27:31 +0200
Message-Id: <20230706092731.2630232-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1463;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=LFFWTR0v5MRckEHpX12gNJdtez51YngzScd4wmI0TgU=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkpokCd4YwGFQWV2+ZCFv4xGyCwQW8vpcVSK96n
 wr67TzaZU6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZKaJAgAKCRCPgPtYfRL+
 Tj8QB/9WSdtw84PPgj/lRDx0CkcTh8z756TdCSvh4d8jovxLCmawg8XvTIHStRcPcLUWtmUepgN
 Ar+p/ZfEcUPKKkpldw/zkGlZps6u8BfoGjD93Q/v/qUqlwgt7l5BvpSQDSrUkZIeR06dKtmIZ9O
 d37jivumTMX5OuZEar8fnorK0A6C6iTgVoX9dV+Wztt6C1GilBQd9mr5ecieluhtGQJvDpuS18v
 fDM/UapCjv9YcFSsKOFie1Xk4kSl3wKXu5SpqFuzRb5rsfaMsuqKINQRPP5CGp7DRyQhJALFiP+
 Bz5w8Y5F1Z+f0LoWxKP5tpy1cJjIH8ciWfaow/2FUTdVGDDi
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
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
Cc: dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The struct imx_lcdc driver data is allocated using devm_drm_dev_alloc()
so it must not be explicitly kfree()d.

Also drm_kms_helper_poll_fini() should not be called as there is no
matching drm_kms_helper_poll_init(). So drop the release function
completely.

Fixes: c87e859cdeb5 ("drm/imx/lcdc: Implement DRM driver for imx25")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
index 8e6d457917da..7bd433847824 100644
--- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
+++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
@@ -342,21 +342,12 @@ static const struct drm_mode_config_helper_funcs imx_lcdc_mode_config_helpers =
 	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
 };
 
-static void imx_lcdc_release(struct drm_device *drm)
-{
-	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(drm);
-
-	drm_kms_helper_poll_fini(drm);
-	kfree(lcdc);
-}
-
 DEFINE_DRM_GEM_DMA_FOPS(imx_lcdc_drm_fops);
 
 static struct drm_driver imx_lcdc_drm_driver = {
 	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.fops = &imx_lcdc_drm_fops,
 	DRM_GEM_DMA_DRIVER_OPS_VMAP,
-	.release = imx_lcdc_release,
 	.name = "imx-lcdc",
 	.desc = "i.MX LCDC driver",
 	.date = "20200716",

base-commit: 6995e2de6891c724bfeb2db33d7b87775f913ad1
-- 
2.39.2

