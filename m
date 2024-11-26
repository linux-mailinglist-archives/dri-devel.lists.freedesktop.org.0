Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A44C9D9841
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 14:20:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95AB10E88C;
	Tue, 26 Nov 2024 13:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S8TnIF8N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13AF10E887;
 Tue, 26 Nov 2024 13:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732627199; x=1764163199;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2+5sWGsH0iiog5/NuItniDi6oxtdV00lOqX1LHUBxws=;
 b=S8TnIF8NfaqXriWIgoxV4g/3aK3kiAzRpDL3wF+n7qJm0u3AfAkxrzZY
 JmOVxCUjfM5y0ymIBZi9RdoupNM15CNqkT5xazCrQPwQii2LbqfeVU8B2
 YpAk1/SRsHcGAUg/O/S2gv1yCzI/NejmMt+lWejNvTFA3qFpP4fAaAgnF
 TZIDJuehLiFZXwBDb0T9nZInjtCcaP3EfyWjZ3Y90gsh7RU9+yTIX634R
 dDilHvxLHjqiyFWoXqK7Ya6/7ehL+ogMhJrlZ0vVBBxEx7QEL7WYiHsF3
 g8IbeZj9UKxFT1oR3jx5+oHmeoGcvXkcfzpu0xSoo/4yJR12AXzMvjp9y g==;
X-CSE-ConnectionGUID: dIFSEqjnQRiww/FScoYzeQ==
X-CSE-MsgGUID: kZNz60YMQDepIjxfws6Diw==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="44170146"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="44170146"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 05:19:58 -0800
X-CSE-ConnectionGUID: 4EpHCoNLQ9qXs6MPMDh3BA==
X-CSE-MsgGUID: dsdwCJuuSpaTaI7qAi1S0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="114874635"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2024 05:19:54 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v2 07/25] drm: Add 1D LUT multi-segmented color op
Date: Tue, 26 Nov 2024 18:57:12 +0530
Message-ID: <20241126132730.1192571-8-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20241126132730.1192571-1-uma.shankar@intel.com>
References: <20241126132730.1192571-1-uma.shankar@intel.com>
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

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/drm_atomic.c      | 4 ++++
 drivers/gpu/drm/drm_atomic_uapi.c | 3 +++
 include/uapi/drm/drm_mode.h       | 8 ++++++++
 3 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 8a75f4a0637a..f344d64d42ce 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -802,6 +802,10 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 		drm_printf(p, "\tinterpolation=%s\n", drm_get_colorop_lut1d_interpolation_name(colorop->lut1d_interpolation));
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
index 46cc7b0df6e8..326159bff91c 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -720,6 +720,9 @@ static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
 		size = modes[index].lut_stride[0] * modes[index].lut_stride[1] * modes[index].lut_stride[2] *
 		       sizeof(struct drm_color_lut);
 		break;
+	case DRM_COLOROP_1D_LUT_MULTSEG:
+		elem_size = sizeof(struct drm_color_lut_32);
+		break;
 	default:
 		/* should never get here */
 		return -EINVAL;
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 9ed8b1b1357a..d126a5410eea 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -923,6 +923,14 @@ enum drm_colorop_type {
 	 */
 	DRM_COLOROP_CTM_3X4,
 
+	/**
+	 * @DRM_COLOROP_1D_LUT_MULTSEG:
+	 *
+	 * A 3x4 matrix. Its values are specified via the
+	 * &drm_color_ctm_3x4 struct provided via the DATA property.
+	 */
+	DRM_COLOROP_1D_LUT_MULTSEG,
+
 	/**
 	 * @DRM_COLOROP_CTM_3X3:
 	 *
-- 
2.42.0

