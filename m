Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5D3A12D25
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 22:06:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304AC10E7E5;
	Wed, 15 Jan 2025 21:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CtJJQf+q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC28B10E7E7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 21:05:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 634045C5E90;
 Wed, 15 Jan 2025 21:05:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8503EC4CEE2;
 Wed, 15 Jan 2025 21:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736975158;
 bh=jrW4OZul1IIHd+cW8sCFwOefiIlmodcDT+REyvjTBCU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=CtJJQf+qSBrfDDMoIKGI3QTIV/BLFgIyacJHlD6jJ2TTZsVoDbm4laxEv8lQPYxHV
 /4FnlZfcvJfiBnLsDf/Nk+9olC4AcHpDO0aTrlAw4EvY17+oZjDhLaqhw47wgwequA
 nOJom8DRvkgaD15+Fp18/HPnm4a5bUlJR3GqW7acFjRQmwlbkkgRfvYq+irRf9p5Va
 q7lhdFIDuznrVwB+IhiPpks+Kava/xWCS89+1SzJyHeyg3e6ItkKlI6pqWC7uJ4iNg
 RRankKOmsbVDBcdTvBeq7X/nFsn+BzLvweZEw9daQ00VEsnqrsF/Qh2+FGb35OkFgU
 0ScIoF9DP1mRw==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 Jan 2025 22:05:13 +0100
Subject: [PATCH 06/29] drm/atomic-helper: Change parameter name of
 disable_outputs()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-bridge-connector-v1-6-9a2fecd886a6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4016; i=mripard@kernel.org;
 h=from:subject:message-id; bh=jrW4OZul1IIHd+cW8sCFwOefiIlmodcDT+REyvjTBCU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOkdyuJntDsv71tsPNVzuZTzislR2z8dDP3Uctt7aVh00
 /0FpRvNO6ayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBENpcyNszwzNoUWPo6MsRW
 T9j24wbPWVwCvAeCmiT5VI36A/9fTMvSjn73VXGD0NdvU3c0SKcYMtY7meSv0Z744Hzow/6NR98
 k3N14RUmq0F7vrXbs0wPsazfN/lrreujJHP/vl69O9DKv3LYaAA==
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

disable_outputs() disables all connectors and CRTCs affected by a
commit. It takes the drm_atomic_state being committed as a parameter.

However, that parameter name is called as old_state, which is pretty
confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index d5129de2278d5f62c136f8b6c831f903d9e53927..0d561b5c249a79a723e047f061d4103ef7742e87 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1148,19 +1148,19 @@ crtc_needs_disable(struct drm_crtc_state *old_state,
 	       (old_state->self_refresh_active && !new_state->active) ||
 	       new_state->self_refresh_active;
 }
 
 static void
-disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
+disable_outputs(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	struct drm_connector *connector;
 	struct drm_connector_state *old_conn_state, *new_conn_state;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	int i;
 
-	for_each_oldnew_connector_in_state(old_state, connector, old_conn_state, new_conn_state, i) {
+	for_each_oldnew_connector_in_state(state, connector, old_conn_state, new_conn_state, i) {
 		const struct drm_encoder_helper_funcs *funcs;
 		struct drm_encoder *encoder;
 		struct drm_bridge *bridge;
 
 		/*
@@ -1168,15 +1168,15 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
 		 * still on. So need to check the old, saved state.
 		 */
 		if (!old_conn_state->crtc)
 			continue;
 
-		old_crtc_state = drm_atomic_get_old_crtc_state(old_state, old_conn_state->crtc);
+		old_crtc_state = drm_atomic_get_old_crtc_state(state, old_conn_state->crtc);
 
 		if (new_conn_state->crtc)
 			new_crtc_state = drm_atomic_get_new_crtc_state(
-						old_state,
+						state,
 						new_conn_state->crtc);
 		else
 			new_crtc_state = NULL;
 
 		if (!crtc_needs_disable(old_crtc_state, new_crtc_state) ||
@@ -1199,28 +1199,28 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
 		/*
 		 * Each encoder has at most one connector (since we always steal
 		 * it away), so we won't call disable hooks twice.
 		 */
 		bridge = drm_bridge_chain_get_first_bridge(encoder);
-		drm_atomic_bridge_chain_disable(bridge, old_state);
+		drm_atomic_bridge_chain_disable(bridge, state);
 
 		/* Right function depends upon target state. */
 		if (funcs) {
 			if (funcs->atomic_disable)
-				funcs->atomic_disable(encoder, old_state);
+				funcs->atomic_disable(encoder, state);
 			else if (new_conn_state->crtc && funcs->prepare)
 				funcs->prepare(encoder);
 			else if (funcs->disable)
 				funcs->disable(encoder);
 			else if (funcs->dpms)
 				funcs->dpms(encoder, DRM_MODE_DPMS_OFF);
 		}
 
-		drm_atomic_bridge_chain_post_disable(bridge, old_state);
+		drm_atomic_bridge_chain_post_disable(bridge, state);
 	}
 
-	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
+	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
 		const struct drm_crtc_helper_funcs *funcs;
 		int ret;
 
 		/* Shut down everything that needs a full modeset. */
 		if (!drm_atomic_crtc_needs_modeset(new_crtc_state))
@@ -1237,11 +1237,11 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
 
 		/* Right function depends upon target state. */
 		if (new_crtc_state->enable && funcs->prepare)
 			funcs->prepare(crtc);
 		else if (funcs->atomic_disable)
-			funcs->atomic_disable(crtc, old_state);
+			funcs->atomic_disable(crtc, state);
 		else if (funcs->disable)
 			funcs->disable(crtc);
 		else if (funcs->dpms)
 			funcs->dpms(crtc, DRM_MODE_DPMS_OFF);
 

-- 
2.47.1

