Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7719777F1A9
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 10:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 779B310E40D;
	Thu, 17 Aug 2023 08:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC97810E404
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 08:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1692259252; x=1723795252;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GHaBJKwuAYtrg+XvJXFZpw8uTJe+5fFhTmzQQlQrVEg=;
 b=ZBoeDuYz8cSpf8++Sg+37H06SXbhWPxEtd4HHI3TXNOZ9e9iGOl7Czy7
 43eVmfsB+lHgNjocDNpFvu8NGL5Z+aKQ3+FSyP9hn7xNSDpD/LFJc1+p0
 2Heh8s1O6PDt8yzsG4R3mmvJ6WnO/qse7bi0oW9LLEdXGK4NN/hHnw0yK
 0y7GY6r3StSAi85fHcsaVC8JdE+nqaGUscypSJsdYY+oMOaCjKFVLLbtb
 b7SRxn3wa7Qvu4Qul7KwNoyAcU7VCDoR/EJbyL3ymXRbU2slOwAxOd7oP
 K3iX4DimhJrytjDeQC6CKhxaEyMyu8oT836C/nsax8aGdNDhG3eVfOhiB Q==;
X-IronPort-AV: E=Sophos;i="6.01,179,1684792800"; d="scan'208";a="32487213"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 17 Aug 2023 10:00:48 +0200
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 81CA6280084;
 Thu, 17 Aug 2023 10:00:48 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 3/7] drm: bridge: tc358767: Add more registers to
 non-writeable range
Date: Thu, 17 Aug 2023 10:00:41 +0200
Message-Id: <20230817080045.1077600-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817080045.1077600-1-alexander.stein@ew.tq-group.com>
References: <20230817080045.1077600-1-alexander.stein@ew.tq-group.com>
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While at it, also add missing register definitions. HDCP registers are
skipped as they are not named, range 0x0980 - 0x09ac.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/tc358767.c | 75 ++++++++++++++++++++++++++++++-
 1 file changed, 74 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 7cab34443d425..cbecf31bca473 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -41,8 +41,24 @@
 
 /* Registers */
 
+/* DSI D-PHY Layer registers */
+#define D0W_DPHYCONTTX		0x0004
+#define CLW_DPHYCONTTX		0x0020
+#define D0W_DPHYCONTRX		0x0024
+#define D1W_DPHYCONTRX		0x0028
+#define D2W_DPHYCONTRX		0x002c
+#define D3W_DPHYCONTRX		0x0030
+#define COM_DPHYCONTRX		0x0038
+#define CLW_CNTRL		0x0040
+#define D0W_CNTRL		0x0044
+#define D1W_CNTRL		0x0048
+#define D2W_CNTRL		0x004c
+#define D3W_CNTRL		0x0050
+#define TESTMODE_CNTRL		0x0054
+
 /* PPI layer registers */
 #define PPI_STARTPPI		0x0104 /* START control bit */
+#define PPI_BUSYPPI		0x0108 /* PPI busy status */
 #define PPI_LPTXTIMECNT		0x0114 /* LPTX timing signal */
 #define LPX_PERIOD			3
 #define PPI_LANEENABLE		0x0134
@@ -59,6 +75,7 @@
 
 /* DSI layer registers */
 #define DSI_STARTDSI		0x0204 /* START control bit of DSI-TX */
+#define DSI_BUSYDSI		0x0208 /* DSI busy status */
 #define DSI_LANEENABLE		0x0210 /* Enables each lane */
 #define DSI_RX_START			BIT(0)
 
@@ -69,6 +86,18 @@
 #define LANEENABLE_L2EN		BIT(1)
 #define LANEENABLE_L3EN		BIT(2)
 
+#define DSI_LANESTATUS0		0x0214	/* DSI lane status 0 */
+#define DSI_LANESTATUS1		0x0218	/* DSI lane status 1 */
+#define DSI_INTSTATUS		0x0220	/* Interrupt Status */
+#define DSI_INTMASK		0x0224	/* Interrupt Mask */
+#define DSI_INTCLR		0x0228	/* Interrupt Clear */
+#define DSI_LPTXTO		0x0230	/* LPTX Time Out Counter */
+
+#define DSIERRCNT		0x0300	/* DSI Error Count Register */
+
+#define APLCTRL			0x0400	/* Application layer Control Register */
+#define RDPKTLN			0x0404	/* DSI Read packet Length Register */
+
 /* Display Parallel Input Interface */
 #define DPIPXLFMT		0x0440
 #define VS_POL_ACTIVE_LOW		(1 << 10)
@@ -117,6 +146,7 @@
 #define TC_IDREG		0x0500
 #define SYSSTAT			0x0508
 #define SYSRSTENB		0x050c
+#define SYSBOOT			0x0504	/* System BootStrap Status Register */
 #define ENBI2C				(1 << 0)
 #define ENBLCD0				(1 << 2)
 #define ENBBM				(1 << 3)
@@ -141,6 +171,9 @@
 #define INT_GPIO_H(x)		(1 << (x == 0 ? 2 : 10))
 #define INT_GPIO_LC(x)		(1 << (x == 0 ? 3 : 11))
 
+#define TEST_INT_C		0x0570	/* Test Interrupts Control Register */
+#define TEST_INT_S		0x0574	/* Test Interrupts Status Register */
+
 #define INT_GP0_LCNT		0x0584
 #define INT_GP1_LCNT		0x0588
 
