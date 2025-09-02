Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BE2B3FAC4
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200F810E640;
	Tue,  2 Sep 2025 09:37:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uxTv+F9J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC73D10E644
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:37:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D489642B57;
 Tue,  2 Sep 2025 09:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66289C4CEED;
 Tue,  2 Sep 2025 09:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756805823;
 bh=JLMIgCAsxjzxuydkVuFbaW+CIAKd8FHbajZuUIMyqfg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=uxTv+F9JEbdM4qWl/x9CJCL6utLtX4HSzS19yFP4pH3SILkwfFviUNrjpGYrJVFfM
 gBK6pfeL6L1ClMMflPGAouIEyqULfclBO9bp2ILN3mFXOeRBdDRfICkYT8gNyFBHNV
 TrZOkZKxMm+dI9XIwcUy3AbGvI0LHlFvd9brTzuDu6P0zksmcn1xmg7o58qniLQF5H
 wkvA5yhLD4ehItWABYuQISZ+ijVYtjLIFk9Usl4TCQJC6qYNUJh483FcWiqw/pn4h6
 /zrC6fKVVtevQFKKTaPzyNdXhPvC6a76PLvm2DZ2qxf2qPnMIlpRApWJIsBE5kfYum
 Ii7tXbOptmI1Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 11:35:36 +0200
Subject: [PATCH v2 37/37] drm/atomic: Document __drm_private_objs_state
 state pointer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-no-more-existing-state-v2-37-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1478; i=mripard@kernel.org;
 h=from:subject:message-id; bh=JLMIgCAsxjzxuydkVuFbaW+CIAKd8FHbajZuUIMyqfg=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbdkWzTlXbHOihnJe10GXZCR6j+3EhZ+XTwjZ4SD023
 cdvpLe/YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEwkWoaxYe3ByR3Hvpg2/9jd
 +sn53v+AN0ltiwtXO+nsdNrqd6v9yyvxZbKh1ZJtJg3Rcn/ZeKO+MTZcXJHtfjQ/8vDKY24CpQx
 i607KaMxj//RDYrZA8bTYO9+mqtfLdAndeOJYcfiWhcyvSeEA
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
index e8edf33ab260c03c81e16917a6a5a7d9648d46c9..a7e75bb0bdc6a38eb83c07b844dd97af48006f0f 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -383,11 +383,25 @@ struct drm_private_state {
 	struct drm_private_obj *obj;
 };
 
 struct __drm_private_objs_state {
 	struct drm_private_obj *ptr;
-	struct drm_private_state *state, *old_state, *new_state;
+
+	/**
+	 * @state:
+	 *
+	 * Used to track the @drm_private_state we will need to free
+	 * when tearing down the associated &drm_atomic_state.
+	 *
+	 * Before a commit, and the call to
+	 * drm_atomic_helper_swap_state() in particular, it points to
+	 * the same state than @new_state. After a commit, it points to
+	 * the same state than @old_state.
+	 */
+	struct drm_private_state *state;
+
+	struct drm_private_state *old_state, *new_state;
 };
 
 /**
  * struct drm_atomic_state - Atomic commit structure
  *

-- 
2.50.1

