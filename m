Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 913AFD01E85
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 10:45:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9FEE10E6DF;
	Thu,  8 Jan 2026 09:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ept1mMe3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B85310E6DF;
 Thu,  8 Jan 2026 09:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767865530; x=1799401530;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=vugRk7diUwJTPThpUMGopxeQtX5N016qvUiEyzfoPeA=;
 b=Ept1mMe3I8Tn6gtiJGDFBGsoOxNIaN6nSkFHpOJO7njhjKx2s70Y4b8d
 QGBqe+UR4PwtB8ylhI3s1R57b7F/qcEonfAYuIpu6G0ShE38AzPVjjgRm
 vKqtBFB40zLZ0pITcKcxVYOVI7YPXr2HYHEL5qNLOz6TsHVRQAeTTmfpW
 7Btgel7fl0MWfUXXkOObMrzUPvrmqHqB0bACDpVyLS6E2GYtU1BmZD8GK
 9vssShmgKH4BVawGJTBWj/NBVZQUt/n2gPfo9NLR7JtnNZqLmkELmlpxz
 Cdh5Bx4f8Yb/VhN9nQJmgXpvQN94xUTnEgul/gre4rLR7w84xJVUCHRtX Q==;
X-CSE-ConnectionGUID: pjXNfrv+QIyzM8nhzmV1Eg==
X-CSE-MsgGUID: p0FCKz0OQn2QFy86+Qfcqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="72876640"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="72876640"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 01:45:29 -0800
X-CSE-ConnectionGUID: sm2V+nvJTO2o46I7i+zq3A==
X-CSE-MsgGUID: pk3IZajLRGqXbGsFVzvhug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="208232223"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa005.jf.intel.com with ESMTP; 08 Jan 2026 01:45:24 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Thu, 08 Jan 2026 15:13:27 +0530
Subject: [PATCH [RFC] v3 6/7] drm/atomic: flip_done signal for planes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-async-v3-6-e7730c3fe9ff@intel.com>
References: <20260108-async-v3-0-e7730c3fe9ff@intel.com>
In-Reply-To: <20260108-async-v3-0-e7730c3fe9ff@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, xaver.hugl@kde.org, 
 andrealmeid@igalia.com, naveen1.kumar@intel.com, ville.syrjala@intel.com, 
 Dmitry Baryshkov <lumag@kernel.org>
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

For multiple async flips in a single atomic_commit initialize a
flip_done completion in plane_state and the respective drivers should
signal the plane_state ->flip_done upon getting the flip_done on that
particular plane.
This logic of waiting for the plane_state->flip_done is done after
getting the flip_done interrupt and before sending the event to user.
Ideally the plane_state->flip_done should be signaled by then and as a
fallback mechanism the drm will do a fake complete for the timeouts.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 2 ++
 drivers/gpu/drm/drm_atomic_uapi.c   | 4 +++-
 include/drm/drm_plane.h             | 7 +++++++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index cc1f0c102414f1e387a187b7f9d5beb162db2eb2..0e7d98df8eccf91b3b01e7a93526ccc4eb7f0dcc 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2433,6 +2433,8 @@ static void release_crtc_commit(struct completion *completion)
 
 static void init_commit(struct drm_crtc_commit *commit, struct drm_crtc *crtc)
 {
+	struct drm_plane *plane;
+
 	init_completion(&commit->flip_done);
 	init_completion(&commit->hw_done);
 	init_completion(&commit->cleanup_done);
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 7b8e3b6ca3a5a93d3afbb923f20dacbd21cfc08b..c672b95d359abda622064b6d748c9cb2cea36c3f 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1201,8 +1201,10 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 				prop, prop_value);
 
 		/* Hack to make the legacy DRM_MODE_PAGE_FLIP_ASYNC work with atomic_ioctl() */
-		if (async_flip && prop == config->prop_fb_id)
+		if (async_flip && prop == config->prop_fb_id) {
 			plane_state->async_flip = true;
+			init_completion(&plane_state->flip_done);
+		}
 
 		break;
 	}
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index ed8342c9a6258ee97ad930092a48ac3a34e62fc9..6671b4f738703c8720c204b3dbaa726eaeca387d 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -274,6 +274,12 @@ struct drm_plane_state {
 	 * mode.
 	 */
 	bool async_flip;
+
+	/**
+	 * @flip_done: Used to track the flip completion for each plane in
+	 * case of asynchronous flips only.
+	 */
+	struct completion flip_done;
 };
 
 static inline struct drm_rect
@@ -830,6 +836,7 @@ struct drm_plane {
 	 * @kmsg_panic: Used to register a panic notifier for this plane
 	 */
 	struct kmsg_dumper kmsg_panic;
+
 };
 
 #define obj_to_plane(x) container_of(x, struct drm_plane, base)

-- 
2.25.1

