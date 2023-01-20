Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D10F6675E29
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 20:35:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C35C510EB03;
	Fri, 20 Jan 2023 19:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EDE310EAFD;
 Fri, 20 Jan 2023 19:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674243319; x=1705779319;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JZy+a1wh/irdNN2NOvJaI18iXOd/CkgSTUrviirubLQ=;
 b=e8pX+0kZu0jNushX+pN/PZ9E8X9ynnPOuWEh0ruRZxpj4kL46wSvw/7Z
 YNGOPsy0EN04LRJItCMIuPaSBA6Bqwd5nzGamqArLrE3l/gstM2+tOqzw
 Y9RY3HQttmrUWv4jAFzsTbaM2kb1G/Rjk/wlr5WxGQcwBcXXm3erspOLI
 aBamjNAu6/5tjOjX+nC4RvY6PX1yj4A7IV8mbDNG2F9fT7TcEYwDwyABi
 eCYdFDQlovzPz7zk4Sl1tpInAHqKrPfrmM7E3eC+LfZG345QAyygyKuDC
 sppUDJ92wuSF25XG1dCgcFVj0XnBPhQgf8zyWUy1BBcmKelrsKghG/N20 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="411903546"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="411903546"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 11:35:18 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="834518325"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="834518325"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 11:35:16 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 8/8] drm/i915: Convert PALETTE() to _PICK_EVEN_2RANGES()
Date: Fri, 20 Jan 2023 11:34:57 -0800
Message-Id: <20230120193457.3295977-9-lucas.demarchi@intel.com>
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

PALETTE() can use _PICK_EVEN_2RANGES instead of _PICK, which
reduces the size and is safer.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/i915_reg.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 3d6ad4424265..b134a1f357c8 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -1734,10 +1734,11 @@
 #define   PALETTE_10BIT_BLUE_EXP_MASK	REG_GENMASK(7, 6)
 #define   PALETTE_10BIT_BLUE_MANT_MASK	REG_GENMASK(5, 2)
 #define   PALETTE_10BIT_BLUE_UDW_MASK	REG_GENMASK(1, 0)
-#define PALETTE(pipe, i)	_MMIO(DISPLAY_MMIO_BASE(dev_priv) + \
-				      _PICK((pipe), _PALETTE_A,		\
-					    _PALETTE_B, _CHV_PALETTE_C) + \
-				      (i) * 4)
+#define PALETTE(pipe, i) _MMIO(DISPLAY_MMIO_BASE(dev_priv) +			\
+			       _PICK_EVEN_2RANGES(pipe, 2,			\
+						  _PALETTE_A, _PALETTE_B,	\
+						  _CHV_PALETTE_C, _CHV_PALETTE_C) + \
+						  (i) * 4)
 
 #define PEG_BAND_GAP_DATA	_MMIO(0x14d68)
 
-- 
2.39.0

