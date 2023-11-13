Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D065B7EA1A2
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 18:03:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F81910E3C9;
	Mon, 13 Nov 2023 17:03:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B92110E171
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 17:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699895018; x=1731431018;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aphWYFW7p5lClmjDUVokop1xXPY7B+zW+UPUpmCjiI4=;
 b=QG9OdlAKpvpjru7LuXyVln0ysO/CSNvdlX7CaXyN8/AUFEpd9vjdzkal
 jZaSWwBKHNco889ij0yTA1dpGN/25IOPqi18pO5Sh5uYQ9khbXx8Hi5QP
 fOw6W+08lkCx8yZkr7RAEPq5yynk89f4hLmtylZH2YXBDawpE/bIiLAzx
 NUk0jJMId+2rfYmK6WpAuOv0rBmgz/g+rzYIR1lJGpM/0yYdOHJ+mrXbr
 U/xNckb/cPaBDytzpUmiz0QKzBB10SFWd+vmgAiYPqKglBpbY9FK1ynjS
 NuVM5U5Is7+XSn9SKNOaSTf959bDdhFRu9fxl30sY7W3sTGSu+NdhIaDl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="3520676"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="3520676"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 09:03:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="937788070"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="937788070"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 09:03:00 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] accel/ivpu: Do not use cons->aborted for job_done_thread
Date: Mon, 13 Nov 2023 18:02:50 +0100
Message-ID: <20231113170252.758137-4-jacek.lawrynowicz@linux.intel.com>
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

This allow to simplify ivpu_ipc_receive() as now we do not have
to process all messages in aborted state - they will be freed in
ivpu_ipc_consumer_del().

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_ipc.c | 18 +++++++++---------
 drivers/accel/ivpu/ivpu_job.c |  1 -
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
index 781c7e40505a..1dd4413dc88f 100644
--- a/drivers/accel/ivpu/ivpu_ipc.c
+++ b/drivers/accel/ivpu/ivpu_ipc.c
@@ -238,17 +238,16 @@ int ivpu_ipc_receive(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
 		return -ETIMEDOUT;
 
 	spin_lock_irq(&cons->rx_lock);
+	if (cons->aborted) {
+		spin_unlock_irq(&cons->rx_lock);
+		return -ECANCELED;
+	}
 	rx_msg = list_first_entry_or_null(&cons->rx_msg_list, struct ivpu_ipc_rx_msg, link);
 	if (!rx_msg) {
 		spin_unlock_irq(&cons->rx_lock);
 		return -EAGAIN;
 	}
 	list_del(&rx_msg->link);
-	if (cons->aborted) {
-		spin_unlock_irq(&cons->rx_lock);
-		ret = -ECANCELED;
-		goto out;
-	}
 	spin_unlock_irq(&cons->rx_lock);
 
 	if (ipc_buf)
@@ -266,7 +265,6 @@ int ivpu_ipc_receive(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
 	}
 
 	ivpu_ipc_rx_mark_free(vdev, rx_msg->ipc_hdr, rx_msg->jsm_msg);
-out:
 	atomic_dec(&ipc->rx_msg_count);
 	kfree(rx_msg);
 
@@ -528,9 +526,11 @@ void ivpu_ipc_disable(struct ivpu_device *vdev)
 
 	spin_lock_irqsave(&ipc->cons_list_lock, flags);
 	list_for_each_entry_safe(cons, c, &ipc->cons_list, link) {
-		spin_lock(&cons->rx_lock);
-		cons->aborted = true;
-		spin_unlock(&cons->rx_lock);
+		if (cons->channel != VPU_IPC_CHAN_JOB_RET) {
+			spin_lock(&cons->rx_lock);
+			cons->aborted = true;
+			spin_unlock(&cons->rx_lock);
+		}
 		wake_up(&cons->rx_msg_wq);
 	}
 	spin_unlock_irqrestore(&ipc->cons_list_lock, flags);
diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 02acd8dba02a..77b1b8abadd6 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -578,7 +578,6 @@ static int ivpu_job_done_thread(void *arg)
 	ivpu_ipc_consumer_add(vdev, &cons, VPU_IPC_CHAN_JOB_RET);
 
 	while (!kthread_should_stop()) {
-		cons.aborted = false;
 		timeout = ivpu_tdr_timeout_ms ? ivpu_tdr_timeout_ms : vdev->timeout.tdr;
 		jobs_submitted = !xa_empty(&vdev->submitted_jobs_xa);
 		ret = ivpu_ipc_receive(vdev, &cons, NULL, &jsm_msg, timeout);
-- 
2.42.0

