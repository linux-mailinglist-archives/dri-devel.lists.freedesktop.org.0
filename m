Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 012D39FEE87
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 10:44:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8727E10E628;
	Tue, 31 Dec 2024 09:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="HbGIzSfy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4AEE710E623
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 09:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version:
 Content-Type; bh=GGNk+E6dN1fEhd5Gt/Vz/ei4dfIItKSH9jCkiZwv9sY=;
 b=HbGIzSfy5SNCKN8MSGGkVz1hsF8QY1jnejLcZS9JEQMYA39C7rCh1FXoMVswFU
 dLx8KiQgxVfwuteOQEJ+U5a2MjMxJeOhjPsZLkpi4PCDV26KHfsVivRrAjaniFdj
 tVcAco4xxzgp61VjnRAeo+PsZlCSRd5Yzk51v0CKtdyvY=
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id
 _____wD3v8P6vHNnCZWrCw--.29543S3; 
 Tue, 31 Dec 2024 17:44:30 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: krzk+dt@kernel.org, mripard@kernel.org, robh@kernel.org,
 hjc@rock-chips.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2 1/3] drm/rockchip: dw_hdmi_qp: Add platform ctrl callback
Date: Tue, 31 Dec 2024 17:44:17 +0800
Message-ID: <20241231094425.253398-2-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241231094425.253398-1-andyshrk@163.com>
References: <20241231094425.253398-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3v8P6vHNnCZWrCw--.29543S3
X-Coremail-Antispam: 1Uf129KBjvJXoW3WFWrZF4UurWDGFyxAr13urg_yoW7ArW8p3
 yUAw1YyrWkJF47Xr4FvF97tFW2y3W7J3ySqF97tFyYy3WFqrn5KF93Wa15Jr4SvF9xuF47
 C39Yy34rJF1UGFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j4eHDUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hnGXmdzt4WQFgAAsz
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

There are some control bits for IO and interrupts status scattered
across different GRF on differt SOC.
Add platform callback for this IO setting and interrupts status
handling.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v2:
- Fix compilation warning: unused variable ‘val’ [-Wunused-variable]

 .../gpu/drm/rockchip/dw_hdmi_qp-rockchip.c    | 82 ++++++++++++-------
 1 file changed, 54 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index c36fc130b734..711bbe1c7470 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -62,6 +62,12 @@ struct rockchip_hdmi_qp {
 	int port_id;
 };
 
+struct rockchip_hdmi_qp_ctrl_ops {
+	void (*io_init)(struct rockchip_hdmi_qp *hdmi);
+	irqreturn_t (*irq_callback)(int irq, void *dev_id);
+	irqreturn_t (*hardirq_callback)(int irq, void *dev_id);
+};
+
 static struct rockchip_hdmi_qp *to_rockchip_hdmi_qp(struct drm_encoder *encoder)
 {
 	struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
@@ -226,9 +232,47 @@ static irqreturn_t dw_hdmi_qp_rk3588_irq(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static void dw_hdmi_qp_rk3588_io_init(struct rockchip_hdmi_qp *hdmi)
+{
+	u32 val;
+
+	val = HIWORD_UPDATE(RK3588_SCLIN_MASK, RK3588_SCLIN_MASK) |
+	      HIWORD_UPDATE(RK3588_SDAIN_MASK, RK3588_SDAIN_MASK) |
+	      HIWORD_UPDATE(RK3588_MODE_MASK, RK3588_MODE_MASK) |
+	      HIWORD_UPDATE(RK3588_I2S_SEL_MASK, RK3588_I2S_SEL_MASK);
+
+	regmap_write(hdmi->vo_regmap,
+		     hdmi->port_id ? RK3588_GRF_VO1_CON6 : RK3588_GRF_VO1_CON3,
+		     val);
+
+	val = HIWORD_UPDATE(RK3588_SET_HPD_PATH_MASK, RK3588_SET_HPD_PATH_MASK);
+	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON7, val);
+
+	if (hdmi->port_id)
+		val = HIWORD_UPDATE(RK3588_HDMI1_GRANT_SEL,
+				RK3588_HDMI1_GRANT_SEL);
+	else
+		val = HIWORD_UPDATE(RK3588_HDMI0_GRANT_SEL,
+				RK3588_HDMI0_GRANT_SEL);
+	regmap_write(hdmi->vo_regmap, RK3588_GRF_VO1_CON9, val);
+
+	if (hdmi->port_id)
+		val = HIWORD_UPDATE(RK3588_HDMI1_HPD_INT_MSK, RK3588_HDMI1_HPD_INT_MSK);
+	else
+		val = HIWORD_UPDATE(RK3588_HDMI0_HPD_INT_MSK, RK3588_HDMI0_HPD_INT_MSK);
+	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON2, val);
+}
+
+static const struct rockchip_hdmi_qp_ctrl_ops rk3588_hdmi_ctrl_ops = {
+	.io_init		= dw_hdmi_qp_rk3588_io_init,
+	.irq_callback	        = dw_hdmi_qp_rk3588_irq,
+	.hardirq_callback	= dw_hdmi_qp_rk3588_hardirq,
+};
+
 struct rockchip_hdmi_qp_cfg {
 	unsigned int num_ports;
 	unsigned int port_ids[MAX_HDMI_PORT_NUM];
+	const struct rockchip_hdmi_qp_ctrl_ops *ctrl_ops;
 	const struct dw_hdmi_qp_phy_ops *phy_ops;
 };
 
