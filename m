Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBBCB3FA99
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B2AE10E624;
	Tue,  2 Sep 2025 09:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RxDaZeL6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389FB10E623
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:35:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8F1C36020A;
 Tue,  2 Sep 2025 09:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E940CC4CEF7;
 Tue,  2 Sep 2025 09:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756805750;
 bh=aAemksLzkq/6QOOapAPUEApEKl9p3QDBsAgqQlnQfIo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=RxDaZeL6IlMpijuRJv110HAb6mx4vaY9n9bQeFjGVAfWuyq77o8Q/RIo57jR3r1QB
 8p2yk/7tfCEabjh9JJ+1bbdUt6lcYbSRzNoQ9l0q98gtJJKfYJygiu5GpTlEB5TOyu
 1IiPFhA3VkyxjcJ8LkIUudcqAPZUUl37k9VCpqxl54E0/CafFQvzQGIw0AtmY+lYvk
 BBA/Eop/IKdYgezEViWaAfi4UV5tw+vrXAb0A2Q5gBzbdB0106tKZPx28IC0EOEQ96
 WD8L7A5LV9sZjTGbXmzQUoTtFhEpivJvDXCrYFGaFKJ3dNMspPK+ux7g1Ia5saTWWd
 eTlQ0md5t8Lng==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 11:35:08 +0200
Subject: [PATCH v2 09/37] drm/atomic: Document __drm_planes_state state pointer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-no-more-existing-state-v2-9-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1758; i=mripard@kernel.org;
 h=from:subject:message-id; bh=aAemksLzkq/6QOOapAPUEApEKl9p3QDBsAgqQlnQfIo=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbdvmb+iaVhYltXzBz+6fLc3wFTc6sXqHlwcjKdivs5
 U6j14fUOqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBErrUyNnxh/CzdmDLRrfzL
 6f98uRKMkr8uF6q0vL91TLN480bTFNOje34/OFqn48jiL1p3OsHoKmO9/7MOsZwKodq/yQtVrNL
 U+V4fjQ4wV7100PXSqYqIYAuXoBobAeMnTyZGac4TmWjnWgkA
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

