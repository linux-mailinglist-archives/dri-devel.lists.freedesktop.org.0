Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BBF616A0A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 18:08:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC8C10E522;
	Wed,  2 Nov 2022 17:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBCA10E515;
 Wed,  2 Nov 2022 17:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667408907; x=1698944907;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G0uhEHjZc+6iMv5XWWqGQk4PWycnMIfXs5YPY3kgb0g=;
 b=WkMvdbYRethLv7Q1u3FjiO3kDTJZxsaLXTQeiSVsdooZ5xJZUwndR8+F
 CJr8k0Bm8C2SHrm2ihNqDW4QnNQ0+r3PsKDM2+6rK7REqox3a0tTwodzU
 8345M6c3cgIVWwTnCtEucfMNxRCs6JgK/hDfaSzw+rOUO0RvfrQwLhT/s
 3rHRi1BAI2TZqz62FbGxgQsgIKN5Lc3z0FwYs5Yabc7NqrMCg9RyyHbp8
 5sVYeBQiRKRhbJZS9WoWOaZb3Tq9KuBqourIHbm+VhAd0aN2IaL7YeI1c
 VPRhJUGUftjqqx0+HSJCZzfuyP1AICX8zfJfBiK+txjtaYwDtI+n1jRB3 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="395777164"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; d="scan'208";a="395777164"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 10:08:03 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="739835381"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; d="scan'208";a="739835381"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 10:08:03 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 4/5] drm/i915/mtl: add GSC CS reset support
Date: Wed,  2 Nov 2022 10:10:46 -0700
Message-Id: <20221102171047.2787951-5-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221102171047.2787951-1-daniele.ceraolospurio@intel.com>
References: <20221102171047.2787951-1-daniele.ceraolospurio@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GSC CS has its own dedicated bit in the GDRST register.

Bspec: 52549
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 1 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index e0fbfac03979..f63829abf66c 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -423,6 +423,7 @@ static u32 get_reset_domain(u8 ver, enum intel_engine_id id)
 			[CCS1]  = GEN11_GRDOM_RENDER,
 			[CCS2]  = GEN11_GRDOM_RENDER,
 			[CCS3]  = GEN11_GRDOM_RENDER,
+			[GSC0]  = GEN12_GRDOM_GSC,
 		};
 		GEM_BUG_ON(id >= ARRAY_SIZE(engine_reset_domains) ||
 			   !engine_reset_domains[id]);
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 70177d3f2e94..8aa06b0327e5 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -643,6 +643,7 @@
 #define   XEHPC_GRDOM_BLT3			REG_BIT(26)
 #define   XEHPC_GRDOM_BLT2			REG_BIT(25)
 #define   XEHPC_GRDOM_BLT1			REG_BIT(24)
+#define   GEN12_GRDOM_GSC			REG_BIT(21)
 #define   GEN11_GRDOM_SFC3			REG_BIT(20)
 #define   GEN11_GRDOM_SFC2			REG_BIT(19)
 #define   GEN11_GRDOM_SFC1			REG_BIT(18)
-- 
2.37.3

