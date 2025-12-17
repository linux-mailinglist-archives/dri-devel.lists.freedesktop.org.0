Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2512CCC901C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 18:17:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C2E510E875;
	Wed, 17 Dec 2025 17:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ppv9FTuW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83ED10E170
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 17:17:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 24A1560586;
 Wed, 17 Dec 2025 17:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CEB6C19421;
 Wed, 17 Dec 2025 17:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765991821;
 bh=AD7dDXAD3itkjdYA9TfORuuV9wOhDa/AZUPfi5Hae9k=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=ppv9FTuWEHdNKSoznW2U69F+f/KnzH91SZNCxEErTRR1CUqHGWGh32PIpm3SAA8Y0
 dol7hmh3gMleLRiECS98M48jEoWvrA1HfLm7LWPAWi1g5yN6xZwqYrxTorabcRTkM5
 RPzTj2w9GKDBT4EGQDRe99d/bdVB4O+Lo8u/eFQWLFLf6p2fnE5Y3+b5BHp8dVnz+g
 K7kgeVSMmW37lHg9Vjm2rpEhq/UtoKBauSgTlBa46GYVi2q1dEVbOflfpbJCbsDGrQ
 KDd7J1dj56t77HsDCa9X50CdMLzcXAOgBTDzrtrJHUnJKvUXfY28BmLoTtXYs585Oz
 wZH32/DEmyPXg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 7DFD2D65C7D;
 Wed, 17 Dec 2025 17:17:01 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay
 <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Wed, 17 Dec 2025 22:46:52 +0530
