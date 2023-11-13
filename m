Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C247EA1A0
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 18:03:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2450010E3C8;
	Mon, 13 Nov 2023 17:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC75210E171
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 17:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699895016; x=1731431016;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XV54AxIP5keYi1lRpf8HneXoxc6S7fNK6+eulkMurM8=;
 b=TqVHKvGumiotr+HI/Cf+9nf+Ft9bdqYkPzd5+LFhYlcSo6jYrImellNf
 9c7X7Mhpl4uxj9/+LwSoob2hThm6wm1pq7/OBZeDDVywwhJpQRm3ZE25o
 i7R+duRWF/r3d81b4F/NhV80gbjc4gPcoD9Edh0Fild8rbaRlKFDEJ9Co
 YPY2VvZnBXgkKeoIR0s+7+cNmcZwghZLHWPfymv8b5DS1tUxhS/hwij+y
 r5sVuK8xs/34Dpt5RGQS548tSA2M/NYJPl8+0O3l9R4P/9DT03yre76e5
 2euvoUTV6ywRL+2O+I6+CKc2Nl0zOiMJwg/MOe+wNtWO8+mvRzhGtA+Yp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="3520658"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="3520658"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 09:02:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="937788059"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="937788059"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 09:02:56 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] accel/ivpu: Rename cons->rx_msg_lock
Date: Mon, 13 Nov 2023 18:02:48 +0100
Message-ID: <20231113170252.758137-2-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231113170252.758137-1-jacek.lawrynowicz@linux.intel.com>
References: <20231113170252.758137-1-jacek.lawrynowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 quic_jhugo@quicinc.com, Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Now the cons->rx_msg_lock protects also 'abort' field so rename the lock.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_ipc.c | 27 +++++++++++++--------------
 drivers/accel/ivpu/ivpu_ipc.h |  2 +-
 2 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
index 88453762c9d5..31ae0e71a8a3 100644
--- a/drivers/accel/ivpu/ivpu_ipc.c
+++ b/drivers/accel/ivpu/ivpu_ipc.c
@@ -150,7 +150,7 @@ ivpu_ipc_consumer_add(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
 	cons->tx_vpu_addr = 0;
 	cons->request_id = 0;
 	cons->aborted = false;
-	spin_lock_init(&cons->rx_msg_lock);
+	spin_lock_init(&cons->rx_lock);
 	INIT_LIST_HEAD(&cons->rx_msg_list);
 	init_waitqueue_head(&cons->rx_msg_wq);
 
@@ -168,7 +168,7 @@ void ivpu_ipc_consumer_del(struct ivpu_device *vdev, struct ivpu_ipc_consumer *c
 	list_del(&cons->link);
 	spin_unlock_irq(&ipc->cons_list_lock);
 
-	spin_lock_irq(&cons->rx_msg_lock);
+	spin_lock_irq(&cons->rx_lock);
 	list_for_each_entry_safe(rx_msg, r, &cons->rx_msg_list, link) {
 		list_del(&rx_msg->link);
 		if (!cons->aborted)
@@ -176,7 +176,7 @@ void ivpu_ipc_consumer_del(struct ivpu_device *vdev, struct ivpu_ipc_consumer *c
 		atomic_dec(&ipc->rx_msg_count);
 		kfree(rx_msg);
 	}
-	spin_unlock_irq(&cons->rx_msg_lock);
+	spin_unlock_irq(&cons->rx_lock);
 
 	ivpu_ipc_tx_release(vdev, cons->tx_vpu_addr);
 }
@@ -212,9 +212,9 @@ static int ivpu_ipc_rx_need_wakeup(struct ivpu_ipc_consumer *cons)
 	if (IS_KTHREAD())
 		ret |= (kthread_should_stop() || kthread_should_park());
 
-	spin_lock_irq(&cons->rx_msg_lock);
+	spin_lock_irq(&cons->rx_lock);
 	ret |= !list_empty(&cons->rx_msg_list) || cons->aborted;
-	spin_unlock_irq(&cons->rx_msg_lock);
+	spin_unlock_irq(&cons->rx_lock);
 
 	return ret;
 }
@@ -237,20 +237,19 @@ int ivpu_ipc_receive(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
 	if (wait_ret == 0)
 		return -ETIMEDOUT;
 
-	spin_lock_irq(&cons->rx_msg_lock);
+	spin_lock_irq(&cons->rx_lock);
 	rx_msg = list_first_entry_or_null(&cons->rx_msg_list, struct ivpu_ipc_rx_msg, link);
 	if (!rx_msg) {
-		spin_unlock_irq(&cons->rx_msg_lock);
+		spin_unlock_irq(&cons->rx_lock);
 		return -EAGAIN;
 	}
 	list_del(&rx_msg->link);
 	if (cons->aborted) {
-		spin_unlock_irq(&cons->rx_msg_lock);
+		spin_unlock_irq(&cons->rx_lock);
 		ret = -ECANCELED;
 		goto out;
 	}
-
-	spin_unlock_irq(&cons->rx_msg_lock);
+	spin_unlock_irq(&cons->rx_lock);
 
 	if (ipc_buf)
 		memcpy(ipc_buf, rx_msg->ipc_hdr, sizeof(*ipc_buf));
@@ -383,9 +382,9 @@ ivpu_ipc_dispatch(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
 	rx_msg->ipc_hdr = ipc_hdr;
 	rx_msg->jsm_msg = jsm_msg;
 
-	spin_lock_irqsave(&cons->rx_msg_lock, flags);
+	spin_lock_irqsave(&cons->rx_lock, flags);
 	list_add_tail(&rx_msg->link, &cons->rx_msg_list);
-	spin_unlock_irqrestore(&cons->rx_msg_lock, flags);
+	spin_unlock_irqrestore(&cons->rx_lock, flags);
 
 	wake_up(&cons->rx_msg_wq);
 }
@@ -529,9 +528,9 @@ void ivpu_ipc_disable(struct ivpu_device *vdev)
 
 	spin_lock_irqsave(&ipc->cons_list_lock, flags);
 	list_for_each_entry_safe(cons, c, &ipc->cons_list, link) {
-		spin_lock(&cons->rx_msg_lock);
+		spin_lock(&cons->rx_lock);
 		cons->aborted = true;
-		spin_unlock(&cons->rx_msg_lock);
+		spin_unlock(&cons->rx_lock);
 		wake_up(&cons->rx_msg_wq);
 	}
 	spin_unlock_irqrestore(&ipc->cons_list_lock, flags);
diff --git a/drivers/accel/ivpu/ivpu_ipc.h b/drivers/accel/ivpu/ivpu_ipc.h
index a380787f7222..71b2e648dffd 100644
--- a/drivers/accel/ivpu/ivpu_ipc.h
+++ b/drivers/accel/ivpu/ivpu_ipc.h
@@ -49,7 +49,7 @@ struct ivpu_ipc_consumer {
 	u32 request_id;
 	bool aborted;
 
-	spinlock_t rx_msg_lock; /* Protects rx_msg_list and aborted */
+	spinlock_t rx_lock; /* Protects rx_msg_list and aborted */
 	struct list_head rx_msg_list;
 	wait_queue_head_t rx_msg_wq;
 };
-- 
2.42.0

