Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D28557DA7E8
	for <lists+dri-devel@lfdr.de>; Sat, 28 Oct 2023 18:00:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8CAB10E0DA;
	Sat, 28 Oct 2023 16:00:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD77B10E090
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Oct 2023 15:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698508794; x=1730044794;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cz3tTXvEw0kCbbqdT9scHNWVdwIwHlzJtvnSCu/rm8M=;
 b=nnpUgtePfQd/Bcq66Hp1F83fLgYWsSktpfG2Xp0Wvo9whRAf+64yfMVB
 3STl8KyjpeUgnqsEP4AVgMT4ajkmXiFSjT+qBY77xv69ksZLXWHTfPVnd
 9lneP573qbCQP6hs2lHJa1PNLApr70rIgjnqfTGM+ryHxNSRU7SjAUgpx
 1njg1m1nGCWI7DLqdMbqTyxWAB1no9/6r0d1LEdShqmgWSQDGYJL6UnuU
 rMnrA9999qIilTVDCarAll+xVLw3rpn0sxqRo1kLhv8Ci/216ojU7l9/k
 h4iK/1bfNaDixN+SfvKm75uq2XYgTud83duV/dkE5Ki0kYdN1Cwl5JV6o w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="452152664"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; d="scan'208";a="452152664"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 08:59:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="763516401"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; d="scan'208";a="763516401"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 08:59:52 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/8] accel/ivpu: Abort pending rx ipc on reset
Date: Sat, 28 Oct 2023 17:59:32 +0200
Message-Id: <20231028155936.1183342-5-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231028155936.1183342-1-stanislaw.gruszka@linux.intel.com>
References: <20231028155936.1183342-1-stanislaw.gruszka@linux.intel.com>
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
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Waking up process, which wait for particular condition, will go to
sleep again on wake_up() if the condition is not met. Add abort flag
to wake up IPC receivers, which will finish with -ECANCELED error.

This is only needed for reset, run time power management prevent to
suspend VPU when there is pending IPC processing or pending job.

Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_ipc.c | 20 +++++++++++++++++---
 drivers/accel/ivpu/ivpu_ipc.h |  3 ++-
 drivers/accel/ivpu/ivpu_job.c |  1 +
 3 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
index 270caef789bf..255f2b8b0b5e 100644
--- a/drivers/accel/ivpu/ivpu_ipc.c
+++ b/drivers/accel/ivpu/ivpu_ipc.c
@@ -148,6 +148,7 @@ ivpu_ipc_consumer_add(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
 	cons->channel = channel;
 	cons->tx_vpu_addr = 0;
 	cons->request_id = 0;
+	cons->aborted = false;
 	spin_lock_init(&cons->rx_msg_lock);
 	INIT_LIST_HEAD(&cons->rx_msg_list);
 	init_waitqueue_head(&cons->rx_msg_wq);
@@ -169,7 +170,8 @@ void ivpu_ipc_consumer_del(struct ivpu_device *vdev, struct ivpu_ipc_consumer *c
 	spin_lock_irq(&cons->rx_msg_lock);
 	list_for_each_entry_safe(rx_msg, r, &cons->rx_msg_list, link) {
 		list_del(&rx_msg->link);
-		ivpu_ipc_rx_mark_free(vdev, rx_msg->ipc_hdr, rx_msg->jsm_msg);
+		if (!cons->aborted)
+			ivpu_ipc_rx_mark_free(vdev, rx_msg->ipc_hdr, rx_msg->jsm_msg);
 		atomic_dec(&ipc->rx_msg_count);
 		kfree(rx_msg);
 	}
@@ -210,7 +212,7 @@ static int ivpu_ipc_rx_need_wakeup(struct ivpu_ipc_consumer *cons)
 		ret |= (kthread_should_stop() || kthread_should_park());
 
 	spin_lock_irq(&cons->rx_msg_lock);
-	ret |= !list_empty(&cons->rx_msg_list);
+	ret |= !list_empty(&cons->rx_msg_list) || cons->aborted;
 	spin_unlock_irq(&cons->rx_msg_lock);
 
 	return ret;
@@ -244,6 +246,12 @@ int ivpu_ipc_receive(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
 		return -EAGAIN;
 	}
 	list_del(&rx_msg->link);
+	if (cons->aborted) {
+		spin_unlock_irq(&cons->rx_msg_lock);
+		ret = -ECANCELED;
+		goto out;
+	}
+
 	spin_unlock_irq(&cons->rx_msg_lock);
 
 	if (ipc_buf)
@@ -261,6 +269,7 @@ int ivpu_ipc_receive(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
 	}
 
 	ivpu_ipc_rx_mark_free(vdev, rx_msg->ipc_hdr, rx_msg->jsm_msg);
+out:
 	atomic_dec(&ipc->rx_msg_count);
 	kfree(rx_msg);
 
@@ -522,8 +531,12 @@ void ivpu_ipc_disable(struct ivpu_device *vdev)
 	mutex_unlock(&ipc->lock);
 
 	spin_lock_irqsave(&ipc->cons_list_lock, flags);
-	list_for_each_entry_safe(cons, c, &ipc->cons_list, link)
+	list_for_each_entry_safe(cons, c, &ipc->cons_list, link) {
+		spin_lock(&cons->rx_msg_lock);
+		cons->aborted = true;
+		spin_unlock(&cons->rx_msg_lock);
 		wake_up(&cons->rx_msg_wq);
+	}
 	spin_unlock_irqrestore(&ipc->cons_list_lock, flags);
 }
 
@@ -532,6 +545,7 @@ void ivpu_ipc_reset(struct ivpu_device *vdev)
 	struct ivpu_ipc_info *ipc = vdev->ipc;
 
 	mutex_lock(&ipc->lock);
+	drm_WARN_ON(&vdev->drm, ipc->on);
 
 	memset(ivpu_bo_vaddr(ipc->mem_tx), 0, ivpu_bo_size(ipc->mem_tx));
 	memset(ivpu_bo_vaddr(ipc->mem_rx), 0, ivpu_bo_size(ipc->mem_rx));
diff --git a/drivers/accel/ivpu/ivpu_ipc.h b/drivers/accel/ivpu/ivpu_ipc.h
index 6918db23daa4..a380787f7222 100644
--- a/drivers/accel/ivpu/ivpu_ipc.h
+++ b/drivers/accel/ivpu/ivpu_ipc.h
@@ -47,8 +47,9 @@ struct ivpu_ipc_consumer {
 	u32 channel;
 	u32 tx_vpu_addr;
 	u32 request_id;
+	bool aborted;
 
-	spinlock_t rx_msg_lock; /* Protects rx_msg_list */
+	spinlock_t rx_msg_lock; /* Protects rx_msg_list and aborted */
 	struct list_head rx_msg_list;
 	wait_queue_head_t rx_msg_wq;
 };
diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index a245b2d44db7..15a408fad494 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -578,6 +578,7 @@ static int ivpu_job_done_thread(void *arg)
 	ivpu_ipc_consumer_add(vdev, &cons, VPU_IPC_CHAN_JOB_RET);
 
 	while (!kthread_should_stop()) {
+		cons.aborted = false;
 		timeout = ivpu_tdr_timeout_ms ? ivpu_tdr_timeout_ms : vdev->timeout.tdr;
 		jobs_submitted = !xa_empty(&vdev->submitted_jobs_xa);
 		ret = ivpu_ipc_receive(vdev, &cons, NULL, &jsm_msg, timeout);
-- 
2.25.1

