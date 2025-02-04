Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F60DA2751C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 15:59:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918F510E684;
	Tue,  4 Feb 2025 14:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Yhex3XTs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A79010E684
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 14:59:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2CEF35C68A3;
 Tue,  4 Feb 2025 14:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5847EC4CEDF;
 Tue,  4 Feb 2025 14:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738681191;
 bh=81LDedNj3nQakln3lCAqCLzPw6wbO6U1S1Y/G78LC7Q=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Yhex3XTszdQHhFejyvMRVj0udCAQSxM0b7AiB2aVaRhPiOPTXCHtgfHaE5ilOjArO
 U4LoRnU8XWScOUCEs6/7vx1CnRoYtlghkOovW0s/YA/p8ZHjkRaOnCxfSAFXdiqhsT
 kFRcq7PCrHAggI6QoXVOg92HZN40LuZtSDAdQtbnwKIswg1Kh073S3reUl0xhFagDz
 Av4z0X595kkWQsGEIsB7mHG8IVor6tzn7M5X90d7Es+mg8tCx0JSYqNTrCYl6GVusp
 1DdSyatNS3pDV47CsVq0PcrdTdyuRm4c4WNW6TkWW9Do8HGhyM4PA2l0mm8Bh/qd3r
 DFs/QM53sF54Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:50 +0100
Subject: [PATCH v2 22/35] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_commit_hw_done()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-22-35dd6c834e08@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2711; i=mripard@kernel.org;
 h=from:subject:message-id; bh=81LDedNj3nQakln3lCAqCLzPw6wbO6U1S1Y/G78LC7Q=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtD5dVE1Z6rFyltpUpZ8Wj+qPbvQR8FIv+qgm9Pkkm
 7rsxV6FjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRKeyMdQonQv4ou/kq6y9v
 mvh64sS3N1Nm3WAvNE34L7rmlrSJQ/ihB5E7TAVPJSxkCpIM+m7Mythw9p+ZVt7jvY2LTn5snVg
 kGFe4YFX+udbfvCXqUf/0tmiaOj7hvR6cw9m26XU0t/yC5MsA
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
index 78bc540158b7c64129eb728d8f8d67a6797bd0b3..8541faf6a86c51074cd5d36996814e899382ae11 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2501,11 +2501,11 @@ void drm_atomic_helper_fake_vblank(struct drm_atomic_state *state)
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
@@ -2514,18 +2514,18 @@ EXPORT_SYMBOL(drm_atomic_helper_fake_vblank);
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
@@ -2541,13 +2541,13 @@ void drm_atomic_helper_commit_hw_done(struct drm_atomic_state *old_state)
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

