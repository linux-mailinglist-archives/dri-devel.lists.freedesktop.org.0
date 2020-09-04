Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C18EB25E4A6
	for <lists+dri-devel@lfdr.de>; Sat,  5 Sep 2020 02:35:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647FE6ECF6;
	Sat,  5 Sep 2020 00:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010066EC99
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 17:30:28 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id t20so5201615qtr.8
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 10:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=orPTiN80DIzVtMLodDzkNxA4r9Q1LTQ4BL8KST3oyYo=;
 b=SGJBLu6rKUkHInEfTd1L0i1qCZ8+C2iHnrd62jw660DLZ/ak8K1liN3JiqDKFMe9Gd
 4t9BGnjwB0mxcm4mhmLeQlh5bvZeTeCwRZBEJyCERpVDhaTEZkVR83yxEXs555xDz49o
 P4lkl0rUhO7V9GJPrWtEp86rLs6OZL+Afhc+5eGtXIHS4JTStWejRZJVa/2AdQRyrdJL
 1AfM5Ytomz70UvfXviPWTvtjGDzkG4lMQGXs8IO7K5UDpLQ/NSiUj6obNLq1AXvyZC8m
 0ryFzJXbLeDsu8TnTByi1Ez0HbjBCeuxIS/11uRqlHp+rUSwEqpeNpzaX0tHXR6s7GuA
 nnvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=orPTiN80DIzVtMLodDzkNxA4r9Q1LTQ4BL8KST3oyYo=;
 b=EG/L99SKBMxNkpNc+cbnbI+PuEtCezk8d2Sf0fboiSrHebFlfX9+Hx+zeUW3tJcLB7
 su8Zv3ILoFjUZV5Jzi7H5NUJ9cDbgjOtucmzG7s5DeJAuCyJkTJpXdMk4fF7/zzOxQS/
 9SQl9vjIdM7x0DLHZ9AKm7pQVOMQvSNS2WMtelFFT6bb5Xu2b4ARbHlXoRTABYSx+FeH
 FqBqd4a2s5lNaeF4OgaRtMLsZN4WKVP6/r4z92ZfTpaJudomz8eFXXjxnCYK/ZCac8f7
 B/rQ6l/BiotlWVRT8lbQVki85SBvF9g7glP8UHiLaagQ/GABNX+4KF3ju84NZiNIX3eb
 Daow==
X-Gm-Message-State: AOAM531sqt3RTCREBMHLC6gq03MEQvqw+EuDaNOZsTVsNNb00Ho0TH89
 +ZSoOCz9g8f3feROiiERYRJpKg==
X-Google-Smtp-Source: ABdhPJxg2WRuoIwkG+qda7vH/KDqTm2SWpBc7eIFaigF3MdUDlC+Qd0ea/Bvc05nm/FgbjJyjiNAzw==
X-Received: by 2002:aed:2083:: with SMTP id 3mr9360049qtb.233.1599240627677;
 Fri, 04 Sep 2020 10:30:27 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id i66sm5103330qkc.63.2020.09.04.10.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 10:30:27 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 3/3] drm/msm/dsi: add support for 7nm DSI PHY/PLL
Date: Fri,  4 Sep 2020 13:28:38 -0400
Message-Id: <20200904172859.25633-4-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200904172859.25633-1-jonathan@marek.ca>
References: <20200904172859.25633-1-jonathan@marek.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 05 Sep 2020 00:35:27 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Harigovindan P <harigovi@codeaurora.org>,
 Konrad Dybcio <konradybcio@gmail.com>, zhengbin <zhengbin13@huawei.com>,
 Rob Herring <robh+dt@kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds support for the 7nm ("V4") DSI PHY/PLL for sm8150 and sm8250.

Implementation is based on 10nm driver, but updated based on the downstream
7nm driver.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 .../devicetree/bindings/display/msm/dsi.txt   |   6 +-
 drivers/gpu/drm/msm/Kconfig                   |   7 +
 drivers/gpu/drm/msm/Makefile                  |   2 +
 drivers/gpu/drm/msm/dsi/dsi.h                 |   2 +
 drivers/gpu/drm/msm/dsi/dsi.xml.h             | 423 ++++++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         | 102 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   4 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 255 +++++
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.c         |   4 +
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.h         |  10 +
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c     | 902 ++++++++++++++++++
 11 files changed, 1715 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
 create mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c

diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
index 7884fd7a85c1..b9a64d3ff184 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi.txt
+++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
@@ -90,6 +90,8 @@ Required properties:
   * "qcom,dsi-phy-14nm-660"
   * "qcom,dsi-phy-10nm"
   * "qcom,dsi-phy-10nm-8998"
+  * "qcom,dsi-phy-7nm"
+  * "qcom,dsi-phy-7nm-8150"
 - reg: Physical base address and length of the registers of PLL, PHY. Some
   revisions require the PHY regulator base address, whereas others require the
   PHY lane base address. See below for each PHY revision.
@@ -98,7 +100,7 @@ Required properties:
   * "dsi_pll"
   * "dsi_phy"
   * "dsi_phy_regulator"
-  For DSI 14nm and 10nm PHYs:
+  For DSI 14nm, 10nm and 7nm PHYs:
   * "dsi_pll"
   * "dsi_phy"
   * "dsi_phy_lane"
@@ -116,7 +118,7 @@ Required properties:
 - vcca-supply: phandle to vcca regulator device node
   For 14nm PHY:
 - vcca-supply: phandle to vcca regulator device node
-  For 10nm PHY:
+  For 10nm and 7nm PHY:
 - vdds-supply: phandle to vdds regulator device node
 
 Optional properties:
diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 6deaa7d01654..82bbc67228fe 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -110,3 +110,10 @@ config DRM_MSM_DSI_10NM_PHY
 	default y
 	help
 	  Choose this option if DSI PHY on SDM845 is used on the platform.
+
+config DRM_MSM_DSI_7NM_PHY
+	bool "Enable DSI 7nm PHY driver in MSM DRM (used by SM8150)"
+	depends on DRM_MSM_DSI
+	default y
+	help
+	  Choose this option if DSI PHY on SM8150 is used on the platform.
diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 42f8aae28b31..c65cdd6397a3 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -119,6 +119,7 @@ msm-$(CONFIG_DRM_MSM_DSI_20NM_PHY) += dsi/phy/dsi_phy_20nm.o
 msm-$(CONFIG_DRM_MSM_DSI_28NM_8960_PHY) += dsi/phy/dsi_phy_28nm_8960.o
 msm-$(CONFIG_DRM_MSM_DSI_14NM_PHY) += dsi/phy/dsi_phy_14nm.o
 msm-$(CONFIG_DRM_MSM_DSI_10NM_PHY) += dsi/phy/dsi_phy_10nm.o
+msm-$(CONFIG_DRM_MSM_DSI_7NM_PHY) += dsi/phy/dsi_phy_7nm.o
 
 ifeq ($(CONFIG_DRM_MSM_DSI_PLL),y)
 msm-y += dsi/pll/dsi_pll.o
@@ -126,6 +127,7 @@ msm-$(CONFIG_DRM_MSM_DSI_28NM_PHY) += dsi/pll/dsi_pll_28nm.o
 msm-$(CONFIG_DRM_MSM_DSI_28NM_8960_PHY) += dsi/pll/dsi_pll_28nm_8960.o
 msm-$(CONFIG_DRM_MSM_DSI_14NM_PHY) += dsi/pll/dsi_pll_14nm.o
 msm-$(CONFIG_DRM_MSM_DSI_10NM_PHY) += dsi/pll/dsi_pll_10nm.o
