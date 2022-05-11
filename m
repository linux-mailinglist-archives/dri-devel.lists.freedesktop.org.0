Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FDD522C08
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 08:03:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724E910EB9A;
	Wed, 11 May 2022 06:02:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC83310E32F;
 Wed, 11 May 2022 06:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652248958; x=1683784958;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lH9tScupwbdXVPxeAUvpvoMm3GQoEKsQlGRiyALq7fw=;
 b=DXg9rxPO94r4vKC7HOI7I2gOx3i2b3E7+iuUDEzxC4HBCpj3sEsEkPVK
 dpL9Mtafpjtv5n643yU4rurtWDi1tACByj9B7UGk6EveYiKGEHmxUQGUA
 yrjKz17LF/US7OfEQVnSxElQFs6BGdVRxTby7PJC3KSTt9GKftrWpmE5w
 iUi1nTg9nPwckrm+M9Ix9wZ1D2HCZiz8ow4HIkn+IddlI+/jmz1LVncci
 uWwDWDm6McbtBcqrfe5gjBq6ggLByuadSFzfJk5a9gR0A2RM9wLJJ0f0m
 OjVp4Sks9MQuymGEwyfjOXDnC9cxb6M3PzMOEvewrlrxdSEpl02zyGiSV w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="332633560"
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; d="scan'208";a="332633560"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 23:02:38 -0700
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; d="scan'208";a="520375218"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 23:02:38 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 4/5] drm/i915/pvc: Add new BCS engines to GuC engine list
Date: Tue, 10 May 2022 23:02:27 -0700
Message-Id: <20220511060228.1179450-5-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220511060228.1179450-1-matthew.d.roper@intel.com>
References: <20220511060228.1179450-1-matthew.d.roper@intel.com>
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
Cc: Stuart Summers <stuart.summers@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Intialize ADS system info to reflect the availablity of new BCS engines

Original-author: CQ Tang
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 2 +-
 drivers/gpu/drm/i915/i915_drv.h            | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 3eabf4cf8eec..bb197610fd5b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -457,7 +457,7 @@ static void fill_engine_enable_masks(struct intel_gt *gt,
 {
 	info_map_write(info_map, engine_enabled_masks[GUC_RENDER_CLASS], RCS_MASK(gt));
 	info_map_write(info_map, engine_enabled_masks[GUC_COMPUTE_CLASS], CCS_MASK(gt));
-	info_map_write(info_map, engine_enabled_masks[GUC_BLITTER_CLASS], 1);
+	info_map_write(info_map, engine_enabled_masks[GUC_BLITTER_CLASS], BCS_MASK(gt));
 	info_map_write(info_map, engine_enabled_masks[GUC_VIDEO_CLASS], VDBOX_MASK(gt));
 	info_map_write(info_map, engine_enabled_masks[GUC_VIDEOENHANCE_CLASS], VEBOX_MASK(gt));
 }
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 54e9c2a5493d..4b147fd90ec4 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1223,6 +1223,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 })
 #define RCS_MASK(gt) \
 	ENGINE_INSTANCES_MASK(gt, RCS0, I915_MAX_RCS)
+#define BCS_MASK(gt) \
+	ENGINE_INSTANCES_MASK(gt, BCS0, I915_MAX_BCS)
 #define VDBOX_MASK(gt) \
 	ENGINE_INSTANCES_MASK(gt, VCS0, I915_MAX_VCS)
 #define VEBOX_MASK(gt) \
-- 
2.35.1

