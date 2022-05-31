Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A447F5398B7
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 23:25:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8975810E197;
	Tue, 31 May 2022 21:25:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B3610E197
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 21:25:48 +0000 (UTC)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-2eb7d137101so125507627b3.12
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 14:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:cc;
 bh=SHwRUtvrT0NdcbhIAR6+q8dVHlt/noH6zImMf2T6bN4=;
 b=T42lyMTLciKl9Rv8/akmQtqV6uQQ3E9lX3jWMAM9W82MEwX1WhMSTKgLZRje/MNn+N
 eaMz6KMZQvtrz0QjRD+AfcH6yPO8ZF657CajRVWMHR5EbQcU2E6dqGuctCFu/kMyHUxC
 vToGcV2W3eMszf/c30QX9yL1UALQwfojoCr5x6IchvuVjlav1j/iJta6sr8IMsKGUQ/k
 S2lgestauhqAsjGB/Juetw8217qZvtYbVZ17ECFylI8CcKlrM+cJ4qS560kzTM6Q62wT
 BQSEHpmzBUsOIEvFHF7bCoEe17s+9mMpHlx8aLBwTl+dueknacj39X5zbJHYt5zxLrPZ
 gabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:cc;
 bh=SHwRUtvrT0NdcbhIAR6+q8dVHlt/noH6zImMf2T6bN4=;
 b=joIsSr31AqvRHbskTxUleyOPzsutRef2XWNMIhfdA/jkRXUtuVLS0c8la3lraaeQeD
 WJwAiSyMLTB8sQRPNAo9tpo1MSJLg88xY7auSooosJ0K7IrWHF42twoqBN9ZopQ/Rnih
 k4aSpBoOT7LVpefsBh9gXbgQZSYLxntjGoG0jZB46eQv252X9m2WIweuWw6KiuIdeUCG
 1QhmMAJzur/ButVNAOznWbE+cMwV3gocntFE+ZW0pgE88ZmYYCfJxURmJofuOy0J9WDr
 Z9fsom8Ef/PHon3vHn0yoyEKqIIEBYmNKgErEdObCeHd4Xy7DNJbuGCzJ/7vo/qr0PWr
 inaA==
X-Gm-Message-State: AOAM533UhkNsIEUXNXYeXPapEcfkZK7XeKSuu0qPjtgppAntqL7eiqLH
 WO1h+My8LFmxPfNqFuL4Va6AZOvEA7Ty/7sJow==
X-Google-Smtp-Source: ABdhPJyG9PJC9moHZn+WxEZeqsj3bqG2VefQDfTTJGrPdN9BgwqI20Tqbfa0K86skPf8JTa8S1yG0V0nozkYxpHBng==
X-Received: from kaleshsingh.mtv.corp.google.com
 ([2620:15c:211:200:a3c0:2a66:b25c:16df])
 (user=kaleshsingh job=sendgmr) by 2002:a0d:ea44:0:b0:30c:2902:dd96 with SMTP
 id t65-20020a0dea44000000b0030c2902dd96mr17812893ywe.115.1654032347582; Tue,
 31 May 2022 14:25:47 -0700 (PDT)
Date: Tue, 31 May 2022 14:25:15 -0700
In-Reply-To: <20220531212521.1231133-1-kaleshsingh@google.com>
Message-Id: <20220531212521.1231133-3-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20220531212521.1231133-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
Subject: [PATCH 2/2] procfs: Add 'path' to /proc/<pid>/fdinfo/
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
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Gortmaker <paul.gortmaker@windriver.com>,
 Kalesh Singh <kaleshsingh@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Christoph Anton Mitterer <mail@christoph.anton.mitterer.name>,
 David Hildenbrand <david@redhat.com>, kernel-team@android.com,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, surenb@google.com,
 tjmercier@google.com, Randy Dunlap <rdunlap@infradead.org>, ilkos@google.com,
 linux-kernel@vger.kernel.org, Colin Cross <ccross@google.com>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to identify the type of memory a process has pinned through
its open fds, add the file path to fdinfo output. This allows
identifying memory types based on common prefixes. e.g. "/memfd...",
"/dmabuf...", "/dev/ashmem...".

