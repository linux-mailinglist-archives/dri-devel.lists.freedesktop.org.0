Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BC552DF67
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 23:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF5910E1CC;
	Thu, 19 May 2022 21:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8228810E1CC
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 21:40:33 +0000 (UTC)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-2f4e17a5809so56467757b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 14:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:cc;
 bh=zuGBAgFMIoOSwoUwGfoJUnP1fJqCzNy1j+Zti0iP+ZM=;
 b=IHIAjtp3yuP+65qTq0KG8dpflrO1+4q1eQKEYue6Hu5/7/JvfpRpxvQUs5El0hevSE
 1tuWFQgcd35rB//lFiwc+bfUwqddQK3/kyWp//JoHUCft6UppiI+gEtisDfWD2K1tCxU
 C/nVZimKPg7Ayt6s6x1QQnk1gQj0TnjPeC17W7FRGQrsa0gEdxwUBn6HaT7bcseJjgUs
 0Em1Di29bEHCUQ38GVgzZ+ew189o+OpDCp8CgGHwYiHsXFo7t2OFHNUr1IwIV4Wm/4wO
 Jez9ria/XhLsKZkm+bCWqOfdzNu7twDuBHPKptuhFf8MIpLxMY4K9O35jsZ2yiyWrgwo
 ah5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:cc;
 bh=zuGBAgFMIoOSwoUwGfoJUnP1fJqCzNy1j+Zti0iP+ZM=;
 b=7pLubWWuDK2HRQUXh/LqKD7puzc+Q4gw8Y8CaZk6myU10R6cS3OFjSUg/3cEtBG3Ii
 bcVjsphEAejrhfXpbE3ekx6/kWc8AtTH2VILoAL/Cuodrb4W8c1kWAIlwUObzNcHQ95B
 x9x/JaqbN3Pd1G0NLCoDT0fc6l88yQJoGBmpKTtsTbC4dAN9j9v3Lh7553Fq+I+sqz98
 DFTb9T5NV27tnLoJBcYkhOmV0ua6CJTVlJ1qUZ7lN0AeYEs/atopEE95fnTYGLc1XFT7
 UNiTIAj/OXbAudSkzNyQWTEcIDLPAXqiafp3ZKSekqzDlNXc2lwE4tt6CFx2F/ZXDp5z
 CBPA==
X-Gm-Message-State: AOAM532vYD1qYQoX2GgRDZ+Yvo/MtaPVY2AejndvaQpiwQ/6N4n29BP3
 5FrgIjs9y6rIIHo4nDOWQrAMYZeNcETlZ3kyyg==
X-Google-Smtp-Source: ABdhPJx4D0SEHOAjIttsmn42abQzuazkEeLC6F+ySQrARTkf0sslpCpaOFkHDaCUqhJIC32vG+HNE2dUVJKb6mGqUg==
X-Received: from kaleshsingh.mtv.corp.google.com
 ([2620:15c:211:200:f1b:a195:3f95:6a6f])
 (user=kaleshsingh job=sendgmr) by 2002:a05:6902:120e:b0:634:6f29:6b84 with
 SMTP id s14-20020a056902120e00b006346f296b84mr6656617ybu.604.1652996432268;
 Thu, 19 May 2022 14:40:32 -0700 (PDT)
Date: Thu, 19 May 2022 14:40:15 -0700
Message-Id: <20220519214021.3572840-1-kaleshsingh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
Subject: [RFC PATCH] procfs: Add file path and size to /proc/<pid>/fdinfo
From: Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Christoph Anton Mitterer <mail@christoph.anton.mitterer.name>,
 kernel-team@android.com, Randy Dunlap <rdunlap@infradead.org>,
 ilkos@google.com, linux-kernel@vger.kernel.org,
 Colin Cross <ccross@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Kalesh Singh <kaleshsingh@google.com>, linux-fsdevel@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, surenb@google.com, tjmercier@google.com,
 Mike Rapoport <rppt@kernel.org>, Kees Cook <keescook@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Processes can pin shared memory by keeping a handle to it through a
file descriptor; for instance dmabufs, memfd, and ashsmem (in Android).

