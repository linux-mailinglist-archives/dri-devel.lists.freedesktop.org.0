Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 956EBA27522
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 16:00:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE8010E687;
	Tue,  4 Feb 2025 15:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Tzwh4Yrb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4A310E687
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 15:00:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4D6985C691D;
 Tue,  4 Feb 2025 14:59:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 245A8C4CEDF;
 Tue,  4 Feb 2025 15:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738681222;
 bh=wxVd7lUoXb1oyitPcmQJ0FDC/MvQ+LB6wONJbQIr0L0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Tzwh4Yrb1fdLH/8AvatYQadNTgaIQ/JgZJTSvIkSf5trO03CZ7wtlJ5ZC16Hq57KU
 kXAzw4nkpjVqC5dryG9oYa4d4HvbRe6RgPuaFSXKJ/+BSgNds2Wc5/yfFJF5WFnDlu
 bT8v+AtnGIOw27pfx7snb/XXDDhVEFOAN6/1ItC8HeMNiBcPKK2K2wc1dpLPxw4C1H
 N1U9qZgcglUkW4tQjrGGtg/OGqX23PksQz7iIhCITCT9rfn+OvMfccbkdkn7CL0W2H
 4HT3U7o+fTt4G8P8MtwlKo/b9VvFGqgYoG56ZfOEyYuKWFibH7854PfJUwh2rwzT8c
 BUknX2vB1Z6QA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:53 +0100
Subject: [PATCH v2 25/35] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_commit_cleanup_done()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-25-35dd6c834e08@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2632; i=mripard@kernel.org;
 h=from:subject:message-id; bh=wxVd7lUoXb1oyitPcmQJ0FDC/MvQ+LB6wONJbQIr0L0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtL5MPVz87vrdGVdfW2TFnjxdqmb8coqniLfj9YyuY
 K7ryY4pHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiZsqM9Yk9xxcY/FVO/sw0
 u+1Jf0hmkGTfM+1rnM/iHNJTLjfFJxaby7aX9vw8Mf3oxLsXvof9Z2z48ur0/TX3ph08v5/lQG/
 9Iq3lAjKHBX9wfo29/Xvvw2tvuxJl5j9czrs0vvrKvr7ppmLhAA==
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
 drivers/gpu/drm/drm_atomic_helper.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 3e6c5992fed09f5962e74844d360193c53915c88..baa32b10c4a08252b736927fedd36c3fccbe6020 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2550,27 +2550,27 @@ void drm_atomic_helper_commit_hw_done(struct drm_atomic_state *state)
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
2.48.0

