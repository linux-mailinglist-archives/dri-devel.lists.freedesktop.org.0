Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E041A3430F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 15:44:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C7C10EADF;
	Thu, 13 Feb 2025 14:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="igjosGTp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 971DA10EADF
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:44:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7D7535C56B8;
 Thu, 13 Feb 2025 14:43:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A052C4CEE2;
 Thu, 13 Feb 2025 14:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739457876;
 bh=VhozOToCIuuWgJPMTBZ0TdxopKzpTryg3XnM8dhr2Yk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=igjosGTpO9uHWGS4ivPZiWBFXqmwrW+NZxtX+ntb62QhJl78ymCIEtwBB05BB2RfG
 qwncbIaU7oN+NbVae0oz6wvtldlYTqQLVEQw7ayqLHxzRH/xoriYnO7NYkN6rgYj49
 SpbeCwAOEH0tQIlx3gndWeD8f72+Zf+yAiTzTJgd5tS+kh/QdQhjGU0C4qQNKd+pgM
 6ZkIwAiZzozOoMlbw8aiQMMXM+Wynadh/sAX0nCQl2pv27Xq6gYWX1MzPKFv556kg/
 i/447UsIqEs9B1G7j9ivRuIxIINo5lpLBhysUjeSQr2mF7nHqOdVw/IVlYQvq/QMIF
 Qchw+P/TWM8bg==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 13 Feb 2025 15:43:34 +0100
Subject: [PATCH v3 15/37] drm/atomic-helper: Change parameter name of
 crtc_set_mode()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-bridge-connector-v3-15-e71598f49c8f@kernel.org>
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
 Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2045; i=mripard@kernel.org;
 h=from:subject:message-id; bh=VhozOToCIuuWgJPMTBZ0TdxopKzpTryg3XnM8dhr2Yk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnrWGUq2HzSk2e8nPmXs1/dne9f4lsHzR87srs7bZ43C
 tQ7akt3TGVhEOZkkBVTZHkiE3Z6efviKgf7lT9g5rAygQxh4OIUgIkU+zPWF/6rSv90VM1uzaza
 d3f/M62fG6tj+q1L8Nzf1yfF/pWfPSh0OERj83a+/c9dYwptj8yWZWyYuo81stErP/nQN47YezM
 kStPrD9+YvOOPQpJnwbdwjTcPxV7P/JRYXDY7bAWvCPu8g0UA
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

crtc_set_mode() deals with calling the modeset related hooks for CRTC,
connectors and bridges if and when a new commit changes them. It takes
the drm_atomic_state being committed as a parameter.

However, that parameter name is called as old_state, which is pretty
confusing. Let's rename that variable as state.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index b118cd44cf9d95908223a2d297c4b74308613f63..6ca8bf5f433c9c93981f808ac1cb60a442674f78 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1373,19 +1373,19 @@ void drm_atomic_helper_calc_timestamping_constants(struct drm_atomic_state *stat
 	}
 }
 EXPORT_SYMBOL(drm_atomic_helper_calc_timestamping_constants);
 
 static void
-crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *old_state)
+crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *new_crtc_state;
 	struct drm_connector *connector;
 	struct drm_connector_state *new_conn_state;
 	int i;
 
-	for_each_new_crtc_in_state(old_state, crtc, new_crtc_state, i) {
+	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
 		const struct drm_crtc_helper_funcs *funcs;
 
 		if (!new_crtc_state->mode_changed)
 			continue;
 
@@ -1397,11 +1397,11 @@ crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *old_state)
 
 			funcs->mode_set_nofb(crtc);
 		}
 	}
 
-	for_each_new_connector_in_state(old_state, connector, new_conn_state, i) {
+	for_each_new_connector_in_state(state, connector, new_conn_state, i) {
 		const struct drm_encoder_helper_funcs *funcs;
 		struct drm_encoder *encoder;
 		struct drm_display_mode *mode, *adjusted_mode;
 		struct drm_bridge *bridge;
 

-- 
2.48.0

