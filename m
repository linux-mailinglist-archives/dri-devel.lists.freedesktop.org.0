Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C1F8C4694
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 19:59:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D6310E66D;
	Mon, 13 May 2024 17:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jpmcpxDE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042E710E66D;
 Mon, 13 May 2024 17:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715623188; x=1747159188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hzFeXqsKDecVb0vRBUUFLnN2TZSl7iUjguGTqlWRMVQ=;
 b=jpmcpxDE17ef/XdDW0l1qWNqB0PAbsPPXJHrtYW4xneBc4pdL1w4NAVE
 tylnHp01U2s2lqVaAxOkkVMOk9kzkCkarV3CpHzRExe5+F09ggHL8J5ro
 UFzRhg2g/+y+uZkqy/JRThq2K4kV2qj6sr5ChiHKiAzR/GDxvwyGZd1Hj
 YIpjBsoipuxTepqiaCixoTjPKgQdG2brpr3m6BRFnfNt4H7zxYbsUUKW8
 QaGvhLDPl2b6i7s/MEmlzEFHNorBDXaTiUVrspdmrHF6mf3h5ppgmwR2P
 JYxDXZ5McCmQAosUrVyjEjsKcTpPLegyCwAauwkRAooDodCMWbBfzmTvW g==;
X-CSE-ConnectionGUID: RYUUS36rRie5tIj7Eyj8pg==
X-CSE-MsgGUID: v0PV//9JQWunGZX3cy61qg==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="14517927"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="14517927"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 10:59:47 -0700
X-CSE-ConnectionGUID: kS8X7q9gTvukCQ79zF6E7w==
X-CSE-MsgGUID: zIN3HsXsSUufGfA48lrtzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30395175"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 13 May 2024 10:59:46 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 13 May 2024 20:59:45 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/9] drm: Rename drm_plane_check_pixel_format() to
 drm_plane_has_format()
Date: Mon, 13 May 2024 20:59:34 +0300
Message-ID: <20240513175942.12910-2-ville.syrjala@linux.intel.com>
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

Rename drm_plane_check_pixel_format() to drm_plane_has_format()
and change the return type accordingly. Allows one to write
more natural code.

Also matches drm_any_plane_has_format() better.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_atomic.c        |  7 ++-----
 drivers/gpu/drm/drm_crtc.c          |  6 ++----
 drivers/gpu/drm/drm_crtc_internal.h |  4 ++--
 drivers/gpu/drm/drm_plane.c         | 22 ++++++++++------------
 4 files changed, 16 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index a91737adf8e7..e22560213b8e 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -608,7 +608,6 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 	unsigned int fb_width, fb_height;
 	struct drm_mode_rect *clips;
 	uint32_t num_clips;
-	int ret;
 
 	/* either *both* CRTC and FB must be set, or neither */
 	if (crtc && !fb) {
@@ -635,14 +634,12 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 	}
 
 	/* Check whether this plane supports the fb pixel format. */
-	ret = drm_plane_check_pixel_format(plane, fb->format->format,
-					   fb->modifier);
-	if (ret) {
+	if (!drm_plane_has_format(plane, fb->format->format, fb->modifier)) {
 		drm_dbg_atomic(plane->dev,
 			       "[PLANE:%d:%s] invalid pixel format %p4cc, modifier 0x%llx\n",
 			       plane->base.id, plane->name,
 			       &fb->format->format, fb->modifier);
-		return ret;
+		return -EINVAL;
 	}
 
 	/* Give drivers some help against integer overflows */
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 483969b84a30..3488ff067c69 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -789,12 +789,10 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 		 * case.
 		 */
 		if (!plane->format_default) {
-			ret = drm_plane_check_pixel_format(plane,
-							   fb->format->format,
-							   fb->modifier);
-			if (ret) {
+			if (!drm_plane_has_format(plane, fb->format->format, fb->modifier)) {
 				drm_dbg_kms(dev, "Invalid pixel format %p4cc, modifier 0x%llx\n",
 					    &fb->format->format, fb->modifier);
+				ret = -EINVAL;
 				goto out;
 			}
 		}
diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index 25aaae937ceb..898e0e8b51be 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -272,8 +272,8 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 /* drm_plane.c */
 int drm_plane_register_all(struct drm_device *dev);
 void drm_plane_unregister_all(struct drm_device *dev);
-int drm_plane_check_pixel_format(struct drm_plane *plane,
-				 u32 format, u64 modifier);
+bool drm_plane_has_format(struct drm_plane *plane,
+			  u32 format, u64 modifier);
 struct drm_mode_rect *
 __drm_plane_get_damage_clips(const struct drm_plane_state *state);
 
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 57662a1fd345..268aa2299df5 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -877,8 +877,8 @@ int drm_mode_getplane(struct drm_device *dev, void *data,
 	return 0;
 }
 
-int drm_plane_check_pixel_format(struct drm_plane *plane,
-				 u32 format, u64 modifier)
+bool drm_plane_has_format(struct drm_plane *plane,
+			  u32 format, u64 modifier)
 {
 	unsigned int i;
 
@@ -887,24 +887,24 @@ int drm_plane_check_pixel_format(struct drm_plane *plane,
 			break;
 	}
 	if (i == plane->format_count)
-		return -EINVAL;
+		return false;
 
 	if (plane->funcs->format_mod_supported) {
 		if (!plane->funcs->format_mod_supported(plane, format, modifier))
-			return -EINVAL;
+			return false;
 	} else {
 		if (!plane->modifier_count)
-			return 0;
+			return true;
 
 		for (i = 0; i < plane->modifier_count; i++) {
 			if (modifier == plane->modifiers[i])
 				break;
 		}
 		if (i == plane->modifier_count)
-			return -EINVAL;
+			return false;
 	}
 
-	return 0;
+	return true;
 }
 
 static int __setplane_check(struct drm_plane *plane,
@@ -924,12 +924,10 @@ static int __setplane_check(struct drm_plane *plane,
 	}
 
 	/* Check whether this plane supports the fb pixel format. */
-	ret = drm_plane_check_pixel_format(plane, fb->format->format,
-					   fb->modifier);
-	if (ret) {
+	if (!drm_plane_has_format(plane, fb->format->format, fb->modifier)) {
 		DRM_DEBUG_KMS("Invalid pixel format %p4cc, modifier 0x%llx\n",
 			      &fb->format->format, fb->modifier);
-		return ret;
+		return -EINVAL;
 	}
 
 	/* Give drivers some help against integer overflows */
@@ -964,7 +962,7 @@ bool drm_any_plane_has_format(struct drm_device *dev,
 	struct drm_plane *plane;
 
 	drm_for_each_plane(plane, dev) {
-		if (drm_plane_check_pixel_format(plane, format, modifier) == 0)
+		if (drm_plane_has_format(plane, format, modifier))
 			return true;
 	}
 
-- 
2.43.2

