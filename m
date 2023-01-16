Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 726A966BDB1
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 13:19:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADAA210E3EF;
	Mon, 16 Jan 2023 12:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E269810E3EF;
 Mon, 16 Jan 2023 12:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673871548; x=1705407548;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3H/i0zpNTVsCg8t1O38161ofPY+gKJJCooashKntwcM=;
 b=oArqmhxZdFraj4XbZBeK4vsyL0R6vv/mbJrhxx5aQc4BH/jLX45Dc40t
 mvMPS10PQN2n4pBS9QvAYUpw8bOvFM66cx3O6QKKbRrnMppj/xLIJgOJe
 dDirZcAeZbF7Gs86S7NRaX9n8y7cW5WDjyOBrceRvfZn5+a2mXrId9TRQ
 pHB3GwCdKbMgSmJxGGIs6XTAMD/+9Hq+M6uYlBkSLPrG18sYlVvOLhzcE
 vFA0/gJ1Vu4ow9NTphCO0BMB4ieEbpFMjCOsLzI38zd9PYPTHfKH+2bfa
 V33E/CtJULxOl+mDeVfVWEdm9UCz84crqHwZRombo15FJw3/aPtrmUA7p A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="312302707"
X-IronPort-AV: E=Sophos;i="5.97,220,1669104000"; d="scan'208";a="312302707"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 04:18:39 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="832822627"
X-IronPort-AV: E=Sophos;i="5.97,220,1669104000"; d="scan'208";a="832822627"
Received: from amakarev-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.13.137])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 04:18:38 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915: define INTEL_VGA_DEVICE_INIT() for subplatform
 init
Date: Mon, 16 Jan 2023 14:18:21 +0200
Message-Id: <2a6123db0a58110ba3f9557361d1e4b2cc1fa5cf.1673871359.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1673871359.git.jani.nikula@intel.com>
References: <cover.1673871359.git.jani.nikula@intel.com>
MIME-Version: 1.0
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
Cc: jani.nikula@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Redefine INTEL_VGA_DEVICE_INIT() instead of INTEL_VGA_DEVICE() for
subplatform init. This is only for completeness as we don't use
subplatforms for Quanta devices.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/intel_device_info.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
index 05e90d09b208..00a2b229cd7c 100644
--- a/drivers/gpu/drm/i915/intel_device_info.c
+++ b/drivers/gpu/drm/i915/intel_device_info.c
@@ -143,8 +143,8 @@ void intel_device_info_print(const struct intel_device_info *info,
 	drm_printf(p, "rawclk rate: %u kHz\n", runtime->rawclk_freq);
 }
 
-#undef INTEL_VGA_DEVICE
-#define INTEL_VGA_DEVICE(id, info) (id)
+#undef INTEL_VGA_DEVICE_INIT
+#define INTEL_VGA_DEVICE_INIT(__id, ...) (__id)
 
 static const u16 subplatform_ult_ids[] = {
 	INTEL_HSW_ULT_GT1_IDS(0),
-- 
2.34.1

