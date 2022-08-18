Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE31599154
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 01:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310A810E2ED;
	Thu, 18 Aug 2022 23:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE8F10E22D;
 Thu, 18 Aug 2022 23:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660866150; x=1692402150;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0f3s7kZPDS7+F8oYlXP6s6G+BXn33hxP3bZbP5oe0ZY=;
 b=BIiAJY2zTLR9kILUAlW846VghFVhoDI/JoKKqhtRHlR4B7bjHIODb7ux
 G/5h3hN72KbLURy/1Ny/FWWRm4G8k7DQYRYs8/nCrCNixb6mIlUQNC154
 vZnAqr4HXErS4D6hdQUKxXPuw4X8xwXSrgF81HizOqbrzid3maSW2g7UY
 m6MrNc2mgf5aV6qKi31AiRNLjANrAwNs63F687iSzzZWWcSsY3WR1h3pX
 PLjX9iZsq2gaBmaDbXEhGvvOaU91JklyAUuUFUf201DDE09rvCn9NsjKq
 x//cwDHrjTHjWvsTCd5qt5qQBfKWz1gGKaaRghRo40VazMBwq2yyYXSdS Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="275938513"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="275938513"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:42:28 -0700
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="783953289"
Received: from invictus.jf.intel.com ([10.165.21.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:42:28 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 06/21] drm/i915/mtl: Add PCH support
Date: Thu, 18 Aug 2022 16:41:47 -0700
Message-Id: <20220818234202.451742-7-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220818234202.451742-1-radhakrishna.sripada@intel.com>
References: <20220818234202.451742-1-radhakrishna.sripada@intel.com>
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

Add support for Meteorpoint(MTP) PCH used with Meteorlake.

Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
Signed-off-by: Clint Taylor <clinton.a.taylor@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/i915/intel_pch.c | 9 ++++++++-
 drivers/gpu/drm/i915/intel_pch.h | 4 ++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/intel_pch.c b/drivers/gpu/drm/i915/intel_pch.c
index 0fec25be146a..ba9843cb1b13 100644
--- a/drivers/gpu/drm/i915/intel_pch.c
+++ b/drivers/gpu/drm/i915/intel_pch.c
@@ -138,6 +138,11 @@ intel_pch_type(const struct drm_i915_private *dev_priv, unsigned short id)
 		drm_WARN_ON(&dev_priv->drm, !IS_ALDERLAKE_S(dev_priv) &&
 			    !IS_ALDERLAKE_P(dev_priv));
 		return PCH_ADP;
+	case INTEL_PCH_MTP_DEVICE_ID_TYPE:
+	case INTEL_PCH_MTP2_DEVICE_ID_TYPE:
+		drm_dbg_kms(&dev_priv->drm, "Found Meteor Lake PCH\n");
+		drm_WARN_ON(&dev_priv->drm, !IS_METEORLAKE(dev_priv));
+		return PCH_MTP;
 	default:
 		return PCH_NONE;
 	}
@@ -166,7 +171,9 @@ intel_virt_detect_pch(const struct drm_i915_private *dev_priv,
 	 * make an educated guess as to which PCH is really there.
 	 */
 
-	if (IS_ALDERLAKE_S(dev_priv) || IS_ALDERLAKE_P(dev_priv))
+	if (IS_METEORLAKE(dev_priv))
+		id = INTEL_PCH_MTP_DEVICE_ID_TYPE;
+	else if (IS_ALDERLAKE_S(dev_priv) || IS_ALDERLAKE_P(dev_priv))
 		id = INTEL_PCH_ADP_DEVICE_ID_TYPE;
 	else if (IS_TIGERLAKE(dev_priv) || IS_ROCKETLAKE(dev_priv))
 		id = INTEL_PCH_TGP_DEVICE_ID_TYPE;
diff --git a/drivers/gpu/drm/i915/intel_pch.h b/drivers/gpu/drm/i915/intel_pch.h
index 7c8ce9781d1a..32aff5a70d04 100644
--- a/drivers/gpu/drm/i915/intel_pch.h
+++ b/drivers/gpu/drm/i915/intel_pch.h
@@ -25,6 +25,7 @@ enum intel_pch {
 	PCH_ICP,	/* Ice Lake/Jasper Lake PCH */
 	PCH_TGP,	/* Tiger Lake/Mule Creek Canyon PCH */
 	PCH_ADP,	/* Alder Lake PCH */
+	PCH_MTP,	/* Meteor Lake PCH */
 
 	/* Fake PCHs, functionality handled on the same PCI dev */
 	PCH_DG1 = 1024,
@@ -57,12 +58,15 @@ enum intel_pch {
 #define INTEL_PCH_ADP2_DEVICE_ID_TYPE		0x5180
 #define INTEL_PCH_ADP3_DEVICE_ID_TYPE		0x7A00
 #define INTEL_PCH_ADP4_DEVICE_ID_TYPE		0x5480
+#define INTEL_PCH_MTP_DEVICE_ID_TYPE		0x7E00
+#define INTEL_PCH_MTP2_DEVICE_ID_TYPE		0xAE00
 #define INTEL_PCH_P2X_DEVICE_ID_TYPE		0x7100
 #define INTEL_PCH_P3X_DEVICE_ID_TYPE		0x7000
 #define INTEL_PCH_QEMU_DEVICE_ID_TYPE		0x2900 /* qemu q35 has 2918 */
 
 #define INTEL_PCH_TYPE(dev_priv)		((dev_priv)->pch_type)
 #define INTEL_PCH_ID(dev_priv)			((dev_priv)->pch_id)
+#define HAS_PCH_MTP(dev_priv)			(INTEL_PCH_TYPE(dev_priv) == PCH_MTP)
 #define HAS_PCH_DG2(dev_priv)			(INTEL_PCH_TYPE(dev_priv) == PCH_DG2)
 #define HAS_PCH_ADP(dev_priv)			(INTEL_PCH_TYPE(dev_priv) == PCH_ADP)
 #define HAS_PCH_DG1(dev_priv)			(INTEL_PCH_TYPE(dev_priv) == PCH_DG1)
-- 
2.25.1

