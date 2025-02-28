Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F5EA4955F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 10:38:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E6110EC41;
	Fri, 28 Feb 2025 09:38:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jxzwqZJp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD9210EC49;
 Fri, 28 Feb 2025 09:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740735522; x=1772271522;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nGCzX2qWHh25W+R4yPOb+zcrNWhZB6fLBoL2alcpJsg=;
 b=jxzwqZJpAmNhMlYMcSUSSzYujJUOLV8igoWc0WFfnudflOqxDEqz5Msk
 RNMRFS+hDkYHUWqFtRWJykQUN84jWj82e+5mjazL4O7LGv399cvbDKJ7Y
 YMuOkKYpEwc8ojRYKd4O/uLm5zk8Kwim4bTiUszPbG9nNuUzkkS6/VeLF
 z5M6g2By/N5mFOnfV+vUI4kwH12MUD9fzdjug9GHb6EG1qQfNHcVH2xOq
 mGrClVNHevtjWpixORcexvU5ZU8r7Nbdngy43R+KIM51TnhWwBEBiXw6J
 JJZxgcJbuWDZPViZ4dWLdEIz60Lm8+UtcMQYdAIvZBNZLPAaJdCQykVZD Q==;
X-CSE-ConnectionGUID: g04bnaJwREGTAJ0uJMXcHQ==
X-CSE-MsgGUID: 9pUMoeIGRQmJwu+5BHWCxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="52293092"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="52293092"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 01:38:42 -0800
X-CSE-ConnectionGUID: m7pRa5qoQDyXDcfvdqzJPQ==
X-CSE-MsgGUID: +HBHPMwYTFGVlBw9ux9fCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="154466534"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.245.246.23])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 01:38:39 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, vinod.govindapillai@intel.com,
 jani.nikula@intel.com, jani.saarinen@intel.com
Subject: [PATCH v10 5/9] drm/i915/fbc: introduce HAS_FBC_DIRTY_RECT() for FBC
 dirty rect support
Date: Fri, 28 Feb 2025 11:37:58 +0200
Message-ID: <20250228093802.27091-6-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250228093802.27091-1-vinod.govindapillai@intel.com>
References: <20250228093802.27091-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Introduce a macro to check if the platform supports FBC dirty
rect capability.

v2: - update to the patch subject

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_device.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index fc33791f02b9..717286981687 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -163,6 +163,7 @@ struct intel_display_platforms {
 #define HAS_DSC(__display)		(DISPLAY_RUNTIME_INFO(__display)->has_dsc)
 #define HAS_DSC_MST(__display)		(DISPLAY_VER(__display) >= 12 && HAS_DSC(__display))
 #define HAS_FBC(__display)		(DISPLAY_RUNTIME_INFO(__display)->fbc_mask != 0)
+#define HAS_FBC_DIRTY_RECT(__display)	(DISPLAY_VER(__display) >= 30)
 #define HAS_FPGA_DBG_UNCLAIMED(__display)	(DISPLAY_INFO(__display)->has_fpga_dbg)
 #define HAS_FW_BLC(__display)		(DISPLAY_VER(__display) >= 3)
 #define HAS_GMBUS_IRQ(__display)	(DISPLAY_VER(__display) >= 4)
-- 
2.43.0

