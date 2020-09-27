Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 502AA27A46A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 01:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B329D8991E;
	Sun, 27 Sep 2020 23:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF088991E
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Sep 2020 23:04:36 +0000 (UTC)
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F0B1623A03;
 Sun, 27 Sep 2020 23:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601247876;
 bh=hJDq4tjZdqI4dKBHPyi+M3zYUKHMLvJ5su4ytYsmKfY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zl+TrIKtkKkYus/oVyaT/4V+Ic0Ke/prMF952btUo61OnhYJ+pNBQPt+L2D5El4RB
 4WE5/4p77FN5RhMxA2wlAIOHkfeajHnxmnwxpMEc5BA6kwsLV9vkJjRENirK3oIJkj
 3RZrjXqD5m9BiwRhSK1UQ9EZRrQpTeQv6k6LmP1o=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 2/4] mailbox / soc / drm: mediatek: Use mailbox rx_callback
 instead of cmdq_task_cb
Date: Mon, 28 Sep 2020 07:04:20 +0800
Message-Id: <20200927230422.11610-3-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200927230422.11610-1-chunkuang.hu@kernel.org>
References: <20200927230422.11610-1-chunkuang.hu@kernel.org>
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
Cc: linux-arm-kernel@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

rx_callback is a standard mailbox callback mechanism and could cover the
function of proprietary cmdq_task_cb, so use the standard one instead of
the proprietary one.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 17 +++++--
 drivers/mailbox/mtk-cmdq-mailbox.c       | 24 ++++------
 drivers/soc/mediatek/mtk-cmdq-helper.c   | 57 +-----------------------
 include/linux/mailbox/mtk-cmdq-mailbox.h | 24 +++-------
 include/linux/soc/mediatek/mtk-cmdq.h    | 17 +------
 5 files changed, 30 insertions(+), 109 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index cabeb7fea2be..5df2d431418d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -4,9 +4,11 @@
  */
 
 #include <linux/clk.h>
+#include <linux/dma-mapping.h>
 #include <linux/pm_runtime.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
+#include <linux/mailbox_controller.h>
 
 #include <asm/barrier.h>
 #include <soc/mediatek/smi.h>
@@ -236,9 +238,11 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
 }
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-static void ddp_cmdq_cb(struct cmdq_cb_data data)
+static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 {
-	cmdq_pkt_destroy(data.data);
+	struct cmdq_cb_data *data = mssg;
+
+	cmdq_pkt_destroy(data->pkt);
 }
 #endif
 
@@ -484,7 +488,11 @@ static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
 		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event);
 		mtk_crtc_ddp_config(crtc, cmdq_handle);
 		cmdq_pkt_finalize(cmdq_handle);
-		cmdq_pkt_flush_async(cmdq_handle, ddp_cmdq_cb, cmdq_handle);
+		dma_sync_single_for_device(mtk_crtc->cmdq_client->chan->mbox->dev,
+					   cmdq_handle->pa_base,
+					   cmdq_handle->cmd_buf_size,
+					   DMA_TO_DEVICE);
+		cmdq_pkt_flush_async(cmdq_handle);
 	}
 #endif
 	mutex_unlock(&mtk_crtc->hw_lock);
@@ -837,6 +845,9 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 	if (ret)
 		dev_dbg(dev, "mtk_crtc %d failed to get mediatek,gce-events property\n",
 			drm_crtc_index(&mtk_crtc->base));
+
+	if (mtk_crtc->cmdq_client)
+		mtk_crtc->cmdq_client->client.rx_callback = ddp_cmdq_cb;
 #endif
 	return 0;
 }
diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 484d4438cd83..bc11afdebefc 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -180,15 +180,13 @@ static bool cmdq_thread_is_in_wfe(struct cmdq_thread *thread)
 	return readl(thread->base + CMDQ_THR_WAIT_TOKEN) & CMDQ_THR_IS_WAITING;
 }
 
-static void cmdq_task_exec_done(struct cmdq_task *task, enum cmdq_cb_status sta)
+static void cmdq_task_exec_done(struct cmdq_task *task, int sta)
 {
-	struct cmdq_task_cb *cb = &task->pkt->async_cb;
 	struct cmdq_cb_data data;
 
-	WARN_ON(cb->cb == (cmdq_async_flush_cb)NULL);
 	data.sta = sta;
-	data.data = cb->data;
-	cb->cb(data);
+	data.pkt = task->pkt;
+	mbox_chan_received_data(task->thread->chan, &data);
 
 	list_del(&task->list_entry);
 }
@@ -244,10 +242,10 @@ static void cmdq_thread_irq_handler(struct cmdq *cmdq,
 			curr_task = task;
 
 		if (!curr_task || curr_pa == task_end_pa - CMDQ_INST_SIZE) {
-			cmdq_task_exec_done(task, CMDQ_CB_NORMAL);
+			cmdq_task_exec_done(task, 0);
 			kfree(task);
 		} else if (err) {
-			cmdq_task_exec_done(task, CMDQ_CB_ERROR);
+			cmdq_task_exec_done(task, -ENOEXEC);
 			cmdq_task_handle_error(curr_task);
 			kfree(task);
 		}
@@ -415,7 +413,7 @@ static void cmdq_mbox_shutdown(struct mbox_chan *chan)
 
 	list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
 				 list_entry) {
-		cmdq_task_exec_done(task, CMDQ_CB_ERROR);
+		cmdq_task_exec_done(task, -ECONNABORTED);
 		kfree(task);
 	}
 
