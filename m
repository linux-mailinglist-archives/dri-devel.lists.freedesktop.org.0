Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D2FAEBDEB
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 18:57:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C0D10E065;
	Fri, 27 Jun 2025 16:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="OJH78uAj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9D410E065
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 16:57:05 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250627165703euoutp01e1f8adb4c81def3243a7a7074ba46ad0~M9LdcKzYP1195211952euoutp01j
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 16:57:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250627165703euoutp01e1f8adb4c81def3243a7a7074ba46ad0~M9LdcKzYP1195211952euoutp01j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1751043423;
 bh=jYsitYKU+PmHAUVmJqwFenlYjSVeY6ckjafXrLogHoQ=;
 h=From:To:Cc:Subject:Date:References:From;
 b=OJH78uAj4MFvAZQixHrsdjnpnJDA3VRwiAUpOQ//IJage7n1TKTVMI1imjPeMdyrZ
 c7uA3/MmenMnCYxUT7ne0y9qFhzlEDu7TfF4Icez6W84PIi1mG2uk/k7XNGqYlst+v
 W2tFSzhrwMyrwM8PEhRrdp+ZzRSXXOtgzw7W7Wuk=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250627165702eucas1p12dbc50fea261d6846e67880bbef5c564~M9Lc4pquY1399213992eucas1p1R;
 Fri, 27 Jun 2025 16:57:02 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250627165702eusmtip265fab7463f1d21e12c046975a63d93f8~M9LcHSwpO3091830918eusmtip2Q;
 Fri, 27 Jun 2025 16:57:02 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Douglas Anderson <dianders@chromium.org>, Damon Ding
 <damon.ding@rock-chips.com>, Maxime Ripard <mripard@kernel.org>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH] drm/bridge: analogix_dp: Use devm_drm_bridge_alloc() API
Date: Fri, 27 Jun 2025 18:56:52 +0200
Message-Id: <20250627165652.580798-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250627165702eucas1p12dbc50fea261d6846e67880bbef5c564
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250627165702eucas1p12dbc50fea261d6846e67880bbef5c564
X-EPHeader: CA
X-CMS-RootMailID: 20250627165702eucas1p12dbc50fea261d6846e67880bbef5c564
References: <CGME20250627165702eucas1p12dbc50fea261d6846e67880bbef5c564@eucas1p1.samsung.com>
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

devm_drm_bridge_alloc() is the new API to be used for allocating
(and partially initializing) a private driver struct embedding
a struct drm_bridge.

