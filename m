Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD2426DD7E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 16:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E3806EC1B;
	Thu, 17 Sep 2020 14:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC706EA68
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 12:42:18 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id DF570402D7A926F5B08E;
 Thu, 17 Sep 2020 20:42:16 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Thu, 17 Sep 2020 20:42:09 +0800
From: Qinglang Miao <miaoqinglang@huawei.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH -next v2] gpu: host1x: debug: Convert to DEFINE_SHOW_ATTRIBUTE
Date: Thu, 17 Sep 2020 20:42:46 +0800
Message-ID: <20200917124246.102312-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 17 Sep 2020 14:07:28 +0000
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
Cc: linux-tegra@vger.kernel.org, Qinglang Miao <miaoqinglang@huawei.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
v2: based on linux-next(20200917), and can be applied to
    mainline cleanly now.

 drivers/gpu/host1x/debug.c | 28 ++++------------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/host1x/debug.c b/drivers/gpu/host1x/debug.c
index 1b4997bda..1aa46d430 100644
--- a/drivers/gpu/host1x/debug.c
+++ b/drivers/gpu/host1x/debug.c
@@ -114,7 +114,7 @@ static void show_all(struct host1x *m, struct output *o, bool show_fifo)
 	}
 }
 
-static int host1x_debug_show_all(struct seq_file *s, void *unused)
+static int host1x_debug_all_show(struct seq_file *s, void *unused)
 {
 	struct output o = {
 		.fn = write_to_seqfile,
@@ -126,6 +126,8 @@ static int host1x_debug_show_all(struct seq_file *s, void *unused)
 	return 0;
 }
 
+DEFINE_SHOW_ATTRIBUTE(host1x_debug_all);
+
 static int host1x_debug_show(struct seq_file *s, void *unused)
 {
 	struct output o = {
@@ -138,29 +140,7 @@ static int host1x_debug_show(struct seq_file *s, void *unused)
 	return 0;
 }
 
-static int host1x_debug_open_all(struct inode *inode, struct file *file)
-{
-	return single_open(file, host1x_debug_show_all, inode->i_private);
-}
-
-static const struct file_operations host1x_debug_all_fops = {
-	.open = host1x_debug_open_all,
-	.read = seq_read,
-	.llseek = seq_lseek,
-	.release = single_release,
-};
-
-static int host1x_debug_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, host1x_debug_show, inode->i_private);
-}
-
-static const struct file_operations host1x_debug_fops = {
-	.open = host1x_debug_open,
-	.read = seq_read,
-	.llseek = seq_lseek,
-	.release = single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(host1x_debug);
 
 static void host1x_debugfs_init(struct host1x *host1x)
 {
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
