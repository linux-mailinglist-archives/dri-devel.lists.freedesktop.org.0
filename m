Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE6220304B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 09:09:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1481A6E233;
	Mon, 22 Jun 2020 07:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3011A6E06B
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jun 2020 14:18:44 +0000 (UTC)
X-UUID: e125096b405f44278cb953e13374a93c-20200621
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=TkOkIDLhlS19sptnDuqd/11Wt1fkDOu2XgPHJBhqzx0=; 
 b=mhRGmrFR8w90RrdcRZ6zGJFfnaaxs9OfsT4BIFKgLD1uVO4EU9pJTyCNRyB77J1wPiKodQEVVZLTZsAlaMTQvUl9yjoDxGuHJTee2OFuZF3q+UT7JJhErr+3PNx2tIwSfaxxu3mTTDTVygqwY7ysjpz6/IkRQritzmv4AnmNJyg=;
X-UUID: e125096b405f44278cb953e13374a93c-20200621
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 678863230; Sun, 21 Jun 2020 22:18:40 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 21 Jun 2020 22:18:30 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 21 Jun 2020 22:18:31 +0800
From: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Bibby Hsieh
 <bibby.hsieh@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>
Subject: [PATCH v1 08/11] soc: mediatek: cmdq: export finalize function
Date: Sun, 21 Jun 2020 22:18:32 +0800
Message-ID: <1592749115-24158-9-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1592749115-24158-1-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1592749115-24158-1-git-send-email-dennis-yc.hsieh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Mon, 22 Jun 2020 07:07:47 +0000
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
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, HS Liao <hs.liao@mediatek.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Export finalize function to client which helps append eoc and jump
command to pkt. Let client decide call finalize or not.

Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c |    1 +
 drivers/soc/mediatek/mtk-cmdq-helper.c  |    7 ++-----
 include/linux/soc/mediatek/mtk-cmdq.h   |    8 ++++++++
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 0dfcd1787e65..7daaabc26eb1 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -490,6 +490,7 @@ static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
 		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
 		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event);
 		mtk_crtc_ddp_config(crtc, cmdq_handle);
+		cmdq_pkt_finalize(cmdq_handle);
 		cmdq_pkt_flush_async(cmdq_handle, ddp_cmdq_cb, cmdq_handle);
 	}
 #endif
diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index e372ae065240..248945108a36 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -391,7 +391,7 @@ int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value)
 }
 EXPORT_SYMBOL(cmdq_pkt_assign);
 
-static int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
+int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
 {
 	struct cmdq_instruction inst = { {0} };
 	int err;
@@ -411,6 +411,7 @@ static int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
 
 	return err;
 }
+EXPORT_SYMBOL(cmdq_pkt_finalize);
 
 static void cmdq_pkt_flush_async_cb(struct cmdq_cb_data data)
 {
@@ -445,10 +446,6 @@ int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb cb,
 	unsigned long flags = 0;
 	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
 
-	err = cmdq_pkt_finalize(pkt);
-	if (err < 0)
-		return err;
-
 	pkt->cb.cb = cb;
 	pkt->cb.data = data;
 	pkt->async_cb.cb = cmdq_pkt_flush_async_cb;
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 6e8caacedc80..eac1405e4872 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -244,6 +244,14 @@ int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
 int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value);
 
 /**
+ * cmdq_pkt_finalize() - Append EOC and jump command to pkt.
+ * @pkt:	the CMDQ packet
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_pkt_finalize(struct cmdq_pkt *pkt);
+
+/**
  * cmdq_pkt_flush_async() - trigger CMDQ to asynchronously execute the CMDQ
  *                          packet and call back at the end of done packet
  * @pkt:	the CMDQ packet
-- 
1.7.9.5
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
