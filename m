Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0724581E1ED
	for <lists+dri-devel@lfdr.de>; Mon, 25 Dec 2023 18:57:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6726E10E069;
	Mon, 25 Dec 2023 17:57:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 980 seconds by postgrey-1.36 at gabe;
 Mon, 25 Dec 2023 14:43:25 UTC
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.215])
 by gabe.freedesktop.org (Postfix) with ESMTP id CFE8E10E009
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Dec 2023 14:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=3Edaz
 bBuWn+zR00jVC2IdNv8Gvt/eD6wDHkffcQ4WIU=; b=mq7VgsxvzC25fxBq8Bs4X
 EzQG6tcDcREDQJG6Y7Mna7g12xzFIn0TsvWpMpi6Kh85tFnYn2Kl5md1mOVUup6E
 mEC+O/8PrKlEr68W1fM/6mluL28XGGGH1MFLYRo2OEY8sk9M73QsLy5l3qmDjN8C
 IHbw04CeO0ZKbzlq559iOM=
Received: from ubuntu22.localdomain (unknown [117.176.219.50])
 by zwqz-smtp-mta-g4-0 (Coremail) with SMTP id _____wDHF0wJkYllJEGXGg--.64396S2;
 Mon, 25 Dec 2023 22:26:18 +0800 (CST)
From: chenguanxi11234@163.com
To: hanxu5@huaqin.corp-partner.google.com
Subject: [PATCH linux-next v2] drm/panel: Simplify with dev_err_probe()
Date: Mon, 25 Dec 2023 22:26:15 +0800
Message-Id: <3ac20d355b0b3ad3cedb87c8f4efa819a055624b.1702967834.git.chen.haonan2@zte.com.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDHF0wJkYllJEGXGg--.64396S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF1DZFW8CFy3Cr4ftr1DZFb_yoW8Cr1kpF
 4UJF9FvF98AFWS939xAF97AF1jya1xKF4YkFs2g397Aw17tr4xWr17GFy0vFW5tFyrXFW5
 JF1xXFy3ua4UZr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jM89_UUUUU=
X-Originating-IP: [117.176.219.50]
X-CM-SenderInfo: xfkh0wxxdq5xirrsjki6rwjhhfrp/xtbBzwVR+mV4G-HRcAABs2
X-Mailman-Approved-At: Mon, 25 Dec 2023 17:57:48 +0000
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
Cc: neil.armstrong@linaro.org, cgel.zte@gmail.com, linux-kernel@vger.kernel.org,
 mripard@kernel.org, Chen Haonan <chen.haonan2@zte.com.cn>,
 jiang.xuexin@zte.com.cn, yang.guang5@zte.com.cn,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 quic_jesszhan@quicinc.com, airlied@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chen Haonan <chen.haonan2@zte.com.cn>

dev_err_probe() can check if the error code is -EPROBE_DEFER 
and can return the error code, replacing dev_err() with it 
simplifies the code.

Signed-off-by: Chen Haonan <chen.haonan2@zte.com.cn>
---
 drivers/gpu/drm/panel/panel-boe-himax8279d.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)
diff --git a/drivers/gpu/drm/panel/panel-boe-himax8279d.c b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
index 11b64acbe8a9..e225840b0d67 100644
--- a/drivers/gpu/drm/panel/panel-boe-himax8279d.c
+++ b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
@@ -854,26 +854,20 @@ static int panel_add(struct panel_info *pinfo)
 
 	pinfo->pp18_gpio = devm_gpiod_get(dev, "pp18", GPIOD_OUT_HIGH);
 	if (IS_ERR(pinfo->pp18_gpio)) {
-		ret = PTR_ERR(pinfo->pp18_gpio);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get pp18 gpio: %d\n", ret);
-		return ret;
+		return dev_err_probe(dev, PTR_ERR(pinfo->pp18_gpio),
+							 "failed to get pp18 gpio\n");
 	}
 
 	pinfo->pp33_gpio = devm_gpiod_get(dev, "pp33", GPIOD_OUT_HIGH);
 	if (IS_ERR(pinfo->pp33_gpio)) {
-		ret = PTR_ERR(pinfo->pp33_gpio);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get pp33 gpio: %d\n", ret);
-		return ret;
+		return	dev_err_probe(dev, PTR_ERR(pinfo->pp33_gpio),
+							 "failed to get pp33 gpio\n");
 	}
 
 	pinfo->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
 	if (IS_ERR(pinfo->enable_gpio)) {
-		ret = PTR_ERR(pinfo->enable_gpio);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get enable gpio: %d\n", ret);
-		return ret;
+		return	dev_err_probe(dev, PTR_ERR(pinfo->enable_gpio),
+						 "failed to get enable gpio\n");
 	}
 
 	drm_panel_init(&pinfo->base, dev, &panel_funcs,
-- 
2.25.1

