Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AF572A617
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jun 2023 00:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA21B10E041;
	Fri,  9 Jun 2023 22:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8CEE10E0CD;
 Fri,  9 Jun 2023 22:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686348213; x=1717884213;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DteTQN7jX6+NOc8jQgbzdqwy5ErF2yn4jxbWfYG4N+s=;
 b=JfwXllBY/UHaS2FWBBaL1/O9Ev1ltjBUvhlSRwVjORjASqitBIuGnZMo
 r6Ck7/2mamCFew+DbkopxDhYzNRseCmnQosi8ydEYYCssMFKi49iUkBrq
 sYual258cUm9LAHpr5pVNEvUUrBz5OdTdnpKCvrqCskvQ8P5LQH13fKSj
 ltuxxWeXlHY9d9GqQ4iaOcvzA0xpHLxjdljgQfWRFZGiBc1UN/dGD55rI
 tJqkTbwqlVHGuEGd45z8jfSVx1eOqCgyoiMHOrOEMqD4J4T17tpnqM6rE
 rRVoQC3o++wi819kymrLvovP0EYnwKcM/53gs81W/Zo1qx+xqdwceMlKy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="361057522"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; d="scan'208";a="361057522"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 15:03:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="854876107"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; d="scan'208";a="854876107"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2023 15:03:32 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/guc/slpc: Apply min softlimit correctly
Date: Fri,  9 Jun 2023 15:02:52 -0700
Message-Id: <20230609220252.410740-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

We were skipping when min_softlimit was equal to RPn. We need to apply
it rergardless as efficient frequency will push the SLPC min to RPe.
This will break scenarios where user sets a min softlimit < RPe before
reset and then performs a GT reset.

Fixes: 95ccf312a1e4 ("drm/i915/guc/slpc: Allow SLPC to use efficient frequency")

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index 01b75529311c..ee9f83af7cf6 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -606,7 +606,7 @@ static int slpc_set_softlimits(struct intel_guc_slpc *slpc)
 		if (unlikely(ret))
 			return ret;
 		slpc_to_gt(slpc)->defaults.min_freq = slpc->min_freq_softlimit;
-	} else if (slpc->min_freq_softlimit != slpc->min_freq) {
+	} else {
 		return intel_guc_slpc_set_min_freq(slpc,
 						   slpc->min_freq_softlimit);
 	}
-- 
2.38.1

