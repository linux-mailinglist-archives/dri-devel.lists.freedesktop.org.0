Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 880256939EB
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 21:45:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402C810E468;
	Sun, 12 Feb 2023 20:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B945510E05F
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 20:45:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 42AB360DDB;
 Sun, 12 Feb 2023 20:45:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5DEFC4339B;
 Sun, 12 Feb 2023 20:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676234716;
 bh=7JqnzxitL2OfHh+nmL65mBTrvksI6gwIoJsPpUvB2Qo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U/eVnpA1Y0I2Qig3K55dXOW/YfzvRwssxTfgxk//LqVKTei13LRV1hzWpxEWt0duz
 +Y099GeSvmZM2dHXj6ICKBOme+8ix3Jy2sTt54B1qCDnwahCFtdLfrOo/od34HAdD/
 ISt/yFVOo+gWLjoliEEvDgCzGtDd/tK24naRWqeA9vh6SckZaJva7WPbrCfflgUCKE
 XwXUJDqZ6+TPskxt1pWxbCn6jcxwYQyd+g+JG7zpyzFNxYBrPeHWC7DTPG/Rsnc1IO
 ibxUaaCn+O6sL0wft3KdpuNVus1JuxS9Cw758IQX1LAo92opgmh6hBJkwMQozd8s+w
 bvo/ONIcsuKkg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/27] habanalabs: add info when FD released while device
 still in use
Date: Sun, 12 Feb 2023 22:44:35 +0200
Message-Id: <20230212204454.2938561-8-ogabbay@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230212204454.2938561-1-ogabbay@kernel.org>
References: <20230212204454.2938561-1-ogabbay@kernel.org>
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
Cc: Tomer Tayar <ttayar@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomer Tayar <ttayar@habana.ai>

When user closes the device file descriptor, it is checked whether the
device is still in use, and a message is printed if it is.
To make this message more informative, add to this print also the reason
due to which the device is considered as in use.
The possible reasons which are checked for now are active CS and
exported dma-buf.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 .../habanalabs/common/command_submission.c    | 16 ++++++
 drivers/accel/habanalabs/common/device.c      | 51 +++++++++++++++++--
 drivers/accel/habanalabs/common/habanalabs.h  |  4 +-
 drivers/accel/habanalabs/common/memory.c      |  2 +
 4 files changed, 69 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/habanalabs/common/command_submission.c b/drivers/accel/habanalabs/common/command_submission.c
index e313ff8af7cc..24f3d82ee4cb 100644
--- a/drivers/accel/habanalabs/common/command_submission.c
+++ b/drivers/accel/habanalabs/common/command_submission.c
@@ -1168,6 +1168,22 @@ static void cs_completion(struct work_struct *work)
 		hl_complete_job(hdev, job);
 }
 
+u32 hl_get_active_cs_num(struct hl_device *hdev)
+{
+	u32 active_cs_num = 0;
+	struct hl_cs *cs;
+
+	spin_lock(&hdev->cs_mirror_lock);
+
+	list_for_each_entry(cs, &hdev->cs_mirror_list, mirror_node)
+		if (!cs->completed)
+			active_cs_num++;
+
+	spin_unlock(&hdev->cs_mirror_lock);
+
+	return active_cs_num;
+}
+
 static int validate_queue_index(struct hl_device *hdev,
 				struct hl_cs_chunk *chunk,
 				enum hl_queue_type *queue_type,
diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 194c282d7e55..b8c74185eabd 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -492,6 +492,52 @@ int hl_hpriv_put(struct hl_fpriv *hpriv)
 	return kref_put(&hpriv->refcount, hpriv_release);
 }
 
