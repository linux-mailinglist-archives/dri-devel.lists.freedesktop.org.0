Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC5FAB0998
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 07:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 409A110E9A3;
	Fri,  9 May 2025 05:19:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GgLj/Uxh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05E710E9A0;
 Fri,  9 May 2025 05:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746767945; x=1778303945;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mPKz6eRY+kujDlNZFZEFRz4f/VwUhAjzVWJMnoojBwg=;
 b=GgLj/UxhlKaTGymn/HfNoQaK8F4bxvjuBFTF7/9j0cMbgAh473s1NFFh
 p9jzdl7m1BvLl4dV4vjgNx7M4gCiH6j0plrutWuQLVKj6N74zVpm88HGj
 IqjAHXEErgctBe7oDXzs0iCDpIlreaoaFMHpKOEXhJAWlHd/Rgh5QjbyN
 WlvEFTMdr3pE9EboccouS5SstOM/hldyN0JtOjebLc9SOtz73e9hjxzgx
 bjzUd0lV+aR5YGdO9e3yVg1jpKT06mo4mNrcmVtuGA1W1K+bZYTFrXtwf
 7EgmqNEOr3u8Tjrvv5biQXlE8tSwoEqNRwJliydGMPFr8Oqyz1xneDeWL w==;
X-CSE-ConnectionGUID: Yb/ajlp7RWi7nFah3XBcNQ==
X-CSE-MsgGUID: oCWzo03bR+S65zyexhE4ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48287153"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="48287153"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 22:19:05 -0700
X-CSE-ConnectionGUID: 7q9ZWD+6QTintFe8JABYNQ==
X-CSE-MsgGUID: 7zlgkKmxQA6fIlKz0qTFYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="141414932"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa005.fm.intel.com with ESMTP; 08 May 2025 22:19:02 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 10/13] drm/dp: Enable backlight control using luminance
Date: Fri,  9 May 2025 10:48:13 +0530
Message-Id: <20250509051816.1244486-11-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509051816.1244486-1-suraj.kandpal@intel.com>
References: <20250509051816.1244486-1-suraj.kandpal@intel.com>
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

Add flag to enable brightness control via luminance value
when enabling edp backlight.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index f99e3ae78eac..1643907b3916 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4030,6 +4030,9 @@ int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backli
 	else
 		dpcd_buf = DP_EDP_BACKLIGHT_CONTROL_MODE_PWM;
 
+	if (bl->luminance_set)
+		dpcd_buf |= DP_EDP_PANEL_LUMINANCE_CONTROL_ENABLE;
+
 	if (bl->pwmgen_bit_count) {
 		ret = drm_dp_dpcd_write_byte(aux, DP_EDP_PWMGEN_BIT_COUNT, bl->pwmgen_bit_count);
 		if (ret < 0)
-- 
2.34.1

