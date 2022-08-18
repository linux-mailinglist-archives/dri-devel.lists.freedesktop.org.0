Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4976E5A01E3
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 21:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E57CC235E;
	Wed, 24 Aug 2022 19:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A0110E2ED;
 Thu, 18 Aug 2022 23:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660866151; x=1692402151;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w9x3LUIn4oimxR2CE7FJ8TX1PXrOjxZaZM7xDOB9638=;
 b=fcjcOFhz5bo4V1d6pIuiJ+a3ufir6UGGcqd+DiqaeXQyT8Am8H4Y/qok
 qmGJ4doT3zy821qVz7cQjuIeO6VcirMb/93MJ6waHQBuIPirAie8Ss2IL
 knyff3VrwCwurIYNGm8NdLzeZPy/clJ22rzeNVBgQZJj4eQq8sIc5wiaO
 Ws1O7JZThdRBJKz6W++EajgX9Aml+xG47tG+HdLLIhcWz2M8ei++8ZAwP
 EBuIy3hq5167E5SeEkXAuHjGNdvR5IGuNDU8OjoMQ6nS+GE1bHknQmbiX
 Bze0OiI8MSR9NHeRWAMSXWKHg84qqNfkID8tGqfJ9sWX1hRhZN35DwuNd g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="275938517"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="275938517"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:42:28 -0700
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="783953293"
Received: from invictus.jf.intel.com ([10.165.21.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:42:28 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 09/21] drm/i915/mtl: Add support for MTL in Display Init
 sequences
Date: Thu, 18 Aug 2022 16:41:50 -0700
Message-Id: <20220818234202.451742-10-radhakrishna.sripada@intel.com>
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

The initialization sequence for Meteorlake reuses the sequence for
icelake for most parts. Some changes viz. reset PICA handshake
are added.

Bspec: 49189

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_power.c | 3 +++
 drivers/gpu/drm/i915/i915_reg.h                    | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index f7e8d1ff62cf..9c1fefb2da55 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -1382,6 +1382,9 @@ static void intel_pch_reset_handshake(struct drm_i915_private *dev_priv,
 		reset_bits = RESET_PCH_HANDSHAKE_ENABLE;
 	}
 
+	if (DISPLAY_VER(dev_priv) >= 14)
+		reset_bits |= MTL_RESET_PICA_HANDSHAKE_EN;
+
 	val = intel_de_read(dev_priv, reg);
 
 	if (enable)
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 15a53cb5e1ee..e2e9932fa484 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -5821,7 +5821,8 @@
 							 _BW_BUDDY1_PAGE_MASK))
 
 #define HSW_NDE_RSTWRN_OPT	_MMIO(0x46408)
-#define  RESET_PCH_HANDSHAKE_ENABLE	(1 << 4)
+#define  MTL_RESET_PICA_HANDSHAKE_EN	REG_BIT(6)
+#define  RESET_PCH_HANDSHAKE_ENABLE	REG_BIT(4)
 
 #define GEN8_CHICKEN_DCPR_1			_MMIO(0x46430)
 #define   SKL_SELECT_ALTERNATE_DC_EXIT		REG_BIT(30)
-- 
2.25.1

