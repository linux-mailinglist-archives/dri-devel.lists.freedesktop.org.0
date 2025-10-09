Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F087ABC8531
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 11:32:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449AF10E9AF;
	Thu,  9 Oct 2025 09:32:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jO6xUk12";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB61110E9AA;
 Thu,  9 Oct 2025 09:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760002365; x=1791538365;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=Ore7HZ6cvMhY6cBIXRmckVSq1ARj81zP4JcZQnXeVjc=;
 b=jO6xUk120xEmRG37nr0NRkJPJa2uZ0pTKgL/BwN4Ja5ygpZURrDL0yHr
 u3K2MqGe1lGvHVL71HPh6Xw0bYa1XEtngExaN6WTJdxvtiWRwA3smcTW/
 jkCLSVrK7P99S3GjTHm6cQObgTWARtx41xXHYmQxL0HekjdqBtzbCIs3o
 cf7Kr5njcDLP2b/PF2hdc77l76H12aKNFfOD/sGI9NP5yOLuGWXTqo3zI
 ArjCJ/YmYwYOth2DGkRvBh+PQ95GQFHEIbxl4uLeCgK+MHyfQ0RO12ELP
 VnQtC8sjPisBRla4JzUz1lDz7Ikpkb+46U8ePHZfN285V+Qz2E9IZMtVg Q==;
X-CSE-ConnectionGUID: m0mBHtU/QTeDnjvtAfQTxA==
X-CSE-MsgGUID: hOfw/Tf4TvC7We3oOcTsmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="66060869"
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="66060869"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 02:32:44 -0700
X-CSE-ConnectionGUID: 1hTi/sQETMK8OTVB2IgfbA==
X-CSE-MsgGUID: qsHxFUmgSVKl14gp13R4Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="185789611"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa005.jf.intel.com with ESMTP; 09 Oct 2025 02:32:39 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Thu, 09 Oct 2025 15:02:51 +0530
Subject: [PATCH v6 3/5] drm/atomic: Allocate atomic_state at the beginning
 of atomic_ioctl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-atomic-v6-3-d209709cc3ba@intel.com>
References: <20251009-atomic-v6-0-d209709cc3ba@intel.com>
In-Reply-To: <20251009-atomic-v6-0-d209709cc3ba@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, xaver.hugl@kde.org, 
 harry.wentland@amd.com, uma.shankar@intel.com, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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

Moving atomic_state allocation to the beginning of the atomci_ioctl
to accommodate drm_mode_atomic_err_code usage for returning error
code on failures.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 85dbdaa4a2e25878c953b9b41539c8566d55c6d9..3ef478e717bec917d1b8803c72bbcc8d6409d745 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1394,13 +1394,21 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	struct drm_modeset_acquire_ctx ctx;
 	struct drm_out_fence_state *fence_state;
 	int ret = 0;
-	unsigned int i, j, num_fences;
+	unsigned int i, j, num_fences = 0;
 	bool async_flip = false;
 
 	/* disallow for drivers not supporting atomic: */
 	if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
 		return -EOPNOTSUPP;
 
+	state = drm_atomic_state_alloc(dev);
+	if (!state)
+		return -ENOMEM;
+
+	drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
+	state->acquire_ctx = &ctx;
+	state->allow_modeset = !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
+
 	/* disallow for userspace that has not enabled atomic cap (even
 	 * though this may be a bit overkill, since legacy userspace
 	 * wouldn't know how to call this ioctl)
@@ -1439,14 +1447,6 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 		return -EINVAL;
 	}
 
-	state = drm_atomic_state_alloc(dev);
-	if (!state)
-		return -ENOMEM;
-
-	drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
-	state->acquire_ctx = &ctx;
-	state->allow_modeset = !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
-
 retry:
 	copied_objs = 0;
 	copied_props = 0;
@@ -1543,7 +1543,8 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	}
 
 out:
-	complete_signaling(dev, state, fence_state, num_fences, !ret);
+	if (num_fences)
+		complete_signaling(dev, state, fence_state, num_fences, !ret);
 
 	if (ret == -EDEADLK) {
 		drm_atomic_state_clear(state);

-- 
2.25.1

