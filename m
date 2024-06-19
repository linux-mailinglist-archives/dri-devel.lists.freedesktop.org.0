Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAA190E976
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 13:31:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71BE310EC52;
	Wed, 19 Jun 2024 11:31:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bfPL2f4o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDAA410EC4D;
 Wed, 19 Jun 2024 11:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718796708; x=1750332708;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2harm/WhWEI3Km3sLA7Ncj3aQJjDRuI3ExGr4blYlwQ=;
 b=bfPL2f4oEc3MLTusuDwxwuSAI8nkkLwgqW4GFuBen6eRTAyonmoheptG
 wOglX8xCud4Iy7nbYc80Ki6QvlnQHPELWu4ss8LGUSZaJ+dpAWjBM+sls
 Cije3zalpVfxGsriRLV7Ivzw3s3F4WHGqy7lcs2b785CMgwArMbqdpeMH
 ar94pABhobMWyBmZfaKaze08++5WJhtW2hCSmOvyFIDDfomVDGdh0RoAz
 8xWWz/FconRU43cy8gitjGHL3hMZ/YuIG1555H84MITKAWWikeCmbA/3F
 3a6EORGR5x8wx6qFKfXP2zMCX80j3gEgjsBhsbiFqIOLs9sV4OvJPPYzl g==;
X-CSE-ConnectionGUID: oz6oEdqqQsGiyN66o2xa+w==
X-CSE-MsgGUID: pIM0v4xkQd6dfaCalZEubw==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15875327"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="15875327"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 04:31:47 -0700
X-CSE-ConnectionGUID: BHcVpJaXTRKAshTswDI6wQ==
X-CSE-MsgGUID: uXvt2fGcS++ZMvvXocVw9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="41846010"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 19 Jun 2024 04:31:45 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 19 Jun 2024 14:31:44 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v3 2/9] drm: Export drm_plane_has_format()
Date: Wed, 19 Jun 2024 14:31:44 +0300
Message-ID: <20240619113144.1616-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240612204712.31404-3-ville.syrjala@linux.intel.com>
References: <20240612204712.31404-3-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Export drm_plane_has_format() so that drivers can use it.

v2: add kerneldoc

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_crtc_internal.h |  2 --
 drivers/gpu/drm/drm_plane.c         | 10 ++++++++++
 include/drm/drm_plane.h             |  2 ++
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index cdd60f2a4052..1f73b8d6d750 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -272,8 +272,6 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 /* drm_plane.c */
 int drm_plane_register_all(struct drm_device *dev);
 void drm_plane_unregister_all(struct drm_device *dev);
-bool drm_plane_has_format(struct drm_plane *plane,
-			  u32 format, u64 modifier);
 struct drm_mode_rect *
 __drm_plane_get_damage_clips(const struct drm_plane_state *state);
 
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 268aa2299df5..a28b22fdd7a4 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -877,6 +877,15 @@ int drm_mode_getplane(struct drm_device *dev, void *data,
 	return 0;
 }
 
+/**
+ * drm_plane_has_format - Check whether the plane supports this format and modifier combination
+ * @plane: drm plane
+ * @format: pixel format (DRM_FORMAT_*)
+ * @modifier: data layout modifier
+ *
+ * Returns:
+ * Whether the plane supports the specified format and modifier combination.
+ */
 bool drm_plane_has_format(struct drm_plane *plane,
 			  u32 format, u64 modifier)
 {
@@ -906,6 +915,7 @@ bool drm_plane_has_format(struct drm_plane *plane,
 
 	return true;
 }
+EXPORT_SYMBOL(drm_plane_has_format);
 
 static int __setplane_check(struct drm_plane *plane,
 			    struct drm_crtc *crtc,
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 9507542121fa..dd718c62ac31 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -972,6 +972,8 @@ static inline struct drm_plane *drm_plane_find(struct drm_device *dev,
 #define drm_for_each_plane(plane, dev) \
 	list_for_each_entry(plane, &(dev)->mode_config.plane_list, head)
 
+bool drm_plane_has_format(struct drm_plane *plane,
+			  u32 format, u64 modifier);
 bool drm_any_plane_has_format(struct drm_device *dev,
 			      u32 format, u64 modifier);
 
-- 
2.44.2

