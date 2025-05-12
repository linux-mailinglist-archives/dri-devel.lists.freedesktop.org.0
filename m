Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CEBAB37A4
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 14:47:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA0F10E400;
	Mon, 12 May 2025 12:47:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="YXxeFWMq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0CC6810E3FA
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 12:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ck
 0Oa6Hq1RQ1X+FOIxxUqrsCrvgqpQ03ONEP831KWyU=; b=YXxeFWMqp2G21M7k8n
 d0sl7XHelAhyRhuHaW0wKr/ikCC4CPKZirbQUsAnQ8kfPXyIFc0ezL2D9HsHxtq5
 CdolXmRc83opYm5EFTrTTzE9zvgnZQ3Hu9P5DXL/O5CEBkxdtyYhQ1005lmsN4A5
 4qhhrssf/ZGThy7Ldj2O08kbI=
Received: from ProDesk.. (unknown [])
 by gzsmtp3 (Coremail) with SMTP id PigvCgC3chWY7SFoQ+_OAQ--.62400S9;
 Mon, 12 May 2025 20:46:28 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: jonas@kwiboo.se, Laurent.pinchart@ideasonboard.com, mripard@kernel.org,
 neil.armstrong@linaro.org, hjc@rock-chips.com, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v5 07/10] drm/rockchip: inno_hdmi: switch i2c registration to
 devm functions
Date: Mon, 12 May 2025 20:46:08 +0800
Message-ID: <20250512124615.2848731-8-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512124615.2848731-1-andyshrk@163.com>
References: <20250512124615.2848731-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgC3chWY7SFoQ+_OAQ--.62400S9
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFWfXryxWw4Utr43Ww47XFb_yoW8ZFyfpr
 W7AF4YgrWxZF4vgr4DZF4kCF1ayay8GayxWFWIgwsakwnxWry5tFyrXryS9a45A3srXanr
 tr4vq345uF1UKaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j3189UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqA1LXmgh6hVM3wABsU
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

Switch from i2c_add_adapter() to resource managed
devm_i2c_add_adapter(), which will make the cleanup code more simpler.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v5:
- Split from PATCH 9/10

 drivers/gpu/drm/rockchip/inno_hdmi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index f362803060796..776a2aa74e49c 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -1230,10 +1230,9 @@ static struct i2c_adapter *inno_hdmi_i2c_adapter(struct inno_hdmi *hdmi)
 	strscpy(adap->name, "Inno HDMI", sizeof(adap->name));
 	i2c_set_adapdata(adap, hdmi);
 
-	ret = i2c_add_adapter(adap);
+	ret = devm_i2c_add_adapter(hdmi->dev, adap);
 	if (ret) {
 		dev_warn(hdmi->dev, "cannot add %s I2C adapter\n", adap->name);
-		devm_kfree(hdmi->dev, i2c);
 		return ERR_PTR(ret);
 	}
 
@@ -1316,7 +1315,7 @@ static int inno_hdmi_bind(struct device *dev, struct device *master,
 
 	ret = inno_hdmi_register(drm, hdmi);
 	if (ret)
-		goto err_put_adapter;
+		goto err_disable_clk;
 
 	dev_set_drvdata(dev, hdmi);
 
@@ -1330,8 +1329,6 @@ static int inno_hdmi_bind(struct device *dev, struct device *master,
 err_cleanup_hdmi:
 	hdmi->connector.funcs->destroy(&hdmi->connector);
 	hdmi->encoder.encoder.funcs->destroy(&hdmi->encoder.encoder);
-err_put_adapter:
-	i2c_put_adapter(hdmi->ddc);
 err_disable_clk:
 	clk_disable_unprepare(hdmi->refclk);
 err_disable_pclk:
@@ -1347,7 +1344,6 @@ static void inno_hdmi_unbind(struct device *dev, struct device *master,
 	hdmi->connector.funcs->destroy(&hdmi->connector);
 	hdmi->encoder.encoder.funcs->destroy(&hdmi->encoder.encoder);
 
-	i2c_put_adapter(hdmi->ddc);
 	clk_disable_unprepare(hdmi->refclk);
 	clk_disable_unprepare(hdmi->pclk);
 }
-- 
2.43.0

