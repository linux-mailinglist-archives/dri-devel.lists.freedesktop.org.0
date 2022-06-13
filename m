Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AA6549950
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 18:53:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3EB10F39B;
	Mon, 13 Jun 2022 16:53:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF48D10F397;
 Mon, 13 Jun 2022 16:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655139215; x=1686675215;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/gDpzTXmB4DMe7dnviHQPNH9qRuwQcnNm0NLopVI2Nw=;
 b=X5Pwut6d9igb+hqZgz09MuepQWcl7Z/h9n9ffZuXoQArH1WsTfosdtIt
 BX1FSob8L3cH8VojenejkZcjAxlaBB7wObN3X5/bmkatH/LOiTbsD0Df/
 8OmXwIahR6422wW4BXnUN4sizd3ojh0GCag7qz5ryEvyog/9UcXVE0ck7
 Hw2Ca5Tl0jdYdijZYMb4snwAJ7rpI1j9TNpmpTIc9e9XGelUFCZu+ZMtw
 k1JCYNsCZTw/t+gdj9VmfixrUjQ+6bYmtDhwifovpIDt/P360b1vyQ542
 oERweh+QrE1N6aWUcgDysMtg4g8VaWB4k7iGs/P04WdGzqh/fadaO7KDe g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="261383390"
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="261383390"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 09:53:35 -0700
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="829891206"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 09:53:35 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/pvc: Add recommended MMIO setting
Date: Mon, 13 Jun 2022 09:53:14 -0700
Message-Id: <20220613165314.862029-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.3
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

As with past platforms, the bspec's performance tuning guide provides
recommended MMIO settings.  Although not technically "workarounds" we
apply these through the workaround framework to ensure that they're
re-applied at the proper times (e.g., on engine resets) and that any
conflicts with real workarounds are flagged.

Bspec: 72161
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     | 5 +++++
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 9 +++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 226557018037..07ef111947b8 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -981,6 +981,11 @@
 #define XEHP_L3SCQREG7				_MMIO(0xb188)
 #define   BLEND_FILL_CACHING_OPT_DIS		REG_BIT(3)
 
+#define XEHPC_L3SCRUB				_MMIO(0xb18c)
+#define   SCRUB_CL_DWNGRADE_SHARED		REG_BIT(12)
+#define   SCRUB_RATE_PER_BANK_MASK		REG_GENMASK(2, 0)
+#define   SCRUB_RATE_4B_PER_CLK			REG_FIELD_PREP(SCRUB_RATE_PER_BANK_MASK, 0x6)
+
 #define L3SQCREG1_CCS0				_MMIO(0xb200)
 #define   FLUSHALLNONCOH			REG_BIT(5)
 
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 1e982ac931dc..c4af51144216 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -2679,6 +2679,15 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
 {
 	struct drm_i915_private *i915 = engine->i915;
 
+	if (IS_PONTEVECCHIO(i915)) {
+		/*
+		 * The following is not actually a "workaround" but rather
+		 * a recommended tuning setting documented in the bspec's
+		 * performance guide section.
+		 */
+		wa_write(wal, XEHPC_L3SCRUB, SCRUB_CL_DWNGRADE_SHARED | SCRUB_RATE_4B_PER_CLK);
+	}
+
 	if (IS_XEHPSDV(i915)) {
 		/* Wa_1409954639 */
 		wa_masked_en(wal,
-- 
2.35.3

