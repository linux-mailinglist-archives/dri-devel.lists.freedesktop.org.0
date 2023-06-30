Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F85744336
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 22:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9883210E193;
	Fri, 30 Jun 2023 20:35:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E615610E4D8;
 Fri, 30 Jun 2023 20:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688157331; x=1719693331;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TK8Gb7f2BDs9GOuCBaWtGKVA75KBpqbPu5MicNEzqLA=;
 b=CbPLUZ7Jb9BqQ9GQ0D1+s9Usgi2UpuVVncTAXdG3tlf/HdX2ySx3rfkj
 S1seskoqNTta95UcuwsKR9OySxx4lfHlXYgIrNHVh0WSEK/rSPf7VOjyU
 CMfmqsEW3amPgqpxpmUDdfZ284nuXt05KuM5gq0by9tBT/5ALs/hn9rSR
 I0dYUXVhgXbUJBhDVmxzOrD/RV1Glec6FdddnA6RCo69dHvfY1A4t3vsI
 kTDdEPEXRKqHbG39ON5iJprQzuyX4YLSCE1pjV/PBPFK0jZla9zZmbu3j
 VmcXvcfyr1IrOB9V08Ppy0TyZGmBqX0GuyVUdtygsYRtdv3/ZULnp2ocL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="393213907"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="393213907"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 13:35:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="807904244"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="807904244"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 13:35:30 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 1/7] drm/i915/gt: Move wal_get_fw_for_rmw()
Date: Fri, 30 Jun 2023 13:35:03 -0700
Message-Id: <20230630203509.1635216-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230630203509.1635216-1-lucas.demarchi@intel.com>
References: <20230630203509.1635216-1-lucas.demarchi@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Matt Roper <matthew.d.roper@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move helper function to get all the forcewakes required by the wa list
to the top, so it can be re-used by other functions.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Kenneth Graunke <kenneth@whitecape.org>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 32 ++++++++++-----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 01807a7dd2c1..8f8346df3c18 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -123,6 +123,22 @@ static void wa_init_finish(struct i915_wa_list *wal)
 		wal->wa_count, wal->name, wal->engine_name);
 }
 
+static enum forcewake_domains
+wal_get_fw_for_rmw(struct intel_uncore *uncore, const struct i915_wa_list *wal)
+{
+	enum forcewake_domains fw = 0;
+	struct i915_wa *wa;
+	unsigned int i;
+
+	for (i = 0, wa = wal->list; i < wal->count; i++, wa++)
+		fw |= intel_uncore_forcewake_for_reg(uncore,
+						     wa->reg,
+						     FW_REG_READ |
+						     FW_REG_WRITE);
+
+	return fw;
+}
+
 static void _wa_add(struct i915_wa_list *wal, const struct i915_wa *wa)
 {
 	unsigned int addr = i915_mmio_reg_offset(wa->reg);
@@ -1859,22 +1875,6 @@ void intel_gt_init_workarounds(struct intel_gt *gt)
 	wa_init_finish(wal);
 }
 
-static enum forcewake_domains
-wal_get_fw_for_rmw(struct intel_uncore *uncore, const struct i915_wa_list *wal)
-{
-	enum forcewake_domains fw = 0;
-	struct i915_wa *wa;
-	unsigned int i;
-
-	for (i = 0, wa = wal->list; i < wal->count; i++, wa++)
-		fw |= intel_uncore_forcewake_for_reg(uncore,
-						     wa->reg,
-						     FW_REG_READ |
-						     FW_REG_WRITE);
-
-	return fw;
-}
-
 static bool
 wa_verify(struct intel_gt *gt, const struct i915_wa *wa, u32 cur,
 	  const char *name, const char *from)
-- 
2.40.1

