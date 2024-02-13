Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD7A852959
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 07:43:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9FAA10E1CF;
	Tue, 13 Feb 2024 06:43:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R855FCn1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A9910E1CF;
 Tue, 13 Feb 2024 06:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707806621; x=1739342621;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bIyIxBrBFVizwyfBukGCLyCV9/2yxvvzpCMrmZ+AJoM=;
 b=R855FCn1OP2Kvx0I4BLNTBwnikt14ALDu6Xx1XuQhJJXf0aTJBV8TbXt
 mt+LNsdd3WARG2XMCPKfTcJwYshNes5CJcW5jb2/oZ1AvI347O8PG1gDZ
 owZ6xg1klZfRtgmQRK+f4uh7qTYHHD+4PcO7631Cj5XbQLqhkaB5Vbe7j
 JGMSBKZ4XKqPIIjGE0eUDhLRisbe2ovatxEbEqvZOqwTO0mV+LqnlOuLE
 iNuWwEAILTAEtlWBXirRtkC0q8/dLE9EqPAyRSF7IQPcyWpIguBlGce3a
 bpSoOgDQQ/HH6AeEBMqQrVqTvT0p3loPiIdvjO+IrvOfT8ItmwAukkdJ/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="436948306"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="436948306"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:43:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7450717"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa003.jf.intel.com with ESMTP; 12 Feb 2024 22:43:35 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, harry.wentland@amd.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, arthurgrillo@riseup.net, marcan@marcan.st,
 Liviu.Dudau@arm.com, sashamcintosh@google.com, sean@poorly.run,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [PATCH 27/28] FIXME: force disable legacy plane color properties for
 TGL and beyond
Date: Tue, 13 Feb 2024 12:18:34 +0530
Message-ID: <20240213064835.139464-28-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240213064835.139464-1-uma.shankar@intel.com>
References: <20240213064835.139464-1-uma.shankar@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

The decision should be made based on the
DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE.
Right now the value of this cap is not passed on to the driver.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index e941e2e4fd14..7096ea8a3454 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -2424,12 +2424,14 @@ skl_universal_plane_create(struct drm_i915_private *dev_priv,
 	if (DISPLAY_VER(dev_priv) >= 10)
 		supported_csc |= BIT(DRM_COLOR_YCBCR_BT2020);
 
-	drm_plane_create_color_properties(&plane->base,
-					  supported_csc,
-					  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
-					  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
-					  DRM_COLOR_YCBCR_BT709,
-					  DRM_COLOR_YCBCR_LIMITED_RANGE);
+	/* TODO: Make it based on client cap */
+	if (DISPLAY_VER(dev_priv) <= 11)
+		drm_plane_create_color_properties(&plane->base,
+						  supported_csc,
+						  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
+						  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
+						  DRM_COLOR_YCBCR_BT709,
+						  DRM_COLOR_YCBCR_LIMITED_RANGE);
 
 	drm_plane_create_alpha_property(&plane->base);
 	drm_plane_create_blend_mode_property(&plane->base,
-- 
2.42.0

