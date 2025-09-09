Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D695CB4ABD0
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C2A10E6AA;
	Tue,  9 Sep 2025 11:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X0xIjbOF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B250710E6AA
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 11:28:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 307D26021E;
 Tue,  9 Sep 2025 11:28:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B4E2C4CEF5;
 Tue,  9 Sep 2025 11:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757417295;
 bh=7gX4hCqmMu3qSZJG3m/DrzEVbpuRBmVF8tXjot3BII4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=X0xIjbOFGmm+Ep9dYbrrYuOE+C0UvQoV3MhOvKV+VozT7iaoPZhGgugGL9TlpVwjH
 TtHkcK+U5pLQMCSr1W9panamzxRB+k/By+wm3EzPbMqZdyEieTvSmxQqK1OAzL5iLx
 ggj9oA8lCh8QUrEAUdxzhOwhRYMM2G9ozilBr6t8UiBaRSMwBkCxWDv9QxTYw5gF38
 rmbqdzmwTzeXuiKmbm3GNxZpnLgKWY3iGfjlehToF59Le4HPMGS8vBn/8gYwEm88Ew
 9yb3t7jHL3m8e+kZa2YoldRYDqS1Z9cwFV9NaoQj5W+lKdF9Nmyuf8oRVzPvO07DPz
 WuoVxlTN9ETDg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:28 +0200
Subject: [PATCH v3 09/39] drm/atomic: Document __drm_planes_state state pointer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-9-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1874; i=mripard@kernel.org;
 h=from:subject:message-id; bh=7gX4hCqmMu3qSZJG3m/DrzEVbpuRBmVF8tXjot3BII4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+NUyr7tszbNZLaKW4npOjVX/hn7bsbenOOVjmy5+P
 n+80fJ8x1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZhI+w/GhrmljqsnXNV+/iWX
 u7jKS8ci+PTcxXkbWAsF5xp+yRVPW6y8QtvzWkrNouxV6usU0iSOMja86I8W3JPhcO3G5feH7F/
 c+PJ0zu99ay0f2Hf+aGhIuJaplLqj5nq4r/P9Cac/TA4/sNoXAA==
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

While the old and new state pointers are somewhat self-explanatory, the
state pointer and its relation to the other two really isn't.

Now that we've cleaned up everything and it isn't used in any
modesetting path, we can document what it's still useful for: to free
the right state when we free the global state.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 include/drm/drm_atomic.h | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 2f2c92fc4c20ee4e6abd6911bd574969d9cabbbb..89c9a059b36763205fc2fc764283423cbea62679 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -157,11 +157,25 @@ struct drm_crtc_commit {
 	bool abort_completion;
 };
 
 struct __drm_planes_state {
 	struct drm_plane *ptr;
-	struct drm_plane_state *state, *old_state, *new_state;
+
+	/**
+	 * @state:
+	 *
+	 * Used to track the @drm_plane_state we will need to free
+	 * when tearing down the associated &drm_atomic_state.
+	 *
+	 * Before a commit, and the call to
+	 * drm_atomic_helper_swap_state() in particular, it points to
+	 * the same state than @new_state. After a commit, it points to
+	 * the same state than @old_state.
+	 */
+	struct drm_plane_state *state;
+
+	struct drm_plane_state *old_state, *new_state;
 };
 
 struct __drm_crtcs_state {
 	struct drm_crtc *ptr;
 	struct drm_crtc_state *state, *old_state, *new_state;

-- 
2.50.1

