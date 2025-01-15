Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 665B3A12D36
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 22:06:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F97410E7FC;
	Wed, 15 Jan 2025 21:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ac+Eoaqa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA2A10E800
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 21:06:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 76E225C5E9C;
 Wed, 15 Jan 2025 21:05:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AF5FC4CED1;
 Wed, 15 Jan 2025 21:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736975197;
 bh=JlNpKq0AqEF+LIgcS78N6Jf/PshBRGdHw/rz3bhUe7g=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Ac+EoaqaOcamWhz3k5jOYDPP8RGEt1ahxxAZXzaEC5MCl8qlehQSzx+pI27svQUKn
 p0VxKC6QzR3qRrm5xXVzHh2s57pG7rNmrRsQJ28a4WNdXDFbK4of0iP59YwazSwTQ3
 l9C5k9QZ+qhDyW0VAE+RqS/nY+BU/2THunDNZYqd9SKXxFR4mINPYUHyz44/fD23+q
 T4LNg3YGDs0vFqsKf07vnC1I2CLZCBgjud0O7S2P4Q+1RiYbeXbXKkL008INsDyJyc
 KejMN9bDQGM1zh44VaXuBSmSyV66GX6HVwcqDuVKxv+HP9dNJ18nmYxOnBl3eAHCUv
 Bue2KcnpS42sA==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 Jan 2025 22:05:27 +0100
Subject: [PATCH 20/29] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_commit_cleanup_done()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-bridge-connector-v1-20-9a2fecd886a6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3045; i=mripard@kernel.org;
 h=from:subject:message-id; bh=JlNpKq0AqEF+LIgcS78N6Jf/PshBRGdHw/rz3bhUe7g=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOkdynLW95u89EVuNYV/fJybfo1PYRXnrRPxa5MVdm472
 HovKJ6xYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEzk33LGOt3mGNFvpUW8yQEf
 fpyTsLU+Ff1j75nwq1ukxc7d33SqMD2L/azLm8/1DAoxfy2DXv97wdgwceoepyJnhV5Rl8v/dOb
 KioiJbLz+a91MhZ3M/7wzJZ+FbnXxi/QQeWTLvFH3pXvu3eUA
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

drm_atomic_helper_wait_for_dependencies() is the final part of a commit
and signals it completion. It takes the drm_atomic_state being committed
as a parameter.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 000ae2d4ded286458ee386e34336d650907a8073..baa32b10c4a08252b736927fedd36c3fccbe6020 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2541,36 +2541,36 @@ void drm_atomic_helper_commit_hw_done(struct drm_atomic_state *state)
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
  * drm_atomic_helper_commit_cleanup_done - signal completion of commit
- * @old_state: atomic state object with old state structures
+ * @state: atomic state object being committed
  *
- * This signals completion of the atomic update @old_state, including any
+ * This signals completion of the atomic update @state, including any
  * cleanup work. If used, it must be called right before calling
  * drm_atomic_state_put().
  *
  * This is part of the atomic helper support for nonblocking commits, see
  * drm_atomic_helper_setup_commit() for an overview.
  */
-void drm_atomic_helper_commit_cleanup_done(struct drm_atomic_state *old_state)
+void drm_atomic_helper_commit_cleanup_done(struct drm_atomic_state *state)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
 	struct drm_crtc_commit *commit;
 	int i;
 
-	for_each_old_crtc_in_state(old_state, crtc, old_crtc_state, i) {
+	for_each_old_crtc_in_state(state, crtc, old_crtc_state, i) {
 		commit = old_crtc_state->commit;
 		if (WARN_ON(!commit))
 			continue;
 
 		complete_all(&commit->cleanup_done);
@@ -2579,13 +2579,13 @@ void drm_atomic_helper_commit_cleanup_done(struct drm_atomic_state *old_state)
 		spin_lock(&crtc->commit_lock);
 		list_del(&commit->commit_entry);
 		spin_unlock(&crtc->commit_lock);
 	}
 
-	if (old_state->fake_commit) {
-		complete_all(&old_state->fake_commit->cleanup_done);
-		WARN_ON(!try_wait_for_completion(&old_state->fake_commit->hw_done));
+	if (state->fake_commit) {
+		complete_all(&state->fake_commit->cleanup_done);
+		WARN_ON(!try_wait_for_completion(&state->fake_commit->hw_done));
 	}
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_cleanup_done);
 
 /**

-- 
2.47.1

