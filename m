Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A201675E28
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 20:35:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A5210EB05;
	Fri, 20 Jan 2023 19:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03CAC10EAF8;
 Fri, 20 Jan 2023 19:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674243319; x=1705779319;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K9Rwmr+p+yYte04uXq7uaLaekVzftRt5vKKh8dUuOMI=;
 b=TMtQNhNGbueocdIDkqzUsCxIEme+ya6x+VO6Ts6sqIGU22ffX9LXUKUO
 4BSuBFVevVPD81QMMGCN26D+F/FKXAsACI+Hfrz33b2E8OjosqEZvLZIg
 hcYvDPaTBfTGMN2ys6ZMlSYHz2aU/H7rk+fjWMrZoXqPv2VN2Yxb5SIiT
 ZUZ3/P0OPkxV3AenjVRVYizfmVoCJjVCzxYJFoj+V4AVRoNMuIcFJVsX1
 /QLN47AdR7q0a0Vm1ijWzH2HZX3iOJgY4YUM91V/0oS/a+eQknjdnSh7d
 2o4X91KGq5es4DR1/dXxzXJXRwxdPPokK+9Ym7/WI5zqw11F7wBsEN9ff Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="411903540"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="411903540"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 11:35:17 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="834518317"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="834518317"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 11:35:16 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 6/8] drm/i915: Convert _FIA() to _PICK_EVEN_2RANGES()
Date: Fri, 20 Jan 2023 11:34:55 -0800
Message-Id: <20230120193457.3295977-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120193457.3295977-1-lucas.demarchi@intel.com>
References: <20230120193457.3295977-1-lucas.demarchi@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

_FIA() can use _PICK_EVEN_2RANGES instead of _PICK, which reduces the
size and is safer.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_mg_phy_regs.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_mg_phy_regs.h b/drivers/gpu/drm/i915/display/intel_mg_phy_regs.h
index 0e8248bce52d..0306ade2bc30 100644
--- a/drivers/gpu/drm/i915/display/intel_mg_phy_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_mg_phy_regs.h
@@ -142,7 +142,9 @@
 #define FIA1_BASE			0x163000
 #define FIA2_BASE			0x16E000
 #define FIA3_BASE			0x16F000
-#define _FIA(fia)			_PICK((fia), FIA1_BASE, FIA2_BASE, FIA3_BASE)
+#define _FIA(fia)			_PICK_EVEN_2RANGES((fia), 1,		\
+							   FIA1_BASE, FIA1_BASE,\
+							   FIA2_BASE, FIA3_BASE)
 #define _MMIO_FIA(fia, off)		_MMIO(_FIA(fia) + (off))
 
 /* ICL PHY DFLEX registers */
-- 
2.39.0

