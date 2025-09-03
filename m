Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4A3B42912
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 20:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A5010E90E;
	Wed,  3 Sep 2025 18:51:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="BkUYsbGt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C0110E904
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 18:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1756925497;
 bh=P16GWZ5xMUMdCjEEjMnPh5ZFPrJLj34FT+iME57x8eU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=BkUYsbGtp2rYAc5YwKpVGlVaA4k2enidF4Dus0SXDGCsPTckpmlFMh/SONVST9sMj
 4KwU51jIXDp1ZcWLj46Q193fcwjNjMdabJht3Xa397oS9EPV+2EAlt46twm98wUCop
 SPPgROV/cn/hwHHOLZowE5vJStTxB1rrpmokAMZaAnyQnW5zJmFokx//AyVpeVnp5p
 HQs1olCnaPle8XOkhINAohc2B1ZY6JAcXyTvTVNbMilejpbPUu40xRBjdp8UXLB39d
 VNfxdBgLN/AF7UVKUuDKwJzN22s3UHOTI0EtcLlRy5DAo7Z+IJDSmgsaHl+Q2ASRLs
 QaPolybIPY8vw==
Received: from localhost (unknown [82.79.138.60])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 7F62317E129F;
 Wed,  3 Sep 2025 20:51:37 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 03 Sep 2025 21:51:00 +0300
Subject: [PATCH v4 2/6] drm/bridge: dw-hdmi-qp: Fixup timer base setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-rk3588-hdmi-cec-v4-2-fa25163c4b08@collabora.com>
References: <20250903-rk3588-hdmi-cec-v4-0-fa25163c4b08@collabora.com>
In-Reply-To: <20250903-rk3588-hdmi-cec-v4-0-fa25163c4b08@collabora.com>
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
 linux-kernel@vger.kernel.org
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

Currently the TIMER_BASE_CONFIG0 register gets initialized to a fixed
value as initially found in vendor driver code supporting the RK3588
SoC.  As a matter of fact the value matches the rate of the HDMI TX
reference clock, which is roughly 428.57 MHz.

However, on RK3576 SoC that rate is slightly lower, i.e. 396.00 MHz, and
the incorrect register configuration breaks CEC functionality.

Set the timer base according to the actual reference clock rate that
shall be provided by the platform driver.  Otherwise fallback to the
vendor default.

While at it, also drop the unnecessary empty lines in
dw_hdmi_qp_init_hw().

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 12 +++++++++---
 include/drm/bridge/dw_hdmi_qp.h              |  1 +
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index fc98953672b6fb388d05201e280d24b8f214498a..4ba7b339eff62592aa748429a3bfca82494679d1 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -161,6 +161,7 @@ struct dw_hdmi_qp {
 		void *data;
 	} phy;
 
+	unsigned long ref_clk_rate;
 	struct regmap *regm;
 
 	unsigned long tmds_char_rate;
@@ -1210,13 +1211,11 @@ static void dw_hdmi_qp_init_hw(struct dw_hdmi_qp *hdmi)
 {
 	dw_hdmi_qp_write(hdmi, 0, MAINUNIT_0_INT_MASK_N);
 	dw_hdmi_qp_write(hdmi, 0, MAINUNIT_1_INT_MASK_N);
-	dw_hdmi_qp_write(hdmi, 428571429, TIMER_BASE_CONFIG0);
+	dw_hdmi_qp_write(hdmi, hdmi->ref_clk_rate, TIMER_BASE_CONFIG0);
 
 	/* Software reset */
 	dw_hdmi_qp_write(hdmi, 0x01, I2CM_CONTROL0);
-
 	dw_hdmi_qp_write(hdmi, 0x085c085c, I2CM_FM_SCL_CONFIG0);
-
 	dw_hdmi_qp_mod(hdmi, 0, I2CM_FM_EN, I2CM_INTERFACE_CONTROL0);
 
 	/* Clear DONE and ERROR interrupts */
@@ -1262,6 +1261,13 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 	hdmi->phy.ops = plat_data->phy_ops;
 	hdmi->phy.data = plat_data->phy_data;
 
+	if (plat_data->ref_clk_rate) {
+		hdmi->ref_clk_rate = plat_data->ref_clk_rate;
+	} else {
+		hdmi->ref_clk_rate = 428571429;
+		dev_warn(dev, "Set ref_clk_rate to vendor default\n");
+	}
+
 	dw_hdmi_qp_init_hw(hdmi);
 
 	ret = devm_request_threaded_irq(dev, plat_data->main_irq,
diff --git a/include/drm/bridge/dw_hdmi_qp.h b/include/drm/bridge/dw_hdmi_qp.h
index b4a9b739734ec7b67013b683fe6017551aa19172..76ecf31301997718604a05f70ce9eab8695e26b5 100644
--- a/include/drm/bridge/dw_hdmi_qp.h
+++ b/include/drm/bridge/dw_hdmi_qp.h
@@ -24,6 +24,7 @@ struct dw_hdmi_qp_plat_data {
 	void *phy_data;
 	int main_irq;
 	int cec_irq;
+	unsigned long ref_clk_rate;
 };
 
 struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,

-- 
2.51.0

