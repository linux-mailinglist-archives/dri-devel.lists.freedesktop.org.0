Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C991B802DE
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 16:46:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9192510E85A;
	Wed, 17 Sep 2025 14:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T+EMSL/t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44FD610E85A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 14:46:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2D1A4418F0;
 Wed, 17 Sep 2025 14:46:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84B5BC4CEF0;
 Wed, 17 Sep 2025 14:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758120379;
 bh=TWqbTPy6g3aOt25SgCaZ8dS8gLPyJMdGLzlQDGrCUWw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=T+EMSL/tmMzFYdsAGA6eKfamcBw3dvk1x4ENdKI3m/EIT0yQR53RATQ5FKe5I+Z4j
 TZkdz50P2NtXkRYFr6O0ZY6/sq/+1pbmvbAyJdFpfkr3WHpvaTecVl9HWZei70n6kW
 XaxBygmb5KovSQ+Wn0Ebp/i1avI4a6I6zkfAWvTSOJPJ7PQtpAhOQhZzFyBOcyUqb5
 fHGc1M5FPR0beGQqkYDkzdLt2MI4qqNcbzsyfW9mx1dR+x7BI6/khRDWi/hmOQax/2
 zZPyNkxoiJ/eZ/gOlp+YFQnMAyr978itkF+o2RQ49gXR6m0xUmEZ4dlAm31i1Pdhz8
 bulAEuLmgrxiQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Sep 2025 16:45:44 +0200
Subject: [PATCH v4 03/39] drm/atomic: Document __drm_connectors_state state
 pointer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-drm-no-more-existing-state-v4-3-5d4b9889c3c8@kernel.org>
References: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
In-Reply-To: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1708; i=mripard@kernel.org;
 h=from:subject:message-id; bh=TWqbTPy6g3aOt25SgCaZ8dS8gLPyJMdGLzlQDGrCUWw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmnTi7YOafk3uFbenGCZS5JFXND2yaqL9nVwThJ+EhMb
 HHz/qdmHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiQp6Mdea1V++s1rmUxLtd
 Tk+H+1ha7d/c7FV2ub61i0wmbuHjkpf0Tnm0Y8lX7wkVoebc8/0zGetzEpbdVz1pPMVqe/ExpiM
 9W5crTf11IvRg06I9n4/slnygbDN5QVX30rRVb3675uQ/8mQBAA==
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

