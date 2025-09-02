Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB16CB3FA8C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9436210E620;
	Tue,  2 Sep 2025 09:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IieW0rC9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74D810E620
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:35:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AECBD44A15;
 Tue,  2 Sep 2025 09:35:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 443F0C4CEF9;
 Tue,  2 Sep 2025 09:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756805734;
 bh=wk0b8XpwPxcYQ3noQMP9GONlP4C4Be6y8QzZeFkyZik=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=IieW0rC9RgEj5alYFHxa0qQD3lcruvMsaCSQLGzTGT/KxMer2AEqpm3r/OsHAO4Jz
 NXXY0Z4uYm0dKqvMDkueCMb4BJmy7BTISwPubFdD0LfN37ZkZg75gYBIB0IOEnLvdQ
 by94yA/XGq7kQ7/Y4KoQ1SH8py6cQdtlMlUyvqxUbX3jlbjs00fPfCz+My5OR46OmL
 0CYtnnKF/vtTlpZPJ4RWOibD+UfhEGTsVuuPCVDj9/HUi/pszFIhFWW+Ip1JqU+DIA
 8xfNApDThPKJKi+rV/4YvdHbU5vWCcXronbX6zICYE5bKaOvP14YKW3Kw79J+aikfM
 k4bEbZ9XAxfUA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 11:35:02 +0200
Subject: [PATCH v2 03/37] drm/atomic: Document __drm_connectors_state state
 pointer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-no-more-existing-state-v2-3-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1590; i=mripard@kernel.org;
 h=from:subject:message-id; bh=wk0b8XpwPxcYQ3noQMP9GONlP4C4Be6y8QzZeFkyZik=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbdvlkGbNnqr0NYjCcULKuMGPvUjX5pCIJoW2bxYwDq
 nZ5vRTvmMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABNxk2esj77W1fXSK3OOUPzx
 A/GxRnulnv0IDWXbX1nou3FdZs9mn6tXT2bcY09adD/ysNpMHStTxjqDLkt3zp33917U9nzNLzg
 5Xb7r78dHkYffnrs4wSNPWuy0h8bbCWZhIdEKE39WLO55GgIA
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