@@ -155,6 +188,9 @@
 #define DP0_VIDMNGEN0		0x0610
 #define DP0_VIDMNGEN1		0x0614
 #define DP0_VMNGENSTATUS	0x0618
+#define DP0_AUDMNGEN0		0x0628	/* DP0 Audio Force M Value Register */
+#define DP0_AUDMNGEN1		0x062c	/* DP0 Audio Force N Value Register */
+#define DP0_AMNGENSTATUS	0x0630	/* DP0 Audio Current M Value Register */
 
 /* Main Channel */
 #define DP0_SECSAMPLE		0x0640
@@ -224,6 +260,20 @@
 #define DP0_SNKLTCHGREQ		0x06d4
 #define DP0_LTLOOPCTRL		0x06d8
 #define DP0_SNKLTCTRL		0x06e4
+#define DP0_TPATDAT0		0x06e8	/* DP0 Test Pattern bits 29 to 0 */
+#define DP0_TPATDAT1		0x06ec	/* DP0 Test Pattern bits 59 to 30 */
+#define DP0_TPATDAT2		0x06f0	/* DP0 Test Pattern bits 89 to 60 */
+#define DP0_TPATDAT3		0x06f4	/* DP0 Test Pattern bits 119 to 90 */
+
+#define AUDCFG0			0x0700	/* DP0 Audio Config0 Register */
+#define AUDCFG1			0x0704	/* DP0 Audio Config1 Register */
+#define AUDIFDATA0		0x0708	/* DP0 Audio Info Frame Bytes 3 to 0 */
+#define AUDIFDATA1		0x070c	/* DP0 Audio Info Frame Bytes 7 to 4 */
+#define AUDIFDATA2		0x0710	/* DP0 Audio Info Frame Bytes 11 to 8 */
+#define AUDIFDATA3		0x0714	/* DP0 Audio Info Frame Bytes 15 to 12 */
+#define AUDIFDATA4		0x0718	/* DP0 Audio Info Frame Bytes 19 to 16 */
+#define AUDIFDATA5		0x071c	/* DP0 Audio Info Frame Bytes 23 to 20 */
+#define AUDIFDATA6		0x0720	/* DP0 Audio Info Frame Bytes 27 to 24 */
 
 #define DP1_SRCCTRL		0x07a0
 
@@ -238,6 +288,25 @@
 #define PHY_2LANE			BIT(2)   /* PHY Enable 2 lanes */
 #define PHY_A0_EN			BIT(1)   /* PHY Aux Channel0 Enable */
 #define PHY_M0_EN			BIT(0)   /* PHY Main Channel0 Enable */
+#define DP_PHY_CFG_WR		0x0810	/* DP PHY Configuration Test Write Register */
+#define DP_PHY_CFG_RD		0x0814	/* DP PHY Configuration Test Read Register */
+#define DP0_AUX_PHY_CTRL	0x0820	/* DP0 AUX PHY Control Register */
+#define DP0_MAIN_PHY_DBG	0x0840	/* DP0 Main PHY Test Debug Register */
+
+/* I2S */
+#define I2SCFG			0x0880	/* I2S Audio Config 0 Register */
+#define I2SCH0STAT0		0x0888	/* I2S Audio Channel 0 Status Bytes 3 to 0 */
+#define I2SCH0STAT1		0x088c	/* I2S Audio Channel 0 Status Bytes 7 to 4 */
+#define I2SCH0STAT2		0x0890	/* I2S Audio Channel 0 Status Bytes 11 to 8 */
+#define I2SCH0STAT3		0x0894	/* I2S Audio Channel 0 Status Bytes 15 to 12 */
+#define I2SCH0STAT4		0x0898	/* I2S Audio Channel 0 Status Bytes 19 to 16 */
+#define I2SCH0STAT5		0x089c	/* I2S Audio Channel 0 Status Bytes 23 to 20 */
+#define I2SCH1STAT0		0x08a0	/* I2S Audio Channel 1 Status Bytes 3 to 0 */
+#define I2SCH1STAT1		0x08a4	/* I2S Audio Channel 1 Status Bytes 7 to 4 */
+#define I2SCH1STAT2		0x08a8	/* I2S Audio Channel 1 Status Bytes 11 to 8 */
+#define I2SCH1STAT3		0x08ac	/* I2S Audio Channel 1 Status Bytes 15 to 12 */
+#define I2SCH1STAT4		0x08b0	/* I2S Audio Channel 1 Status Bytes 19 to 16 */
+#define I2SCH1STAT5		0x08b4	/* I2S Audio Channel 1 Status Bytes 23 to 20 */
 
 /* PLL */
 #define DP0_PLLCTRL		0x0900
@@ -1993,7 +2062,11 @@ static const struct regmap_access_table tc_volatile_table = {
 };
 
 static const struct regmap_range tc_non_writeable_ranges[] = {
-	regmap_reg_range(TC_IDREG, TC_IDREG),
+	regmap_reg_range(PPI_BUSYPPI, PPI_BUSYPPI),
+	regmap_reg_range(DSI_BUSYDSI, DSI_BUSYDSI),
+	regmap_reg_range(DSI_LANESTATUS0, DSI_INTSTATUS),
+	regmap_reg_range(TC_IDREG, SYSSTAT),
+	regmap_reg_range(GPIOI, GPIOI),
 	regmap_reg_range(DP0_LTSTAT, DP0_SNKLTCHGREQ),
 };
 
-- 
2.34.1

