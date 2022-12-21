Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F84C653709
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 20:30:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B95610E490;
	Wed, 21 Dec 2022 19:29:55 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12D910E14A;
 Wed, 21 Dec 2022 19:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671650991; x=1703186991;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9p/BZ4OFNWfDRrIVg8ds88kGWc2+R4SfxNSq1QafS7I=;
 b=kcPvVlwHnkEiBUhrU3GG3RHWnISsqsBOMAF+1/wMeqP6wCfTQ6PjVqOM
 BPUOqWU+3LQxMSyj6wN8SSMTEH371LyRlpcY0hK6YGWsUIL+mKLK6Cojp
 o5vgSBWqvZpdqVVlryfHuoja8oXk8VM/roAzRRcMiPNF+juMjozODSSkX
 QzY4n6qinagcKd2ZaaHy/4mVsqk2KiXiNesBzqNE1JgtBKukZVAb6pTWr
 z+k5+cIvFWqCPj7Mt7OOCNNf0SGH/Y8o+fQIRK0h0s1ShlxbpqpVtuahM
 JQWL54QgqXtI8pdVRKOQ4huUSPcLuT6r721wXzHGZRNVwxBC3GTsoDr8c Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="321871017"
X-IronPort-AV: E=Sophos;i="5.96,263,1665471600"; d="scan'208";a="321871017"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 11:29:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="644948810"
X-IronPort-AV: E=Sophos;i="5.96,263,1665471600"; d="scan'208";a="644948810"
Received: from relo-linux-5.jf.intel.com ([10.165.21.200])
 by orsmga007.jf.intel.com with ESMTP; 21 Dec 2022 11:29:50 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 2/3] drm/i915/guc: Fix a static analysis warning
Date: Wed, 21 Dec 2022 11:30:30 -0800
Message-Id: <20221221193031.687266-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221193031.687266-1-John.C.Harrison@Intel.com>
References: <20221221193031.687266-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

A static analyser was complaining about not checking for null
pointers. However, the location of the complaint can only be reached
in the first place if said pointer is non-null. Basically, if we are
using a v69 GuC then the descriptor pool is guaranteed to be alocated
at start of day or submission will be disabled with an ENOMEM error.
And if we are using a later GuC that does not use a descriptor pool
then the v69 submission function would not be called. So, not a
possible null at that point in the code.

Hence adding a GEM_BUG_ON(!ptr) to keep the tool happy.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 4682ec1dbd9c0..c93d0594bfd5e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2538,6 +2538,7 @@ static void prepare_context_registration_info_v69(struct intel_context *ce)
 		   i915_gem_object_is_lmem(ce->ring->vma->obj));
 
 	desc = __get_lrc_desc_v69(guc, ctx_id);
+	GEM_BUG_ON(!desc);
 	desc->engine_class = engine_class_to_guc_class(engine->class);
 	desc->engine_submit_mask = engine->logical_mask;
 	desc->hw_context_desc = ce->lrc.lrca;
-- 
2.39.0

