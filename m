Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 403994C3A15
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 01:06:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53ED110E666;
	Fri, 25 Feb 2022 00:06:33 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91F810E13C;
 Fri, 25 Feb 2022 00:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645747586; x=1677283586;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NDbIX18nuhyKwC1b7QExLYf3J0gSwzDVsL3OSkqULOY=;
 b=dcm/4ZZ3WVlLQtDivoNF09H8AGys1EAVWhMvGXfoEvGm/Y9sCRbOdqt5
 +JLzYE5h7TXe0N1nAPx3q4UfWFXAreglk1jK3a28kn0Hc8HByicFhtPHI
 KeSB97PeCbO42NC/E4nE3x9yLMcD2o25k+5Ohm5t3VQjxurYuK+tJNa/4
 NIRa1EZicqc+mR0gG5BZwGPliTU7CCs0oGBMmviZWw//d8EUeU0VYLsIr
 ieYukGXfqZ27nDwFUQ9NR8iidPeCqP2+TecmifNEq9cKtNmrt6iZHp2wG
 52h+ifXZGdZoGWSk4HpfsLyB5xX5ZiUcBpol+VPq3iiV5zUaALTiZxqEr g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="277012944"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="277012944"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 16:06:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="592278984"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga008.fm.intel.com with ESMTP; 24 Feb 2022 16:06:25 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 8/8] drm/i915/guc: Fix potential invalid pointer
 dereferences when decoding G2Hs
Date: Thu, 24 Feb 2022 16:06:23 -0800
Message-Id: <20220225000623.1934438-9-John.C.Harrison@Intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Some G2H handlers were reading the context id field from the payload
before checking the payload met the minimum length required.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 53114097a5b9..820f6e870505 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -3891,12 +3891,13 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
 					  u32 len)
 {
 	struct intel_context *ce;
-	u32 ctx_id = msg[0];
+	u32 ctx_id;
 
 	if (unlikely(len < 1)) {
 		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u\n", len);
 		return -EPROTO;
 	}
+	ctx_id = msg[0];
 
 	ce = g2h_context_lookup(guc, ctx_id);
 	if (unlikely(!ce))
@@ -3942,12 +3943,13 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 {
 	struct intel_context *ce;
 	unsigned long flags;
-	u32 ctx_id = msg[0];
+	u32 ctx_id;
 
 	if (unlikely(len < 2)) {
 		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u\n", len);
 		return -EPROTO;
 	}
+	ctx_id = msg[0];
 
 	ce = g2h_context_lookup(guc, ctx_id);
 	if (unlikely(!ce))
-- 
2.25.1

