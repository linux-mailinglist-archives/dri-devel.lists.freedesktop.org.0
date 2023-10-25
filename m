Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C1C7D6ECC
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 16:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC4510E683;
	Wed, 25 Oct 2023 14:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C4610E680;
 Wed, 25 Oct 2023 14:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698244561; x=1729780561;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=un0eJlamzjhW1ZT7BiR2CTf2+I9t8KTIxLOO8KwzxLM=;
 b=CgnMIUOw86hcx2WMU1+Axzu33QBibJC0RaZ4pR1Uz2cc8bkuf0jzWz0q
 FH+BB/mdnhEyJGklSTZHtPfX8sds4whSKOaR/69VjF9q8nO1cLIo0vUci
 +wvuqBM5VLfE/CeJKlWqFURxde+oSCvvVx55oCziU5EY1igpvV9Z+4J5O
 TwuDP3u0ZVXi2wu2JDh/9I7ZtwiakmR6pTDlB5TH/7ffl8/5Do7QuIYIq
 K+sADGJyXggBJEUfm1uaxhEsfriERY9XFqg1jejpdszM0XKBSpc8UPdTG
 LH26S+pzFPPUPzjs4aP7ZAvwhJeyQtm6n8bIWAVdHomtE976UWm5pZiMS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="418439934"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="418439934"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 07:36:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="762471145"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="762471145"
Received: from marlonpr-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.33.160])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 07:35:59 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: John Harrison <John.C.Harrison@Intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2 5/5] drm/i915/guc: Use the ce_to_guc() wrapper whenever
 possible
Date: Wed, 25 Oct 2023 16:35:15 +0200
Message-ID: <20231025143515.254468-6-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025143515.254468-1-andi.shyti@linux.intel.com>
References: <20231025143515.254468-1-andi.shyti@linux.intel.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Get the guc reference from the ce using the ce_to_guc() helper.
Just a leftover from previous cleanups.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 023b10ef5be4..8b6396179615 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -3511,7 +3511,7 @@ static inline void sub_context_inflight_prio(struct intel_context *ce,
 
 static inline void update_context_prio(struct intel_context *ce)
 {
-	struct intel_guc *guc = &ce->engine->gt->uc.guc;
+	struct intel_guc *guc = ce_to_guc(ce);
 	int i;
 
 	BUILD_BUG_ON(GUC_CLIENT_PRIORITY_KMD_HIGH != 0);
-- 
2.42.0

