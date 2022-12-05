Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A50642EE6
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 18:34:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091B410E26F;
	Mon,  5 Dec 2022 17:34:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79BA410E26D
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 17:33:51 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 o7-20020a05600c510700b003cffc0b3374so10686825wms.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Dec 2022 09:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W4MMrx+Do7XQ4KLK7o69mW7nRFVoUezHsmkFKu2scmo=;
 b=NVLlQAQj7Q0B5lykUm6ByN7Q9+eNuFHe3IelGiCI844PjoDjHEG8LAdUXJFqD3tB6B
 mYINPE4MHSQttHAKJsFw8iDdI0p4Fx48AvtnYT87eSosbiRI6NCvxNH0yewbjSAHvmn/
 65eE5gL74mA9ysKQ/KNE13YLaxcSsdsa+T5vIfQDngQn/gDWQugCd+YfIMcKoTZvCuZF
 I5t4msKgJbegWvgWgL2P7sjQUOH61ZPBaO+YUtcTZw92tQDXCWf50iDx6dBnld14rHyx
 ZCbCTxzOIAZKbQf1xsjrDnf25YZ2cM2kGyWCLrDlx0zLmq3vPvgLEw0NIh28iA5zTdts
 vi0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W4MMrx+Do7XQ4KLK7o69mW7nRFVoUezHsmkFKu2scmo=;
 b=yZfALOKR25pQTIQQ7bXC9qaxWx6/4CukSnxhb0jh8cy5XifU+BkfX31uVXmFpLVgLf
 RJuKBQXwytQ6cFM2D53BYcG4jV8NdqWzWyo8GSu70tQLOqWztCo0DI3mZsOCo3b5U8pw
 A3eJp7a54zjm9MLvwO1GnMU8HqRim9D5pRXSEWtnKsE8j7hGqpoNNm4/Fs7NYoZB0koN
 0PCghZZtl5eDsNFbcq7LJdpXehuwMiBkQDJc3coUQe4GybRXPecJYYFrZ69A75IpFmBW
 lY+lHxhpf3aAPeIgvrzD3LJSSOPnlYoR5aQn9CRu4+jwC/GYs5+v2hkjNgPKaglkz4D9
 BSYw==
X-Gm-Message-State: ANoB5pmxDpGgKUtRtgIgtbaL7pKJIdwF8psvc9j92gekeGcof5zE5dI+
 ENv86kkAiEI3el8NOP7dIKwTVA==
X-Google-Smtp-Source: AA0mqf6webQ5G2uQj1G2K6PUPqSrfcpLFWmjipNw+GJo9gKeQHClr288+AigDIfUYLAZ/brvi1ZyOQ==
X-Received: by 2002:a05:600c:35cf:b0:3cf:aa11:93a8 with SMTP id
 r15-20020a05600c35cf00b003cfaa1193a8mr64923352wmq.31.1670261629726; 
 Mon, 05 Dec 2022 09:33:49 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
 by smtp.googlemail.com with ESMTPSA id
 v15-20020a5d6b0f000000b002421ed1d8c8sm14524245wrw.103.2022.12.05.09.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 09:33:49 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH v4 4/6] drm/bridge: Introduce pre_enable_prev_first to alter
 bridge init order
Date: Mon,  5 Dec 2022 17:33:26 +0000
Message-Id: <20221205173328.1395350-5-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205173328.1395350-1-dave.stevenson@raspberrypi.com>
References: <20221205173328.1395350-1-dave.stevenson@raspberrypi.com>
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
Cc: Marek Vasut <marex@denx.de>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, andrzej.hajda@gmail.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DSI sink devices typically want the DSI host powered up and configured
before they are powered up. pre_enable is the place this would normally
happen, but they are called in reverse order from panel/connector towards
the encoder, which is the "wrong" order.

