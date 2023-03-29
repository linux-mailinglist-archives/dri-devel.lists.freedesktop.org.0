Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F85A6CDA7A
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 15:19:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C5D910EAC0;
	Wed, 29 Mar 2023 13:19:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF89A10EAC0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 13:19:40 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id q102so14012631pjq.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 06:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680095980;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/v0aeTjxkLPm8Geh7qWRGFN17I5ZClwfGotSGAvvgRo=;
 b=Yk1ZX+WLEPPdWL2SD3QOvrYJbjyVLaxAmc1SRNI16HvFnnip4H+fNCct1NxOY03yp7
 q7v+fC3LCpqmBx+mZBhks3zK5jwjN0fyuv+W14RENLl4Q8PzI3cPphDKYB+9taccSGvd
 uOz0RemLx7vwkMenM1ACiUddbuNGOvikDWXBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680095980;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/v0aeTjxkLPm8Geh7qWRGFN17I5ZClwfGotSGAvvgRo=;
 b=E2h4tSZFcBo8nPbr36G9FfzyUNWi3Q6MqSYxdXRbCp35ti5WgaxkWqz5a9xEwnGcSW
 /jmaKNH1xthkLcyaf0cVCYF4qxM5clek8QvMPD1ZTfg+MU8I2atQiwrglv4GgqDnTBTl
 /qAqknG9pL+5fagiBBjFR2MYy1GETUTF1V5DavcbgjMEfFbDGyHU9LK48Lw/P2RWxkZu
 +Iz82STOnUZyfLOVQC3L8hifsURk1h/Ba90yEKqwRF3Nq+K7WXJMNNU9Nk6z+JZdgFnv
 0jp+QRNiNIr9DcAGDOnFZJDm2oJfR7aY8f2tLfLmztoFAoOHhsTIzlPYOcFQmmN0qgVu
 sr2g==
X-Gm-Message-State: AAQBX9ckOfK0+MbVtS0lrWrT/w2Iwkj8ekkyb5uif7n93YxqrTB67ZbY
 Awxh1Gb59TQRfhZZuLHzp69srw==
X-Google-Smtp-Source: AKy350a30gmaeoHI3gtRW94k9vTAreUbchLxDVDQ49J4FoNt8UN/7ACF8JX/3OzUkhDlIZRne6BRAw==
X-Received: by 2002:a17:903:22cb:b0:1a1:b174:8363 with SMTP id
 y11-20020a17090322cb00b001a1b1748363mr23482597plg.59.1680095980475; 
 Wed, 29 Mar 2023 06:19:40 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a047:206d:4722:c4fa:e845])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902854900b0019c90f8c831sm22949389plo.242.2023.03.29.06.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 06:19:39 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v7 10/12] drm/bridge: Implement enable_next_first to alter
 bridge init order
Date: Wed, 29 Mar 2023 18:49:27 +0530
Message-Id: <20230329131929.1328612-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DSI sink devices typically send the MIPI-DCS commands to the DSI host
via general MIPI_DSI_DCS read and write API.

The classical DSI sequence mentioned that the DSI host receives MIPI-DCS
commands from the DSI sink first in order to switch HS mode properly.
Once the DSI host switches to HS mode any MIPI-DCS commands from the
DSI sink are unfunctional.

DSI sink uses the @enable function to send the MIPI-DCS commands. In a
typical DSI host, sink pipeline the @enable call chain start with the
DSI host, and then the DSI sink which is the "wrong" order as DSI host
@enable is called and switched to HS mode before DSI sink @enable.

If the DSI host enables with the @enable_next_first flag then the
@enable for the DSI sink will be called first before the @enable of
the DSI host. This alter bridge init order makes sure that the MIPI-DCS
commands send first and then switch to the HS mode properly by DSI host.

