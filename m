Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55544610576
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 00:14:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D340410E726;
	Thu, 27 Oct 2022 22:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1955510E055;
 Thu, 27 Oct 2022 22:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666908805; x=1698444805;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+smJ00CGQAtqf2wpYW1kXyS6btaTXOBZfC6EAaIufX0=;
 b=IiyTwx4Bip0EJhkDPUgxEZHZox1GSPOpgq0qDRDXD4DzgmyQ7BRYqBNY
 Ku4u1mlBIEX2+zxv9YMDPK8nwbjliAYzk3Px8ZiGaqKvajoQfPjfABv1s
 oQOLmWeU4YswOQagX5MzyLSVuglU5BoYMSMBZ/djBmw6V1eB8Jg0DH4ry
 DVhGfmVJcb2E8DqCVdSRKUaOvyQN4E31pazPgetokhsNiOd0Kl/dSE5+0
 iACw5YicLsq7xw3i+OQO46DMyuYOVGQA03+9cEAkffi2+05QxIm6kP/ZC
 p8y8+GBFBtiLY2luqJ+lN6clvw2CExvYX/d+ruRLtZrKz8JCKymotfsTc A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="295763446"
X-IronPort-AV: E=Sophos;i="5.95,219,1661842800"; d="scan'208";a="295763446"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 15:13:24 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="610528960"
X-IronPort-AV: E=Sophos;i="5.95,219,1661842800"; d="scan'208";a="610528960"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 15:13:24 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/5] drm/i915/mtl: add GSC CS reset support
Date: Thu, 27 Oct 2022 15:15:53 -0700
Message-Id: <20221027221554.2638087-5-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027221554.2638087-1-daniele.ceraolospurio@intel.com>
References: <20221027221554.2638087-1-daniele.ceraolospurio@intel.com>
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

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
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
index 23844ba7e824..16cf90306085 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -640,6 +640,7 @@
 #define   XEHPC_GRDOM_BLT3			REG_BIT(26)
 #define   XEHPC_GRDOM_BLT2			REG_BIT(25)
 #define   XEHPC_GRDOM_BLT1			REG_BIT(24)
+#define   GEN12_GRDOM_GSC			REG_BIT(21)
 #define   GEN11_GRDOM_SFC3			REG_BIT(20)
 #define   GEN11_GRDOM_SFC2			REG_BIT(19)
 #define   GEN11_GRDOM_SFC1			REG_BIT(18)
-- 
2.37.3

