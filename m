Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DB7B3FAC1
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B7F710E63F;
	Tue,  2 Sep 2025 09:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cz4rcw2D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3B010E640
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:36:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8737F42B57;
 Tue,  2 Sep 2025 09:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19BA8C4CEED;
 Tue,  2 Sep 2025 09:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756805818;
 bh=KG29DkMhijG/h32XFoVLd/RlQz6ZHNqZLW44iGDdi5g=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=cz4rcw2DPvD6MAFVTcMbLw3UUE0LhzsXTPpkRwFFS1OhYKs9hfKvvW0Ud1aGIj86b
 KNGVNuUKUEoW8+P5RVpreWtVIEw88Ncy+ixaVkK+r0l+l5tEjbOn9O7Ege82YTGoOQ
 HSoTLygDKXbqRwnrYWGGbJ05EP2Z+OpPfVYU+OHkZM6n5oB5IdFcjxWMFgA3G0HmEH
 j28DwNjlblsZC3NpK376slAzhXfjSnK9pLuH7bmfsqAfycTwnl8hsxDRfgOo1JjcpW
 Ry97geZWCTFzePR7cRs8p03V1MQtqa9nNUT6cLDdQpRrJvmU/JmoD/DmKjW9ER4WnF
 Zz6DA0/J4EB+g==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 11:35:34 +0200
Subject: [PATCH v2 35/37] drm/atomic: Document __drm_crtcs_state state pointer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-no-more-existing-state-v2-35-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1496; i=mripard@kernel.org;
 h=from:subject:message-id; bh=KG29DkMhijG/h32XFoVLd/RlQz6ZHNqZLW44iGDdi5g=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbdkUH/it/y7xlUs1ilqNv94WmCWvfFWCPf3R96UOGH
 p3SrjUPO6ayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEDlowNsx5yP15p+bOQwzK
 vlNdy9/pxgWecf+ovXFr0T+LqzZzBfyPcVyINJvJ7PyI/07Hy5K6DYz1pau/b1BycGD1iZ/3cmW
 1xJyH7H3Vtj4HF2ZFNfOYCKYf1rnL+9qy+Ne+Ve80779n598DAA==
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

