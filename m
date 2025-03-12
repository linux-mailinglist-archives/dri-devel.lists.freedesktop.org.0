Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B86BA5D6F1
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 08:12:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B570510E6EC;
	Wed, 12 Mar 2025 07:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dwZ6tNNR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14A710E6E6;
 Wed, 12 Mar 2025 07:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741763556; x=1773299556;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s7QQd0QDy4sxnq7Gpu+KrHgFIvvRM4W8ehPxy3QF1v4=;
 b=dwZ6tNNRYrEcxld+EbVLxnr602yeIbHugbdpfxow4hEsWTl+ZHW9h1ih
 uOdJO8E6x7NfK+6zj6gOCjdNBAYWQar+Tnyb1MbA9Hbwy6SBLnWIc+oqG
 AfIvPbrSmTZOwah868sIBAGtqegnfUeOM7m77sl4k7GEuNOFFEmUCMw7b
 JZdujwW6hkc6gbdmJ1AqnUMCuyq2T0fvYQSiJkaVWUVUSB5ss7VhhO6Jb
 2HC3ZzDsmWrK+YHgcfHPQYAQnPNdKX6aCqL9BGj2HoDHG8Ts/Yp+Uf9Hu
 vf69VOKYEVVNUUYeVXSk8Yze28MWe6+B43FN3mGh6NPsCj3dVAO7fXr+C g==;
X-CSE-ConnectionGUID: StXMtti9QjKG8aMcI3x/qw==
X-CSE-MsgGUID: X+VSx1OxSYO/hVSvyvr/zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="65288722"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="65288722"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 00:12:36 -0700
X-CSE-ConnectionGUID: SqXoB/J4TPqpP2+W9KmgBQ==
X-CSE-MsgGUID: lkhG2xWzRde4fWbIY4/X4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="120366154"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa006.fm.intel.com with ESMTP; 12 Mar 2025 00:12:33 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v4 05/23] drm: Add Color ops capability property
Date: Wed, 12 Mar 2025 12:54:07 +0530
Message-ID: <20250312072425.3099205-6-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250312072425.3099205-1-uma.shankar@intel.com>
References: <20250312072425.3099205-1-uma.shankar@intel.com>
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

Add capability property which a colorop can expose it's
hardware's abilities. It's a blob property that can be
filled with respective data structures depending on the
colorop. The user space is expected to read this property
and program the colorop accordingly.

v2: Added documentation for hw_caps blob (Dmitry)

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c |  3 +++
 include/drm/drm_colorop.h         | 17 +++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 3dd932647702..14d7939780db 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -771,6 +771,9 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = colorop->lut3d_interpolation;
 	} else if (property == colorop->data_property) {
 		*val = (state->data) ? state->data->base.id : 0;
+	} else if (property == colorop->hw_caps_property) {
+		*val = state->hw_caps ?
+			state->hw_caps->base.id : 0;
 	} else {
 		return -EINVAL;
 	}
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 1cd8ce81224e..731bd1484c34 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -141,6 +141,16 @@ struct drm_colorop_state {
 	 */
 	uint64_t multiplier;
 
+	/**
+	 * @hw_caps:
+	 *
+	 * This blob will be of type struct drm_color_lut_range which contains the
+	 * hardware capabilities of 1D LUT. These include number of LUT segments,
+	 * number of LUT samples per segment, start and end point of respective
+	 * segments and the precision of the LUT sample along with the normalization factor
+	 */
+	struct drm_property_blob *hw_caps;
+
 	/**
 	 * @data:
 	 *
@@ -309,6 +319,13 @@ struct drm_colorop {
 	 */
 	struct drm_property *curve_1d_type_property;
 
+	/**
+	 * @hw_caps_property:
+	 *
+	 * Property to expose hardware lut capabilities.
+	 */
+	struct drm_property *hw_caps_property;
+
 	/**
 	 * @multiplier_property:
 	 *
-- 
2.42.0

