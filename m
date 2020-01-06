Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13ACE1313B0
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 15:34:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 049E56E2CF;
	Mon,  6 Jan 2020 14:34:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E69CE6E2E3
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 14:34:19 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id m24so15164814wmc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2020 06:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WlYyDMQH0gvjQUA2TT9iwLz0oGDHsjFYp7ym6IeYABY=;
 b=jor0ts6HGT7OYuIUU70m8g4dUNL6QaAWWrOdqP2HUjMCHqjX1FevVA6m7g+E4tULC7
 o8ig+QE3zXu7AJpCtLNEDs5RNJWP8CN44hgOs617VldbUiz1RnJ2Z1mf8W2vE6WgdeD2
 YRBC2gCMJ41mK+fs8N4/vcqrk2rLMfTBzcuxB0B+awsQKSJ6VXIgsVUJqz7wovZsq3PQ
 C+r5ANeH+d9VMlLNcVx9wmo3a1Kbl3RAX5evH9d8y7dVy/GWibhiG53lE0h2YozZA1ji
 KxX5da0+8sFQRB9Rpfk1vDn/XOF9fqgo4T5qNNke7r7pyeSJmlQlG0A43UdfSfZfYc49
 rxzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WlYyDMQH0gvjQUA2TT9iwLz0oGDHsjFYp7ym6IeYABY=;
 b=l5A8NfffBFwd5PUmRUsOlSklgukJr0f+OCSX3NuYfx9CPci/zxCa//LnS2K1Ov/1/G
 8GxMnEh//SuswqQL+Kz3saBokrSLA+V+dDP0uqN7haEK9+SMs4pYjcsu/t/aGcFHfMn2
 M7E6Lm8Lndt4cfys3U2SBkOolhMRbNfZy04tpNs+Vgoetc5UhBEOKaREDpmqp7oG6Bbi
 GsBikr88fZD/WaHmu/HtzmNGf/gvYPCTJnflDbBK/PQlRyLrQPAa1kWEWmGe1b9Tfk+J
 FXjW+XV0T5LNGJjAuiILcP/LBJgvIN+vVJZjYYh0nBGF7Ulov/Jx+b8K1xwywiOYVxid
 JwdA==
X-Gm-Message-State: APjAAAXcOFo1Y02vbn6Z7vIJiSyp+tn8mP2QOTxqFjXSfF3zchBVlUQ5
 SHkeNpr/6pabxUm3gPEn4VcuAgla96PUXA==
X-Google-Smtp-Source: APXvYqzfkt5Lnm4D9JLsruLOGpBauK+CxRJABy/mWQQx2s9VPKFAj9ANapV5wRUaXY6CNEPQY3uDVw==
X-Received: by 2002:a05:600c:cd:: with SMTP id
 u13mr34975718wmm.24.1578321258273; 
 Mon, 06 Jan 2020 06:34:18 -0800 (PST)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id v17sm73297659wrt.91.2020.01.06.06.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 06:34:17 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 3/4] drm/bridge: Add an ->atomic_check() hook
Date: Mon,  6 Jan 2020 15:34:08 +0100
Message-Id: <20200106143409.32321-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200106143409.32321-1-narmstrong@baylibre.com>
References: <20200106143409.32321-1-narmstrong@baylibre.com>
MIME-Version: 1.0
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Rob Herring <robh+dt@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Boris Brezillon <boris.brezillon@collabora.com>

So that bridge drivers have a way to check/reject an atomic operation.
The drm_atomic_bridge_chain_check() (which is just a wrapper around
the ->atomic_check() hook) is called in place of
drm_bridge_chain_mode_fixup() (when ->atomic_check() is not implemented,
the core falls back on ->mode_fixup(), so the behavior should stay
the same for existing bridge drivers).

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
Changes in v6:
* None

Changes in v5:
* None

Changes in v4:
* Add R-bs

Changes in v3:
* None

Changes in v2:
* Clarify the fact that ->atomic_check() is replacing ->mode_fixup()
---
 drivers/gpu/drm/drm_atomic_helper.c | 12 +++---
 drivers/gpu/drm/drm_bridge.c        | 62 +++++++++++++++++++++++++++++
 include/drm/drm_bridge.h            | 29 +++++++++++++-
 3 files changed, 96 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index ad8eae98d9e8..afe14f72a824 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -437,12 +437,12 @@ mode_fixup(struct drm_atomic_state *state)
 		funcs = encoder->helper_private;
 
 		bridge = drm_bridge_chain_get_first_bridge(encoder);
