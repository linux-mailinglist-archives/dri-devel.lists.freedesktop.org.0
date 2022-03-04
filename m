Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7894CD785
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 16:18:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1DB610FEFD;
	Fri,  4 Mar 2022 15:18:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF24310FEC1
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 15:18:41 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id u1so13137844wrg.11
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Mar 2022 07:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=LRw1kOuLW7vbLY523kmCpuiGHmdgKZXnbTS2wneH8y0=;
 b=Q65/j41OHj8wXaogWMZh2RkEod2+63BawOQgHBkLbhj/IcFAuCQeiRzopL0jhvMWzk
 HQS5Zd54Z33sOeoB/Dh+r4981R6/Z3LUmKXb7n91wGECd5roZfM2MhP1K7pt9AfSMA0I
 aYy6nhhNMV1T4eSOy8Q3ceEz/vOdPfnUr7L8LEqqVoHI9wvmdqafQ5B3CprOsirKF+2N
 ZDVBI2Ms+t4QkJMpHOfpk9AsB7Jh4XP966PuRMKGdwQlvY+nU0CuzB4BktUKheVQvG7/
 4j6/mi31AlX2HLEWmGhNfMwgNWstWdl9p9UER9YBZ6QXD5UQXSSebSHrZagA48R1sBH4
 5BHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=LRw1kOuLW7vbLY523kmCpuiGHmdgKZXnbTS2wneH8y0=;
 b=JqXlqYt4+I3nWgZC58OqqgvyM2bH0XOzm4bkbz/ReOfruRiBoi5h93REYxCQvRWyMR
 HOdFAQvsHT/DgxM4KNvvnhPqrFkCr+9AoY5lMRuFaxZ/u+91XED0VYNCa/f7Xv12q7q3
 4cYNZB/2BSAE9fDv8fYTqp8pH0/d+Yzop2wiy4eNyO6cSkj43gLq2wMY5bMsGqINhzr8
 FFlq80Lu/YuIHHoXBW5XX3KTriNS0KMPPez8mAC+/VaLzEjFCnCp1HqapMz6OCukgvCy
 W3y58cyJ4fgMVoAv/nTFr5nLOGeICgcTq26sFzyUAasbgnhOPqn4Vy7dPc9zKOe1IyhN
 H0dg==
X-Gm-Message-State: AOAM533ANJXZKaFqrGqA0IAkLiTrXDy8zm4Bkbr4CdnCKvksjp6lf76o
 ubOUX1Jy7ah6GhT4s5S3GEbVOA==
X-Google-Smtp-Source: ABdhPJweUj4LzJ6in8KjbsMpvJ1r339BDdH7F6AhnTIrjv0tpO/at/w//6oqIAnLkxX6v7I88y8RmA==
X-Received: by 2002:adf:ea4a:0:b0:1f0:6501:80f7 with SMTP id
 j10-20020adfea4a000000b001f0650180f7mr4040481wrn.306.1646407120342; 
 Fri, 04 Mar 2022 07:18:40 -0800 (PST)
Received: from dave-VirtualBox.pitowers.org ([93.93.133.154])
 by smtp.googlemail.com with ESMTPSA id
 r13-20020a5d498d000000b001f0587248c4sm4409711wrq.3.2022.03.04.07.18.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 04 Mar 2022 07:18:39 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH V2 2/4] drm/bridge: Introduce pre_enable_upstream_first to
 alter bridge init order
Date: Fri,  4 Mar 2022 15:17:57 +0000
Message-Id: <ec19836b0fbbc1bb53a6ba6ce93eec2184676aae.1646406653.git.dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
References: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
In-Reply-To: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
References: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
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
Cc: Marek Vasut <marex@denx.de>, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, andrzej.hajda@gmail.com,
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

Add a new flag pre_enable_upstream_first that any bridge can set
to swap the order of pre_enable (and post_disable) for that and the
immediately upstream bridge.
Should the immediately upstream bridge also set the
pre_enable_upstream_first flag, the bridge upstream of that will be called
before either of those which requested pre_enable_upstream_first.

eg:
- Panel
- Bridge 1
- Bridge 2 pre_enable_upstream_first
- Bridge 3
- Bridge 4 pre_enable_upstream_first
- Bridge 5 pre_enable_upstream_first
- Bridge 6
- Encoder
Would result in pre_enable's being called as Panel, Bridge 1, Bridge 3,
Bridge 2, Bridge 6, Bridge 5, Bridge 4, Encoder.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/drm_bridge.c | 116 +++++++++++++++++++++++++++++++++----------
 include/drm/drm_bridge.h     |   8 +++
 2 files changed, 98 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 198fd471a488..70b513f5ce0d 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -523,6 +523,10 @@ EXPORT_SYMBOL(drm_bridge_chain_disable);
  * encoder chain, starting from the first bridge to the last. These are called
  * after completing the encoder's prepare op.
  *
+ * If a bridge sets @pre_enable_upstream_first, then the @post_disable for that
+ * bridge will be called before the previous one to reverse the @pre_enable
+ * calling direction.
+ *
  * Note: the bridge passed should be the one closest to the encoder
  */
 void drm_bridge_chain_post_disable(struct drm_bridge *bridge)
