Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29438BAC9E5
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 13:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7384710E58D;
	Tue, 30 Sep 2025 11:01:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WQ/ktPH5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D4E10E58A
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 11:01:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6C5C74037A;
 Tue, 30 Sep 2025 11:01:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4DC2C4CEF0;
 Tue, 30 Sep 2025 11:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759230109;
 bh=NmoNvk1BRd65/gBcJWlIPyc1740E4jQwo4nJChdHCng=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=WQ/ktPH5hkAkw5rUnOhecMvwbm87TwhgRAAwFCCWdicpVfp6yUhFnBjQcS0I+KY9R
 7K+d8D24HdXXRj+k7r6vl4zN815vb/4wpsjcjIUPOg19xb8Nud7ypojX7vsjHG5r5J
 YZ8NDVyXA3/YRM4XzIrVyweaNfTAt5lzMfNBNgW+4c9cOjBQi10zKbuoPKuWwP3QXl
 mD3Km89Wc35OgKzpc59yAdgoAB7RAxLphMJX6hVjIg57v5A+LB1SebiBO1Y4wculJz
 R1eWwIcxyaNIhqhlmlER20SlVhr1edFjPc2ZY3Fx0hsoiZ2E6Vled8At6JglGWKXmD
 hYzxhgoLbcrWg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:51 +0200
Subject: [PATCH v5 36/39] drm/atomic: Document __drm_crtcs_state state pointer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-36-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1653; i=mripard@kernel.org;
 h=from:subject:message-id; bh=NmoNvk1BRd65/gBcJWlIPyc1740E4jQwo4nJChdHCng=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3d+hnCBitV3hizniB5elx1myDum3HI01yZ93wOpP1d
 kHTKhm1jqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjARga+MDR1bbu3dP9H0apha
 zPZta2fefufr/nxPrWCo2CF7+26H6kmrQ+TO/mid+zqDu1D7m4rdLMb6lBWJBhwfmBJOnohK/OR
 +tvzYBqXv1kJ6fJzmJx9ITbI4uc6N4d+3xsm/uGNORdW6J4cAAA==
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
 include/drm/drm_atomic.h | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index f53a32688b33fb0f629595cb0a2ac09d359f515a..6b634b7474900d0d2bc51bd645ccedf718a1cb02 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -178,11 +178,27 @@ struct __drm_planes_state {
 	struct drm_plane_state *old_state, *new_state;
 };
 
 struct __drm_crtcs_state {
 	struct drm_crtc *ptr;
-	struct drm_crtc_state *state, *old_state, *new_state;
+
+	/**
+	 * @state:
+	 *
+	 * Used to track the @drm_crtc_state we will need to free when
+	 * tearing down the associated &drm_atomic_state in
+	 * $drm_mode_config_funcs.atomic_state_clear or
+	 * drm_atomic_state_default_clear().
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
2.51.0

