Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C695CA18A4E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 03:56:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47D410E233;
	Wed, 22 Jan 2025 02:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="SDlEAMEC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id B842B10E233
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 02:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=MGsaw
 poV0mO1GLDn36CHF9D3oM5pzt99uWzsVwSB6Zs=; b=SDlEAMECfK25/EvbU8xWP
 b7bdlLdpXiYjOAAj2P1/5kanJreSaV6oQWikD1IQ7u9QiMtKUhlAwbB1WZ68eTAm
 PZ870USspn//ImCERBYqLMluqCVb3bEvf7J/olyQMMMh3trNmtGU/scdfYMLTWKy
 nF+ypBJHLJj3uDVb3QmnPo=
Received: from localhost.localdomain (unknown [116.128.244.169])
 by gzsmtp3 (Coremail) with SMTP id PigvCgDH4C1BXpBnrNb9Jw--.63116S2;
 Wed, 22 Jan 2025 10:56:02 +0800 (CST)
From: oushixiong1025@163.com
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH v2] drm/bridge: Use devm_platform_get_and_ioremap_resource()
Date: Wed, 22 Jan 2025 10:56:00 +0800
Message-Id: <20250122025600.53825-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgDH4C1BXpBnrNb9Jw--.63116S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGrW3CF17JF1UXr15ZrWkWFg_yoW5Xw1DpF
 WxGFyj9r18G3W5K3y8AF18AF9IyasFvayfCr4UGwsI9348JF9rArZ8AFyfZ3sxtrykAw1f
 twn3trW8Za4qvF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UP-BiUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/xtbBYx7cD2eQXFIRhwABsA
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

From: Shixiong Ou <oushixiong@kylinos.cn>

Convert platform_get_resource(), devm_ioremap_resource() to a single call to
devm_platform_get_and_ioremap_resource().

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
V1 -> V2: Add Missing commit message.

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 +---
 drivers/gpu/drm/bridge/microchip-lvds.c            | 5 ++---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          | 3 +--
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index bfa88409a7ff..284fd186eb5f 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1605,9 +1605,7 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 		return ERR_CAST(dp->clock);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	dp->reg_base = devm_ioremap_resource(&pdev->dev, res);
+	dp->reg_base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(dp->reg_base)) {
 		ret = PTR_ERR(dp->reg_base);
 		goto err_disable_clk;
diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
index b8313dad6072..a679dd76962d 100644
--- a/drivers/gpu/drm/bridge/microchip-lvds.c
+++ b/drivers/gpu/drm/bridge/microchip-lvds.c
@@ -151,6 +151,7 @@ static int mchp_lvds_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct mchp_lvds *lvds;
 	struct device_node *port;
+	struct resource *res;
 	int ret;
 
 	if (!dev->of_node)
@@ -161,9 +162,7 @@ static int mchp_lvds_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	lvds->dev = dev;
-
-	lvds->regs = devm_ioremap_resource(lvds->dev,
-			platform_get_resource(pdev, IORESOURCE_MEM, 0));
+	lvds->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(lvds->regs))
 		return PTR_ERR(lvds->regs);
 
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 0031f3c54882..96e17776165c 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3386,8 +3386,7 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 			return ERR_PTR(-EINVAL);
 		}
 
-		iores = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		hdmi->regs = devm_ioremap_resource(dev, iores);
+		hdmi->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &iores);
 		if (IS_ERR(hdmi->regs)) {
 			ret = PTR_ERR(hdmi->regs);
 			goto err_res;
-- 
2.25.1

