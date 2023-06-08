Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F470728183
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 15:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3439610E5BE;
	Thu,  8 Jun 2023 13:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3772C10E5BE
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 13:39:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A928264DA2;
 Thu,  8 Jun 2023 13:38:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95782C4339C;
 Thu,  8 Jun 2023 13:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686231539;
 bh=m20rZvEi8AuqMG/dcDfgEVMYA5IkHyR0lJGdvBJvcGc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UUV3+wrggVBmrTesOw0SLSijlAjdKnJ/HbCPcAc/NYbpZAl2r4Tr5j69lE1BnwMWB
 rwOhU6UMPpwMdLIeWCf3K18U/NyqUDeMrQs4Z+jckABItDJMjv8d5oVJIRULBUZZ1/
 lt98H/lUhRT3Zhce6R6+CWXzJzEKLHNV0HhskshYzxC/X9aWFoPUuAVc0weT3Pr3qk
 Q9xXRdSunXgWNoydTcysFG1aoaUiyqs474J59kLCsXr7XGM/6jBm3IoYiSMgbaBpvt
 s4SmpuqSAJNrGukrxlVgjo+ScgXqpg2PvCT8fB3v9wI87PiDbVgpmtNlNjvvlJJL+w
 nzwRL0gHFDCIw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/12] accel/habanalabs: print task name and request code upon
 ioctl failure
Date: Thu,  8 Jun 2023 16:38:41 +0300
Message-Id: <20230608133849.2739411-4-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230608133849.2739411-1-ogabbay@kernel.org>
References: <20230608133849.2739411-1-ogabbay@kernel.org>
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

When an ioctl fails, it is useful to know what is the task command name
and the full ioctl request code, in addition to the task pid and the
ioctl number.
Add the additional information to the relevant debug error prints.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 .../habanalabs/common/habanalabs_ioctl.c      | 24 +++++++++++++------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/accel/habanalabs/common/habanalabs_ioctl.c b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
index 6a45a92344e9..549b2518fae0 100644
--- a/drivers/accel/habanalabs/common/habanalabs_ioctl.c
+++ b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
@@ -1194,9 +1194,13 @@ static long _hl_ioctl(struct file *filep, unsigned int cmd, unsigned long arg,
 		retcode = -EFAULT;
 
 out_err:
-	if (retcode)
-		dev_dbg_ratelimited(dev, "error in ioctl: pid=%d, cmd=0x%02x, nr=0x%02x\n",
-			  task_pid_nr(current), cmd, nr);
+	if (retcode) {
+		char task_comm[TASK_COMM_LEN];
+
+		dev_dbg_ratelimited(dev,
+				"error in ioctl: pid=%d, comm=\"%s\", cmd=%#010x, nr=%#04x\n",
+				task_pid_nr(current), get_task_comm(task_comm, current), cmd, nr);
+	}
 
 	if (kdata != stack_kdata)
 		kfree(kdata);
@@ -1219,8 +1223,11 @@ long hl_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 	if ((nr >= HL_COMMAND_START) && (nr < HL_COMMAND_END)) {
 		ioctl = &hl_ioctls[nr];
 	} else {
-		dev_dbg_ratelimited(hdev->dev, "invalid ioctl: pid=%d, nr=0x%02x\n",
-			task_pid_nr(current), nr);
+		char task_comm[TASK_COMM_LEN];
+
+		dev_dbg_ratelimited(hdev->dev,
+				"invalid ioctl: pid=%d, comm=\"%s\", cmd=%#010x, nr=%#04x\n",
+				task_pid_nr(current), get_task_comm(task_comm, current), cmd, nr);
 		return -ENOTTY;
 	}
 
@@ -1242,8 +1249,11 @@ long hl_ioctl_control(struct file *filep, unsigned int cmd, unsigned long arg)
 	if (nr == _IOC_NR(HL_IOCTL_INFO)) {
 		ioctl = &hl_ioctls_control[nr];
 	} else {
-		dev_dbg_ratelimited(hdev->dev_ctrl, "invalid ioctl: pid=%d, nr=0x%02x\n",
-			task_pid_nr(current), nr);
+		char task_comm[TASK_COMM_LEN];
+
+		dev_dbg_ratelimited(hdev->dev_ctrl,
+				"invalid ioctl: pid=%d, comm=\"%s\", cmd=%#010x, nr=%#04x\n",
+				task_pid_nr(current), get_task_comm(task_comm, current), cmd, nr);
 		return -ENOTTY;
 	}
 
-- 
2.40.1

