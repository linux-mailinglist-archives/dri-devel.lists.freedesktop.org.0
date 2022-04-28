Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E61B9512D19
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 09:37:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C20710E696;
	Thu, 28 Apr 2022 07:36:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 936 seconds by postgrey-1.36 at gabe;
 Thu, 28 Apr 2022 06:36:27 UTC
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C44410E419
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 06:36:27 +0000 (UTC)
Received: from dggpeml500026.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Kplq56cyczhYmg;
 Thu, 28 Apr 2022 14:20:33 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 dggpeml500026.china.huawei.com (7.185.36.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 28 Apr 2022 14:20:47 +0800
From: Yuanzheng Song <songyuanzheng@huawei.com>
To: <sumit.semwal@linaro.org>, <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH] dma-buf: add the name field to the table header
Date: Thu, 28 Apr 2022 06:39:24 +0000
Message-ID: <20220428063924.3570409-1-songyuanzheng@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500026.china.huawei.com (7.185.36.106)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 28 Apr 2022 07:36:56 +0000
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
Cc: Yuanzheng Song <songyuanzheng@huawei.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

'cat /sys/kernel/debug/dma_buf/bufinfo' will print the Dma-buf
Objects' information when the CONFIG_DEBUG_FS=y.
However, the printed table header information does not contain
the name field. So we need to add the name field to the table
header and use the '<none>' to replace the empty buf_obj->name.

Signed-off-by: Yuanzheng Song <songyuanzheng@huawei.com>
---
 drivers/dma-buf/dma-buf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 79795857be3e..a2f9a1815e38 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1351,7 +1351,7 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 		return ret;
 
 	seq_puts(s, "\nDma-buf Objects:\n");
-	seq_printf(s, "%-8s\t%-8s\t%-8s\t%-8s\texp_name\t%-8s\n",
+	seq_printf(s, "%-8s\t%-8s\t%-8s\t%-8s\texp_name\t%-8s\tname\n",
 		   "size", "flags", "mode", "count", "ino");
 
 	list_for_each_entry(buf_obj, &db_list.head, list_node) {
@@ -1368,7 +1368,7 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 				file_count(buf_obj->file),
 				buf_obj->exp_name,
 				file_inode(buf_obj->file)->i_ino,
-				buf_obj->name ?: "");
+				buf_obj->name ?: "<none>");
 		spin_unlock(&buf_obj->name_lock);
 
 		dma_resv_describe(buf_obj->resv, s);
-- 
2.25.1

