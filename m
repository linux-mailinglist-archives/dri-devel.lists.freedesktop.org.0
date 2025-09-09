Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93314B4ABC8
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E800110E6AB;
	Tue,  9 Sep 2025 11:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZW9zCuV+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6003E10E6AB
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 11:27:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 37E6944A3F;
 Tue,  9 Sep 2025 11:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8864C4CEF7;
 Tue,  9 Sep 2025 11:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757417279;
 bh=TWqbTPy6g3aOt25SgCaZ8dS8gLPyJMdGLzlQDGrCUWw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ZW9zCuV+9fBISUnxmzx3pqduZaOe9J0I8tObC0cSiNR44DqWzAY6OMaJva4DgcwpZ
 X7wb5JpibwiQxHZNpWQdDegJafp99SYwpRzUpcHyTzAA+hmrB6RRf0ILT8V3j289Tt
 A+Da04n80uYbyh9GK8F8guEdfZn0VGdCfYywbM1uYa69zNKK/m76mSOOcnGlUmdJIa
 2BUd3yYh2xo+AYiGgwfbLm9Y9wUE6Kabedt4MmBYXNgj5H7xsMc9UChhvQ61wEh7lD
 jR5zx2maTAaijCI1Cpk9YQpha5X/fXvDLJVjied2+1NwP8kCtCFc4f6z6GsubXBbpK
 OtX33+PaOkvLQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:22 +0200
Subject: [PATCH v3 03/39] drm/atomic: Document __drm_connectors_state state
 pointer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-3-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1708; i=mripard@kernel.org;
 h=from:subject:message-id; bh=TWqbTPy6g3aOt25SgCaZ8dS8gLPyJMdGLzlQDGrCUWw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+JWkP73cZmXZEPGvWadvlue7I5OmL1kctaCrInXyh
 8Y1xfsOd0xlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJXFzFWF8mqqbKzua6JnLf
 1sMnJ+xo9E/hmfJ+XcaC2zK3GgU55osIu7942WIcfyCEiW//tT1HHjLWF23unmB+f+Ong6cNtLO
 O6rRoJQUcCk9a37FaLi/Rx25et4v24tO/ub2eTLrkfqpl7w57AA==
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
 include/drm/drm_atomic.h | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 321c866d5b0a46df7a9adbbf5e4cabd1ff987aad..798d33b50ef7497ce938ce3dbabee32487dda2d6 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -180,11 +180,26 @@ struct __drm_crtcs_state {
 	u64 last_vblank_count;
 };
 
 struct __drm_connnectors_state {
 	struct drm_connector *ptr;
-	struct drm_connector_state *state, *old_state, *new_state;
+
+	/**
+	 * @state:
+	 *
+	 * Used to track the @drm_connector_state we will need to free
+	 * when tearing down the associated &drm_atomic_state.
+	 *
+	 * Before a commit, and the call to
+	 * drm_atomic_helper_swap_state() in particular, it points to
+	 * the same state than @new_state. After a commit, it points to
+	 * the same state than @old_state.
+	 */
+	struct drm_connector_state *state;
+
+	struct drm_connector_state *old_state, *new_state;
+
 	/**
 	 * @out_fence_ptr:
 	 *
 	 * User-provided pointer which the kernel uses to return a sync_file
 	 * file descriptor. Used by writeback connectors to signal completion of

-- 
2.50.1

