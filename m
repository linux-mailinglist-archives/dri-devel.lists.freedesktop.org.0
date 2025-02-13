Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEC5A3431D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 15:45:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E28E10EAEA;
	Thu, 13 Feb 2025 14:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oK7meAa6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E7F10EAE8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:44:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3E145A41D5E;
 Thu, 13 Feb 2025 14:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA00C4CED1;
 Thu, 13 Feb 2025 14:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739457898;
 bh=my2FYGu0nJOuFswwXP+mK4jSCPN3NSGG8WBsHjpkHlU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=oK7meAa66ktk+fU1ynOyk1JtxYhIUMCxgL5G+ryRT+36ECtpueIGHdT6KPP1gDzTP
 i3b5L1sYQljf/dA9fIWDY6fTYIWnbFoQ+xTZ49Af8VG5hlW5c+BfSwSeTT9jG+ohEj
 +GEOCNBBtnslqp7L8qZm/qPaDAPrPVOO8AGYysxLNa2qfoo0pw0YfJc7UkfSRH1L1h
 /WvCgLIUBifnen/5L4PhkYklJg6Cl7jKhQfeMVzMz4mAJ61eTkHQAMZSukqQnxKp9u
 /NdZpuTsfIou6DwaRYjoFWrXzC3p5UtUyJDyA69XQoMQ4yXQzmLPApF4V4fCqBMasT
 yyn4B7TjmH39Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 13 Feb 2025 15:43:42 +0100
Subject: [PATCH v3 23/37] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_wait_for_vblanks()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-bridge-connector-v3-23-e71598f49c8f@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3197; i=mripard@kernel.org;
 h=from:subject:message-id; bh=my2FYGu0nJOuFswwXP+mK4jSCPN3NSGG8WBsHjpkHlU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnrWBVei36/LzVbT0Vm7VXnvpO7c9edq5u9xiDIkX3JS
 m8bPZU9HVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiHqmMDd9+WgitW3xnGpMy
 742vhz5y7JW8s8lQulZi2TPJLdVlGSxRKrMv1IvwyF15UZzfvv+JDmOd4X0rC0X1CN+/SrXZ/VV
 vFjIFfdyQnry6MCAsoafPpLDnSIzwk5qARTrlz1c6P/j95QQA
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

drm_atomic_helper_wait_for_vblanks() waits for vblank events on all the
CRTCs affected by a commit. It takes the drm_atomic_state being
committed as a parameter.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 8b1a0520a49a1831951c5419a6c86573b62f5bfd..d2bd7862e0158647d9638a6db25a8743f89ad7c6 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1666,11 +1666,11 @@ int drm_atomic_helper_wait_for_fences(struct drm_device *dev,
 EXPORT_SYMBOL(drm_atomic_helper_wait_for_fences);
 
 /**
  * drm_atomic_helper_wait_for_vblanks - wait for vblank on CRTCs
  * @dev: DRM device
- * @old_state: atomic state object with old state structures
+ * @state: atomic state object being committed
  *
  * Helper to, after atomic commit, wait for vblanks on all affected
  * CRTCs (ie. before cleaning up old framebuffers using
  * drm_atomic_helper_cleanup_planes()). It will only wait on CRTCs where the
  * framebuffers have actually changed to optimize for the legacy cursor and
@@ -1680,44 +1680,44 @@ EXPORT_SYMBOL(drm_atomic_helper_wait_for_fences);
  * drm_atomic_helper_setup_commit() should look at
  * drm_atomic_helper_wait_for_flip_done() as an alternative.
  */
 void
 drm_atomic_helper_wait_for_vblanks(struct drm_device *dev,
-		struct drm_atomic_state *old_state)
+				   struct drm_atomic_state *state)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	int i, ret;
 	unsigned int crtc_mask = 0;
 
 	 /*
 	  * Legacy cursor ioctls are completely unsynced, and userspace
 	  * relies on that (by doing tons of cursor updates).
 	  */
-	if (old_state->legacy_cursor_update)
+	if (state->legacy_cursor_update)
 		return;
 
-	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
+	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
 		if (!new_crtc_state->active)
 			continue;
 
 		ret = drm_crtc_vblank_get(crtc);
 		if (ret != 0)
 			continue;
 
 		crtc_mask |= drm_crtc_mask(crtc);
-		old_state->crtcs[i].last_vblank_count = drm_crtc_vblank_count(crtc);
+		state->crtcs[i].last_vblank_count = drm_crtc_vblank_count(crtc);
 	}
 
-	for_each_old_crtc_in_state(old_state, crtc, old_crtc_state, i) {
+	for_each_old_crtc_in_state(state, crtc, old_crtc_state, i) {
 		if (!(crtc_mask & drm_crtc_mask(crtc)))
 			continue;
 
 		ret = wait_event_timeout(dev->vblank[i].queue,
-				old_state->crtcs[i].last_vblank_count !=
-					drm_crtc_vblank_count(crtc),
-				msecs_to_jiffies(100));
+					 state->crtcs[i].last_vblank_count !=
+						drm_crtc_vblank_count(crtc),
+					 msecs_to_jiffies(100));
 
 		WARN(!ret, "[CRTC:%d:%s] vblank wait timed out\n",
 		     crtc->base.id, crtc->name);
 
 		drm_crtc_vblank_put(crtc);

-- 
2.48.0

