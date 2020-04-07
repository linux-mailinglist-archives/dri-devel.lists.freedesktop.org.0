Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C89531A185B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 00:49:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE3E6E933;
	Tue,  7 Apr 2020 22:49:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FAC6E933
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 22:48:59 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1586299742; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=IFf+TsUeR2GLwyGXMEmsndxOiqKVvu6z0iQgkg9Rufg=;
 b=varXnfO8p0fGk3D569hVgtIlHY5XuzH5hJwWLEg70IW4bthsnnKocCC5JauXM5befaBHrC7A
 VwWB6LN8rjM3sdpycCIoOq9f9wmJfRDqI5CIzPO3vwEim4k6WyKuJwV8Ze6kfFzkO8VRqdht
 teNRVARx/+uKHiHE2Bz2gp7ZbOc=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8d0352.7f546c570618-smtp-out-n05;
 Tue, 07 Apr 2020 22:48:50 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1876AC433D2; Tue,  7 Apr 2020 22:48:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from linuxdisplay-lab-04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: tanmay)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 10B40C433BA;
 Tue,  7 Apr 2020 22:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 10B40C433BA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=tanmay@codeaurora.org
From: Tanmay Shah <tanmay@codeaurora.org>
To: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, seanpaul@chromium.org,
 devicetree@vger.kernel.org, swboyd@chromium.org, abhinavk@codeaurora.org,
 robdclark@gmail.com, aravindh@codeaurora.org, varar@codeaurora.org
Subject: [PATCH 2/2] drm/msm/dp: Add Hot Plug Detect feature
Date: Tue,  7 Apr 2020 15:48:29 -0700
Message-Id: <1586299709-14222-2-git-send-email-tanmay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1586299709-14222-1-git-send-email-tanmay@codeaurora.org>
References: <1586299709-14222-1-git-send-email-tanmay@codeaurora.org>
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
Cc: Tanmay Shah <tanmay@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Configure HPD registers and interrupts to detect connect and
disconnect pulses on HPD pin and issue hot plug accordingly.

This patch depends on:
	https://patchwork.kernel.org/patch/11468511
	https://patchwork.kernel.org/patch/11468715
	https://patchwork.kernel.org/patch/11468519
	https://patchwork.kernel.org/patch/11468515

Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |  18 ++++++
 drivers/gpu/drm/msm/dp/dp_catalog.c     |  69 +++++++++++++-------
 drivers/gpu/drm/msm/dp/dp_catalog.h     |   5 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c        |   1 -
 drivers/gpu/drm/msm/dp/dp_display.c     | 110 +++++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/dp/dp_hpd.h         |   3 +
 drivers/gpu/drm/msm/dp/dp_parser.c      |  28 ++++++++
 drivers/gpu/drm/msm/dp/dp_parser.h      |   7 +-
 drivers/gpu/drm/msm/dp/dp_reg.h         |  12 ++++
 drivers/gpu/drm/msm/msm_drv.h           |   6 ++
 10 files changed, 222 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 3440566..31d53be 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -765,6 +765,23 @@ static void dpu_irq_preinstall(struct msm_kms *kms)
 	dpu_core_irq_preinstall(dpu_kms);
 }
 
+static int dpu_irq_postinstall(struct msm_kms *kms)
+{
+	struct msm_drm_private *priv;
+	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
+
+	if (!dpu_kms || !dpu_kms->dev)
+		return -EINVAL;
+
+	priv = dpu_kms->dev->dev_private;
+	if (!priv)
+		return -EINVAL;
+
+	msm_dp_irq_postinstall(priv->dp);
+
+	return 0;
+}
+
 static void dpu_irq_uninstall(struct msm_kms *kms)
 {
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
@@ -775,6 +792,7 @@ static void dpu_irq_uninstall(struct msm_kms *kms)
 static const struct msm_kms_funcs kms_funcs = {
 	.hw_init         = dpu_kms_hw_init,
 	.irq_preinstall  = dpu_irq_preinstall,
+	.irq_postinstall = dpu_irq_postinstall,
 	.irq_uninstall   = dpu_irq_uninstall,
 	.irq             = dpu_irq,
 	.enable_commit   = dpu_kms_enable_commit,
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 0714868..7987eb3 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -16,7 +16,6 @@
 #define POLLING_SLEEP_US			1000
 #define POLLING_TIMEOUT_US			10000
 
-#define REFTIMER_DEFAULT_VALUE			0x20000
 #define SCRAMBLER_RESET_COUNT_VALUE		0xFC
 
 #define DP_INTERRUPT_STATUS_ACK_SHIFT	1
@@ -703,35 +702,57 @@ void dp_catalog_ctrl_enable_irq(struct dp_catalog *dp_catalog,
 	}
 }
 
-void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog, bool en)
+void dp_catalog_hpd_config_intr(struct dp_catalog *dp_catalog,
+			u32 intr_mask, bool en)
 {
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
 				struct dp_catalog_private, dp_catalog);
 
