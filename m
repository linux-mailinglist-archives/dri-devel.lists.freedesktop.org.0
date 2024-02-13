Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 787C2852922
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 07:41:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5960E10E87B;
	Tue, 13 Feb 2024 06:41:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Swh08F1Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E0610E88F;
 Tue, 13 Feb 2024 06:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707806466; x=1739342466;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DO7fd7xwxlCNbpixebrBnyO2ngWuTMW8bLq8bHfdoS0=;
 b=Swh08F1Z4Z8qFvhLIDVBgbRijwnUvpKb+Eep1pBldv5MsO0XVjcT7qnW
 CPjeOqTL97YovuRocp2LJBubXlGHF5Wg7Vys4NHW50kmKfxiLjJfJpaMt
 W30QECN/O0kQMujWb9fKvgTF8UH6GGhyDxH7nzkLPHIFfQHeAFQ+st+7z
 hDH7N4rDqeqLqXCmqKZBgSDDnkEt9RBGTLqG5fuKxBF+MeDuss03WTgyk
 1c9ETQsM+RVr9nvilRazeXhvY+YT+G5Np8km9uJOyBzC1PoryDD99Exhi
 bouHpb7JQjR3lEiS55Izp6zTWEXn37jpbhL4b8/t2jU+yt7aKaEp509Ch Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="436947735"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="436947735"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:41:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7450221"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa003.jf.intel.com with ESMTP; 12 Feb 2024 22:40:59 -0800
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
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH 05/28] drm: Add support for 3x3 CTM
Date: Tue, 13 Feb 2024 12:18:12 +0530
Message-ID: <20240213064835.139464-6-uma.shankar@intel.com>
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

Add support for 3x3 Color Transformation Matrices in Color Pipeline.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 3 +++
 drivers/gpu/drm/drm_colorop.c     | 2 +-
 include/uapi/drm/drm_mode.h       | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index e7bf1fb054af..c54b0d6c133e 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -716,6 +716,9 @@ static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
 	case DRM_COLOROP_CTM_3X4:
 		size = sizeof(struct drm_color_ctm_3x4);
 		break;
+	case DRM_COLOROP_CTM_3X3:
+		size = sizeof(struct drm_color_ctm);
+		break;
 	default:
 		/* should never get here */
 		return -EINVAL;
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 462ffec42cdf..6bae6dc8e54b 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -107,7 +107,7 @@ int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
 				   0);
 
 	/* data */
-	if (type == DRM_COLOROP_CTM_3X4) {
+	if (type == DRM_COLOROP_CTM_3X4 || type == DRM_COLOROP_CTM_3X3) {
 		prop = drm_property_create(dev, DRM_MODE_PROP_ATOMIC | DRM_MODE_PROP_BLOB,
 					   "DATA", 0);
 		if (!prop)
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index f16318f1785f..68696253867e 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -868,6 +868,7 @@ struct drm_color_lut {
 
 enum drm_colorop_type {
 	DRM_COLOROP_1D_CURVE,
+	DRM_COLOROP_CTM_3X3,
 	DRM_COLOROP_CTM_3X4,
 };
 
-- 
2.42.0

