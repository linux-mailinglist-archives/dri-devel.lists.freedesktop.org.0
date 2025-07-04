Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23694AF955E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 16:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC6610E2B4;
	Fri,  4 Jul 2025 14:23:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="GZ33rUY6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64AEB10E2B4
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 14:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1751639013;
 bh=pjIe5xbHyZmxavJ2HWMZlWZPWolcvoBu+7pdo4pWb8k=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=GZ33rUY6hhhTgxE+sSSWspa40+3Q1aSdfARYToNJDEiApBCYbllaKHTSHoPaZMCus
 hy/F2BJTwnN70ieQM7zmuCYBrGsBEyLV+6xhEl2WSsE/92rlnv6jNK+nBa++dKUlkp
 282Qnq+z4ZRJWiNJnDEI3oBOz/TkhTAId1QUzjaB5vGO+0hURwqzuJlK2+V3ju21yN
 9qYbX03qe+7ZbjZtH3Hvzy15GChVJ+f50SO4pmW8XB0kVf6QgqmLqHGFkSFu5gjGWc
 aq4IgKeyoHkMNEeb7BQX0Eg53ft55Ss/CYQJgioLFQ9alvk0iWndMPoc/oVywCnfaY
 r7xA8mAnklnFg==
Received: from localhost (unknown [212.93.144.165])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id F0F3817E09C6;
 Fri,  4 Jul 2025 16:23:32 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 04 Jul 2025 17:23:23 +0300
Subject: [PATCH 2/5] drm/bridge: dw-hdmi-qp: Add CEC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-rk3588-hdmi-cec-v1-2-2bd8de8700cd@collabora.com>
References: <20250704-rk3588-hdmi-cec-v1-0-2bd8de8700cd@collabora.com>
In-Reply-To: <20250704-rk3588-hdmi-cec-v1-0-2bd8de8700cd@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Algea Cao <algea.cao@rock-chips.com>, 
 Derek Foreman <derek.foreman@collabora.com>
X-Mailer: b4 0.14.2
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

Add support for the CEC interface of the Synopsys DesignWare HDMI QP TX
controller.

This is based on the downstream implementation, but rewritten on top of
the CEC helpers added recently to the DRM HDMI connector framework.

Co-developed-by: Algea Cao <algea.cao@rock-chips.com>
Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
Co-developed-by: Derek Foreman <derek.foreman@collabora.com>
Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/Kconfig      |   8 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 220 +++++++++++++++++++++++++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h |  14 ++
 3 files changed, 242 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/Kconfig b/drivers/gpu/drm/bridge/synopsys/Kconfig
index f3ab2f985f8ca9dc1eeac3bda6b4a31d355cd51c..99878f051067e65fa3b97d8132be8cfa15980966 100644
--- a/drivers/gpu/drm/bridge/synopsys/Kconfig
+++ b/drivers/gpu/drm/bridge/synopsys/Kconfig
@@ -54,6 +54,14 @@ config DRM_DW_HDMI_QP
 	select DRM_KMS_HELPER
 	select REGMAP_MMIO
 
+config DRM_DW_HDMI_QP_CEC
+	bool "Synopsis Designware QP CEC interface"
+	depends on DRM_DW_HDMI_QP
+	select DRM_DISPLAY_HDMI_CEC_HELPER
+	help
+	  Support the CEC interface which is part of the Synopsys
+	  Designware HDMI QP block.
+
 config DRM_DW_MIPI_DSI
 	tristate
 	select DRM_KMS_HELPER
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 7ade80f02a94c91905c13b4a945c65da5681b183..cfe8171b2183874517f583f284f7728fe1613c91 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -18,6 +18,7 @@
 
 #include <drm/bridge/dw_hdmi_qp.h>
 #include <drm/display/drm_hdmi_helper.h>
+#include <drm/display/drm_hdmi_cec_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -26,6 +27,8 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_modes.h>
 
+#include <media/cec.h>
+
 #include <sound/hdmi-codec.h>
 
 #include "dw-hdmi-qp.h"
@@ -131,12 +134,28 @@ struct dw_hdmi_qp_i2c {
 	bool			is_segment;
 };
 
