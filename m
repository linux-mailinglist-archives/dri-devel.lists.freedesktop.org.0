Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C80ABAC964
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 13:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D25610E56F;
	Tue, 30 Sep 2025 11:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jzqqSPFj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC8110E56F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 11:00:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 115E040476;
 Tue, 30 Sep 2025 11:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89CDBC116C6;
 Tue, 30 Sep 2025 11:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759230012;
 bh=muPMoWzcBKSC+bTmlW1CD4F2oOL5rO6BZBEkeUj5wBA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=jzqqSPFjbqxwfi2PRqeQxJY9jTjRCIENTY1u8F4JCNiZNZt3mxaHzIbo7yssnLuWW
 8E3jLuLt9VLDe/nFZh8B4e9KRRI69fmfR6J9KpxiConu+B6PslT82feZT7Fziyirqu
 bWXVbummX9DfK7i+c6eYbPOCDgNXsf5I5CIQZx6Zjzo0Z1Lhbw3e0gpnbehbUyXm4d
 fE1cjGAaIn2tykaoIOvAA4SADYNGTT1gaACQ/pc8hEFKp6nkMPY6nSlVZWa9egmKS9
 Rm8obdZsN0WXoV3t3LxMbVdOY0tzsGtk1ZPKusdkrmhdiFSSk+l6bF02skT8sZ928q
 QWHqTwJTBa1XA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:18 +0200
Subject: [PATCH v5 03/39] drm/atomic: Document __drm_connectors_state state
 pointer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-3-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1803; i=mripard@kernel.org;
 h=from:subject:message-id; bh=muPMoWzcBKSC+bTmlW1CD4F2oOL5rO6BZBEkeUj5wBA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3dyjsZWPh6CrXtMgWksre9O+098ca5VvzFme/ZFx6X
 OKBWEpzx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjIuVLGhrc5q2uffzIQkbC/
 ypxyLEzxsM/PMw/ZmA7tNe79lCUkP+W94YuDaq5sTAViopskz0dtY6x3T9Wc9qtRt13AftPEXJ7
 0kOtVB2wOmJTv8Hys5Tblyjybcr31Csycar/ZBQqTpflqXwAA
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
 include/drm/drm_atomic.h | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 321c866d5b0a46df7a9adbbf5e4cabd1ff987aad..fe47715c31e41ad8bd45140fe6413b57b69b7c61 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -180,11 +180,28 @@ struct __drm_crtcs_state {
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
+	 * when tearing down the associated &drm_atomic_state in
+	 * $drm_mode_config_funcs.atomic_state_clear or
+	 * drm_atomic_state_default_clear().
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
2.51.0

