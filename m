Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 452EFA6BF48
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 17:11:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756BD10E7FB;
	Fri, 21 Mar 2025 16:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RO2LwNmA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C9910E7F4;
 Fri, 21 Mar 2025 16:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742573504; x=1774109504;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7f9DBootXerLym9RywPZ6+8LZNDLuSOf8EHoqAYrS50=;
 b=RO2LwNmASeFLsYpf9anjwbLoJdPFbZD2+K7Bvwtjx7nsN43U8QxlPHfy
 OPd/qbTCgyTbpt28gzgYAQJxtQVcLkgVzG8cq5Vctxkq5KZyJA7XHdCAc
 gkfVAUR7tEbe4rkBnSsVu05eVOje2EMvECMC7fB27ahaliEqzc0imclnE
 OFFionQOvbhEuTb8DvvRKs6+OefR74dwEGkR1X39FlNPkju+jFm7mglVB
 m8Njp0frITQiPnRIY4OwFDWHSqpxT2agDSvWoxixKriJffY6d3c4ifH+G
 4c+vTJfxtyulRlyNsX1Re7386QY1CvbA3rxqUrHztjxet/Xa4ddXuDSit w==;
X-CSE-ConnectionGUID: XCJotvGFRp6jcarTvpPfhw==
X-CSE-MsgGUID: bdgZm7DPSyqXjo53jXJ8WQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="66308458"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="66308458"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 09:11:44 -0700
X-CSE-ConnectionGUID: fPfyxlCrQeSXf5ROrN6Thw==
X-CSE-MsgGUID: AD1tCUtdT06ZTkNajqWfbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="128554926"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa004.fm.intel.com with ESMTP; 21 Mar 2025 09:11:43 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 02/12] drm/i915/display: Introduce HAS_CASF for sharpness
 support
Date: Fri, 21 Mar 2025 21:36:18 +0530
Message-Id: <20250321160628.2663912-3-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250321160628.2663912-1-nemesa.garg@intel.com>
References: <20250321160628.2663912-1-nemesa.garg@intel.com>
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

HAS_CASF macro will be used to check whether platform
support the content adaptive sharpness capability or
not.

v2: Update commit message[Ankit]

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_device.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index 368b0d3417c2..09b9991beffa 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -145,6 +145,7 @@ struct intel_display_platforms {
 #define HAS_ASYNC_FLIPS(__display)	(DISPLAY_VER(__display) >= 5)
 #define HAS_AS_SDP(__display)		(DISPLAY_VER(__display) >= 13)
 #define HAS_BIGJOINER(__display)	(DISPLAY_VER(__display) >= 11 && HAS_DSC(__display))
+#define HAS_CASF(__display)		(DISPLAY_VER(__display) >= 20)
 #define HAS_CDCLK_CRAWL(__display)	(DISPLAY_INFO(__display)->has_cdclk_crawl)
 #define HAS_CDCLK_SQUASH(__display)	(DISPLAY_INFO(__display)->has_cdclk_squash)
 #define HAS_CMRR(__display)		(DISPLAY_VER(__display) >= 20)
-- 
2.25.1

