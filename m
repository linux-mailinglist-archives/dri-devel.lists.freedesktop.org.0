Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C521223599
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 09:22:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C39BA6E44E;
	Fri, 17 Jul 2020 07:22:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F996E0B9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 08:59:35 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 15C3DD6DA6191D454990;
 Thu, 16 Jul 2020 16:59:31 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Thu, 16 Jul 2020 16:59:27 +0800
From: Qinglang Miao <miaoqinglang@huawei.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding
 <thierry.reding@gmail.com>
Subject: [PATCH -next] gpu: host1x: Convert to DEFINE_SHOW_ATTRIBUTE
Date: Thu, 16 Jul 2020 17:03:23 +0800
Message-ID: <20200716090323.13274-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 17 Jul 2020 07:22:00 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yongqiang Liu <liuyongqiang13@huawei.com>

Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.

Signed-off-by: Yongqiang Liu <liuyongqiang13@huawei.com>
---
 drivers/gpu/host1x/debug.c | 28 ++++------------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/host1x/debug.c b/drivers/gpu/host1x/debug.c
index 545fc0afb..1688e98c4 100644
--- a/drivers/gpu/host1x/debug.c
+++ b/drivers/gpu/host1x/debug.c
@@ -110,7 +110,7 @@ static void show_all(struct host1x *m, struct output *o, bool show_fifo)
 	}
 }
 
-static int host1x_debug_show_all(struct seq_file *s, void *unused)
+static int host1x_debug_all_show(struct seq_file *s, void *unused)
 {
 	struct output o = {
 		.fn = write_to_seqfile,
@@ -122,6 +122,8 @@ static int host1x_debug_show_all(struct seq_file *s, void *unused)
 	return 0;
 }
 
+DEFINE_SHOW_ATTRIBUTE(host1x_debug_all);
+
 static int host1x_debug_show(struct seq_file *s, void *unused)
 {
 	struct output o = {
@@ -134,29 +136,7 @@ static int host1x_debug_show(struct seq_file *s, void *unused)
 	return 0;
 }
 
-static int host1x_debug_open_all(struct inode *inode, struct file *file)
-{
-	return single_open(file, host1x_debug_show_all, inode->i_private);
-}
-
-static const struct file_operations host1x_debug_all_fops = {
-	.open = host1x_debug_open_all,
-	.read_iter = seq_read_iter,
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
-	.read_iter = seq_read_iter,
-	.llseek = seq_lseek,
-	.release = single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(host1x_debug);
 
 static void host1x_debugfs_init(struct host1x *host1x)
 {
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
