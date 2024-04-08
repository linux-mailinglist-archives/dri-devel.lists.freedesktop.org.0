Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A253089CA4F
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 19:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511091128A5;
	Mon,  8 Apr 2024 17:05:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W8Fn0+e/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A8FD1128A0
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 17:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712595900; x=1744131900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q1tlsRqiakjCYTxdTuQM+nSROJkwpZ0EQYl2CuLR4Yc=;
 b=W8Fn0+e/LAU6L2u1V8s79bAFGewc/R3+JYYsZbT0NLAach3qGJHn7QGN
 MWqge9VmQl4A5onY+rYLykfHvjwXyRyPknbRDr43m7ft7vW/q20NC7m4r
 jvVVp8LEAR3u9yQdokEOR/mcGw714awZppqa8j3Eaez6zjK4ghrnxUbhK
 TJ8Lk2uh281jJT0MuFyFOMPJxFcKjnCNOS3qGSjdN4sN2Q2+ChKMIHndu
 HJJwwgSOvQCgsTdYn6c5mDxhm7Qu0owb2nzznKdU1XNTRuVx/zQp+NWI9
 8dpcyine7U22tCDI/4xtEPakSD2awKoVgU1NyPAHOu/MsQn6yH/CHUv34 w==;
X-CSE-ConnectionGUID: +caUdeuTRWqP2LXdQBnWvQ==
X-CSE-MsgGUID: 99FWgwslQtOVylETenI4Tw==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7793400"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7793400"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:05:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="827792333"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="827792333"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 08 Apr 2024 10:04:55 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Apr 2024 20:04:55 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>
Subject: [PATCH 09/21] drm/hisilicon/kirin: Fix 64bit divisions
Date: Mon,  8 Apr 2024 20:04:14 +0300
Message-ID: <20240408170426.9285-10-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
References: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Use the appropriate 64bit division helpers to make the code
build on 32bit architectures.

Cc: Xinliang Liu <xinliang.liu@linaro.org>
Cc: Tian Tao <tiantao6@hisilicon.com>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Yongqin Liu <yongqin.liu@linaro.org>
Cc: John Stultz <jstultz@google.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
index 566de4658719..a39cc549c20b 100644
--- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
+++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
@@ -157,8 +157,8 @@ static u32 dsi_calc_phy_rate(u32 req_kHz, struct mipi_phy_params *phy)
 			q_pll = 0x10 >> (7 - phy->hstx_ckg_sel);
 
 		temp = f_kHz * (u64)q_pll * (u64)ref_clk_ps;
-		m_n_int = temp / (u64)1000000000;
-		m_n = (temp % (u64)1000000000) / (u64)100000000;
+		m_n_int = div64_u64_rem(temp, 1000000000, &temp);
+		m_n = div_u64(temp, 100000000);
 
 		if (m_n_int % 2 == 0) {
 			if (m_n * 6 >= 50) {
@@ -229,9 +229,8 @@ static u32 dsi_calc_phy_rate(u32 req_kHz, struct mipi_phy_params *phy)
 			phy->pll_fbd_div5f = 1;
 		}
 
-		f_kHz = (u64)1000000000 * (u64)m_pll /
-			((u64)ref_clk_ps * (u64)n_pll * (u64)q_pll);
-
+		f_kHz = div64_u64((u64)1000000000 * (u64)m_pll,
+				  (u64)ref_clk_ps * (u64)n_pll * (u64)q_pll);
 		if (f_kHz >= req_kHz)
 			break;
 
@@ -490,7 +489,7 @@ static void dsi_set_mode_timing(void __iomem *base,
 	hsa_time = (hsw * lane_byte_clk_kHz) / pixel_clk_kHz;
 	hbp_time = (hbp * lane_byte_clk_kHz) / pixel_clk_kHz;
 	tmp = (u64)htot * (u64)lane_byte_clk_kHz;
-	hline_time = DIV_ROUND_UP(tmp, pixel_clk_kHz);
+	hline_time = DIV_ROUND_UP_ULL(tmp, pixel_clk_kHz);
 
 	/* all specified in byte-lane clocks */
 	writel(hsa_time, base + VID_HSA_TIME);
-- 
2.43.2

