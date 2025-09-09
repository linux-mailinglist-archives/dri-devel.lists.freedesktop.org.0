Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9217AB4ABF9
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:29:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D58A910E6CD;
	Tue,  9 Sep 2025 11:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lYrpg52F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 976DE10E6CD
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 11:29:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7C67E44AF7;
 Tue,  9 Sep 2025 11:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B1E5C4CEF5;
 Tue,  9 Sep 2025 11:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757417370;
 bh=mboP35BJG2h6qGNOcNu5x/Jc+AeQX/UI0qJ/4yntwEo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=lYrpg52Fvj7yzNUQALq/s4B3mU9DMyOYP/PacrAnCyxt4Yy8iuOCCS11trfCXsXHZ
 cc9JU1UkmtkwXMLREt6LAxgYClcr3Co/WHvx+RwFR/Av9vnT4C08mHPU6fp5jNPlRL
 LCSLOYIYkfiKuec9D0+5upNdJdiA6mpmLNm5JyZk0Rbo/IlqPQxhE4MhOnUkgslc92
 /bAGaOs9hgLNtaxEEG59Y5dL0ZngyD2VfzAZtqmNC2RI0xIk3xRfcMdw/JqRmb/6l5
 Qf47MHBxoL6EKutx2cv4Ws8gB+qrG1OXaQADfF5KiisrXzeoIItwuasKWx2nMD0179
 peO5SzGJoAKZw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:55 +0200
Subject: [PATCH v3 36/39] drm/atomic: Document __drm_crtcs_state state pointer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-36-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1558; i=mripard@kernel.org;
 h=from:subject:message-id; bh=mboP35BJG2h6qGNOcNu5x/Jc+AeQX/UI0qJ/4yntwEo=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+I2Obn60VStGhV18T9mE9c9jp/PefVX/d8988zNSu
 xe9de0y7pjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQAT4dnGWO+gmq9ROfnwx5gN
 lZLJGQtSbmzp/nZydVyBZJHsFT+jqGreOS6G72xcdyrvs7r37HjuPcY6hbOtf2e2lmxdwJZ171r
 cz5A1qgsP2Jt8E62ZdFT0+2bnKz9r0lgY6rM8zWa666lpWcwAAA==
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

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_atomic.h | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index cba63857e920515b48b75fc3c2d5239fc1ae59c1..e8edf33ab260c03c81e16917a6a5a7d9648d46c9 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -176,11 +176,25 @@ struct __drm_planes_state {
 	struct drm_plane_state *old_state, *new_state;
 };
 
 struct __drm_crtcs_state {
 	struct drm_crtc *ptr;
-	struct drm_crtc_state *state, *old_state, *new_state;
+
+	/**
+	 * @state:
+	 *
+	 * Used to track the @drm_crtc_state we will need to free
+	 * when tearing down the associated &drm_atomic_state.
+	 *
+	 * Before a commit, and the call to
+	 * drm_atomic_helper_swap_state() in particular, it points to
+	 * the same state than @new_state. After a commit, it points to
+	 * the same state than @old_state.
+	 */
+	struct drm_crtc_state *state;
+
+	struct drm_crtc_state *old_state, *new_state;
 
 	/**
 	 * @commit:
 	 *
 	 * A reference to the CRTC commit object that is kept for use by

-- 
2.50.1

