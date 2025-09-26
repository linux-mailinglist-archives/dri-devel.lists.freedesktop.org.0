Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 073A9BA3834
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 13:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1348310EA3F;
	Fri, 26 Sep 2025 11:42:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D2QAxbRA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E59B510EA45;
 Fri, 26 Sep 2025 11:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758886947; x=1790422947;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=11uOjgqCwp8kLjluv7ozUJJlSlNnyn2vnFgDC3Bw3FA=;
 b=D2QAxbRAhhuyULet0r5eAX1Gnk701QRilnH9pEmM1p0EXSECKKjUFG6E
 zOkQQP93vFjAw3T+Qyu+d740oJTE/4ZugL+5+U/HR9upHzi5mMHMDWl6z
 r0m1A0OHKvbhToTaoFgQkSHSHgK3+i1ipeFRWg2ggPfa2emQAwki/LOsj
 nj3nU/HZZZ9MTyDSJmBhaRD0u9nD5DpYMGwrEU13PWKJcbXvLsQRSxfBn
 bph6YjZf34r2cYWY0kCzHTyPZivAQr5TFESM0DsTzS2DNeJl1fV3nOspn
 ki4n1uLT8I2VUgtw2H72ZumVPKn/qvIt+5z7c/N0tUx4bVDEixge7MTnU Q==;
X-CSE-ConnectionGUID: sHzzQhKaQr20vJ3amrl9zg==
X-CSE-MsgGUID: 3aY0TAIsR32hh8B/gNYHcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="78860110"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="78860110"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 04:42:27 -0700
X-CSE-ConnectionGUID: fXEWd3BBRDuXR47DRWyU+A==
X-CSE-MsgGUID: rbwUllRnRPy4fW1KynW23g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="176723527"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa006.jf.intel.com with ESMTP; 26 Sep 2025 04:42:25 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 10/10] drm/i915/display: Expose sharpness strength property
Date: Fri, 26 Sep 2025 17:07:28 +0530
Message-Id: <20250926113728.606315-11-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250926113728.606315-1-nemesa.garg@intel.com>
References: <20250926113728.606315-1-nemesa.garg@intel.com>
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

Expose the drm crtc sharpness strength property which will enable
or disable the sharpness/casf based on user input. With this user
can set/update the strength of the sharpness or casf filter.

v2: Update subject[Ankit]

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index a187db6df2d3..4102087aee62 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -390,6 +390,9 @@ int intel_crtc_init(struct intel_display *display, enum pipe pipe)
 
 	drm_WARN_ON(display->drm, drm_crtc_index(&crtc->base) != crtc->pipe);
 
+	if (HAS_CASF(display))
+		drm_crtc_create_sharpness_strength_property(&crtc->base);
+
 	return 0;
 
 fail:
-- 
2.25.1

