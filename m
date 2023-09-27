Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E76C17B051B
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 15:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A479210E513;
	Wed, 27 Sep 2023 13:18:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4E610E50E;
 Wed, 27 Sep 2023 13:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695820679; x=1727356679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8ra80P7oWmTUPjqC/3mLGmMZU/e79GfDVl9TiAnXX0I=;
 b=B6EDjWRv//4Mx/Xzq9AN+zxamy4VrfAa3Yn9KyKLTtIszkXs99yi7WUb
 BbyRPFSuP9qSfP5AiGGn00wsKRpCAUJtl4PnzkpD1pvIZosneM+0LMt1p
 TTp4uZMU59HW9hzKLWBdC4DwfUZB+N3QHaQ3YRmbBNRryi215uUwVJcJr
 JwzPGY9T6SQPuZ26xCySnDUI9eIbHHxMXIjGooVnxC3g6lHXATjlsUkpS
 d3KLpNGbcPb0MMDmiGwJx0g4XoJr4ILmca2BOO8wiXSUr2UCY5drlhOmP
 auXPbJCv0wcQCpzCHpNFXyTcUCdpJZ1mBfou8UktBWuFGFsb0z/XA5cce g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="381724032"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="381724032"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 06:17:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="1080158429"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="1080158429"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 06:17:57 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 2/3] drm/i915: Reset steer semaphore for media GT on resume
Date: Wed, 27 Sep 2023 15:17:47 +0200
Message-ID: <20230927131748.3895-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230927131748.3895-1-nirmoy.das@intel.com>
References: <20230927131748.3895-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: matthew.d.roper@intel.com, andi.shyti@linux.intel.com,
 dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During resume, the steer semaphore on GT1 was observed to be held. The
hardware team has confirmed the safety of clearing the steer semaphore
during driver load/resume, as no lock acquisitions can occur in this
process by other agents.

v2: reset on resume not in intel_gt_init().

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_pm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
index 5a942af0a14e..b19062e30b9b 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
@@ -13,6 +13,7 @@
 #include "intel_engine_pm.h"
 #include "intel_gt.h"
 #include "intel_gt_clock_utils.h"
+#include "intel_gt_mcr.h"
 #include "intel_gt_pm.h"
 #include "intel_gt_print.h"
 #include "intel_gt_requests.h"
@@ -228,6 +229,17 @@ int intel_gt_resume(struct intel_gt *gt)
 
 	GT_TRACE(gt, "\n");
 
+	/*
+	 * Reset the steer semaphore on GT1, as we have observed it
+	 * remaining held after a suspend operation. Confirmation
+	 * from the hardware team ensures the safety of resetting
+	 * the steer semaphore during driver load/resume, as there
+	 * are no lock acquisitions during this process by other
+	 * agents.
+	 */
+	if (MEDIA_VER(gt->i915) >= 13 && gt->type == GT_MEDIA)
+		intel_gt_mcr_lock_reset(gt);
+
 	/*
 	 * After resume, we may need to poke into the pinned kernel
 	 * contexts to paper over any damage caused by the sudden suspend.
-- 
2.41.0

