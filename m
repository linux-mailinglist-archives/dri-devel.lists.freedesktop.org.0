Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDE82718A2
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 01:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C29C6E05C;
	Sun, 20 Sep 2020 23:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1BCB6E0E2
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Sep 2020 23:42:41 +0000 (UTC)
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B2F54206B5;
 Sun, 20 Sep 2020 23:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600645360;
 bh=mgDMbfvtNzbst4k3uB+Gk/tPgYe2PUC1BGewW5HBe6o=;
 h=From:To:Cc:Subject:Date:From;
 b=VG6dVd0/Fn4VJ50WzoCKAFBFRXnTPT/ye7Ft3GnBqUdVPeQ+zaBtOq8PnznE7Foru
 7HlV8S24Gt+0H293nb8SfIdWMJsVnDJ8lldeanNSDsaB8P14uQ/ix33ExOI6NLxDah
 G4WO2gSTFXWhb2KVJK0qmEeVwUlKZadOyn3bLcLg=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] soc: mediatek: cmdq: Remove timeout handler in helper function
Date: Mon, 21 Sep 2020 07:42:16 +0800
Message-Id: <20200920234216.16884-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For each client driver, its timeout handler need to dump hardware register
or its state machine information, so remove timeout handler in helper
function and let client driver implement its own timeout handler.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c |  3 +-
 drivers/soc/mediatek/mtk-cmdq-helper.c  | 41 +------------------------
 include/linux/soc/mediatek/mtk-cmdq.h   | 11 +------
 3 files changed, 3 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 3fc5511330b9..cabeb7fea2be 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -824,8 +824,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	mtk_crtc->cmdq_client =
 			cmdq_mbox_create(mtk_crtc->mmsys_dev,
-					 drm_crtc_index(&mtk_crtc->base),
-					 2000);
+					 drm_crtc_index(&mtk_crtc->base));
 	if (IS_ERR(mtk_crtc->cmdq_client)) {
 		dev_dbg(dev, "mtk_crtc %d failed to create mailbox client, writing register by CPU now\n",
 			drm_crtc_index(&mtk_crtc->base));
diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index dc644cfb6419..4f311f035b59 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -65,14 +65,7 @@ int cmdq_dev_get_client_reg(struct device *dev,
 }
 EXPORT_SYMBOL(cmdq_dev_get_client_reg);
 
-static void cmdq_client_timeout(struct timer_list *t)
-{
-	struct cmdq_client *client = from_timer(client, t, timer);
-
-	dev_err(client->client.dev, "cmdq timeout!\n");
-}
-
-struct cmdq_client *cmdq_mbox_create(struct device *dev, int index, u32 timeout)
+struct cmdq_client *cmdq_mbox_create(struct device *dev, int index)
 {
 	struct cmdq_client *client;
 
@@ -80,12 +73,6 @@ struct cmdq_client *cmdq_mbox_create(struct device *dev, int index, u32 timeout)
 	if (!client)
 		return (struct cmdq_client *)-ENOMEM;
 
-	client->timeout_ms = timeout;
-	if (timeout != CMDQ_NO_TIMEOUT) {
-		spin_lock_init(&client->lock);
-		timer_setup(&client->timer, cmdq_client_timeout, 0);
-	}
-	client->pkt_cnt = 0;
 	client->client.dev = dev;
 	client->client.tx_block = false;
 	client->client.knows_txdone = true;
@@ -107,11 +94,6 @@ EXPORT_SYMBOL(cmdq_mbox_create);
 
 void cmdq_mbox_destroy(struct cmdq_client *client)
 {
-	if (client->timeout_ms != CMDQ_NO_TIMEOUT) {
-		spin_lock(&client->lock);
-		del_timer_sync(&client->timer);
-		spin_unlock(&client->lock);
-	}
 	mbox_free_channel(client->chan);
 	kfree(client);
 }
@@ -342,18 +324,6 @@ static void cmdq_pkt_flush_async_cb(struct cmdq_cb_data data)
 	struct cmdq_task_cb *cb = &pkt->cb;
 	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
 
-	if (client->timeout_ms != CMDQ_NO_TIMEOUT) {
-		unsigned long flags = 0;
-
-		spin_lock_irqsave(&client->lock, flags);
-		if (--client->pkt_cnt == 0)
-			del_timer(&client->timer);
-		else
-			mod_timer(&client->timer, jiffies +
-				  msecs_to_jiffies(client->timeout_ms));
-		spin_unlock_irqrestore(&client->lock, flags);
-	}
-
 	dma_sync_single_for_cpu(client->chan->mbox->dev, pkt->pa_base,
 				pkt->cmd_buf_size, DMA_TO_DEVICE);
 	if (cb->cb) {
@@ -366,7 +336,6 @@ int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb cb,
 			 void *data)
 {
 	int err;
-	unsigned long flags = 0;
 	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
 
 	pkt->cb.cb = cb;
@@ -377,14 +346,6 @@ int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb cb,
 	dma_sync_single_for_device(client->chan->mbox->dev, pkt->pa_base,
 				   pkt->cmd_buf_size, DMA_TO_DEVICE);
 
-	if (client->timeout_ms != CMDQ_NO_TIMEOUT) {
-		spin_lock_irqsave(&client->lock, flags);
-		if (client->pkt_cnt++ == 0)
-			mod_timer(&client->timer, jiffies +
-				  msecs_to_jiffies(client->timeout_ms));
-		spin_unlock_irqrestore(&client->lock, flags);
-	}
-
 	err = mbox_send_message(client->chan, pkt);
 	if (err < 0)
 		return err;
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 2249ecaf77e4..175bd89f46f8 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -11,8 +11,6 @@
 #include <linux/mailbox/mtk-cmdq-mailbox.h>
 #include <linux/timer.h>
 
-#define CMDQ_NO_TIMEOUT		0xffffffffu
-
 struct cmdq_pkt;
 
 struct cmdq_client_reg {
@@ -22,12 +20,8 @@ struct cmdq_client_reg {
 };
 
 struct cmdq_client {
-	spinlock_t lock;
-	u32 pkt_cnt;
 	struct mbox_client client;
 	struct mbox_chan *chan;
-	struct timer_list timer;
-	u32 timeout_ms; /* in unit of microsecond */
 };
 
 /**
@@ -49,13 +43,10 @@ int cmdq_dev_get_client_reg(struct device *dev,
  * cmdq_mbox_create() - create CMDQ mailbox client and channel
  * @dev:	device of CMDQ mailbox client
  * @index:	index of CMDQ mailbox channel
- * @timeout:	timeout of a pkt execution by GCE, in unit of microsecond, set
- *		CMDQ_NO_TIMEOUT if a timer is not used.
  *
  * Return: CMDQ mailbox client pointer
  */
-struct cmdq_client *cmdq_mbox_create(struct device *dev, int index,
-				     u32 timeout);
+struct cmdq_client *cmdq_mbox_create(struct device *dev, int index);
 
 /**
  * cmdq_mbox_destroy() - destroy CMDQ mailbox client and channel
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