Add a new flag pre_enable_prev_first that any bridge can set
to swap the order of pre_enable (and post_disable) for that and the
immediately previous bridge.
Should the immediately previous bridge also set the
pre_enable_prev_first flag, the previous bridge to that will be called
before either of those which requested pre_enable_prev_first.

eg:
- Panel
- Bridge 1
- Bridge 2 pre_enable_prev_first
- Bridge 3
- Bridge 4 pre_enable_prev_first
- Bridge 5 pre_enable_prev_first
- Bridge 6
- Encoder
Would result in pre_enable's being called as Panel, Bridge 1, Bridge 3,
Bridge 2, Bridge 6, Bridge 5, Bridge 4, Encoder.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/gpu/drm/drm_bridge.c | 145 +++++++++++++++++++++++++++++------
 include/drm/drm_bridge.h     |   8 ++
 2 files changed, 129 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index bb7fc09267af..5f40c83b1b42 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -581,6 +581,25 @@ void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL(drm_atomic_bridge_chain_disable);
 
+static void drm_atomic_bridge_call_post_disable(struct drm_bridge *bridge,
+						struct drm_atomic_state *old_state)
+{
+	if (old_state && bridge->funcs->atomic_post_disable) {
+		struct drm_bridge_state *old_bridge_state;
+
+		old_bridge_state =
+			drm_atomic_get_old_bridge_state(old_state,
+							bridge);
+		if (WARN_ON(!old_bridge_state))
+			return;
+
+		bridge->funcs->atomic_post_disable(bridge,
+						   old_bridge_state);
+	} else if (bridge->funcs->post_disable) {
+		bridge->funcs->post_disable(bridge);
+	}
+}
+
 /**
  * drm_atomic_bridge_chain_post_disable - cleans up after disabling all bridges
  *					  in the encoder chain
@@ -592,36 +611,86 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_disable);
  * starting from the first bridge to the last. These are called after completing
  * &drm_encoder_helper_funcs.atomic_disable
  *
+ * If a bridge sets @pre_enable_prev_first, then the @post_disable for that
+ * bridge will be called before the previous one to reverse the @pre_enable
+ * calling direction.
+ *
  * Note: the bridge passed should be the one closest to the encoder
  */
 void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
 					  struct drm_atomic_state *old_state)
 {
 	struct drm_encoder *encoder;
+	struct drm_bridge *next, *limit;
 
 	if (!bridge)
 		return;
 
 	encoder = bridge->encoder;
+
 	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
-		if (bridge->funcs->atomic_post_disable) {
-			struct drm_bridge_state *old_bridge_state;
+		limit = NULL;
+
+		if (!list_is_last(&bridge->chain_node, &encoder->bridge_chain)) {
+			next = list_next_entry(bridge, chain_node);
+
+			if (next->pre_enable_prev_first) {
+				/* next bridge had requested that prev
+				 * was enabled first, so disabled last
+				 */
+				limit = next;
+
+				/* Find the next bridge that has NOT requested
+				 * prev to be enabled first / disabled last
+				 */
+				list_for_each_entry_from(next, &encoder->bridge_chain,
+							 chain_node) {
+					if (next->pre_enable_prev_first) {
+						next = list_prev_entry(next, chain_node);
+						limit = next;
+						break;
+					}
+				}
+
+				/* Call these bridges in reverse order */
+				list_for_each_entry_from_reverse(next, &encoder->bridge_chain,
+								 chain_node) {
+					if (next == bridge)
+						break;
+
+					drm_atomic_bridge_call_post_disable(next,
+									    old_state);
+				}
+			}
+		}
 
-			old_bridge_state =
-				drm_atomic_get_old_bridge_state(old_state,
-								bridge);
-			if (WARN_ON(!old_bridge_state))
-				return;
+		drm_atomic_bridge_call_post_disable(bridge, old_state);
 
-			bridge->funcs->atomic_post_disable(bridge,
-							   old_bridge_state);
-		} else if (bridge->funcs->post_disable) {
-			bridge->funcs->post_disable(bridge);
-		}
+		if (limit)
+			/* Jump all bridges that we have already post_disabled */
+			bridge = limit;
 	}
 }
 EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
 
