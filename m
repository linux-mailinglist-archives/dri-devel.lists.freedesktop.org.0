Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7904CD784
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 16:18:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAEEA10FD7F;
	Fri,  4 Mar 2022 15:18:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5D110FD74
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 15:18:34 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id e24so183062wrc.10
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Mar 2022 07:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=glR9JQYYRBPEgy2tXaGq1LuTK3dY0m0s7CnJOVhH8VM=;
 b=sm/dxW4bSFIs9SffLaGb1/eGZCYXCqBPaX3UE9X1lO/qKrr0rrBkKuGelKKNwQwxvZ
 KJiT/uTrbcfsqse5aW4l5B+QpLjT5NKdxPtIRcoEYWsvQHIIbuFA/d30cVcYFYd3gFIc
 Fm3x9A8Yb5vLOCWs+vTgBTZzY/8R8uaU4qgcb55Krop8JHqlr0PIk9ft4W01nb2BTYNg
 i/e+iVX4+eKV2NSRU67KzBkSUBUSe2M+YcSakRoejPGyMJI21BAFt7Qr1tZoI59ePJkg
 F0HyGlcC3kBlFaghBuQI3vgYrx8ZLP1ABXJsiNjkcD7rPSq/BQEs95gZhon87DnnBqTM
 G8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=glR9JQYYRBPEgy2tXaGq1LuTK3dY0m0s7CnJOVhH8VM=;
 b=01eSxdMXxCfNYQTYSeZipdolv4QkYKaTC1cQDsytfZKQOcOxPjF0+9o7F/aSt/9rnf
 cc1zITPMgyMObEKGYk0Q19llza6Uh+DVbQQdVPJb4uOFT+wXeNyW3OD+5XpM56E23pUm
 rsrSNKLjc7ogif3s38BqGkdVMEOzMSIfLuCmSKpBDne+olNwW7pQgsWyzmIiT/rJoGKQ
 atEONf5/gfbk2nS7dAwZK2OmyrBnCpFHolrHXeznizmAEi1oqnBsR/QkTJQqlC3iEEAv
 jxlH8yyMehncic5JIHrkkLv/qyLgqCyWHrpAQ1KAjAxHqj8CxyzFyUUA4m0tw9OyH8DX
 TvDA==
X-Gm-Message-State: AOAM533wVFXKFgmt8Zz4FEjyBF45ztK1oAzd6xJtSIVYG2U4PpafHfDD
 mirNMkoNodXKpmO70SB9OOpPfA==
X-Google-Smtp-Source: ABdhPJz8P84dbixxhWn7/NsEX2HNwr+tC9jl3V/UD4g3TX9ANK+vDn0N9KgEQtM2u8Ypn8K+P8ZCOA==
X-Received: by 2002:adf:f804:0:b0:1f0:326e:5e78 with SMTP id
 s4-20020adff804000000b001f0326e5e78mr9974146wrp.251.1646407112503; 
 Fri, 04 Mar 2022 07:18:32 -0800 (PST)
Received: from dave-VirtualBox.pitowers.org ([93.93.133.154])
 by smtp.googlemail.com with ESMTPSA id
 r13-20020a5d498d000000b001f0587248c4sm4409711wrq.3.2022.03.04.07.18.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 04 Mar 2022 07:18:31 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH V2 1/4] drm/bridge: Remove duplication from drm_bridge and
 drm_atomic_bridge chains
Date: Fri,  4 Mar 2022 15:17:56 +0000
Message-Id: <67888b7a05a896c8b9b0f15bd81ef614d082dc9f.1646406653.git.dave.stevenson@raspberrypi.com>
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

drm_bridge_chain_pre_enable is a subset of
drm_atomic_bridge_chain_pre_enable, and drm_bridge_chain_post_disable
is a subset of drm_atomic_bridge_chain_post_disable.

Change drm_bridge_chain_pre_enable and drm_bridge_chain_post_disable to
call the atomic versions with a NULL state, and ensure that atomic
calls are not made if there is no state.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/drm_bridge.c | 30 ++++--------------------------
 1 file changed, 4 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c96847fc0ebc..198fd471a488 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -527,16 +527,7 @@ EXPORT_SYMBOL(drm_bridge_chain_disable);
  */
 void drm_bridge_chain_post_disable(struct drm_bridge *bridge)
 {
-	struct drm_encoder *encoder;
-
-	if (!bridge)
-		return;
-
-	encoder = bridge->encoder;
-	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
-		if (bridge->funcs->post_disable)
-			bridge->funcs->post_disable(bridge);
-	}
+	drm_atomic_bridge_chain_post_disable(bridge, NULL);
 }
 EXPORT_SYMBOL(drm_bridge_chain_post_disable);
 
@@ -582,20 +573,7 @@ EXPORT_SYMBOL(drm_bridge_chain_mode_set);
  */
 void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
 {
-	struct drm_encoder *encoder;
-	struct drm_bridge *iter;
-
-	if (!bridge)
-		return;
-
-	encoder = bridge->encoder;
-	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
-		if (iter->funcs->pre_enable)
-			iter->funcs->pre_enable(iter);
-
-		if (iter == bridge)
-			break;
-	}
+	drm_atomic_bridge_chain_pre_enable(bridge, NULL);
 }
 EXPORT_SYMBOL(drm_bridge_chain_pre_enable);
 
@@ -690,7 +668,7 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
 
 	encoder = bridge->encoder;
 	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
-		if (bridge->funcs->atomic_post_disable) {
+		if (old_state && bridge->funcs->atomic_post_disable) {
 			struct drm_bridge_state *old_bridge_state;
 
 			old_bridge_state =
@@ -732,7 +710,7 @@ void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
 
 	encoder = bridge->encoder;
 	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
-		if (iter->funcs->atomic_pre_enable) {
+		if (old_state && iter->funcs->atomic_pre_enable) {
 			struct drm_bridge_state *old_bridge_state;
 
 			old_bridge_state =
-- 
2.7.4

