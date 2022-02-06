Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B786E4AB053
	for <lists+dri-devel@lfdr.de>; Sun,  6 Feb 2022 16:44:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3CEA10E245;
	Sun,  6 Feb 2022 15:44:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E0C410E136
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Feb 2022 15:44:24 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id cc40e8ca-8763-11ec-b20b-0050568c148b;
 Sun, 06 Feb 2022 15:45:24 +0000 (UTC)
Received: from saturn.lan (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id D9718194BCF;
 Sun,  6 Feb 2022 16:44:21 +0100 (CET)
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v1 1/9] drm/bridge: add DRM_BRIDGE_STATE_OPS macro
Date: Sun,  6 Feb 2022 16:43:57 +0100
Message-Id: <20220206154405.1243333-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220206154405.1243333-1-sam@ravnborg.org>
References: <20220206154405.1243333-1-sam@ravnborg.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Philip Chen <philipchen@chromium.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DRM_BRIDGE_STATE_OPS can be used as shortcut for bridge drivers that
do not subclass drm_bridge_state to assign the default operations for
reset, duplicate and destroy of the state.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/drm/drm_bridge.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 061d87313fac..fc00304be643 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -935,4 +935,16 @@ static inline struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
 }
 #endif
 
+/**
+ * DRM_BRIDGE_STATE_OPS - Default drm_bridge state funcs
+ *
+ * Bridge driver that do not subclass &drm_bridge_state can use the helpers
+ * for reset, duplicate, and destroy. This macro provides a shortcut for
+ * setting the helpers in the &drm_bridge_funcs structure.
+ */
+#define DRM_BRIDGE_STATE_OPS \
+	.atomic_reset = drm_atomic_helper_bridge_reset,				\
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,	\
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state
+
 #endif
-- 
2.32.0

