Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B857AD7BA
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 14:11:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2402B10E23B;
	Mon, 25 Sep 2023 12:11:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F2610E23B
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 12:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695643905; x=1727179905;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FwQbJE8cd0c9EvAUDT7riuZnDPm2pf0pyeo2j20HLro=;
 b=QlP5lxleNvnYsiZoOEqMhed1SCdnUf0kW+wYHncIi3YWP+G0BUeYk48f
 +eWfcTY0T7BjV7LRMUelNiYniy6neVho5KAvQrSxpm2DBltOtZXnkQUNa
 5pyAyOZCI4b8L6NWHnOv7JgHrWqpzxJzYuUmPPSxlvDPm/I637JYbIyfp
 2shvVE/QSaNFE/rbXHBarNXZIWMny6PKZnzz2lEuz8pXfIE8VvHK+6uVu
 Bxd0AfztJBfCR/YIxf3UETA1xpePs/XDQZy2nSgd1Vi+cFhnVC72Zlr9A
 MxYFH9Bp3FnORjjuyvK0j1857rifd8r/Mmu1WBQbAmZU/eyCtQ1j/PbcG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="378503374"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="378503374"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 05:11:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="921949422"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="921949422"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 05:11:41 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/6] accel/ivpu: Do not use wait event interruptible
Date: Mon, 25 Sep 2023 14:11:32 +0200
Message-Id: <20230925121137.872158-2-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230925121137.872158-1-stanislaw.gruszka@linux.intel.com>
References: <20230925121137.872158-1-stanislaw.gruszka@linux.intel.com>
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

If we receive signal when waiting for IPC message response in
ivpu_ipc_receive() we return error and continue to operate.
Then the driver can send another IPC messages and re-use occupied
slot of the message still processed by the firmware. This can result
in corrupting firmware memory and following FW crash with messages:

[ 3698.569719] intel_vpu 0000:00:0b.0: [drm] ivpu_ipc_send_receive_internal(): IPC receive failed: type 0x1103, ret -512
[ 3698.569747] intel_vpu 0000:00:0b.0: [drm] ivpu_jsm_unregister_db(): Failed to unregister doorbell 3: -512
[ 3698.569756] intel_vpu 0000:00:0b.0: [drm] ivpu_ipc_tx_prepare(): IPC message vpu:0x88980000 not released by firmware
[ 3698.569763] intel_vpu 0000:00:0b.0: [drm] ivpu_ipc_tx_prepare(): JSM message vpu:0x88980040 not released by firmware
[ 3698.570234] intel_vpu 0000:00:0b.0: [drm] ivpu_ipc_send_receive_internal(): IPC receive failed: type 0x110e, ret -512
[ 3698.570318] intel_vpu 0000:00:0b.0: [drm] *ERROR* ivpu_mmu_dump_event(): MMU EVTQ: 0x10 (Translation fault) SSID: 0 SID: 3, e[2] 00000000, e[3] 00000208, in addr: 0x88988000, fetch addr: 0x0

To fix the issue don't use interruptible variant of wait event to
allow firmware to finish IPC processing.

Fixes: 5d7422cfb498 ("accel/ivpu: Add IPC driver and JSM messages")
Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_ipc.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
index fa0af59e39ab..295c0d7b5039 100644
--- a/drivers/accel/ivpu/ivpu_ipc.c
+++ b/drivers/accel/ivpu/ivpu_ipc.c
@@ -209,10 +209,10 @@ int ivpu_ipc_receive(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
 	struct ivpu_ipc_rx_msg *rx_msg;
 	int wait_ret, ret = 0;
 
-	wait_ret = wait_event_interruptible_timeout(cons->rx_msg_wq,
-						    (IS_KTHREAD() && kthread_should_stop()) ||
-						    !list_empty(&cons->rx_msg_list),
-						    msecs_to_jiffies(timeout_ms));
+	wait_ret = wait_event_timeout(cons->rx_msg_wq,
+				      (IS_KTHREAD() && kthread_should_stop()) ||
+				      !list_empty(&cons->rx_msg_list),
+				      msecs_to_jiffies(timeout_ms));
 
 	if (IS_KTHREAD() && kthread_should_stop())
 		return -EINTR;
@@ -220,9 +220,6 @@ int ivpu_ipc_receive(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
 	if (wait_ret == 0)
 		return -ETIMEDOUT;
 
-	if (wait_ret < 0)
-		return -ERESTARTSYS;
-
 	spin_lock_irq(&cons->rx_msg_lock);
 	rx_msg = list_first_entry_or_null(&cons->rx_msg_list, struct ivpu_ipc_rx_msg, link);
 	if (!rx_msg) {
-- 
2.25.1

