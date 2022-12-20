Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4F66518EA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 03:42:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61C210E342;
	Tue, 20 Dec 2022 02:41:35 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7807E10E339;
 Tue, 20 Dec 2022 02:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671504070; x=1703040070;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9p/BZ4OFNWfDRrIVg8ds88kGWc2+R4SfxNSq1QafS7I=;
 b=TKpuIIORnyLUBKkjSC3GfYiQklVYPsXqBHPjKVK0+nm7yoQb+svpFxB4
 F444eZic/2NfstpI2EbTRvHbl3J1DQYPn0ce/iuRQ3qCtaki1j00EuNFy
 2yQtTGGk3C7+eC2WxwwiTZS1pLrBrMnfGbzzCxnQTETNQTZ/5l2Kvmdv9
 c79/exBaPYW8faBX0GaQ5whC6ArPrhpwAP2KZXKseubc25vfB76f+z2Zc
 nx3HNqH0VqnbgDhKfXTPw7L6Prw9Ujg4UCxFBbWhmbggaFwRpFQfoV9NI
 5eXKwghRRn9rbMy0Uh7q7PbnV0nYgAvOLumdrfqtJ+SHkqjCmrDoJcjrh A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="405761791"
X-IronPort-AV: E=Sophos;i="5.96,258,1665471600"; d="scan'208";a="405761791"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2022 18:41:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="825062147"
X-IronPort-AV: E=Sophos;i="5.96,258,1665471600"; d="scan'208";a="825062147"
Received: from relo-linux-5.jf.intel.com ([10.165.21.201])
 by orsmga005.jf.intel.com with ESMTP; 19 Dec 2022 18:41:08 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 2/3] drm/i915/guc: Fix a static analysis warning
Date: Mon, 19 Dec 2022 18:41:46 -0800
Message-Id: <20221220024147.4118685-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221220024147.4118685-1-John.C.Harrison@Intel.com>
References: <20221220024147.4118685-1-John.C.Harrison@Intel.com>
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

