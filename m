Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A20461EBBF
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 08:21:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB8510E226;
	Mon,  7 Nov 2022 07:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B1810E1FC;
 Mon,  7 Nov 2022 07:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667805641; x=1699341641;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BVhn3qxYXFyXLd/cxchSoeyQ1oDKrnQZn5mzg2RTFjs=;
 b=FYhHuFPsI+2OjRPEWHugd1neL0y7WwHyvaV2Xr3yUQRwpw+8FJr2qRO4
 2Mc9aOYDyCaLrPv/nsQuI8xCiv4Ov0VAFpD/bPRJczvWYidUr35k7zB0G
 S7n6Mp6FAJAZpKx8EWRlUc/KoyqWjg159/ExbRGCfGt3ncsVN9xbiGXcr
 Op9Fi4dJJ1PFYpH3LG8PQProZsVOpqLK4gEdegDm8/uNu61oAq1BqCdm0
 WHo0mu71d1/+b9UOqVgd+bQH1SKGOT/yOrmpIgPTnLR6Nmz9dzSmE47wy
 zqKeMCS9UbTGZBCQGj5gBH+7YAGF/pJKP9Q/fSr4FHuVEE4uHMQXf1CL1 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="372463398"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="372463398"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2022 23:20:41 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="704767296"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="704767296"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2022 23:20:39 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [RFC 13/15] drm/i915/hdmi21/mtl: Enable Scrambling only for FRL mode
Date: Mon,  7 Nov 2022 12:50:43 +0530
Message-Id: <20221107072045.628895-14-ankit.k.nautiyal@intel.com>
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

In FRL mode, the Scrambling is always enabled by the HW.
The High TMDS Char Rate and Scrambing Enable bit of
reg TRANS_DDI_FUNC_CTRL are only set in TMDS mode and not
in FRL mode.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 1dd0b0f2e2f1..1eadf77dc819 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2292,7 +2292,13 @@ int intel_hdmi_compute_config(struct intel_encoder *encoder,
 
 	pipe_config->lane_count = 4;
 
-	if (scdc->scrambling.supported && DISPLAY_VER(dev_priv) >= 10) {
+	/*
+	 * Enable scrambing for only for TMDS mode.
+	 * For FRL mode, scrambling is always enabled by HW, and
+	 * scrambling enable and high tmds clock bits are not used.
+	 */
+	if (scdc->scrambling.supported && DISPLAY_VER(dev_priv) >= 10 &&
+	    !pipe_config->frl.enable) {
 		if (scdc->scrambling.low_rates)
 			pipe_config->hdmi_scrambling = true;
 
-- 
2.25.1

