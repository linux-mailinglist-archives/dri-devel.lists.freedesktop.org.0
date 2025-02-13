Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 007B2A34321
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 15:45:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5978910EAF3;
	Thu, 13 Feb 2025 14:45:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="D1Myulvq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76B810EAEB
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:45:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A9468A4201C;
 Thu, 13 Feb 2025 14:43:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5142EC4CEE2;
 Thu, 13 Feb 2025 14:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739457903;
 bh=d0IKwyPVT4JrY/MuE5IPA6hkm62TEwtb6uQJ6pWV0B8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=D1MyulvqHzRhwRwx1ygu/OVS/7khcfA9fbKmoH3aQAjlnSpkD9tZqR74U8FDxtsUd
 e2cmrVSFTsBjkbOftNv9pS64SBsF+5Gc/H/imB90Fu6N61RbFS2c9k2SzowGokJdSR
 pklGw0kzzV63HlKkRP0Vw/EtQht9hcHzxmkh8lLzkzm2UtaaQ5o8oCt6xF7CQR4Bw2
 PMIn655tTd1lxVJoix7hmVjXtVknDK5FerfVrxvIS+yxNgS877oOiaNShmtnR0Q3cI
 W7LMc+qHphEcpbBIn7cbcKayTunde5rR58VwI3h8g/hOay9yq1mJGqLXZpsb0X85HE
 WijBs9IgDamqQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 13 Feb 2025 15:43:44 +0100
Subject: [PATCH v3 25/37] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_commit_cleanup_done()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-bridge-connector-v3-25-e71598f49c8f@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2632; i=mripard@kernel.org;
 h=from:subject:message-id; bh=d0IKwyPVT4JrY/MuE5IPA6hkm62TEwtb6uQJ6pWV0B8=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnrWBXT+gXuPeUQqRap6U3MXLFk/tSflyO+rTxfa9QS+
 ELZdrpEx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjInwuMDRO5hKz6VzzMv7S9
 7+HalYknPLqMHO4aXNj3qW2OPu/m4yKPdTk+PNSb+H+m2Y7bk+4nLmesL99Z+efKiakz6osOKEg
 e1BSq6ftu4nF15a3pfdLXk3rEp1bcayi8VXv8P4f8fLE823kvAQ==
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
index c4de263f7c0dc5750bc99cf8f719707a7e384de9..df07923a57be5e0bdc135dfa5752645ff30e9827 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2560,27 +2560,27 @@ void drm_atomic_helper_commit_hw_done(struct drm_atomic_state *state)
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
@@ -2589,13 +2589,13 @@ void drm_atomic_helper_commit_cleanup_done(struct drm_atomic_state *old_state)
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

