Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8369F54E070
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 14:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D7111A4B9;
	Thu, 16 Jun 2022 12:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D3611A4B9;
 Thu, 16 Jun 2022 12:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655380921; x=1686916921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0ByjhdNE3YCvFPUu4QT9FmBy4clWJL+DcwDitYP/QQc=;
 b=kn/3bVVatRLlCDtz70STjHM5fAnfBtpJlQJ/+PTM+l34kyLEs1+3+0H+
 krFPkS2DtME3JgqdgJ98c3rs0eQoFKRaudeBUvzv36EhbFfW6tdlO8ELi
 PBJmz7bHKLmsDY8gCMUV0NteIPYK4PBJ7OyoBVbjMJ3Zo65H6noWSXqPy
 yml8oXNUzXH+QjcYkN5fp8RJdjkKLBEQC0cFTzrS8w+UCsFfHYDcAf2hb
 M/ac4mROXTwxwvRpSwHdfFjcVv+odovVyegYiLlIHXA6gVr2Pi5LsIWCt
 weInkqf8WbavpCaXF65X6ujn8lEUvaO91qyvkPrXT3tDiFKeDw1/O3RCv g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="343189598"
X-IronPort-AV: E=Sophos;i="5.91,305,1647327600"; d="scan'208";a="343189598"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 05:01:35 -0700
X-IronPort-AV: E=Sophos;i="5.91,305,1647327600"; d="scan'208";a="713330901"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 05:01:33 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/9] drm/i915/dg2: DG2 MBD config
Date: Thu, 16 Jun 2022 17:31:01 +0530
Message-Id: <20220616120106.24353-5-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220616120106.24353-1-anshuman.gupta@intel.com>
References: <20220616120106.24353-1-anshuman.gupta@intel.com>
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
Cc: tilak.tangudu@intel.com, tvrtko.ursulin@intel.com,
 Anshuman Gupta <anshuman.gupta@intel.com>, jon.ewins@intel.com,
 badal.nilawar@intel.com, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DG2 Motherboard Down Config check support.

v2:
- Don't use pciid to check DG2 MBD. [Jani]

BSpec: 44477
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/i915/display/intel_opregion.c | 2 ++
 drivers/gpu/drm/i915/i915_drv.h               | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_opregion.c b/drivers/gpu/drm/i915/display/intel_opregion.c
index c8cdcde89dfc..50dcd6d3558e 100644
--- a/drivers/gpu/drm/i915/display/intel_opregion.c
+++ b/drivers/gpu/drm/i915/display/intel_opregion.c
@@ -1291,6 +1291,8 @@ intel_opregion_vram_sr_required(struct drm_i915_private *i915)
 
 	if (IS_DG1(i915))
 		return intel_opregion_dg1_mbd_config(i915);
+	else if (IS_DG2_MBD(i915))
+		return true;
 
 	return false;
 }
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index f1f8699eedfd..28eee8088822 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1006,6 +1006,12 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define IS_DG2(dev_priv)	IS_PLATFORM(dev_priv, INTEL_DG2)
 #define IS_PONTEVECCHIO(dev_priv) IS_PLATFORM(dev_priv, INTEL_PONTEVECCHIO)
 
+#define IS_DG2_G10_NB_MBD(dev_priv) \
+	IS_SUBPLATFORM(dev_priv, INTEL_DG2, INTEL_SUBPLATFORM_G10_NB_MBD)
+#define IS_DG2_G11_NB_MBD(dev_priv) \
+	IS_SUBPLATFORM(dev_priv, INTEL_DG2, INTEL_SUBPLATFORM_G11_NB_MBD)
+#define IS_DG2_G12_NB_MBD(dev_priv) \
+	IS_SUBPLATFORM(dev_priv, INTEL_DG2, INTEL_SUBPLATFORM_G12_NB_MBD)
 #define IS_DG2_G10(dev_priv) \
 	IS_SUBPLATFORM(dev_priv, INTEL_DG2, INTEL_SUBPLATFORM_G10_NB_MBD) || \
 	IS_SUBPLATFORM(dev_priv, INTEL_DG2, INTEL_SUBPLATFORM_G10)
@@ -1015,6 +1021,9 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define IS_DG2_G12(dev_priv) \
 	IS_SUBPLATFORM(dev_priv, INTEL_DG2, INTEL_SUBPLATFORM_G12_NB_MBD) || \
 	IS_SUBPLATFORM(dev_priv, INTEL_DG2, INTEL_SUBPLATFORM_G12)
+
+#define IS_DG2_MBD(dev_priv) (IS_DG2_G10_NB_MBD(dev_priv) || IS_DG2_G11_NB_MBD(dev_priv) || \
+			      IS_DG2_G12_NB_MBD(dev_priv))
 #define IS_ADLS_RPLS(dev_priv) \
 	IS_SUBPLATFORM(dev_priv, INTEL_ALDERLAKE_S, INTEL_SUBPLATFORM_RPL)
 #define IS_ADLP_N(dev_priv) \
-- 
2.26.2

