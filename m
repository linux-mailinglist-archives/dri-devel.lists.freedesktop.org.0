Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD5844BC09
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 08:16:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4EB72BBC;
	Wed, 10 Nov 2021 07:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 363 seconds by postgrey-1.36 at gabe;
 Wed, 10 Nov 2021 07:16:32 UTC
Received: from out0.migadu.com (out0.migadu.com [IPv6:2001:41d0:2:267::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC3A672BBC;
 Wed, 10 Nov 2021 07:16:32 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1636528230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1XPoAtOKaw0wB6PWKbQ+L4vIIuwWVu821HFuGAEU08A=;
 b=XsEf7tDqcSbk61rbNFlx2L1l61CqkMo5MV2NeG/WDnpw5ljZTAw0Isfnep7v48Vs8qamkq
 0mfIKfLHdI2rcv5rLMSWqvwMHTOOV9qfhMU2XbG3j8+wWPRzyC+9yCmhiIPh4HE9TQg3du
 eYTxuY7sKbLFBPneUjRxORcVSVJdfDA=
From: Jackie Liu <liu.yun@linux.dev>
To: robdclark@gmail.com,
	sean@poorly.run,
	airlied@linux.ie
Subject: [PATCH 3/3] drm/msm: some features need to be forced to rely on
 COMMON_CLK
Date: Wed, 10 Nov 2021 15:09:50 +0800
Message-Id: <20211110070950.3355597-3-liu.yun@linux.dev>
In-Reply-To: <20211110070950.3355597-1-liu.yun@linux.dev>
References: <20211110070950.3355597-1-liu.yun@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: liu.yun@linux.dev
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
Cc: architt@codeaurora.org, liu.yun@linux.dev, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, christian.koenig@amd.com,
 chandanu@codeaurora.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jackie Liu <liuyun01@kylinos.cn>

In fact, this will not cause any problems, but when COMPILE_TEST is
enabled, COMMON_CLK may not be selected, The CI system will report
some compilation errors. even if that is not issue, but we better fix
him.

[...]
x86_64-linux-gnu-ld: drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.o: in function `pll_28nm_register':
dsi_phy_28nm.c:(.text+0x868): undefined reference to `devm_clk_hw_register'
x86_64-linux-gnu-ld: dsi_phy_28nm.c:(.text+0x90c): undefined reference to `__devm_clk_hw_register_divider'
x86_64-linux-gnu-ld: dsi_phy_28nm.c:(.text+0x979): undefined reference to `devm_clk_hw_register_fixed_factor'
x86_64-linux-gnu-ld: dsi_phy_28nm.c:(.text+0x9f8): undefined reference to `__devm_clk_hw_register_divider'
x86_64-linux-gnu-ld: dsi_phy_28nm.c:(.text+0xab5): undefined reference to `__devm_clk_hw_register_mux'
x86_64-linux-gnu-ld: dsi_phy_28nm.c:(.text+0xb1e): undefined reference to `devm_clk_hw_register_fixed_factor'
x86_64-linux-gnu-ld: drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.o: in function `dsi_28nm_pll_save_state':
dsi_phy_28nm.c:(.text+0x1234): undefined reference to `clk_hw_get_rate'
x86_64-linux-gnu-ld: drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.o: in function `dsi_28nm_pll_save_state':
dsi_phy_28nm_8960.c:(.text+0x408): undefined reference to `clk_hw_get_rate'
x86_64-linux-gnu-ld: drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.o: in function `clk_bytediv_round_rate':
dsi_phy_28nm_8960.c:(.text+0x483): undefined reference to `clk_hw_get_parent'
x86_64-linux-gnu-ld: dsi_phy_28nm_8960.c:(.text+0x48e): undefined reference to `clk_hw_round_rate'
x86_64-linux-gnu-ld: drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.o: in function `pll_28nm_register':
dsi_phy_28nm_8960.c:(.text+0x681): undefined reference to `devm_clk_hw_register'
x86_64-linux-gnu-ld: dsi_phy_28nm_8960.c:(.text+0x735): undefined reference to `devm_clk_hw_register'
x86_64-linux-gnu-ld: dsi_phy_28nm_8960.c:(.text+0x796): undefined reference to `__devm_clk_hw_register_divider'
x86_64-linux-gnu-ld: drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.o: in function `pll_10nm_register':
dsi_phy_10nm.c:(.text+0x705): undefined reference to `devm_clk_hw_register'
x86_64-linux-gnu-ld: dsi_phy_10nm.c:(.text+0x7b0): undefined reference to `__devm_clk_hw_register_divider'
x86_64-linux-gnu-ld: dsi_phy_10nm.c:(.text+0x83a): undefined reference to `__devm_clk_hw_register_divider'
x86_64-linux-gnu-ld: dsi_phy_10nm.c:(.text+0x8ad): undefined reference to `devm_clk_hw_register_fixed_factor'
x86_64-linux-gnu-ld: dsi_phy_10nm.c:(.text+0x91d): undefined reference to `devm_clk_hw_register_fixed_factor'
x86_64-linux-gnu-ld: dsi_phy_10nm.c:(.text+0x989): undefined reference to `devm_clk_hw_register_fixed_factor'
x86_64-linux-gnu-ld: dsi_phy_10nm.c:(.text+0xaa4): undefined reference to `__devm_clk_hw_register_mux'
x86_64-linux-gnu-ld: dsi_phy_10nm.c:(.text+0xb2a): undefined reference to `__devm_clk_hw_register_divider'
x86_64-linux-gnu-ld: drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.o: in function `pll_7nm_register':
dsi_phy_7nm.c:(.text+0xa45): undefined reference to `devm_clk_hw_register'
x86_64-linux-gnu-ld: dsi_phy_7nm.c:(.text+0xaf0): undefined reference to `__devm_clk_hw_register_divider'
x86_64-linux-gnu-ld: dsi_phy_7nm.c:(.text+0xb7a): undefined reference to `__devm_clk_hw_register_divider'
x86_64-linux-gnu-ld: dsi_phy_7nm.c:(.text+0xbfd): undefined reference to `devm_clk_hw_register_fixed_factor'
x86_64-linux-gnu-ld: dsi_phy_7nm.c:(.text+0xc6d): undefined reference to `devm_clk_hw_register_fixed_factor'
x86_64-linux-gnu-ld: dsi_phy_7nm.c:(.text+0xcea): undefined reference to `devm_clk_hw_register_fixed_factor'
x86_64-linux-gnu-ld: dsi_phy_7nm.c:(.text+0xda0): undefined reference to `__devm_clk_hw_register_divider'
x86_64-linux-gnu-ld: dsi_phy_7nm.c:(.text+0xed9): undefined reference to `__devm_clk_hw_register_mux'
[...]

Fixes: b3ed524f84f5 ("drm/msm: allow compile_test on !ARM")
Reported-by: kernelbot <kernel-bot@kylinos.cn>
Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
---
 drivers/gpu/drm/msm/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 617dcb799156..db5909ecca8e 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -85,6 +85,7 @@ config DRM_MSM_DSI
 config DRM_MSM_DSI_28NM_PHY
 	bool "Enable DSI 28nm PHY driver in MSM DRM"
 	depends on DRM_MSM_DSI
+	depends on COMMON_CLK
 	default y
 	help
 	  Choose this option if the 28nm DSI PHY is used on the platform.
@@ -92,6 +93,7 @@ config DRM_MSM_DSI_28NM_PHY
 config DRM_MSM_DSI_20NM_PHY
 	bool "Enable DSI 20nm PHY driver in MSM DRM"
 	depends on DRM_MSM_DSI
+	depends on COMMON_CLK
 	default y
 	help
 	  Choose this option if the 20nm DSI PHY is used on the platform.
@@ -99,6 +101,7 @@ config DRM_MSM_DSI_20NM_PHY
 config DRM_MSM_DSI_28NM_8960_PHY
 	bool "Enable DSI 28nm 8960 PHY driver in MSM DRM"
 	depends on DRM_MSM_DSI
+	depends on COMMON_CLK
 	default y
 	help
 	  Choose this option if the 28nm DSI PHY 8960 variant is used on the
@@ -107,6 +110,7 @@ config DRM_MSM_DSI_28NM_8960_PHY
 config DRM_MSM_DSI_14NM_PHY
 	bool "Enable DSI 14nm PHY driver in MSM DRM (used by MSM8996/APQ8096)"
 	depends on DRM_MSM_DSI
+	depends on COMMON_CLK
 	default y
 	help
 	  Choose this option if DSI PHY on 8996 is used on the platform.
@@ -114,6 +118,7 @@ config DRM_MSM_DSI_14NM_PHY
 config DRM_MSM_DSI_10NM_PHY
 	bool "Enable DSI 10nm PHY driver in MSM DRM (used by SDM845)"
 	depends on DRM_MSM_DSI
+	depends on COMMON_CLK
 	default y
 	help
 	  Choose this option if DSI PHY on SDM845 is used on the platform.
@@ -121,6 +126,7 @@ config DRM_MSM_DSI_10NM_PHY
 config DRM_MSM_DSI_7NM_PHY
 	bool "Enable DSI 7nm PHY driver in MSM DRM"
 	depends on DRM_MSM_DSI
+	depends on COMMON_CLK
 	default y
 	help
 	  Choose this option if DSI PHY on SM8150/SM8250/SC7280 is used on
-- 
2.25.1

