Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B2647D7CD
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 20:33:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B898710E1ED;
	Wed, 22 Dec 2021 19:33:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp09.smtpout.orange.fr
 [80.12.242.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478F810E1ED
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 19:33:53 +0000 (UTC)
Received: from pop-os.home ([86.243.171.122]) by smtp.orange.fr with ESMTPA
 id 07MznESxgf6fn07MznJHFa; Wed, 22 Dec 2021 20:33:51 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Wed, 22 Dec 2021 20:33:51 +0100
X-ME-IP: 86.243.171.122
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: robdclark@gmail.com, sean@poorly.run, quic_abhinavk@quicinc.com,
 airlied@linux.ie, daniel@ffwll.ch, swboyd@chromium.org,
 bjorn.andersson@linaro.org
Subject: [PATCH] drm/msm/dp: Simplify dp_debug_init() and dp_debug_get()
Date: Wed, 22 Dec 2021 20:33:47 +0100
Message-Id: <dc2d6f535379dd38a5e3f9ba502f1f2b3d1f56b7.1640201523.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dp_debug_init() always returns 0. So, make it a void function and simplify
the only caller accordingly.

While at it remove a useless 'rc' initialization in dp_debug_get()

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/msm/dp/dp_debug.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index da4323556ef3..338f1f9c4d14 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -207,9 +207,8 @@ static const struct file_operations test_active_fops = {
 	.write = dp_test_active_write
 };
 
-static int dp_debug_init(struct dp_debug *dp_debug, struct drm_minor *minor)
+static void dp_debug_init(struct dp_debug *dp_debug, struct drm_minor *minor)
 {
-	int rc = 0;
 	struct dp_debug_private *debug = container_of(dp_debug,
 			struct dp_debug_private, dp_debug);
 
@@ -229,17 +228,15 @@ static int dp_debug_init(struct dp_debug *dp_debug, struct drm_minor *minor)
 			debug, &dp_test_type_fops);
 
 	debug->root = minor->debugfs_root;
-
-	return rc;
 }
 
 struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
 		struct dp_usbpd *usbpd, struct dp_link *link,
 		struct drm_connector *connector, struct drm_minor *minor)
 {
-	int rc = 0;
 	struct dp_debug_private *debug;
 	struct dp_debug *dp_debug;
+	int rc;
 
 	if (!dev || !panel || !usbpd || !link) {
 		DRM_ERROR("invalid input\n");
@@ -266,11 +263,7 @@ struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
 	dp_debug->hdisplay = 0;
 	dp_debug->vrefresh = 0;
 
-	rc = dp_debug_init(dp_debug, minor);
-	if (rc) {
-		devm_kfree(dev, debug);
-		goto error;
-	}
+	dp_debug_init(dp_debug, minor);
 
 	return dp_debug;
  error:
-- 
2.32.0

