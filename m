Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F5E859053
	for <lists+dri-devel@lfdr.de>; Sat, 17 Feb 2024 16:03:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B2510E473;
	Sat, 17 Feb 2024 15:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NaZiHiRT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD2210E213;
 Sat, 17 Feb 2024 15:03:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DF901611BE;
 Sat, 17 Feb 2024 15:03:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F4AC43390;
 Sat, 17 Feb 2024 15:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708182183;
 bh=UrO8iSOZ0DaThfpdYnA1yNkyhVkUZHq2oInX+0bHaNU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NaZiHiRTPIbfPSO9V0T+nG2YbfYd4RoH8ksqJQQ1dehfcWd2IBpfDfHByIOYR552k
 nFE6hEIT8qeuW8E1DS42blBrIgHYehI0FYTJGCYTibnUeVmyZJiOsvTtME4KgkAEe1
 2DZMp8TbZu2Mg7JL+VzvP8/SC4bf+EeS4GljpXWaWwPxOIFZ7DYN71gVu5IEEVjh+w
 DzXELAT5AkdX51DLJnuyzx5+kHBA06WxIT15EspnGNlrpCt7XfgVUA4CP7eTv9tjWo
 yjnjggK8Df0jykaNcY2Dpx0NYTW6TsHn3D25leWURtAkgUtuWIOc5QR84HO7i0InVS
 Lg+4YkPkvcdxQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan+linaro@kernel.org>) id 1rbMDW-000000001Vq-2fLy;
 Sat, 17 Feb 2024 16:03:02 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Vinod Koul <vkoul@kernel.org>
Cc: Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 2/6] drm/bridge: aux-hpd: separate allocation and registration
Date: Sat, 17 Feb 2024 16:02:24 +0100
Message-ID: <20240217150228.5788-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240217150228.5788-1-johan+linaro@kernel.org>
References: <20240217150228.5788-1-johan+linaro@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Combining allocation and registration is an anti-pattern that should be
avoided. Add two new functions for allocating and registering an dp-hpd
bridge with a proper 'devm' prefix so that it is clear that these are
device managed interfaces.

	devm_drm_dp_hpd_bridge_alloc()
	devm_drm_dp_hpd_bridge_add()

The new interface will be used to fix a use-after-free bug in the
Qualcomm PMIC GLINK driver and may prevent similar issues from being
introduced elsewhere.

The existing drm_dp_hpd_bridge_register() is reimplemented using the
above and left in place for now.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/gpu/drm/bridge/aux-hpd-bridge.c | 67 +++++++++++++++++++------
 include/drm/bridge/aux-bridge.h         | 15 ++++++
 2 files changed, 67 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index 9e71daf95bde..6886db2d9e00 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -30,16 +30,13 @@ static void drm_aux_hpd_bridge_release(struct device *dev)
 	kfree(adev);
 }
 
-static void drm_aux_hpd_bridge_unregister_adev(void *_adev)
+static void drm_aux_hpd_bridge_free_adev(void *_adev)
 {
-	struct auxiliary_device *adev = _adev;
-
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
+	auxiliary_device_uninit(_adev);
 }
 
 /**
- * drm_dp_hpd_bridge_register - Create a simple HPD DisplayPort bridge
+ * devm_drm_dp_hpd_bridge_alloc - allocate a HPD DisplayPort bridge
  * @parent: device instance providing this bridge
  * @np: device node pointer corresponding to this bridge instance
  *
@@ -47,11 +44,9 @@ static void drm_aux_hpd_bridge_unregister_adev(void *_adev)
  * DRM_MODE_CONNECTOR_DisplayPort, which terminates the bridge chain and is
  * able to send the HPD events.
  *
- * Return: device instance that will handle created bridge or an error code
- * encoded into the pointer.
+ * Return: bridge auxiliary device pointer or an error pointer
  */
-struct device *drm_dp_hpd_bridge_register(struct device *parent,
-					  struct device_node *np)
+struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent, struct device_node *np)
 {
 	struct auxiliary_device *adev;
 	int ret;
@@ -82,13 +77,55 @@ struct device *drm_dp_hpd_bridge_register(struct device *parent,
 		return ERR_PTR(ret);
 	}
 
-	ret = auxiliary_device_add(adev);
-	if (ret) {
-		auxiliary_device_uninit(adev);
+	ret = devm_add_action_or_reset(parent, drm_aux_hpd_bridge_free_adev, adev);
+	if (ret)
 		return ERR_PTR(ret);
-	}
 
-	ret = devm_add_action_or_reset(parent, drm_aux_hpd_bridge_unregister_adev, adev);
+	return adev;
+}
+EXPORT_SYMBOL_GPL(devm_drm_dp_hpd_bridge_alloc);
+
+static void drm_aux_hpd_bridge_del_adev(void *_adev)
+{
+	auxiliary_device_delete(_adev);
+}
+
+/**
+ * devm_drm_dp_hpd_bridge_add - register a HDP DisplayPort bridge
+ * @dev: struct device to tie registration lifetime to
+ * @adev: bridge auxiliary device to be registered
+ *
+ * Returns: zero on success or a negative errno
+ */
+int devm_drm_dp_hpd_bridge_add(struct device *dev, struct auxiliary_device *adev)
+{
+	int ret;
+
+	ret = auxiliary_device_add(adev);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev, drm_aux_hpd_bridge_del_adev, adev);
+}
+EXPORT_SYMBOL_GPL(devm_drm_dp_hpd_bridge_add);
+
+/**
+ * drm_dp_hpd_bridge_register - allocate and register a HDP DisplayPort bridge
+ * @parent: device instance providing this bridge
+ * @np: device node pointer corresponding to this bridge instance
+ *
+ * Return: device instance that will handle created bridge or an error pointer
+ */
+struct device *drm_dp_hpd_bridge_register(struct device *parent, struct device_node *np)
+{
+	struct auxiliary_device *adev;
+	int ret;
+
+	adev = devm_drm_dp_hpd_bridge_alloc(parent, np);
+	if (IS_ERR(adev))
+		return ERR_CAST(adev);
+
+	ret = devm_drm_dp_hpd_bridge_add(parent, adev);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
index c4c423e97f06..4453906105ca 100644
--- a/include/drm/bridge/aux-bridge.h
+++ b/include/drm/bridge/aux-bridge.h
@@ -9,6 +9,8 @@
 
 #include <drm/drm_connector.h>
 
+struct auxiliary_device;
+
 #if IS_ENABLED(CONFIG_DRM_AUX_BRIDGE)
 int drm_aux_bridge_register(struct device *parent);
 #else
@@ -19,10 +21,23 @@ static inline int drm_aux_bridge_register(struct device *parent)
 #endif
 
 #if IS_ENABLED(CONFIG_DRM_AUX_HPD_BRIDGE)
+struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent, struct device_node *np);
+int devm_drm_dp_hpd_bridge_add(struct device *dev, struct auxiliary_device *adev);
 struct device *drm_dp_hpd_bridge_register(struct device *parent,
 					  struct device_node *np);
 void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status);
 #else
+static inline struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent,
+								    struct device_node *np)
+{
+	return NULL;
+}
+
+static inline int devm_drm_dp_hpd_bridge_add(struct auxiliary_device *adev)
+{
+	return 0;
+}
+
 static inline struct device *drm_dp_hpd_bridge_register(struct device *parent,
 							struct device_node *np)
 {
-- 
2.43.0

