Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9763924AFFD
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28066E925;
	Thu, 20 Aug 2020 07:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id B8B786E8A8
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 06:05:43 +0000 (UTC)
X-UUID: 9a2e663fcd78424280cfec847758fc54-20200820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ZdEoowJE8yrsOxJwibOQFbZ5BGKEhdg3fQs9sloWNGY=; 
 b=A4gQWpFpN4QRLQpfBS8o/tWhoontD1ZZP0gamEnDFdl274EhR5IryiGJpzBefK6St4KUNfuoc/+FBuC8YoIg1iUEBjMiBJnfpUngZtElqQCFu9GQoQNw16fiYPo4j44MeZH6BLz9xGnq4lCSE8L83qqrYaiuqPNFC9d0QbLO200=;
X-UUID: 9a2e663fcd78424280cfec847758fc54-20200820
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw01.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 246718716; Thu, 20 Aug 2020 14:05:38 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 14:05:36 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Aug 2020 14:05:35 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v1 05/21] mtk-mmsys: add ovl mout on  support
Date: Thu, 20 Aug 2020 14:04:02 +0800
Message-ID: <1597903458-8055-6-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:47 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

add ovl mout on support

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/soc/mediatek/mmsys/mt8192-mmsys.c | 23 +++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c          |  8 ++++++++
 include/linux/soc/mediatek/mtk-mmsys.h    |  3 +++
 3 files changed, 34 insertions(+)

diff --git a/drivers/soc/mediatek/mmsys/mt8192-mmsys.c b/drivers/soc/mediatek/mmsys/mt8192-mmsys.c
index 006d41d..06080ad 100644
--- a/drivers/soc/mediatek/mmsys/mt8192-mmsys.c
+++ b/drivers/soc/mediatek/mmsys/mt8192-mmsys.c
@@ -134,10 +134,33 @@ static void mtk_mmsys_ddp_sout_sel(void __iomem *config_regs,
 	}
 }
 
+static int mtk_mmsys_ovl_mout_en(enum mtk_ddp_comp_id cur,
+				 enum mtk_ddp_comp_id next,
+				 unsigned int *addr)
+{
+	int value = -1;
+
+	*addr = MT8192_MMSYS_OVL_MOUT_EN;
+
+	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_OVL_2L0)
+		value = DISP_OVL0_GO_BG;
+	else if (cur == DDP_COMPONENT_OVL_2L0 && next == DDP_COMPONENT_OVL0)
+		value = DISP_OVL0_2L_GO_BG;
+	else if (cur == DDP_COMPONENT_OVL0)
+		value = DISP_OVL0_GO_BLEND;
+	else if (cur == DDP_COMPONENT_OVL_2L0)
+		value = DISP_OVL0_2L_GO_BLEND;
+	else
+		value = -1;
+
+	return value;
+}
+
 static struct mtk_mmsys_conn_funcs mmsys_funcs = {
 	.mout_en = mtk_mmsys_ddp_mout_en,
 	.sel_in = mtk_mmsys_ddp_sel_in,
 	.sout_sel = mtk_mmsys_ddp_sout_sel,
+	.ovl_mout_en = mtk_mmsys_ovl_mout_en,
 };
 
 static int mmsys_probe(struct platform_device *pdev)
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 828d59e..1362d01 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -76,6 +76,14 @@ void mtk_mmsys_ddp_connect(struct device *dev,
 		reg = readl_relaxed(config_regs + addr) | value;
 		writel_relaxed(reg, config_regs + addr);
 	}
+
+	if (priv_funcs->ovl_mout_en) {
+		value = priv_funcs->ovl_mout_en(cur, next, &addr);
+		if (value >= 0) {
+			reg = readl_relaxed(config_regs + addr) | value;
+			writel_relaxed(reg, config_regs + addr);
+		}
+	}
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
 
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index 8ef3eaa..eefc7b1 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -55,6 +55,9 @@ struct mtk_mmsys_conn_funcs {
 	void (*sout_sel)(void __iomem *config_regs,
 			 enum mtk_ddp_comp_id cur,
 			 enum mtk_ddp_comp_id next);
+	int (*ovl_mout_en)(enum mtk_ddp_comp_id cur,
+			   enum mtk_ddp_comp_id next,
+			   unsigned int *addr);
 };
 
 void mtk_mmsys_register_conn_funcs(struct device *dev,
-- 
1.8.1.1.dirty
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
