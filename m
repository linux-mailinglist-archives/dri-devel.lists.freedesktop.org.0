Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8CF553EEF
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 01:30:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6949D10E876;
	Tue, 21 Jun 2022 23:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9BBB10E5B1;
 Tue, 21 Jun 2022 23:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655854224; x=1687390224;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Rg+fiQFTNv8qeXLh+5fmbZ9euLxIOTmHQjtqCcDbU+4=;
 b=XAI+zr+vbAB5O2xH+5aOWJjOGL2OsbGwByT4XFy4AdIldSm9itkN9xFE
 JPADmA2ni/5WUfNoG0sOH63Nc9ptyYLR9rgZPZpMZLQNX0xs9zCZksbG1
 yR2CMNIu0q+VuZuTvHKvJ2Pr9N0rUSGunGCm/YQ8Xho2rtbD5B2st5pGa
 /15N9nSxFqdcN+KwmsAyNkXRUpEjYT3XN4hHlJuSXCDAc/bxNCvnhnl3d
 fA5DScZza4IJ7kRA/XIN2JB/o4VrG694q6MltSlVEhF6O9gyoOLhFaQ07
 2a8W786aqFmtsVORmMl1FdWorgFNOQDGS+mdUHenkhY/R/AW7HFpBWALN Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="263298305"
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; d="scan'208";a="263298305"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 16:30:24 -0700
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; d="scan'208";a="690186160"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 16:30:23 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/guc: ADL-N should use the same GuC FW as ADL-S
Date: Tue, 21 Jun 2022 16:30:05 -0700
Message-Id: <20220621233005.3952293-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The only difference between the ADL S and P GuC FWs is the HWConfig
support. ADL-N does not support HWConfig, so we should use the same
binary as ADL-S, otherwise the GuC might attempt to fetch a config
table that does not exist. ADL-N is internally identified as an ADL-P,
so we need to special-case it in the FW selection code.

Fixes: 7e28d0b26759 ("drm/i915/adl-n: Enable ADL-N platform")
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index d2c5c9367cc4..ef2d10184ee2 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -162,6 +162,15 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
 	u8 rev = INTEL_REVID(i915);
 	int i;
 
+	/*
+	 * The only difference between the ADL GuC FWs is the HWConfig support.
+	 * ADL-N does not support HWConfig, so we should use the same binary as
+	 * ADL-S, otherwise the GuC might attempt to fetch a config table that
+	 * does not exist.
+	 */
+	if (IS_ADLP_N(i915))
+		p = INTEL_ALDERLAKE_S;
+
 	GEM_BUG_ON(uc_fw->type >= ARRAY_SIZE(blobs_all));
 	fw_blobs = blobs_all[uc_fw->type].blobs;
 	fw_count = blobs_all[uc_fw->type].count;
-- 
2.25.1

