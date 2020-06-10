Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE9E1F505E
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 10:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F96E89A76;
	Wed, 10 Jun 2020 08:33:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B028989A76
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 08:33:43 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id y17so689702plb.8
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 01:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=viTnGVmiLyU57YRhDhN8zDuiG6dPY/rXax8ClQE3VoA=;
 b=W1K849gsI1lcFSTB6RepoxDrdXeWXaq0G9ZXRaizv5Xh+XgQ/C+aBDCr+Lxx3C7h4y
 Vo25apgtLyuhLzGSMUs+Fy1iJmYpwqcxZ4/dAMVYUWOpe1xfThgrSJzr+MMKEm0eNdAU
 gakVOHPK4Gg6cpkKhqYdj+ls4TpFbzvpKv8qzN6x8MOM+C3ojLHAEb1my8N1Wjlhltuq
 xHHla5tPWw329KPgQHTAKdZ0upvMyblU44f3ZxHoi/Q16BUHaxbNIzoE79xuvjVfG7ke
 OBJOvIvRzLuqpyAoPZXHM/ZS5OWKV8XRTZ5ftFnxGkSlegROCIe4wey93YwW98cK34OJ
 I/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=viTnGVmiLyU57YRhDhN8zDuiG6dPY/rXax8ClQE3VoA=;
 b=Gvy9tleU58n7zbtgD6vbnvCv4XIAANom64qIE/7ClErjCCn/S8RWCnnAS8U0S70bhn
 WSKmpRzvyd27Di38WCg77Orm6uer+NDPBZ6/ZglWJiUOlCHTL76tnYvr/VAP5f6I01Su
 HZ8O0OkDrSksgXMwvEw5PKiW8/xVNi+ommwW+rKzie/act3EIFFhNXILN/xwOK8Ieats
 Eb7xvrtjtL3rdN/tmo8nnutRcFM4emsHsePggKfnD9ihaZl8SR5X1+gcaDanFOnCsrWU
 k8wWsuo1A2WKRQ1ZkPa4iRQJdeH8CR5fzaqAWFP4g34sffIuCXyfYf3gjL8VxJjWhU2v
 EkgQ==
X-Gm-Message-State: AOAM530U+nU2ZjULeHwsEdnKak2rrdFT66KVCnC/balH4pwUvJlUuKmV
 8jfOnYvEOb4uRnnksVfpf6eVuQ==
X-Google-Smtp-Source: ABdhPJwfZ7TDmgfra7WP8ts+VSQ6aJltH1PLOXX3lLF1IcXFnAO/Bem91V9zrOxF2Zp3LKeY29dLIw==
X-Received: by 2002:a17:90b:190e:: with SMTP id
 mp14mr1931900pjb.198.1591778023046; 
 Wed, 10 Jun 2020 01:33:43 -0700 (PDT)
Received: from nagraj.local ([49.206.21.239])
 by smtp.gmail.com with ESMTPSA id w18sm12231562pfq.121.2020.06.10.01.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 01:33:42 -0700 (PDT)
From: Sumit Semwal <sumit.semwal@linaro.org>
To: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] dma-buf: Move dma_buf_release() from fops to dentry_ops
Date: Wed, 10 Jun 2020 14:03:33 +0530
Message-Id: <20200610083333.455-1-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: Arnd Bergmann <arnd@arndb.de>, Chenbo Feng <fengc@google.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 syzbot+3643a18836bce555bff6@syzkaller.appspotmail.com,
 Charan Teja Reddy <charante@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Charan Teja reported a 'use-after-free' in dmabuffs_dname [1], which
happens if the dma_buf_release() is called while the userspace is
accessing the dma_buf pseudo fs's dmabuffs_dname() in another process,
and dma_buf_release() releases the dmabuf object when the last reference
to the struct file goes away.

I discussed with Arnd Bergmann, and he suggested that rather than tying
the dma_buf_release() to the file_operations' release(), we can tie it to
the dentry_operations' d_release(), which will be called when the last ref
to the dentry is removed.

The path exercised by __fput() calls f_op->release() first, and then calls
dput, which eventually calls d_op->d_release().

In the 'normal' case, when no userspace access is happening via dma_buf
pseudo fs, there should be exactly one fd, file, dentry and inode, so
closing the fd will kill of everything right away.

In the presented case, the dentry's d_release() will be called only when
the dentry's last ref is released.

Therefore, lets move dma_buf_release() from fops->release() to
d_ops->d_release().

Many thanks to Arnd for his FS insights :)

[1]: https://lore.kernel.org/patchwork/patch/1238278/

Fixes: bb2bb9030425 ("dma-buf: add DMA_BUF_SET_NAME ioctls")
Reported-by: syzbot+3643a18836bce555bff6@syzkaller.appspotmail.com
Cc: <stable@vger.kernel.org> [5.3+]
Cc: Arnd Bergmann <arnd@arndb.de>
Reported-by: Charan Teja Reddy <charante@codeaurora.org>
Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
---
 drivers/dma-buf/dma-buf.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 01ce125f8e8d..92ba4b6ef3e7 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -54,8 +54,11 @@ static char *dmabuffs_dname(struct dentry *dentry, char *buffer, int buflen)
 			     dentry->d_name.name, ret > 0 ? name : "");
 }
 
+static void dma_buf_release(struct dentry *dentry);
+
 static const struct dentry_operations dma_buf_dentry_ops = {
 	.d_dname = dmabuffs_dname,
+	.d_release = dma_buf_release,
 };
 
 static struct vfsmount *dma_buf_mnt;
@@ -77,14 +80,14 @@ static struct file_system_type dma_buf_fs_type = {
 	.kill_sb = kill_anon_super,
 };
 
-static int dma_buf_release(struct inode *inode, struct file *file)
+static void dma_buf_release(struct dentry *dentry)
 {
 	struct dma_buf *dmabuf;
 
-	if (!is_dma_buf_file(file))
-		return -EINVAL;
+	if (dentry->d_op != &dma_buf_dentry_ops)
+		return;
 
-	dmabuf = file->private_data;
+	dmabuf = dentry->d_fsdata;
 
 	BUG_ON(dmabuf->vmapping_counter);
 
@@ -110,7 +113,6 @@ static int dma_buf_release(struct inode *inode, struct file *file)
 	module_put(dmabuf->owner);
 	kfree(dmabuf->name);
 	kfree(dmabuf);
-	return 0;
 }
 
 static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
@@ -412,7 +414,6 @@ static void dma_buf_show_fdinfo(struct seq_file *m, struct file *file)
 }
 
 static const struct file_operations dma_buf_fops = {
-	.release	= dma_buf_release,
 	.mmap		= dma_buf_mmap_internal,
 	.llseek		= dma_buf_llseek,
 	.poll		= dma_buf_poll,
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