Subject: [PATCH 2/2] bus: mhi: host: Drop the auto_queue support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-qrtr-fix-v1-2-f6142a3ec9d8@oss.qualcomm.com>
References: <20251217-qrtr-fix-v1-0-f6142a3ec9d8@oss.qualcomm.com>
In-Reply-To: <20251217-qrtr-fix-v1-0-f6142a3ec9d8@oss.qualcomm.com>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>, 
 Oded Gabbay <ogabbay@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Jeff Johnson <jjohnson@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Maxim Kochetkov <fido_max@inbox.ru>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 ath12k@lists.infradead.org, netdev@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, Johan Hovold <johan@kernel.org>, 
 Chris Lew <quic_clew@quicinc.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7752;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=VV1/Ikl0OH6lDMHohEMkdP14WyebiuRyo/ktlKpfYQ0=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpQuWLymmyGTbV8eF0fjUIB0p3YI1DhyQBE4klb
 8kCicS1Oa2JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaULliwAKCRBVnxHm/pHO
 9f8NB/4pb1tI5jOjRcvH7nqMIvhr0IshwN2BGFpgymF6Pqg2ovOgSWiITOPGtpgeDwuTeuMofNq
 VJ+zsH8/hmSDmNuIfbb1uRzu3xNiBI50/5Knqw99RFdVu5wer7HL+F9AsG/4tuh7igH/VofxnoJ
 7JaDGbVyajrKnkuLP7A0/kKjCFTc+eWFeWWWZnIHgq/2k2tp8G2raOmrquJSqExOMYt9CIhm89p
 m4oHnZgqmlWMm9dg8glTibgBM1xYkOfgk99G5XczRPLbt5q5fPVG+fPGghyJc5IvpMBVGfW2u0l
 O8fcUyy/ZqUf3iCP/Tu5EBZc5GzfGRIpRrq2Gl+h8CCjmaLr
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
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
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Now that the only user of the 'auto_queue' feature, (QRTR) has been
converted to manage the buffers on its own, drop the code related to it.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/bus/mhi/host/init.c     | 10 -----
 drivers/bus/mhi/host/internal.h |  3 --
 drivers/bus/mhi/host/main.c     | 81 +----------------------------------------
 include/linux/mhi.h             | 14 -------
 4 files changed, 2 insertions(+), 106 deletions(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 099be8dd1900..b020a6489c07 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -841,18 +841,8 @@ static int parse_ch_cfg(struct mhi_controller *mhi_cntrl,
 		mhi_chan->lpm_notify = ch_cfg->lpm_notify;
 		mhi_chan->offload_ch = ch_cfg->offload_channel;
 		mhi_chan->db_cfg.reset_req = ch_cfg->doorbell_mode_switch;
-		mhi_chan->pre_alloc = ch_cfg->auto_queue;
 		mhi_chan->wake_capable = ch_cfg->wake_capable;
 
-		/*
-		 * If MHI host allocates buffers, then the channel direction
-		 * should be DMA_FROM_DEVICE
-		 */
-		if (mhi_chan->pre_alloc && mhi_chan->dir != DMA_FROM_DEVICE) {
-			dev_err(dev, "Invalid channel configuration\n");
-			goto error_chan_cfg;
-		}
-
 		/*
 		 * Bi-directional and direction less channel must be an
 		 * offload channel
diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index 7937bb1f742c..7b0ee5e3a12d 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -286,7 +286,6 @@ struct mhi_chan {
 	bool lpm_notify;
 	bool configured;
 	bool offload_ch;
-	bool pre_alloc;
 	bool wake_capable;
 };
 
@@ -389,8 +388,6 @@ int mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
 		      struct image_info *img_info);
 void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl);
 
-/* Automatically allocate and queue inbound buffers */
-#define MHI_CH_INBOUND_ALLOC_BUFS BIT(0)
 int mhi_init_chan_ctxt(struct mhi_controller *mhi_cntrl,
 		       struct mhi_chan *mhi_chan);
 void mhi_deinit_chan_ctxt(struct mhi_controller *mhi_cntrl,
diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 861551274319..53c0ffe30070 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -664,23 +664,6 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
 				mhi_cntrl->runtime_put(mhi_cntrl);
 			}
 
-			/*
-			 * Recycle the buffer if buffer is pre-allocated,
-			 * if there is an error, not much we can do apart
-			 * from dropping the packet
-			 */
-			if (mhi_chan->pre_alloc) {
-				if (mhi_queue_buf(mhi_chan->mhi_dev,
-						  mhi_chan->dir,
-						  buf_info->cb_buf,
-						  buf_info->len, MHI_EOT)) {
-					dev_err(dev,
-						"Error recycling buffer for chan:%d\n",
-						mhi_chan->chan);
-					kfree(buf_info->cb_buf);
-				}
-			}
-
 			read_lock_bh(&mhi_chan->lock);
 		}
 		break;
@@ -1177,17 +1160,12 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
 int mhi_queue_skb(struct mhi_device *mhi_dev, enum dma_data_direction dir,
 		  struct sk_buff *skb, size_t len, enum mhi_flags mflags)
 {
-	struct mhi_chan *mhi_chan = (dir == DMA_TO_DEVICE) ? mhi_dev->ul_chan :
-							     mhi_dev->dl_chan;
 	struct mhi_buf_info buf_info = { };
 
 	buf_info.v_addr = skb->data;
 	buf_info.cb_buf = skb;
 	buf_info.len = len;
 
-	if (unlikely(mhi_chan->pre_alloc))
-		return -EINVAL;
-
 	return mhi_queue(mhi_dev, &buf_info, dir, mflags);
 }
 EXPORT_SYMBOL_GPL(mhi_queue_skb);
@@ -1472,45 +1450,6 @@ static int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
 	if (ret)
 		goto error_pm_state;
 
-	if (mhi_chan->dir == DMA_FROM_DEVICE)
-		mhi_chan->pre_alloc = !!(flags & MHI_CH_INBOUND_ALLOC_BUFS);
-
-	/* Pre-allocate buffer for xfer ring */
-	if (mhi_chan->pre_alloc) {
-		int nr_el = get_nr_avail_ring_elements(mhi_cntrl,
-						       &mhi_chan->tre_ring);
-		size_t len = mhi_cntrl->buffer_len;
-
-		while (nr_el--) {
-			void *buf;
-			struct mhi_buf_info info = { };
-
-			buf = kmalloc(len, GFP_KERNEL);
-			if (!buf) {
-				ret = -ENOMEM;
-				goto error_pre_alloc;
-			}
-
-			/* Prepare transfer descriptors */
-			info.v_addr = buf;
-			info.cb_buf = buf;
-			info.len = len;
-			ret = mhi_gen_tre(mhi_cntrl, mhi_chan, &info, MHI_EOT);
-			if (ret) {
-				kfree(buf);
-				goto error_pre_alloc;
-			}
-		}
-
-		read_lock_bh(&mhi_cntrl->pm_lock);
-		if (MHI_DB_ACCESS_VALID(mhi_cntrl)) {
-			read_lock_irq(&mhi_chan->lock);
-			mhi_ring_chan_db(mhi_cntrl, mhi_chan);
-			read_unlock_irq(&mhi_chan->lock);
-		}
-		read_unlock_bh(&mhi_cntrl->pm_lock);
-	}
-
 	mutex_unlock(&mhi_chan->mutex);
 
 	return 0;
@@ -1522,12 +1461,6 @@ static int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
 error_init_chan:
 	mutex_unlock(&mhi_chan->mutex);
 
-	return ret;
-
-error_pre_alloc:
-	mutex_unlock(&mhi_chan->mutex);
-	mhi_unprepare_channel(mhi_cntrl, mhi_chan);
-
 	return ret;
 }
 