@@ -569,6 +573,9 @@ EXPORT_SYMBOL(drm_bridge_chain_mode_set);
  * chain, starting from the last bridge to the first. These are called
  * before calling the encoder's commit op.
  *
+ * If a bridge sets @pre_enable_upstream_first, then the @pre_enable for the
+ * previous bridge will be called before @pre_enable of this bridge.
+ *
  * Note: the bridge passed should be the one closest to the encoder
  */
 void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
@@ -645,6 +652,25 @@ void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
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
@@ -655,6 +681,9 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_disable);
  * &drm_bridge_funcs.post_disable) op for all the bridges in the encoder chain,
  * starting from the first bridge to the last. These are called after completing
  * &drm_encoder_helper_funcs.atomic_disable
+ * If a bridge sets @pre_enable_upstream_first, then the @post_disable for that
+ * bridge will be called before the previous one to reverse the @pre_enable
+ * calling direction.
  *
  * Note: the bridge passed should be the one closest to the encoder
  */
@@ -662,30 +691,55 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
 					  struct drm_atomic_state *old_state)
 {
 	struct drm_encoder *encoder;
+	struct drm_bridge *prev, *tmp;
 
 	if (!bridge)
 		return;
 
 	encoder = bridge->encoder;
-	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
-		if (old_state && bridge->funcs->atomic_post_disable) {
-			struct drm_bridge_state *old_bridge_state;
 
-			old_bridge_state =
-				drm_atomic_get_old_bridge_state(old_state,
-								bridge);
-			if (WARN_ON(!old_bridge_state))
-				return;
+	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
+		if (!list_is_last(&bridge->chain_node, &encoder->bridge_chain) &&
+		    list_next_entry(bridge, chain_node)->pre_enable_upstream_first)
+			/* Skip bridges where the downstream bridge wanted
+			 * pre_enable after / post_disable before the upstream
+			 * bridge.
+			 */
+			continue;
 
-			bridge->funcs->atomic_post_disable(bridge,
-							   old_bridge_state);
-		} else if (bridge->funcs->post_disable) {
-			bridge->funcs->post_disable(bridge);
-		}
+		/* Call this bridge and any skipped ones in reverse order */
+		tmp = bridge;
+		do {
+			prev = tmp;
+			drm_atomic_bridge_call_post_disable(tmp, old_state);
+			if (tmp == list_first_entry(&encoder->bridge_chain,
+						    struct drm_bridge, chain_node))
+				tmp = NULL;
+			else
+				tmp = list_prev_entry(tmp, chain_node);
+		} while (tmp && prev->pre_enable_upstream_first);
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
@@ -697,32 +751,42 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
  * starting from the last bridge to the first. These are called before calling
  * &drm_encoder_helper_funcs.atomic_enable
  *
+ * If a bridge sets @pre_enable_upstream_first, then the pre_enable for the
+ * upstream bridge will be called before pre_enable of this bridge.
+ *
  * Note: the bridge passed should be the one closest to the encoder
  */
 void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
 					struct drm_atomic_state *old_state)
 {
 	struct drm_encoder *encoder;
-	struct drm_bridge *iter;
+	struct drm_bridge *iter, *tmp;
 
 	if (!bridge)
 		return;
 
 	encoder = bridge->encoder;
-	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
-		if (old_state && iter->funcs->atomic_pre_enable) {
-			struct drm_bridge_state *old_bridge_state;
 
-			old_bridge_state =
-				drm_atomic_get_old_bridge_state(old_state,
-								iter);
-			if (WARN_ON(!old_bridge_state))
-				return;
+	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
+		if (iter->pre_enable_upstream_first && iter != bridge)
+			/* Skip bridges which want the upstream pre_enable
+			 * called before their pre_enable.
+			 */
+			continue;
 
-			iter->funcs->atomic_pre_enable(iter, old_bridge_state);
-		} else if (iter->funcs->pre_enable) {
-			iter->funcs->pre_enable(iter);
-		}
+		tmp = iter;
+		do {
+			/* Work forward through the current bridge, and any
+			 * that had been skipped.
+			 */
+			drm_atomic_bridge_call_pre_enable(tmp, old_state);
+			if (tmp == list_last_entry(&encoder->bridge_chain,
+						   struct drm_bridge,
+						   chain_node))
+				tmp = NULL;
+			else
+				tmp = list_next_entry(tmp, chain_node);
+		} while (tmp && tmp->pre_enable_upstream_first);
 
 		if (iter == bridge)
 			break;
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index f27b4060faa2..cf1fb3ad7054 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -769,6 +769,14 @@ struct drm_bridge {
 	 */
 	bool interlace_allowed;
 	/**
+	 * @pre_enable_upstream_first: The bridge requires that the upstream
+	 * bridge @pre_enable function is called before its @pre_enable,
+	 * and conversely for post_disable. This is most frequently a
+	 * requirement for DSI devices which need the host to be initialised
+	 * before the peripheral.
+	 */
+	bool pre_enable_upstream_first;
+	/**
 	 * @ddc: Associated I2C adapter for DDC access, if any.
 	 */
 	struct i2c_adapter *ddc;
-- 
2.7.4

