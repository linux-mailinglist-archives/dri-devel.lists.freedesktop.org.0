Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D445B22E8
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 17:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8174710EA00;
	Thu,  8 Sep 2022 15:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6438710EA00;
 Thu,  8 Sep 2022 15:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662652707; x=1694188707;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+6OUiz4rKrFjHm4ULr72B6eVMKgiKfq0/CDe9DNVRjg=;
 b=MQkPRuRsGs4GUu0Vrmco4ngx6x9mZDFq358nMj0AOwNaLUuYqcTHQjdo
 Hp/HwKCZaKNVHS13wgqk4G3t1jfJttVHF4kcV00YYJ2hT+VN7LFciFkvD
 SRHm8RH4KPcsuGtQzWcDlDxXbzpBwGIi3ZxyUrJBbb2TTkWYwLS7nd6iJ
 Wm6N3NyCR03u9MWYT3Pi1eQdJ+igqy3Qx77G6CaiTj7wA1J55cJneNjgF
 +xlglcMkiXAO9HSPNXMkgneyNm6v7QRpZQmAeE8dPnDfE4Apg1z3vN0+M
 NkEiZjIDXN6aG0ydfTPQB9LBsymU7GFLFBtFO1IDTY0lfr7TxQZclfNWS w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="323426008"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="323426008"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 08:58:26 -0700
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="592231383"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 08:58:26 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/gt: Fix perf limit reasons bit positions
Date: Thu,  8 Sep 2022 08:58:21 -0700
Message-Id: <20220908155821.1662110-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Perf limit reasons bit positions were off by one.

Fixes: fa68bff7cf27 ("drm/i915/gt: Add sysfs throttle frequency interfaces")
Cc: stable@vger.kernel.org # v5.18+
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Acked-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/i915/i915_reg.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index c413eec3373f..24009786f88b 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -1794,14 +1794,14 @@
 
 #define GT0_PERF_LIMIT_REASONS		_MMIO(0x1381a8)
 #define   GT0_PERF_LIMIT_REASONS_MASK	0xde3
-#define   PROCHOT_MASK			REG_BIT(1)
-#define   THERMAL_LIMIT_MASK		REG_BIT(2)
-#define   RATL_MASK			REG_BIT(6)
-#define   VR_THERMALERT_MASK		REG_BIT(7)
-#define   VR_TDC_MASK			REG_BIT(8)
-#define   POWER_LIMIT_4_MASK		REG_BIT(9)
-#define   POWER_LIMIT_1_MASK		REG_BIT(11)
-#define   POWER_LIMIT_2_MASK		REG_BIT(12)
+#define   PROCHOT_MASK			REG_BIT(0)
+#define   THERMAL_LIMIT_MASK		REG_BIT(1)
+#define   RATL_MASK			REG_BIT(5)
+#define   VR_THERMALERT_MASK		REG_BIT(6)
+#define   VR_TDC_MASK			REG_BIT(7)
+#define   POWER_LIMIT_4_MASK		REG_BIT(8)
+#define   POWER_LIMIT_1_MASK		REG_BIT(10)
+#define   POWER_LIMIT_2_MASK		REG_BIT(11)
 
 #define CHV_CLK_CTL1			_MMIO(0x101100)
 #define VLV_CLK_CTL2			_MMIO(0x101104)
-- 
2.34.1