-	if (en) {
-		u32 reftimer = dp_read_aux(catalog, REG_DP_DP_HPD_REFTIMER);
+	u32 config = dp_read_aux(catalog, REG_DP_DP_HPD_INT_MASK);
 
-		dp_write_aux(catalog, REG_DP_DP_HPD_INT_ACK,
-				DP_DP_HPD_PLUG_INT_ACK |
-				DP_DP_IRQ_HPD_INT_ACK |
-				DP_DP_HPD_REPLUG_INT_ACK |
-				DP_DP_HPD_UNPLUG_INT_ACK);
-		dp_write_aux(catalog, REG_DP_DP_HPD_INT_MASK,
-				DP_DP_HPD_PLUG_INT_MASK |
-				DP_DP_IRQ_HPD_INT_MASK |
-				DP_DP_HPD_REPLUG_INT_MASK |
-				DP_DP_HPD_UNPLUG_INT_MASK);
+	config = (en ? config | intr_mask : config & ~intr_mask);
 
-		/* Configure REFTIMER */
-		reftimer |= REFTIMER_DEFAULT_VALUE;
-		dp_write_aux(catalog, REG_DP_DP_HPD_REFTIMER, reftimer);
-		/* Enable HPD */
-		dp_write_aux(catalog, REG_DP_DP_HPD_CTRL,
-				DP_DP_HPD_CTRL_HPD_EN);
-	} else {
-		/* Disable HPD */
-		dp_write_aux(catalog, REG_DP_DP_HPD_CTRL, 0x0);
-	}
+	dp_write_aux(catalog, REG_DP_DP_HPD_INT_MASK,
+				config & DP_DP_HPD_INT_MASK);
+}
+
+void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	u32 reftimer = dp_read_aux(catalog, REG_DP_DP_HPD_REFTIMER);
+
+	/* enable HPD interrupts */
+	dp_catalog_hpd_config_intr(dp_catalog,
+		DP_DP_HPD_PLUG_INT_MASK | DP_DP_IRQ_HPD_INT_MASK
+		| DP_DP_HPD_UNPLUG_INT_MASK, true);
+
+	/* Configure REFTIMER and enable it */
+	reftimer |= DP_DP_HPD_REFTIMER_ENABLE;
+	dp_write_aux(catalog, REG_DP_DP_HPD_REFTIMER, reftimer);
+
+	/* connect time is 250us and disconnect time is 2ms */
+	dp_write_aux(catalog, REG_DP_DP_HPD_EVENT_TIME_0,
+				DP_DP_HPD_EVENT_TIME_0_VAL);
+	dp_write_aux(catalog, REG_DP_DP_HPD_EVENT_TIME_1,
+				DP_DP_HPD_EVENT_TIME_1_VAL);
+
+	/* Enable HPD */
+	dp_write_aux(catalog, REG_DP_DP_HPD_CTRL, DP_DP_HPD_CTRL_HPD_EN);
+}
+
+u32 dp_catalog_hpd_get_intr_status(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+	int isr = 0;
+
+	isr = dp_read_aux(catalog, REG_DP_DP_HPD_INT_STATUS);
+	dp_write_aux(catalog, REG_DP_DP_HPD_INT_ACK,
+				 (isr & DP_DP_HPD_INT_MASK));
+
+	return isr;
 }
 
 int dp_catalog_ctrl_get_interrupt(struct dp_catalog *dp_catalog)
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 86b82d4..23d1cec 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -60,7 +60,10 @@ void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32 rate,
 void dp_catalog_ctrl_usb_reset(struct dp_catalog *dp_catalog, bool flip);
 bool dp_catalog_ctrl_mainlink_ready(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_enable_irq(struct dp_catalog *dp_catalog, bool enable);
-void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog, bool enable);
+void dp_catalog_hpd_config_intr(struct dp_catalog *dp_catalog,
+			u32 intr_mask, bool en);
+void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog);
+u32 dp_catalog_hpd_get_intr_status(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_phy_reset(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_phy_lane_cfg(struct dp_catalog *dp_catalog, bool flipped,
 				u8 lane_cnt);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index aaa7bc8..fa15d65 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1568,7 +1568,6 @@ int dp_ctrl_on(struct dp_ctrl *dp_ctrl)
 	rate = ctrl->panel->link_info.rate;
 
 	dp_power_clk_enable(ctrl->power, DP_CORE_PM, true);
-	dp_catalog_ctrl_hpd_config(ctrl->catalog, true);
 
 	if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {
 		DRM_DEBUG_DP("using phy test link parameters\n");
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index ddcb9fc..0cc94ca 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -17,6 +17,7 @@
 #include "dp_power.h"
 #include "dp_catalog.h"
 #include "dp_aux.h"
+#include "dp_reg.h"
 #include "dp_link.h"
 #include "dp_panel.h"
 #include "dp_ctrl.h"
@@ -35,6 +36,7 @@ struct dp_display_private {
 	bool power_on;
 	bool hpd_irq_on;
 	bool audio_supported;
+	atomic_t hpd_isr_status;
 
 	struct platform_device *pdev;
 	struct dentry *root;
@@ -52,6 +54,8 @@ struct dp_display_private {
 	struct dp_usbpd_cb usbpd_cb;
 	struct dp_display_mode dp_mode;
 	struct msm_dp dp_display;
+
+	struct delayed_work config_hpd_work;
 };
 
 static const struct of_device_id dp_dt_match[] = {
@@ -102,6 +106,20 @@ static int dp_get_pll(struct dp_display_private *dp_priv)
 static irqreturn_t dp_display_irq(int irq, void *dev_id)
 {
 	struct dp_display_private *dp = dev_id;
+	irqreturn_t ret = IRQ_HANDLED;
+	u32 hpd_isr_status;
+
+	if (!dp) {
+		DRM_ERROR("invalid data\n");
+		return IRQ_NONE;
+	}
+
+	hpd_isr_status = dp_catalog_hpd_get_intr_status(dp->catalog);
+
+	if (hpd_isr_status & DP_DP_HPD_INT_MASK) {
+		atomic_set(&dp->hpd_isr_status, hpd_isr_status);
+		ret = IRQ_WAKE_THREAD;
+	}
 
 	/* DP controller isr */
 	dp_ctrl_isr(dp->ctrl);
@@ -109,6 +127,54 @@ static irqreturn_t dp_display_irq(int irq, void *dev_id)
 	/* DP aux isr */
 	dp_aux_isr(dp->aux);
 
+	return ret;
+}
+
+static irqreturn_t dp_display_hpd_isr_work(int irq, void *data)
+{
+	struct dp_display_private *dp;
+	struct dp_usbpd *hpd;
+	u32 isr = 0;
+
+	dp = (struct dp_display_private *)data;
+	if (!dp)
+		return IRQ_NONE;
+
+	isr = atomic_read(&dp->hpd_isr_status);
+
+	/* reset to default */
+	atomic_set(&dp->hpd_isr_status, 0);
+
+	hpd = dp->usbpd;
+	if (!hpd)
+		return IRQ_NONE;
+
+	if (isr & DP_DP_HPD_PLUG_INT_MASK &&
+		isr & DP_DP_HPD_STATE_STATUS_CONNECTED) {
+		hpd->hpd_high = 1;
+		dp->usbpd_cb.configure(&dp->pdev->dev);
+	} else if (isr & DP_DP_HPD_UNPLUG_INT_MASK &&
+		(isr & DP_DP_HPD_STATE_STATUS_MASK) ==
+			 DP_DP_HPD_STATE_STATUS_DISCONNECTED) {
+
+		/* disable HPD plug interrupt until disconnect is done
+		 */
+		dp_catalog_hpd_config_intr(dp->catalog,
+			DP_DP_HPD_PLUG_INT_MASK | DP_DP_IRQ_HPD_INT_MASK,
+			false);
+
+		hpd->hpd_high = 0;
+
+		/* We don't need separate work for disconnect as
+		 * connect/attention interrupts are disabled
+		 */
+		dp->usbpd_cb.disconnect(&dp->pdev->dev);
+
+		dp_catalog_hpd_config_intr(dp->catalog,
+			DP_DP_HPD_PLUG_INT_MASK | DP_DP_IRQ_HPD_INT_MASK,
+			true);
+	}
+
 	return IRQ_HANDLED;
 }
 
@@ -245,8 +311,6 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
 	int rc = 0;
 	struct edid *edid;
 
-	dp_aux_init(dp->aux, dp->parser->aux_cfg);
-
 	if (dp->link->psm_enabled)
 		goto notify;
 
@@ -293,7 +357,7 @@ static void dp_display_host_init(struct dp_display_private *dp)
 
 	dp_power_init(dp->power, flip);
 	dp_ctrl_host_init(dp->ctrl, flip);
-	enable_irq(dp->irq);
+	dp_aux_init(dp->aux, dp->parser->aux_cfg);
 	dp->core_initialized = true;
 }
 
@@ -304,10 +368,6 @@ static void dp_display_host_deinit(struct dp_display_private *dp)
 		return;
 	}
 
-	dp_ctrl_host_deinit(dp->ctrl);
-	dp_aux_deinit(dp->aux);
-	dp_power_deinit(dp->power);
-	disable_irq(dp->irq);
 	dp->core_initialized = false;
 }
 
@@ -649,7 +709,8 @@ int dp_display_request_irq(struct msm_dp *dp_display)
 		return rc;
 	}
 
-	rc = devm_request_irq(&dp->pdev->dev, dp->irq, dp_display_irq,
+	rc = devm_request_threaded_irq(&dp->pdev->dev, dp->irq,
+		dp_display_irq, dp_display_hpd_isr_work,
 		IRQF_TRIGGER_HIGH, "dp_display_isr", dp);
 	if (rc < 0) {
 		DRM_ERROR("failed to request IRQ%u: %d\n",
@@ -820,6 +881,39 @@ void __exit msm_dp_unregister(void)
 	platform_driver_unregister(&dp_display_driver);
 }
 
+static void dp_display_config_hpd_work(struct work_struct *work)
+{
+	struct dp_display_private *dp;
+	struct delayed_work *dw = to_delayed_work(work);
+
+	dp = container_of(dw, struct dp_display_private, config_hpd_work);
+
+	dp_display_host_init(dp);
+	dp_catalog_ctrl_hpd_config(dp->catalog);
+
+	/* set default to 0 */
+	atomic_set(&dp->hpd_isr_status, 0);
+
+	/* Enable interrupt first time
+	 * we are leaving dp clocks on during disconnect
+	 * and never disable interrupt
+	 */
+	enable_irq(dp->irq);
+}
+
+void msm_dp_irq_postinstall(struct msm_dp *dp_display)
+{
+	struct dp_display_private *dp;
+
+	dp = container_of(dp_display, struct dp_display_private, dp_display);
+
+	if (!dp->parser->hpd_gpio)
+		return;
+
+	INIT_DELAYED_WORK(&dp->config_hpd_work, dp_display_config_hpd_work);
+	queue_delayed_work(system_wq, &dp->config_hpd_work, HZ * 10);
+}
+
 int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 			struct drm_encoder *encoder)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_hpd.h b/drivers/gpu/drm/msm/dp/dp_hpd.h
index c0178524..d06a0b7 100644
--- a/drivers/gpu/drm/msm/dp/dp_hpd.h
+++ b/drivers/gpu/drm/msm/dp/dp_hpd.h
@@ -10,6 +10,9 @@
 
 #include <linux/types.h>
 #include <linux/device.h>
+#include <linux/of_gpio.h>
+
+#include "dp_parser.h"
 
 enum plug_orientation {
 	ORIENTATION_NONE,
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index dbf64ee..08c1abe 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -241,6 +241,19 @@ static int dp_parser_pinctrl(struct dp_parser *parser)
 		return -EINVAL;
 	}
 
+	if (parser->hpd_gpio) {
+		pinctrl->state_hpd_active = pinctrl_lookup_state(pinctrl->pin,
+					"mdss_dp_hpd_ctrl");
+		if (IS_ERR_OR_NULL(pinctrl->state_hpd_active)) {
+			DRM_ERROR("failed to get dp hpd pinctrl state %d\n",
+				PTR_ERR_OR_ZERO(pinctrl->state_hpd_active));
+			return -EINVAL;
+		}
+
+		return pinctrl_select_state(pinctrl->pin,
+				 pinctrl->state_hpd_active);
+	}
+
 	pinctrl->state_active = pinctrl_lookup_state(pinctrl->pin,
 					"mdss_dp_active");
 	if (IS_ERR(pinctrl->state_active)) {
@@ -265,6 +278,15 @@ static int dp_parser_gpio(struct dp_parser *parser)
 	struct device *dev = &parser->pdev->dev;
 	struct device_node *of_node = dev->of_node;
 
+	if (of_find_property(of_node, "qcom,dp-hpd-gpio", NULL)) {
+		parser->hpd_gpio = of_get_named_gpio(of_node,
+					"qcom,dp-hpd-gpio", 0);
+		parser->usbplug_cc_gpio = -EINVAL;
+		parser->aux_en_gpio = -EINVAL;
+		parser->aux_sel_gpio = -EINVAL;
+		return 0;
+	}
+
 	parser->usbplug_cc_gpio = of_get_named_gpio(of_node,
 					"usbplug-cc-gpio", 0);
 	if (!gpio_is_valid(parser->usbplug_cc_gpio)) {
@@ -455,6 +477,12 @@ static int dp_parser_parse(struct dp_parser *parser)
 	}
 
 	rc = dp_parser_pinctrl(parser);
+
+	if (rc)
+		parser->hpd_gpio = -EINVAL;
+	else if (parser->hpd_gpio >= 0)
+		parser->combo_phy_en = false;
+
 	return rc;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 1539866..f9c572e 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -187,9 +187,10 @@ struct dp_parser {
 	struct platform_device *pdev;
 	struct dss_module_power mp[DP_MAX_PM];
 	struct dp_pinctrl pinctrl;
-	unsigned int aux_en_gpio;
-	unsigned int aux_sel_gpio;
-	unsigned int usbplug_cc_gpio;
+	int aux_en_gpio;
+	int aux_sel_gpio;
+	int usbplug_cc_gpio;
+	int hpd_gpio;
 	bool combo_phy_en;
 	struct dp_io io;
 	struct dp_display_data disp_data;
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 28c1682..fbc1874 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -38,10 +38,22 @@
 #define DP_DP_IRQ_HPD_INT_MASK			(0x00000002)
 #define DP_DP_HPD_REPLUG_INT_MASK		(0x00000004)
 #define DP_DP_HPD_UNPLUG_INT_MASK		(0x00000008)
+#define DP_DP_HPD_INT_MASK			(DP_DP_HPD_PLUG_INT_MASK | \
+						DP_DP_IRQ_HPD_INT_MASK | \
+						DP_DP_HPD_REPLUG_INT_MASK | \
+						DP_DP_HPD_UNPLUG_INT_MASK)
+#define DP_DP_HPD_STATE_STATUS_CONNECTED	(0x40000000)
+#define DP_DP_HPD_STATE_STATUS_PENDING		(0x20000000)
+#define DP_DP_HPD_STATE_STATUS_DISCONNECTED	(0x00000000)
+#define DP_DP_HPD_STATE_STATUS_MASK		(0xE0000000)
 
 #define REG_DP_DP_HPD_REFTIMER			(0x00000018)
+#define DP_DP_HPD_REFTIMER_ENABLE		(1 << 16)
+
 #define REG_DP_DP_HPD_EVENT_TIME_0		(0x0000001C)
 #define REG_DP_DP_HPD_EVENT_TIME_1		(0x00000020)
+#define DP_DP_HPD_EVENT_TIME_0_VAL		(0x3E800FA)
+#define DP_DP_HPD_EVENT_TIME_1_VAL		(0x1F407D0)
 
 #define REG_DP_AUX_CTRL				(0x00000030)
 #define DP_AUX_CTRL_ENABLE			(0x00000001)
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index d72694c..15a33b2 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -387,6 +387,7 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 void msm_dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,
 				struct drm_display_mode *mode,
 				struct drm_display_mode *adjusted_mode);
+void msm_dp_irq_postinstall(struct msm_dp *dp_display);
 
 #else
 static inline int __init msm_dp_register(void)
@@ -418,6 +419,11 @@ static inline void msm_dp_display_mode_set(struct msm_dp *dp,
 				struct drm_display_mode *adjusted_mode)
 {
 }
+
+static void msm_dp_irq_postinstall(struct msm_dp *dp_display)
+{
+}
+
 #endif
 
 void __init msm_mdp_register(void);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
