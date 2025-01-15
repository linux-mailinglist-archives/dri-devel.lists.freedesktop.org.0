Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD33A12D2E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 22:06:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4AA610E7E8;
	Wed, 15 Jan 2025 21:06:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qQLSWi0W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A03E10E7E8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 21:06:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AEFB7A42519;
 Wed, 15 Jan 2025 21:04:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0FD3C4CEE1;
 Wed, 15 Jan 2025 21:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736975178;
 bh=LOKttQ8nGaUtTC20bGo7CfKeiLgqBv/SSB8f+7ogkeA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=qQLSWi0Wy7jm989bOccZHJbJRQzGEDS2JOOC0l52alRQhxalxtNBxwQ1J5Fue7jFa
 RcVHXeYBUXPePXk24x06k65VgK1RbaJRRhhAOImPfOaeAMuwRLsL1wrgQdZXm+/5Hz
 5SVKIF0gnTLH1jNTZ6I5oQw1BmvUEPlJ+pX6mHRNwjYn+FoZUoShlc+dgnBwqITRwh
 UUmYDKt3rlnylt8t26A/ZtkgRul6Ui220CFptN/WQFki+Gr53TjNpbp4eEjnd7+mbz
 vnB5VXgSHUkJRgIK6rTjMFw/q1aqx3gQrzIFykt8ccb3DxZ4wHLfe/msNvGx8turol
 glzprQdZqV5ZA==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 Jan 2025 22:05:20 +0100
Subject: [PATCH 13/29] drm/bridge: Change parameter name of
 drm_atomic_bridge_chain_pre_enable()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-bridge-connector-v1-13-9a2fecd886a6@kernel.org>
References: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
In-Reply-To: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3079; i=mripard@kernel.org;
 h=from:subject:message-id; bh=LOKttQ8nGaUtTC20bGo7CfKeiLgqBv/SSB8f+7ogkeA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOkdylLMnntkeCT/e0pwuH+9ybve5JqEgvt1nuVrGZ10v
 368E6TRMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTAC4Sx1hfnHqnYqffqeMm5xX8
 ly1asfzEfNOi9+2qStz9K7K0RQ679F63nTrhxaw3LWc3P/K49zuSsb5Uvf/e/8daujopG6SEAna
 sZrNXjpgQKieRuXHSVA53cY7qM57WPgpPVFK1ss9YmKXuAAA=
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
 drivers/gpu/drm/drm_bridge.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 9755761d0d0f2659cf8d71e1734aee9772cc8c0f..b060b699e059f0d4bd47dcc4aba49399ce45b332 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -690,17 +690,17 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
 	}
 }
 EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
 
 static void drm_atomic_bridge_call_pre_enable(struct drm_bridge *bridge,
-					      struct drm_atomic_state *old_state)
+					      struct drm_atomic_state *state)
 {
-	if (old_state && bridge->funcs->atomic_pre_enable) {
+	if (state && bridge->funcs->atomic_pre_enable) {
 		struct drm_bridge_state *old_bridge_state;
 
 		old_bridge_state =
-			drm_atomic_get_old_bridge_state(old_state,
+			drm_atomic_get_old_bridge_state(state,
 							bridge);
 		if (WARN_ON(!old_bridge_state))
 			return;
 
 		bridge->funcs->atomic_pre_enable(bridge, old_bridge_state);
@@ -711,11 +711,11 @@ static void drm_atomic_bridge_call_pre_enable(struct drm_bridge *bridge,
 
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
@@ -731,11 +731,11 @@ static void drm_atomic_bridge_call_pre_enable(struct drm_bridge *bridge,
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
@@ -770,15 +770,15 @@ void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
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
2.47.1

