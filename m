Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E65769FEE85
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 10:44:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2D310E623;
	Tue, 31 Dec 2024 09:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="iC6FpPTN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id A8B7210E623
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 09:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=YwJsx
 9tuqzRtv1xmM/rKlqDG9slqFAbEfQwpxDjham4=; b=iC6FpPTNdQ+riK0PaFQlC
 Wo1CWZzuxanjWWB7/8eomiU4hiFVK85dD3V5jbl4OT8pWFtFV01Hpw6KYHSLRxHk
 QplMk1o88DVgdK1x8RFpjRFJY0aTrbYZ8VNvez7TUv+gN5VveKc1w3YoibQxPasm
 hvrQnkvU+fQmaQGyADx34Y=
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id
 _____wD3v8P6vHNnCZWrCw--.29543S5; 
 Tue, 31 Dec 2024 17:44:32 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: krzk+dt@kernel.org, mripard@kernel.org, robh@kernel.org,
 hjc@rock-chips.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>,
 Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v2 3/3] drm/rockchip: Add basic RK3576 HDMI output support
Date: Tue, 31 Dec 2024 17:44:19 +0800
Message-ID: <20241231094425.253398-4-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241231094425.253398-1-andyshrk@163.com>
References: <20241231094425.253398-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3v8P6vHNnCZWrCw--.29543S5
X-Coremail-Antispam: 1Uf129KBjvJXoW3WFyrKF1xAF45Gw1kWFWDCFg_yoWxtry7pw
 42y345tFykJF47Jw1IyFn3X3y2kwnrt3yrWa9rWayayFyFgr1fKF93WF45JFyDuFykZFy2
 ka1kZay5XFnrtrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jxiSdUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqQrGXmdztQzPaQAAsw
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

The HDMI on RK3576 shares the same IP block (PHY and Controller)
with rk3588.
However, there are some control bits scattered in different GRF.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
Tested-by: Detlev Casanova <detlev.casanova@collabora.com>
---

(no changes since v1)

 .../gpu/drm/rockchip/dw_hdmi_qp-rockchip.c    | 143 +++++++++++++++++-
 1 file changed, 141 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 711bbe1c7470..5d83fadadf1d 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -25,6 +25,41 @@
 
 #include "rockchip_drm_drv.h"
 
+#define RK3576_IOC_MISC_CON0		0xa400
+#define RK3576_HDMI_HPD_INT_MSK		BIT(2)
+#define RK3576_HDMI_HPD_INT_CLR		BIT(1)
+
+#define RK3576_IOC_HDMI_HPD_STATUS	0xa440
+#define RK3576_HDMI_LEVEL_INT		BIT(3)
+
+#define RK3576_VO0_GRF_SOC_CON1		0x0004
+#define RK3576_HDMI_FRL_MOD		BIT(0)
+#define RK3576_HDMI_HDCP14_MEM_EN	BIT(15)
+
+#define RK3576_VO0_GRF_SOC_CON8		0x0020
+#define RK3576_COLOR_FORMAT_MASK	(0xf << 4)
+#define RK3576_COLOR_DEPTH_MASK		(0xf << 8)
+#define RK3576_RGB                     (0 << 4)
+#define RK3576_YUV422                  (0x1 << 4)
+#define RK3576_YUV444                  (0x2 << 4)
+#define RK3576_YUV420                  (0x3 << 4)
+#define RK3576_8BPC                    (0x0 << 8)
+#define RK3576_10BPC                   (0x6 << 8)
+#define RK3576_CECIN_MASK		BIT(3)
+
+#define RK3576_VO0_GRF_SOC_CON12	0x0030
+#define RK3576_GRF_OSDA_DLYN		(0xf << 12)
+#define RK3576_GRF_OSDA_DIV		(0x7f << 1)
+#define RK3576_GRF_OSDA_DLY_EN		BIT(0)
+
+#define RK3576_VO0_GRF_SOC_CON14	0x0038
+#define RK3576_I2S_SEL_MASK		BIT(0)
+#define RK3576_SPDIF_SEL_MASK		BIT(1)
+#define HDCP0_P1_GPIO_IN		BIT(2)
+#define RK3576_SCLIN_MASK		BIT(4)
+#define RK3576_SDAIN_MASK		BIT(5)
+#define RK3576_HDMI_GRANT_SEL		BIT(6)
+
 #define RK3588_GRF_SOC_CON2		0x0308
 #define RK3588_HDMI0_HPD_INT_MSK	BIT(13)
 #define RK3588_HDMI0_HPD_INT_CLR	BIT(12)
