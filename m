Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7F043845F
	for <lists+dri-devel@lfdr.de>; Sat, 23 Oct 2021 18:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB1B6E09C;
	Sat, 23 Oct 2021 16:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 878B96E09C
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Oct 2021 16:48:37 +0000 (UTC)
X-UUID: c43ebcd5be274386963e380c86f75ae1-20211024
X-UUID: c43ebcd5be274386963e380c86f75ae1-20211024
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 488625439; Sun, 24 Oct 2021 00:48:33 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sun, 24 Oct 2021 00:48:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 24 Oct 2021 00:48:32 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, "Jassi
 Brar" <jassisinghbrar@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [PATCH] mailbox: remove the error message when gce clk is defer
Date: Sun, 24 Oct 2021 00:48:31 +0800
Message-ID: <20211023164831.25690-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
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

Remove the error message when gce clk is defer.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index fd5576a9f8b4..684b8aa1e445 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -577,7 +577,8 @@ static int cmdq_probe(struct platform_device *pdev)
 				snprintf(clk_id, sizeof(clk_id), "%s%d", clk_name, alias_id);
 				cmdq->clocks[alias_id].id = clk_id;
 				cmdq->clocks[alias_id].clk = of_clk_get(node, 0);
-				if (IS_ERR(cmdq->clocks[alias_id].clk)) {
+				if (IS_ERR(cmdq->clocks[alias_id].clk) &&
+				    PTR_ERR(cmdq->clocks[alias_id].clk) != -EPROBE_DEFER) {
 					dev_err(dev, "failed to get gce clk: %d\n", alias_id);
 					return PTR_ERR(cmdq->clocks[alias_id].clk);
 				}
@@ -586,7 +587,8 @@ static int cmdq_probe(struct platform_device *pdev)
 	} else {
 		cmdq->clocks[alias_id].id = clk_name;
 		cmdq->clocks[alias_id].clk = devm_clk_get(&pdev->dev, clk_name);
-		if (IS_ERR(cmdq->clocks[alias_id].clk)) {
+		if (IS_ERR(cmdq->clocks[alias_id].clk) &&
+		    PTR_ERR(cmdq->clocks[alias_id].clk) != -EPROBE_DEFER) {
 			dev_err(dev, "failed to get gce clk\n");
 			return PTR_ERR(cmdq->clocks[alias_id].clk);
 		}
-- 
2.18.0

