Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 112DA905D10
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 22:47:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F41910E905;
	Wed, 12 Jun 2024 20:47:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bzzqFfWb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5398010E8FE;
 Wed, 12 Jun 2024 20:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718225243; x=1749761243;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sDO5t6+SgFkDNQBN+IosP8kKMyXQmXUbV/0Nu/o2i2w=;
 b=bzzqFfWbdHQwV9h9EYWYOWT9APv/ay/qOElQlFcR6oSHADmyuqFbsDRV
 m3l/et+1g8UMEqE9J02bcbu+4yfsB67NgKbzhMzItBwx1BD223tRX74qe
 ws8PNQaQlcHf61hcTVGbOic5HfNzs9+RXNL1Vy/r+I7UHegJXqE8nCkIe
 8CXxuLp2mG2JPDZa4JAiZzO2O7OG+1d71GQg90NOsoInhgwCs+TuYTATe
 kKZtYNeqaXsY0LNWFVfnFsjn/c3lYDLBSIB3Upl5nk2GyIFuckei6FPuT
 ru4nUv6Exp/Y1zmlB3shz0T4o+IYX0emfYs9z8asvV57Smae/nEfQBpAg A==;
X-CSE-ConnectionGUID: I4xNoCd4QrSu59b/EkquHQ==
X-CSE-MsgGUID: WThpTGtjS5yexRXhwVPoSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14976534"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="14976534"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 13:47:22 -0700
X-CSE-ConnectionGUID: 38+MusxoQQSLg0EJ6+kftw==
X-CSE-MsgGUID: NZAoSL+hRe69TjKeNl49HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="39863948"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 12 Jun 2024 13:47:19 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 12 Jun 2024 23:47:18 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 2/9] drm: Export drm_plane_has_format()
Date: Wed, 12 Jun 2024 23:47:05 +0300
Message-ID: <20240612204712.31404-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240612204712.31404-1-ville.syrjala@linux.intel.com>
References: <20240612204712.31404-1-ville.syrjala@linux.intel.com>
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

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_crtc_internal.h | 2 --
 drivers/gpu/drm/drm_plane.c         | 1 +
 include/drm/drm_plane.h             | 2 ++
 3 files changed, 3 insertions(+), 2 deletions(-)

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
2.44.2

