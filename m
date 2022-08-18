Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C616C599175
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 01:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6985410EAFA;
	Thu, 18 Aug 2022 23:44:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 126E010E22D;
 Thu, 18 Aug 2022 23:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660866153; x=1692402153;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5YGbXa5N/pi+vOMd2xkvNWpva0Zk+ETnf2BxwdGx0Q4=;
 b=ZShWavzMe1Pa6WAn78xHbYKh+chEozBHXc46uYfylhUJWVS+0MBMmbO0
 0/nwyzU/0tLfLZ8cPmhuKxF7D8jcwRDaIEwelpGGN9QvbObsZhI5woBvu
 zXVEbvWBC+01N+nb/gguBp2PHYn1QJJh+jTqRyHxWBl8OQd69/dEDpPMc
 CJOouuQn9qB/jxXU8eKicBH7atXJtIapE71HYNeMaSAA105odb79qDPUq
 Jh082OrOiTayECxfskBxBILSeV9aM58kM1u8l+lPZ55onolHiTo3odE5a
 YoSqj+WZ61ujgaSFhYJ3a+8juJzmfymIEEhmaf/gWf0dehA6P8qvv66/S A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="275938530"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="275938530"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:42:29 -0700
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="783953304"
Received: from invictus.jf.intel.com ([10.165.21.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:42:28 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 19/21] drm/i915/display/mtl: Extend MBUS programming
Date: Thu, 18 Aug 2022 16:42:00 -0700
Message-Id: <20220818234202.451742-20-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220818234202.451742-1-radhakrishna.sripada@intel.com>
References: <20220818234202.451742-1-radhakrishna.sripada@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: José Roberto de Souza <jose.souza@intel.com>

Display version 14 also supports MBUS joining just like ADL-P
and also it does not need MBUS initialization, so extending ADL-P
code paths to display version 14 and higher.

Bspec: 49213

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_power.c | 2 +-
 drivers/gpu/drm/i915/i915_drv.h                    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 9c1fefb2da55..439d56c3814f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -1102,7 +1102,7 @@ static void icl_mbus_init(struct drm_i915_private *dev_priv)
 	unsigned long abox_regs = INTEL_INFO(dev_priv)->display.abox_mask;
 	u32 mask, val, i;
 
-	if (IS_ALDERLAKE_P(dev_priv))
+	if (IS_ALDERLAKE_P(dev_priv) || DISPLAY_VER(dev_priv) >= 14)
 		return;
 
 	mask = MBUS_ABOX_BT_CREDIT_POOL1_MASK |
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 7ebddde200bc..2d658ddcf3c7 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1360,7 +1360,7 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define HAS_D12_PLANE_MINIMIZATION(dev_priv) (IS_ROCKETLAKE(dev_priv) || \
 					      IS_ALDERLAKE_S(dev_priv))
 
-#define HAS_MBUS_JOINING(i915) (IS_ALDERLAKE_P(i915))
+#define HAS_MBUS_JOINING(i915) (IS_ALDERLAKE_P(i915) || DISPLAY_VER(i915) >= 14)
 
 #define HAS_3D_PIPELINE(i915)	(INTEL_INFO(i915)->has_3d_pipeline)
 
-- 
2.25.1