+#ifdef CONFIG_DRM_DW_HDMI_QP_CEC
+struct dw_hdmi_qp_cec {
+	struct drm_connector *connector;
+	int irq;
+	u32 addresses;
+	struct cec_msg rx_msg;
+	u8 tx_status;
+	bool tx_done;
+	bool rx_done;
+};
+#endif
+
 struct dw_hdmi_qp {
 	struct drm_bridge bridge;
 
 	struct device *dev;
 	struct dw_hdmi_qp_i2c *i2c;
 
+#ifdef CONFIG_DRM_DW_HDMI_QP_CEC
+	struct dw_hdmi_qp_cec *cec;
+#endif
+
 	struct {
 		const struct dw_hdmi_qp_phy_ops *ops;
 		void *data;
@@ -965,6 +984,191 @@ static int dw_hdmi_qp_bridge_write_infoframe(struct drm_bridge *bridge,
 	}
 }
 
+#ifdef CONFIG_DRM_DW_HDMI_QP_CEC
+static irqreturn_t dw_hdmi_qp_cec_hardirq(int irq, void *dev_id)
+{
+	struct dw_hdmi_qp *hdmi = dev_id;
+	struct dw_hdmi_qp_cec *cec = hdmi->cec;
+	irqreturn_t ret = IRQ_HANDLED;
+	u32 stat;
+
+	stat = dw_hdmi_qp_read(hdmi, CEC_INT_STATUS);
+	if (stat == 0)
+		return IRQ_NONE;
+
+	dw_hdmi_qp_write(hdmi, stat, CEC_INT_CLEAR);
+
+	if (stat & CEC_STAT_LINE_ERR) {
+		cec->tx_status = CEC_TX_STATUS_ERROR;
+		cec->tx_done = true;
+		ret = IRQ_WAKE_THREAD;
+	} else if (stat & CEC_STAT_DONE) {
+		cec->tx_status = CEC_TX_STATUS_OK;
+		cec->tx_done = true;
+		ret = IRQ_WAKE_THREAD;
+	} else if (stat & CEC_STAT_NACK) {
+		cec->tx_status = CEC_TX_STATUS_NACK;
+		cec->tx_done = true;
+		ret = IRQ_WAKE_THREAD;
+	}
+
+	if (stat & CEC_STAT_EOM) {
+		unsigned int len, i, val;
+
+		val = dw_hdmi_qp_read(hdmi, CEC_RX_COUNT_STATUS);
+		len = (val & 0xf) + 1;
+
+		if (len > sizeof(cec->rx_msg.msg))
+			len = sizeof(cec->rx_msg.msg);
+
+		for (i = 0; i < 4; i++) {
+			val = dw_hdmi_qp_read(hdmi, CEC_RX_DATA3_0 + i * 4);
+			cec->rx_msg.msg[i * 4] = val & 0xff;
+			cec->rx_msg.msg[i * 4 + 1] = (val >> 8) & 0xff;
+			cec->rx_msg.msg[i * 4 + 2] = (val >> 16) & 0xff;
+			cec->rx_msg.msg[i * 4 + 3] = (val >> 24) & 0xff;
+		}
+
+		dw_hdmi_qp_write(hdmi, 1, CEC_LOCK_CONTROL);
+
+		cec->rx_msg.len = len;
+		cec->rx_done = true;
+
+		ret = IRQ_WAKE_THREAD;
+	}
+
+	return ret;
+}
+
+static irqreturn_t dw_hdmi_qp_cec_thread(int irq, void *dev_id)
+{
+	struct dw_hdmi_qp *hdmi = dev_id;
+	struct dw_hdmi_qp_cec *cec = hdmi->cec;
+
+	if (cec->tx_done) {
+		cec->tx_done = false;
+		drm_connector_hdmi_cec_transmit_attempt_done(cec->connector,
+							     cec->tx_status);
+	}
+
+	if (cec->rx_done) {
+		cec->rx_done = false;
+		drm_connector_hdmi_cec_received_msg(cec->connector, &cec->rx_msg);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int dw_hdmi_qp_cec_init(struct drm_connector *connector,
+			       struct drm_bridge *bridge)
+{
+	struct dw_hdmi_qp *hdmi = dw_hdmi_qp_from_bridge(bridge);
+	struct dw_hdmi_qp_cec *cec = hdmi->cec;
+	int ret;
+
+	if (cec->irq < 0) {
+		dev_err(hdmi->dev, "Invalid cec irq: %d\n", cec->irq);
+		return -EINVAL;
+	}
+
+	cec->connector = connector;
+
+	dw_hdmi_qp_write(hdmi, 0, CEC_TX_COUNT);
+	dw_hdmi_qp_write(hdmi, ~0, CEC_INT_CLEAR);
+	dw_hdmi_qp_write(hdmi, 0, CEC_INT_MASK_N);
+
+	ret = devm_request_threaded_irq(hdmi->dev, cec->irq,
+					dw_hdmi_qp_cec_hardirq,
+					dw_hdmi_qp_cec_thread, IRQF_SHARED,
+					dev_name(hdmi->dev), hdmi);
+	if (ret < 0) {
+		dev_err(hdmi->dev, "Request cec irq thread failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int dw_hdmi_qp_cec_log_addr(struct drm_bridge *bridge, u8 logical_addr)
+{
+	struct dw_hdmi_qp *hdmi = dw_hdmi_qp_from_bridge(bridge);
+	struct dw_hdmi_qp_cec *cec = hdmi->cec;
+
+	if (logical_addr == CEC_LOG_ADDR_INVALID)
+		cec->addresses = 0;
+	else
+		cec->addresses |= BIT(logical_addr) | CEC_ADDR_BROADCAST;
+
+	dw_hdmi_qp_write(hdmi, cec->addresses, CEC_ADDR);
+
+	return 0;
+}
+
+static int dw_hdmi_qp_cec_enable(struct drm_bridge *bridge, bool enable)
+{
+	struct dw_hdmi_qp *hdmi = dw_hdmi_qp_from_bridge(bridge);
+	unsigned int irqs;
+	u32 swdisable;
+
+	if (!enable) {
+		dw_hdmi_qp_write(hdmi, 0, CEC_INT_MASK_N);
+		dw_hdmi_qp_write(hdmi, ~0, CEC_INT_CLEAR);
+
+		swdisable = dw_hdmi_qp_read(hdmi, GLOBAL_SWDISABLE);
+		swdisable = swdisable | CEC_SWDISABLE;
+		dw_hdmi_qp_write(hdmi, swdisable, GLOBAL_SWDISABLE);
+	} else {
+		swdisable = dw_hdmi_qp_read(hdmi, GLOBAL_SWDISABLE);
+		swdisable = swdisable & ~CEC_SWDISABLE;
+		dw_hdmi_qp_write(hdmi, swdisable, GLOBAL_SWDISABLE);
+
+		dw_hdmi_qp_write(hdmi, ~0, CEC_INT_CLEAR);
+		dw_hdmi_qp_write(hdmi, 1, CEC_LOCK_CONTROL);
+
+		dw_hdmi_qp_cec_log_addr(bridge, CEC_LOG_ADDR_INVALID);
+
+		irqs = CEC_STAT_LINE_ERR | CEC_STAT_NACK | CEC_STAT_EOM |
+		       CEC_STAT_DONE;
+		dw_hdmi_qp_write(hdmi, ~0, CEC_INT_CLEAR);
+		dw_hdmi_qp_write(hdmi, irqs, CEC_INT_MASK_N);
+	}
+
+	return 0;
+}
+
+static int dw_hdmi_qp_cec_transmit(struct drm_bridge *bridge, u8 attempts,
+				   u32 signal_free_time, struct cec_msg *msg)
+{
+	struct dw_hdmi_qp *hdmi = dw_hdmi_qp_from_bridge(bridge);
+	unsigned int i;
+	u32 val;
+
+	for (i = 0; i < msg->len; i++) {
+		if (!(i % 4))
+			val = msg->msg[i];
+		if ((i % 4) == 1)
+			val |= msg->msg[i] << 8;
+		if ((i % 4) == 2)
+			val |= msg->msg[i] << 16;
+		if ((i % 4) == 3)
+			val |= msg->msg[i] << 24;
+
+		if (i == (msg->len - 1) || (i % 4) == 3)
+			dw_hdmi_qp_write(hdmi, val, CEC_TX_DATA3_0 + (i / 4) * 4);
+	}
+
+	dw_hdmi_qp_write(hdmi, msg->len - 1, CEC_TX_COUNT);
+	dw_hdmi_qp_write(hdmi, CEC_CTRL_START, CEC_TX_CONTROL);
+
+	return 0;
+}
+#else
+#define dw_hdmi_qp_cec_init NULL
+#define dw_hdmi_qp_cec_enable NULL
+#define dw_hdmi_qp_cec_log_addr NULL
+#define dw_hdmi_qp_cec_transmit NULL
+#endif /* CONFIG_DRM_DW_HDMI_QP_CEC */
+
 static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
@@ -979,6 +1183,10 @@ static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
 	.hdmi_audio_startup = dw_hdmi_qp_audio_enable,
 	.hdmi_audio_shutdown = dw_hdmi_qp_audio_disable,
 	.hdmi_audio_prepare = dw_hdmi_qp_audio_prepare,
+	.hdmi_cec_init = dw_hdmi_qp_cec_init,
+	.hdmi_cec_enable = dw_hdmi_qp_cec_enable,
+	.hdmi_cec_log_addr = dw_hdmi_qp_cec_log_addr,
+	.hdmi_cec_transmit = dw_hdmi_qp_cec_transmit,
 };
 
 static irqreturn_t dw_hdmi_qp_main_hardirq(int irq, void *dev_id)
@@ -1093,6 +1301,18 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 	hdmi->bridge.hdmi_audio_dev = dev;
 	hdmi->bridge.hdmi_audio_dai_port = 1;
 
+#ifdef CONFIG_DRM_DW_HDMI_QP_CEC
+	hdmi->bridge.ops |= DRM_BRIDGE_OP_HDMI_CEC_ADAPTER;
+	hdmi->bridge.hdmi_cec_dev = dev;
+	hdmi->bridge.hdmi_cec_adapter_name = dev_name(dev);
+
+	hdmi->cec = devm_kzalloc(hdmi->dev, sizeof(*hdmi->cec), GFP_KERNEL);
+	if (!hdmi->cec)
+		return ERR_PTR(-ENOMEM);
+
+	hdmi->cec->irq = plat_data->cec_irq;
+#endif
+
 	ret = devm_drm_bridge_add(dev, &hdmi->bridge);
 	if (ret)
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h
index 72987e6c468928f2b998099697a6f32726411557..91a15f82e32acc32eef58f11ec5ca958337ebb9a 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h
@@ -488,9 +488,23 @@
 #define AUDPKT_VBIT_OVR0				0xf24
 /* CEC Registers */
 #define CEC_TX_CONTROL					0x1000
+#define CEC_CTRL_CLEAR					BIT(0)
+#define CEC_CTRL_START					BIT(0)
 #define CEC_STATUS					0x1004
+#define CEC_STAT_DONE					BIT(0)
+#define CEC_STAT_NACK					BIT(1)
+#define CEC_STAT_ARBLOST				BIT(2)
+#define CEC_STAT_LINE_ERR				BIT(3)
+#define CEC_STAT_RETRANS_FAIL				BIT(4)
+#define CEC_STAT_DISCARD				BIT(5)
+#define CEC_STAT_TX_BUSY				BIT(8)
+#define CEC_STAT_RX_BUSY				BIT(9)
+#define CEC_STAT_DRIVE_ERR				BIT(10)
+#define CEC_STAT_EOM					BIT(11)
+#define CEC_STAT_NOTIFY_ERR				BIT(12)
 #define CEC_CONFIG					0x1008
 #define CEC_ADDR					0x100c
+#define CEC_ADDR_BROADCAST				BIT(15)
 #define CEC_TX_COUNT					0x1020
 #define CEC_TX_DATA3_0					0x1024
 #define CEC_TX_DATA7_4					0x1028

-- 
2.50.0

