Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1299CA342FF
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 15:44:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88E3710EAD9;
	Thu, 13 Feb 2025 14:44:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NxOjrP5Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CCFD10EADA
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:44:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 13298A425DC;
 Thu, 13 Feb 2025 14:42:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D969EC4CEE4;
 Thu, 13 Feb 2025 14:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739457855;
 bh=NI6vJLOVBk1TPqBaNUbOq5X/LysolC6w2KpfE4vM87c=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=NxOjrP5YR3HsncOStLOZ7wNXj/K4FAumZOpgmWEQDs/6C7Rp0AQ56F0U9M3Prk+vM
 7/BSWtgc1rn7k1DANW1rVK2ksEVfgt1cYr7S/PcRyxgJzAx0QZC33B2cKxNk2OiWh1
 aSJweI4vH1Qi5ugbrfIEozm+kreqrmcNCMoH/xD3ule4+kskXKqL2vlz8G6ri0CBnM
 AqqTApzTnLsceSd17PV4wUr8UHaP19heexsVB+Z21lY02cAswf/Uft5QRLyIc9RDJ/
 baL3b19bS+0SoSlWl17bTAfOUbS6xMMREBUU+6QQk7vdHAx6OUCmwqUuIE70++Cn0M
 MWzaYw8z9WaRg==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 13 Feb 2025 15:43:26 +0100
Subject: [PATCH v3 07/37] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_wait_for_dependencies()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-bridge-connector-v3-7-e71598f49c8f@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3070; i=mripard@kernel.org;
 h=from:subject:message-id; bh=NI6vJLOVBk1TPqBaNUbOq5X/LysolC6w2KpfE4vM87c=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnrWCWuZE1ZdGYz56L3m/8fvPjumi1PoffXB2ksD8X7d
 pc0W/9d0TGFhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAm0j2ZseH+2g3hf0P462wl
 HRZlSqxIsbabrd9t+P4b33mHmVJLile+fmKttafS+sWbW4yOFzeJBjCWp8f/u5sx05D/SGBnWdI
 v7ys6HT2Trnxadm6Op+fXvBBXxVAhpuUcqQaL1y71OfVS1gMA
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

drm_atomic_helper_wait_for_dependencies() waits for all the dependencies
a commit has before going forward with it. It takes the drm_atomic_state
being committed as a parameter.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index e8c30e151dc0af13fbf3d282cc8c5c32ef00c8ee..f859dae58a92d56ebed5a1fd7b2243a02b568297 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2421,48 +2421,48 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
 }
 EXPORT_SYMBOL(drm_atomic_helper_setup_commit);
 
 /**
  * drm_atomic_helper_wait_for_dependencies - wait for required preceding commits
- * @old_state: atomic state object with old state structures
+ * @state: atomic state object being committed
  *
  * This function waits for all preceding commits that touch the same CRTC as
- * @old_state to both be committed to the hardware (as signalled by
+ * @state to both be committed to the hardware (as signalled by
  * drm_atomic_helper_commit_hw_done()) and executed by the hardware (as signalled
  * by calling drm_crtc_send_vblank_event() on the &drm_crtc_state.event).
  *
  * This is part of the atomic helper support for nonblocking commits, see
  * drm_atomic_helper_setup_commit() for an overview.
  */
-void drm_atomic_helper_wait_for_dependencies(struct drm_atomic_state *old_state)
+void drm_atomic_helper_wait_for_dependencies(struct drm_atomic_state *state)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
 	struct drm_plane *plane;
 	struct drm_plane_state *old_plane_state;
 	struct drm_connector *conn;
 	struct drm_connector_state *old_conn_state;
 	int i;
 	long ret;
 
-	for_each_old_crtc_in_state(old_state, crtc, old_crtc_state, i) {
+	for_each_old_crtc_in_state(state, crtc, old_crtc_state, i) {
 		ret = drm_crtc_commit_wait(old_crtc_state->commit);
 		if (ret)
 			drm_err(crtc->dev,
 				"[CRTC:%d:%s] commit wait timed out\n",
 				crtc->base.id, crtc->name);
 	}
 
-	for_each_old_connector_in_state(old_state, conn, old_conn_state, i) {
+	for_each_old_connector_in_state(state, conn, old_conn_state, i) {
 		ret = drm_crtc_commit_wait(old_conn_state->commit);
 		if (ret)
 			drm_err(conn->dev,
 				"[CONNECTOR:%d:%s] commit wait timed out\n",
 				conn->base.id, conn->name);
 	}
 
-	for_each_old_plane_in_state(old_state, plane, old_plane_state, i) {
+	for_each_old_plane_in_state(state, plane, old_plane_state, i) {
 		ret = drm_crtc_commit_wait(old_plane_state->commit);
 		if (ret)
 			drm_err(plane->dev,
 				"[PLANE:%d:%s] commit wait timed out\n",
 				plane->base.id, plane->name);

-- 
2.48.0