Access to /proc/<pid>/fdinfo is governed by PTRACE_MODE_READ_FSCREDS
the same as /proc/<pid>/maps which also exposes the file path of
mappings; so the security permissions for accessing path is consistent
with that of /proc/<pid>/maps.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes from rfc:
  - Split adding 'size' and 'path' into a separate patches, per Christian
  - Fix indentation (use tabs) in documentaion, per Randy

 Documentation/filesystems/proc.rst | 14 ++++++++++++--
 fs/proc/fd.c                       |  4 ++++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index 779c05528e87..591f12d30d97 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -1886,14 +1886,16 @@ if precise results are needed.
 3.8	/proc/<pid>/fdinfo/<fd> - Information about opened file
 ---------------------------------------------------------------
 This file provides information associated with an opened file. The regular
-files have at least five fields -- 'pos', 'flags', 'mnt_id', 'ino', and 'size'.
+files have at least six fields -- 'pos', 'flags', 'mnt_id', 'ino', 'size',
+and 'path'.
 
 The 'pos' represents the current offset of the opened file in decimal
 form [see lseek(2) for details], 'flags' denotes the octal O_xxx mask the
 file has been created with [see open(2) for details] and 'mnt_id' represents
 mount ID of the file system containing the opened file [see 3.5
 /proc/<pid>/mountinfo for details]. 'ino' represents the inode number of
-the file, and 'size' represents the size of the file in bytes.
+the file, 'size' represents the size of the file in bytes, and 'path'
+represents the file path.
 
 A typical output is::
 
@@ -1902,6 +1904,7 @@ A typical output is::
 	mnt_id:	19
 	ino:	63107
 	size:	0
+	path:	/dev/null
 
 All locks associated with a file descriptor are shown in its fdinfo too::
 
@@ -1920,6 +1923,7 @@ Eventfd files
 	mnt_id:	9
 	ino:	63107
 	size:   0
+	path:	anon_inode:[eventfd]
 	eventfd-count:	5a
 
 where 'eventfd-count' is hex value of a counter.
@@ -1934,6 +1938,7 @@ Signalfd files
 	mnt_id:	9
 	ino:	63107
 	size:   0
+	path:	anon_inode:[signalfd]
 	sigmask:	0000000000000200
 
 where 'sigmask' is hex value of the signal mask associated
@@ -1949,6 +1954,7 @@ Epoll files
 	mnt_id:	9
 	ino:	63107
 	size:   0
+	path:	anon_inode:[eventpoll]
 	tfd:        5 events:       1d data: ffffffffffffffff pos:0 ino:61af sdev:7
 
 where 'tfd' is a target file descriptor number in decimal form,
@@ -1968,6 +1974,7 @@ For inotify files the format is the following::
 	mnt_id:	9
 	ino:	63107
 	size:   0
+	path:	anon_inode:inotify
 	inotify wd:3 ino:9e7e sdev:800013 mask:800afce ignored_mask:0 fhandle-bytes:8 fhandle-type:1 f_handle:7e9e0000640d1b6d
 
 where 'wd' is a watch descriptor in decimal form, i.e. a target file
@@ -1992,6 +1999,7 @@ For fanotify files the format is::
 	mnt_id:	9
 	ino:	63107
 	size:   0
+	path:	anon_inode:[fanotify]
 	fanotify flags:10 event-flags:0
 	fanotify mnt_id:12 mflags:40 mask:38 ignored_mask:40000003
 	fanotify ino:4f969 sdev:800013 mflags:0 mask:3b ignored_mask:40000000 fhandle-bytes:8 fhandle-type:1 f_handle:69f90400c275b5b4
@@ -2018,6 +2026,7 @@ Timerfd files
 	mnt_id:	9
 	ino:	63107
 	size:   0
+	path:	anon_inode:[timerfd]
 	clockid: 0
 	ticks: 0
 	settime flags: 01
@@ -2042,6 +2051,7 @@ DMA Buffer files
 	mnt_id:	9
 	ino:	63107
 	size:   32768
+	path:	/dmabuf:
 	count:  2
 	exp_name:  system-heap
 
diff --git a/fs/proc/fd.c b/fs/proc/fd.c
index 464bc3f55759..8889a8ba09d4 100644
--- a/fs/proc/fd.c
+++ b/fs/proc/fd.c
@@ -60,6 +60,10 @@ static int seq_show(struct seq_file *m, void *v)
 	seq_printf(m, "ino:\t%lu\n", file_inode(file)->i_ino);
 	seq_printf(m, "size:\t%lli\n", (long long)file_inode(file)->i_size);
 
+	seq_puts(m, "path:\t");
+	seq_file_path(m, file, "\n");
+	seq_putc(m, '\n');
+
 	/* show_fd_locks() never deferences files so a stale value is safe */
 	show_fd_locks(m, file, files);
 	if (seq_has_overflowed(m))
-- 
2.36.1.255.ge46751e96f-goog

