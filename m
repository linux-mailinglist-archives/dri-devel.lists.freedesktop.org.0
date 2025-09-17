Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC47B803AD
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 16:48:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C737C10E88B;
	Wed, 17 Sep 2025 14:48:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dSnQc/OB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32FA310E87F
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 14:48:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 142204061A;
 Wed, 17 Sep 2025 14:48:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 912B2C4CEE7;
 Wed, 17 Sep 2025 14:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758120480;
 bh=6k92C05MUyFVTRjzFQErfwuojz9pLliSIcn4CSpaX5E=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=dSnQc/OBNaknTqWDDaV8YNTOndG63IR5/xS82wmq2iHlPQ7G/2qfIq+bJPgtLvi0i
 WIj5Pud81sgAUr0CPOC4D4WVuA+Eq6rdiz3QZcBJx1UaXTJ39AWdttE3W2oO48Jzgx
 QtplF/ZNI0s3eNtIt286aOyLug2Gwxslz3TMpDleUByGEmmDQarGNIGERVc8OWglMK
 86XbUVdZcAp1iMjlbEBaec91lQHWqkVpq0ejgqOljjlogH2O5vYNYrTdfPVnK4Is7r
 ggYqfOzZcPpQ1dlKxl9eIECHf8jCi2+SR23JtuvZBeD0P/viCQWuoaN+sS4C6Ff6YN
 TD+nFtEM8AshQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Sep 2025 16:46:20 +0200
Subject: [PATCH v4 39/39] drm/atomic: Document __drm_private_objs_state
 state pointer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-drm-no-more-existing-state-v4-39-5d4b9889c3c8@kernel.org>
References: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
In-Reply-To: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1596; i=mripard@kernel.org;
 h=from:subject:message-id; bh=6k92C05MUyFVTRjzFQErfwuojz9pLliSIcn4CSpaX5E=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmnTm7w2hrssPaewu3M7x0yqn0dDe9XJfl9CPuaXTv1W
 3uN+qVXHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiDw4xNqwI2eOXLG671ihq
 Sshkuysv+9w2deq/2nCzT/j8nr+Z9TPu5Hmt8fTI0Xt15EEmk510NWN9pvT74J8uwVsF4u7sE5+
 Uoc9be+n0/KpLWd6vQrPSPaT33jJ4zlm5Y53qU7O2o4pxXAcB
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

