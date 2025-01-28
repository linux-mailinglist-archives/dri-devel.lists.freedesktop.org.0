Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC05A2094F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 12:13:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F132F10E65A;
	Tue, 28 Jan 2025 11:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="AMhLtl8D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id C9C9D10E65A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 11:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=C0ZJZ
 Px2mfgjH2pMopT+tPtYYCICn14OT0CJ98yvDdk=; b=AMhLtl8DfPv95KrviQfg3
 0RwKKg69vyI26pmTIJw5nfSDR/OmkewJ3gnyCxjhevTB03jWzLgpsEHWjtM/JfQb
 FB0D3xrlF5dN2Mbnd+5DE7MLjtpBnOQ2rY790kdJGUAo7iWhqBAxRvg/A2Gpy4Nc
 xuD9+xTsdVOKck7vZ/WA8k=
Received: from DESKTOP-DMSSUQ5.localdomain (unknown [])
 by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id
 _____wD3V8m3u5hn6uWxIw--.63804S2; 
 Tue, 28 Jan 2025 19:12:55 +0800 (CST)
From: oushixiong1025@163.com
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH] drm/mediatek: Convert to use devm_platform_ioremap_resource
Date: Tue, 28 Jan 2025 17:41:18 +0800
Message-ID: <20250128094118.1526-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3V8m3u5hn6uWxIw--.63804S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFW3tryxAFW8JFWrKrW5trb_yoWktFX_Wa
 yvkrs7WryUCr95X3WxCF47CFy2yanY9FykJF13Kayava47Jw1UZrWjvr9rZrsrWws7AFyq
 yanIq3W29a1fCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8fu4UUUUUU==
X-Originating-IP: [113.247.116.130]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/xtbBYw3iD2eYnOP7BQAAs9
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

Do not need to get resource, so convert to use
devm_platform_ioremap_resource.

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/mediatek/mtk_padding.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_padding.c b/drivers/gpu/drm/mediatek/mtk_padding.c
index b4e3e5a3428b..7e302724e74a 100644
--- a/drivers/gpu/drm/mediatek/mtk_padding.c
+++ b/drivers/gpu/drm/mediatek/mtk_padding.c
@@ -95,7 +95,6 @@ static int mtk_padding_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_padding *priv;
-	struct resource *res;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -107,7 +106,7 @@ static int mtk_padding_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->clk),
 				     "failed to get clk\n");
 
-	priv->reg = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	priv->reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->reg))
 		return dev_err_probe(dev, PTR_ERR(priv->reg),
 				     "failed to do ioremap\n");
-- 
2.43.0

