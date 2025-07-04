Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C70AF9561
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 16:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 228C310EA53;
	Fri,  4 Jul 2025 14:23:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="JZJF4BAX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E50CF10E2A1
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 14:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1751639014;
 bh=8sYhNaN38EHYkWe3bEuWzUjVjIIOeXzTqoc/06h5PwU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=JZJF4BAXtj4R+gGhzEZ7dWadrqTRB+/66ebIzjlSJPPsUXaWW3JHqYmKCOs4uIo72
 e8B4Am2vRlB88Z3KnYyKOt7Zs/RtF/zVKIZD+XqsoIE9V8j3WzvGThUYP3c574XJUh
 Fx3z36bZvk8DRgcwLUPaVjsMzWhJoflZR7IePFOhA0z+LDloNwqeeyF6VivRRCdjSb
 VgZqDFmKnNdezFJ/+GMwoqEZ/Zw8U6vC2gG36OumgF2QzhbhGArLEM3FgFyde5sAgJ
 IbkwsZwastcLCLNHwZWH+4QxdJR2uEtPLOwkLEoA7MGhuVNPp+39HUOAL7YmuzL8k6
 HuiM4HtqkTCUw==
Received: from localhost (unknown [212.93.144.165])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 880E917E0EB8;
 Fri,  4 Jul 2025 16:23:34 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 04 Jul 2025 17:23:25 +0300
Subject: [PATCH 4/5] drm/bridge: dw-hdmi-qp: Fixup timer base setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-rk3588-hdmi-cec-v1-4-2bd8de8700cd@collabora.com>
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

Set the timer base according to the actual reference clock rate.  While
at it, also drop the unnecessary empty lines in dw_hdmi_qp_init_hw().

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index cfe8171b2183874517f583f284f7728fe1613c91..5d252800168aa4f3c10f458631795de8912e29d4 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -161,6 +161,7 @@ struct dw_hdmi_qp {
 		void *data;
 	} phy;
 
+	unsigned long ref_clk_rate;
 	struct regmap *regm;
 
 	unsigned long tmds_char_rate;
@@ -1222,13 +1223,11 @@ static void dw_hdmi_qp_init_hw(struct dw_hdmi_qp *hdmi)
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
@@ -1254,6 +1253,11 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 		return ERR_PTR(-ENODEV);
 	}
 
+	if (!plat_data->ref_clk_rate) {
+		dev_err(dev, "Missing ref_clk rate\n");
+		return ERR_PTR(-ENODEV);
+	}
+
 	hdmi = devm_drm_bridge_alloc(dev, struct dw_hdmi_qp, bridge,
 				     &dw_hdmi_qp_bridge_funcs);
 	if (IS_ERR(hdmi))
@@ -1273,6 +1277,7 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 
 	hdmi->phy.ops = plat_data->phy_ops;
 	hdmi->phy.data = plat_data->phy_data;
+	hdmi->ref_clk_rate = plat_data->ref_clk_rate;
 
 	dw_hdmi_qp_init_hw(hdmi);
 

-- 
2.50.0

