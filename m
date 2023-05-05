Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E57C6F7B52
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 05:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A525710E1C6;
	Fri,  5 May 2023 03:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2695 seconds by postgrey-1.36 at gabe;
 Fri, 05 May 2023 03:03:54 UTC
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE8210E1C6
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 03:03:54 +0000 (UTC)
Received: from mxct.zte.com.cn (unknown [192.168.251.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4QCFrS5Xj1z8RTWk
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 11:03:52 +0800 (CST)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4QCFrN1bVGz4y3Zj;
 Fri,  5 May 2023 11:03:48 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
 by mse-fl2.zte.com.cn with SMTP id 34533ca6093308;
 Fri, 5 May 2023 11:03:38 +0800 (+08)
 (envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp02[null]) by mapi (Zmail) with MAPI id mid31;
 Fri, 5 May 2023 11:03:39 +0800 (CST)
Date: Fri, 5 May 2023 11:03:39 +0800 (CST)
X-Zmail-TransId: 2afa6454720b650-79091
X-Mailer: Zmail v1.0
Message-ID: <202305051103396748797@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <sumit.semwal@linaro.org>
Subject: =?UTF-8?B?W1BBVENIXSBkbWEtYnVmL3N5bmNfZmlsZTogVXNlIGZkZ2V0KCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 34533ca6093308
X-Fangmail-Gw-Spam-Type: 0
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 64547218.001/4QCFrS5Xj1z8RTWk
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
Cc: gustavo@padovan.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 christian.koenig@amd.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ye Xingchen <ye.xingchen@zte.com.cn>

convert the fget() use to fdget().

Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
---
 drivers/dma-buf/sync_file.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
index af57799c86ce..222b13b1bdb8 100644
--- a/drivers/dma-buf/sync_file.c
+++ b/drivers/dma-buf/sync_file.c
@@ -78,18 +78,18 @@ EXPORT_SYMBOL(sync_file_create);

 static struct sync_file *sync_file_fdget(int fd)
 {
-	struct file *file = fget(fd);
+	struct struct fd f = fdget(fd);

-	if (!file)
+	if (!f.file)
 		return NULL;

-	if (file->f_op != &sync_file_fops)
+	if (f.file->f_op != &sync_file_fops)
 		goto err;

-	return file->private_data;
+	return f.file->private_data;

 err:
-	fput(file);
+	fdput(f);
 	return NULL;
 }

-- 
2.25.1
