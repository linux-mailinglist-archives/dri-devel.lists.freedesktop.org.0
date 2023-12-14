Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1105812C84
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 11:09:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B5C810E918;
	Thu, 14 Dec 2023 10:09:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 195D110E911
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 10:09:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 551626216A;
 Thu, 14 Dec 2023 10:09:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A444DC433C7;
 Thu, 14 Dec 2023 10:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702548570;
 bh=5bqkfAelbOTqlj5Ldp8Y2gweUJ+1X2cnM1h4FqoT81E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jig6IJ2m6JI9PvNPwgL1UnLjpkqTkTKDtMGl3w4StOKNRS9250mkgr0LgwPHmP0wW
 4Et9rWN5C/EeY8AhRZibmHhBwDox7TYMCAMfBI+mj1AP0JQWS0LMCgX/f9wf/gxlrg
 2SO1D9AtTcshCEPptFVJNjUGRm8nLSbV6Z5iBjZru+woy1QNmpovcZzgAypljGRILY
 ks4KNC9oUl9UH+VUYta9hygzdZivthoYaNaqTIkKdqkvJGB47QIz7HNOC6gzpCAUN/
 nsBIfdDWfV8OQYb4hjkU9Y3uGakoL2GxtrKor7IT3xSJWEkXdzRPWIT48GsxnZ6CVW
 NnP3mOiHy34bQ==
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 4/5] drm/atomic: Make the drm_atomic_state documentation
 less ambiguous
Date: Thu, 14 Dec 2023 11:09:15 +0100
Message-ID: <20231214100917.277842-4-mripard@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231214100917.277842-1-mripard@kernel.org>
References: <20231214100917.277842-1-mripard@kernel.org>
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
 include/drm/drm_atomic.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 914574b58ae7..5df67e587816 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -346,7 +346,13 @@ struct __drm_private_objs_state {
 };
 
 /**
- * struct drm_atomic_state - the global state object for atomic updates
+ * struct drm_atomic_state - Atomic commit structure
+ *
+ * This structure is the kernel counterpart of @drm_mode_atomic and represents
+ * an atomic commit that transitions from an old to a new display state. It
+ * contains all the objects affected by an atomic commits and both the new
+ * state structures and pointers to the old state structures for
+ * these.
  *
  * States are added to an atomic update by calling drm_atomic_get_crtc_state(),
  * drm_atomic_get_plane_state(), drm_atomic_get_connector_state(), or for
-- 
2.43.0

