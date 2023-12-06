Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AB58079CA
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 21:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C50010E6A9;
	Wed,  6 Dec 2023 20:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F4C10E637;
 Wed,  6 Dec 2023 20:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701895721; x=1733431721;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HMQeV6dFPO9qR7j2PxhI3w+qoGnv4lVwUeK7u5DHb+I=;
 b=CiD2j/zktjdmOAIgDPZsMhZ1CpyM0Ts1hM8bHzhCIWQGFDpKugnMNdD8
 Czg/Qco1MejowwHOG8Xm4rGYBsc+0I2XpiR8SzY7a+SDyve9TssJj1lLM
 DEup6+GTYKNxlnK0vI/hi/HgM5e0R8H9qcIrWrJB6sTT1TcOXa96vWgwb
 WHMY+gLHgR1pWFhoiz9Snb98TmIRG0EtWWaIjLseF6oGHUhEqD0Am3Fhg
 42n113IL9fQlGAMzU+OHaUPmCryaZTeLEqfefuIyZeepbks9cWiO1ibZF
 SNPEFE68jY4A5ENU84TQvAHdNRStyrDuwKLlxi0fDP70mI7Uwj0T8WXTk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="396914581"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="396914581"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 12:47:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="775139876"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="775139876"
Received: from karthik-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.46.178])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 12:47:22 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v3 4/4] drm/i915/guc: Use the ce_to_guc() wrapper whenever
 possible
Date: Wed,  6 Dec 2023 21:46:44 +0100
Message-ID: <20231206204644.105064-5-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231206204644.105064-1-andi.shyti@linux.intel.com>
References: <20231206204644.105064-1-andi.shyti@linux.intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Get the guc reference from the ce using the ce_to_guc() helper.
Just a leftover from previous cleanups.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 4f51cc5f1604..3c7821ae9f0d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -3513,7 +3513,7 @@ static inline void sub_context_inflight_prio(struct intel_context *ce,
 
 static inline void update_context_prio(struct intel_context *ce)
 {
-	struct intel_guc *guc = &ce->engine->gt->uc.guc;
+	struct intel_guc *guc = ce_to_guc(ce);
 	int i;
 
 	BUILD_BUG_ON(GUC_CLIENT_PRIORITY_KMD_HIGH != 0);
-- 
2.43.0

