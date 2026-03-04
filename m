Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KP0zKeD/p2nUnAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 10:48:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 533981FDDE8
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 10:48:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6694210E99F;
	Wed,  4 Mar 2026 09:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="AOeDKIOn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 331 seconds by postgrey-1.36 at gabe;
 Wed, 04 Mar 2026 09:48:13 UTC
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D6F10E99D
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 09:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1772617683;
 bh=Q/C/81n2ESiHICwb5qDeywuFY/hqwhxLLbWeZ9weSUI=;
 h=From:To:Subject:Date:Message-Id;
 b=AOeDKIOnJNnx+fBaPp9tHthapo5WqCKSE1vC+lAjUx0XxUmFyy1fTMyvgz2Y5IEBu
 l3QQrHKb7+PRml2sdMQ3FOYe3JAmRQXPjc/ebVphNekJu9U1wReAenMPr+ePhYj855
 /GeDh1fx3I2EX6jZq1yDGc8LkX1FQ8mEuHWrLw38=
X-QQ-mid: esmtpsz11t1772617354ta44dd335
X-QQ-Originating-IP: P9qAAbnPxWRUL27D20z/PmadccXiqzUdCyIjIW1nkr0=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 04 Mar 2026 17:42:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16266743211987767880
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Amit Sunil Dhamne <amitsd@google.com>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, Hugh Cole-Baker <sigmaris@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH v15 4/9] phy: rockchip: phy-rockchip-typec: Add
 typec_mux/typec_switch support
