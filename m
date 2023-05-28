Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A717138D3
	for <lists+dri-devel@lfdr.de>; Sun, 28 May 2023 11:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B6210E03F;
	Sun, 28 May 2023 09:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033D610E03C
 for <dri-devel@lists.freedesktop.org>; Sun, 28 May 2023 09:04:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6A19260AB8;
 Sun, 28 May 2023 09:04:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB34DC433EF;
 Sun, 28 May 2023 09:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685264676;
 bh=ow9rTnfxqKKN87DuICZJGCBzHN35cgoPUyCDHIQk3j8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uTa4peFhA9UpcqjFJb1d1vrLPkNwqebCj/MD1ysVb+6Cwk9JJpp8BX0Z8gfE3eE6A
 YkExmqURBGyN2LMD2Tr0yXBEuGP1pF5kXIT8t6BfhjpMqGzRU9+vVNtE+pDwQL9N0X
 inlEJE6BEZedID6aH1y/LXpSDpvKgcQQIkWlQHDC0iwnS4xvy3G9NxyW0/cQ6EiWgo
 eJM/nVEx6R03nvNYfz0KIOo8q2tTyYhqycCChAa/F+7CgHHGCMn8Q8wG1ke3nK4iBQ
 zfgtF1+PLSw8QLbj19bliCemVOqU5nT1U06sV+sjQxEfzXtQ909H6vTCdY8lyHqm0o
 qT5akcymB0Blg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] accel/habanalabs: refactor error info reset
Date: Sun, 28 May 2023 12:04:28 +0300
Message-Id: <20230528090428.1948778-3-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230528090428.1948778-1-ogabbay@kernel.org>
References: <20230528090428.1948778-1-ogabbay@kernel.org>
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
Cc: Dani Liberman <dliberman@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dani Liberman <dliberman@habana.ai>

Moved error info reset code to single function for future use from
other places in the driver.

Signed-off-by: Dani Liberman <dliberman@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c         | 8 ++++++++
 drivers/accel/habanalabs/common/habanalabs.h     | 1 +
 drivers/accel/habanalabs/common/habanalabs_drv.c | 5 +----
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index ea02f2cfdf81..b97339d1f7c6 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -2689,3 +2689,11 @@ void hl_handle_fw_err(struct hl_device *hdev, struct hl_info_fw_err_info *info)
 	if (info->event_mask)
 		*info->event_mask |= HL_NOTIFIER_EVENT_CRITICL_FW_ERR;
 }
+
+void hl_enable_err_info_capture(struct hl_error_info *captured_err_info)
+{
+	vfree(captured_err_info->page_fault_info.user_mappings);
+	memset(captured_err_info, 0, sizeof(struct hl_error_info));
+	atomic_set(&captured_err_info->cs_timeout.write_enable, 1);
+	captured_err_info->undef_opcode.write_enable = true;
+}
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index c5aa33eaa826..d92ba2e30e31 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -3944,6 +3944,7 @@ void hl_handle_page_fault(struct hl_device *hdev, u64 addr, u16 eng_id, bool is_
 				u64 *event_mask);
 void hl_handle_critical_hw_err(struct hl_device *hdev, u16 event_id, u64 *event_mask);
 void hl_handle_fw_err(struct hl_device *hdev, struct hl_info_fw_err_info *info);
+void hl_enable_err_info_capture(struct hl_error_info *captured_err_info);
 
 #ifdef CONFIG_DEBUG_FS
 
diff --git a/drivers/accel/habanalabs/common/habanalabs_drv.c b/drivers/accel/habanalabs/common/habanalabs_drv.c
index 446f444a1c7e..7263e84c1a4d 100644
--- a/drivers/accel/habanalabs/common/habanalabs_drv.c
+++ b/drivers/accel/habanalabs/common/habanalabs_drv.c
@@ -219,10 +219,7 @@ int hl_device_open(struct inode *inode, struct file *filp)
 
 	hl_debugfs_add_file(hpriv);
 
-	vfree(hdev->captured_err_info.page_fault_info.user_mappings);
-	memset(&hdev->captured_err_info, 0, sizeof(hdev->captured_err_info));
-	atomic_set(&hdev->captured_err_info.cs_timeout.write_enable, 1);
-	hdev->captured_err_info.undef_opcode.write_enable = true;
+	hl_enable_err_info_capture(&hdev->captured_err_info);
 
 	hdev->open_counter++;
 	hdev->last_successful_open_jif = jiffies;
-- 
2.40.1

