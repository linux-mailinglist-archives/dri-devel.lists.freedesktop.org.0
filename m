Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C08154C99F3
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 01:34:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E6910E934;
	Wed,  2 Mar 2022 00:34:05 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 118AE10E549;
 Wed,  2 Mar 2022 00:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646181239; x=1677717239;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=potoo9Phd/a+iPMdyl9Egvty7nVXUYthdVSQzuOo1B4=;
 b=b3pSL6MG6Ro8b/w/0n82L7OWA5wuaAI7VOUgDTdgyEetLL8N55kb8zcs
 s2R3velLi9FOy3Q1zpcGd5LvStXfrBOpSEjVpDN6y0DfJCWJ5YLT3Ze8g
 2DYFpUEhN3nhtgHkw/aN0gfQYCw7Xm3ymJoH9dDOfbuExZ2EvzJy9Y27w
 jKLFtG66ZJ11wSbn6gewPYAv1crzOsbPnvykedZEHPPesyZWlUAL4KoEX
 1qgEvVxurDviEQUXqVuB5MwDdLAGhrYBgLbW0XgWNeWjybYQIl7fNFs5W
 CMPnOo2m1Qm/Qi5MOeR+B+Lio1NLNE9SQovq4EMNgMfEyXSrOMUgVE9bw A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="233243141"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="233243141"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 16:33:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="639577381"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga002.fm.intel.com with ESMTP; 01 Mar 2022 16:33:58 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 5/8] drm/i915/guc: Move lrc desc setup to where it is needed
Date: Tue,  1 Mar 2022 16:33:54 -0800
Message-Id: <20220302003357.4188363-6-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220302003357.4188363-1-John.C.Harrison@Intel.com>
References: <20220302003357.4188363-1-John.C.Harrison@Intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
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
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 04b6af6fc416..f493bb57f64e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2140,6 +2140,8 @@ static int __guc_action_register_context(struct intel_guc *guc,
 					     0, loop);
 }
 
+static void prepare_context_registration_info(struct intel_context *ce);
+
 static int register_context(struct intel_context *ce, bool loop)
 {
 	struct intel_guc *guc = ce_to_guc(ce);
@@ -2150,6 +2152,8 @@ static int register_context(struct intel_context *ce, bool loop)
 	GEM_BUG_ON(intel_context_is_child(ce));
 	trace_intel_context_register(ce);
 
+	prepare_context_registration_info(ce);
+
 	if (intel_context_is_parent(ce))
 		ret = __guc_action_register_multi_lrc(guc, ce, ce->guc_id.id,
 						      offset, loop);
@@ -2304,8 +2308,6 @@ static int try_context_registration(struct intel_context *ce, bool loop)
 	clr_ctx_id_mapping(guc, desc_idx);
 	set_ctx_id_mapping(guc, desc_idx, ce);
 
-	prepare_context_registration_info(ce);
-
 	/*
 	 * The context_lookup xarray is used to determine if the hardware
 	 * context is currently registered. There are two cases in which it
-- 
2.25.1

