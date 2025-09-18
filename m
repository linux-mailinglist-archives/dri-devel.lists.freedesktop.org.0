Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8992CB42910
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 20:51:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31FB610E90C;
	Wed,  3 Sep 2025 18:51:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ogaUlsET";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC1E10E904
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 18:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1756925499;
 bh=8Z8mjCF+FKwKBL8hPeIwVkjMamf3nUzQplfzpBne/CE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ogaUlsETyB/vRASIhDvfh/x6+jJBP5hPQGTx0DYVvQ4mRIrm4jU0gH60WpvZDUIZq
 OF50cIb234o8oz6cbEcqPVEqOPjDWwevlElQJo08aqFRHk1AwiT3XiCWCpDcoJNsYP
 /6eRjbTnxuZjm1KrtpjPMpaZnhWthAGc0lY+ZPzlNzRCaWbt0QxtbEstJOXpd/meap
 aJ7n4OW9YuWM5aQlsWFqa+Si3sg631K3aMNbNerqtU71l6y2gUho4lg+q5MLUODIhM
 a3IDkZ+4NizZxXal1/p466MADhZilVaQMKvPjeIXE4fQ0wVbD5WNIwZIPFUQIv5pHW
 UnNjTWtJKqdxQ==
Received: from localhost (unknown [82.79.138.60])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id B84AB17E1382;
 Wed,  3 Sep 2025 20:51:39 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 03 Sep 2025 21:51:03 +0300
Subject: [PATCH v4 5/6] drm/rockchip: dw_hdmi_qp: Provide ref clock rate in
 dw_hdmi_qp_plat_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-rk3588-hdmi-cec-v4-5-fa25163c4b08@collabora.com>
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
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>
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

In order to support correct initialization of the timer base in the HDMI
QP IP block, setup platform data to include the required reference clock
rate.

While at it, ensure plat_data is zero-initialized in
dw_hdmi_qp_rockchip_bind().

Reviewed-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 9191a74a568fb38c2b2ff7ead1e703b3af9addc9..931343b072adc05877db9ae867e31a3cd1134e6c 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -429,14 +429,15 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 				    void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
+	struct dw_hdmi_qp_plat_data plat_data = {};
 	const struct rockchip_hdmi_qp_cfg *cfg;
-	struct dw_hdmi_qp_plat_data plat_data;
 	struct drm_device *drm = data;
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 	struct rockchip_hdmi_qp *hdmi;
 	struct resource *res;
 	struct clk_bulk_data *clks;
+	struct clk *ref_clk;
 	int ret, irq, i;
 
 	if (!pdev->dev.of_node)
@@ -506,6 +507,14 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	if (ret < 0)
 		return dev_err_probe(hdmi->dev, ret, "Failed to get clocks\n");
 
+	ref_clk = clk_get(hdmi->dev, "ref");
+	if (IS_ERR(ref_clk))
+		return dev_err_probe(hdmi->dev, PTR_ERR(ref_clk),
+				     "Failed to get ref clock\n");
+
+	plat_data.ref_clk_rate = clk_get_rate(ref_clk);
+	clk_put(ref_clk);
+
 	hdmi->enable_gpio = devm_gpiod_get_optional(hdmi->dev, "enable",
 						    GPIOD_OUT_HIGH);
 	if (IS_ERR(hdmi->enable_gpio))

-- 
2.51.0