This new flag @enable_next_first that any bridg can set to swap the
order of @enable (and #disable) for that and the immediately next bridge.

[enable]
If a bridge sets @enable_next_first, then the @enable for the next bridge
will be called first before enable of this bridge.

[disable]
If a bridge sets @enable_next_first, then the @disable for the next bridge
will be called first before @disable of this bridge to reverse the @enable
calling direction.

eg:
- Panel
- Bridge 1
- Bridge 2 enable_next_first
- Bridge 3
- Bridge 4 enable_next_first
- Bridge 5 enable_next_first
- Bridge 6
- Encoder

Would result in enable's being called as Encoder, Bridge 6, Bridge 3,
Bridge 4, Bridge 5, Bridge 1, Bridge 2, Panel.

and the result in disable's being called as Panel, Bridge 2, Bridge 1,
Bridge 5, Bridge 4, Bridge 3, Bridge 6, Encoder.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v7:
- new patch

 drivers/gpu/drm/drm_bridge.c | 171 ++++++++++++++++++++++++++++++-----
 include/drm/drm_bridge.h     |   8 ++
 2 files changed, 154 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index caf0f341e524..cdc2669b3512 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -577,6 +577,24 @@ void drm_bridge_chain_mode_set(struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL(drm_bridge_chain_mode_set);
 
+static void drm_atomic_bridge_call_disable(struct drm_bridge *bridge,
+					   struct drm_atomic_state *old_state)
+{
+	if (old_state && bridge->funcs->atomic_disable) {
+		struct drm_bridge_state *old_bridge_state;
+
+		old_bridge_state =
+			drm_atomic_get_old_bridge_state(old_state,
+							bridge);
+		if (WARN_ON(!old_bridge_state))
+			return;
+
+		bridge->funcs->atomic_disable(bridge, old_bridge_state);
+	} else if (bridge->funcs->disable) {
+		bridge->funcs->disable(bridge);
+	}
+}
+
 /**
  * drm_atomic_bridge_chain_disable - disables all bridges in the encoder chain
  * @bridge: bridge control structure
@@ -587,33 +605,73 @@ EXPORT_SYMBOL(drm_bridge_chain_mode_set);
  * starting from the last bridge to the first. These are called before calling
  * &drm_encoder_helper_funcs.atomic_disable
  *
+ * If a bridge sets @enable_next_first, then the @disable for the next bridge
+ * will be called first before @disable of this bridge to reverse the @enable
+ * calling direction.
+ *
+ * Example:
+ * Bridge A ---> Bridge B ---> Bridge C ---> Bridge D ---> Bridge E
+ *
+ * With enable_next_first flag enable in Bridge A, C, D then the resulting
+ * @disable order would be,
+ * Bridge C, Bridge D, Bridge E, Bridge A, Bridge B.
+ *
  * Note: the bridge passed should be the one closest to the encoder
  */
 void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
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
-		if (iter->funcs->atomic_disable) {
-			struct drm_bridge_state *old_bridge_state;
-
-			old_bridge_state =
-				drm_atomic_get_old_bridge_state(old_state,
-								iter);
-			if (WARN_ON(!old_bridge_state))
-				return;
-
-			iter->funcs->atomic_disable(iter, old_bridge_state);
-		} else if (iter->funcs->disable) {
-			iter->funcs->disable(iter);
+		limit = NULL;
+
+		if (!list_is_first(&iter->chain_node, &encoder->bridge_chain)) {
+			next = list_prev_entry(iter, chain_node);
+
+			if (next->enable_next_first) {
+				limit = bridge;
+				list_for_each_entry_from_reverse(next,
+							 &encoder->bridge_chain,
+							 chain_node) {
+					if (next == bridge)
+						break;
+
+					if (!next->enable_next_first) {
+						/* Found first bridge that does NOT
+						 * request next to be enabled first
+						 */
+						next = list_next_entry(next, chain_node);
+						limit = next;
+						break;
+					}
+				}
+
+				list_for_each_entry_from(next, &encoder->bridge_chain, chain_node) {
+					/* Call requested next bridge enable in order */
+					if (next == iter)
+						/* At the first bridge to request next
+						 * bridges called first.
+						 */
+						break;
+
+					drm_atomic_bridge_call_disable(next, old_state);
+				}
+			}
 		}
 
+		drm_atomic_bridge_call_disable(iter, old_state);
+
+		if (limit)
+			/* Jump all bridges that we have already disabled */
+			iter = limit;
+
 		if (iter == bridge)
 			break;
 	}
@@ -822,6 +880,24 @@ void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL(drm_atomic_bridge_chain_pre_enable);
 
+static void drm_atomic_bridge_call_enable(struct drm_bridge *bridge,
+					  struct drm_atomic_state *old_state)
+{
+	if (old_state && bridge->funcs->atomic_enable) {
+		struct drm_bridge_state *old_bridge_state;
+
+		old_bridge_state =
+			drm_atomic_get_old_bridge_state(old_state,
+							bridge);
+		if (WARN_ON(!old_bridge_state))
+			return;
+
+		bridge->funcs->atomic_enable(bridge, old_bridge_state);
+	} else if (bridge->funcs->enable) {
+		bridge->funcs->enable(bridge);
+	}
+}
+
 /**
  * drm_atomic_bridge_chain_enable - enables all bridges in the encoder chain
  * @bridge: bridge control structure
@@ -832,31 +908,76 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_pre_enable);
  * starting from the first bridge to the last. These are called after completing
  * &drm_encoder_helper_funcs.atomic_enable
  *
+ * If a bridge sets @enable_next_first, then the @enable for the next bridge
+ * will be called first before enable of this bridge.
+ *
+ * Example:
+ * Bridge A ---> Bridge B ---> Bridge C ---> Bridge D ---> Bridge E
+ *
+ * With enable_next_first flag enable in Bridge A, C, D then the resulting
+ * @enable order would be,
+ * Bridge B, Bridge A, Bridge E, Bridge D, Bridge C.
+ *
  * Note: the bridge passed should be the one closest to the encoder
  */
 void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
 				    struct drm_atomic_state *old_state)
 {
 	struct drm_encoder *encoder;
+	struct drm_bridge *next, *limit;
 
 	if (!bridge)
 		return;
 
 	encoder = bridge->encoder;
+
 	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
-		if (bridge->funcs->atomic_enable) {
-			struct drm_bridge_state *old_bridge_state;
-
-			old_bridge_state =
-				drm_atomic_get_old_bridge_state(old_state,
-								bridge);
-			if (WARN_ON(!old_bridge_state))
-				return;
-
-			bridge->funcs->atomic_enable(bridge, old_bridge_state);
-		} else if (bridge->funcs->enable) {
-			bridge->funcs->enable(bridge);
+		limit = NULL;
+
+		if (!list_is_last(&bridge->chain_node, &encoder->bridge_chain)) {
+			if (bridge->enable_next_first) {
+				/* next bridge had requested that next
+				 * was enabled first, so disabled last
+				 */
+				next = list_next_entry(bridge, chain_node);
+				limit = next;
+
+				list_for_each_entry_from(next, &encoder->bridge_chain,
+							 chain_node) {
+					/* Find the next bridge that has NOT requested
+					 * next to be enabled first / disabled last
+					 */
+					if (!next->enable_next_first) {
+						limit = next;
+						break;
+					}
+
+					/* Last bridge has requested next to be limit
+					 * otherwise the control move to end of chain
+					 */
+					if (list_is_last(&next->chain_node,
+							 &encoder->bridge_chain)) {
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
+					drm_atomic_bridge_call_enable(next, old_state);
+				}
+			}
 		}
+
+		drm_atomic_bridge_call_enable(bridge, old_state);
+
+		if (limit)
+			/* Jump all bridges that we have already enabled */
+			bridge = limit;
 	}
 }
 EXPORT_SYMBOL(drm_atomic_bridge_chain_enable);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index a1a31704b917..9879129047e4 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -752,6 +752,14 @@ struct drm_bridge {
 	 * before the peripheral.
 	 */
 	bool pre_enable_prev_first;
+	/**
+	 * @enable_next_first: The bridge requires that the next bridge @enable
+	 * function is called first before its @enable, and conversely for
+	 * @disable. This is most frequently a requirement for a DSI host to
+	 * receive MIPI-DCS commands from DSI sink first in order to switch
+	 * HS mode properly.
+	 */
+	bool enable_next_first;
 	/**
 	 * @ddc: Associated I2C adapter for DDC access, if any.
 	 */
-- 
2.25.1

