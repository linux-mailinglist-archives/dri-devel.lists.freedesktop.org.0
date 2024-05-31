Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAFD8D6ADF
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 22:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC22710E2A1;
	Fri, 31 May 2024 20:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h9F41wSU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F128810E2A1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 20:37:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E79F360C01;
 Fri, 31 May 2024 20:37:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 60A01C4AF09;
 Fri, 31 May 2024 20:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717187866;
 bh=WY531ZFWnLngKD/+q6EMBQ80fsxU9iBEBmfNN0fASI0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=h9F41wSUTOvzpThewcM4UF1PqEF9QEJ1Sa6H5Yi2OEH/S4eFxd0v6Hd/YbbOQ5zYJ
 hchmcaUZnP0ak+JWCK4oS7sdrouSK+ThkaT4I7G8WQ4IgfjAvWZ6X6+bYiZXB+QZhP
 pKEUuVepzPqWGSe7gxc/MpUPuLC0AJRC2oeHQb++2+diZ4tuy5W32fXjAp5Prguish
 /gcKj+q3vpRfFzagmFXTFi+3VR4S5rMmF2Z337zZNcf+ShDPY3scAyTqi/O447biSI
 EUaUEuPrgLaiRhZ88ySL+2a+a1zlYM65R3B3YZTBRZSpULbnXAuKhu2Tz4ZmxqREvs
 a4s8D0OoJzfTg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 554E9C27C51;
 Fri, 31 May 2024 20:37:46 +0000 (UTC)
From: Sam Ravnborg via B4 Relay <devnull+sam.ravnborg.org@kernel.org>
Date: Fri, 31 May 2024 22:37:46 +0200
Subject: [PATCH 2/2] drm/bridge: Drop drm_bridge_chain_mode_fixup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-bridge_chain_mode-v1-2-8b49e36c5dd3@ravnborg.org>
References: <20240531-bridge_chain_mode-v1-0-8b49e36c5dd3@ravnborg.org>
In-Reply-To: <20240531-bridge_chain_mode-v1-0-8b49e36c5dd3@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <mripard@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717187865; l=2934;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=xm7f++qnfzJgiUWk6f8lnMbUPrsPBwFJAzI7MRE8MMU=;
 b=CYV+punnp4i5EnYOF7WM7p5Tr4giEsg9rQzS+q54fSTqfQKj23xN+cQ8ABZfaxDnbquEbl+6FoCW
 5FR+KJ7MAX4qOtndDEElXMeSxZvkijk2u4hK5hiv1rVSiF1eblpM
X-Developer-Key: i=sam@ravnborg.org; a=ed25519;
 pk=R0+pqV7BRYOAeOIGkyOrSNke7arx5y3LkEuNi37YEyU=
X-Endpoint-Received: by B4 Relay for sam@ravnborg.org/20230107 with auth_id=22
X-Original-From: Sam Ravnborg <sam@ravnborg.org>
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
Reply-To: sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sam Ravnborg <sam@ravnborg.org>

There are no users left of drm_bridge_chain_mode_fixup() and we
do not want to have this function available, so drop it.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_bridge.c | 37 -------------------------------------
 include/drm/drm_bridge.h     |  3 ---
 2 files changed, 40 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 584d109330ab..d44f055dbe3e 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -467,43 +467,6 @@ void drm_bridge_detach(struct drm_bridge *bridge)
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
index 4baca0d9107b..5cf41f92d1f0 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -855,9 +855,6 @@ drm_bridge_chain_get_first_bridge(struct drm_encoder *encoder)
 #define drm_for_each_bridge_in_chain(encoder, bridge)			\
 	list_for_each_entry(bridge, &(encoder)->bridge_chain, chain_node)
 
-bool drm_bridge_chain_mode_fixup(struct drm_bridge *bridge,
-				 const struct drm_display_mode *mode,
-				 struct drm_display_mode *adjusted_mode);
 enum drm_mode_status
 drm_bridge_chain_mode_valid(struct drm_bridge *bridge,
 			    const struct drm_display_info *info,

-- 
2.34.1


