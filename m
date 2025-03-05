Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D334EA4FFD8
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:14:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB35310E731;
	Wed,  5 Mar 2025 13:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eCWkQ3zU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A962710E731;
 Wed,  5 Mar 2025 13:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741180469; x=1772716469;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bXc8YBHsnVtCWCDGHE7Re09IhY9TWW7MT4/DxYb82BQ=;
 b=eCWkQ3zUe5qHKJocfePECD4lnvonvES8d4mzc05Ux3L9/XGJSCweEdRk
 JisixgH6MPgsqhT6o3P6McfNx+voXRDQxVnxhyfgTGslJGMNSsXdTesaP
 wQmsFzQRSDJwt96Y+sYg7AKDyJ1b95YgEyUiIbH9cWcIhhFliufZ5oT9S
 vJO5vCTpRrpecygJzwq1x0HfuZORO0Bdn6rKbyyd5M6yK4LSmPvn7nTfa
 Miv12YmkqZVZJg63fbZm5Hd6JZyCJ8S48Xk3Dl6XNhQtREGLAgZm+TeGI
 0QG7f0RcXJnWTFFwS3etj7rSubyRQgOptYiA56Y781TRBYHj/Hb3+5jAA w==;
X-CSE-ConnectionGUID: gmRpTphBQrCCqcNiyVLTzQ==
X-CSE-MsgGUID: fFtxbofdTqiSm6g4iXGMUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59685427"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="59685427"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 05:14:29 -0800
X-CSE-ConnectionGUID: hA28N4pOQ9iubDEJiOpOxw==
X-CSE-MsgGUID: UgX6FSCgQx2zogTodh45tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="118701111"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa006.jf.intel.com with ESMTP; 05 Mar 2025 05:14:24 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 dmitry.baryshkov@linaro.org,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v3 06/23] drm: Add 1D LUT multi-segmented color op
Date: Wed,  5 Mar 2025 18:55:51 +0530
Message-ID: <20250305132608.2379253-7-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250305132608.2379253-1-uma.shankar@intel.com>
References: <20250305132608.2379253-1-uma.shankar@intel.com>
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

Add support for color ops that can be programmed
by 1 dimensional multi segmented Look Up Tables.

v2: Fixed the documentation for Multi segmented lut (Dmitry)

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/drm_atomic.c      |  4 ++++
 drivers/gpu/drm/drm_atomic_uapi.c |  3 +++
 include/uapi/drm/drm_mode.h       | 10 ++++++++++
 3 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index ab7d2ed9ee8c..c79ed3551abc 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -800,6 +800,10 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 			   drm_get_colorop_lut1d_interpolation_name(colorop->lut1d_interpolation));
 		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
 		break;
+	case DRM_COLOROP_1D_LUT_MULTSEG:
+		drm_printf(p, "\thw cap blob id=%d\n", state->hw_caps ? state->hw_caps->base.id : 0);
+		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
+		break;
 	case DRM_COLOROP_CTM_3X3:
 		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
 		break;
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index b469f0ee9a25..ff125dc4872a 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -715,6 +715,9 @@ static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
 		size = colorop->lut_size * colorop->lut_size * colorop->lut_size *
 		       sizeof(struct drm_color_lut);
 		break;
+	case DRM_COLOROP_1D_LUT_MULTSEG:
+		elem_size = sizeof(struct drm_color_lut_32);
+		break;
 	default:
 		/* should never get here */
 		return -EINVAL;
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 9ba64d5b20c8..bd58c9f5f98d 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -923,6 +923,16 @@ enum drm_colorop_type {
 	 */
 	DRM_COLOROP_CTM_3X4,
 
+	/**
+	 * @DRM_COLOROP_1D_LUT_MULTSEG:
+	 *
+	 * A 1D LUT with multiple segments to cover the full color range with non-uniformly
+	 * distributed &drm_color_lut entries, packed into a blob via the DATA property.
+	 * The driver's expected LUT size and segmented capabilities are advertised via the
+	 * HW_CAPS property.
+	 */
+	DRM_COLOROP_1D_LUT_MULTSEG,
+
 	/**
 	 * @DRM_COLOROP_CTM_3X3:
 	 *
-- 
2.42.0

