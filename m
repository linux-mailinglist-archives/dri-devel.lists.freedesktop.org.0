Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 818438C4697
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 19:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC5B10E8E9;
	Mon, 13 May 2024 17:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S+tiHg9a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB09110E8FA;
 Mon, 13 May 2024 17:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715623191; x=1747159191;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dlD05UbwFGkVzT+5iQVRUL62zt4nVk86wdGYjjx1ygA=;
 b=S+tiHg9awdpTW7ASOW0IfhbwBDk6udUtBU29OwT4m0vVn9730FSP5XAi
 SkCFr63w1sVX8lAefGtEl8lr9M7fliwXYmqE1GPvxGT+nYpmKdA81483A
 dnkvvE9l6Yeo+/wAQAKCmqXbNaycLZdDcPjRIq/00HvgzvqbE+T3Ct4Cr
 BEvfTLoWjcZbl+MuLeLBp8MaRG9W1WC+PiP+ysX3KXIYqIvmpQ3c0/TE0
 JLBvCRR6oVZnzrC5qsjsyC4LYO2RkYGKwaDM1I+KUXgd7aBIFG6eXNKCF
 nWdYhCcXgORfL19fk+nzunrt7qCprCcn06Q3i1Fm9bSnUmSBUbuST3fvc w==;
X-CSE-ConnectionGUID: NLlViEtlQVGYGeWFHDVHdA==
X-CSE-MsgGUID: 0TU7/X2KRuekhN/jYk3NJg==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="14517940"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="14517940"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 10:59:50 -0700
X-CSE-ConnectionGUID: H8VRoMhjRFGJhe3+yt3hYw==
X-CSE-MsgGUID: w6OjC0fdRIuByW2cUdxFAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30395179"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 13 May 2024 10:59:49 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 13 May 2024 20:59:48 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/9] drm: Export drm_plane_has_format()
Date: Mon, 13 May 2024 20:59:35 +0300
Message-ID: <20240513175942.12910-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240513175942.12910-1-ville.syrjala@linux.intel.com>
References: <20240513175942.12910-1-ville.syrjala@linux.intel.com>
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

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_crtc_internal.h | 2 --
 drivers/gpu/drm/drm_plane.c         | 1 +
 include/drm/drm_plane.h             | 2 ++
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index 898e0e8b51be..e207759ca045 100644
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
index 268aa2299df5..a51d4dd3f7de 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -906,6 +906,7 @@ bool drm_plane_has_format(struct drm_plane *plane,
 
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
2.43.2

