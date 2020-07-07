Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A05BA218058
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 09:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E85A6E870;
	Wed,  8 Jul 2020 07:06:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8B28F89DEC
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 15:46:33 +0000 (UTC)
X-UUID: 0be132844e2548488f17290144977874-20200707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=3FlNZdINnBEnXf9Fz8xF8oCrmMoDe3gvspWZzkBEGQA=; 
 b=C/eo/y+PsTiY4BgfYyh8k8uvIQ3ChsYSXkgyXz1GtaEwiRRa95wiTUDNVh4w8hDliNPBOoqgHARHCb+zBwkZKAzBNx8AAQGa+QTffEF7ZFqe1v7aZowtIJnA3tRzRyh0ahUHEHWCHk1McqbndVClPq6TE5qkf4nj21k76q9h2zs=;
X-UUID: 0be132844e2548488f17290144977874-20200707
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 400272969; Tue, 07 Jul 2020 23:46:28 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Jul 2020 23:46:24 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 7 Jul 2020 23:46:25 +0800
From: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Bibby Hsieh
 <bibby.hsieh@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>
Subject: [PATCH v3 8/9] soc: mediatek: cmdq: add clear option in cmdq_pkt_wfe
 api
Date: Tue, 7 Jul 2020 23:45:13 +0800
Message-ID: <1594136714-11650-9-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1594136714-11650-1-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1594136714-11650-1-git-send-email-dennis-yc.hsieh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Wed, 08 Jul 2020 07:06:31 +0000
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

Add clear parameter to let client decide if
event should be clear to 0 after GCE receive it.

Change since v2:
- Keep behavior in drm crtc driver and
  separate bug fix code into another patch.

Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  |    2 +-
 drivers/soc/mediatek/mtk-cmdq-helper.c   |    5 +++--
 include/linux/mailbox/mtk-cmdq-mailbox.h |    3 +--
 include/linux/soc/mediatek/mtk-cmdq.h    |    5 +++--
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index ec6c9ffbf35e..c84e7a14d4a8 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -490,7 +490,7 @@ static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
 		mbox_flush(mtk_crtc->cmdq_client->chan, 2000);
 		cmdq_handle = cmdq_pkt_create(mtk_crtc->cmdq_client, PAGE_SIZE);
 		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
-		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event);
+		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, true);
 		mtk_crtc_ddp_config(crtc, cmdq_handle);
 		cmdq_pkt_finalize(cmdq_handle);
 		cmdq_pkt_flush_async(cmdq_handle, ddp_cmdq_cb, cmdq_handle);
diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index d55dc3296105..505651b0d715 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -316,15 +316,16 @@ int cmdq_pkt_write_s_mask_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
 }
 EXPORT_SYMBOL(cmdq_pkt_write_s_mask_value);
 
-int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event)
+int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event, bool clear)
 {
 	struct cmdq_instruction inst = { {0} };
+	u32 clear_option = clear ? CMDQ_WFE_UPDATE : 0;
 
 	if (event >= CMDQ_MAX_EVENT)
 		return -EINVAL;
 
 	inst.op = CMDQ_CODE_WFE;
-	inst.value = CMDQ_WFE_OPTION;
+	inst.value = CMDQ_WFE_OPTION | clear_option;
 	inst.event = event;
 
 	return cmdq_pkt_append_command(pkt, inst);
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index efbd8a9eb2d1..d5a983d65f05 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -28,8 +28,7 @@
  * bit 16-27: update value
  * bit 31: 1 - update, 0 - no update
  */
-#define CMDQ_WFE_OPTION			(CMDQ_WFE_UPDATE | CMDQ_WFE_WAIT | \
-					CMDQ_WFE_WAIT_VALUE)
+#define CMDQ_WFE_OPTION			(CMDQ_WFE_WAIT | CMDQ_WFE_WAIT_VALUE)
 
 /** cmdq event maximum */
 #define CMDQ_MAX_EVENT			0x3ff
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 34354e952f60..960704d75994 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -182,11 +182,12 @@ int cmdq_pkt_write_s_mask_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
 /**
  * cmdq_pkt_wfe() - append wait for event command to the CMDQ packet
  * @pkt:	the CMDQ packet
- * @event:	the desired event type to "wait and CLEAR"
+ * @event:	the desired event type to wait
+ * @clear:	clear event or not after event arrive
  *
  * Return: 0 for success; else the error code is returned
  */
-int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event);
+int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event, bool clear);
 
 /**
  * cmdq_pkt_clear_event() - append clear event command to the CMDQ packet
-- 
1.7.9.5
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
