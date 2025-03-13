Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EAAA5F396
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 13:00:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B1410E86D;
	Thu, 13 Mar 2025 12:00:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IlceUVVa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9232310E86B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 12:00:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4073B5C5D93;
 Thu, 13 Mar 2025 11:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FEA0C4AF09;
 Thu, 13 Mar 2025 12:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741867235;
 bh=PP4+cvT7+0DeLYcQyZYn6yS9W7xkv5JVcjFqL2cYdYc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=IlceUVVaKrJgABzdc5jbHw5HoRkMLfLgQXiHkw/lItdEojAXdsqiuo8a1mUttvKgm
 ik62B3mQ31P5K6KXadVWaMTTi1fxFkvSn26mK5bs4BLRAI3lIHOqAGp2+s4mUenbbY
 1wEpn7DEEYLu9zdzd/pAtgqjo76ikwOnOoHOOpd/TKdm/sr3/x4J8dAFNUy43sVUhF
 EItBYKbMRg30wvsjun0TVJ2ZI3O8Vl77ZWSWF3jqPj0mHQ6Z8jsh4NjH46cceBwuY/
 YZKpM4NeCAilsST/wDE1BEBr/q/mHOHqpFabcVsSKITUptNuhewsed4SuGmTE51Fnc
 0uhrSz86g78gQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 13 Mar 2025 13:00:02 +0100
Subject: [PATCH v6 08/16] drm/bridge: Add helper to reset bridge pipeline
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-bridge-connector-v6-8-511c54a604fb@kernel.org>
References: <20250313-bridge-connector-v6-0-511c54a604fb@kernel.org>
In-Reply-To: <20250313-bridge-connector-v6-0-511c54a604fb@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: Herve Codina <herve.codina@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Simona Vetter <simona.vetter@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4759; i=mripard@kernel.org;
 h=from:subject:message-id; bh=PP4+cvT7+0DeLYcQyZYn6yS9W7xkv5JVcjFqL2cYdYc=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOmXThxmsRcrffC3s1v39O/e0wzhwaU75YN+X3gfWC7tH
 5Tqci+5o5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABOZ9omRoUtbpYU/PmXu2W/x
 VU//KRxetv24jfes6Wtv3w0/kPJLXZOR4buCq+4LhS+8FzaEFaYpLld9furMyXtCd7cvCH1Tacj
 0nAEA
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

Let's provide an helper to make it easier for bridge drivers to
power-cycle their bridge.

In order to avoid a circular dependency between that new helper and
drm_atomic_helper_reset_crtc(), this new helper will be in a
drm_bridge_helper.c file to follow the pattern we have for other
objects.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
Tested-by: Herve Codina <herve.codina@bootlin.com>
Co-developed-by: Simona Vetter <simona.vetter@intel.com>
Signed-off-by: Simona Vetter <simona.vetter@intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/Makefile            |  1 +
 drivers/gpu/drm/drm_atomic_helper.c |  3 ++
 drivers/gpu/drm/drm_bridge_helper.c | 58 +++++++++++++++++++++++++++++++++++++
 include/drm/drm_bridge_helper.h     | 12 ++++++++
 4 files changed, 74 insertions(+)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 4cd054188faf0b3dec442efd99ae52604541bce1..5a332f7d3ecccb6e5e1fb9fb811eab7aa5a84a21 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -131,10 +131,11 @@ obj-$(CONFIG_DRM_TTM_HELPER) += drm_ttm_helper.o
 #
 
 drm_kms_helper-y := \
 	drm_atomic_helper.o \
 	drm_atomic_state_helper.o \
+	drm_bridge_helper.o \
 	drm_crtc_helper.o \
 	drm_damage_helper.o \
 	drm_flip_work.o \
 	drm_format_helper.o \
 	drm_gem_atomic_helper.o \
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 5302ab3248985d3e0a47e40fd3deb7ad0d9f775b..ee64ca1b1becc74336a8919c60a73656e23e0047 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -3407,10 +3407,13 @@ EXPORT_SYMBOL(drm_atomic_helper_disable_all);
  *
  * Reset the active outputs by indicating that connectors have changed.
  * This implies a reset of all active components available between the CRTC and
  * connectors.
  *
+ * A variant of this function exists with
+ * drm_bridge_helper_reset_crtc(), dedicated to bridges.
+ *
  * NOTE: This relies on resetting &drm_crtc_state.connectors_changed.
  * For drivers which optimize out unnecessary modesets this will result in
  * a no-op commit, achieving nothing.
  *
  * Returns:
diff --git a/drivers/gpu/drm/drm_bridge_helper.c b/drivers/gpu/drm/drm_bridge_helper.c
new file mode 100644
index 0000000000000000000000000000000000000000..af80d249619495fc63df3b4a1e3425e7f938a4d2
--- /dev/null
+++ b/drivers/gpu/drm/drm_bridge_helper.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_bridge_helper.h>
+#include <drm/drm_modeset_lock.h>
+
+/**
+ * drm_bridge_helper_reset_crtc - Reset the pipeline feeding a bridge
+ * @bridge: DRM bridge to reset
+ * @ctx: lock acquisition context
+ *
+ * Reset a @bridge pipeline. It will power-cycle all active components
+ * between the CRTC and connector that bridge is connected to.
+ *
+ * As it relies on drm_atomic_helper_reset_crtc(), the same limitations
+ * apply.
+ *
+ * Returns:
+ *
+ * 0 on success or a negative error code on failure. If the error
+ * returned is EDEADLK, the whole atomic sequence must be restarted.
+ */
+int drm_bridge_helper_reset_crtc(struct drm_bridge *bridge,
+				 struct drm_modeset_acquire_ctx *ctx)
+{
+	struct drm_connector *connector;
+	struct drm_encoder *encoder = bridge->encoder;
+	struct drm_device *dev = encoder->dev;
+	struct drm_crtc *crtc;
+	int ret;
+
+	ret = drm_modeset_lock(&dev->mode_config.connection_mutex, ctx);
+	if (ret)
+		return ret;
+
+	connector = drm_atomic_get_connector_for_encoder(encoder, ctx);
+	if (IS_ERR(connector)) {
+		ret = PTR_ERR(connector);
+		goto out;
+	}
+
+	if (!connector->state) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	crtc = connector->state->crtc;
+	ret = drm_atomic_helper_reset_crtc(crtc, ctx);
+	if (ret)
+		goto out;
+
+out:
+	drm_modeset_unlock(&dev->mode_config.connection_mutex);
+	return ret;
+}
+EXPORT_SYMBOL(drm_bridge_helper_reset_crtc);
diff --git a/include/drm/drm_bridge_helper.h b/include/drm/drm_bridge_helper.h
new file mode 100644
index 0000000000000000000000000000000000000000..6c35b479ec2a84aa43283351a6f18e49a9f9c177
--- /dev/null
+++ b/include/drm/drm_bridge_helper.h
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#ifndef __DRM_BRIDGE_HELPER_H_
+#define __DRM_BRIDGE_HELPER_H_
+
+struct drm_bridge;
+struct drm_modeset_acquire_ctx;
+
+int drm_bridge_helper_reset_crtc(struct drm_bridge *bridge,
+				 struct drm_modeset_acquire_ctx *ctx);
+
+#endif // __DRM_BRIDGE_HELPER_H_

-- 
2.48.1