@@ -167,6 +202,37 @@ static const struct dw_hdmi_qp_phy_ops rk3588_hdmi_phy_ops = {
 	.setup_hpd	= dw_hdmi_qp_rk3588_setup_hpd,
 };
 
+static enum drm_connector_status
+dw_hdmi_qp_rk3576_read_hpd(struct dw_hdmi_qp *dw_hdmi, void *data)
+{
+	struct rockchip_hdmi_qp *hdmi = (struct rockchip_hdmi_qp *)data;
+	u32 val;
+
+	regmap_read(hdmi->regmap, RK3576_IOC_HDMI_HPD_STATUS, &val);
+
+	return val & RK3576_HDMI_LEVEL_INT ?
+		connector_status_connected : connector_status_disconnected;
+}
+
+static void dw_hdmi_qp_rk3576_setup_hpd(struct dw_hdmi_qp *dw_hdmi, void *data)
+{
+	struct rockchip_hdmi_qp *hdmi = (struct rockchip_hdmi_qp *)data;
+	u32 val;
+
+	val = HIWORD_UPDATE(RK3576_HDMI_HPD_INT_CLR,
+	      RK3576_HDMI_HPD_INT_CLR | RK3576_HDMI_HPD_INT_MSK);
+
+	regmap_write(hdmi->regmap, RK3576_IOC_MISC_CON0, val);
+	regmap_write(hdmi->regmap, 0xa404, 0xffff0102);
+}
+
+static const struct dw_hdmi_qp_phy_ops rk3576_hdmi_phy_ops = {
+	.init		= dw_hdmi_qp_rk3588_phy_init,
+	.disable	= dw_hdmi_qp_rk3588_phy_disable,
+	.read_hpd	= dw_hdmi_qp_rk3576_read_hpd,
+	.setup_hpd	= dw_hdmi_qp_rk3576_setup_hpd,
+};
+
 static void dw_hdmi_qp_rk3588_hpd_work(struct work_struct *work)
 {
 	struct rockchip_hdmi_qp *hdmi = container_of(work,
@@ -182,6 +248,45 @@ static void dw_hdmi_qp_rk3588_hpd_work(struct work_struct *work)
 	}
 }
 
