Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1E6A44689
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 17:44:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38CD910E1C7;
	Tue, 25 Feb 2025 16:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s+IXwaoY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C5F10E1B1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 16:44:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9EF2D612AD;
 Tue, 25 Feb 2025 16:44:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF8E8C4CEE8;
 Tue, 25 Feb 2025 16:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740501856;
 bh=A6ouo6ovEkcY8CdYz8vQoee+XUsbhVfQnidOvEECRgU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=s+IXwaoYdFeKkcJffl8R9V5dSbVPd4IlRZTXF6RgYarT2dC7guRBzzXovboh1LdRT
 8XiFvNsAylmvROLx1mbPCaxhs6tm85FakEyXvFnRX8rB2Mbij9DrbJDMxlFR2ls4N+
 BfgcH2zs2w+mP2yxOaJwyZ1FIwB2QHPlJmI2fetNky/J4jmwcSFgrFVksY2Sxk1l15
 1SwveUAENLSxnFF+8S7N50xSsWjGIhfxRvFVs32VqZOL0PglZkDSTomHLeayyzHkmz
 pHjq3ZxVzO+xA152u4X1gBDtgPSQRPjx5isNyql3IG65aoJmhc3SU66chJchSIfhNW
 WQjFSIDNBZzcA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 25 Feb 2025 17:43:52 +0100
Subject: [PATCH v4 04/15] drm/atomic: Introduce helper to lookup connector
 by encoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-bridge-connector-v4-4-7ecb07b09cad@kernel.org>
References: <20250225-bridge-connector-v4-0-7ecb07b09cad@kernel.org>
In-Reply-To: <20250225-bridge-connector-v4-0-7ecb07b09cad@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: Herve Codina <herve.codina@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3895; i=mripard@kernel.org;
 h=from:subject:message-id; bh=A6ouo6ovEkcY8CdYz8vQoee+XUsbhVfQnidOvEECRgU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOl7P3sbrjY5aWW9et5xFk2TL/mrHi+7brhI1/WXFnMEr
 0VAju+8jqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjART0bGhlffLH33ZSZaWbL+
 ie+fMCnL7eHB3WYn9k5PbeUsCT/8QDvNeWvfvKrT/OfXOPEvF/u7hLE++3DCd+skw+T7z2dVqnO
 9kGfiq3WW/rI+p8P0vG+EZtYWk4QvQT/1JL071zyLzj3rPhkA
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

With the bridges switching over to drm_bridge_connector, the direct
association between a bridge driver and its connector was lost.

This is mitigated for atomic bridge drivers by the fact you can access
the encoder, and then call drm_atomic_get_old_connector_for_encoder() or
drm_atomic_get_new_connector_for_encoder() with drm_atomic_state.

This was also made easier by providing drm_atomic_state directly to all
atomic hooks bridges can implement.

However, bridge drivers don't have a way to access drm_atomic_state
outside of the modeset path, like from the hotplug interrupt path or any
interrupt handler.

Let's introduce a function to retrieve the connector currently assigned
to an encoder, without using drm_atomic_state, to make these drivers'
life easier.

Co-developed-by: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 45 ++++++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_atomic.h     |  3 +++
 2 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 9ea2611770f43ce7ccba410406d5f2c528aab022..b926b132590e78f8d41d48eb4da4bccf170ee236 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -985,10 +985,55 @@ drm_atomic_get_new_connector_for_encoder(const struct drm_atomic_state *state,
 
 	return NULL;
 }
 EXPORT_SYMBOL(drm_atomic_get_new_connector_for_encoder);
 
+/**
+ * drm_atomic_get_connector_for_encoder - Get connector currently assigned to an encoder
+ * @encoder: The encoder to find the connector of
+ * @ctx: Modeset locking context
+ *
+ * This function finds and returns the connector currently assigned to
+ * an @encoder.
+ *
+ * Returns:
+ * The connector connected to @encoder, or an error pointer otherwise.
+ * When the error is EDEADLK, a deadlock has been detected and the
+ * sequence must be restarted.
+ */
+struct drm_connector *
+drm_atomic_get_connector_for_encoder(const struct drm_encoder *encoder,
+				     struct drm_modeset_acquire_ctx *ctx)
+{
+	struct drm_connector_list_iter conn_iter;
+	struct drm_connector *out_connector = ERR_PTR(-EINVAL);
+	struct drm_connector *connector;
+	struct drm_device *dev = encoder->dev;
+	int ret;
+
+	ret = drm_modeset_lock(&dev->mode_config.connection_mutex, ctx);
+	if (ret)
+		return ERR_PTR(ret);
+
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		if (!connector->state)
+			continue;
+
+		if (encoder == connector->state->best_encoder) {
+			out_connector = connector;
+			break;
+		}
+	}
+	drm_connector_list_iter_end(&conn_iter);
+	drm_modeset_unlock(&dev->mode_config.connection_mutex);
+
+	return out_connector;
+}
+EXPORT_SYMBOL(drm_atomic_get_connector_for_encoder);
+
+
 /**
  * drm_atomic_get_old_crtc_for_encoder - Get old crtc for an encoder
  * @state: Atomic state
  * @encoder: The encoder to fetch the crtc state for
  *
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 4c673f0698fef6b60f77db980378d5e88e0e250e..38636a593c9d98cadda85ccd67326cb152f0dd27 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -623,10 +623,13 @@ struct drm_connector *
 drm_atomic_get_old_connector_for_encoder(const struct drm_atomic_state *state,
 					 struct drm_encoder *encoder);
 struct drm_connector *
 drm_atomic_get_new_connector_for_encoder(const struct drm_atomic_state *state,
 					 struct drm_encoder *encoder);
+struct drm_connector *
+drm_atomic_get_connector_for_encoder(const struct drm_encoder *encoder,
+				     struct drm_modeset_acquire_ctx *ctx);
 
 struct drm_crtc *
 drm_atomic_get_old_crtc_for_encoder(struct drm_atomic_state *state,
 					 struct drm_encoder *encoder);
 struct drm_crtc *

-- 
2.48.1

