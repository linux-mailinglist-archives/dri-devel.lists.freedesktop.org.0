Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 806BC3D1E2B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 08:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 734B16ECB4;
	Thu, 22 Jul 2021 06:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9DF16EB74
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 06:23:07 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 4f1f5e26-eab5-11eb-8d1a-0050568cd888;
 Thu, 22 Jul 2021 06:23:20 +0000 (UTC)
Received: from saturn.lan (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 17737194B04;
 Thu, 22 Jul 2021 08:23:23 +0200 (CEST)
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 6/7] drm/bridge: Drop drm_bridge_chain_mode_fixup
Date: Thu, 22 Jul 2021 08:22:45 +0200
Message-Id: <20210722062246.2512666-7-sam@ravnborg.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210722062246.2512666-1-sam@ravnborg.org>
References: <20210722062246.2512666-1-sam@ravnborg.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 linux-mediatek@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are no users left and we do not want to have this function
available.

drm_atomic_bridge_check() is used to call the mode_fixup() operation for
the chained bridges and there is no need for drm_atomic_bridge_check().
Drop it.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_bridge.c | 37 ------------------------------------
 include/drm/drm_bridge.h     |  3 ---
 2 files changed, 40 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index f34a3382a738..fff5abb2a733 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -336,43 +336,6 @@ void drm_bridge_detach(struct drm_bridge *bridge)
  *   needed, in order to gradually transition to the new model.
  */
 
-/**
- * drm_bridge_chain_mode_fixup - fixup proposed mode for all bridges in the
- *				 encoder chain
- * @bridge: bridge control structure
- * @mode: desired mode to be set for the bridge
- * @adjusted_mode: updated mode that works for this bridge
- *
- * Calls &drm_bridge_funcs.mode_fixup for all the bridges in the
- * encoder chain, starting from the first bridge to the last.
- *
- * Note: the bridge passed should be the one closest to the encoder
- *
- * RETURNS:
- * true on success, false on failure
- */
-bool drm_bridge_chain_mode_fixup(struct drm_bridge *bridge,
-				 const struct drm_display_mode *mode,
-				 struct drm_display_mode *adjusted_mode)
-{
-	struct drm_encoder *encoder;
-
-	if (!bridge)
-		return true;
-
-	encoder = bridge->encoder;
-	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
-		if (!bridge->funcs->mode_fixup)
-			continue;
-
-		if (!bridge->funcs->mode_fixup(bridge, mode, adjusted_mode))
-			return false;
-	}
-
-	return true;
-}
-EXPORT_SYMBOL(drm_bridge_chain_mode_fixup);
-
 /**
  * drm_bridge_chain_mode_valid - validate the mode against all bridges in the
  *				 encoder chain.
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 7bf3d44ecf46..a39531406bfe 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -829,9 +829,6 @@ drm_bridge_chain_get_first_bridge(struct drm_encoder *encoder)
 #define drm_for_each_bridge_in_chain(encoder, bridge)			\
 	list_for_each_entry(bridge, &(encoder)->bridge_chain, chain_node)
 
-bool drm_bridge_chain_mode_fixup(struct drm_bridge *bridge,
-				 const struct drm_display_mode *mode,
-				 struct drm_display_mode *adjusted_mode);
 enum drm_mode_status
 drm_bridge_chain_mode_valid(struct drm_bridge *bridge,
 			    const struct drm_display_info *info,
-- 
2.30.2

