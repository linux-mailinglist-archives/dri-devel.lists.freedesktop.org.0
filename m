Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FBA257C7F
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 17:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB556E391;
	Mon, 31 Aug 2020 15:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC2CB6E391;
 Mon, 31 Aug 2020 15:30:55 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 617D22083E;
 Mon, 31 Aug 2020 15:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598887855;
 bh=8CtIqjoJ1SacnqIRXbMc/xIzgI0xr7BYm3qPaqxHkiQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nqF9PlkkzTELR9ousLPemeWA5tFLVOAjoTQsl0Y6L3KD1FFUC100HDV4LztY2Ctu2
 e1EG3wdmqc22l6f3LtVAZJsskShI6nTxXN2IH+Lm3PqMMGjfcqq8lymB/78NqxrJmU
 LwlKJlFpVUjKTC4YXWagGgI5LRJ/leBtAUZ9kVQE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 09/23] drm/msm: enable vblank during atomic commits
Date: Mon, 31 Aug 2020 11:30:25 -0400
Message-Id: <20200831153039.1024302-9-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200831153039.1024302-1-sashal@kernel.org>
References: <20200831153039.1024302-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Rob Clark <robdclark@chromium.org>, Sasha Levin <sashal@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

[ Upstream commit 43906812eaab06423f56af5cca9a9fcdbb4ac454 ]

This has roughly the same effect as drm_atomic_helper_wait_for_vblanks(),
basically just ensuring that vblank accounting is enabled so that we get
valid timestamp/seqn on pageflip events.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/msm_atomic.c | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 5ccfad794c6a5..561bfa48841c3 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -27,6 +27,34 @@ int msm_atomic_prepare_fb(struct drm_plane *plane,
 	return msm_framebuffer_prepare(new_state->fb, kms->aspace);
 }
 
+/*
+ * Helpers to control vblanks while we flush.. basically just to ensure
+ * that vblank accounting is switched on, so we get valid seqn/timestamp
+ * on pageflip events (if requested)
+ */
+
+static void vblank_get(struct msm_kms *kms, unsigned crtc_mask)
+{
+	struct drm_crtc *crtc;
+
+	for_each_crtc_mask(kms->dev, crtc, crtc_mask) {
+		if (!crtc->state->active)
+			continue;
+		drm_crtc_vblank_get(crtc);
+	}
+}
+
+static void vblank_put(struct msm_kms *kms, unsigned crtc_mask)
+{
+	struct drm_crtc *crtc;
+
+	for_each_crtc_mask(kms->dev, crtc, crtc_mask) {
+		if (!crtc->state->active)
+			continue;
+		drm_crtc_vblank_put(crtc);
+	}
+}
+
 static void msm_atomic_async_commit(struct msm_kms *kms, int crtc_idx)
 {
 	unsigned crtc_mask = BIT(crtc_idx);
@@ -44,6 +72,8 @@ static void msm_atomic_async_commit(struct msm_kms *kms, int crtc_idx)
 
 	kms->funcs->enable_commit(kms);
 
+	vblank_get(kms, crtc_mask);
+
 	/*
 	 * Flush hardware updates:
 	 */
@@ -58,6 +88,8 @@ static void msm_atomic_async_commit(struct msm_kms *kms, int crtc_idx)
 	kms->funcs->wait_flush(kms, crtc_mask);
 	trace_msm_atomic_wait_flush_finish(crtc_mask);
 
+	vblank_put(kms, crtc_mask);
+
 	mutex_lock(&kms->commit_lock);
 	kms->funcs->complete_commit(kms, crtc_mask);
 	mutex_unlock(&kms->commit_lock);
@@ -221,6 +253,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 	 */
 	kms->pending_crtc_mask &= ~crtc_mask;
 
+	vblank_get(kms, crtc_mask);
+
 	/*
 	 * Flush hardware updates:
 	 */
@@ -235,6 +269,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 	kms->funcs->wait_flush(kms, crtc_mask);
 	trace_msm_atomic_wait_flush_finish(crtc_mask);
 
+	vblank_put(kms, crtc_mask);
+
 	mutex_lock(&kms->commit_lock);
 	kms->funcs->complete_commit(kms, crtc_mask);
 	mutex_unlock(&kms->commit_lock);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