+static irqreturn_t dw_hdmi_qp_rk3576_hardirq(int irq, void *dev_id)
+{
+	struct rockchip_hdmi_qp *hdmi = dev_id;
+	u32 intr_stat, val;
+
+	regmap_read(hdmi->regmap, RK3576_IOC_HDMI_HPD_STATUS, &intr_stat);
+	if (intr_stat) {
+		val = HIWORD_UPDATE(RK3576_HDMI_HPD_INT_MSK,
+				RK3576_HDMI_HPD_INT_MSK);
+
+		regmap_write(hdmi->regmap, RK3576_IOC_MISC_CON0, val);
+		return IRQ_WAKE_THREAD;
+	}
+
+	return IRQ_NONE;
+}
+
+static irqreturn_t dw_hdmi_qp_rk3576_irq(int irq, void *dev_id)
+{
+	struct rockchip_hdmi_qp *hdmi = dev_id;
+	u32 intr_stat, val;
+
+	regmap_read(hdmi->regmap, RK3576_IOC_HDMI_HPD_STATUS, &intr_stat);
+
+	if (!intr_stat)
+		return IRQ_NONE;
+
+	val = HIWORD_UPDATE(RK3576_HDMI_HPD_INT_CLR,
+			RK3576_HDMI_HPD_INT_CLR);
+	regmap_write(hdmi->regmap, RK3576_IOC_MISC_CON0, val);
+	mod_delayed_work(system_wq, &hdmi->hpd_work,
+			msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
+
+	val = HIWORD_UPDATE(0, RK3576_HDMI_HPD_INT_MSK);
+	regmap_write(hdmi->regmap, RK3576_IOC_MISC_CON0, val);
+
+	return IRQ_HANDLED;
+}
+
 static irqreturn_t dw_hdmi_qp_rk3588_hardirq(int irq, void *dev_id)
 {
 	struct rockchip_hdmi_qp *hdmi = dev_id;
@@ -232,6 +337,21 @@ static irqreturn_t dw_hdmi_qp_rk3588_irq(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static void dw_hdmi_qp_rk3576_io_init(struct rockchip_hdmi_qp *hdmi)
+{
+	u32 val;
+
+	val = HIWORD_UPDATE(RK3576_SCLIN_MASK, RK3576_SCLIN_MASK) |
+		HIWORD_UPDATE(RK3576_SDAIN_MASK, RK3576_SDAIN_MASK) |
+		HIWORD_UPDATE(RK3576_HDMI_GRANT_SEL, RK3576_HDMI_GRANT_SEL) |
+		HIWORD_UPDATE(RK3576_I2S_SEL_MASK, RK3576_I2S_SEL_MASK);
+
+	regmap_write(hdmi->vo_regmap, RK3576_VO0_GRF_SOC_CON14, val);
+
+	val = HIWORD_UPDATE(0, RK3576_HDMI_HPD_INT_MSK);
+	regmap_write(hdmi->regmap, RK3576_IOC_MISC_CON0, val);
+}
+
 static void dw_hdmi_qp_rk3588_io_init(struct rockchip_hdmi_qp *hdmi)
 {
 	u32 val;
@@ -263,6 +383,12 @@ static void dw_hdmi_qp_rk3588_io_init(struct rockchip_hdmi_qp *hdmi)
 	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON2, val);
 }
 
+static const struct rockchip_hdmi_qp_ctrl_ops rk3576_hdmi_ctrl_ops = {
+	.io_init		= dw_hdmi_qp_rk3576_io_init,
+	.irq_callback	        = dw_hdmi_qp_rk3576_irq,
+	.hardirq_callback	= dw_hdmi_qp_rk3576_hardirq,
+};
+
 static const struct rockchip_hdmi_qp_ctrl_ops rk3588_hdmi_ctrl_ops = {
 	.io_init		= dw_hdmi_qp_rk3588_io_init,
 	.irq_callback	        = dw_hdmi_qp_rk3588_irq,
@@ -276,6 +402,15 @@ struct rockchip_hdmi_qp_cfg {
 	const struct dw_hdmi_qp_phy_ops *phy_ops;
 };
 
+static const struct rockchip_hdmi_qp_cfg rk3576_hdmi_cfg = {
+	.num_ports = 1,
+	.port_ids = {
+		0x27da0000,
+	},
+	.ctrl_ops = &rk3576_hdmi_ctrl_ops,
+	.phy_ops = &rk3576_hdmi_phy_ops,
+};
+
 static const struct rockchip_hdmi_qp_cfg rk3588_hdmi_cfg = {
 	.num_ports = 2,
 	.port_ids = {
@@ -287,8 +422,12 @@ static const struct rockchip_hdmi_qp_cfg rk3588_hdmi_cfg = {
 };
 
 static const struct of_device_id dw_hdmi_qp_rockchip_dt_ids[] = {
-	{ .compatible = "rockchip,rk3588-dw-hdmi-qp",
-	  .data = &rk3588_hdmi_cfg },
+	{ .compatible = "rockchip,rk3576-dw-hdmi-qp",
+	  .data = &rk3576_hdmi_cfg
+	}, {
+	  .compatible = "rockchip,rk3588-dw-hdmi-qp",
+	  .data = &rk3588_hdmi_cfg
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, dw_hdmi_qp_rockchip_dt_ids);
-- 
2.34.1

