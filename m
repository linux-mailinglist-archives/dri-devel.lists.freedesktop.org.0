Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1F051CB6B
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 23:38:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DFF010FA80;
	Thu,  5 May 2022 21:38:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD76110ECAD;
 Thu,  5 May 2022 21:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651786702; x=1683322702;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a36FgpOXOqLGV2mMbQyFc72ECZhOxd4OiUhcHQwurPg=;
 b=el1NF8bVLWdQTGxE2os3TXTzllzFKIj/s3Whauwfl/G6I56ltYm1K0/X
 Jo3S0bX2P1rdamo1jLdSafI+WxJCiT6cFw+a9O2aBDvtQQb1qK3CWMG4L
 8NC0L/KULXpVn3QCSji3oWkqx4o5ImcfBq4aXUmc8wVH1SmY45zx0samg
 +pLAFKH9efUjN3hdMZu/cJGDOsqp5Ulmd3Lz1l3koiyeF9MCH3Vu+7zf/
 u5X5UsdMzv2nx7LXKmDX9eWshlt5MutfJXCMcjXhxwx+fwRdygw1ZsQDU
 ZqOcAmOGhRuRkXN1uZsdcdNDJcIewOnDHLYauJCXFjunWVOopcjmA7Xg9 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="248166069"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="248166069"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 14:38:22 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="549553290"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 14:38:21 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 10/12] drm/i915/pvc: Reset support for new copy engines
Date: Thu,  5 May 2022 14:38:10 -0700
Message-Id: <20220505213812.3979301-11-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220505213812.3979301-1-matthew.d.roper@intel.com>
References: <20220505213812.3979301-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Stuart Summers <stuart.summers@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the reset support for new copy engines in PVC.

Bspec: 52549
Original-author: CQ Tang
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c |  8 +++++
 drivers/gpu/drm/i915/gt/intel_gt_regs.h   | 44 +++++++++++++----------
 2 files changed, 34 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 4532c3ea9ace..c6e93db134b1 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -390,6 +390,14 @@ static u32 get_reset_domain(u8 ver, enum intel_engine_id id)
 		static const u32 engine_reset_domains[] = {
 			[RCS0]  = GEN11_GRDOM_RENDER,
 			[BCS0]  = GEN11_GRDOM_BLT,
+			[BCS1]  = XEHPC_GRDOM_BLT1,
+			[BCS2]  = XEHPC_GRDOM_BLT2,
+			[BCS3]  = XEHPC_GRDOM_BLT3,
+			[BCS4]  = XEHPC_GRDOM_BLT4,
+			[BCS5]  = XEHPC_GRDOM_BLT5,
+			[BCS6]  = XEHPC_GRDOM_BLT6,
+			[BCS7]  = XEHPC_GRDOM_BLT7,
+			[BCS8]  = XEHPC_GRDOM_BLT8,
 			[VCS0]  = GEN11_GRDOM_MEDIA,
 			[VCS1]  = GEN11_GRDOM_MEDIA2,
 			[VCS2]  = GEN11_GRDOM_MEDIA3,
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index fe09288a3145..98ede9c93f00 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -597,24 +597,32 @@
 /* GEN11 changed all bit defs except for FULL & RENDER */
 #define   GEN11_GRDOM_FULL			GEN6_GRDOM_FULL
 #define   GEN11_GRDOM_RENDER			GEN6_GRDOM_RENDER
-#define   GEN11_GRDOM_BLT			(1 << 2)
-#define   GEN11_GRDOM_GUC			(1 << 3)
-#define   GEN11_GRDOM_MEDIA			(1 << 5)
-#define   GEN11_GRDOM_MEDIA2			(1 << 6)
-#define   GEN11_GRDOM_MEDIA3			(1 << 7)
-#define   GEN11_GRDOM_MEDIA4			(1 << 8)
-#define   GEN11_GRDOM_MEDIA5			(1 << 9)
-#define   GEN11_GRDOM_MEDIA6			(1 << 10)
-#define   GEN11_GRDOM_MEDIA7			(1 << 11)
-#define   GEN11_GRDOM_MEDIA8			(1 << 12)
-#define   GEN11_GRDOM_VECS			(1 << 13)
-#define   GEN11_GRDOM_VECS2			(1 << 14)
-#define   GEN11_GRDOM_VECS3			(1 << 15)
-#define   GEN11_GRDOM_VECS4			(1 << 16)
-#define   GEN11_GRDOM_SFC0			(1 << 17)
-#define   GEN11_GRDOM_SFC1			(1 << 18)
-#define   GEN11_GRDOM_SFC2			(1 << 19)
-#define   GEN11_GRDOM_SFC3			(1 << 20)
+#define   XEHPC_GRDOM_BLT8			REG_BIT(31)
+#define   XEHPC_GRDOM_BLT7			REG_BIT(30)
+#define   XEHPC_GRDOM_BLT6			REG_BIT(29)
+#define   XEHPC_GRDOM_BLT5			REG_BIT(28)
+#define   XEHPC_GRDOM_BLT4			REG_BIT(27)
+#define   XEHPC_GRDOM_BLT3			REG_BIT(26)
+#define   XEHPC_GRDOM_BLT2			REG_BIT(25)
+#define   XEHPC_GRDOM_BLT1			REG_BIT(24)
+#define   GEN11_GRDOM_SFC3			REG_BIT(20)
+#define   GEN11_GRDOM_SFC2			REG_BIT(19)
+#define   GEN11_GRDOM_SFC1			REG_BIT(18)
+#define   GEN11_GRDOM_SFC0			REG_BIT(17)
+#define   GEN11_GRDOM_VECS4			REG_BIT(16)
+#define   GEN11_GRDOM_VECS3			REG_BIT(15)
+#define   GEN11_GRDOM_VECS2			REG_BIT(14)
+#define   GEN11_GRDOM_VECS			REG_BIT(13)
+#define   GEN11_GRDOM_MEDIA8			REG_BIT(12)
+#define   GEN11_GRDOM_MEDIA7			REG_BIT(11)
+#define   GEN11_GRDOM_MEDIA6			REG_BIT(10)
+#define   GEN11_GRDOM_MEDIA5			REG_BIT(9)
+#define   GEN11_GRDOM_MEDIA4			REG_BIT(8)
+#define   GEN11_GRDOM_MEDIA3			REG_BIT(7)
+#define   GEN11_GRDOM_MEDIA2			REG_BIT(6)
+#define   GEN11_GRDOM_MEDIA			REG_BIT(5)
+#define   GEN11_GRDOM_GUC			REG_BIT(3)
+#define   GEN11_GRDOM_BLT			REG_BIT(2)
 #define   GEN11_VCS_SFC_RESET_BIT(instance)	(GEN11_GRDOM_SFC0 << ((instance) >> 1))
 #define   GEN11_VECS_SFC_RESET_BIT(instance)	(GEN11_GRDOM_SFC0 << (instance))
 
-- 
2.35.1

