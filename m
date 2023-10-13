Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC127C867F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 15:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27AB410E601;
	Fri, 13 Oct 2023 13:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0737510E608;
 Fri, 13 Oct 2023 13:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697202856; x=1728738856;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5xrug8HZq43uY520921QuJPLKII1x9LKK5MRop5qt/0=;
 b=hhooh1qW6nn+V5Wkr+RZvX3/4ESA0lRwxgUTTwTC+fMbKgSxEsa0Fu+V
 xNA7tkJGMoDRML+oeGt5fQ2OJGVuC6i2DxuWiqCjvkBB0So1HQz0b2Q47
 GNKv/wDZVRG6pBpAEp86f/TCcHMI+RPqDGpLEAh3Wi+sWi/uzN+IlGzIm
 +PJ7PPFpy88aMCLW57qlVK6TMB35pIhdskdzyCINMmFI+hNJ6LklPSgJi
 19DT+z7EZPWpL0MfH3lQw4yp7xDhwc9zCYAMqEF4LaxCUyr8Y8ZD4abqN
 aCr1YeydEBNDvK9QdwVaXQBso/oXenm0oSAyiwMAMh7wB3O0+LDUm//OX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="449370254"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="449370254"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 06:14:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="1086136005"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="1086136005"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmsmga005.fm.intel.com with SMTP; 13 Oct 2023 06:14:10 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 13 Oct 2023 16:14:09 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/4] drm/i915: Adjust LUT rounding rules
Date: Fri, 13 Oct 2023 16:14:00 +0300
Message-ID: <20231013131402.24072-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013131402.24072-1-ville.syrjala@linux.intel.com>
References: <20231013131402.24072-1-ville.syrjala@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

drm_color_lut_extract() rounding was changed to follow the
OpenGL int<->float conversion rules. Adjust intel_color_lut_pack()
to match.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 2a2a163ea652..b01f463af861 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -785,14 +785,12 @@ static void chv_assign_csc(struct intel_crtc_state *crtc_state)
 /* convert hw value with given bit_precision to lut property val */
 static u32 intel_color_lut_pack(u32 val, int bit_precision)
 {
-	u32 max = 0xffff >> (16 - bit_precision);
-
-	val = clamp_val(val, 0, max);
-
-	if (bit_precision < 16)
-		val <<= 16 - bit_precision;
-
-	return val;
+	if (bit_precision > 16)
+		return DIV_ROUND_CLOSEST_ULL(mul_u32_u32(val, (1 << 16) - 1),
+					     (1 << bit_precision) - 1);
+	else
+		return DIV_ROUND_CLOSEST(val * ((1 << 16) - 1),
+					 (1 << bit_precision) - 1);
 }
 
 static u32 i9xx_lut_8(const struct drm_color_lut *color)
-- 
2.41.0