+msm-$(CONFIG_DRM_MSM_DSI_7NM_PHY) += dsi/pll/dsi_pll_7nm.o
 endif
 
 obj-$(CONFIG_DRM_MSM)	+= msm.o
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 4de771d6f0be..78ef5d4ed922 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -30,6 +30,8 @@ enum msm_dsi_phy_type {
 	MSM_DSI_PHY_28NM_8960,
 	MSM_DSI_PHY_14NM,
 	MSM_DSI_PHY_10NM,
+	MSM_DSI_PHY_7NM,
+	MSM_DSI_PHY_7NM_V4_1,
 	MSM_DSI_PHY_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
index 8e536e060070..50eb4d1b8fdd 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
@@ -1886,5 +1886,428 @@ static inline uint32_t REG_DSI_10nm_PHY_LN_TX_DCTRL(uint32_t i0) { return 0x0000
 
 #define REG_DSI_10nm_PHY_PLL_COMMON_STATUS_ONE			0x000001a0
 
+#define REG_DSI_7nm_PHY_CMN_REVISION_ID0			0x00000000
+
+#define REG_DSI_7nm_PHY_CMN_REVISION_ID1			0x00000004
+
+#define REG_DSI_7nm_PHY_CMN_REVISION_ID2			0x00000008
+
+#define REG_DSI_7nm_PHY_CMN_REVISION_ID3			0x0000000c
+
+#define REG_DSI_7nm_PHY_CMN_CLK_CFG0				0x00000010
+
+#define REG_DSI_7nm_PHY_CMN_CLK_CFG1				0x00000014
+
+#define REG_DSI_7nm_PHY_CMN_GLBL_CTRL				0x00000018
+
+#define REG_DSI_7nm_PHY_CMN_RBUF_CTRL				0x0000001c
+
+#define REG_DSI_7nm_PHY_CMN_VREG_CTRL_0				0x00000020
+
+#define REG_DSI_7nm_PHY_CMN_CTRL_0				0x00000024
+
+#define REG_DSI_7nm_PHY_CMN_CTRL_1				0x00000028
+
+#define REG_DSI_7nm_PHY_CMN_CTRL_2				0x0000002c
+
+#define REG_DSI_7nm_PHY_CMN_CTRL_3				0x00000030
+
+#define REG_DSI_7nm_PHY_CMN_LANE_CFG0				0x00000034
+
+#define REG_DSI_7nm_PHY_CMN_LANE_CFG1				0x00000038
+
+#define REG_DSI_7nm_PHY_CMN_PLL_CNTRL				0x0000003c
+
+#define REG_DSI_7nm_PHY_CMN_DPHY_SOT				0x00000040
+
+#define REG_DSI_7nm_PHY_CMN_LANE_CTRL0				0x000000a0
+
+#define REG_DSI_7nm_PHY_CMN_LANE_CTRL1				0x000000a4
+
+#define REG_DSI_7nm_PHY_CMN_LANE_CTRL2				0x000000a8
+
+#define REG_DSI_7nm_PHY_CMN_LANE_CTRL3				0x000000ac
+
+#define REG_DSI_7nm_PHY_CMN_LANE_CTRL4				0x000000b0
+
+#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_0			0x000000b4
+
+#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_1			0x000000b8
+
+#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_2			0x000000bc
+
+#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_3			0x000000c0
+
+#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_4			0x000000c4
+
+#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_5			0x000000c8
+
+#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_6			0x000000cc
+
+#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_7			0x000000d0
+
+#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_8			0x000000d4
+
+#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_9			0x000000d8
+
+#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_10			0x000000dc
+
+#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_11			0x000000e0
+
+#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_12			0x000000e4
+
+#define REG_DSI_7nm_PHY_CMN_TIMING_CTRL_13			0x000000e8
+
+#define REG_DSI_7nm_PHY_CMN_GLBL_HSTX_STR_CTRL_0		0x000000ec
+
+#define REG_DSI_7nm_PHY_CMN_GLBL_HSTX_STR_CTRL_1		0x000000f0
+
+#define REG_DSI_7nm_PHY_CMN_GLBL_RESCODE_OFFSET_TOP_CTRL	0x000000f4
+
+#define REG_DSI_7nm_PHY_CMN_GLBL_RESCODE_OFFSET_BOT_CTRL	0x000000f8
+
+#define REG_DSI_7nm_PHY_CMN_GLBL_RESCODE_OFFSET_MID_CTRL	0x000000fc
+
+#define REG_DSI_7nm_PHY_CMN_GLBL_LPTX_STR_CTRL			0x00000100
+
+#define REG_DSI_7nm_PHY_CMN_GLBL_PEMPH_CTRL_0			0x00000104
+
+#define REG_DSI_7nm_PHY_CMN_GLBL_PEMPH_CTRL_1			0x00000108
+
+#define REG_DSI_7nm_PHY_CMN_GLBL_STR_SWI_CAL_SEL_CTRL		0x0000010c
+
+#define REG_DSI_7nm_PHY_CMN_VREG_CTRL_1				0x00000110
+
+#define REG_DSI_7nm_PHY_CMN_CTRL_4				0x00000114
+
+#define REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE4			0x00000128
+
+#define REG_DSI_7nm_PHY_CMN_PHY_STATUS				0x00000140
+
+#define REG_DSI_7nm_PHY_CMN_LANE_STATUS0			0x00000148
+
+#define REG_DSI_7nm_PHY_CMN_LANE_STATUS1			0x0000014c
+
+static inline uint32_t REG_DSI_7nm_PHY_LN(uint32_t i0) { return 0x00000000 + 0x80*i0; }
+
+static inline uint32_t REG_DSI_7nm_PHY_LN_CFG0(uint32_t i0) { return 0x00000000 + 0x80*i0; }
+
+static inline uint32_t REG_DSI_7nm_PHY_LN_CFG1(uint32_t i0) { return 0x00000004 + 0x80*i0; }
+
+static inline uint32_t REG_DSI_7nm_PHY_LN_CFG2(uint32_t i0) { return 0x00000008 + 0x80*i0; }
+
+static inline uint32_t REG_DSI_7nm_PHY_LN_TEST_DATAPATH(uint32_t i0) { return 0x0000000c + 0x80*i0; }
+
+static inline uint32_t REG_DSI_7nm_PHY_LN_PIN_SWAP(uint32_t i0) { return 0x00000010 + 0x80*i0; }
+
+static inline uint32_t REG_DSI_7nm_PHY_LN_LPRX_CTRL(uint32_t i0) { return 0x00000014 + 0x80*i0; }
+
+static inline uint32_t REG_DSI_7nm_PHY_LN_TX_DCTRL(uint32_t i0) { return 0x00000018 + 0x80*i0; }
+
+#define REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_ONE			0x00000000
+
+#define REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_TWO			0x00000004
+
+#define REG_DSI_7nm_PHY_PLL_INT_LOOP_SETTINGS			0x00000008
+
+#define REG_DSI_7nm_PHY_PLL_INT_LOOP_SETTINGS_TWO		0x0000000c
+
+#define REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_THREE		0x00000010
+
+#define REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_FOUR		0x00000014
+
+#define REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_FIVE		0x00000018
+
+#define REG_DSI_7nm_PHY_PLL_INT_LOOP_CONTROLS			0x0000001c
+
+#define REG_DSI_7nm_PHY_PLL_DSM_DIVIDER				0x00000020
+
+#define REG_DSI_7nm_PHY_PLL_FEEDBACK_DIVIDER			0x00000024
+
+#define REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES			0x00000028
+
+#define REG_DSI_7nm_PHY_PLL_FREQ_UPDATE_CONTROL_OVERRIDES	0x0000002c
+
+#define REG_DSI_7nm_PHY_PLL_CMODE				0x00000030
+
+#define REG_DSI_7nm_PHY_PLL_PSM_CTRL				0x00000034
+
+#define REG_DSI_7nm_PHY_PLL_RSM_CTRL				0x00000038
+
+#define REG_DSI_7nm_PHY_PLL_VCO_TUNE_MAP			0x0000003c
+
+#define REG_DSI_7nm_PHY_PLL_PLL_CNTRL				0x00000040
+
+#define REG_DSI_7nm_PHY_PLL_CALIBRATION_SETTINGS		0x00000044
+
+#define REG_DSI_7nm_PHY_PLL_BAND_SEL_CAL_TIMER_LOW		0x00000048
+
+#define REG_DSI_7nm_PHY_PLL_BAND_SEL_CAL_TIMER_HIGH		0x0000004c
+
+#define REG_DSI_7nm_PHY_PLL_BAND_SEL_CAL_SETTINGS		0x00000050
+
+#define REG_DSI_7nm_PHY_PLL_BAND_SEL_MIN			0x00000054
+
+#define REG_DSI_7nm_PHY_PLL_BAND_SEL_MAX			0x00000058
+
+#define REG_DSI_7nm_PHY_PLL_BAND_SEL_PFILT			0x0000005c
+
+#define REG_DSI_7nm_PHY_PLL_BAND_SEL_IFILT			0x00000060
+
+#define REG_DSI_7nm_PHY_PLL_BAND_SEL_CAL_SETTINGS_TWO		0x00000064
+
+#define REG_DSI_7nm_PHY_PLL_BAND_SEL_CAL_SETTINGS_THREE		0x00000068
+
+#define REG_DSI_7nm_PHY_PLL_BAND_SEL_CAL_SETTINGS_FOUR		0x0000006c
+
+#define REG_DSI_7nm_PHY_PLL_BAND_SEL_ICODE_HIGH			0x00000070
+
+#define REG_DSI_7nm_PHY_PLL_BAND_SEL_ICODE_LOW			0x00000074
+
+#define REG_DSI_7nm_PHY_PLL_FREQ_DETECT_SETTINGS_ONE		0x00000078
+
+#define REG_DSI_7nm_PHY_PLL_FREQ_DETECT_THRESH			0x0000007c
+
+#define REG_DSI_7nm_PHY_PLL_FREQ_DET_REFCLK_HIGH		0x00000080
+
+#define REG_DSI_7nm_PHY_PLL_FREQ_DET_REFCLK_LOW			0x00000084
+
+#define REG_DSI_7nm_PHY_PLL_FREQ_DET_PLLCLK_HIGH		0x00000088
+
+#define REG_DSI_7nm_PHY_PLL_FREQ_DET_PLLCLK_LOW			0x0000008c
+
+#define REG_DSI_7nm_PHY_PLL_PFILT				0x00000090
+
+#define REG_DSI_7nm_PHY_PLL_IFILT				0x00000094
+
+#define REG_DSI_7nm_PHY_PLL_PLL_GAIN				0x00000098
+
+#define REG_DSI_7nm_PHY_PLL_ICODE_LOW				0x0000009c
+
+#define REG_DSI_7nm_PHY_PLL_ICODE_HIGH				0x000000a0
+
+#define REG_DSI_7nm_PHY_PLL_LOCKDET				0x000000a4
+
+#define REG_DSI_7nm_PHY_PLL_OUTDIV				0x000000a8
+
+#define REG_DSI_7nm_PHY_PLL_FASTLOCK_CONTROL			0x000000ac
+
+#define REG_DSI_7nm_PHY_PLL_PASS_OUT_OVERRIDE_ONE		0x000000b0
+
+#define REG_DSI_7nm_PHY_PLL_PASS_OUT_OVERRIDE_TWO		0x000000b4
+
+#define REG_DSI_7nm_PHY_PLL_CORE_OVERRIDE			0x000000b8
+
+#define REG_DSI_7nm_PHY_PLL_CORE_INPUT_OVERRIDE			0x000000bc
+
+#define REG_DSI_7nm_PHY_PLL_RATE_CHANGE				0x000000c0
+
+#define REG_DSI_7nm_PHY_PLL_PLL_DIGITAL_TIMERS			0x000000c4
+
+#define REG_DSI_7nm_PHY_PLL_PLL_DIGITAL_TIMERS_TWO		0x000000c8
+
+#define REG_DSI_7nm_PHY_PLL_DECIMAL_DIV_START			0x000000cc
+
+#define REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_LOW			0x000000d0
+
+#define REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_MID			0x000000d4
+
+#define REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_HIGH			0x000000d8
+
+#define REG_DSI_7nm_PHY_PLL_DEC_FRAC_MUXES			0x000000dc
+
+#define REG_DSI_7nm_PHY_PLL_DECIMAL_DIV_START_1			0x000000e0
+
+#define REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_LOW_1		0x000000e4
+
+#define REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_MID_1		0x000000e8
+
+#define REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_HIGH_1		0x000000ec
+
+#define REG_DSI_7nm_PHY_PLL_DECIMAL_DIV_START_2			0x000000f0
+
+#define REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_LOW_2		0x000000f4
+
+#define REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_MID_2		0x000000f8
+
+#define REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_HIGH_2		0x000000fc
+
+#define REG_DSI_7nm_PHY_PLL_MASH_CONTROL			0x00000100
+
+#define REG_DSI_7nm_PHY_PLL_SSC_STEPSIZE_LOW			0x00000104
+
+#define REG_DSI_7nm_PHY_PLL_SSC_STEPSIZE_HIGH			0x00000108
+
+#define REG_DSI_7nm_PHY_PLL_SSC_DIV_PER_LOW			0x0000010c
+
+#define REG_DSI_7nm_PHY_PLL_SSC_DIV_PER_HIGH			0x00000110
+
+#define REG_DSI_7nm_PHY_PLL_SSC_ADJPER_LOW			0x00000114
+
+#define REG_DSI_7nm_PHY_PLL_SSC_ADJPER_HIGH			0x00000118
+
+#define REG_DSI_7nm_PHY_PLL_SSC_MUX_CONTROL			0x0000011c
+
+#define REG_DSI_7nm_PHY_PLL_SSC_STEPSIZE_LOW_1			0x00000120
+
+#define REG_DSI_7nm_PHY_PLL_SSC_STEPSIZE_HIGH_1			0x00000124
+
+#define REG_DSI_7nm_PHY_PLL_SSC_DIV_PER_LOW_1			0x00000128
+
+#define REG_DSI_7nm_PHY_PLL_SSC_DIV_PER_HIGH_1			0x0000012c
+
+#define REG_DSI_7nm_PHY_PLL_SSC_ADJPER_LOW_1			0x00000130
+
+#define REG_DSI_7nm_PHY_PLL_SSC_ADJPER_HIGH_1			0x00000134
+
+#define REG_DSI_7nm_PHY_PLL_SSC_STEPSIZE_LOW_2			0x00000138
+
+#define REG_DSI_7nm_PHY_PLL_SSC_STEPSIZE_HIGH_2			0x0000013c
+
+#define REG_DSI_7nm_PHY_PLL_SSC_DIV_PER_LOW_2			0x00000140
+
+#define REG_DSI_7nm_PHY_PLL_SSC_DIV_PER_HIGH_2			0x00000144
+
+#define REG_DSI_7nm_PHY_PLL_SSC_ADJPER_LOW_2			0x00000148
+
+#define REG_DSI_7nm_PHY_PLL_SSC_ADJPER_HIGH_2			0x0000014c
+
+#define REG_DSI_7nm_PHY_PLL_SSC_CONTROL				0x00000150
+
+#define REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE			0x00000154
+
+#define REG_DSI_7nm_PHY_PLL_PLL_LOCKDET_RATE_1			0x00000158
+
+#define REG_DSI_7nm_PHY_PLL_PLL_LOCKDET_RATE_2			0x0000015c
+
+#define REG_DSI_7nm_PHY_PLL_PLL_PROP_GAIN_RATE_1		0x00000160
+
+#define REG_DSI_7nm_PHY_PLL_PLL_PROP_GAIN_RATE_2		0x00000164
+
+#define REG_DSI_7nm_PHY_PLL_PLL_BAND_SEL_RATE_1			0x00000168
+
+#define REG_DSI_7nm_PHY_PLL_PLL_BAND_SEL_RATE_2			0x0000016c
+
+#define REG_DSI_7nm_PHY_PLL_PLL_INT_GAIN_IFILT_BAND_1		0x00000170
+
+#define REG_DSI_7nm_PHY_PLL_PLL_INT_GAIN_IFILT_BAND_2		0x00000174
+
+#define REG_DSI_7nm_PHY_PLL_PLL_FL_INT_GAIN_PFILT_BAND_1	0x00000178
+
+#define REG_DSI_7nm_PHY_PLL_PLL_FL_INT_GAIN_PFILT_BAND_2	0x0000017c
+
+#define REG_DSI_7nm_PHY_PLL_PLL_FASTLOCK_EN_BAND		0x00000180
+
+#define REG_DSI_7nm_PHY_PLL_FREQ_TUNE_ACCUM_INIT_MID		0x00000184
+
+#define REG_DSI_7nm_PHY_PLL_FREQ_TUNE_ACCUM_INIT_HIGH		0x00000188
+
+#define REG_DSI_7nm_PHY_PLL_FREQ_TUNE_ACCUM_INIT_MUX		0x0000018c
+
+#define REG_DSI_7nm_PHY_PLL_PLL_LOCK_OVERRIDE			0x00000190
+
+#define REG_DSI_7nm_PHY_PLL_PLL_LOCK_DELAY			0x00000194
+
+#define REG_DSI_7nm_PHY_PLL_PLL_LOCK_MIN_DELAY			0x00000198
+
+#define REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS			0x0000019c
+
+#define REG_DSI_7nm_PHY_PLL_SPARE_AND_JPC_OVERRIDES		0x000001a0
+
+#define REG_DSI_7nm_PHY_PLL_BIAS_CONTROL_1			0x000001a4
+
+#define REG_DSI_7nm_PHY_PLL_BIAS_CONTROL_2			0x000001a8
+
+#define REG_DSI_7nm_PHY_PLL_ALOG_OBSV_BUS_CTRL_1		0x000001ac
+
+#define REG_DSI_7nm_PHY_PLL_COMMON_STATUS_ONE			0x000001b0
+
+#define REG_DSI_7nm_PHY_PLL_COMMON_STATUS_TWO			0x000001b4
+
+#define REG_DSI_7nm_PHY_PLL_BAND_SEL_CAL			0x000001b8
+
+#define REG_DSI_7nm_PHY_PLL_ICODE_ACCUM_STATUS_LOW		0x000001bc
+
+#define REG_DSI_7nm_PHY_PLL_ICODE_ACCUM_STATUS_HIGH		0x000001c0
+
+#define REG_DSI_7nm_PHY_PLL_FD_OUT_LOW				0x000001c4
+
+#define REG_DSI_7nm_PHY_PLL_FD_OUT_HIGH				0x000001c8
+
+#define REG_DSI_7nm_PHY_PLL_ALOG_OBSV_BUS_STATUS_1		0x000001cc
+
+#define REG_DSI_7nm_PHY_PLL_PLL_MISC_CONFIG			0x000001d0
+
+#define REG_DSI_7nm_PHY_PLL_FLL_CONFIG				0x000001d4
+
+#define REG_DSI_7nm_PHY_PLL_FLL_FREQ_ACQ_TIME			0x000001d8
+
+#define REG_DSI_7nm_PHY_PLL_FLL_CODE0				0x000001dc
+
+#define REG_DSI_7nm_PHY_PLL_FLL_CODE1				0x000001e0
+
+#define REG_DSI_7nm_PHY_PLL_FLL_GAIN0				0x000001e4
+
+#define REG_DSI_7nm_PHY_PLL_FLL_GAIN1				0x000001e8
+
+#define REG_DSI_7nm_PHY_PLL_SW_RESET				0x000001ec
+
+#define REG_DSI_7nm_PHY_PLL_FAST_PWRUP				0x000001f0
+
+#define REG_DSI_7nm_PHY_PLL_LOCKTIME0				0x000001f4
+
+#define REG_DSI_7nm_PHY_PLL_LOCKTIME1				0x000001f8
+
+#define REG_DSI_7nm_PHY_PLL_DEBUG_BUS_SEL			0x000001fc
+
+#define REG_DSI_7nm_PHY_PLL_DEBUG_BUS0				0x00000200
+
+#define REG_DSI_7nm_PHY_PLL_DEBUG_BUS1				0x00000204
+
+#define REG_DSI_7nm_PHY_PLL_DEBUG_BUS2				0x00000208
+
+#define REG_DSI_7nm_PHY_PLL_DEBUG_BUS3				0x0000020c
+
+#define REG_DSI_7nm_PHY_PLL_ANALOG_FLL_CONTROL_OVERRIDES	0x00000210
+
+#define REG_DSI_7nm_PHY_PLL_VCO_CONFIG				0x00000214
+
+#define REG_DSI_7nm_PHY_PLL_VCO_CAL_CODE1_MODE0_STATUS		0x00000218
+
+#define REG_DSI_7nm_PHY_PLL_VCO_CAL_CODE1_MODE1_STATUS		0x0000021c
+
+#define REG_DSI_7nm_PHY_PLL_RESET_SM_STATUS			0x00000220
+
+#define REG_DSI_7nm_PHY_PLL_TDC_OFFSET				0x00000224
+
+#define REG_DSI_7nm_PHY_PLL_PS3_PWRDOWN_CONTROLS		0x00000228
+
+#define REG_DSI_7nm_PHY_PLL_PS4_PWRDOWN_CONTROLS		0x0000022c
+
+#define REG_DSI_7nm_PHY_PLL_PLL_RST_CONTROLS			0x00000230
+
+#define REG_DSI_7nm_PHY_PLL_GEAR_BAND_SELECT_CONTROLS		0x00000234
+
+#define REG_DSI_7nm_PHY_PLL_PSM_CLK_CONTROLS			0x00000238
+
+#define REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES_2			0x0000023c
+
+#define REG_DSI_7nm_PHY_PLL_VCO_CONFIG_1			0x00000240
+
+#define REG_DSI_7nm_PHY_PLL_VCO_CONFIG_2			0x00000244
+
+#define REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS_1			0x00000248
+
+#define REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS_2			0x0000024c
+
+#define REG_DSI_7nm_PHY_PLL_CMODE_1				0x00000250
+
+#define REG_DSI_7nm_PHY_PLL_CMODE_2				0x00000254
+
+#define REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_FIVE_1		0x00000258
+
+#define REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_FIVE_2		0x0000025c
+
+#define REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE			0x00000260
 
 #endif /* DSI_XML */
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 009f5b843dd1..e8c1a727179c 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -364,6 +364,102 @@ int msm_dsi_dphy_timing_calc_v3(struct msm_dsi_dphy_timing *timing,
 	return 0;
 }
 
+int msm_dsi_dphy_timing_calc_v4(struct msm_dsi_dphy_timing *timing,
+	struct msm_dsi_phy_clk_request *clk_req)
+{
+	const unsigned long bit_rate = clk_req->bitclk_rate;
+	const unsigned long esc_rate = clk_req->escclk_rate;
+	s32 ui, ui_x8;
+	s32 tmax, tmin;
+	s32 pcnt_clk_prep = 50;
+	s32 pcnt_clk_zero = 2;
+	s32 pcnt_clk_trail = 30;
+	s32 pcnt_hs_prep = 50;
+	s32 pcnt_hs_zero = 10;
+	s32 pcnt_hs_trail = 30;
+	s32 pcnt_hs_exit = 10;
+	s32 coeff = 1000; /* Precision, should avoid overflow */
+	s32 hb_en;
+	s32 temp;
+
+	if (!bit_rate || !esc_rate)
+		return -EINVAL;
+
+	hb_en = 0;
+
+	ui = mult_frac(NSEC_PER_MSEC, coeff, bit_rate / 1000);
+	ui_x8 = ui << 3;
+
+	/* TODO: verify these calculations against latest downstream driver
+	 * everything except clk_post/clk_pre uses calculations from v3 based
+	 * on the downstream driver having the same calculations for v3 and v4
+	 */
+
+	temp = S_DIV_ROUND_UP(38 * coeff, ui_x8);
+	tmin = max_t(s32, temp, 0);
+	temp = (95 * coeff) / ui_x8;
+	tmax = max_t(s32, temp, 0);
+	timing->clk_prepare = linear_inter(tmax, tmin, pcnt_clk_prep, 0, false);
+
+	temp = 300 * coeff - (timing->clk_prepare << 3) * ui;
+	tmin = S_DIV_ROUND_UP(temp, ui_x8) - 1;
+	tmax = (tmin > 255) ? 511 : 255;
+	timing->clk_zero = linear_inter(tmax, tmin, pcnt_clk_zero, 0, false);
+
+	tmin = DIV_ROUND_UP(60 * coeff + 3 * ui, ui_x8);
+	temp = 105 * coeff + 12 * ui - 20 * coeff;
+	tmax = (temp + 3 * ui) / ui_x8;
+	timing->clk_trail = linear_inter(tmax, tmin, pcnt_clk_trail, 0, false);
+
+	temp = S_DIV_ROUND_UP(40 * coeff + 4 * ui, ui_x8);
+	tmin = max_t(s32, temp, 0);
+	temp = (85 * coeff + 6 * ui) / ui_x8;
+	tmax = max_t(s32, temp, 0);
+	timing->hs_prepare = linear_inter(tmax, tmin, pcnt_hs_prep, 0, false);
+
+	temp = 145 * coeff + 10 * ui - (timing->hs_prepare << 3) * ui;
+	tmin = S_DIV_ROUND_UP(temp, ui_x8) - 1;
+	tmax = 255;
+	timing->hs_zero = linear_inter(tmax, tmin, pcnt_hs_zero, 0, false);
+
+	tmin = DIV_ROUND_UP(60 * coeff + 4 * ui, ui_x8) - 1;
+	temp = 105 * coeff + 12 * ui - 20 * coeff;
+	tmax = (temp / ui_x8) - 1;
+	timing->hs_trail = linear_inter(tmax, tmin, pcnt_hs_trail, 0, false);
+
+	temp = 50 * coeff + ((hb_en << 2) - 8) * ui;
+	timing->hs_rqst = S_DIV_ROUND_UP(temp, ui_x8);
+
+	tmin = DIV_ROUND_UP(100 * coeff, ui_x8) - 1;
+	tmax = 255;
+	timing->hs_exit = linear_inter(tmax, tmin, pcnt_hs_exit, 0, false);
+
+	/* recommended min
+	 * = roundup((mipi_min_ns + t_hs_trail_ns)/(16*bit_clk_ns), 0) - 1
+	 */
+	temp = 60 * coeff + 52 * ui + + (timing->hs_trail + 1) * ui_x8;
+	tmin = DIV_ROUND_UP(temp, 16 * ui) - 1;
+	tmax = 255;
+	timing->shared_timings.clk_post = linear_inter(tmax, tmin, 5, 0, false);
+
+	/* recommended min
+	 * val1 = (tlpx_ns + clk_prepare_ns + clk_zero_ns + hs_rqst_ns)
+	 * val2 = (16 * bit_clk_ns)
+	 * final = roundup(val1/val2, 0) - 1
+	 */
+	temp = 52 * coeff + (timing->clk_prepare + timing->clk_zero + 1) * ui_x8 + 54 * coeff;
+	tmin = DIV_ROUND_UP(temp, 16 * ui) - 1;
+	tmax = 255;
+	timing->shared_timings.clk_pre = DIV_ROUND_UP((tmax - tmin) * 125, 10000) + tmin;
+
+	DBG("%d, %d, %d, %d, %d, %d, %d, %d, %d, %d",
+		timing->shared_timings.clk_pre, timing->shared_timings.clk_post,
+		timing->clk_zero, timing->clk_trail, timing->clk_prepare, timing->hs_exit,
+		timing->hs_zero, timing->hs_prepare, timing->hs_trail, timing->hs_rqst);
+
+	return 0;
+}
+
 void msm_dsi_phy_set_src_pll(struct msm_dsi_phy *phy, int pll_id, u32 reg,
 				u32 bit_mask)
 {
@@ -507,6 +603,12 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 	  .data = &dsi_phy_10nm_cfgs },
 	{ .compatible = "qcom,dsi-phy-10nm-8998",
 	  .data = &dsi_phy_10nm_8998_cfgs },
+#endif
+#ifdef CONFIG_DRM_MSM_DSI_7NM_PHY
+	{ .compatible = "qcom,dsi-phy-7nm",
+	  .data = &dsi_phy_7nm_cfgs },
+	{ .compatible = "qcom,dsi-phy-7nm-8150",
+	  .data = &dsi_phy_7nm_8150_cfgs },
 #endif
 	{}
 };
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 886a9e3b44b5..d2bd74b6f357 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -48,6 +48,8 @@ extern const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs;
 
 struct msm_dsi_dphy_timing {
 	u32 clk_zero;
@@ -100,6 +102,8 @@ int msm_dsi_dphy_timing_calc_v2(struct msm_dsi_dphy_timing *timing,
 				struct msm_dsi_phy_clk_request *clk_req);
 int msm_dsi_dphy_timing_calc_v3(struct msm_dsi_dphy_timing *timing,
 				struct msm_dsi_phy_clk_request *clk_req);
+int msm_dsi_dphy_timing_calc_v4(struct msm_dsi_dphy_timing *timing,
+				struct msm_dsi_phy_clk_request *clk_req);
 void msm_dsi_phy_set_src_pll(struct msm_dsi_phy *phy, int pll_id, u32 reg,
 				u32 bit_mask);
 int msm_dsi_phy_init_common(struct msm_dsi_phy *phy);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
new file mode 100644
index 000000000000..255b5f5ab2ce
--- /dev/null
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -0,0 +1,255 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0
+ * Copyright (c) 2018, The Linux Foundation
+ */
+
+#include <linux/iopoll.h>
+
+#include "dsi_phy.h"
+#include "dsi.xml.h"
+
+static int dsi_phy_hw_v4_0_is_pll_on(struct msm_dsi_phy *phy)
+{
+	void __iomem *base = phy->base;
+	u32 data = 0;
+
+	data = dsi_phy_read(base + REG_DSI_7nm_PHY_CMN_PLL_CNTRL);
+	mb(); /* make sure read happened */
+
+	return (data & BIT(0));
+}
+
+static void dsi_phy_hw_v4_0_config_lpcdrx(struct msm_dsi_phy *phy, bool enable)
+{
+	void __iomem *lane_base = phy->lane_base;
+	int phy_lane_0 = 0;	/* TODO: Support all lane swap configs */
+
+	/*
+	 * LPRX and CDRX need to enabled only for physical data lane
+	 * corresponding to the logical data lane 0
+	 */
+	if (enable)
+		dsi_phy_write(lane_base +
+			      REG_DSI_7nm_PHY_LN_LPRX_CTRL(phy_lane_0), 0x3);
+	else
+		dsi_phy_write(lane_base +
+			      REG_DSI_7nm_PHY_LN_LPRX_CTRL(phy_lane_0), 0);
+}
+
+static void dsi_phy_hw_v4_0_lane_settings(struct msm_dsi_phy *phy)
+{
+	int i;
+	const u8 tx_dctrl_0[] = { 0x00, 0x00, 0x00, 0x04, 0x01 };
+	const u8 tx_dctrl_1[] = { 0x40, 0x40, 0x40, 0x46, 0x41 };
+	const u8 *tx_dctrl = tx_dctrl_0;
+	void __iomem *lane_base = phy->lane_base;
+
+	if (phy->cfg->type == MSM_DSI_PHY_7NM_V4_1)
+		tx_dctrl = tx_dctrl_1;
+
+	/* Strength ctrl settings */
+	for (i = 0; i < 5; i++) {
+		/*
+		 * Disable LPRX and CDRX for all lanes. And later on, it will
+		 * be only enabled for the physical data lane corresponding
+		 * to the logical data lane 0
+		 */
+		dsi_phy_write(lane_base + REG_DSI_7nm_PHY_LN_LPRX_CTRL(i), 0);
+		dsi_phy_write(lane_base + REG_DSI_7nm_PHY_LN_PIN_SWAP(i), 0x0);
+	}
+
+	dsi_phy_hw_v4_0_config_lpcdrx(phy, true);
+
+	/* other settings */
+	for (i = 0; i < 5; i++) {
+		dsi_phy_write(lane_base + REG_DSI_7nm_PHY_LN_CFG0(i), 0x0);
+		dsi_phy_write(lane_base + REG_DSI_7nm_PHY_LN_CFG1(i), 0x0);
+		dsi_phy_write(lane_base + REG_DSI_7nm_PHY_LN_CFG2(i), i == 4 ? 0x8a : 0xa);
+		dsi_phy_write(lane_base + REG_DSI_7nm_PHY_LN_TX_DCTRL(i), tx_dctrl[i]);
+	}
+}
+
+static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
+			      struct msm_dsi_phy_clk_request *clk_req)
+{
+	int ret;
+	u32 status;
+	u32 const delay_us = 5;
+	u32 const timeout_us = 1000;
+	struct msm_dsi_dphy_timing *timing = &phy->timing;
+	void __iomem *base = phy->base;
+	bool less_than_1500_mhz;
+	u32 vreg_ctrl_0, glbl_str_swi_cal_sel_ctrl, glbl_hstx_str_ctrl_0;
+	u32 glbl_rescode_top_ctrl, glbl_rescode_bot_ctrl;
+	u32 data;
+
+	DBG("");
+
+	if (msm_dsi_dphy_timing_calc_v4(timing, clk_req)) {
+		DRM_DEV_ERROR(&phy->pdev->dev,
+			"%s: D-PHY timing calculation failed\n", __func__);
+		return -EINVAL;
+	}
+
+	if (dsi_phy_hw_v4_0_is_pll_on(phy))
+		pr_warn("PLL turned on before configuring PHY\n");
+
+	/* wait for REFGEN READY */
+	ret = readl_poll_timeout_atomic(base + REG_DSI_7nm_PHY_CMN_PHY_STATUS,
+					status, (status & BIT(0)),
+					delay_us, timeout_us);
+	if (ret) {
+		pr_err("Ref gen not ready. Aborting\n");
+		return -EINVAL;
+	}
+
+	/* TODO: CPHY enable path (this is for DPHY only) */
+
+	/* Alter PHY configurations if data rate less than 1.5GHZ*/
+	less_than_1500_mhz = (clk_req->bitclk_rate <= 1500000000);
+
+	if (phy->cfg->type == MSM_DSI_PHY_7NM_V4_1) {
+		vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
+		glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x00;
+		glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x39 :  0x3c;
+		glbl_str_swi_cal_sel_ctrl = 0x00;
+		glbl_hstx_str_ctrl_0 = 0x88;
+	} else {
+		vreg_ctrl_0 = less_than_1500_mhz ? 0x5B : 0x59;
+		glbl_str_swi_cal_sel_ctrl = less_than_1500_mhz ? 0x03 : 0x00;
+		glbl_hstx_str_ctrl_0 = less_than_1500_mhz ? 0x66 : 0x88;
+		glbl_rescode_top_ctrl = 0x03;
+		glbl_rescode_bot_ctrl = 0x3c;
+	}
+
+	/* de-assert digital and pll power down */
+	data = BIT(6) | BIT(5);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_0, data);
+
+	/* Assert PLL core reset */
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_PLL_CNTRL, 0x00);
+
+	/* turn off resync FIFO */
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_RBUF_CTRL, 0x00);
+
+	/* program CMN_CTRL_4 for minor_ver 2 chipsets*/
+	data = dsi_phy_read(base + REG_DSI_7nm_PHY_CMN_REVISION_ID0);
+	data = data & (0xf0);
+	if (data == 0x20)
+		dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_4, 0x04);
+
+	/* Configure PHY lane swap (TODO: we need to calculate this) */
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_LANE_CFG0, 0x21);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_LANE_CFG1, 0x84);
+
+	/* Enable LDO */
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_VREG_CTRL_0, vreg_ctrl_0);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_VREG_CTRL_1, 0x5c);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_3, 0x00);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_STR_SWI_CAL_SEL_CTRL,
+		      glbl_str_swi_cal_sel_ctrl);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_HSTX_STR_CTRL_0,
+		      glbl_hstx_str_ctrl_0);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_PEMPH_CTRL_0, 0x00);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_RESCODE_OFFSET_TOP_CTRL,
+		      glbl_rescode_top_ctrl);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_RESCODE_OFFSET_BOT_CTRL,
+		      glbl_rescode_bot_ctrl);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_LPTX_STR_CTRL, 0x55);
+
+	/* Remove power down from all blocks */
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_0, 0x7f);
+
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_LANE_CTRL0, 0x1f);
+
+	/* Select full-rate mode */
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_2, 0x40);
+
+	ret = msm_dsi_pll_set_usecase(phy->pll, phy->usecase);
+	if (ret) {
+		DRM_DEV_ERROR(&phy->pdev->dev, "%s: set pll usecase failed, %d\n",
+			__func__, ret);
+		return ret;
+	}
+
+	/* DSI PHY timings */
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_0, 0x00);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_1, timing->clk_zero);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_2, timing->clk_prepare);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_3, timing->clk_trail);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_4, timing->hs_exit);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_5, timing->hs_zero);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_6, timing->hs_prepare);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_7, timing->hs_trail);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_8, timing->hs_rqst);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_9, 0x02);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_10, 0x04);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_11, 0x00);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_12,
+		      timing->shared_timings.clk_pre);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_13,
+		      timing->shared_timings.clk_post);
+
+	/* DSI lane settings */
+	dsi_phy_hw_v4_0_lane_settings(phy);
+
+	DBG("DSI%d PHY enabled", phy->id);
+
+	return 0;
+}
+
+static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
+{
+	/* TODO */
+}
+
+static int dsi_7nm_phy_init(struct msm_dsi_phy *phy)
+{
+	struct platform_device *pdev = phy->pdev;
+
+	phy->lane_base = msm_ioremap(pdev, "dsi_phy_lane",
+				     "DSI_PHY_LANE");
+	if (IS_ERR(phy->lane_base)) {
+		DRM_DEV_ERROR(&pdev->dev, "%s: failed to map phy lane base\n",
+			__func__);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
+	.type = MSM_DSI_PHY_7NM_V4_1,
+	.src_pll_truthtable = { {false, false}, {true, false} },
+	.reg_cfg = {
+		.num = 1,
+		.regs = {
+			{"vdds", 36000, 32},
+		},
+	},
+	.ops = {
+		.enable = dsi_7nm_phy_enable,
+		.disable = dsi_7nm_phy_disable,
+		.init = dsi_7nm_phy_init,
+	},
+	.io_start = { 0xae94400, 0xae96400 },
+	.num_dsi_phy = 2,
+};
+
+const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
+	.type = MSM_DSI_PHY_7NM,
+	.src_pll_truthtable = { {false, false}, {true, false} },
+	.reg_cfg = {
+		.num = 1,
+		.regs = {
+			{"vdds", 36000, 32},
+		},
+	},
+	.ops = {
+		.enable = dsi_7nm_phy_enable,
+		.disable = dsi_7nm_phy_disable,
+		.init = dsi_7nm_phy_init,
+	},
+	.io_start = { 0xae94400, 0xae96400 },
+	.num_dsi_phy = 2,
+};
diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll.c
index 4a4aa3c61d71..a45fe95aff49 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll.c
@@ -161,6 +161,10 @@ struct msm_dsi_pll *msm_dsi_pll_init(struct platform_device *pdev,
 	case MSM_DSI_PHY_10NM:
 		pll = msm_dsi_pll_10nm_init(pdev, id);
 		break;
+	case MSM_DSI_PHY_7NM:
+	case MSM_DSI_PHY_7NM_V4_1:
+		pll = msm_dsi_pll_7nm_init(pdev, id);
+		break;
 	default:
 		pll = ERR_PTR(-ENXIO);
 		break;
diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll.h b/drivers/gpu/drm/msm/dsi/pll/dsi_pll.h
index c6a3623f905d..3405982a092c 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll.h
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll.h
@@ -116,5 +116,15 @@ msm_dsi_pll_10nm_init(struct platform_device *pdev, int id)
 	return ERR_PTR(-ENODEV);
 }
 #endif