Date: Wed,  4 Mar 2026 17:41:47 +0800
Message-Id: <20260304094152.92-5-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260304094152.92-1-kernel@airkyi.com>
References: <20260304094152.92-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NE8iuDeseKq8wponzTaaMN8PVLmx/NYhg4rcxCEmTxiCTLR+UqMBrztb
 RTNR4a69jNKrjr05FTTbUS/8BCpgK6MvJlR+1rCXVwBGdt8SBLrTa4f0PseNAw1F7uErrNU
 LpG0SD0Ljv5VNdDliOlD6b81lqCYaumT1ZUnwgYYreOhRuITYtJuY7NVGNs/3//2OopgfFH
 k2QJ+vmU8ETinhrxpogcGXzHRoTvgSOk120jjjP1eNWjGVgB1b2nIYYUDMRuhjZkVFoqe46
 fZ/PY2Er+Q6huH1vHEZvxVVbVNN3CJanntLv2Z7Jtq2jpr72wTlfwurEZIPCVcQBpHavQPe
 mW+dhs2ZCJdP7ghpXkCkHK0ELx0PoD9WeXIdfPa8GJYZUL9sxFccn7BQI0Q48OxtEozEL9l
 v4YD+yhCJijB6gXiu4t1T3wXdttxq/11Cj1XdyT55m4wV0K7LJSMX+zFIuLmKbU3ujgEbWM
 mve7CCGdbk5eJ/XqVIBncX+BsSSWGtELF0YZV/YHFFmvUoTTsb1rxT6cqIZbaf/uZyb2pJy
 idEU09I0jfgit++LMr65lZOikbbwLsNWiS4TFK7S2Jv9vKChsJrNgkydwnL5NZSB7P+ukyd
 cordo/o5aSK1PjtfwHPtFcHa/SfdtyWoob30mJsGBsk4T2ZJLjZsOFWQvmFzr/ONNyZD+K2
 JZBQ44ykKK/f0Qmy536TQNaeQ0/IyRvs6xEdvUVX6R61Wd83cvdSLRXqYinUZeSUusYM0df
 4WAc3frZ/nE6QgW5AiNI2kbx9sO7ReKsK2eYrjKEkwFRl26hffR5ic0gScoxRUupy1YmBHi
 ikrC2HmLNZm+j+0UppKLvA1eYQ4SxtkgA1gJUtp/Lz9u9mGktoa0gf3vtaP+yy77rxzoAFB
 MhXpnHx4SOWM2tEhanQSTMxe8Nd3EluV9O5DI2JR1EAdgE/jPFRFN8DxunsR3rGsrjpde6U
 cvXXy0A0wgEnTwOuWOhZhVwmvAfdolefDzctIS275VMPrVGP7m1wuHFOngCyX5SjVg+xBIT
 2wwkwN0A==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
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
X-Rspamd-Queue-Id: 533981FDDE8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[airkyi.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[airkyi.com:s=altu2504];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:heikki.krogerus@linux.intel.com,m:gregkh@linuxfoundation.org,m:dmitry.baryshkov@oss.qualcomm.com,m:hzpeterchen@gmail.com,m:luca.ceresoli@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:heiko@sntech.de,m:hjc@rock-chips.com,m:andy.yan@rock-chips.com,m:yubing.zhang@rock-chips.com,m:frank.wang@rock-chips.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:amitsd@google.com,m:dsimic@manjaro.org,m:jbx6244@gmail.com,m:didi.debian@cknow.org,m:pbrobinson@gmail.com,m:sigmaris@gmail.com,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:c
 haoyi.chen@rock-chips.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[kernel@airkyi.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[linux.intel.com,linuxfoundation.org,oss.qualcomm.com,gmail.com,bootlin.com,kernel.org,sntech.de,rock-chips.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,suse.de,ffwll.ch,google.com,manjaro.org,cknow.org];
	DKIM_TRACE(0.00)[airkyi.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kernel@airkyi.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,airkyi.com:dkim,airkyi.com:mid,rock-chips.com:email]
X-Rspamd-Action: no action

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

This patch add support for Type-C Port Controller Manager. Each PHY
will register typec_mux and typec_switch when external Type-C
controller is present. Type-C events are handled by TCPM without
extcon.

The extcon device should still be supported.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

(no changes since v7)

Changes in v6:
- Fix depend in Kconfig.
- Check DP svid in tcphy_typec_mux_set().
- Remove mode setting in tcphy_orien_sw_set().

(no changes since v5)

Changes in v4:
- Remove notify DP HPD state by USB/DP PHY.

(no changes since v3)

Changes in v2:
- Fix compile error when CONFIG_TYPEC is not enabled.
- Notify DP HPD state by USB/DP PHY.
---

 drivers/phy/rockchip/Kconfig              |   1 +
 drivers/phy/rockchip/phy-rockchip-typec.c | 368 +++++++++++++++++++++-
 2 files changed, 353 insertions(+), 16 deletions(-)

diff --git a/drivers/phy/rockchip/Kconfig b/drivers/phy/rockchip/Kconfig
index 14698571b607..db4adc7c53da 100644
--- a/drivers/phy/rockchip/Kconfig
+++ b/drivers/phy/rockchip/Kconfig
@@ -119,6 +119,7 @@ config PHY_ROCKCHIP_SNPS_PCIE3
 config PHY_ROCKCHIP_TYPEC
 	tristate "Rockchip TYPEC PHY Driver"
 	depends on OF && (ARCH_ROCKCHIP || COMPILE_TEST)
+	depends on TYPEC || TYPEC=n
 	select EXTCON
 	select GENERIC_PHY
 	select RESET_CONTROLLER
diff --git a/drivers/phy/rockchip/phy-rockchip-typec.c b/drivers/phy/rockchip/phy-rockchip-typec.c
index d9701b6106d5..1f5b4142cbe4 100644
--- a/drivers/phy/rockchip/phy-rockchip-typec.c
+++ b/drivers/phy/rockchip/phy-rockchip-typec.c
@@ -54,6 +54,8 @@
 
 #include <linux/mfd/syscon.h>
 #include <linux/phy/phy.h>
+#include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_mux.h>
 
 #define CMN_SSM_BANDGAP			(0x21 << 2)
 #define CMN_SSM_BIAS			(0x22 << 2)
@@ -286,12 +288,23 @@
 #define RX_DIAG_SC2C_DELAY		(0x81e1 << 2)
 
 #define PMA_LANE_CFG			(0xc000 << 2)
+#define PMA_LANE3_DP_LANE_SEL(x)	(((x) & 0x3) << 14)
+#define PMA_LANE3_INTERFACE_SEL(x)	(((x) & 0x1) << 12)
+#define PMA_LANE2_DP_LANE_SEL(x)	(((x) & 0x3) << 10)
+#define PMA_LANE2_INTERFACE_SEL(x)	(((x) & 0x1) << 8)
+#define PMA_LANE1_DP_LANE_SEL(x)	(((x) & 0x3) << 6)
+#define PMA_LANE1_INTERFACE_SEL(x)	(((x) & 0x1) << 4)
+#define PMA_LANE0_DP_LANE_SEL(x)	(((x) & 0x3) << 2)
+#define PMA_LANE0_INTERFACE_SEL(x)	(((x) & 0x1) << 0)
 #define PIPE_CMN_CTRL1			(0xc001 << 2)
 #define PIPE_CMN_CTRL2			(0xc002 << 2)
 #define PIPE_COM_LOCK_CFG1		(0xc003 << 2)
 #define PIPE_COM_LOCK_CFG2		(0xc004 << 2)
 #define PIPE_RCV_DET_INH		(0xc005 << 2)
 #define DP_MODE_CTL			(0xc008 << 2)
+#define PHY_DP_POWER_STATE_ACK_MASK	GENMASK(7, 4)
+#define PHY_DP_POWER_STATE_ACK_SHIFT	4
+#define PHY_DP_POWER_STATE_MASK		GENMASK(3, 0)
 #define DP_CLK_CTL			(0xc009 << 2)
 #define STS				(0xc00F << 2)
 #define PHY_ISO_CMN_CTRL		(0xc010 << 2)
@@ -327,8 +340,15 @@
 
 #define DP_MODE_A0			BIT(4)
 #define DP_MODE_A2			BIT(6)
-#define DP_MODE_ENTER_A0		0xc101
-#define DP_MODE_ENTER_A2		0xc104
+
+#define DP_MODE_MASK			0xf
+#define DP_MODE_ENTER_A0		BIT(0)
+#define DP_MODE_ENTER_A2		BIT(2)
+#define DP_MODE_ENTER_A3		BIT(3)
+#define DP_MODE_A0_ACK			BIT(4)
+#define DP_MODE_A2_ACK			BIT(6)
+#define DP_MODE_A3_ACK			BIT(7)
+#define DP_LINK_RESET_DEASSERTED	BIT(8)
 
 #define PHY_MODE_SET_TIMEOUT		100000
 
@@ -340,6 +360,31 @@
 #define MODE_DFP_USB			BIT(1)
 #define MODE_DFP_DP			BIT(2)
 
+enum phy_dp_lane_num {
+	PHY_DP_LANE_0 = 0,
+	PHY_DP_LANE_1,
+	PHY_DP_LANE_2,
+	PHY_DP_LANE_3,
+};
+
+enum phy_pma_if {
+	PMA_IF_PIPE_PCS = 0,
+	PMA_IF_PHY_DP,
+};
+
+enum phy_typec_role {
+	TYPEC_PHY_USB = 0,
+	TYPEC_PHY_DP,
+	TYPEC_PHY_MAX,
+};
+
+enum phy_dp_power_state {
+	PHY_DP_POWER_STATE_A0 = 0,
+	PHY_DP_POWER_STATE_A1,
+	PHY_DP_POWER_STATE_A2,
+	PHY_DP_POWER_STATE_A3,
+};
+
 struct usb3phy_reg {
 	u32 offset;
 	u32 enable_bit;
@@ -372,18 +417,22 @@ struct rockchip_typec_phy {
 	struct device *dev;
 	void __iomem *base;
 	struct extcon_dev *extcon;
+	struct typec_mux_dev *mux;
+	struct typec_switch_dev *sw;
 	struct regmap *grf_regs;
 	struct clk *clk_core;
 	struct clk *clk_ref;
 	struct reset_control *uphy_rst;
 	struct reset_control *pipe_rst;
 	struct reset_control *tcphy_rst;
+	struct phy *phys[TYPEC_PHY_MAX];
 	const struct rockchip_usb3phy_port_cfg *port_cfgs;
 	/* mutex to protect access to individual PHYs */
 	struct mutex lock;
 
 	bool flip;
 	u8 mode;
+	u8 new_mode;
 };
 
 struct phy_reg {
@@ -454,6 +503,99 @@ static const struct rockchip_usb3phy_port_cfg rk3399_usb3phy_port_cfgs[] = {
 	{ /* sentinel */ }
 };
 
+static int tcphy_cfg_usb3_to_usb2_only(struct rockchip_typec_phy *tcphy,
+				       bool value);
+
+static int tcphy_dp_set_power_state(struct rockchip_typec_phy *tcphy,
+				    enum phy_dp_power_state state)
+{
+	u32 ack, reg, sts = BIT(state);
+	int ret;
+
+	/*
+	 * Power state changes must not be requested until after the cmn_ready
+	 * signal has gone active.
+	 */
+	reg = readl(tcphy->base + PMA_CMN_CTRL1);
+	if (!(reg & CMN_READY)) {
+		dev_err(tcphy->dev, "cmn_ready in the inactive state\n");
+		return -EINVAL;
+	}
+
+	reg = readl(tcphy->base + DP_MODE_CTL);
+	reg &= ~PHY_DP_POWER_STATE_MASK;
+	reg |= sts;
+	writel(reg, tcphy->base + DP_MODE_CTL);
+
+	ret = readl_poll_timeout(tcphy->base + DP_MODE_CTL,
+				 ack, (((ack & PHY_DP_POWER_STATE_ACK_MASK) >>
+				 PHY_DP_POWER_STATE_ACK_SHIFT) == sts), 10,
+				 PHY_MODE_SET_TIMEOUT);
+	if (ret < 0) {
+		dev_err(tcphy->dev, "failed to enter power state %d\n", state);
+		return ret;
+	}
+
+	return 0;
+}
+
+/*
+ * For the TypeC PHY, the 4 lanes are mapping to the USB TypeC receptacle pins
+ * as follows:
+ *   -------------------------------------------------------------------
+ *	PHY Lanes/Module Pins			TypeC Receptacle Pins
+ *   -------------------------------------------------------------------
+ *	Lane0 (tx_p/m_ln_0)			TX1+/TX1- (pins A2/A3)
+ *	Lane1 (tx_rx_p/m_ln_1)			RX1+/RX1- (pins B11/B10)
+ *	Lane2 (tx_rx_p/m_ln_2)			RX2+/RX2- (pins A11/A10)
+ *	Lane3 (tx_p/m_ln_3)			TX2+/TX2- (pins B2/B3)
+ *   -------------------------------------------------------------------
+ *
+ * USB and DP lanes mapping to TypeC PHY lanes for each of pin assignment
+ * options (normal connector orientation) described in the VESA DisplayPort
+ * Alt Mode on USB TypeC Standard as follows:
+ *
+ * ----------------------------------------------------------------------
+ *	PHY Lanes	A	B	C	D	E	F
+ * ----------------------------------------------------------------------
+ *	  0	       ML1     SSTX    ML2     SSTX    ML2     SSTX
+ *	  1	       ML3     SSRX    ML3     SSRX    ML3     SSRX
+ *	  2	       ML2     ML1     ML0     ML0     ML0     ML0
+ *	  3	       ML0     ML0     ML1     ML1     ML1     ML1
+ * ----------------------------------------------------------------------
+ */
+static void tcphy_set_lane_mapping(struct rockchip_typec_phy *tcphy, u8 mode)
+{
+	/*
+	 * The PMA_LANE_CFG register is used to select whether a PMA lane
+	 * is mapped for USB or PHY DP. The PMA_LANE_CFG register is
+	 * configured based on a normal connector orientation. Logic in the
+	 * PHY automatically handles the flipped connector case based on the
+	 * setting of orientation of TypeC PHY.
+	 */
+	if (mode == MODE_DFP_DP) {
+		/* This maps to VESA DP Alt Mode pin assignments C and E. */
+		writel(PMA_LANE3_DP_LANE_SEL(PHY_DP_LANE_1) |
+		       PMA_LANE3_INTERFACE_SEL(PMA_IF_PHY_DP) |
+		       PMA_LANE2_DP_LANE_SEL(PHY_DP_LANE_0) |
+		       PMA_LANE2_INTERFACE_SEL(PMA_IF_PHY_DP) |
+		       PMA_LANE1_DP_LANE_SEL(PHY_DP_LANE_3) |
+		       PMA_LANE1_INTERFACE_SEL(PMA_IF_PHY_DP) |
+		       PMA_LANE0_DP_LANE_SEL(PHY_DP_LANE_2) |
+		       PMA_LANE0_INTERFACE_SEL(PMA_IF_PHY_DP),
+		       tcphy->base + PMA_LANE_CFG);
+	} else {
+		/* This maps to VESA DP Alt Mode pin assignments D and F. */
+		writel(PMA_LANE3_DP_LANE_SEL(PHY_DP_LANE_1) |
+		       PMA_LANE3_INTERFACE_SEL(PMA_IF_PHY_DP) |
+		       PMA_LANE2_DP_LANE_SEL(PHY_DP_LANE_0) |
+		       PMA_LANE2_INTERFACE_SEL(PMA_IF_PHY_DP) |
+		       PMA_LANE1_INTERFACE_SEL(PMA_IF_PIPE_PCS) |
+		       PMA_LANE0_INTERFACE_SEL(PMA_IF_PIPE_PCS),
+		       tcphy->base + PMA_LANE_CFG);
+	}
+}
+
 static void tcphy_cfg_24m(struct rockchip_typec_phy *tcphy)
 {
 	u32 i, rdata;
@@ -743,8 +885,10 @@ static int tcphy_phy_init(struct rockchip_typec_phy *tcphy, u8 mode)
 	tcphy_dp_aux_set_flip(tcphy);
 
 	tcphy_cfg_24m(tcphy);
+	tcphy_set_lane_mapping(tcphy, mode);
 
 	if (mode == MODE_DFP_DP) {
+		tcphy_cfg_usb3_to_usb2_only(tcphy, true);
 		tcphy_cfg_dp_pll(tcphy);
 		for (i = 0; i < 4; i++)
 			tcphy_dp_cfg_lane(tcphy, i);
@@ -768,7 +912,10 @@ static int tcphy_phy_init(struct rockchip_typec_phy *tcphy, u8 mode)
 		writel(PIN_ASSIGN_D_F, tcphy->base + PMA_LANE_CFG);
 	}
 
-	writel(DP_MODE_ENTER_A2, tcphy->base + DP_MODE_CTL);
+	val = readl(tcphy->base + DP_MODE_CTL);
+	val &= ~DP_MODE_MASK;
+	val |= DP_MODE_ENTER_A2 | DP_LINK_RESET_DEASSERTED;
+	writel(val, tcphy->base + DP_MODE_CTL);
 
 	reset_control_deassert(tcphy->uphy_rst);
 
@@ -811,8 +958,9 @@ static int tcphy_get_mode(struct rockchip_typec_phy *tcphy)
 	u8 mode;
 	int ret, ufp, dp;
 
+	/* If extcon not exist, try to use tcpm mode */
 	if (!edev)
-		return MODE_DFP_USB;
+		return tcphy->new_mode;
 
 	ufp = extcon_get_state(edev, EXTCON_USB);
 	dp = extcon_get_state(edev, EXTCON_DISP_DP);
@@ -850,6 +998,71 @@ static int tcphy_get_mode(struct rockchip_typec_phy *tcphy)
 	return mode;
 }
 
+#if IS_ENABLED(CONFIG_TYPEC)
+static int tcphy_orien_sw_set(struct typec_switch_dev *sw,
+			      enum typec_orientation orien)
+{
+	struct rockchip_typec_phy *tcphy = typec_switch_get_drvdata(sw);
+
+	mutex_lock(&tcphy->lock);
+
+	if (orien == TYPEC_ORIENTATION_NONE) {
+		tcphy->new_mode = MODE_DISCONNECT;
+		goto unlock_ret;
+	}
+
+	tcphy->flip = (orien == TYPEC_ORIENTATION_REVERSE) ? true : false;
+
+unlock_ret:
+	mutex_unlock(&tcphy->lock);
+	return 0;
+}
+
+static void udphy_orien_switch_unregister(void *data)
+{
+	struct rockchip_typec_phy *tcphy = data;
+
+	typec_switch_unregister(tcphy->sw);
+}
+
+static int tcphy_setup_orien_switch(struct rockchip_typec_phy *tcphy)
+{
+	struct typec_switch_desc sw_desc = { };
+	struct device_node *np;
+	int ret = 0;
+
+	np = of_get_child_by_name(tcphy->dev->of_node, "usb3-port");
+	if (!np)
+		return 0;
+
+	if (!of_property_read_bool(np, "orientation-switch"))
+		goto put_np;
+
+	sw_desc.drvdata = tcphy;
+	sw_desc.fwnode = device_get_named_child_node(tcphy->dev, "usb3-port");
+	sw_desc.set = tcphy_orien_sw_set;
+
+	tcphy->sw = typec_switch_register(tcphy->dev, &sw_desc);
+	if (IS_ERR(tcphy->sw)) {
+		dev_err(tcphy->dev, "Error register typec orientation switch: %ld\n",
+			PTR_ERR(tcphy->sw));
+		ret = PTR_ERR(tcphy->sw);
+		goto put_np;
+	}
+
+	ret = devm_add_action_or_reset(tcphy->dev, udphy_orien_switch_unregister, tcphy);
+
+put_np:
+	of_node_put(np);
+	return ret;
+}
+#else
+static int tcphy_setup_orien_switch(struct rockchip_typec_phy *tcphy)
+{
+	return 0;
+}
+#endif
+
 static int tcphy_cfg_usb3_to_usb2_only(struct rockchip_typec_phy *tcphy,
 				       bool value)
 {
@@ -989,14 +1202,9 @@ static int rockchip_dp_phy_power_on(struct phy *phy)
 
 	tcphy_dp_aux_calibration(tcphy);
 
-	writel(DP_MODE_ENTER_A0, tcphy->base + DP_MODE_CTL);
-
-	ret = readx_poll_timeout(readl, tcphy->base + DP_MODE_CTL,
-				 val, val & DP_MODE_A0, 1000,
-				 PHY_MODE_SET_TIMEOUT);
-	if (ret < 0) {
-		writel(DP_MODE_ENTER_A2, tcphy->base + DP_MODE_CTL);
-		dev_err(tcphy->dev, "failed to wait TCPHY enter A0\n");
+	ret = tcphy_dp_set_power_state(tcphy, PHY_DP_POWER_STATE_A0);
+	if (ret) {
+		dev_err(tcphy->dev, "failed to enter A0 power state\n");
 		goto power_on_finish;
 	}
 
@@ -1013,6 +1221,7 @@ static int rockchip_dp_phy_power_on(struct phy *phy)
 static int rockchip_dp_phy_power_off(struct phy *phy)
 {
 	struct rockchip_typec_phy *tcphy = phy_get_drvdata(phy);
+	int ret;
 
 	mutex_lock(&tcphy->lock);
 
@@ -1021,7 +1230,11 @@ static int rockchip_dp_phy_power_off(struct phy *phy)
 
 	tcphy->mode &= ~MODE_DFP_DP;
 
-	writel(DP_MODE_ENTER_A2, tcphy->base + DP_MODE_CTL);
+	ret = tcphy_dp_set_power_state(tcphy, PHY_DP_POWER_STATE_A2);
+	if (ret) {
+		dev_err(tcphy->dev, "failed to enter A2 power state\n");
+		goto unlock;
+	}
 
 	if (tcphy->mode == MODE_DISCONNECT)
 		tcphy_phy_deinit(tcphy);
@@ -1037,6 +1250,93 @@ static const struct phy_ops rockchip_dp_phy_ops = {
 	.owner		= THIS_MODULE,
 };
 
+#if IS_ENABLED(CONFIG_TYPEC)
+static int tcphy_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_state *state)
+{
+	struct rockchip_typec_phy *tcphy = typec_mux_get_drvdata(mux);
+	struct typec_displayport_data *data;
+	int hpd = 0;
+
+	mutex_lock(&tcphy->lock);
+
+	switch (state->mode) {
+	case TYPEC_STATE_SAFE:
+		fallthrough;
+	case TYPEC_STATE_USB:
+		tcphy->new_mode = MODE_DFP_USB;
+		phy_set_bus_width(tcphy->phys[TYPEC_PHY_DP], 0);
+		break;
+	case TYPEC_DP_STATE_C:
+	case TYPEC_DP_STATE_E:
+		if (state->alt->svid != USB_TYPEC_DP_SID)
+			break;
+		tcphy->new_mode = MODE_DFP_DP;
+		data = state->data;
+		hpd = !!(data->status & DP_STATUS_HPD_STATE);
+		phy_set_bus_width(tcphy->phys[TYPEC_PHY_DP], hpd ? 4 : 0);
+		break;
+	case TYPEC_DP_STATE_D:
+		if (state->alt->svid != USB_TYPEC_DP_SID)
+			break;
+		tcphy->new_mode = MODE_DFP_DP | MODE_DFP_USB;
+		data = state->data;
+		hpd = !!(data->status & DP_STATUS_HPD_STATE);
+		phy_set_bus_width(tcphy->phys[TYPEC_PHY_DP], hpd ? 2 : 0);
+		break;
+	default:
+		break;
+	}
+
+	mutex_unlock(&tcphy->lock);
+
+	return 0;
+}
+
+static void tcphy_typec_mux_unregister(void *data)
+{
+	struct rockchip_typec_phy *tcphy = data;
+
+	typec_mux_unregister(tcphy->mux);
+}
+
+static int tcphy_setup_typec_mux(struct rockchip_typec_phy *tcphy)
+{
+	struct typec_mux_desc mux_desc = {};
+	struct device_node *np;
+	int ret = 0;
+
+	np = of_get_child_by_name(tcphy->dev->of_node, "dp-port");
+	if (!np)
+		return 0;
+
+	if (!of_property_read_bool(np, "mode-switch"))
+		goto put_np;
+
+	mux_desc.drvdata = tcphy;
+	mux_desc.fwnode = device_get_named_child_node(tcphy->dev, "dp-port");
+	mux_desc.set = tcphy_typec_mux_set;
+
+	tcphy->mux = typec_mux_register(tcphy->dev, &mux_desc);
+	if (IS_ERR(tcphy->mux)) {
+		dev_err(tcphy->dev, "Error register typec mux: %ld\n",
+			PTR_ERR(tcphy->mux));
+		ret = PTR_ERR(tcphy->mux);
+		goto put_np;
+	}
+
+	ret = devm_add_action_or_reset(tcphy->dev, tcphy_typec_mux_unregister, tcphy);
+
+put_np:
+	of_node_put(np);
+	return ret;
+}
+#else
+static int tcphy_setup_typec_mux(struct rockchip_typec_phy *tcphy)
+{
+	return 0;
+}
+#endif
+
 static int tcphy_parse_dt(struct rockchip_typec_phy *tcphy,
 			  struct device *dev)
 {
@@ -1095,6 +1395,25 @@ static void typec_phy_pre_init(struct rockchip_typec_phy *tcphy)
 	tcphy->mode = MODE_DISCONNECT;
 }
 
+static int typec_dp_lane_get(struct rockchip_typec_phy *tcphy)
+{
+	int dp_lanes;
+
+	switch (tcphy->new_mode) {
+	case MODE_DFP_DP:
+		dp_lanes = 4;
+		break;
+	case MODE_DFP_DP | MODE_DFP_USB:
+		dp_lanes = 2;
+		break;
+	default:
+		dp_lanes = 0;
+		break;
+	}
+
+	return dp_lanes;
+}
+
 static int rockchip_typec_phy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1142,6 +1461,7 @@ static int rockchip_typec_phy_probe(struct platform_device *pdev)
 		return ret;
 
 	tcphy->dev = dev;
+	tcphy->new_mode = MODE_DFP_USB;
 	platform_set_drvdata(pdev, tcphy);
 	mutex_init(&tcphy->lock);
 
@@ -1151,6 +1471,7 @@ static int rockchip_typec_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(tcphy->extcon)) {
 		if (PTR_ERR(tcphy->extcon) == -ENODEV) {
 			tcphy->extcon = NULL;
+			dev_info(dev, "extcon not exist, try to use typec mux\n");
 		} else {
 			if (PTR_ERR(tcphy->extcon) != -EPROBE_DEFER)
 				dev_err(dev, "Invalid or missing extcon\n");
@@ -1158,19 +1479,34 @@ static int rockchip_typec_phy_probe(struct platform_device *pdev)
 		}
 	}
 
+	ret = tcphy_setup_orien_switch(tcphy);
+	if (ret)
+		return ret;
+
+	ret = tcphy_setup_typec_mux(tcphy);
+	if (ret)
+		return ret;
+
 	pm_runtime_enable(dev);
 
 	for_each_available_child_of_node(np, child_np) {
 		struct phy *phy;
 
-		if (of_node_name_eq(child_np, "dp-port"))
+		if (of_node_name_eq(child_np, "dp-port")) {
 			phy = devm_phy_create(dev, child_np,
 					      &rockchip_dp_phy_ops);
-		else if (of_node_name_eq(child_np, "usb3-port"))
+			if (!IS_ERR(phy)) {
+				tcphy->phys[TYPEC_PHY_DP] = phy;
+				phy_set_bus_width(phy, typec_dp_lane_get(tcphy));
+			}
+		} else if (of_node_name_eq(child_np, "usb3-port")) {
 			phy = devm_phy_create(dev, child_np,
 					      &rockchip_usb3_phy_ops);
-		else
+			if (!IS_ERR(phy))
+				tcphy->phys[TYPEC_PHY_USB] = phy;
+		} else {
 			continue;
+		}
 
 		if (IS_ERR(phy)) {
 			dev_err(dev, "failed to create phy: %pOFn\n",
-- 
2.51.1

