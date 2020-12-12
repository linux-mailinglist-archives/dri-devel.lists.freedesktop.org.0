Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 198DD2D9405
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 09:18:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A2F6E0F8;
	Mon, 14 Dec 2020 08:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6AFAA6E846
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Dec 2020 04:12:34 +0000 (UTC)
X-UUID: 15d7e683883a4853bc8420bafcdf88ba-20201212
X-UUID: 15d7e683883a4853bc8420bafcdf88ba-20201212
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1316618047; Sat, 12 Dec 2020 12:12:29 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 12 Dec 2020 12:12:12 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 12 Dec 2020 12:12:11 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2,
 14/17] soc: mediatek: mmsys: Use function call for setting mmsys ovl
 mout register
Date: Sat, 12 Dec 2020 12:11:54 +0800
Message-ID: <1607746317-4696-15-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Mon, 14 Dec 2020 08:17:41 +0000
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

Use function call for setting mmsys ovl mout register

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/soc/mediatek/mmsys/mtk-mmsys.c | 18 ++++++++++++++++++
 include/linux/soc/mediatek/mtk-mmsys.h |  3 +++
 2 files changed, 21 insertions(+)

diff --git a/drivers/soc/mediatek/mmsys/mtk-mmsys.c b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
index cb76e64..2558b42 100644
--- a/drivers/soc/mediatek/mmsys/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
@@ -78,6 +78,15 @@ void mtk_mmsys_ddp_connect(struct device *dev,
 		reg = readl_relaxed(mmsys->regs + addr) | value;
 		writel_relaxed(reg, mmsys->regs + addr);
 	}
+
+	if (!funcs->ovl_mout_en)
+		return;
+
+	value = funcs->ovl_mout_en(cur, next, &addr);
+	if (value) {
+		reg = readl_relaxed(mmsys->regs + addr) | value;
+		writel_relaxed(reg, mmsys->regs + addr);
+	}
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
 
@@ -103,6 +112,15 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 		reg = readl_relaxed(mmsys->regs + addr) & ~value;
 		writel_relaxed(reg, mmsys->regs + addr);
 	}
+
+	if (!funcs->ovl_mout_en)
+		return;
+
+	value = funcs->ovl_mout_en(cur, next, &addr);
+	if (value) {
+		reg = readl_relaxed(mmsys->regs + addr) & ~value;
+		writel_relaxed(reg, mmsys->regs + addr);
+	}
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
 
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index aa4f60e..220203d 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -49,6 +49,9 @@ struct mtk_mmsys_conn_funcs {
 	u32 (*mout_en)(enum mtk_ddp_comp_id cur,
 		       enum mtk_ddp_comp_id next,
 		       unsigned int *addr);
+	u32 (*ovl_mout_en)(enum mtk_ddp_comp_id cur,
+			   enum mtk_ddp_comp_id next,
+			   unsigned int *addr);
 	u32 (*sel_in)(enum mtk_ddp_comp_id cur,
 		      enum mtk_ddp_comp_id next,
 		      unsigned int *addr);
-- 
1.8.1.1.dirty

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