Analogix DP driver somehow missed the automated conversion in commit
9c399719cfb9 ("drm: convert many bridge drivers from devm_kzalloc() to
devm_drm_bridge_alloc() API"), what causes the following warning:

------------[ cut here ]------------
WARNING: lib/refcount.c:25 at drm_bridge_attach+0x2c/0x248, CPU#1: kworker/u8:1/34
refcount_t: addition on 0; use-after-free.
Modules linked in:
CPU: 1 UID: 0 PID: 34 Comm: kworker/u8:1 Not tainted 6.16.0-rc3-next-20250627-dirty #15839 PREEMPT
Hardware name: Samsung Exynos (Flattened Device Tree)
Workqueue: events_unbound deferred_probe_work_func
Call trace:
 unwind_backtrace from show_stack+0x10/0x14
 show_stack from dump_stack_lvl+0x68/0x88
 dump_stack_lvl from __warn+0x94/0x1f0
 __warn from warn_slowpath_fmt+0x124/0x1bc
 warn_slowpath_fmt from drm_bridge_attach+0x2c/0x248
 drm_bridge_attach from analogix_dp_bind+0x70/0xc8
 analogix_dp_bind from exynos_dp_bind+0x58/0xc4
 exynos_dp_bind from component_bind_all+0x11c/0x27c
 component_bind_all from exynos_drm_bind+0xe8/0x198
 exynos_drm_bind from try_to_bring_up_aggregate_device+0x200/0x2d8
 try_to_bring_up_aggregate_device from __component_add+0xb0/0x170
 __component_add from exynos_dp_probe+0xc0/0x164
 exynos_dp_probe from platform_probe+0x5c/0xb8
 platform_probe from really_probe+0xe0/0x3d8
 really_probe from __driver_probe_device+0x9c/0x1e0
 __driver_probe_device from driver_probe_device+0x30/0xc0
 driver_probe_device from __device_attach_driver+0xa8/0x120
 __device_attach_driver from bus_for_each_drv+0x84/0xdc
 bus_for_each_drv from __device_attach+0xb0/0x20c
 __device_attach from bus_probe_device+0x8c/0x90
 bus_probe_device from deferred_probe_work_func+0x98/0xe0
 deferred_probe_work_func from process_one_work+0x24c/0x70c
 process_one_work from worker_thread+0x1b8/0x3bc
 worker_thread from kthread+0x13c/0x264
 kthread from ret_from_fork+0x14/0x28
...
---[ end trace 0000000000000000 ]---

Fix this by switching the driver to the new API.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 40 +++++--------------
 .../drm/bridge/analogix/analogix_dp_core.h    |  3 +-
 2 files changed, 13 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index a1bc3e96dd35..ed35e567d117 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1041,7 +1041,7 @@ static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
 				     struct drm_encoder *encoder,
 				     enum drm_bridge_attach_flags flags)
 {
-	struct analogix_dp_device *dp = bridge->driver_private;
+	struct analogix_dp_device *dp = to_dp(bridge);
 	struct drm_connector *connector = NULL;
 	int ret = 0;
 
@@ -1125,7 +1125,7 @@ struct drm_crtc *analogix_dp_get_new_crtc(struct analogix_dp_device *dp,
 static void analogix_dp_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 						 struct drm_atomic_state *old_state)
 {
-	struct analogix_dp_device *dp = bridge->driver_private;
+	struct analogix_dp_device *dp = to_dp(bridge);
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
 
@@ -1180,7 +1180,7 @@ static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
 static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 					     struct drm_atomic_state *old_state)
 {
-	struct analogix_dp_device *dp = bridge->driver_private;
+	struct analogix_dp_device *dp = to_dp(bridge);
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
 	int timeout_loop = 0;
@@ -1217,7 +1217,7 @@ static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 
 static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
 {
-	struct analogix_dp_device *dp = bridge->driver_private;
+	struct analogix_dp_device *dp = to_dp(bridge);
 
 	if (dp->dpms_mode != DRM_MODE_DPMS_ON)
 		return;
@@ -1240,7 +1240,7 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
 static void analogix_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 					      struct drm_atomic_state *old_state)
 {
-	struct analogix_dp_device *dp = bridge->driver_private;
+	struct analogix_dp_device *dp = to_dp(bridge);
 	struct drm_crtc *old_crtc, *new_crtc;
 	struct drm_crtc_state *old_crtc_state = NULL;
 	struct drm_crtc_state *new_crtc_state = NULL;
@@ -1278,7 +1278,7 @@ static void analogix_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 static void analogix_dp_bridge_atomic_post_disable(struct drm_bridge *bridge,
 						   struct drm_atomic_state *old_state)
 {
-	struct analogix_dp_device *dp = bridge->driver_private;
+	struct analogix_dp_device *dp = to_dp(bridge);
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *new_crtc_state;
 	int ret;
@@ -1300,7 +1300,7 @@ static void analogix_dp_bridge_mode_set(struct drm_bridge *bridge,
 				const struct drm_display_mode *orig_mode,
 				const struct drm_display_mode *mode)
 {
-	struct analogix_dp_device *dp = bridge->driver_private;
+	struct analogix_dp_device *dp = to_dp(bridge);
 	struct drm_display_info *display_info = &dp->connector.display_info;
 	struct video_info *video = &dp->video_info;
 	struct device_node *dp_node = dp->dev->of_node;
@@ -1385,25 +1385,6 @@ static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
 	.attach = analogix_dp_bridge_attach,
 };
 
-static int analogix_dp_create_bridge(struct drm_device *drm_dev,
-				     struct analogix_dp_device *dp)
-{
-	struct drm_bridge *bridge;
-
-	bridge = devm_kzalloc(drm_dev->dev, sizeof(*bridge), GFP_KERNEL);
-	if (!bridge) {
-		DRM_ERROR("failed to allocate for drm bridge\n");
-		return -ENOMEM;
-	}
-
-	dp->bridge = bridge;
-
-	bridge->driver_private = dp;
-	bridge->funcs = &analogix_dp_bridge_funcs;
-
-	return drm_bridge_attach(dp->encoder, bridge, NULL, 0);
-}
-
 static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
 {
 	struct device_node *dp_node = dp->dev->of_node;
@@ -1491,7 +1472,8 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 		return ERR_PTR(-EINVAL);
 	}
 
-	dp = devm_kzalloc(dev, sizeof(struct analogix_dp_device), GFP_KERNEL);
+	dp = devm_drm_bridge_alloc(dev, struct analogix_dp_device, bridge,
+				   &analogix_dp_bridge_funcs);
 	if (!dp)
 		return ERR_PTR(-ENOMEM);
 
@@ -1643,7 +1625,7 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
 		return ret;
 	}
 
-	ret = analogix_dp_create_bridge(drm_dev, dp);
+	ret = drm_bridge_attach(dp->encoder, &dp->bridge, NULL, 0);
 	if (ret) {
 		DRM_ERROR("failed to create bridge (%d)\n", ret);
 		goto err_unregister_aux;
@@ -1660,7 +1642,7 @@ EXPORT_SYMBOL_GPL(analogix_dp_bind);
 
 void analogix_dp_unbind(struct analogix_dp_device *dp)
 {
-	analogix_dp_bridge_disable(dp->bridge);
+	analogix_dp_bridge_disable(&dp->bridge);
 	dp->connector.funcs->destroy(&dp->connector);
 
 	drm_panel_unprepare(dp->plat_data->panel);
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index 2b54120ba4a3..b86e93f30ed6 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -11,6 +11,7 @@
 
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_crtc.h>
+#include <drm/drm_bridge.h>
 
 #define DP_TIMEOUT_LOOP_COUNT 100
 #define MAX_CR_LOOP 5
@@ -154,7 +155,7 @@ struct analogix_dp_device {
 	struct device		*dev;
 	struct drm_device	*drm_dev;
 	struct drm_connector	connector;
-	struct drm_bridge	*bridge;
+	struct drm_bridge	bridge;
 	struct drm_dp_aux       aux;
 	struct clk		*clock;
 	unsigned int		irq;
-- 
2.34.1

