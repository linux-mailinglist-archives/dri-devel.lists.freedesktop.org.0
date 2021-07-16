Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2193CBD4E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 22:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E2B36E9FE;
	Fri, 16 Jul 2021 19:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F896E9FE;
 Fri, 16 Jul 2021 19:59:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10047"; a="210596746"
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="210596746"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 12:59:42 -0700
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="507239009"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 12:59:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 35/51] drm/i915/guc: Enable GuC engine reset
Date: Fri, 16 Jul 2021 13:17:08 -0700
Message-Id: <20210716201724.54804-36-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210716201724.54804-1-matthew.brost@intel.com>
References: <20210716201724.54804-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Clear the 'disable resets' flag to allow GuC to reset hung contexts
(detected via pre-emption timeout).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 9fd3c911f5fb..d3e86ab7508f 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -81,8 +81,7 @@ static void guc_policies_init(struct guc_policies *policies)
 {
 	policies->dpc_promote_time = GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US;
 	policies->max_num_work_items = GLOBAL_POLICY_MAX_NUM_WI;
-	/* Disable automatic resets as not yet supported. */
-	policies->global_flags = GLOBAL_POLICY_DISABLE_ENGINE_RESET;
+	policies->global_flags = 0;
 	policies->is_valid = 1;
 }
 
-- 
2.28.0

