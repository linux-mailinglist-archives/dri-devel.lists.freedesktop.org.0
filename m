Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53666AB37A0
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 14:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 243D510E3FA;
	Mon, 12 May 2025 12:47:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="KLYDIaH7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1DF0510E3FB
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 12:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=E+
 xwpLeWwS3mjCKrsIh8QRMLwWgj6Czpmtl+ktdgq9g=; b=KLYDIaH7QZNgMasUOq
 /aNlvhcpixxvbB30lz/ipM4YMii/zHwiOgFIN7TFQdZ6dkoo/a1J5KtsqriMPzoA
 W56TcCw8KbG11kgW6pYcL9kTBNRIMNcQilMm+R5tv8/x8VdM9/10R/JHowicx3sl
 8Pbtp+/B9BEst4GAyU4Z7Z4+o=
Received: from ProDesk.. (unknown [])
 by gzsmtp3 (Coremail) with SMTP id PigvCgC3chWY7SFoQ+_OAQ--.62400S4;
 Mon, 12 May 2025 20:46:24 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: jonas@kwiboo.se, Laurent.pinchart@ideasonboard.com, mripard@kernel.org,
 neil.armstrong@linaro.org, hjc@rock-chips.com, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v5 02/10] drm/rockchip: inno_hdmi: Refactor register macros to
 make checkpatch happy
Date: Mon, 12 May 2025 20:46:03 +0800
Message-ID: <20250512124615.2848731-3-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512124615.2848731-1-andyshrk@163.com>
References: <20250512124615.2848731-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgC3chWY7SFoQ+_OAQ--.62400S4
X-Coremail-Antispam: 1Uf129KBjvJXoW3uw4xXrW5JFy5KFW8Jr1DJrb_yoWkuFyxpF
 45Aa4UtryUtF43Kw1ftFn8G3W7tr1UJr4DKr1j9w45ZF4UAw1kJF1UWrsxtFyqqr4kt34U
 tw4DAw18XasruwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jh5r7UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqBhLXmgh6hVMhQAAsa
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

From: Andy Yan <andy.yan@rock-chips.com>

1. Prefer using the BIT macro
2. Macro argument 'n' as '(n)' to avoid precedence issues
3. Add a blank line after enum declarations

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v5:
- Split from patch 9/10

 drivers/gpu/drm/rockchip/inno_hdmi.c | 214 ++++++++++++++-------------
 1 file changed, 113 insertions(+), 101 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index bc25f5358bef6..82c62400b2e1e 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -39,32 +39,32 @@
 #define DDC_BUS_FREQ_H			0x4c
 
 #define HDMI_SYS_CTRL			0x00
-#define m_RST_ANALOG			(1 << 6)
+#define m_RST_ANALOG			BIT(6)
 #define v_RST_ANALOG			(0 << 6)
-#define v_NOT_RST_ANALOG		(1 << 6)
-#define m_RST_DIGITAL			(1 << 5)
+#define v_NOT_RST_ANALOG		BIT(6)
+#define m_RST_DIGITAL			BIT(5)
 #define v_RST_DIGITAL			(0 << 5)
-#define v_NOT_RST_DIGITAL		(1 << 5)
-#define m_REG_CLK_INV			(1 << 4)
+#define v_NOT_RST_DIGITAL		BIT(5)
+#define m_REG_CLK_INV			BIT(4)
 #define v_REG_CLK_NOT_INV		(0 << 4)
-#define v_REG_CLK_INV			(1 << 4)
-#define m_VCLK_INV			(1 << 3)
+#define v_REG_CLK_INV			BIT(4)
+#define m_VCLK_INV			BIT(3)
 #define v_VCLK_NOT_INV			(0 << 3)
-#define v_VCLK_INV			(1 << 3)
-#define m_REG_CLK_SOURCE		(1 << 2)
+#define v_VCLK_INV			BIT(3)
+#define m_REG_CLK_SOURCE		BIT(2)
 #define v_REG_CLK_SOURCE_TMDS		(0 << 2)
