Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB462A27514
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 15:59:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B3310E680;
	Tue,  4 Feb 2025 14:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oe9vFPEx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B9610E680
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 14:59:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DDC0F5C6A8A;
 Tue,  4 Feb 2025 14:58:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B9AC4CEDF;
 Tue,  4 Feb 2025 14:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738681176;
 bh=uemZSQBVexvbiw/5NK9pIq88uzqBpLnQsVM0zcTZNz8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=oe9vFPExGWnpflA1103jGqS21v8eO1q5yVnZxPELmUUVblk9EtSrlEEQx66NqhHvp
 oyXGiJ8lJTBeFYqK+HJ/E3kfUiiQaBvywn212aNZ7nAe/5qV6F+tnCT5KBj1XnHPYD
 hkoGz84Pu+Eq2wg8nImiRA1odNC85tm9LmGhfVBM/meKLLuDYYWLsfwJYIfPXg0pi3
 ow3B6LNXiwG66zS2dxEwfOQiiwxBk8q5VGTz1TKAZCWtYJXjsDdrOne4QjCvZaVC7h
 lnHZLbV+DvN1J6TabcQAXRwEi044AzoqWovWIEQIcpjK7bDNdWTKd3CzVM12LUzlJv
 qinyhfh8tR8hw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:46 +0100
Subject: [PATCH v2 18/35] drm/bridge: Change parameter name of
 drm_atomic_bridge_chain_pre_enable()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-18-35dd6c834e08@kernel.org>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
In-Reply-To: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2820; i=mripard@kernel.org;
 h=from:subject:message-id; bh=uemZSQBVexvbiw/5NK9pIq88uzqBpLnQsVM0zcTZNz8=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtD6sPlhi03qqyTj46S59Vsen128/jDD+eSRqUsbj5
 3pcaZwnOqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEvGsZG5qU+AoDJl2JeVhw
 6v46netnGqobJ+v/n6O81XP9Nam/FW+EC4PWazB66vGsX5i6oNwghbFh7r+IG7/6zs48vWjzqp5
 nVq/LVp5YH1F68HDvL5mc3RH7QoIO86w8sZN3LQ/X4rhH0cGeAA==
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

drm_atomic_bridge_chain_pre_enable() enables all bridges affected by
a new commit. It takes the drm_atomic_state being committed as a
parameter.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_bridge.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index ab166972b1b0df239ca014296be49846a857df6e..02ddfe962b99bed4316b2a7b0c72112e127afa8b 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -672,23 +672,23 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
 	}
 }
 EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
 
 static void drm_atomic_bridge_call_pre_enable(struct drm_bridge *bridge,
-					      struct drm_atomic_state *old_state)
+					      struct drm_atomic_state *state)
 {
 	if (old_state && bridge->funcs->atomic_pre_enable)
-		bridge->funcs->atomic_pre_enable(bridge, old_state);
+		bridge->funcs->atomic_pre_enable(bridge, state);
 	else if (bridge->funcs->pre_enable)
 		bridge->funcs->pre_enable(bridge);
 }
 
 /**
  * drm_atomic_bridge_chain_pre_enable - prepares for enabling all bridges in
  *					the encoder chain
  * @bridge: bridge control structure
- * @old_state: old atomic state
+ * @state: atomic state being committed
  *
  * Calls &drm_bridge_funcs.atomic_pre_enable (falls back on
  * &drm_bridge_funcs.pre_enable) op for all the bridges in the encoder chain,
  * starting from the last bridge to the first. These are called before calling
  * &drm_encoder_helper_funcs.atomic_enable
@@ -704,11 +704,11 @@ static void drm_atomic_bridge_call_pre_enable(struct drm_bridge *bridge,
  * Bridge C, Bridge D, Bridge E, Bridge A, Bridge B.
  *
  * Note: the bridge passed should be the one closest to the encoder
  */
 void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
-					struct drm_atomic_state *old_state)
+					struct drm_atomic_state *state)
 {
 	struct drm_encoder *encoder;
 	struct drm_bridge *iter, *next, *limit;
 
 	if (!bridge)
@@ -743,15 +743,15 @@ void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
 					/* At the first bridge to request prev
 					 * bridges called first.
 					 */
 					break;
 
-				drm_atomic_bridge_call_pre_enable(next, old_state);
+				drm_atomic_bridge_call_pre_enable(next, state);
 			}
 		}
 
-		drm_atomic_bridge_call_pre_enable(iter, old_state);
+		drm_atomic_bridge_call_pre_enable(iter, state);
 
 		if (iter->pre_enable_prev_first)
 			/* Jump all bridges that we have already pre_enabled */
 			iter = limit;
 

-- 
2.48.0

