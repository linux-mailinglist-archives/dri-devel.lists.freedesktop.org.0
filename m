Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D44B9A3431A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 15:44:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E06B10EAE7;
	Thu, 13 Feb 2025 14:44:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P08qcGtf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B7D10EAE7
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:44:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 99487A4201C;
 Thu, 13 Feb 2025 14:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44957C4CED1;
 Thu, 13 Feb 2025 14:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739457895;
 bh=wwZQ1j4VdfaMYnvlxrr/7i0R0ZreusT6A9z+rTPjyow=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=P08qcGtfTNb77tWTTXQdCowdrEP6wSL0qzK2PBCnmYYg0ieHYy/1C/pG36qAHHmks
 oZaZZUrtCPpTv82DoTEpLB4ozROHGyfA4C6D++E6XlhoDDee96cJ6rK2wdegfrG0ap
 5pOxAX8PlwRN8Ezsde1dXUW2Ff1/nX4zNMBRD9ZjrdsApWp0avqybqvtJ20xvZLkCZ
 xAvHsAASxIxZZ00hD7QG/h1pL3cl69LN+2uDUNFSLOWYZ13ZTWIgOImk+lBno5h7hK
 QLynIAqhi16RbgmhwpbOX/SwLeoQdgNLWeABXHWFh7O/DLl3HU/g8NTnPrf9oPjj4D
 bP7Jfb7DVUWMQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 13 Feb 2025 15:43:41 +0100
Subject: [PATCH v3 22/37] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_commit_hw_done()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-bridge-connector-v3-22-e71598f49c8f@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2711; i=mripard@kernel.org;
 h=from:subject:message-id; bh=wwZQ1j4VdfaMYnvlxrr/7i0R0ZreusT6A9z+rTPjyow=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnrWOX/+bY9ePWy9npNmtC8z/vdFgcy6X/d+8wmtnhZu
 pbfFgmLjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCR9DzGhn1HbhWm7V35xqW/
 xWK6W/v76u1f9ITN39x2yZ8lYmG396l+ReifnPqPatWGH3k+37dPYKwv/jltHoOVF1eGdYuen4L
 +t2XX24s2dcqEPe1Z86Tx+OS4naZG03ms7zatnNc4S94rshYA
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

drm_atomic_helper_commit_hw_done() signals hardware completion of a
given commit. It takes the drm_atomic_state being committed as a
parameter.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 37d1bbffd1feed4323e91fadef155d19f51ca5a8..8b1a0520a49a1831951c5419a6c86573b62f5bfd 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2511,11 +2511,11 @@ void drm_atomic_helper_fake_vblank(struct drm_atomic_state *state)
 }
 EXPORT_SYMBOL(drm_atomic_helper_fake_vblank);
 
 /**
  * drm_atomic_helper_commit_hw_done - setup possible nonblocking commit
- * @old_state: atomic state object with old state structures
+ * @state: atomic state object being committed
  *
  * This function is used to signal completion of the hardware commit step. After
  * this step the driver is not allowed to read or change any permanent software
  * or hardware modeset state. The only exception is state protected by other
  * means than &drm_modeset_lock locks.
@@ -2524,18 +2524,18 @@ EXPORT_SYMBOL(drm_atomic_helper_fake_vblank);
  * this function is called.
  *
  * This is part of the atomic helper support for nonblocking commits, see
  * drm_atomic_helper_setup_commit() for an overview.
  */
-void drm_atomic_helper_commit_hw_done(struct drm_atomic_state *old_state)
+void drm_atomic_helper_commit_hw_done(struct drm_atomic_state *state)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	struct drm_crtc_commit *commit;
 	int i;
 
-	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
+	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
 		commit = new_crtc_state->commit;
 		if (!commit)
 			continue;
 
 		/*
@@ -2551,13 +2551,13 @@ void drm_atomic_helper_commit_hw_done(struct drm_atomic_state *old_state)
 		/* backend must have consumed any event by now */
 		WARN_ON(new_crtc_state->event);
 		complete_all(&commit->hw_done);
 	}
 
-	if (old_state->fake_commit) {
-		complete_all(&old_state->fake_commit->hw_done);
-		complete_all(&old_state->fake_commit->flip_done);
+	if (state->fake_commit) {
+		complete_all(&state->fake_commit->hw_done);
+		complete_all(&state->fake_commit->flip_done);
 	}
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_hw_done);
 
 /**

-- 
2.48.0

