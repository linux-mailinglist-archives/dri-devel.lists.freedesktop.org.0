Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D58F0AF0F01
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 11:08:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B826A10E67C;
	Wed,  2 Jul 2025 09:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eyKtaG8d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A1A10E682;
 Wed,  2 Jul 2025 09:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751447278; x=1782983278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+T1XZVY3EF+98+x3d2B+llo1tyqAgNYLHChNkh7FpHE=;
 b=eyKtaG8d9F0/OuoWlBI2RV8BnnNZEgcft4sK5q+AjCwp/hzIW5cyr369
 rd8+BSRaj/BxGKCaN22FjfhNtzoUqeXUWk53eGygKExNac+IZQwI9GMep
 H06LkiRR9xqaLIcQyDZnRDPIPoV88DFitKtrO9BQo6wpJIcpp/3a1Lzl8
 FaPfqA0UowLLyBRgKo6cjAp1vXBVhrsyRB4To8b0eEJ0JcubpGzS57v7A
 x5zfnJSao/RZrqGc5oojVEg1ybco0DtgQmbRNDOGVjfGvmwqDUfSOKOB7
 KdVQvNeAfbsGzBGFeSzI45CVhqUaeQHXkJjmqeBtYB4Pt0iGzDakmm8HX A==;
X-CSE-ConnectionGUID: U98kSpSXRyK/EngpXn7amw==
X-CSE-MsgGUID: SLE4Ghe+QeGbnQIV624pxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64427001"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="64427001"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 02:07:58 -0700
X-CSE-ConnectionGUID: iilf+mMjQt+JJp2/tctNnQ==
X-CSE-MsgGUID: r1XwOADUSfK9gvfqRx/mhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="159536441"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa004.fm.intel.com with ESMTP; 02 Jul 2025 02:07:54 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v5 06/24] drm: Add helper to extract lut from struct drm_color_lut_32
Date: Wed,  2 Jul 2025 14:49:18 +0530
Message-ID: <20250702091936.3004854-7-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250702091936.3004854-1-uma.shankar@intel.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
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

Add helper to extract lut values in the precision needed by
hardware.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 include/drm/drm_color_mgmt.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index ba420444b9f3..b1d12f06fc6e 100644
--- a/include/drm/drm_color_mgmt.h
+++ b/include/drm/drm_color_mgmt.h
@@ -50,6 +50,22 @@ static inline u32 drm_color_lut_extract(u32 user_input, int bit_precision)
 					 (1 << 16) - 1);
 }
 
+/**
+ * drm_color_lut_32_extract - clamp and round LUT entries
+ * @user_input: input value
+ * @bit_precision: number of bits the hw LUT supports
+ *
+ * Extract U0.bit_precision from a U0.32 LUT value.
+ *
+ */
+static inline u32 drm_color_lut_32_extract(u32 user_input, int bit_precision)
+{
+	u64 max = (bit_precision >= 64) ? ~0ULL : (1ULL << bit_precision) - 1;
+
+	return DIV_ROUND_CLOSEST_ULL((u64)user_input * max,
+				     (1ULL << 32) - 1);
+}
+
 u64 drm_color_ctm_s31_32_to_qm_n(u64 user_input, u32 m, u32 n);
 
 void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
-- 
2.42.0

