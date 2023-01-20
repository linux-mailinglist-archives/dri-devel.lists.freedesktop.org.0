Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0FA675E25
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 20:35:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6471410EAFC;
	Fri, 20 Jan 2023 19:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD48310E39D;
 Fri, 20 Jan 2023 19:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674243317; x=1705779317;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nws+b8Tv9yMcVHF4dRTjJJJLwq5I7tBHqORq8QtOAe0=;
 b=fajn2Z65tbGxQ77OS8dalVA7BNptn/fcTNde9kuuC8F/PTMPUss9XOzt
 2hu7Qb2Ux5NS1qgUfbe2Pevpeb4eO5eoMR1Dyd3JTsAonW1n2rzvO58U5
 Z425Hne2lPj7QPkzj6fikR6Va7+7UEUIQ3tsdNEv5MJtYh8u/n4W1v2Pv
 grmmlXdQxizVTocdqOQi5dxE4iC+TriAYUySjxeIqSYqmfCGSKSYCWDV9
 xj3/KudIcZHtZLwaSKXjxs0Td/gkyULyQBPqTOh0J1jF/4lvp/iaE8iBJ
 Fp8MSoHjwiLXdZPbjs+XCJX9ZAKF4DZOqVPY/I6ZZlWgVjeyEtB40XTzW Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="411903536"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="411903536"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 11:35:17 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="834518314"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="834518314"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 11:35:16 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 5/8] drm/i915: Convert PIPE3/PORT3 to _PICK_EVEN_2RANGES()
Date: Fri, 20 Jan 2023 11:34:54 -0800
Message-Id: <20230120193457.3295977-6-lucas.demarchi@intel.com>
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

Like done for when __var_args__ were used, but size-wise it's also
benefitial to avoid _PICK() used for 3 ports/pipes:

	$ size build64/drivers/gpu/drm/i915/i915.o{.old,.new}
	   text    data     bss     dec     hex filename
	4026288  185703    6984 4218975  40605f build64/drivers/gpu/drm/i915/i915.o.old
	4025496  185703    6984 4218183  405d47 build64/drivers/gpu/drm/i915/i915.o.new

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_reg_defs.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_reg_defs.h b/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
index f1681e1396b5..755c1ea8225c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
@@ -13,7 +13,7 @@
 #define VLV_DISPLAY_BASE		0x180000
 
 /*
- * Named helper wrappers around _PICK_EVEN() and _PICK().
+ * Named helper wrappers around _PICK_EVEN() and _PICK_EVEN_2RANGES().
  */
 #define _PIPE(pipe, a, b)		_PICK_EVEN(pipe, a, b)
 #define _PLANE(plane, a, b)		_PICK_EVEN(plane, a, b)
@@ -29,8 +29,8 @@
 #define _MMIO_PLL(pll, a, b)		_MMIO(_PLL(pll, a, b))
 #define _MMIO_PHY(phy, a, b)		_MMIO(_PHY(phy, a, b))
 
-#define _MMIO_PIPE3(pipe, a, b, c)	_MMIO(_PICK(pipe, a, b, c))
-#define _MMIO_PORT3(pipe, a, b, c)	_MMIO(_PICK(pipe, a, b, c))
+#define _MMIO_PIPE3(pipe, a, b, c)	_MMIO(_PICK_EVEN_2RANGES(pipe, 1, a, a, b, c))
+#define _MMIO_PORT3(pipe, a, b, c)	_MMIO(_PICK_EVEN_2RANGES(pipe, 1, a, a, b, c))
 
 /*
  * Device info offset array based helpers for groups of registers with unevenly
-- 
2.39.0

