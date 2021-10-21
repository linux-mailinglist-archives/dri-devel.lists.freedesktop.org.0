Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E21FA436B59
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 21:29:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A9A6E48B;
	Thu, 21 Oct 2021 19:29:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD62B6E48B
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 19:29:39 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id t21so1119697plr.6
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 12:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1z4QCaWFWItz0HiCrhn3NpL1JJJMSCL5Ll9W/I5o9uE=;
 b=OdaRbDaPo2OhWmCdY0A/P9sinBvj2bsSAL7UY+BVnSUoGocUmEBff//TPbeYAkAEb+
 GwghVoBbJKHWdbX3NsUMOLJGLdeT+C88zXZspyr2tMo835mpbef5zPorPPxY+gzqPo8G
 5Hlv3fXGTFcDQYzHSwaYr9tIYblJeypINwS7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1z4QCaWFWItz0HiCrhn3NpL1JJJMSCL5Ll9W/I5o9uE=;
 b=qLux9f5LuL3oKB/+e6Nj/8z0oDNewQvDf/T96VdT1uhWgVrGQSrSqrw+bkDCFHfDRi
 LCAthSfZLqw2rKx6S1gix7qXOC9jM9gPzCMLQrluwMpRkTNJj66svOsgWsmEChd5UQCh
 N4aw3sDaRTSmqAb+5FTQ2jO4hZzf+6DziRrdeJPgGJ3EZEUpPbAPh+vjNk0MayRiz6AQ
 iLgHhpMp6Adf7RkaX27RDGp/ef6TIqmGqOJOdEE+Zph8qWL2xlLsAXGU7ZJE2nblRam1
 BtARU5ZU+t0e/ZwFmhlVXa0p+lFaHHdCbnRBOcpKlQkDuvZgY+PrwsvusymXX4CxNNET
 VY6g==
X-Gm-Message-State: AOAM533qrfG7R7+WBDpXcBv9GVtLtOTHukxPLWcZqBHIt25+5/3vxL5Y
 uKI6O0ljVGjvbGRsOvBJCQ56i8MDLLOvwpGB
X-Google-Smtp-Source: ABdhPJwDoNqmp5gT8TRJ2e7JRk/XxBBxpllfrKRbJFaXD/NHrV0+FyPsZgQqPbvypdsJf7WopUFmEg==
X-Received: by 2002:a17:90b:3ecb:: with SMTP id
 rm11mr9186152pjb.110.1634844579045; 
 Thu, 21 Oct 2021 12:29:39 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:aeff:f3cb:fda2:dd71])
 by smtp.gmail.com with ESMTPSA id a28sm6916262pfg.33.2021.10.21.12.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 12:29:38 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Philip Chen <philipchen@chromium.org>,
 Douglas Anderson <dianders@chromium.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: Fix the bridge chain order for pre_enable /
 post_disable
Date: Thu, 21 Oct 2021 12:29:01 -0700
Message-Id: <20211021122719.1.I56d382006dea67ed8f30729a751fbc75434315b2@changeid>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
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

Right now, the chaining order of
pre_enable/enable/disable/post_disable looks like this:

pre_enable:   start from connector and move to encoder
enable:       start from encoder and move to connector
disable:      start from connector and move to encoder
post_disable: start from encoder and move to connector

In the above, it can be seen that at least pre_enable() and
post_disable() are opposites of each other and enable() and disable()
are opposites. However, it seems broken that pre_enable() and enable()
would not move in the same direction. In other parts of Linux you can
see that various stages move in the same order. For instance, during
system suspend the "early" calls run in the same order as the normal
calls run in the same order as the "late" calls run in the same order
as the "noirq" calls.

Let fix the above so that it makes more sense. Now we'll have:

pre_enable:   start from encoder and move to connector
enable:       start from encoder and move to connector
disable:      start from connector and move to encoder
post_disable: start from connector and move to encoder

This order is chosen because if there are parent-child relationships
anywhere I would expect that the encoder would be a parent and the
connector a child--not the other way around.

This can be important when using the DP AUX bus to instantiate a
panel. The DP AUX bus is likely part of a bridge driver and is a
parent of the panel. We'd like the bridge to be pre_enabled before the
panel and the panel to be post_disabled before the
bridge. Specifically, this allows pm_runtime_put_sync_suspend() in a
bridge driver's post_suspend to work properly even a panel is under
it.

NOTE: it's entirely possible that this change could break someone who
was relying on the old order. Hopefully this isn't the case, but if
this does break someone it seems like it's better to do it sonner
rather than later so we can fix everyone to handle the order that
makes the most sense.

A FURTHER NOTE: Looking closer at commit 4e5763f03e10 ("drm/bridge:
ti-sn65dsi86: Wrap panel with panel-bridge") you can see that patch
inadvertently changed the order of things. The order used to be
correct (panel prepare was at the tail of the bridge enable) but it
became backwards. We'll restore the original order with this patch.

Fixes: 4e5763f03e10 ("drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge")
Fixes: 05193dc38197 ("drm/bridge: Make the bridge chain a double-linked list")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/drm_bridge.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c96847fc0ebc..98808af59afd 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -583,18 +583,14 @@ EXPORT_SYMBOL(drm_bridge_chain_mode_set);
 void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
 {
 	struct drm_encoder *encoder;
-	struct drm_bridge *iter;
 
 	if (!bridge)
 		return;
 
 	encoder = bridge->encoder;
-	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
-		if (iter->funcs->pre_enable)
-			iter->funcs->pre_enable(iter);
-
-		if (iter == bridge)
-			break;
+	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
+		if (bridge->funcs->pre_enable)
+			bridge->funcs->pre_enable(bridge);
 	}
 }
 EXPORT_SYMBOL(drm_bridge_chain_pre_enable);
@@ -684,26 +680,30 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
 					  struct drm_atomic_state *old_state)
 {
 	struct drm_encoder *encoder;
+	struct drm_bridge *iter;
 
 	if (!bridge)
 		return;
 
 	encoder = bridge->encoder;
-	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
-		if (bridge->funcs->atomic_post_disable) {
+	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
+		if (iter->funcs->atomic_post_disable) {
 			struct drm_bridge_state *old_bridge_state;
 
 			old_bridge_state =
 				drm_atomic_get_old_bridge_state(old_state,
-								bridge);
+								iter);
 			if (WARN_ON(!old_bridge_state))
 				return;
 
-			bridge->funcs->atomic_post_disable(bridge,
-							   old_bridge_state);
-		} else if (bridge->funcs->post_disable) {
-			bridge->funcs->post_disable(bridge);
+			iter->funcs->atomic_post_disable(iter,
+							 old_bridge_state);
+		} else if (iter->funcs->post_disable) {
+			iter->funcs->post_disable(iter);
 		}
+
+		if (iter == bridge)
+			break;
 	}
 }
 EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
-- 
2.33.0.1079.g6e70778dc9-goog

