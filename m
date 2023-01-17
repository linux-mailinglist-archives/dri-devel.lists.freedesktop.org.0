Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A6866E88A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 22:37:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129B710E5E4;
	Tue, 17 Jan 2023 21:37:01 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A775710E5E3;
 Tue, 17 Jan 2023 21:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673991414; x=1705527414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wdasfmllz40XLlt0SGJMvTNdsjx3B7M8nIQJ/f5T2pw=;
 b=e+4kdotkngUWq21GGbXklcCIA7ZgfMYghRl/vZyJp9EVaklGZteDlc4O
 vLrSywsMQiFuhRl2fIZIhTJTTjNVixioAQKrcGPMJIgzPr/WDnkNf4rxn
 2QrWlu6tMsZypCso/CW0mT8+b7OTI9GSK2nY8/gLh6EZXerxNYD14UFu2
 HkQRH56EiMXel+A5OvKqjXHIS3m13bTzJL5uFWnmIBEKfjSJ0nwZMqkPn
 P0NOiVbaLQpL6/6cJNF7SmjWqSobkwwEczu8s3epn0Iuin3dxD2QvxmMC
 BKdnkIHd5p3WEBGvYPAvyGcQeUm/38n6X+SGqlHCBl9T/Kqvp9hx+mw10 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="312696230"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="312696230"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 13:36:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="988285035"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="988285035"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga005.fm.intel.com with ESMTP; 17 Jan 2023 13:36:53 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 5/5] drm/i915/guc: Add a debug print on GuC triggered reset
Date: Tue, 17 Jan 2023 13:36:30 -0800
Message-Id: <20230117213630.2897570-6-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117213630.2897570-1-John.C.Harrison@Intel.com>
References: <20230117213630.2897570-1-John.C.Harrison@Intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

For understanding bug reports, it can be useful to have an explicit
dmesg print when a reset notification is received from GuC. As opposed
to simply inferring that this happened from other messages.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 9bc80b807dbcc..6029dbab5feeb 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4665,6 +4665,10 @@ static void guc_handle_context_reset(struct intel_guc *guc,
 {
 	trace_intel_context_reset(ce);
 
+	drm_dbg(&guc_to_gt(guc)->i915->drm, "Got GuC reset of 0x%04X, exiting = %d, banned = %d\n",
+		ce->guc_id.id, test_bit(CONTEXT_EXITING, &ce->flags),
+		test_bit(CONTEXT_BANNED, &ce->flags));
+
 	if (likely(intel_context_is_schedulable(ce))) {
 		capture_error_state(guc, ce);
 		guc_context_replay(ce);
-- 
2.39.0

