Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A5C62428E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 13:46:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756E610E770;
	Thu, 10 Nov 2022 12:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8731A10E76D;
 Thu, 10 Nov 2022 12:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668084403; x=1699620403;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cTuf9cEqPtVSFDfrLSQnLSFzGsZ0AS5n2XTrLOZXBs4=;
 b=ksL1DOu2m6Yi0v16Yx4lDpeRV5DlbTPhlwhOY/kIEB6ZqEQGtJXjcVgS
 VSVz9obkONEWgBCElqBgYm5K1F05q+oeqUispcOpybDu6v4k7KcnNcZEz
 SzIOnsEELOb2AMN7LZzx7UmNzhStgLADCx+mca2ImjsubzlqFAYqd1nco
 fdIcZrUmfn8WRJBr8qh62xlC9XR3yMgP5A3nStA+uC3XAUDxXPDN115Xu
 n8/KbcNl493ykCuKvMSVyI+sO91k9AbZUQNwOeCYtXVHqkeeW3FEBumUW
 7O7nMd34yD2S3b1rZ8zzgOkT/4O4CfZCQKnAwBL3CGEx0ecaLNE+D5/dw w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="338052636"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; d="scan'208";a="338052636"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 04:46:42 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="615086887"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; d="scan'208";a="615086887"
Received: from salmasha-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.230.214])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 04:46:41 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Simplify internal helper function signature
Date: Thu, 10 Nov 2022 12:46:33 +0000
Message-Id: <20221110124633.3135026-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Since we are now storing the GT backpointer in the wa list we can drop the
explicit struct intel_gt * argument to wa_list_apply.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 07bf115029a0..4db04761d5ea 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1717,9 +1717,9 @@ wa_verify(struct intel_gt *gt, const struct i915_wa *wa, u32 cur,
 	return true;
 }
 
-static void
-wa_list_apply(struct intel_gt *gt, const struct i915_wa_list *wal)
+static void wa_list_apply(const struct i915_wa_list *wal)
 {
+	struct intel_gt *gt = wal->gt;
 	struct intel_uncore *uncore = gt->uncore;
 	enum forcewake_domains fw;
 	unsigned long flags;
@@ -1755,7 +1755,7 @@ wa_list_apply(struct intel_gt *gt, const struct i915_wa_list *wal)
 				intel_gt_mcr_read_any_fw(gt, wa->mcr_reg) :
 				intel_uncore_read_fw(uncore, wa->reg);
 
-			wa_verify(wal->gt, wa, val, wal->name, "application");
+			wa_verify(gt, wa, val, wal->name, "application");
 		}
 	}
 
@@ -1765,7 +1765,7 @@ wa_list_apply(struct intel_gt *gt, const struct i915_wa_list *wal)
 
 void intel_gt_apply_workarounds(struct intel_gt *gt)
 {
-	wa_list_apply(gt, &gt->wa_list);
+	wa_list_apply(&gt->wa_list);
 }
 
 static bool wa_list_verify(struct intel_gt *gt,
@@ -3025,7 +3025,7 @@ void intel_engine_init_workarounds(struct intel_engine_cs *engine)
 
 void intel_engine_apply_workarounds(struct intel_engine_cs *engine)
 {
-	wa_list_apply(engine->gt, &engine->wa_list);
+	wa_list_apply(&engine->wa_list);
 }
 
 static const struct i915_range mcr_ranges_gen8[] = {
-- 
2.34.1