+static void compose_device_in_use_info(char **buf, size_t *buf_size, const char *fmt, ...)
+{
+	struct va_format vaf;
+	va_list args;
+	int size;
+
+	va_start(args, fmt);
+	vaf.fmt = fmt;
+	vaf.va = &args;
+
+	size = snprintf(*buf, *buf_size, "%pV", &vaf);
+	if (size >= *buf_size)
+		size = *buf_size;
+
+	*buf += size;
+	*buf_size -= size;
+
+	va_end(args);
+}
+
+static void print_device_in_use_info(struct hl_device *hdev, const char *message)
+{
+	u32 active_cs_num, dmabuf_export_cnt;
+	char buf[64], *buf_ptr = buf;
+	size_t buf_size = sizeof(buf);
+	bool unknown_reason = true;
+
+	active_cs_num = hl_get_active_cs_num(hdev);
+	if (active_cs_num) {
+		unknown_reason = false;
+		compose_device_in_use_info(&buf_ptr, &buf_size, " [%u active CS]", active_cs_num);
+	}
+
+	dmabuf_export_cnt = atomic_read(&hdev->dmabuf_export_cnt);
+	if (dmabuf_export_cnt) {
+		unknown_reason = false;
+		compose_device_in_use_info(&buf_ptr, &buf_size, " [%u exported dma-buf]",
+						dmabuf_export_cnt);
+	}
+
+	if (unknown_reason)
+		compose_device_in_use_info(&buf_ptr, &buf_size, " [unknown reason]");
+
+	dev_notice(hdev->dev, "%s%s\n", message, buf);
+}
+
 /*
  * hl_device_release - release function for habanalabs device
  *
@@ -519,12 +565,11 @@ static int hl_device_release(struct inode *inode, struct file *filp)
 	hdev->compute_ctx_in_release = 1;
 
 	if (!hl_hpriv_put(hpriv)) {
-		dev_notice(hdev->dev, "User process closed FD but device still in use\n");
+		print_device_in_use_info(hdev, "User process closed FD but device still in use");
 		hl_device_reset(hdev, HL_DRV_RESET_HARD);
 	}
 
-	hdev->last_open_session_duration_jif =
-		jiffies - hdev->last_successful_open_jif;
+	hdev->last_open_session_duration_jif = jiffies - hdev->last_successful_open_jif;
 
 	return 0;
 }
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index d98e6c0feb24..afdae5775eaa 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -3200,6 +3200,7 @@ struct hl_reset_info {
  *                drams are binned-out
  * @tpc_binning: contains mask of tpc engines that is received from the f/w which indicates which
  *               tpc engines are binned-out
+ * @dmabuf_export_cnt: number of dma-buf exporting.
  * @card_type: Various ASICs have several card types. This indicates the card
  *             type of the current device.
  * @major: habanalabs kernel driver major.
@@ -3371,7 +3372,7 @@ struct hl_device {
 	u64				fw_comms_poll_interval_usec;
 	u64				dram_binning;
 	u64				tpc_binning;
-
+	atomic_t			dmabuf_export_cnt;
 	enum cpucp_card_types		card_type;
 	u32				major;
 	u32				high_pll;
@@ -3664,6 +3665,7 @@ bool cs_needs_timeout(struct hl_cs *cs);
 bool is_staged_cs_last_exists(struct hl_device *hdev, struct hl_cs *cs);
 struct hl_cs *hl_staged_cs_find_first(struct hl_device *hdev, u64 cs_seq);
 void hl_multi_cs_completion_init(struct hl_device *hdev);
+u32 hl_get_active_cs_num(struct hl_device *hdev);
 
 void goya_set_asic_funcs(struct hl_device *hdev);
 void gaudi_set_asic_funcs(struct hl_device *hdev);
diff --git a/drivers/accel/habanalabs/common/memory.c b/drivers/accel/habanalabs/common/memory.c
index 7b3809853dd5..e115d264b03b 100644
--- a/drivers/accel/habanalabs/common/memory.c
+++ b/drivers/accel/habanalabs/common/memory.c
@@ -1833,6 +1833,7 @@ static void hl_release_dmabuf(struct dma_buf *dmabuf)
 	if (hl_dmabuf->memhash_hnode)
 		memhash_node_export_put(ctx, hl_dmabuf->memhash_hnode);
 
+	atomic_dec(&ctx->hdev->dmabuf_export_cnt);
 	hl_ctx_put(ctx);
 	kfree(hl_dmabuf);
 }
@@ -1872,6 +1873,7 @@ static int export_dmabuf(struct hl_ctx *ctx,
 
 	hl_dmabuf->ctx = ctx;
 	hl_ctx_get(hl_dmabuf->ctx);
+	atomic_inc(&ctx->hdev->dmabuf_export_cnt);
 
 	*dmabuf_fd = fd;
 
-- 
2.25.1

