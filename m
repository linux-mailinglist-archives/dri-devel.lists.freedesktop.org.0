Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA26B10C03
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 15:51:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9596910E95F;
	Thu, 24 Jul 2025 13:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D+deaQOL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287F710E956;
 Thu, 24 Jul 2025 13:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753365076; x=1784901076;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=11uOjgqCwp8kLjluv7ozUJJlSlNnyn2vnFgDC3Bw3FA=;
 b=D+deaQOLVSFoc6OZejI87B524LB5ymlIQsD+P7GBwRgoikpcbuUazZ6r
 EGqIqGt0e58UVUAmYo+OSyzGwhTAMbD3vFHaOrp63bgryZWswH9o3KVV3
 Yf2WcgmZtrIvVL6lZ90g44w2SJFPaeJNUlKddu2Xw48Rj3sK1bsrviaYX
 htoPcSj3yn7Ux2Isw+w7CBm43I0X0lOWNuObk0+ODi9LitaK/hir25+u1
 rBSzbjbhpFqHEEWb6UnoJ69HlBfTirKgqHlMgwlxX9pbXlKrzsFpe133S
 xcohzTWPCslp55Zld8cuyqwHDZKqQsVZhswVsmVFrbYqCImJScpb5sBRu g==;
X-CSE-ConnectionGUID: f+ZOl4ndThubEqW0REEUSg==
X-CSE-MsgGUID: jiKkJVczR3q2C+71dk9IQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55553893"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="55553893"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 06:51:16 -0700
X-CSE-ConnectionGUID: icOA6clqRFi5rRE/Bu1bWQ==
X-CSE-MsgGUID: Ifx0opgtQnqfr/Sahu55Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="159826497"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa007.fm.intel.com with ESMTP; 24 Jul 2025 06:51:13 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 10/10] drm/i915/display: Expose sharpness strength property
Date: Thu, 24 Jul 2025 19:15:44 +0530
Message-Id: <20250724134544.284371-11-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250724134544.284371-1-nemesa.garg@intel.com>
References: <20250724134544.284371-1-nemesa.garg@intel.com>
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

