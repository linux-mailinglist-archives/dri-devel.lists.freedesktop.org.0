Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9AD643A9B
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 02:16:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FCC110E2E9;
	Tue,  6 Dec 2022 01:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF6110E2EB;
 Tue,  6 Dec 2022 01:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670289331; x=1701825331;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kD3MapRAnUEeCcihf1HuFNJAvWgIpzYDpQ7Tw/E1hiM=;
 b=brjOIepSQ3NPCIDxePh36jaX4WUVcBVkgjDGbIGfwQ2Y+SY4nR0bBDSa
 +KUYzo7ppGwyb7DYTXUvMxcWmbrstTbtkY0Y3EuhZ9dbNM+7ttEV4nAAh
 ui1ZJJBWOkByVV4d9HiJzJSKIxL78qSMoFrTwijrjmD+0YKg2CUmZNFZa
 vzgLAO7DuY6sywdhnDK59jJkbhuFGEU6ozhTVivjreFXkk0GfqN7Pt3As
 BYGeLJ+tpenAoBjeZAOROIK1a+3Rhhg2er6Vv7WwntNbMits6QmK1MnzB
 foXh/PMeKQNNtucAcdBVPh3ftH6GYV4Ci35NyU3shIAPnLIc3SsuCIWVo A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="317650483"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; d="scan'208";a="317650483"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 17:15:31 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="974890727"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; d="scan'208";a="974890727"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 17:15:30 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 6/6] drm/i915/mtl: MTL has one GSC CS on the media GT
Date: Mon,  5 Dec 2022 17:19:08 -0800
Message-Id: <20221206011908.2745508-7-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221206011908.2745508-1-daniele.ceraolospurio@intel.com>
References: <20221206011908.2745508-1-daniele.ceraolospurio@intel.com>
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
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we have the GSC FW support code as a user to the GSC CS, we
can add the relevant flag to the engine mask. Note that the engine will
still be disabled until we define the GSC FW binary file.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 414b4bfd514b..3f803c1280c0 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1125,7 +1125,7 @@ static const struct intel_gt_definition xelpmp_extra_gt[] = {
 		.type = GT_MEDIA,
 		.name = "Standalone Media GT",
 		.gsi_offset = MTL_MEDIA_GSI_BASE,
-		.engine_mask = BIT(VECS0) | BIT(VCS0) | BIT(VCS2),
+		.engine_mask = BIT(VECS0) | BIT(VCS0) | BIT(VCS2) | BIT(GSC0),
 	},
 	{}
 };
-- 
2.37.3