+#ifdef CONFIG_DRM_MSM_DSI_7NM_PHY
+struct msm_dsi_pll *msm_dsi_pll_7nm_init(struct platform_device *pdev, int id);
+#else
+static inline struct msm_dsi_pll *
+msm_dsi_pll_7nm_init(struct platform_device *pdev, int id)
+{
+	return ERR_PTR(-ENODEV);
+}
+#endif
+
 #endif /* __DSI_PLL_H__ */
 
diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
new file mode 100644
index 000000000000..a3b09514bee2
--- /dev/null
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
@@ -0,0 +1,902 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0
+ * Copyright (c) 2018, The Linux Foundation
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/iopoll.h>
+
+#include "dsi_pll.h"
+#include "dsi.xml.h"
+
+/*
+ * DSI PLL 7nm - clock diagram (eg: DSI0): TODO: updated CPHY diagram
+ *
+ *           dsi0_pll_out_div_clk  dsi0_pll_bit_clk
+ *                              |                |
+ *                              |                |
+ *                 +---------+  |  +----------+  |  +----+
+ *  dsi0vco_clk ---| out_div |--o--| divl_3_0 |--o--| /8 |-- dsi0_phy_pll_out_byteclk
+ *                 +---------+  |  +----------+  |  +----+
+ *                              |                |
+ *                              |                |         dsi0_pll_by_2_bit_clk
+ *                              |                |          |
+ *                              |                |  +----+  |  |\  dsi0_pclk_mux
+ *                              |                |--| /2 |--o--| \   |
+ *                              |                |  +----+     |  \  |  +---------+
+ *                              |                --------------|  |--o--| div_7_4 |-- dsi0_phy_pll_out_dsiclk
+ *                              |------------------------------|  /     +---------+
+ *                              |          +-----+             | /
+ *                              -----------| /4? |--o----------|/
+ *                                         +-----+  |           |
+ *                                                  |           |dsiclk_sel
+ *                                                  |
+ *                                                  dsi0_pll_post_out_div_clk
+ */
+
+#define DSI_BYTE_PLL_CLK		0
+#define DSI_PIXEL_PLL_CLK		1
+#define NUM_PROVIDED_CLKS		2
+
+#define VCO_REF_CLK_RATE		19200000
+
+struct dsi_pll_regs {
+	u32 pll_prop_gain_rate;
+	u32 pll_lockdet_rate;
+	u32 decimal_div_start;
+	u32 frac_div_start_low;
+	u32 frac_div_start_mid;
+	u32 frac_div_start_high;
+	u32 pll_clock_inverters;
+	u32 ssc_stepsize_low;
+	u32 ssc_stepsize_high;
+	u32 ssc_div_per_low;
+	u32 ssc_div_per_high;
+	u32 ssc_adjper_low;
+	u32 ssc_adjper_high;
+	u32 ssc_control;
+};
+
+struct dsi_pll_config {
+	u32 ref_freq;
+	bool div_override;
+	u32 output_div;
+	bool ignore_frac;
+	bool disable_prescaler;
+	bool enable_ssc;
+	bool ssc_center;
+	u32 dec_bits;
+	u32 frac_bits;
+	u32 lock_timer;
+	u32 ssc_freq;
+	u32 ssc_offset;
+	u32 ssc_adj_per;
+	u32 thresh_cycles;
+	u32 refclk_cycles;
+};
+
+struct pll_7nm_cached_state {
+	unsigned long vco_rate;
+	u8 bit_clk_div;
+	u8 pix_clk_div;
+	u8 pll_out_div;
+	u8 pll_mux;
+};
+
+struct dsi_pll_7nm {
+	struct msm_dsi_pll base;
+
+	int id;
+	struct platform_device *pdev;
+
+	void __iomem *phy_cmn_mmio;
+	void __iomem *mmio;
+
+	u64 vco_ref_clk_rate;
+	u64 vco_current_rate;
+
+	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG0 register */
+	spinlock_t postdiv_lock;
+
+	int vco_delay;
+	struct dsi_pll_config pll_configuration;
+	struct dsi_pll_regs reg_setup;
+
+	/* private clocks: */
+	struct clk_hw *out_div_clk_hw;
+	struct clk_hw *bit_clk_hw;
+	struct clk_hw *byte_clk_hw;
+	struct clk_hw *by_2_bit_clk_hw;
+	struct clk_hw *post_out_div_clk_hw;
+	struct clk_hw *pclk_mux_hw;
+	struct clk_hw *out_dsiclk_hw;
+
+	/* clock-provider: */
+	struct clk_hw_onecell_data *hw_data;
+
+	struct pll_7nm_cached_state cached_state;
+
+	enum msm_dsi_phy_usecase uc;
+	struct dsi_pll_7nm *slave;
+};
+
+#define to_pll_7nm(x)	container_of(x, struct dsi_pll_7nm, base)
+
+/*
+ * Global list of private DSI PLL struct pointers. We need this for Dual DSI
+ * mode, where the master PLL's clk_ops needs access the slave's private data
+ */
+static struct dsi_pll_7nm *pll_7nm_list[DSI_MAX];
+
+static void dsi_pll_setup_config(struct dsi_pll_7nm *pll)
+{
+	struct dsi_pll_config *config = &pll->pll_configuration;
+
+	config->ref_freq = pll->vco_ref_clk_rate;
+	config->output_div = 1;
+	config->dec_bits = 8;
+	config->frac_bits = 18;
+	config->lock_timer = 64;
+	config->ssc_freq = 31500;
+	config->ssc_offset = 4800;
+	config->ssc_adj_per = 2;
+	config->thresh_cycles = 32;
+	config->refclk_cycles = 256;
+
+	config->div_override = false;
+	config->ignore_frac = false;
+	config->disable_prescaler = false;
+
+	/* TODO: ssc enable */
+	config->enable_ssc = false;
+	config->ssc_center = 0;
+}
+
+static void dsi_pll_calc_dec_frac(struct dsi_pll_7nm *pll)
+{
+	struct dsi_pll_config *config = &pll->pll_configuration;
+	struct dsi_pll_regs *regs = &pll->reg_setup;
+	u64 fref = pll->vco_ref_clk_rate;
+	u64 pll_freq;
+	u64 divider;
+	u64 dec, dec_multiple;
+	u32 frac;
+	u64 multiplier;
+
+	pll_freq = pll->vco_current_rate;
+
+	if (config->disable_prescaler)
+		divider = fref;
+	else
+		divider = fref * 2;
+
+	multiplier = 1 << config->frac_bits;
+	dec_multiple = div_u64(pll_freq * multiplier, divider);
+	div_u64_rem(dec_multiple, multiplier, &frac);
+
+	dec = div_u64(dec_multiple, multiplier);
+
+	if (pll->base.type != MSM_DSI_PHY_7NM_V4_1)
+		regs->pll_clock_inverters = 0x28;
+	else if (pll_freq <= 1000000000ULL)
+		regs->pll_clock_inverters = 0xa0;
+	else if (pll_freq <= 2500000000ULL)
+		regs->pll_clock_inverters = 0x20;
+	else if (pll_freq <= 3020000000ULL)
+		regs->pll_clock_inverters = 0x00;
+	else
+		regs->pll_clock_inverters = 0x40;
+
+	regs->pll_lockdet_rate = config->lock_timer;
+	regs->decimal_div_start = dec;
+	regs->frac_div_start_low = (frac & 0xff);
+	regs->frac_div_start_mid = (frac & 0xff00) >> 8;
+	regs->frac_div_start_high = (frac & 0x30000) >> 16;
+}
+
+#define SSC_CENTER		BIT(0)
+#define SSC_EN			BIT(1)
+
+static void dsi_pll_calc_ssc(struct dsi_pll_7nm *pll)
+{
+	struct dsi_pll_config *config = &pll->pll_configuration;
+	struct dsi_pll_regs *regs = &pll->reg_setup;
+	u32 ssc_per;
+	u32 ssc_mod;
+	u64 ssc_step_size;
+	u64 frac;
+
+	if (!config->enable_ssc) {
+		DBG("SSC not enabled\n");
+		return;
+	}
+
+	ssc_per = DIV_ROUND_CLOSEST(config->ref_freq, config->ssc_freq) / 2 - 1;
+	ssc_mod = (ssc_per + 1) % (config->ssc_adj_per + 1);
+	ssc_per -= ssc_mod;
+
+	frac = regs->frac_div_start_low |
+			(regs->frac_div_start_mid << 8) |
+			(regs->frac_div_start_high << 16);
+	ssc_step_size = regs->decimal_div_start;
+	ssc_step_size *= (1 << config->frac_bits);
+	ssc_step_size += frac;
+	ssc_step_size *= config->ssc_offset;
+	ssc_step_size *= (config->ssc_adj_per + 1);
+	ssc_step_size = div_u64(ssc_step_size, (ssc_per + 1));
+	ssc_step_size = DIV_ROUND_CLOSEST_ULL(ssc_step_size, 1000000);
+
+	regs->ssc_div_per_low = ssc_per & 0xFF;
+	regs->ssc_div_per_high = (ssc_per & 0xFF00) >> 8;
+	regs->ssc_stepsize_low = (u32)(ssc_step_size & 0xFF);
+	regs->ssc_stepsize_high = (u32)((ssc_step_size & 0xFF00) >> 8);
+	regs->ssc_adjper_low = config->ssc_adj_per & 0xFF;
+	regs->ssc_adjper_high = (config->ssc_adj_per & 0xFF00) >> 8;
+
+	regs->ssc_control = config->ssc_center ? SSC_CENTER : 0;
+
+	pr_debug("SCC: Dec:%d, frac:%llu, frac_bits:%d\n",
+		 regs->decimal_div_start, frac, config->frac_bits);
+	pr_debug("SSC: div_per:0x%X, stepsize:0x%X, adjper:0x%X\n",
+		 ssc_per, (u32)ssc_step_size, config->ssc_adj_per);
+}
+
+static void dsi_pll_ssc_commit(struct dsi_pll_7nm *pll)
+{
+	void __iomem *base = pll->mmio;
+	struct dsi_pll_regs *regs = &pll->reg_setup;
+
+	if (pll->pll_configuration.enable_ssc) {
+		pr_debug("SSC is enabled\n");
+
+		pll_write(base + REG_DSI_7nm_PHY_PLL_SSC_STEPSIZE_LOW_1,
+			  regs->ssc_stepsize_low);
+		pll_write(base + REG_DSI_7nm_PHY_PLL_SSC_STEPSIZE_HIGH_1,
+			  regs->ssc_stepsize_high);
+		pll_write(base + REG_DSI_7nm_PHY_PLL_SSC_DIV_PER_LOW_1,
+			  regs->ssc_div_per_low);
+		pll_write(base + REG_DSI_7nm_PHY_PLL_SSC_DIV_PER_HIGH_1,
+			  regs->ssc_div_per_high);
+		pll_write(base + REG_DSI_7nm_PHY_PLL_SSC_ADJPER_LOW_1,
+			  regs->ssc_adjper_low);
+		pll_write(base + REG_DSI_7nm_PHY_PLL_SSC_ADJPER_HIGH_1,
+			  regs->ssc_adjper_high);
+		pll_write(base + REG_DSI_7nm_PHY_PLL_SSC_CONTROL,
+			  SSC_EN | regs->ssc_control);
+	}
+}
+
+static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
+{
+	void __iomem *base = pll->mmio;
+	u8 analog_controls_five_1 = 0x01, vco_config_1 = 0x00;
+
+	if (pll->base.type == MSM_DSI_PHY_7NM_V4_1) {
+		if (pll->vco_current_rate >= 3100000000ULL)
+			analog_controls_five_1 = 0x03;
+
+		if (pll->vco_current_rate < 1520000000ULL)
+			vco_config_1 = 0x08;
+		else if (pll->vco_current_rate < 2990000000ULL)
+			vco_config_1 = 0x01;
+	}
+
+	pll_write(base + REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_FIVE_1,
+		  analog_controls_five_1);
+	pll_write(base + REG_DSI_7nm_PHY_PLL_VCO_CONFIG_1, vco_config_1);
+	pll_write(base + REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_FIVE, 0x01);
+	pll_write(base + REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_TWO, 0x03);
+	pll_write(base + REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_THREE, 0x00);
+	pll_write(base + REG_DSI_7nm_PHY_PLL_DSM_DIVIDER, 0x00);
+	pll_write(base + REG_DSI_7nm_PHY_PLL_FEEDBACK_DIVIDER, 0x4e);
+	pll_write(base + REG_DSI_7nm_PHY_PLL_CALIBRATION_SETTINGS, 0x40);
+	pll_write(base + REG_DSI_7nm_PHY_PLL_BAND_SEL_CAL_SETTINGS_THREE, 0xba);
+	pll_write(base + REG_DSI_7nm_PHY_PLL_FREQ_DETECT_SETTINGS_ONE, 0x0c);
+	pll_write(base + REG_DSI_7nm_PHY_PLL_OUTDIV, 0x00);
+	pll_write(base + REG_DSI_7nm_PHY_PLL_CORE_OVERRIDE, 0x00);
+	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_DIGITAL_TIMERS_TWO, 0x08);
+	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_PROP_GAIN_RATE_1, 0x0a);
+	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_BAND_SEL_RATE_1, 0xc0);
+	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_INT_GAIN_IFILT_BAND_1, 0x84);
+	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_INT_GAIN_IFILT_BAND_1, 0x82);
+	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_FL_INT_GAIN_PFILT_BAND_1, 0x4c);
+	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCK_OVERRIDE, 0x80);
+	pll_write(base + REG_DSI_7nm_PHY_PLL_PFILT, 0x29);
+	pll_write(base + REG_DSI_7nm_PHY_PLL_PFILT, 0x2f);
+	pll_write(base + REG_DSI_7nm_PHY_PLL_IFILT, 0x2a);
+	pll_write(base + REG_DSI_7nm_PHY_PLL_IFILT,
+		  pll->base.type == MSM_DSI_PHY_7NM_V4_1 ? 0x3f : 0x22);
+
+	if (pll->base.type == MSM_DSI_PHY_7NM_V4_1) {
+		pll_write(base + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE, 0x22);
+		if (pll->slave)
+			pll_write(pll->slave->mmio + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE, 0x22);
+	}
+}
+
+static void dsi_pll_commit(struct dsi_pll_7nm *pll)
+{
+	void __iomem *base = pll->mmio;
+	struct dsi_pll_regs *reg = &pll->reg_setup;
+
+	pll_write(base + REG_DSI_7nm_PHY_PLL_CORE_INPUT_OVERRIDE, 0x12);
+	pll_write(base + REG_DSI_7nm_PHY_PLL_DECIMAL_DIV_START_1, reg->decimal_div_start);
+	pll_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_LOW_1, reg->frac_div_start_low);
+	pll_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_MID_1, reg->frac_div_start_mid);
+	pll_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_HIGH_1, reg->frac_div_start_high);
+	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCKDET_RATE_1, 0x40);
+	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCK_DELAY, 0x06);
+	pll_write(base + REG_DSI_7nm_PHY_PLL_CMODE_1, 0x10); /* TODO: 0x00 for CPHY */
+	pll_write(base + REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS, reg->pll_clock_inverters);
+}
+
+static int dsi_pll_7nm_vco_set_rate(struct clk_hw *hw, unsigned long rate,
+				     unsigned long parent_rate)
+{
+	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
+	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
+
+	DBG("DSI PLL%d rate=%lu, parent's=%lu", pll_7nm->id, rate,
+	    parent_rate);
+
+	pll_7nm->vco_current_rate = rate;
+	pll_7nm->vco_ref_clk_rate = VCO_REF_CLK_RATE;
+
+	dsi_pll_setup_config(pll_7nm);
+
+	dsi_pll_calc_dec_frac(pll_7nm);
+
+	dsi_pll_calc_ssc(pll_7nm);
+
+	dsi_pll_commit(pll_7nm);
+
+	dsi_pll_config_hzindep_reg(pll_7nm);
+
+	dsi_pll_ssc_commit(pll_7nm);
+
+	/* flush, ensure all register writes are done*/
+	wmb();
+
+	return 0;
+}
+
+static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
+{
+	int rc;
+	u32 status = 0;
+	u32 const delay_us = 100;
+	u32 const timeout_us = 5000;
+
+	rc = readl_poll_timeout_atomic(pll->mmio +
+				       REG_DSI_7nm_PHY_PLL_COMMON_STATUS_ONE,
+				       status,
+				       ((status & BIT(0)) > 0),
+				       delay_us,
+				       timeout_us);
+	if (rc)
+		pr_err("DSI PLL(%d) lock failed, status=0x%08x\n",
+		       pll->id, status);
+
+	return rc;
+}
+
+static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
+{
+	u32 data = pll_read(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CTRL_0);
+
+	pll_write(pll->mmio + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES, 0);
+	pll_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CTRL_0, data & ~BIT(5));
+	ndelay(250);
+}
+
+static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
+{
+	u32 data = pll_read(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CTRL_0);
+
+	pll_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CTRL_0, data | BIT(5));
+	pll_write(pll->mmio + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES, 0xc0);
+	ndelay(250);
+}
+
+static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
+{
+	u32 data;
+
+	data = pll_read(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	pll_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CLK_CFG1, data & ~BIT(5));
+}
+
+static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
+{
+	u32 data;
+
+	pll_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CTRL_3, 0x04);
+
+	data = pll_read(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	pll_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_CLK_CFG1,
+		  data | BIT(5) | BIT(4));
+}
+
+static void dsi_pll_phy_dig_reset(struct dsi_pll_7nm *pll)
+{
+	/*
+	 * Reset the PHY digital domain. This would be needed when
+	 * coming out of a CX or analog rail power collapse while
+	 * ensuring that the pads maintain LP00 or LP11 state
+	 */
+	pll_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE4, BIT(0));
+	wmb(); /* Ensure that the reset is deasserted */
+	pll_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE4, 0x0);
+	wmb(); /* Ensure that the reset is deasserted */
+}
+
+static int dsi_pll_7nm_vco_prepare(struct clk_hw *hw)
+{
+	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
+	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
+	int rc;
+
+	dsi_pll_enable_pll_bias(pll_7nm);
+	if (pll_7nm->slave)
+		dsi_pll_enable_pll_bias(pll_7nm->slave);
+
+	/* Start PLL */
+	pll_write(pll_7nm->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_PLL_CNTRL, 0x01);
+
+	/*
+	 * ensure all PLL configurations are written prior to checking
+	 * for PLL lock.
+	 */
+	wmb();
+
+	/* Check for PLL lock */
+	rc = dsi_pll_7nm_lock_status(pll_7nm);
+	if (rc) {
+		pr_err("PLL(%d) lock failed\n", pll_7nm->id);
+		goto error;
+	}
+
+	pll->pll_on = true;
+
+	/*
+	 * assert power on reset for PHY digital in case the PLL is
+	 * enabled after CX of analog domain power collapse. This needs
+	 * to be done before enabling the global clk.
+	 */
+	dsi_pll_phy_dig_reset(pll_7nm);
+	if (pll_7nm->slave)
+		dsi_pll_phy_dig_reset(pll_7nm->slave);
+
+	dsi_pll_enable_global_clk(pll_7nm);
+	if (pll_7nm->slave)
+		dsi_pll_enable_global_clk(pll_7nm->slave);
+
+error:
+	return rc;
+}
+
+static void dsi_pll_disable_sub(struct dsi_pll_7nm *pll)
+{
+	pll_write(pll->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_RBUF_CTRL, 0);
+	dsi_pll_disable_pll_bias(pll);
+}
+
+static void dsi_pll_7nm_vco_unprepare(struct clk_hw *hw)
+{
+	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
+	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
+
+	/*
+	 * To avoid any stray glitches while abruptly powering down the PLL
+	 * make sure to gate the clock using the clock enable bit before
+	 * powering down the PLL
+	 */
+	dsi_pll_disable_global_clk(pll_7nm);
+	pll_write(pll_7nm->phy_cmn_mmio + REG_DSI_7nm_PHY_CMN_PLL_CNTRL, 0);
+	dsi_pll_disable_sub(pll_7nm);
+	if (pll_7nm->slave) {
+		dsi_pll_disable_global_clk(pll_7nm->slave);
+		dsi_pll_disable_sub(pll_7nm->slave);
+	}
+	/* flush, ensure all register writes are done */
+	wmb();
+	pll->pll_on = false;
+}
+
+static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
+						  unsigned long parent_rate)
+{
+	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
+	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
+	void __iomem *base = pll_7nm->mmio;
+	u64 ref_clk = pll_7nm->vco_ref_clk_rate;
+	u64 vco_rate = 0x0;
+	u64 multiplier;
+	u32 frac;
+	u32 dec;
+	u64 pll_freq, tmp64;
+
+	dec = pll_read(base + REG_DSI_7nm_PHY_PLL_DECIMAL_DIV_START_1);
+	dec &= 0xff;
+
+	frac = pll_read(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_LOW_1);
+	frac |= ((pll_read(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_MID_1) &
+		  0xff) << 8);
+	frac |= ((pll_read(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_HIGH_1) &
+		  0x3) << 16);
+
+	/*
+	 * TODO:
+	 *	1. Assumes prescaler is disabled
+	 *	2. Multiplier is 2^18. it should be 2^(num_of_frac_bits)
+	 */
+	multiplier = 1 << 18;
+	pll_freq = dec * (ref_clk * 2);
+	tmp64 = (ref_clk * 2 * frac);
+	pll_freq += div_u64(tmp64, multiplier);
+
+	vco_rate = pll_freq;
+
+	DBG("DSI PLL%d returning vco rate = %lu, dec = %x, frac = %x",
+	    pll_7nm->id, (unsigned long)vco_rate, dec, frac);
+
+	return (unsigned long)vco_rate;
+}
+
+static const struct clk_ops clk_ops_dsi_pll_7nm_vco = {
+	.round_rate = msm_dsi_pll_helper_clk_round_rate,
+	.set_rate = dsi_pll_7nm_vco_set_rate,
+	.recalc_rate = dsi_pll_7nm_vco_recalc_rate,
+	.prepare = dsi_pll_7nm_vco_prepare,
+	.unprepare = dsi_pll_7nm_vco_unprepare,
+};
+
+/*
+ * PLL Callbacks
+ */
+
+static void dsi_pll_7nm_save_state(struct msm_dsi_pll *pll)
+{
+	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
+	struct pll_7nm_cached_state *cached = &pll_7nm->cached_state;
+	void __iomem *phy_base = pll_7nm->phy_cmn_mmio;
+	u32 cmn_clk_cfg0, cmn_clk_cfg1;
+
+	cached->pll_out_div = pll_read(pll_7nm->mmio +
+				       REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
+	cached->pll_out_div &= 0x3;
+
+	cmn_clk_cfg0 = pll_read(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
+	cached->bit_clk_div = cmn_clk_cfg0 & 0xf;
+	cached->pix_clk_div = (cmn_clk_cfg0 & 0xf0) >> 4;
+
+	cmn_clk_cfg1 = pll_read(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	cached->pll_mux = cmn_clk_cfg1 & 0x3;
+
+	DBG("DSI PLL%d outdiv %x bit_clk_div %x pix_clk_div %x pll_mux %x",
+	    pll_7nm->id, cached->pll_out_div, cached->bit_clk_div,
+	    cached->pix_clk_div, cached->pll_mux);
+}
+
+static int dsi_pll_7nm_restore_state(struct msm_dsi_pll *pll)
+{
+	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
+	struct pll_7nm_cached_state *cached = &pll_7nm->cached_state;
+	void __iomem *phy_base = pll_7nm->phy_cmn_mmio;
+	u32 val;
+
+	val = pll_read(pll_7nm->mmio + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
+	val &= ~0x3;
+	val |= cached->pll_out_div;
+	pll_write(pll_7nm->mmio + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE, val);
+
+	pll_write(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0,
+		  cached->bit_clk_div | (cached->pix_clk_div << 4));
+
+	val = pll_read(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	val &= ~0x3;
+	val |= cached->pll_mux;
+	pll_write(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1, val);
+
+	DBG("DSI PLL%d", pll_7nm->id);
+
+	return 0;
+}
+
+static int dsi_pll_7nm_set_usecase(struct msm_dsi_pll *pll,
+				    enum msm_dsi_phy_usecase uc)
+{
+	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
+	void __iomem *base = pll_7nm->phy_cmn_mmio;
+	u32 data = 0x0;	/* internal PLL */
+
+	DBG("DSI PLL%d", pll_7nm->id);
+
+	switch (uc) {
+	case MSM_DSI_PHY_STANDALONE:
+		break;
+	case MSM_DSI_PHY_MASTER:
+		pll_7nm->slave = pll_7nm_list[(pll_7nm->id + 1) % DSI_MAX];
+		break;
+	case MSM_DSI_PHY_SLAVE:
+		data = 0x1; /* external PLL */
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* set PLL src */
+	pll_write(base + REG_DSI_7nm_PHY_CMN_CLK_CFG1, (data << 2));
+
+	pll_7nm->uc = uc;
+
+	return 0;
+}
+
+static int dsi_pll_7nm_get_provider(struct msm_dsi_pll *pll,
+				     struct clk **byte_clk_provider,
+				     struct clk **pixel_clk_provider)
+{
+	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
+	struct clk_hw_onecell_data *hw_data = pll_7nm->hw_data;
+
+	DBG("DSI PLL%d", pll_7nm->id);
+
+	if (byte_clk_provider)
+		*byte_clk_provider = hw_data->hws[DSI_BYTE_PLL_CLK]->clk;
+	if (pixel_clk_provider)
+		*pixel_clk_provider = hw_data->hws[DSI_PIXEL_PLL_CLK]->clk;
+
+	return 0;
+}
+
+static void dsi_pll_7nm_destroy(struct msm_dsi_pll *pll)
+{
+	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
+	struct device *dev = &pll_7nm->pdev->dev;
+
+	DBG("DSI PLL%d", pll_7nm->id);
+	of_clk_del_provider(dev->of_node);
+
+	clk_hw_unregister_divider(pll_7nm->out_dsiclk_hw);
+	clk_hw_unregister_mux(pll_7nm->pclk_mux_hw);
+	clk_hw_unregister_fixed_factor(pll_7nm->post_out_div_clk_hw);
+	clk_hw_unregister_fixed_factor(pll_7nm->by_2_bit_clk_hw);
+	clk_hw_unregister_fixed_factor(pll_7nm->byte_clk_hw);
+	clk_hw_unregister_divider(pll_7nm->bit_clk_hw);
+	clk_hw_unregister_divider(pll_7nm->out_div_clk_hw);
+	clk_hw_unregister(&pll_7nm->base.clk_hw);
+}
+
+/*
+ * The post dividers and mux clocks are created using the standard divider and
+ * mux API. Unlike the 14nm PHY, the slave PLL doesn't need its dividers/mux
+ * state to follow the master PLL's divider/mux state. Therefore, we don't
+ * require special clock ops that also configure the slave PLL registers
+ */
+static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm)
+{
+	char clk_name[32], parent[32], vco_name[32];
+	char parent2[32], parent3[32], parent4[32];
+	struct clk_init_data vco_init = {
+		.parent_names = (const char *[]){ "bi_tcxo" },
+		.num_parents = 1,
+		.name = vco_name,
+		.flags = CLK_IGNORE_UNUSED,
+		.ops = &clk_ops_dsi_pll_7nm_vco,
+	};
+	struct device *dev = &pll_7nm->pdev->dev;
+	struct clk_hw_onecell_data *hw_data;
+	struct clk_hw *hw;
+	int ret;
+
+	DBG("DSI%d", pll_7nm->id);
+
+	hw_data = devm_kzalloc(dev, sizeof(*hw_data) +
+			       NUM_PROVIDED_CLKS * sizeof(struct clk_hw *),
+			       GFP_KERNEL);
+	if (!hw_data)
+		return -ENOMEM;
+
+	snprintf(vco_name, 32, "dsi%dvco_clk", pll_7nm->id);
+	pll_7nm->base.clk_hw.init = &vco_init;
+
+	ret = clk_hw_register(dev, &pll_7nm->base.clk_hw);
+	if (ret)
+		return ret;
+
+	snprintf(clk_name, 32, "dsi%d_pll_out_div_clk", pll_7nm->id);
+	snprintf(parent, 32, "dsi%dvco_clk", pll_7nm->id);
+
+	hw = clk_hw_register_divider(dev, clk_name,
+				     parent, CLK_SET_RATE_PARENT,
+				     pll_7nm->mmio +
+				     REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE,
+				     0, 2, CLK_DIVIDER_POWER_OF_TWO, NULL);
+	if (IS_ERR(hw)) {
+		ret = PTR_ERR(hw);
+		goto err_base_clk_hw;
+	}
+
+	pll_7nm->out_div_clk_hw = hw;
+
+	snprintf(clk_name, 32, "dsi%d_pll_bit_clk", pll_7nm->id);
+	snprintf(parent, 32, "dsi%d_pll_out_div_clk", pll_7nm->id);
+
+	/* BIT CLK: DIV_CTRL_3_0 */
+	hw = clk_hw_register_divider(dev, clk_name, parent,
+				     CLK_SET_RATE_PARENT,
+				     pll_7nm->phy_cmn_mmio +
+				     REG_DSI_7nm_PHY_CMN_CLK_CFG0,
+				     0, 4, CLK_DIVIDER_ONE_BASED,
+				     &pll_7nm->postdiv_lock);
+	if (IS_ERR(hw)) {
+		ret = PTR_ERR(hw);
+		goto err_out_div_clk_hw;
+	}
+
+	pll_7nm->bit_clk_hw = hw;
+
+	snprintf(clk_name, 32, "dsi%d_phy_pll_out_byteclk", pll_7nm->id);
+	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->id);
+
+	/* DSI Byte clock = VCO_CLK / OUT_DIV / BIT_DIV / 8 */
+	hw = clk_hw_register_fixed_factor(dev, clk_name, parent,
+					  CLK_SET_RATE_PARENT, 1, 8);
+	if (IS_ERR(hw)) {
+		ret = PTR_ERR(hw);
+		goto err_bit_clk_hw;
+	}
+
+	pll_7nm->byte_clk_hw = hw;
+	hw_data->hws[DSI_BYTE_PLL_CLK] = hw;
+
+	snprintf(clk_name, 32, "dsi%d_pll_by_2_bit_clk", pll_7nm->id);
+	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->id);
+
+	hw = clk_hw_register_fixed_factor(dev, clk_name, parent,
+					  0, 1, 2);
+	if (IS_ERR(hw)) {
+		ret = PTR_ERR(hw);
+		goto err_byte_clk_hw;
+	}
+
+	pll_7nm->by_2_bit_clk_hw = hw;
+
+	snprintf(clk_name, 32, "dsi%d_pll_post_out_div_clk", pll_7nm->id);
+	snprintf(parent, 32, "dsi%d_pll_out_div_clk", pll_7nm->id);
+
+	hw = clk_hw_register_fixed_factor(dev, clk_name, parent,
+					  0, 1, 4);
+	if (IS_ERR(hw)) {
+		ret = PTR_ERR(hw);
+		goto err_by_2_bit_clk_hw;
+	}
+
+	pll_7nm->post_out_div_clk_hw = hw;
+
+	snprintf(clk_name, 32, "dsi%d_pclk_mux", pll_7nm->id);
+	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->id);
+	snprintf(parent2, 32, "dsi%d_pll_by_2_bit_clk", pll_7nm->id);
+	snprintf(parent3, 32, "dsi%d_pll_out_div_clk", pll_7nm->id);
+	snprintf(parent4, 32, "dsi%d_pll_post_out_div_clk", pll_7nm->id);
+
+	hw = clk_hw_register_mux(dev, clk_name,
+				 ((const char *[]){
+				 parent, parent2, parent3, parent4
+				 }), 4, 0, pll_7nm->phy_cmn_mmio +
+				 REG_DSI_7nm_PHY_CMN_CLK_CFG1,
+				 0, 2, 0, NULL);
+	if (IS_ERR(hw)) {
+		ret = PTR_ERR(hw);
+		goto err_post_out_div_clk_hw;
+	}
+
+	pll_7nm->pclk_mux_hw = hw;
+
+	snprintf(clk_name, 32, "dsi%d_phy_pll_out_dsiclk", pll_7nm->id);
+	snprintf(parent, 32, "dsi%d_pclk_mux", pll_7nm->id);
+
+	/* PIX CLK DIV : DIV_CTRL_7_4*/
+	hw = clk_hw_register_divider(dev, clk_name, parent,
+				     0, pll_7nm->phy_cmn_mmio +
+					REG_DSI_7nm_PHY_CMN_CLK_CFG0,
+				     4, 4, CLK_DIVIDER_ONE_BASED,
+				     &pll_7nm->postdiv_lock);
+	if (IS_ERR(hw)) {
+		ret = PTR_ERR(hw);
+		goto err_pclk_mux_hw;
+	}
+
+	pll_7nm->out_dsiclk_hw = hw;
+	hw_data->hws[DSI_PIXEL_PLL_CLK] = hw;
+
+	hw_data->num = NUM_PROVIDED_CLKS;
+	pll_7nm->hw_data = hw_data;
+
+	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
+				     pll_7nm->hw_data);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to register clk provider: %d\n", ret);
+		goto err_dsiclk_hw;
+	}
+
+	return 0;
+
+err_dsiclk_hw:
+	clk_hw_unregister_divider(pll_7nm->out_dsiclk_hw);
+err_pclk_mux_hw:
+	clk_hw_unregister_mux(pll_7nm->pclk_mux_hw);
+err_post_out_div_clk_hw:
+	clk_hw_unregister_fixed_factor(pll_7nm->post_out_div_clk_hw);
+err_by_2_bit_clk_hw:
+	clk_hw_unregister_fixed_factor(pll_7nm->by_2_bit_clk_hw);
+err_byte_clk_hw:
+	clk_hw_unregister_fixed_factor(pll_7nm->byte_clk_hw);
+err_bit_clk_hw:
+	clk_hw_unregister_divider(pll_7nm->bit_clk_hw);
+err_out_div_clk_hw:
+	clk_hw_unregister_divider(pll_7nm->out_div_clk_hw);
+err_base_clk_hw:
+	clk_hw_unregister(&pll_7nm->base.clk_hw);
+
+	return ret;
+}
+
+struct msm_dsi_pll *msm_dsi_pll_7nm_init(struct platform_device *pdev, int id)
+{
+	struct dsi_pll_7nm *pll_7nm;
+	struct msm_dsi_pll *pll;
+	int ret;
+
+	pll_7nm = devm_kzalloc(&pdev->dev, sizeof(*pll_7nm), GFP_KERNEL);
+	if (!pll_7nm)
+		return ERR_PTR(-ENOMEM);
+
+	DBG("DSI PLL%d", id);
+
+	pll_7nm->pdev = pdev;
+	pll_7nm->id = id;
+	pll_7nm_list[id] = pll_7nm;
+
+	pll_7nm->phy_cmn_mmio = msm_ioremap(pdev, "dsi_phy", "DSI_PHY");
+	if (IS_ERR_OR_NULL(pll_7nm->phy_cmn_mmio)) {
+		DRM_DEV_ERROR(&pdev->dev, "failed to map CMN PHY base\n");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	pll_7nm->mmio = msm_ioremap(pdev, "dsi_pll", "DSI_PLL");
+	if (IS_ERR_OR_NULL(pll_7nm->mmio)) {
+		DRM_DEV_ERROR(&pdev->dev, "failed to map PLL base\n");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	spin_lock_init(&pll_7nm->postdiv_lock);
+
+	pll = &pll_7nm->base;
+	pll->min_rate = 1000000000UL;
+	pll->max_rate = 3500000000UL;
+	if (pll->type == MSM_DSI_PHY_7NM_V4_1) {
+		pll->min_rate = 600000000UL;
+		pll->max_rate = 5000000000UL;
+	}
+	pll->get_provider = dsi_pll_7nm_get_provider;
+	pll->destroy = dsi_pll_7nm_destroy;
+	pll->save_state = dsi_pll_7nm_save_state;
+	pll->restore_state = dsi_pll_7nm_restore_state;
+	pll->set_usecase = dsi_pll_7nm_set_usecase;
+
+	pll_7nm->vco_delay = 1;
+
+	ret = pll_7nm_register(pll_7nm);
+	if (ret) {
+		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
+		return ERR_PTR(ret);
+	}
+
+	/* TODO: Remove this when we have proper display handover support */
+	msm_dsi_pll_save_state(pll);
+
+	return pll;
+}
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