-		ret = drm_bridge_chain_mode_fixup(bridge,
-					&new_crtc_state->mode,
-					&new_crtc_state->adjusted_mode);
-		if (!ret) {
-			DRM_DEBUG_ATOMIC("Bridge fixup failed\n");
-			return -EINVAL;
+		ret = drm_atomic_bridge_chain_check(bridge,
+						    new_crtc_state,
+						    new_conn_state);
+		if (ret) {
+			DRM_DEBUG_ATOMIC("Bridge atomic check failed\n");
+			return ret;
 		}
 
 		if (funcs && funcs->atomic_check) {
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 872e159fcb42..8e4b799150b0 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -645,6 +645,68 @@ void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL(drm_atomic_bridge_chain_enable);
 
+static int drm_atomic_bridge_check(struct drm_bridge *bridge,
+				   struct drm_crtc_state *crtc_state,
+				   struct drm_connector_state *conn_state)
+{
+	if (bridge->funcs->atomic_check) {
+		struct drm_bridge_state *bridge_state;
+		int ret;
+
+		bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
+							       bridge);
+		if (WARN_ON(!bridge_state))
+			return -EINVAL;
+
+		ret = bridge->funcs->atomic_check(bridge, bridge_state,
+						  crtc_state, conn_state);
+		if (ret)
+			return ret;
+	} else if (bridge->funcs->mode_fixup) {
+		if (!bridge->funcs->mode_fixup(bridge, &crtc_state->mode,
+					       &crtc_state->adjusted_mode))
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+/**
+ * drm_atomic_bridge_chain_check() - Do an atomic check on the bridge chain
+ * @bridge: bridge control structure
+ * @crtc_state: new CRTC state
+ * @conn_state: new connector state
+ *
+ * Calls &drm_bridge_funcs.atomic_check() (falls back on
+ * &drm_bridge_funcs.mode_fixup()) op for all the bridges in the encoder chain,
+ * starting from the last bridge to the first. These are called before calling
+ * &drm_encoder_helper_funcs.atomic_check()
+ *
+ * RETURNS:
+ * 0 on success, a negative error code on failure
+ */
+int drm_atomic_bridge_chain_check(struct drm_bridge *bridge,
+				  struct drm_crtc_state *crtc_state,
+				  struct drm_connector_state *conn_state)
+{
+	struct drm_encoder *encoder = bridge->encoder;
+	struct drm_bridge *iter;
+
+	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
+		int ret;
+
+		ret = drm_atomic_bridge_check(iter, crtc_state, conn_state);
+		if (ret)
+			return ret;
+
+		if (iter == bridge)
+			break;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_atomic_bridge_chain_check);
+
 /**
  * __drm_atomic_helper_bridge_reset() - Initialize a bridge state to its
  *					default
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 52d3ed150618..ae0595c70132 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -128,7 +128,9 @@ struct drm_bridge_funcs {
 	 * this function passes all other callbacks must succeed for this
 	 * configuration.
 	 *
-	 * The @mode_fixup callback is optional.
+	 * The mode_fixup callback is optional. &drm_bridge_funcs.mode_fixup()
+	 * is not called when &drm_bridge_funcs.atomic_check() is implemented,
+	 * so only one of them should be provided.
 	 *
 	 * NOTE:
 	 *
@@ -385,6 +387,28 @@ struct drm_bridge_funcs {
 	void (*atomic_destroy_state)(struct drm_bridge *bridge,
 				     struct drm_bridge_state *state);
 
+	/**
+	 * @atomic_check:
+	 *
+	 * This method is responsible for checking bridge state correctness.
+	 * It can also check the state of the surrounding components in chain
+	 * to make sure the whole pipeline can work properly.
+	 *
+	 * &drm_bridge_funcs.atomic_check() hooks are called in reverse
+	 * order (from the last to the first bridge).
+	 *
+	 * This method is optional. &drm_bridge_funcs.mode_fixup() is not
+	 * called when &drm_bridge_funcs.atomic_check() is implemented, so only
+	 * one of them should be provided.
+	 *
+	 * RETURNS:
+	 * zero if the check passed, a negative error code otherwise.
+	 */
+	int (*atomic_check)(struct drm_bridge *bridge,
+			    struct drm_bridge_state *bridge_state,
+			    struct drm_crtc_state *crtc_state,
+			    struct drm_connector_state *conn_state);
+
 	/**
 	 * @atomic_reset:
 	 *
@@ -552,6 +576,9 @@ void drm_bridge_chain_mode_set(struct drm_bridge *bridge,
 void drm_bridge_chain_pre_enable(struct drm_bridge *bridge);
 void drm_bridge_chain_enable(struct drm_bridge *bridge);
 
+int drm_atomic_bridge_chain_check(struct drm_bridge *bridge,
+				  struct drm_crtc_state *crtc_state,
+				  struct drm_connector_state *conn_state);
 void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
 				     struct drm_atomic_state *state);
 void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