@@ -434,7 +432,6 @@ static void cmdq_mbox_shutdown(struct mbox_chan *chan)
 static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 {
 	struct cmdq_thread *thread = (struct cmdq_thread *)chan->con_priv;
-	struct cmdq_task_cb *cb;
 	struct cmdq_cb_data data;
 	struct cmdq *cmdq = dev_get_drvdata(chan->mbox->dev);
 	struct cmdq_task *task, *tmp;
@@ -451,12 +448,9 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 
 	list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
 				 list_entry) {
-		cb = &task->pkt->async_cb;
-		if (cb->cb) {
-			data.sta = CMDQ_CB_ERROR;
-			data.data = cb->data;
-			cb->cb(data);
-		}
+		data.sta = -ECONNABORTED;
+		data.pkt = task->pkt;
+		mbox_chan_received_data(task->thread->chan, &data);
 		list_del(&task->list_entry);
 		kfree(task);
 	}
diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 4f311f035b59..b6ee1b525084 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -318,34 +318,11 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
 }
 EXPORT_SYMBOL(cmdq_pkt_finalize);
 
-static void cmdq_pkt_flush_async_cb(struct cmdq_cb_data data)
-{
-	struct cmdq_pkt *pkt = (struct cmdq_pkt *)data.data;
-	struct cmdq_task_cb *cb = &pkt->cb;
-	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
-
-	dma_sync_single_for_cpu(client->chan->mbox->dev, pkt->pa_base,
-				pkt->cmd_buf_size, DMA_TO_DEVICE);
-	if (cb->cb) {
-		data.data = cb->data;
-		cb->cb(data);
-	}
-}
-
-int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb cb,
-			 void *data)
+int cmdq_pkt_flush_async(struct cmdq_pkt *pkt)
 {
 	int err;
 	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
 
-	pkt->cb.cb = cb;
-	pkt->cb.data = data;
-	pkt->async_cb.cb = cmdq_pkt_flush_async_cb;
-	pkt->async_cb.data = pkt;
-
-	dma_sync_single_for_device(client->chan->mbox->dev, pkt->pa_base,
-				   pkt->cmd_buf_size, DMA_TO_DEVICE);
-
 	err = mbox_send_message(client->chan, pkt);
 	if (err < 0)
 		return err;
@@ -356,36 +333,4 @@ int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb cb,
 }
 EXPORT_SYMBOL(cmdq_pkt_flush_async);
 
-struct cmdq_flush_completion {
-	struct completion cmplt;
-	bool err;
-};
-
-static void cmdq_pkt_flush_cb(struct cmdq_cb_data data)
-{
-	struct cmdq_flush_completion *cmplt;
-
-	cmplt = (struct cmdq_flush_completion *)data.data;
-	if (data.sta != CMDQ_CB_NORMAL)
-		cmplt->err = true;
-	else
-		cmplt->err = false;
-	complete(&cmplt->cmplt);
-}
-
-int cmdq_pkt_flush(struct cmdq_pkt *pkt)
-{
-	struct cmdq_flush_completion cmplt;
-	int err;
-
-	init_completion(&cmplt.cmplt);
-	err = cmdq_pkt_flush_async(pkt, cmdq_pkt_flush_cb, &cmplt);
-	if (err < 0)
-		return err;
-	wait_for_completion(&cmplt.cmplt);
-
-	return cmplt.err ? -EFAULT : 0;
-}
-EXPORT_SYMBOL(cmdq_pkt_flush);
-
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index 05eea1aef5aa..2cec4dbaa214 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -63,33 +63,19 @@ enum cmdq_code {
 	CMDQ_CODE_LOGIC = 0xa0,
 };
 
-enum cmdq_cb_status {
-	CMDQ_CB_NORMAL = 0,
-	CMDQ_CB_ERROR
-};
-
-struct cmdq_cb_data {
-	enum cmdq_cb_status	sta;
-	void			*data;
-};
-
-typedef void (*cmdq_async_flush_cb)(struct cmdq_cb_data data);
-
-struct cmdq_task_cb {
-	cmdq_async_flush_cb	cb;
-	void			*data;
-};
-
 struct cmdq_pkt {
 	void			*va_base;
 	dma_addr_t		pa_base;
 	size_t			cmd_buf_size; /* command occupied size */
 	size_t			buf_size; /* real buffer size */
-	struct cmdq_task_cb	cb;
-	struct cmdq_task_cb	async_cb;
 	void			*cl;
 };
 
+struct cmdq_cb_data {
+	int sta;
+	struct cmdq_pkt *pkt;
+};
+
 u8 cmdq_get_shift_pa(struct mbox_chan *chan);
 
 #endif /* __MTK_CMDQ_MAILBOX_H__ */
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 175bd89f46f8..a09b3f39b861 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -178,8 +178,6 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt);
  * cmdq_pkt_flush_async() - trigger CMDQ to asynchronously execute the CMDQ
  *                          packet and call back at the end of done packet
  * @pkt:	the CMDQ packet
- * @cb:		called at the end of done packet
- * @data:	this data will pass back to cb
  *
  * Return: 0 for success; else the error code is returned
  *
@@ -187,19 +185,6 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt);
  * at the end of done packet. Note that this is an ASYNC function. When the
  * function returned, it may or may not be finished.
  */
-int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb cb,
-			 void *data);
-
-/**
- * cmdq_pkt_flush() - trigger CMDQ to execute the CMDQ packet
- * @pkt:	the CMDQ packet
- *
- * Return: 0 for success; else the error code is returned
- *
- * Trigger CMDQ to execute the CMDQ packet. Note that this is a
- * synchronous flush function. When the function returned, the recorded
- * commands have been done.
- */
-int cmdq_pkt_flush(struct cmdq_pkt *pkt);
+int cmdq_pkt_flush_async(struct cmdq_pkt *pkt);
 
 #endif	/* __MTK_CMDQ_H__ */
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
