Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFF0B8038F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 16:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC6E10E884;
	Wed, 17 Sep 2025 14:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DtjcbqkT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C840810E881
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 14:47:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B002A43236;
 Wed, 17 Sep 2025 14:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37112C4CEF5;
 Wed, 17 Sep 2025 14:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758120472;
 bh=mboP35BJG2h6qGNOcNu5x/Jc+AeQX/UI0qJ/4yntwEo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=DtjcbqkTxJQE5S3ZVhuPtnf3W2mA1fSGenBC2zvVYlr4kzWPnm0N87hB0d7SP62Ev
 QLMItDW8St3rAGYdsjbZpVdd4h9Q9Es22BcHMe6Yn36ZcEzvqMo/+oR1b+ta5EO/Nx
 lCIFwZBwg3ofIoDa+5VHDtGuvYExKPaLHU2Z6JJ3tFkeSX26Cbb9Sxv0lfBL1t70rL
 zdF2hW++9dSlcG/3ipgiphUSJX0MEZQMd5/EYVD4QcEL+Vct8zjzJtIt3vw77HOheH
 fJ1BU2XXd/HstjF4tmSVdHZEUNpgXU7NXDsWDjvuh9fKbvojp5IBk2XrOjU2mLEaw/
 HvgQfwCyHaiNw==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Sep 2025 16:46:17 +0200
Subject: [PATCH v4 36/39] drm/atomic: Document __drm_crtcs_state state pointer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-drm-no-more-existing-state-v4-36-5d4b9889c3c8@kernel.org>
References: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
In-Reply-To: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1558; i=mripard@kernel.org;
 h=from:subject:message-id; bh=mboP35BJG2h6qGNOcNu5x/Jc+AeQX/UI0qJ/4yntwEo=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmnTq7nuzmDp3qj9QXPNOO2g/fOKX6asWOJvaD7hNv/f
 +T6i7j4dExlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJ/HBnbPgRbK04af9RTjuF
 ewuu3zS9FdWaZxNiktgoeTHykVHh1Lvse0ViXq5+fa3hc+K8/+JSmowNx7z7gr/sron9Z1H7b1f
 A9QjltfrSCoufXKxlerdEL0z1r9+W4KjjLz22RxUp8XOJexoDAA==
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

