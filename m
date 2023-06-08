Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DA672818C
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 15:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0AEA10E5C8;
	Thu,  8 Jun 2023 13:39:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2890310E5C5
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 13:39:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9CF5564D9C;
 Thu,  8 Jun 2023 13:39:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2530FC433D2;
 Thu,  8 Jun 2023 13:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686231551;
 bh=VbBq693Ipzqt8mL4Z59q8eNMFa08uSDB2Eggc0CMs5M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ggXTGUjag7aYcUELYV3Zu6qN9B3NPGZDdHb0LxUtfoMN6/RwxfVuaRtm6nKv8ppco
 bp9IoQX6Tz+Om8rDEDHvL7fQjbHVB5WBxBUnPVlR95ubUHmOY9W1EsvYsRIA1xMM7N
 eJSXgKpoNwJ2m2XlxT0KNY25Kjs66EVtUU8wl9ngC9wO40Xulf5qzGoiXyzWGlJtFt
 t9RDC4KemiES0Gkf75BZilBR3KInVX+CJWIomUSlqdGzv1MMOJBQdJlpZtdBpXFoZE
 Fp1yz5vZGk9CsVtBOqxo2Iudv3NX+HIBA3KnCN9azXtSfLk54o0HL31oMLRvOFK/wY
 FZjH/CnhpYcLQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 12/12] accel/habanalabs: rename fd_list to hpriv_list
Date: Thu,  8 Jun 2023 16:38:49 +0300
Message-Id: <20230608133849.2739411-12-ogabbay@kernel.org>
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
Cc: Koby Elbaz <kelbaz@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Koby Elbaz <kelbaz@habana.ai>

Every time an FD is returned to the user, the driver adds
a corresponding private structure to the list.
Yet, it's still a list of private structures rather than of FDs.
Remove, as well, an unnecessary comment.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c | 43 +++++++++++-------------
 1 file changed, 19 insertions(+), 24 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index c61a58a2e622..0d02f1f7b994 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -1304,18 +1304,18 @@ int hl_device_resume(struct hl_device *hdev)
 static int device_kill_open_processes(struct hl_device *hdev, u32 timeout, bool control_dev)
 {
 	struct task_struct *task = NULL;
-	struct list_head *fd_list;
-	struct hl_fpriv	*hpriv;
-	struct mutex *fd_lock;
+	struct list_head *hpriv_list;
+	struct hl_fpriv *hpriv;
+	struct mutex *hpriv_lock;
 	u32 pending_cnt;
 
-	fd_lock = control_dev ? &hdev->fpriv_ctrl_list_lock : &hdev->fpriv_list_lock;
-	fd_list = control_dev ? &hdev->fpriv_ctrl_list : &hdev->fpriv_list;
+	hpriv_lock = control_dev ? &hdev->fpriv_ctrl_list_lock : &hdev->fpriv_list_lock;
+	hpriv_list = control_dev ? &hdev->fpriv_ctrl_list : &hdev->fpriv_list;
 
 	/* Giving time for user to close FD, and for processes that are inside
 	 * hl_device_open to finish
 	 */
-	if (!list_empty(fd_list))
+	if (!list_empty(hpriv_list))
 		ssleep(1);
 
 	if (timeout) {
@@ -1331,12 +1331,12 @@ static int device_kill_open_processes(struct hl_device *hdev, u32 timeout, bool
 		}
 	}
 
-	mutex_lock(fd_lock);
+	mutex_lock(hpriv_lock);
 
 	/* This section must be protected because we are dereferencing
 	 * pointers that are freed if the process exits
 	 */
-	list_for_each_entry(hpriv, fd_list, dev_node) {
+	list_for_each_entry(hpriv, hpriv_list, dev_node) {
 		task = get_pid_task(hpriv->taskpid, PIDTYPE_PID);
 		if (task) {
 			dev_info(hdev->dev, "Killing user process pid=%d\n",
@@ -1346,18 +1346,13 @@ static int device_kill_open_processes(struct hl_device *hdev, u32 timeout, bool
 
 			put_task_struct(task);
 		} else {
-			/*
-			 * If we got here, it means that process was killed from outside the driver
-			 * right after it started looping on fd_list and before get_pid_task, thus
-			 * we don't need to kill it.
-			 */
 			dev_dbg(hdev->dev,
-				"Can't get task struct for user process %d, assuming process was killed from outside the driver\n",
+				"Can't get task struct for user process %d, process was killed from outside the driver\n",
 				pid_nr(hpriv->taskpid));
 		}
 	}
 
-	mutex_unlock(fd_lock);
+	mutex_unlock(hpriv_lock);
 
 	/*
 	 * We killed the open users, but that doesn't mean they are closed.
@@ -1369,7 +1364,7 @@ static int device_kill_open_processes(struct hl_device *hdev, u32 timeout, bool
 	 */
 
 wait_for_processes:
-	while ((!list_empty(fd_list)) && (pending_cnt)) {
+	while ((!list_empty(hpriv_list)) && (pending_cnt)) {
 		dev_dbg(hdev->dev,
 			"Waiting for all unmap operations to finish before hard reset\n");
 
@@ -1379,7 +1374,7 @@ static int device_kill_open_processes(struct hl_device *hdev, u32 timeout, bool
 	}
 
 	/* All processes exited successfully */
-	if (list_empty(fd_list))
+	if (list_empty(hpriv_list))
 		return 0;
 
 	/* Give up waiting for processes to exit */
@@ -1393,17 +1388,17 @@ static int device_kill_open_processes(struct hl_device *hdev, u32 timeout, bool
 
 static void device_disable_open_processes(struct hl_device *hdev, bool control_dev)
 {
-	struct list_head *fd_list;
+	struct list_head *hpriv_list;
 	struct hl_fpriv *hpriv;
-	struct mutex *fd_lock;
+	struct mutex *hpriv_lock;
 
-	fd_lock = control_dev ? &hdev->fpriv_ctrl_list_lock : &hdev->fpriv_list_lock;
-	fd_list = control_dev ? &hdev->fpriv_ctrl_list : &hdev->fpriv_list;
+	hpriv_lock = control_dev ? &hdev->fpriv_ctrl_list_lock : &hdev->fpriv_list_lock;
+	hpriv_list = control_dev ? &hdev->fpriv_ctrl_list : &hdev->fpriv_list;
 
-	mutex_lock(fd_lock);
-	list_for_each_entry(hpriv, fd_list, dev_node)
+	mutex_lock(hpriv_lock);
+	list_for_each_entry(hpriv, hpriv_list, dev_node)
 		hpriv->hdev = NULL;
-	mutex_unlock(fd_lock);
+	mutex_unlock(hpriv_lock);
 }
 
 static void send_disable_pci_access(struct hl_device *hdev, u32 flags)
-- 
2.40.1