+static void drm_atomic_bridge_call_pre_enable(struct drm_bridge *bridge,
+					      struct drm_atomic_state *old_state)
+{
+	if (old_state && bridge->funcs->atomic_pre_enable) {
+		struct drm_bridge_state *old_bridge_state;
+
+		old_bridge_state =
+			drm_atomic_get_old_bridge_state(old_state,
+							bridge);
+		if (WARN_ON(!old_bridge_state))
+			return;
+
+		bridge->funcs->atomic_pre_enable(bridge, old_bridge_state);
+	} else if (bridge->funcs->pre_enable) {
+		bridge->funcs->pre_enable(bridge);
+	}
+}
+
 /**
  * drm_atomic_bridge_chain_pre_enable - prepares for enabling all bridges in
  *					the encoder chain
@@ -633,32 +702,60 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
  * starting from the last bridge to the first. These are called before calling
  * &drm_encoder_helper_funcs.atomic_enable
  *
+ * If a bridge sets @pre_enable_prev_first, then the pre_enable for the
+ * prev bridge will be called before pre_enable of this bridge.
+ *
  * Note: the bridge passed should be the one closest to the encoder
  */
 void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
 					struct drm_atomic_state *old_state)
 {
 	struct drm_encoder *encoder;
-	struct drm_bridge *iter;
+	struct drm_bridge *iter, *next, *limit;
 
 	if (!bridge)
 		return;
 
 	encoder = bridge->encoder;
+
 	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
-		if (iter->funcs->atomic_pre_enable) {
-			struct drm_bridge_state *old_bridge_state;
+		if (iter->pre_enable_prev_first) {
+			next = iter;
+			limit = bridge;
+			list_for_each_entry_from_reverse(next,
+							 &encoder->bridge_chain,
+							 chain_node) {
+				if (next == bridge)
+					break;
+
+				if (!next->pre_enable_prev_first) {
+					/* Found first bridge that does NOT
+					 * request prev to be enabled first
+					 */
+					limit = list_prev_entry(next, chain_node);
+					break;
+				}
+			}
+
+			list_for_each_entry_from(next, &encoder->bridge_chain, chain_node) {
+				/* Call requested prev bridge pre_enable
+				 * in order.
+				 */
+				if (next == iter)
+					/* At the first bridge to request prev
+					 * bridges called first.
+					 */
+					break;
+
+				drm_atomic_bridge_call_pre_enable(next, old_state);
+			}
+		}
 
-			old_bridge_state =
-				drm_atomic_get_old_bridge_state(old_state,
-								iter);
-			if (WARN_ON(!old_bridge_state))
-				return;
+		drm_atomic_bridge_call_pre_enable(iter, old_state);
 
-			iter->funcs->atomic_pre_enable(iter, old_bridge_state);
-		} else if (iter->funcs->pre_enable) {
-			iter->funcs->pre_enable(iter);
-		}
+		if (iter->pre_enable_prev_first)
+			/* Jump all bridges that we have already pre_enabled */
+			iter = limit;
 
 		if (iter == bridge)
 			break;
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 796567a203ac..42f86327b40a 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -744,6 +744,14 @@ struct drm_bridge {
 	 * modes.
 	 */
 	bool interlace_allowed;
+	/**
+	 * @pre_enable_prev_first: The bridge requires that the prev
+	 * bridge @pre_enable function is called before its @pre_enable,
+	 * and conversely for post_disable. This is most frequently a
+	 * requirement for DSI devices which need the host to be initialised
+	 * before the peripheral.
+	 */
+	bool pre_enable_prev_first;
 	/**
 	 * @ddc: Associated I2C adapter for DDC access, if any.
 	 */
-- 
2.34.1

