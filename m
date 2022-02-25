Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA9A4C3A16
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 01:06:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D6C810E6EE;
	Fri, 25 Feb 2022 00:06:35 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5266710E1AF;
 Fri, 25 Feb 2022 00:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645747585; x=1677283585;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E63Q8RdRrnxrqgOT05WcQkxf12bWBbN/8YdyUBhq9m4=;
 b=d65tVq9Wks6TP7TE7JAvmI4NNlcypEFAUIFTEsLUo/jK1hIiVxDh6tn3
 QMlmr7piMXNtW0wTKaTZIyJjzxH1r/HUCJxAlFrEI9/uy/b4ZoXTd6bx1
 ntHLsldP/IU6JGknA8K0mSsqRqwDC/3o5x/VsSBQIN9a1t/69WLvh4k7a
 Au1ea1dDKUSdRB/RrLVEtZiJTWIdmNPTMcCGv1/CHrc89EjDHhJh0JRKO
 tgt5bI0YH4+5EtBctOBaVmvdnTLkXukcQaOOKpworMFsXn68SkW6vOLG1
 QYllgIuNr2rkkoIzU5LizjT5tvBo9TwZKc7Iqw+vCqWfRZNmdExIsZ8Ve g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="277012941"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="277012941"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 16:06:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="592278974"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga008.fm.intel.com with ESMTP; 24 Feb 2022 16:06:24 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 5/8] drm/i915/guc: Move lrc desc setup to where it is needed
Date: Thu, 24 Feb 2022 16:06:20 -0800
Message-Id: <20220225000623.1934438-6-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225000623.1934438-1-John.C.Harrison@Intel.com>
References: <20220225000623.1934438-1-John.C.Harrison@Intel.com>
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

The LRC descriptor was being initialised early on in the context
registration sequence. It could then be determined that the actual
registration needs to be delayed and the descriptor would be wiped
out. This is inefficient, so move the setup to later in the process
after the point of no return.

v2: Move some split changes into the split patch (and do them
correctly).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index e41e309b9e7e..d9e1cd3e1db2 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2153,6 +2153,8 @@ static int __guc_action_register_context(struct intel_guc *guc,
 					     0, loop);
 }
 
+static void prepare_context_registration_info(struct intel_context *ce);
+
 static int register_context(struct intel_context *ce, bool loop)
 {
 	struct intel_guc *guc = ce_to_guc(ce);
@@ -2163,6 +2165,8 @@ static int register_context(struct intel_context *ce, bool loop)
 	GEM_BUG_ON(intel_context_is_child(ce));
 	trace_intel_context_register(ce);
 
+	prepare_context_registration_info(ce);
+
 	if (intel_context_is_parent(ce))
 		ret = __guc_action_register_multi_lrc(guc, ce, ce->guc_id.id,
 						      offset, loop);
@@ -2317,8 +2321,6 @@ static int try_context_registration(struct intel_context *ce, bool loop)
 	clr_ctx_id_mapping(guc, desc_idx);
 	set_ctx_id_mapping(guc, desc_idx, ce);
 
-	prepare_context_registration_info(ce);
-
 	/*
 	 * The context_lookup xarray is used to determine if the hardware
 	 * context is currently registered. There are two cases in which it
-- 
2.25.1

