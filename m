Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 915FA6870F7
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 23:28:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5330E10E1AE;
	Wed,  1 Feb 2023 22:28:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E3E10E1A8;
 Wed,  1 Feb 2023 22:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675290518; x=1706826518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=udZ1sC3erz45lwqGqSDbAQRZfts5k14B1/wrriD42Zw=;
 b=jpD6PANUEiq303S5qu4/VNZ3WwdKb+MfdzT1tESfwy+bwR4hfIi0IFsc
 AzYBNV5HmU2yYl06LoLmESkQnntQ7lntuIyyn438c7kJJHKdagEkcp/GY
 Amw2Q2t0yvMKh7f4olL0n9Rq/bjCxezuqbXFjTdNlWoxSHxvJE2llFz1A
 8wMoVRRpRVjSsO6Smb47CFZczCYxauyzLtg0o6Nxna8UNxBgyL7E+aY4R
 ZOfoa4OWqp0v700koZyh2C7g5bVeVCPjOtIiv8TffumDvMfWXMLPs2JBO
 oSqUEDyNBNd5reXFmxl7DcHqE4c1ohKUM2Tla1IO5gjzyhZTwDSS2ERuL Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="355626153"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; d="scan'208";a="355626153"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 14:28:37 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="807733582"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; d="scan'208";a="807733582"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 14:28:37 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/4] drm/i915/selftest: Use forcewake to sanity check engine
 wa lists
Date: Wed,  1 Feb 2023 14:28:31 -0800
Message-Id: <20230201222831.608281-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201222831.608281-1-matthew.d.roper@intel.com>
References: <20230201222831.608281-1-matthew.d.roper@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Although register information in the bspec includes a field that is
supposed to reflect a register's reset characteristics (i.e., whether a
register maintains its value through engine resets), it's been
discovered that this information is incorrect for some register ranges
(i.e., registers that are not affected by engine resets are tagged in a
way that indicates they would be).

We can sanity check workaround registers placed on the RCS/CCS engine
workaround lists (including those placed there via the
general_render_compute_wa_init() function) by comparing against the
forcewake table.  As far as we know, there's never a case where a
register that lives outside the RENDER powerwell will be reset by an
RCS/CCS engine reset.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 .../gpu/drm/i915/gt/selftest_workarounds.c    | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/selftest_workarounds.c b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
index 14a8b25b6204..1bc8febc5c1d 100644
--- a/drivers/gpu/drm/i915/gt/selftest_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
@@ -1362,12 +1362,64 @@ live_engine_reset_workarounds(void *arg)
 	return ret;
 }
 
+/*
+ * The bspec's documentation for register reset behavior can be unreliable for
+ * some MMIO ranges.  But in general we do not expect registers outside the
+ * RENDER forcewake domain to be reset by RCS/CCS engine resets.  If we find
+ * workaround registers on an RCS or CCS engine's list, it likely indicates
+ * the register is misdocumented in the bspec and the workaround implementation
+ * should be moved to the GT workaround list instead.
+ */
+static int
+live_check_engine_workarounds_fw(void *arg)
+{
+	struct intel_gt *gt = arg;
+	struct intel_engine_cs *engine;
+	struct wa_lists *lists;
+	enum intel_engine_id id;
+	int ret = 0;
+
+	lists = kzalloc(sizeof(*lists), GFP_KERNEL);
+	if (!lists)
+		return -ENOMEM;
+
+	reference_lists_init(gt, lists);
+
+	for_each_engine(engine, gt, id) {
+		struct i915_wa_list *wal = &lists->engine[id].wa_list;
+		struct i915_wa *wa;
+		int i;
+
+		if (engine->class != RENDER_CLASS &&
+		    engine->class != COMPUTE_CLASS)
+			continue;
+
+		for (i = 0, wa = wal->list; i < wal->count; i++, wa++) {
+			enum forcewake_domains fw;
+
+			fw = intel_uncore_forcewake_for_reg(gt->uncore, wa->reg,
+							    FW_REG_READ | FW_REG_WRITE);
+			if ((fw & FORCEWAKE_RENDER) == 0) {
+				pr_err("%s: Register %#x not in RENDER forcewake domain!\n",
+				       engine->name, i915_mmio_reg_offset(wa->reg));
+				ret = -EINVAL;
+			}
+		}
+	}
+
+	reference_lists_fini(gt, lists);
+	kfree(lists);
+
+	return ret;
+}
+
 int intel_workarounds_live_selftests(struct drm_i915_private *i915)
 {
 	static const struct i915_subtest tests[] = {
 		SUBTEST(live_dirty_whitelist),
 		SUBTEST(live_reset_whitelist),
 		SUBTEST(live_isolated_whitelist),
+		SUBTEST(live_check_engine_workarounds_fw),
 		SUBTEST(live_gpu_reset_workarounds),
 		SUBTEST(live_engine_reset_workarounds),
 	};
-- 
2.39.1

