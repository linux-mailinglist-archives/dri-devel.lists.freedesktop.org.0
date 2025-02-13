Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8ABCA34331
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 15:45:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A8810EAEE;
	Thu, 13 Feb 2025 14:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G6HbeCUn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7963210EAED
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:45:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 58015A42101;
 Thu, 13 Feb 2025 14:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0415EC4CEE8;
 Thu, 13 Feb 2025 14:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739457917;
 bh=KSXYWH3Ves9FGs7/gAI9crsBWVHKvvZPhvWTImVWl3g=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=G6HbeCUnoMEqq0sib9Sm5hvc/g5lQc2ZL4c6grKhlXsSUOpXS/1I+5xBf6adm58s0
 NUnzvmlZGthij0PvaYx8zbQG1BMGTxhb/vXjPdp5T8Gl7pGAs/G1B48a0NHMgeZ0fl
 R3mTpvFaTnq6RnvSvUiDGizIaBiiWtu+V43bomessMCR9+a0CUKyc70MteOkpUUryW
 6c86WKtJZjGO5vcB1r+E80toa93X97R2jwbu8IWKVDbycODdg6XiAFSbriS+o4FCas
 jDm3YxeVCrX82dr7iErLsEFsND5tBp2SjCDnugaZZHTu0aUQYBMJHXhhcso756g2iM
 EsX6FFLHG6b0w==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 13 Feb 2025 15:43:49 +0100
Subject: [PATCH v3 30/37] drm/bridge: Assume that a bridge is atomic if it
 has atomic_reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-bridge-connector-v3-30-e71598f49c8f@kernel.org>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
In-Reply-To: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1817; i=mripard@kernel.org;
 h=from:subject:message-id; bh=KSXYWH3Ves9FGs7/gAI9crsBWVHKvvZPhvWTImVWl3g=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnrWJUPJUQen3uaP/1F+JVMc23GzpAns88osIvMieIpn
 ysc+qOuYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAExk+w7GOiVdJ93n817sUH1s
 XefG6lkql7OrpDdoccOxMMV/N5KmRjHu45eZu312oDt/foX4v7eejA0nLpTsbJnibnvKMNzg144
 TM9W/ph17//f3qrevYgVXqvJU7e7oTlji0xhrUHRzd8xD4bsA
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

The drm_atomic_bridge_check() runs the atomic_check callback if needed,
or falls back to mode_fixup if it's not there.

Going forward, we'll need to setup the bridge atomic state even though
drivers might not be implementing atomic_check at all.

We can thus switch to using drm_bridge_is_atomic() to take the atomic
path, and do additional things there in the future, or go the mode_fixup
route.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_bridge.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index d2525d0b1324cc3a63e32f5bf6ca6c4f9034eb4e..b6d24092674c8fa33d9b6ebab9ece0f91fb8f8ea 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -803,23 +803,25 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_enable);
 
 static int drm_atomic_bridge_check(struct drm_bridge *bridge,
 				   struct drm_crtc_state *crtc_state,
 				   struct drm_connector_state *conn_state)
 {
-	if (bridge->funcs->atomic_check) {
+	if (drm_bridge_is_atomic(bridge)) {
 		struct drm_bridge_state *bridge_state;
 		int ret;
 
 		bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
 							       bridge);
 		if (WARN_ON(!bridge_state))
 			return -EINVAL;
 
-		ret = bridge->funcs->atomic_check(bridge, bridge_state,
-						  crtc_state, conn_state);
-		if (ret)
-			return ret;
+		if (bridge->funcs->atomic_check) {
+			ret = bridge->funcs->atomic_check(bridge, bridge_state,
+							  crtc_state, conn_state);
+			if (ret)
+				return ret;
+		}
 	} else if (bridge->funcs->mode_fixup) {
 		if (!bridge->funcs->mode_fixup(bridge, &crtc_state->mode,
 					       &crtc_state->adjusted_mode))
 			return -EINVAL;
 	}

-- 
2.48.0

