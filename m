Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AB62BA66C
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 10:42:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15386E890;
	Fri, 20 Nov 2020 09:42:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0286D6E898
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 09:42:12 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 90CF922404;
 Fri, 20 Nov 2020 09:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605865331;
 bh=S+wE9QoVUo+/NGuaJNIMv0SkfSy9gzrpeluikKZydfA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ezrj4DbhHlbAjzVH/o1uRfz51aDcm4hQB9vH8gVL6j/wK/SLh2tLAkrMsxJ2inwy6
 TWe6t5s2AgZslMdtShWW2+KzMtYiJiCnaLCqlr5Wq/jSEZybwss01Jdadyv5q7WfwB
 FrbJM0VypjRQJ0GQE2kbeAW0JiY1j573wxTzg5Eo=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.lan) by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1kg2vh-00CDFB-No; Fri, 20 Nov 2020 09:42:09 +0000
From: Marc Zyngier <maz@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/2] drm/meson: dw-hdmi: Disable clocks on driver teardown
Date: Fri, 20 Nov 2020 09:42:04 +0000
Message-Id: <20201120094205.525228-2-maz@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201120094205.525228-1-maz@kernel.org>
References: <20201120094205.525228-1-maz@kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: narmstrong@baylibre.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 guillaume.tucker@collabora.com, kernel-team@android.com,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Guillaume Tucker <guillaume.tucker@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HDMI driver request clocks early, but never disable them, leaving
the clocks on even when the driver is removed.

Fix it by slightly refactoring the clock code, and register a devm
action that will eventually disable/unprepare the enabled clocks.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 43 ++++++++++++++++++---------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 7f8eea494147..29623b309cb1 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -145,8 +145,6 @@ struct meson_dw_hdmi {
 	struct reset_control *hdmitx_apb;
 	struct reset_control *hdmitx_ctrl;
 	struct reset_control *hdmitx_phy;
-	struct clk *hdmi_pclk;
-	struct clk *venci_clk;
 	struct regulator *hdmi_supply;
 	u32 irq_stat;
 	struct dw_hdmi *hdmi;
@@ -946,6 +944,29 @@ static void meson_disable_regulator(void *data)
 	regulator_disable(data);
 }
 
+static void meson_disable_clk(void *data)
+{
+	clk_disable_unprepare(data);
+}
+
+static int meson_enable_clk(struct device *dev, char *name)
+{
+	struct clk *clk;
+	int ret;
+
+	clk = devm_clk_get(dev, name);
+	if (IS_ERR(clk)) {
+		dev_err(dev, "Unable to get %s pclk\n", name);
+		return PTR_ERR(clk);
+	}
+
+	ret = clk_prepare_enable(clk);
+	if (!ret)
+		ret = devm_add_action_or_reset(dev, meson_disable_clk, clk);
+
+	return ret;
+}
+
 static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 				void *data)
 {
@@ -1026,19 +1047,13 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	if (IS_ERR(meson_dw_hdmi->hdmitx))
 		return PTR_ERR(meson_dw_hdmi->hdmitx);
 
-	meson_dw_hdmi->hdmi_pclk = devm_clk_get(dev, "isfr");
-	if (IS_ERR(meson_dw_hdmi->hdmi_pclk)) {
-		dev_err(dev, "Unable to get HDMI pclk\n");
-		return PTR_ERR(meson_dw_hdmi->hdmi_pclk);
-	}
-	clk_prepare_enable(meson_dw_hdmi->hdmi_pclk);
+	ret = meson_enable_clk(dev, "isfr");
+	if (ret)
+		return ret;
 
-	meson_dw_hdmi->venci_clk = devm_clk_get(dev, "venci");
-	if (IS_ERR(meson_dw_hdmi->venci_clk)) {
-		dev_err(dev, "Unable to get venci clk\n");
-		return PTR_ERR(meson_dw_hdmi->venci_clk);
-	}
-	clk_prepare_enable(meson_dw_hdmi->venci_clk);
+	ret = meson_enable_clk(dev, "venci");
+	if (ret)
+		return ret;
 
 	dw_plat_data->regm = devm_regmap_init(dev, NULL, meson_dw_hdmi,
 					      &meson_dw_hdmi_regmap_config);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