-#define v_REG_CLK_SOURCE_SYS		(1 << 2)
-#define m_POWER				(1 << 1)
+#define v_REG_CLK_SOURCE_SYS		BIT(2)
+#define m_POWER				BIT(1)
 #define v_PWR_ON			(0 << 1)
-#define v_PWR_OFF			(1 << 1)
-#define m_INT_POL			(1 << 0)
+#define v_PWR_OFF			BIT(1)
+#define m_INT_POL			BIT(0)
 #define v_INT_POL_HIGH			1
 #define v_INT_POL_LOW			0
 
 #define HDMI_VIDEO_CONTRL1		0x01
 #define m_VIDEO_INPUT_FORMAT		(7 << 1)
-#define m_DE_SOURCE			(1 << 0)
-#define v_VIDEO_INPUT_FORMAT(n)		(n << 1)
+#define m_DE_SOURCE			BIT(0)
+#define v_VIDEO_INPUT_FORMAT(n)		((n) << 1)
 #define v_DE_EXTERNAL			1
 #define v_DE_INTERNAL			0
 enum {
@@ -76,10 +76,10 @@ enum {
 #define HDMI_VIDEO_CONTRL2		0x02
 #define m_VIDEO_OUTPUT_COLOR		(3 << 6)
 #define m_VIDEO_INPUT_BITS		(3 << 4)
-#define m_VIDEO_INPUT_CSP		(1 << 0)
+#define m_VIDEO_INPUT_CSP		BIT(0)
 #define v_VIDEO_OUTPUT_COLOR(n)		(((n) & 0x3) << 6)
-#define v_VIDEO_INPUT_BITS(n)		(n << 4)
-#define v_VIDEO_INPUT_CSP(n)		(n << 0)
+#define v_VIDEO_INPUT_BITS(n)		((n) << 4)
+#define v_VIDEO_INPUT_CSP(n)		((n) << 0)
 enum {
 	VIDEO_INPUT_12BITS = 0,
 	VIDEO_INPUT_10BITS = 1,
@@ -88,10 +88,10 @@ enum {
 };
 
 #define HDMI_VIDEO_CONTRL		0x03
-#define m_VIDEO_AUTO_CSC		(1 << 7)
-#define v_VIDEO_AUTO_CSC(n)		(n << 7)
-#define m_VIDEO_C0_C2_SWAP		(1 << 0)
-#define v_VIDEO_C0_C2_SWAP(n)		(n << 0)
+#define m_VIDEO_AUTO_CSC		BIT(7)
+#define v_VIDEO_AUTO_CSC(n)		((n) << 7)
+#define m_VIDEO_C0_C2_SWAP		BIT(0)
+#define v_VIDEO_C0_C2_SWAP(n)		((n) << 0)
 enum {
 	C0_C2_CHANGE_ENABLE = 0,
 	C0_C2_CHANGE_DISABLE = 1,
@@ -100,33 +100,33 @@ enum {
 };
 
 #define HDMI_VIDEO_CONTRL3		0x04
-#define m_COLOR_DEPTH_NOT_INDICATED	(1 << 4)
-#define m_SOF				(1 << 3)
-#define m_COLOR_RANGE			(1 << 2)
-#define m_CSC				(1 << 0)
+#define m_COLOR_DEPTH_NOT_INDICATED	BIT(4)
+#define m_SOF				BIT(3)
+#define m_COLOR_RANGE			BIT(2)
+#define m_CSC				BIT(0)
 #define v_COLOR_DEPTH_NOT_INDICATED(n)	((n) << 4)
 #define v_SOF_ENABLE			(0 << 3)
-#define v_SOF_DISABLE			(1 << 3)
-#define v_COLOR_RANGE_FULL		(1 << 2)
+#define v_SOF_DISABLE			BIT(3)
+#define v_COLOR_RANGE_FULL		BIT(2)
 #define v_COLOR_RANGE_LIMITED		(0 << 2)
 #define v_CSC_ENABLE			1
 #define v_CSC_DISABLE			0
 
 #define HDMI_AV_MUTE			0x05
-#define m_AVMUTE_CLEAR			(1 << 7)
-#define m_AVMUTE_ENABLE			(1 << 6)
-#define m_AUDIO_MUTE			(1 << 1)
-#define m_VIDEO_BLACK			(1 << 0)
-#define v_AVMUTE_CLEAR(n)		(n << 7)
-#define v_AVMUTE_ENABLE(n)		(n << 6)
-#define v_AUDIO_MUTE(n)			(n << 1)
-#define v_VIDEO_MUTE(n)			(n << 0)
+#define m_AVMUTE_CLEAR			BIT(7)
+#define m_AVMUTE_ENABLE			BIT(6)
+#define m_AUDIO_MUTE			BIT(1)
+#define m_VIDEO_BLACK			BIT(0)
+#define v_AVMUTE_CLEAR(n)		((n) << 7)
+#define v_AVMUTE_ENABLE(n)		((n) << 6)
+#define v_AUDIO_MUTE(n)			((n) << 1)
+#define v_VIDEO_MUTE(n)			((n) << 0)
 
 #define HDMI_VIDEO_TIMING_CTL		0x08
-#define v_HSYNC_POLARITY(n)		(n << 3)
-#define v_VSYNC_POLARITY(n)		(n << 2)
-#define v_INETLACE(n)			(n << 1)
-#define v_EXTERANL_VIDEO(n)		(n << 0)
+#define v_HSYNC_POLARITY(n)		((n) << 3)
+#define v_VSYNC_POLARITY(n)		((n) << 2)
+#define v_INETLACE(n)			((n) << 1)
+#define v_EXTERANL_VIDEO(n)		((n) << 0)
 
 #define HDMI_VIDEO_EXT_HTOTAL_L		0x09
 #define HDMI_VIDEO_EXT_HTOTAL_H		0x0a
@@ -149,31 +149,37 @@ enum {
 	CTS_SOURCE_INTERNAL = 0,
 	CTS_SOURCE_EXTERNAL = 1,
 };
-#define v_CTS_SOURCE(n)			(n << 7)
+
+#define v_CTS_SOURCE(n)			((n) << 7)
 
 enum {
 	DOWNSAMPLE_DISABLE = 0,
 	DOWNSAMPLE_1_2 = 1,
 	DOWNSAMPLE_1_4 = 2,
 };
-#define v_DOWN_SAMPLE(n)		(n << 5)
+
+#define v_DOWN_SAMPLE(n)		((n) << 5)
 
 enum {
 	AUDIO_SOURCE_IIS = 0,
 	AUDIO_SOURCE_SPDIF = 1,
 };
-#define v_AUDIO_SOURCE(n)		(n << 3)
 
-#define v_MCLK_ENABLE(n)		(n << 2)
+#define v_AUDIO_SOURCE(n)		((n) << 3)
+
+#define v_MCLK_ENABLE(n)		((n) << 2)
+
 enum {
 	MCLK_128FS = 0,
 	MCLK_256FS = 1,
 	MCLK_384FS = 2,
 	MCLK_512FS = 3,
 };
+
 #define v_MCLK_RATIO(n)			(n)
 
 #define AUDIO_SAMPLE_RATE		0x37
+
 enum {
 	AUDIO_32K = 0x3,
 	AUDIO_441K = 0x0,
@@ -185,18 +191,22 @@ enum {
 };
 
 #define AUDIO_I2S_MODE			0x38
+
 enum {
 	I2S_CHANNEL_1_2 = 1,
 	I2S_CHANNEL_3_4 = 3,
 	I2S_CHANNEL_5_6 = 7,
 	I2S_CHANNEL_7_8 = 0xf
 };
+
 #define v_I2S_CHANNEL(n)		((n) << 2)
+
 enum {
 	I2S_STANDARD = 0,
 	I2S_LEFT_JUSTIFIED = 1,
 	I2S_RIGHT_JUSTIFIED = 2,
 };
+
 #define v_I2S_MODE(n)			(n)
 
 #define AUDIO_I2S_MAP			0x39
@@ -212,12 +222,12 @@ enum {
 #define N_192K				0x6000
 
 #define HDMI_AUDIO_CHANNEL_STATUS	0x3e
-#define m_AUDIO_STATUS_NLPCM		(1 << 7)
-#define m_AUDIO_STATUS_USE		(1 << 6)
-#define m_AUDIO_STATUS_COPYRIGHT	(1 << 5)
+#define m_AUDIO_STATUS_NLPCM		BIT(7)
+#define m_AUDIO_STATUS_USE		BIT(6)
+#define m_AUDIO_STATUS_COPYRIGHT	BIT(5)
 #define m_AUDIO_STATUS_ADDITION		(3 << 2)
 #define m_AUDIO_STATUS_CLK_ACCURACY	(2 << 0)
-#define v_AUDIO_STATUS_NLPCM(n)		((n & 1) << 7)
+#define v_AUDIO_STATUS_NLPCM(n)		(((n) & 1) << 7)
 #define AUDIO_N_H			0x3f
 #define AUDIO_N_M			0x40
 #define AUDIO_N_L			0x41
@@ -236,16 +246,17 @@ enum {
 
 #define HDMI_PACKET_SEND_MANUAL		0x9c
 #define HDMI_PACKET_SEND_AUTO		0x9d
-#define m_PACKET_GCP_EN			(1 << 7)
-#define m_PACKET_MSI_EN			(1 << 6)
-#define m_PACKET_SDI_EN			(1 << 5)
-#define m_PACKET_VSI_EN			(1 << 4)
-#define v_PACKET_GCP_EN(n)		((n & 1) << 7)
-#define v_PACKET_MSI_EN(n)		((n & 1) << 6)
-#define v_PACKET_SDI_EN(n)		((n & 1) << 5)
-#define v_PACKET_VSI_EN(n)		((n & 1) << 4)
+#define m_PACKET_GCP_EN			BIT(7)
+#define m_PACKET_MSI_EN			BIT(6)
+#define m_PACKET_SDI_EN			BIT(5)
+#define m_PACKET_VSI_EN			BIT(4)
+#define v_PACKET_GCP_EN(n)		(((n) & 1) << 7)
+#define v_PACKET_MSI_EN(n)		(((n) & 1) << 6)
+#define v_PACKET_SDI_EN(n)		(((n) & 1) << 5)
+#define v_PACKET_VSI_EN(n)		(((n) & 1) << 4)
 
 #define HDMI_CONTROL_PACKET_BUF_INDEX	0x9f
+
 enum {
 	INFOFRAME_VSI = 0x05,
 	INFOFRAME_AVI = 0x06,
@@ -254,6 +265,7 @@ enum {
 
 #define HDMI_CONTROL_PACKET_ADDR	0xa0
 #define HDMI_MAXIMUM_INFO_FRAME_SIZE	0x11
+
 enum {
 	AVI_COLOR_MODE_RGB = 0,
 	AVI_COLOR_MODE_YCBCR422 = 1,
@@ -275,76 +287,76 @@ enum {
 };
 
 #define HDMI_HDCP_CTRL			0x52
-#define m_HDMI_DVI			(1 << 1)
-#define v_HDMI_DVI(n)			(n << 1)
+#define m_HDMI_DVI			BIT(1)
+#define v_HDMI_DVI(n)			((n) << 1)
 
 #define HDMI_INTERRUPT_MASK1		0xc0
 #define HDMI_INTERRUPT_STATUS1		0xc1
-#define	m_INT_ACTIVE_VSYNC		(1 << 5)
-#define m_INT_EDID_READY		(1 << 2)
+#define	m_INT_ACTIVE_VSYNC		BIT(5)
+#define m_INT_EDID_READY		BIT(2)
 
 #define HDMI_INTERRUPT_MASK2		0xc2
 #define HDMI_INTERRUPT_STATUS2		0xc3
-#define m_INT_HDCP_ERR			(1 << 7)
-#define m_INT_BKSV_FLAG			(1 << 6)
-#define m_INT_HDCP_OK			(1 << 4)
+#define m_INT_HDCP_ERR			BIT(7)
+#define m_INT_BKSV_FLAG			BIT(6)
+#define m_INT_HDCP_OK			BIT(4)
 
 #define HDMI_STATUS			0xc8
-#define m_HOTPLUG			(1 << 7)
-#define m_MASK_INT_HOTPLUG		(1 << 5)
-#define m_INT_HOTPLUG			(1 << 1)
-#define v_MASK_INT_HOTPLUG(n)		((n & 0x1) << 5)
+#define m_HOTPLUG			BIT(7)
+#define m_MASK_INT_HOTPLUG		BIT(5)
+#define m_INT_HOTPLUG			BIT(1)
+#define v_MASK_INT_HOTPLUG(n)		(((n) & 0x1) << 5)
 
 #define HDMI_COLORBAR                   0xc9
 
 #define HDMI_PHY_SYNC			0xce
 #define HDMI_PHY_SYS_CTL		0xe0
-#define m_TMDS_CLK_SOURCE		(1 << 5)
+#define m_TMDS_CLK_SOURCE		BIT(5)
 #define v_TMDS_FROM_PLL			(0 << 5)
-#define v_TMDS_FROM_GEN			(1 << 5)
-#define m_PHASE_CLK			(1 << 4)
+#define v_TMDS_FROM_GEN			BIT(5)
+#define m_PHASE_CLK			BIT(4)
 #define v_DEFAULT_PHASE			(0 << 4)
-#define v_SYNC_PHASE			(1 << 4)
-#define m_TMDS_CURRENT_PWR		(1 << 3)
+#define v_SYNC_PHASE			BIT(4)
+#define m_TMDS_CURRENT_PWR		BIT(3)
 #define v_TURN_ON_CURRENT		(0 << 3)
-#define v_CAT_OFF_CURRENT		(1 << 3)
-#define m_BANDGAP_PWR			(1 << 2)
+#define v_CAT_OFF_CURRENT		BIT(3)
+#define m_BANDGAP_PWR			BIT(2)
 #define v_BANDGAP_PWR_UP		(0 << 2)
-#define v_BANDGAP_PWR_DOWN		(1 << 2)
-#define m_PLL_PWR			(1 << 1)
+#define v_BANDGAP_PWR_DOWN		BIT(2)
+#define m_PLL_PWR			BIT(1)
 #define v_PLL_PWR_UP			(0 << 1)
-#define v_PLL_PWR_DOWN			(1 << 1)
-#define m_TMDS_CHG_PWR			(1 << 0)
+#define v_PLL_PWR_DOWN			BIT(1)
+#define m_TMDS_CHG_PWR			BIT(0)
 #define v_TMDS_CHG_PWR_UP		(0 << 0)
-#define v_TMDS_CHG_PWR_DOWN		(1 << 0)
+#define v_TMDS_CHG_PWR_DOWN		BIT(0)
 
 #define HDMI_PHY_CHG_PWR		0xe1
-#define v_CLK_CHG_PWR(n)		((n & 1) << 3)
-#define v_DATA_CHG_PWR(n)		((n & 7) << 0)
+#define v_CLK_CHG_PWR(n)		(((n) & 1) << 3)
+#define v_DATA_CHG_PWR(n)		(((n) & 7) << 0)
 
 #define HDMI_PHY_DRIVER			0xe2
-#define v_CLK_MAIN_DRIVER(n)		(n << 4)
-#define v_DATA_MAIN_DRIVER(n)		(n << 0)
+#define v_CLK_MAIN_DRIVER(n)		((n) << 4)
+#define v_DATA_MAIN_DRIVER(n)		((n) << 0)
 
 #define HDMI_PHY_PRE_EMPHASIS		0xe3
-#define v_PRE_EMPHASIS(n)		((n & 7) << 4)
-#define v_CLK_PRE_DRIVER(n)		((n & 3) << 2)
-#define v_DATA_PRE_DRIVER(n)		((n & 3) << 0)
+#define v_PRE_EMPHASIS(n)		(((n) & 7) << 4)
+#define v_CLK_PRE_DRIVER(n)		(((n) & 3) << 2)
+#define v_DATA_PRE_DRIVER(n)		(((n) & 3) << 0)
 
 #define HDMI_PHY_FEEDBACK_DIV_RATIO_LOW		0xe7
-#define v_FEEDBACK_DIV_LOW(n)			(n & 0xff)
+#define v_FEEDBACK_DIV_LOW(n)			((n) & 0xff)
 #define HDMI_PHY_FEEDBACK_DIV_RATIO_HIGH	0xe8
-#define v_FEEDBACK_DIV_HIGH(n)			(n & 1)
+#define v_FEEDBACK_DIV_HIGH(n)			((n) & 1)
 
 #define HDMI_PHY_PRE_DIV_RATIO		0xed
-#define v_PRE_DIV_RATIO(n)		(n & 0x1f)
+#define v_PRE_DIV_RATIO(n)		((n) & 0x1f)
 
 #define HDMI_CEC_CTRL			0xd0
-#define m_ADJUST_FOR_HISENSE		(1 << 6)
-#define m_REJECT_RX_BROADCAST		(1 << 5)
-#define m_BUSFREETIME_ENABLE		(1 << 2)
-#define m_REJECT_RX			(1 << 1)
-#define m_START_TX			(1 << 0)
+#define m_ADJUST_FOR_HISENSE		BIT(6)
+#define m_REJECT_RX_BROADCAST		BIT(5)
+#define m_BUSFREETIME_ENABLE		BIT(2)
+#define m_REJECT_RX			BIT(1)
+#define m_START_TX			BIT(0)
 
 #define HDMI_CEC_DATA			0xd1
 #define HDMI_CEC_TX_OFFSET		0xd2
@@ -354,15 +366,15 @@ enum {
 #define HDMI_CEC_TX_LENGTH		0xd6
 #define HDMI_CEC_RX_LENGTH		0xd7
 #define HDMI_CEC_TX_INT_MASK		0xd8
-#define m_TX_DONE			(1 << 3)
-#define m_TX_NOACK			(1 << 2)
-#define m_TX_BROADCAST_REJ		(1 << 1)
-#define m_TX_BUSNOTFREE			(1 << 0)
+#define m_TX_DONE			BIT(3)
+#define m_TX_NOACK			BIT(2)
+#define m_TX_BROADCAST_REJ		BIT(1)
+#define m_TX_BUSNOTFREE			BIT(0)
 
 #define HDMI_CEC_RX_INT_MASK		0xd9
-#define m_RX_LA_ERR			(1 << 4)
-#define m_RX_GLITCH			(1 << 3)
-#define m_RX_DONE			(1 << 0)
+#define m_RX_LA_ERR			BIT(4)
+#define m_RX_GLITCH			BIT(3)
+#define m_RX_DONE			BIT(0)
 
 #define HDMI_CEC_TX_INT			0xda
 #define HDMI_CEC_RX_INT			0xdb
-- 
2.43.0