@@ -238,6 +282,7 @@ static const struct rockchip_hdmi_qp_cfg rk3588_hdmi_cfg = {
 		0xfde80000,
 		0xfdea0000,
 	},
+	.ctrl_ops = &rk3588_hdmi_ctrl_ops,
 	.phy_ops = &rk3588_hdmi_phy_ops,
 };
 
@@ -265,7 +310,6 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	struct resource *res;
 	struct clk *clk;
 	int ret, irq, i;
-	u32 val;
 
 	if (!pdev->dev.of_node)
 		return -ENODEV;
@@ -282,6 +326,12 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	if (!cfg)
 		return -ENODEV;
 
+	if (!cfg->ctrl_ops || !cfg->ctrl_ops->io_init ||
+	    !cfg->ctrl_ops->irq_callback || !cfg->ctrl_ops->irq_callback) {
+		dev_err(dev, "Missing platform ctrl ops\n");
+		return -ENODEV;
+	}
+
 	hdmi->dev = &pdev->dev;
 	hdmi->port_id = -ENODEV;
 
@@ -357,31 +407,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 		return ret;
 	}
 
-	val = HIWORD_UPDATE(RK3588_SCLIN_MASK, RK3588_SCLIN_MASK) |
-	      HIWORD_UPDATE(RK3588_SDAIN_MASK, RK3588_SDAIN_MASK) |
-	      HIWORD_UPDATE(RK3588_MODE_MASK, RK3588_MODE_MASK) |
-	      HIWORD_UPDATE(RK3588_I2S_SEL_MASK, RK3588_I2S_SEL_MASK);
-	regmap_write(hdmi->vo_regmap,
-		     hdmi->port_id ? RK3588_GRF_VO1_CON6 : RK3588_GRF_VO1_CON3,
-		     val);
-
-	val = HIWORD_UPDATE(RK3588_SET_HPD_PATH_MASK,
-			    RK3588_SET_HPD_PATH_MASK);
-	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON7, val);
-
-	if (hdmi->port_id)
-		val = HIWORD_UPDATE(RK3588_HDMI1_GRANT_SEL,
-				    RK3588_HDMI1_GRANT_SEL);
-	else
-		val = HIWORD_UPDATE(RK3588_HDMI0_GRANT_SEL,
-				    RK3588_HDMI0_GRANT_SEL);
-	regmap_write(hdmi->vo_regmap, RK3588_GRF_VO1_CON9, val);
-
-	if (hdmi->port_id)
-		val = HIWORD_UPDATE(RK3588_HDMI1_HPD_INT_MSK, RK3588_HDMI1_HPD_INT_MSK);
-	else
-		val = HIWORD_UPDATE(RK3588_HDMI0_HPD_INT_MSK, RK3588_HDMI0_HPD_INT_MSK);
-	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON2, val);
+	cfg->ctrl_ops->io_init(hdmi);
 
 	INIT_DELAYED_WORK(&hdmi->hpd_work, dw_hdmi_qp_rk3588_hpd_work);
 
@@ -394,8 +420,8 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 		return irq;
 
 	ret = devm_request_threaded_irq(hdmi->dev, irq,
-					dw_hdmi_qp_rk3588_hardirq,
-					dw_hdmi_qp_rk3588_irq,
+					cfg->ctrl_ops->hardirq_callback,
+					cfg->ctrl_ops->irq_callback,
 					IRQF_SHARED, "dw-hdmi-qp-hpd",
 					hdmi);
 	if (ret)
-- 
2.34.1

