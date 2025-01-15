Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EB4A12D34
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 22:06:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F65D10E7FD;
	Wed, 15 Jan 2025 21:06:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EXrpd3Z5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F05910E7FF
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 21:06:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 30EF15C5EA4;
 Wed, 15 Jan 2025 21:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 520ECC4CED1;
 Wed, 15 Jan 2025 21:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736975191;
 bh=VbD59Rc/xrLvH8j0QsdsdtGobqdBYrbMJL7Oj4VqEQQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=EXrpd3Z5fFIp85nnyGaG57zFGSoPO4vagwMRYfcklq0yN8u/JFXUqYL8gVh6xLB0m
 rMXAwtCrfssRGoOgYiii/FM9ggEqv6LXUytu5sm5Fv495slBA7sEKKJg/h/k+3e8EF
 JzlvaEUfKn/yAyMo2+/JiVStEYPJ2q4DVu7hdUe3LMVxjE98vX7mOpwPPHbCGgyhG5
 AEJrVd4xQD+iN71uJIvAwzHt5lsI6dBiHiWckbJaHzzqc4/rR3nemCrHr+3f8SBMmL
 ZG6YhcWDRyUnhULl3v0W0Yn70G+fUYpf7PmL0rzr1jdKFwZn7LlT5WOf9QARpuja/X
 woVczZp1GBUBg==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 Jan 2025 22:05:25 +0100
Subject: [PATCH 18/29] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_wait_for_vblanks()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-bridge-connector-v1-18-9a2fecd886a6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3197; i=mripard@kernel.org;
 h=from:subject:message-id; bh=VbD59Rc/xrLvH8j0QsdsdtGobqdBYrbMJL7Oj4VqEQQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOkdyrIhlgvn7NmswNwhlsVa80d8Qi1v8b6cdZvlDV/aF
 VhM27C4YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEzk3zvGhvmmmgIXmwTr6io7
 Y9uW2+XNiz8y0/nH5cNzXdYeNv7nmDgv6ddivanZx6q2rY6/r5CpwNhwWCeY1WnlSmZPcYUrn6e
 4PhRa80Vs+fkJgQumiDpYfVu58MGV/jtyb1Qn2KxYckfiXqoSAA==
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
index d642bbc074bd364256409c91649f8d8aa10f5023..581fd0f14ba0aa2a9d0334cad49575de3fb5fb20 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1656,11 +1656,11 @@ int drm_atomic_helper_wait_for_fences(struct drm_device *dev,
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
@@ -1670,44 +1670,44 @@ EXPORT_SYMBOL(drm_atomic_helper_wait_for_fences);
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
2.47.1

