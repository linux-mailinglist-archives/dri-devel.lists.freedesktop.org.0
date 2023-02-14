Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D59369554B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 01:19:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6ACF10E7B3;
	Tue, 14 Feb 2023 00:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F85E10E7B3;
 Tue, 14 Feb 2023 00:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676333969; x=1707869969;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vAvLL9pAHpGLGY+SxpVEV6Dz0JOTkIEd9Qz5SNE3IYs=;
 b=lENfFhOelrIhBNk0mHlZsp9WXXKbSkUWWpCpz1jD/9gti9/UTj/dJZTv
 oSU10SVttkAD+FCrqjUNMcaNZR7xS9kh8iPKGTAQzCafE4g6jJBF29a/Q
 j+rqrDvUkk5vHvNMOpxZ2rjAQ0BjrKplcJcKYkB+Gux5elGAJ8Hh0YtxG
 5igB4WBG38L403eIl5ZG5blmu3G996HzPSfcdphQZJSMzX+jA3GFYt5fF
 YQS7pGrabLw6xLmSz0v6T22C551297eFc+qHaFy43T4jR7fJTn4E/woSe
 q5cX9RgKgiVl0/fNSDsbdmpSgwhfqhs+ar6f+t8sjoVGCTNMDiAhAA3iF w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="310669889"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="310669889"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 16:19:20 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="792918654"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="792918654"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 16:19:12 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/xelpmp: Consider GSI offset when doing MCR lookups
Date: Mon, 13 Feb 2023 16:19:06 -0800
Message-Id: <20230214001906.1477370-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.1
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MCR range tables use the final MMIO offset of a register (including the
0x380000 GSI offset when applicable).  Since the i915_mcr_reg_t passed
as a parameter during steering lookup does not include the GSI offset,
we need to add it back in for GSI registers before searching the tables.

Fixes: a7ec65fc7e83 ("drm/i915/xelpmp: Add multicast steering for media GT")
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
index a4a8b8bc5737..03632df27de3 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
@@ -561,12 +561,15 @@ static bool reg_needs_read_steering(struct intel_gt *gt,
 				    i915_mcr_reg_t reg,
 				    enum intel_steering_type type)
 {
-	const u32 offset = i915_mmio_reg_offset(reg);
+	u32 offset = i915_mmio_reg_offset(reg);
 	const struct intel_mmio_range *entry;
 
 	if (likely(!gt->steering_table[type]))
 		return false;
 
+	if (IS_GSI_REG(offset))
+		offset += gt->uncore->gsi_offset;
+
 	for (entry = gt->steering_table[type]; entry->end; entry++) {
 		if (offset >= entry->start && offset <= entry->end)
 			return true;
-- 
2.39.1

