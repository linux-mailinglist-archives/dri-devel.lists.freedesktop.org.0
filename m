Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C41EEB4AC00
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0170510E6CF;
	Tue,  9 Sep 2025 11:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="L54LMQkT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB0110E6D0
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 11:29:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B7CA540328;
 Tue,  9 Sep 2025 11:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49680C4CEF4;
 Tue,  9 Sep 2025 11:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757417378;
 bh=6k92C05MUyFVTRjzFQErfwuojz9pLliSIcn4CSpaX5E=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=L54LMQkTEq030X0kXKOighUM7W/HidbVhhbth1gPnUXXZS95hh3VWxL6dqZGCv20Y
 8RwJpiqLu2JzcRrDXT56NefTi6XaeZzxPO3os1VrgYfKzNi17NAJe9EpRZh19pXq9h
 eYPtoEghc1CSu4NtvN9ScdflZyy/1k6gon00KYPJk9UVpLYw8DxcfcLtJM+fy8S6Hl
 v7FFw3ZEGMGJLzRxwf1aGTgU/WGYfNBjsNPKTXCWztA5NNofvNPlOfRLE2qUhwGnUk
 AYCPOmggxFjNosT/ZUq1e9PG9wF5c3zWb80g+XSozgeln/QkGUpIr0gM6tC+xyRyoZ
 Qhv4lMM4Tc9Qw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:58 +0200
Subject: [PATCH v3 39/39] drm/atomic: Document __drm_private_objs_state
 state pointer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-39-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1596; i=mripard@kernel.org;
 h=from:subject:message-id; bh=6k92C05MUyFVTRjzFQErfwuojz9pLliSIcn4CSpaX5E=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+I3LHCfHP4jPPPtk5kZ2P1NR6aVKURsOKM0Ia9SQ/
 ijt+8iqYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEzE8BRjQ8sV90Wn3JUk/5Uq
 bZvlryJQObXuLnubvszigubOo5dXac/nc48+vrjGeX/B/KyTou7ejNWsKtuPed1krUoOvcbf9qq
 oYvGCsoaEO8wbjgf0+ofEy4c8bRCvfNRz6e825c93ss3yVwAA
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

