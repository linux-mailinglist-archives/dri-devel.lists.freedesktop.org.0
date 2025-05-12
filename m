Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5824AB37A9
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 14:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B7D10E3F8;
	Mon, 12 May 2025 12:47:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="dYEgk0mr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id E686410E3F8
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 12:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=dB
 S7SAsAp5FhUlU/3iHX21eFkYpu2uCNBgSKCpFIXoc=; b=dYEgk0mr8SQrs9C3Yb
 mU0uQ95jeLLh/2SUuUKGtv75BEX7AbJnbBkDRE/oPkQv7kzOro8QdBRuEwi7ZRDV
 MK0WAaFt3v94mYzWD9cHkgMgEyNW7ozuZYXnvGuevseJkpE5jSS+VO7kZ1i9PIxV
 R0OE50jCrxiXCI7EeDADEoQvA=
Received: from ProDesk.. (unknown [])
 by gzsmtp3 (Coremail) with SMTP id PigvCgC3chWY7SFoQ+_OAQ--.62400S10;
 Mon, 12 May 2025 20:46:29 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: jonas@kwiboo.se, Laurent.pinchart@ideasonboard.com, mripard@kernel.org,
 neil.armstrong@linaro.org, hjc@rock-chips.com, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v5 08/10] drm/rockchip: inno_hdmi: Simpify clk get/enable by
 devm_clk_get_enabled api
Date: Mon, 12 May 2025 20:46:09 +0800
Message-ID: <20250512124615.2848731-9-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512124615.2848731-1-andyshrk@163.com>
References: <20250512124615.2848731-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgC3chWY7SFoQ+_OAQ--.62400S10
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF1fJr1UGF4fWr43Cry3Jwb_yoW5uw4kpr
 y7AFWYqryxJF4jg34UZF4UJr1FyF4UGa47GrWxWan3AwnxXr15KFW0vryS9FWFyr95Za13
 trWkXFy5Z3WUWF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j8nYwUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0g9LXmgh5MDHDwAAst
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

Make use of devm_clk_get_enabled() to replace devm_clk_get() and
clk_prepare_enable(), which will make the cleanup of clk code simpler.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v5:
- Split from PATCH 9/10

 drivers/gpu/drm/rockchip/inno_hdmi.c | 50 +++++++---------------------
 1 file changed, 12 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 776a2aa74e49c..1ab3ad4bde9ea 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -1269,53 +1269,34 @@ static int inno_hdmi_bind(struct device *dev, struct device *master,
 	if (IS_ERR(hdmi->regs))
 		return PTR_ERR(hdmi->regs);
 
-	hdmi->pclk = devm_clk_get(hdmi->dev, "pclk");
+	hdmi->pclk = devm_clk_get_enabled(hdmi->dev, "pclk");
 	if (IS_ERR(hdmi->pclk))
 		return dev_err_probe(dev, PTR_ERR(hdmi->pclk), "Unable to get HDMI pclk\n");
 
-	ret = clk_prepare_enable(hdmi->pclk);
-	if (ret)
-		return dev_err_probe(dev, ret, "Cannot enable HDMI pclk: %d\n", ret);
-
-	hdmi->refclk = devm_clk_get_optional(hdmi->dev, "ref");
-	if (IS_ERR(hdmi->refclk)) {
-		ret = dev_err_probe(dev, PTR_ERR(hdmi->refclk), "Unable to get HDMI refclk\n");
-		goto err_disable_pclk;
-	}
-
-	ret = clk_prepare_enable(hdmi->refclk);
-	if (ret) {
-		ret = dev_err_probe(dev, ret, "Cannot enable HDMI refclk: %d\n", ret);
-		goto err_disable_pclk;
-	}
+	hdmi->refclk = devm_clk_get_optional_enabled(hdmi->dev, "ref");
+	if (IS_ERR(hdmi->refclk))
+		return dev_err_probe(dev, PTR_ERR(hdmi->refclk), "Unable to get HDMI refclk\n");
 
 	if (hdmi->variant->dev_type == RK3036_HDMI) {
 		hdmi->grf = syscon_regmap_lookup_by_phandle(dev->of_node, "rockchip,grf");
-		if (IS_ERR(hdmi->grf)) {
-			ret = dev_err_probe(dev, PTR_ERR(hdmi->grf),
-					    "Unable to get rockchip,grf\n");
-			goto err_disable_clk;
-		}
+		if (IS_ERR(hdmi->grf))
+			return dev_err_probe(dev,
+					     PTR_ERR(hdmi->grf), "Unable to get rockchip,grf\n");
 	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		ret = irq;
-		goto err_disable_clk;
-	}
+	if (irq < 0)
+		return irq;
 
 	inno_hdmi_init_hw(hdmi);
 
 	hdmi->ddc = inno_hdmi_i2c_adapter(hdmi);
-	if (IS_ERR(hdmi->ddc)) {
-		ret = PTR_ERR(hdmi->ddc);
-		hdmi->ddc = NULL;
-		goto err_disable_clk;
-	}
+	if (IS_ERR(hdmi->ddc))
+		return PTR_ERR(hdmi->ddc);
 
 	ret = inno_hdmi_register(drm, hdmi);
 	if (ret)
-		goto err_disable_clk;
+		return ret;
 
 	dev_set_drvdata(dev, hdmi);
 
@@ -1329,10 +1310,6 @@ static int inno_hdmi_bind(struct device *dev, struct device *master,
 err_cleanup_hdmi:
 	hdmi->connector.funcs->destroy(&hdmi->connector);
 	hdmi->encoder.encoder.funcs->destroy(&hdmi->encoder.encoder);
-err_disable_clk:
-	clk_disable_unprepare(hdmi->refclk);
-err_disable_pclk:
-	clk_disable_unprepare(hdmi->pclk);
 	return ret;
 }
 
@@ -1343,9 +1320,6 @@ static void inno_hdmi_unbind(struct device *dev, struct device *master,
 
 	hdmi->connector.funcs->destroy(&hdmi->connector);
 	hdmi->encoder.encoder.funcs->destroy(&hdmi->encoder.encoder);
-
-	clk_disable_unprepare(hdmi->refclk);
-	clk_disable_unprepare(hdmi->pclk);
 }
 
 static const struct component_ops inno_hdmi_ops = {
-- 
2.43.0

