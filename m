Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3879761EBBC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 08:21:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A1410E221;
	Mon,  7 Nov 2022 07:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E6A10E200;
 Mon,  7 Nov 2022 07:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667805627; x=1699341627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4hNFOrnhQjl7OM9Ie3RGrxxHa9sGXPz1xv9y4vGsIL8=;
 b=CL6V394/D2K5a0V4jDkdt2Es3NdQukb9UpTnKGy9P5k9RiqVcn71vKjS
 K2mFy9vL1Ij5ZCWXsEdg08FQEcI2u2GNz4DgD35GVb0aScfNNUfiuKq1w
 gYuAyTZTP4ruKdDGnr8Gk7QLlGEhvHKEevkLtTPchRJ8z708g0zGjl2Ap
 9ylFGH5ok+urQL87Zgoq/TtzfDXpPXFronSSMUH/m+4+TT6w4z4PRjsGr
 zeRHh7hf4vm9q0aeF8cInV4fEQKjv3LpcHK4jIPz5DWvHr1o8RY7Q7DqJ
 tqIbvEs/fRWsqP9jcZDgfPMffQwWWR6py4VFoKCYnHWxQyPKNjgiU3Ifs Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="372463358"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="372463358"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2022 23:20:26 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="704767264"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="704767264"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2022 23:20:24 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [RFC 07/15] drm/i915/mtl: Add registers for FRL Link Training
Date: Mon,  7 Nov 2022 12:50:37 +0530
Message-Id: <20221107072045.628895-8-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221107072045.628895-1-ankit.k.nautiyal@intel.com>
References: <20221107072045.628895-1-ankit.k.nautiyal@intel.com>
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
Cc: vandita.kulkarni@intel.com, uma.shankar@intel.com, mika.kahola@intel.com,
 radhakrishna.sripada@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add registers for FRL configuration.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/i915_reg.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 765a10e0de88..b50e1349d22c 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -2121,6 +2121,28 @@
 #define   TRANS_PUSH_EN			REG_BIT(31)
 #define   TRANS_PUSH_SEND		REG_BIT(30)
 
+/* HDMI 2.1 FRL Configuration */
+#define _TRANS_HDMI_FRL_CFG_A		0x600B0
+#define TRANS_HDMI_FRL_CFG(trans)	_MMIO_TRANS2(trans, _TRANS_HDMI_FRL_CFG_A)
+#define TRANS_HDMI_FRL_ENABLE			REG_BIT(31)
+#define TRANS_HDMI_TMDS_ENABLE			0
+#define TRANS_HDMI_FRL_TRAINING_COMPLETE	REG_BIT(28)
+#define TRANS_HDMI_DISABLE_DFM_MASKING		REG_BIT(20)
+#define TRANS_HDMI_R_B_SCHED_ENABLE_MASK	REG_BIT(19)
+#define TRANS_HDMI_R_B_SCHED_ENABLE(val)	REG_FIELD_PREP(TRANS_HDMI_R_B_SCHED_ENABLE_MASK, val)
+#define TRANS_HDMI_ACTIVE_CHAR_BUF_THRESH_MASK	REG_GENMASK(18, 16)
+#define TRANS_HDMI_ACTIVE_CHAR_BUF_THRESH(val)	REG_FIELD_PREP(TRANS_HDMI_ACTIVE_CHAR_BUF_THRESH_MASK, val)
+#define TRANS_HDMI_MIN_BLANK_CHAR_MASK		REG_GENMASK(15, 12)
+#define TRANS_HDMI_MIN_BLANK_CHAR(val)		REG_FIELD_PREP(TRANS_HDMI_MIN_BLANK_CHAR_MASK, val)
+#define TRANS_HDMI_MIN_BLANK_CHAR_VAL           0xA
+#define TRANS_HDMI_FRL_PKT_PAYLOAD_MAX_MASK	REG_GENMASK(9, 0)
+#define TRANS_HDMI_FRL_PKT_PAYLOAD_MAX(val)	REG_FIELD_PREP(TRANS_HDMI_FRL_PKT_PAYLOAD_MAX_MASK, val)
+#define TRANS_HDMI_PAYLOAD_UPPER_BOUND		0x3FE
+
+#define _TRANS_HDMI_FRL_TRAIN_A			0x600B4
+#define TRANS_HDMI_FRL_TRAIN(trans)		_MMIO_TRANS2(trans, _TRANS_HDMI_FRL_TRAIN_A)
+#define  TRANS_HDMI_FRL_LTP(pattern, lane)	((pattern) << (lane) * 8)
+
 /*
  * HSW+ eDP PSR registers
  *
-- 
2.25.1

