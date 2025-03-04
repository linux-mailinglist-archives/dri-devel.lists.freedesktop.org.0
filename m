Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19356A4DC05
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 12:11:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A7010E593;
	Tue,  4 Mar 2025 11:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uFJRYKrG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3262F10E58F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 11:11:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CF6D55C5B19;
 Tue,  4 Mar 2025 11:09:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02EF4C4CEE5;
 Tue,  4 Mar 2025 11:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741086690;
 bh=zLb35gCnwj3cDqgAv/299qLDd0Z23b2Wt1wKwdm5r60=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=uFJRYKrGniwCWEm2PjycnmEPlf8epnFn2wF6iTyx0Y9om2TCDgDfyyOpyHyx25zwZ
 hB1wcslGEEHxHv3fjTGb5c1BksV/MDHTru8D/482amixM1KEOoFgpp6nmVmSfaEOMd
 0HRne7rp08vvP9uinbmJ4F7Map36zIQaLQdNIxIEniD5T8QXHu41rai1YoTnmv9F27
 8mui9DJqWB7H3QmAZhshRONiPFyNWw5KxnG+6WNgIZLN0bWYLz2FH0oIt+dN1bk3KK
 ibPq3cYKCmIHPvGPRDB7eGbfQ54jNukZ4JhOk4PkkfTb7009t/y/Mgv05wSZ6zhxZM
 850htHPVG3SLA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Mar 2025 12:10:53 +0100
Subject: [PATCH v5 10/16] drm/bridge: ti-sn65dsi83: Switch to
 drm_bridge_helper_reset_crtc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-bridge-connector-v5-10-aacf461d2157@kernel.org>
References: <20250304-bridge-connector-v5-0-aacf461d2157@kernel.org>
In-Reply-To: <20250304-bridge-connector-v5-0-aacf461d2157@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: Herve Codina <herve.codina@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2488; i=mripard@kernel.org;
 h=from:subject:message-id; bh=zLb35gCnwj3cDqgAv/299qLDd0Z23b2Wt1wKwdm5r60=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnH7h846DXd5pzWF86ZWemXJTYmmX85ND3kpspn5qov8
 4ol7kgkdUxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJVCxhrFO5sXaZl/rWwISQ
 Xyszgq8xpkQrZtQsYix7KL47jU1sddUVxVKXe/2lAm9CPCepVFi+Zqwz8z3P/33P/rAZbCyN++r
 KXp/J/VYbr5ZXyfpMkPFJ0LUlAaXf0gQSowXMf2uWz39WMw8A
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

Now that we have a helper for bridge drivers to call to reset the output
pipeline, let's use it.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 7122a3ebd88399ed32420fcaf9f1f9384d031d2d..53cc4cfb0c884f6a410e3df2c4df4572f89c0768 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -38,11 +38,11 @@
 #include <linux/timer.h>
 #include <linux/workqueue.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
-#include <drm/drm_drv.h> /* DRM_MODESET_LOCK_ALL_BEGIN() needs drm_drv_uses_atomic_modeset() */
+#include <drm/drm_bridge_helper.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
@@ -369,11 +369,10 @@ static u8 sn65dsi83_get_dsi_div(struct sn65dsi83 *ctx)
 	return dsi_div - 1;
 }
 
 static int sn65dsi83_reset_pipe(struct sn65dsi83 *sn65dsi83)
 {
-	struct drm_device *dev = sn65dsi83->bridge.dev;
 	struct drm_modeset_acquire_ctx ctx;
 	int err;
 
 	/*
 	 * Reset active outputs of the related CRTC.
@@ -384,30 +383,25 @@ static int sn65dsi83_reset_pipe(struct sn65dsi83 *sn65dsi83)
 	 * bridge.
 	 *
 	 * Keep the lock during the whole operation to be atomic.
 	 */
 
-	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, err);
-
-	if (!sn65dsi83->bridge.encoder->crtc) {
-		/*
-		 * No CRTC attached -> No CRTC active outputs to reset
-		 * This can happen when the SN65DSI83 is reset. Simply do
-		 * nothing without returning any errors.
-		 */
-		err = 0;
-		goto end;
-	}
+	drm_modeset_acquire_init(&ctx, 0);
 
 	dev_warn(sn65dsi83->dev, "reset the pipe\n");
 
-	err = drm_atomic_helper_reset_crtc(sn65dsi83->bridge.encoder->crtc, &ctx);
+retry:
+	err = drm_bridge_helper_reset_crtc(&sn65dsi83->bridge, &ctx);
+	if (err == -EDEADLK) {
+		drm_modeset_backoff(&ctx);
+		goto retry;
+	}
 
-end:
-	DRM_MODESET_LOCK_ALL_END(dev, ctx, err);
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
 
-	return err;
+	return 0;
 }
 
 static void sn65dsi83_reset_work(struct work_struct *ws)
 {
 	struct sn65dsi83 *ctx = container_of(ws, struct sn65dsi83, reset_work);

-- 
2.48.1