@@ -1600,12 +1533,8 @@ static void mhi_reset_data_chan(struct mhi_controller *mhi_cntrl,
 		mhi_del_ring_element(mhi_cntrl, buf_ring);
 		mhi_del_ring_element(mhi_cntrl, tre_ring);
 
-		if (mhi_chan->pre_alloc) {
-			kfree(buf_info->cb_buf);
-		} else {
-			result.buf_addr = buf_info->cb_buf;
-			mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
-		}
+		result.buf_addr = buf_info->cb_buf;
+		mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
 	}
 }
 
@@ -1666,12 +1595,6 @@ int mhi_prepare_for_transfer(struct mhi_device *mhi_dev)
 }
 EXPORT_SYMBOL_GPL(mhi_prepare_for_transfer);
 
-int mhi_prepare_for_transfer_autoqueue(struct mhi_device *mhi_dev)
-{
-	return __mhi_prepare_for_transfer(mhi_dev, MHI_CH_INBOUND_ALLOC_BUFS);
-}
-EXPORT_SYMBOL_GPL(mhi_prepare_for_transfer_autoqueue);
-
 void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev)
 {
 	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index dd372b0123a6..88ccb3e14f48 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -215,7 +215,6 @@ enum mhi_db_brst_mode {
  * @lpm_notify: The channel master requires low power mode notifications
  * @offload_channel: The client manages the channel completely
  * @doorbell_mode_switch: Channel switches to doorbell mode on M0 transition
- * @auto_queue: Framework will automatically queue buffers for DL traffic
  * @wake-capable: Channel capable of waking up the system
  */
 struct mhi_channel_config {
@@ -232,7 +231,6 @@ struct mhi_channel_config {
 	bool lpm_notify;
 	bool offload_channel;
 	bool doorbell_mode_switch;
-	bool auto_queue;
 	bool wake_capable;
 };
 
@@ -743,18 +741,6 @@ void mhi_device_put(struct mhi_device *mhi_dev);
  */
 int mhi_prepare_for_transfer(struct mhi_device *mhi_dev);
 
-/**
- * mhi_prepare_for_transfer_autoqueue - Setup UL and DL channels with auto queue
- *                                      buffers for DL traffic
- * @mhi_dev: Device associated with the channels
- *
- * Allocate and initialize the channel context and also issue the START channel
- * command to both channels. Channels can be started only if both host and
- * device execution environments match and channels are in a DISABLED state.
- * The MHI core will automatically allocate and queue buffers for the DL traffic.
- */
-int mhi_prepare_for_transfer_autoqueue(struct mhi_device *mhi_dev);
-
 /**
  * mhi_unprepare_from_transfer - Reset UL and DL channels for data transfer.
  *                               Issue the RESET channel command and let the

-- 
2.48.1


