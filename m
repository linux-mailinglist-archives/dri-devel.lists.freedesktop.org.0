Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB889803251
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 13:17:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0814510E18A;
	Mon,  4 Dec 2023 12:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F300410E19F
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 12:17:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id D444CB80DE0;
 Mon,  4 Dec 2023 12:17:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDA60C433C8;
 Mon,  4 Dec 2023 12:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701692239;
 bh=SJ5qWjmfCQuBAbiqM6qblQXRbomJexa8jdMJu+s7Gz0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=edS8Qvaz1edkDBncx5BYQFVtIAkNJHVrHLSfHHOn4q+ChHECnUZgLx7yjPldNwhfb
 FWnRUWvP8Ptilm3fkdNbQLYslb+wkPCjGzHB5zbCBzmy5s/hpiWugMyYPi4XnafCGP
 xkMSnmBoo7ATpmBhr0zEF1r8DNqcBYF7jUffTYM2t79B7z+ZBzvkkYfTejWoOevRoo
 PnHKrbY6n0ZDzyt2aF3gy1piG+QplbrK2QjS5+4z+826egPX7RZtT30xU9LHyA/nMX
 8hSM48wFECF1kbmsm0F1hg2kCSMOJpmEjg0Kn5Y/TSD6djJ1NPuyFwirDKoSQJFvmU
 cQA6QjXYSbkfw==
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 4/5] drm/atomic: Make the drm_atomic_state documentation less
 ambiguous
Date: Mon,  4 Dec 2023 13:17:06 +0100
Message-ID: <20231204121707.3647961-4-mripard@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231204121707.3647961-1-mripard@kernel.org>
References: <20231204121707.3647961-1-mripard@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current documentation of drm_atomic_state says that it's the "global
state object". This is confusing since, while it does contain all the
objects affected by an update and their respective states, if an object
isn't affected by this update it won't be part of it.

Thus, it's not truly a "global state", unlike object state structures
that do contain the entire state of a given object.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_atomic.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 914574b58ae7..81ad7369b90d 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -346,11 +346,19 @@ struct __drm_private_objs_state {
 };
 
 /**
- * struct drm_atomic_state - the global state object for atomic updates
+ * struct drm_atomic_state - Atomic Update structure
+ *
+ * This structure is the kernel counterpart of @drm_mode_atomic and contains
+ * all the objects affected by an atomic modeset update and their states.
  *
  * States are added to an atomic update by calling drm_atomic_get_crtc_state(),
  * drm_atomic_get_plane_state(), drm_atomic_get_connector_state(), or for
  * private state structures, drm_atomic_get_private_obj_state().
+ *
+ * NOTE: While this structure looks to be global and affecting the whole DRM
+ * device, it only contains the objects affected by the atomic commit.
+ * Unaffected objects will not be part of that update, unless they have been
+ * explicitly added by either the framework or the driver.
  */
 struct drm_atomic_state {
 	/**
-- 
2.43.0

