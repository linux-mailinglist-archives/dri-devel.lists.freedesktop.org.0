Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AB7B8037A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 16:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B83110E87C;
	Wed, 17 Sep 2025 14:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="czl8BpE8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D00F810E870
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 14:47:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B88AB41AE7;
 Wed, 17 Sep 2025 14:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F805C4CEF0;
 Wed, 17 Sep 2025 14:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758120458;
 bh=aTNFnaeJg1Fx40MqwJxUkU2NDzyQ/3OknzeF6+I1Eog=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=czl8BpE8H8ehrwnQS7KfAt5fAeDgqfhsK+124QYoZgsg9dbsUWqXI0trxaolnDpOh
 jN9RCgQmGbptYSPKJ1mFcUhvBsxTQZnD0GSDtaAu8111YXge2irRpF76iFcUJtnENz
 M0Fa//1vuLHt+TToHn+ThE6JTl4vBdq/K6FdnoJiPPygyQwlbMFguBjD4z6QDqZVdk
 MopGBhVy3ecBZMTVSv85WH2bwiAHYuZkm33qgsdya+hg/nhui1i1ltNu6RW3x2Tjem
 tCZbGm1toZqNsZt1gPkeocygjCY5P+Y90q1m+E0pf4niR2G+eDDctBQkwMbgsp3vVp
 9VnHggqIaFhqA==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Sep 2025 16:46:12 +0200
Subject: [PATCH v4 31/39] drm/vboxvideo: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-drm-no-more-existing-state-v4-31-5d4b9889c3c8@kernel.org>
References: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
In-Reply-To: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2006; i=mripard@kernel.org;
 h=from:subject:message-id; bh=aTNFnaeJg1Fx40MqwJxUkU2NDzyQ/3OknzeF6+I1Eog=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmnTq49YxAm5Fu7sf5hwKOImasSFE128nBJPtv8JkHZQ
 Pzn3/mzO6ayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBE7sQxNjy8V/+mM2zBxLgX
 fYv6G8846/2Z9T1yhYjO5dbQ1B1xV8waHp3WnndBRNT+uu3tddKH5jA2nC4uYDgz+b8XZ35U2D7
 7gkp3dWllxUuyr4ty9lVb756S9iYw+JLe/uvhl9b/ZL98Sk8RAA==
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

The vboxvideo atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Hans de Goede <hansg@kernel.org>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Hans de Goede <hansg@kernel.org>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/vboxvideo/vbox_mode.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index 9ff3bade979577df0bc2e6e9653b3fb8fd486062..aa0dded595b6e00a9aa2027b36ca11711ccc0439 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -260,12 +260,12 @@ static int vbox_primary_atomic_check(struct drm_plane *plane,
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
 	struct drm_crtc_state *crtc_state = NULL;
 
 	if (new_state->crtc) {
-		crtc_state = drm_atomic_get_existing_crtc_state(state,
-								new_state->crtc);
+		crtc_state = drm_atomic_get_new_crtc_state(state,
+							   new_state->crtc);
 		if (WARN_ON(!crtc_state))
 			return -EINVAL;
 	}
 
 	return drm_atomic_helper_check_plane_state(new_state, crtc_state,
@@ -342,12 +342,12 @@ static int vbox_cursor_atomic_check(struct drm_plane *plane,
 	u32 width = new_state->crtc_w;
 	u32 height = new_state->crtc_h;
 	int ret;
 
 	if (new_state->crtc) {
-		crtc_state = drm_atomic_get_existing_crtc_state(state,
-								new_state->crtc);
+		crtc_state = drm_atomic_get_new_crtc_state(state,
+							   new_state->crtc);
 		if (WARN_ON(!crtc_state))
 			return -EINVAL;
 	}
 
 	ret = drm_atomic_helper_check_plane_state(new_state, crtc_state,

-- 
2.50.1

