Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C588B3FAC0
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813AD10E63E;
	Tue,  2 Sep 2025 09:36:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GYLIOYJa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B586F10E63F
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:36:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1E8B960202;
 Tue,  2 Sep 2025 09:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78C6FC4CEED;
 Tue,  2 Sep 2025 09:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756805815;
 bh=YPy4z4OaJoWUL9r4KrGzI/WKjSjH8TP5L3pV+kz8Tdg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=GYLIOYJarjoYwFNqDv/tgRLn6AQeSI7d1xO8oHMXzCkTB/ekOnaQ//WE3d7ORP0tB
 oQ6YDTwtu7rOiA6NWHjZ/iNiKMP2fhwfcNOpKx/MR7d9iOOBrIMVNICwoP/tQeZ31k
 YLUUICSmhNI16QRpOM4VRv9GuH07J2ZVnoIfX7Tu0zUYvEwzow/yKmeY+9HLRtw+8I
 H18m6DwCxBaZXOUksnSEvNe4OO2KHA1+mztpZl08OG2WorGEAS0wYOQjFZXrlBet5y
 9Ey55APAY2JGXY4QL+Lt0ffrbCjEyohgNBWmliOXunnOHFFNUNlVi8JEfHzOnwh25m
 cdh/69J2NK/xw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 11:35:33 +0200
Subject: [PATCH v2 34/37] drm/atomic: Remove unused
 drm_atomic_get_existing_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-no-more-existing-state-v2-34-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1526; i=mripard@kernel.org;
 h=from:subject:message-id; bh=YPy4z4OaJoWUL9r4KrGzI/WKjSjH8TP5L3pV+kz8Tdg=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbdkU1yGmZvovxZT391XPaBpm9khtqu60fiNz9xZHfm
 1haYbK/YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAExk2U3GOouYSJmZtee3BPfc
 e6DS+7r+5m3Xg//cjOzMWIy/GVQqvX7vWRhY1bLvQlxGrLf9rl3PGKvZFmofZbFft0Hrgbm65QP
 dvM23Z89jqo1XfPLjPO9Bxn+b3MzezNAXzSm5G1XSWnxliQsA
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

The drm_atomic_get_existing_crtc_state() function is deprecated and
isn't used anymore, so let's remove it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_atomic.h | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 89c9a059b36763205fc2fc764283423cbea62679..cba63857e920515b48b75fc3c2d5239fc1ae59c1 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -663,28 +663,10 @@ drm_atomic_get_old_crtc_for_encoder(struct drm_atomic_state *state,
 					 struct drm_encoder *encoder);
 struct drm_crtc *
 drm_atomic_get_new_crtc_for_encoder(struct drm_atomic_state *state,
 					 struct drm_encoder *encoder);
 
-/**
- * drm_atomic_get_existing_crtc_state - get CRTC state, if it exists
- * @state: global atomic state object
- * @crtc: CRTC to grab
- *
- * This function returns the CRTC state for the given CRTC, or NULL
- * if the CRTC is not part of the global atomic state.
- *
- * This function is deprecated, @drm_atomic_get_old_crtc_state or
- * @drm_atomic_get_new_crtc_state should be used instead.
- */
-static inline struct drm_crtc_state *
-drm_atomic_get_existing_crtc_state(const struct drm_atomic_state *state,
-				   struct drm_crtc *crtc)
-{
-	return state->crtcs[drm_crtc_index(crtc)].state;
-}
-
 /**
  * drm_atomic_get_old_crtc_state - get old CRTC state, if it exists
  * @state: global atomic state object
  * @crtc: CRTC to grab
  *

-- 
2.50.1