In the case of a memory leak, to identify the process pinning the
memory, userspace needs to:
  - Iterate the /proc/<pid>/fd/* for each process
  - Do a readlink on each entry to identify the type of memory from
    the file path.
  - stat() each entry to get the size of the memory.

The file permissions on /proc/<pid>/fd/* only allows for the owner
or root to perform the operations above; and so is not suitable for
capturing the system-wide state in a production environment.

This issue was addressed for dmabufs by making /proc/*/fdinfo/*
accessible to a process with PTRACE_MODE_READ_FSCREDS credentials[1]
To allow the same kind of tracking for other types of shared memory,
add the following fields to /proc/<pid>/fdinfo/<fd>:

path - This allows identifying the type of memory based on common
       prefixes: e.g. "/memfd...", "/dmabuf...", "/dev/ashmem..."

       This was not an issued when dmabuf tracking was introduced
       because the exp_name field of dmabuf fdinfo could be used
       to distinguish dmabuf fds from other types.

size - To track the amount of memory that is being pinned.

       dmabufs expose size as an additional field in fdinfo. Remove
       this and make it a common field for all fds.

Access to /proc/<pid>/fdinfo is governed by PTRACE_MODE_READ_FSCREDS
-- the same as for /proc/<pid>/maps which also exposes the path and
size for mapped memory regions.

This allows for a system process with PTRACE_MODE_READ_FSCREDS to
account the pinned per-process memory via fdinfo.

[1] https://lore.kernel.org/lkml/20210308170651.919148-1-kaleshsingh@google.com/

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 Documentation/filesystems/proc.rst | 22 ++++++++++++++++++++--
 drivers/dma-buf/dma-buf.c          |  1 -
 fs/proc/fd.c                       |  9 +++++++--
 3 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index 061744c436d9..ad66d78aca51 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -1922,13 +1922,16 @@ if precise results are needed.
 3.8	/proc/<pid>/fdinfo/<fd> - Information about opened file
 ---------------------------------------------------------------
 This file provides information associated with an opened file. The regular
-files have at least four fields -- 'pos', 'flags', 'mnt_id' and 'ino'.
+files have at least six fields -- 'pos', 'flags', 'mnt_id', 'ino', 'size',
+and 'path'.
+
 The 'pos' represents the current offset of the opened file in decimal
 form [see lseek(2) for details], 'flags' denotes the octal O_xxx mask the
 file has been created with [see open(2) for details] and 'mnt_id' represents
 mount ID of the file system containing the opened file [see 3.5
 /proc/<pid>/mountinfo for details]. 'ino' represents the inode number of
-the file.
+the file, 'size' represents the size of the file in bytes, and 'path'
+represents the file path.
 
 A typical output is::
 
@@ -1936,6 +1939,8 @@ A typical output is::
 	flags:	0100002
 	mnt_id:	19
 	ino:	63107
+        size:   0
+        path:   /dev/null
 
 All locks associated with a file descriptor are shown in its fdinfo too::
 
@@ -1953,6 +1958,8 @@ Eventfd files
 	flags:	04002
 	mnt_id:	9
 	ino:	63107
+        size:   0
+        path:   anon_inode:[eventfd]
 	eventfd-count:	5a
 
 where 'eventfd-count' is hex value of a counter.
@@ -1966,6 +1973,8 @@ Signalfd files
 	flags:	04002
 	mnt_id:	9
 	ino:	63107
+        size:   0
+        path:   anon_inode:[signalfd]
 	sigmask:	0000000000000200
 
 where 'sigmask' is hex value of the signal mask associated
@@ -1980,6 +1989,8 @@ Epoll files
 	flags:	02
 	mnt_id:	9
 	ino:	63107
+        size:   0
+        path:   anon_inode:[eventpoll]
 	tfd:        5 events:       1d data: ffffffffffffffff pos:0 ino:61af sdev:7
 
 where 'tfd' is a target file descriptor number in decimal form,
@@ -1998,6 +2009,8 @@ For inotify files the format is the following::
 	flags:	02000000
 	mnt_id:	9
 	ino:	63107
+        size:   0
+        path:   anon_inode:inotify
 	inotify wd:3 ino:9e7e sdev:800013 mask:800afce ignored_mask:0 fhandle-bytes:8 fhandle-type:1 f_handle:7e9e0000640d1b6d
 
 where 'wd' is a watch descriptor in decimal form, i.e. a target file
@@ -2021,6 +2034,8 @@ For fanotify files the format is::
 	flags:	02
 	mnt_id:	9
 	ino:	63107
+        size:   0
+        path:   anon_inode:[fanotify]
 	fanotify flags:10 event-flags:0
 	fanotify mnt_id:12 mflags:40 mask:38 ignored_mask:40000003
 	fanotify ino:4f969 sdev:800013 mflags:0 mask:3b ignored_mask:40000000 fhandle-bytes:8 fhandle-type:1 f_handle:69f90400c275b5b4
@@ -2046,6 +2061,8 @@ Timerfd files
 	flags:	02
 	mnt_id:	9
 	ino:	63107
+        size:   0
+        path:   anon_inode:[timerfd]
 	clockid: 0
 	ticks: 0
 	settime flags: 01
@@ -2070,6 +2087,7 @@ DMA Buffer files
 	mnt_id:	9
 	ino:	63107
 	size:   32768
+        path:   /dmabuf:
 	count:  2
 	exp_name:  system-heap
 
diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index b1e25ae98302..d61183ff3c30 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -377,7 +377,6 @@ static void dma_buf_show_fdinfo(struct seq_file *m, struct file *file)
 {
 	struct dma_buf *dmabuf = file->private_data;
 
-	seq_printf(m, "size:\t%zu\n", dmabuf->size);
 	/* Don't count the temporary reference taken inside procfs seq_show */
 	seq_printf(m, "count:\t%ld\n", file_count(dmabuf->file) - 1);
 	seq_printf(m, "exp_name:\t%s\n", dmabuf->exp_name);
diff --git a/fs/proc/fd.c b/fs/proc/fd.c
index 913bef0d2a36..a8a968bc58f0 100644
--- a/fs/proc/fd.c
+++ b/fs/proc/fd.c
@@ -54,10 +54,15 @@ static int seq_show(struct seq_file *m, void *v)
 	if (ret)
 		return ret;
 
-	seq_printf(m, "pos:\t%lli\nflags:\t0%o\nmnt_id:\t%i\nino:\t%lu\n",
+	seq_printf(m, "pos:\t%lli\nflags:\t0%o\nmnt_id:\t%i\nino:\t%lu\nsize:\t%zu\n",
 		   (long long)file->f_pos, f_flags,
 		   real_mount(file->f_path.mnt)->mnt_id,
-		   file_inode(file)->i_ino);
+		   file_inode(file)->i_ino,
+		   file_inode(file)->i_size);
+
+	seq_puts(m, "path:\t");
+	seq_file_path(m, file, "\n");
+	seq_putc(m, '\n');
 
 	/* show_fd_locks() never deferences files so a stale value is safe */
 	show_fd_locks(m, file, files);

base-commit: b015dcd62b86d298829990f8261d5d154b8d7af5
-- 
2.36.1.124.g0e6072fb45-goog

