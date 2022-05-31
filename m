Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A2E5398B1
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 23:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF1E10E156;
	Tue, 31 May 2022 21:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B075310E156
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 21:25:38 +0000 (UTC)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-30026cf9af8so125789467b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 14:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:cc;
 bh=px4+ZpXbHsure7vaViwll/H2EGv0zUZueEOXuxtocqM=;
 b=ZaARQ8d9PxwUFkeye+orr7uFPd1EQEtmzE+s6UR1ux+FcJbmTHiZMJ7e1JzoYbWBUl
 MmsmGGcDUWwDl++YBLF/jGBcZ9lqmCmJqOXTlaS/R3d6UBNhxWaNMjeHc5eGTbvGLUe8
 SkmOziIw6AkAwq76+XInYclaLp6vw+FNuXhy2Jq5VMAFaIlILl3AKWGm3vccd/4/2RDZ
 HPtlQ8x4ydXT7SRAuKi6Uou21GfFqKbCfvEpfPM4kJojTYN93ydf8Mcw6YmEpoOEzdQ3
 p97exnTro1SyD5LgslZm6/+TUMSKAEZrVnMkRAoxLIKYgxyjsusMw/gYicG9vpaLMIkN
 XEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:cc;
 bh=px4+ZpXbHsure7vaViwll/H2EGv0zUZueEOXuxtocqM=;
 b=6/cujxQCmHU93m2MeGCmU9/j5d67uEbZss2oOW+bgS1ptKg6EtqR1HFKmDq1xyruhs
 qmqQ+WCN4nTQ54t4oT810xCRTG1Nm5udXX5eaijFXz+440it80Nperd96F8Cq7xovE+1
 gkJkbyG4RfToM5iLUms0JoiS3Kva1OaeFyBn5dlfl43Q21zO0n/qZtjT0nTyLCpADyMe
 IOMRKQZn3j9MDQZ0Bde1zWaGTw6FkQaXnXxVgU+ICSvwgLKp9ewxQO+idcU+8gc3q80w
 3wZjSb+2C2b0YFpBbrXu4Kig++Hx/D5cDgRyAgxKt3A3SFPqrMyPECY0Cx+Uxo+4k18H
 AhFA==
X-Gm-Message-State: AOAM532pGfF2m8DWAqsUq7tzLu+IKSaAmfZo1CURW817p6ie0XQfVaky
 Ad1tGsAtVTS9QMeGsadnCD7DUjPIWKYcmH6hhg==
X-Google-Smtp-Source: ABdhPJwZ/c83nZu7U03w4uDCuA9LC5io7QSRjyjVxQZqwDEDunG479HIBUW6hUZDhFjJsLb9bhLsnieTrpx2EYlm+Q==
X-Received: from kaleshsingh.mtv.corp.google.com
 ([2620:15c:211:200:a3c0:2a66:b25c:16df])
 (user=kaleshsingh job=sendgmr) by 2002:a05:6902:1d1:b0:65c:ea47:8ea1 with
 SMTP id u17-20020a05690201d100b0065cea478ea1mr11260576ybh.400.1654032337918;
 Tue, 31 May 2022 14:25:37 -0700 (PDT)
Date: Tue, 31 May 2022 14:25:14 -0700
In-Reply-To: <20220531212521.1231133-1-kaleshsingh@google.com>
Message-Id: <20220531212521.1231133-2-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20220531212521.1231133-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
Subject: [PATCH 1/2] procfs: Add 'size' to /proc/<pid>/fdinfo/
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
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
 Christoph Anton Mitterer <mail@christoph.anton.mitterer.name>,
 kernel-team@android.com, dri-devel@lists.freedesktop.org,
 David Hildenbrand <david@redhat.com>, ilkos@google.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Johannes Weiner <hannes@cmpxchg.org>, Mike Rapoport <rppt@kernel.org>,
 Kalesh Singh <kaleshsingh@google.com>, linux-fsdevel@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 surenb@google.com, tjmercier@google.com,
 Paul Gortmaker <paul.gortmaker@windriver.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To be able to account the amount of memory a process is keeping pinned
by open file descriptors add a 'size' field to fdinfo output.

dmabufs fds already expose a 'size' field for this reason, remove this
and make it a common field for all fds. This allows tracking of
other types of memory (e.g. memfd and ashmem in Android).

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes from rfc:
  - Split adding 'size' and 'path' into a separate patches, per Christian
  - Split fdinfo seq_printf into separate lines, per Christian
  - Fix indentation (use tabs) in documentaion, per Randy

 Documentation/filesystems/proc.rst | 12 ++++++++++--
 drivers/dma-buf/dma-buf.c          |  1 -
 fs/proc/fd.c                       |  9 +++++----
 3 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index 1bc91fb8c321..779c05528e87 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -1886,13 +1886,14 @@ if precise results are needed.
 3.8	/proc/<pid>/fdinfo/<fd> - Information about opened file
 ---------------------------------------------------------------
 This file provides information associated with an opened file. The regular
-files have at least four fields -- 'pos', 'flags', 'mnt_id' and 'ino'.
+files have at least five fields -- 'pos', 'flags', 'mnt_id', 'ino', and 'size'.
+
 The 'pos' represents the current offset of the opened file in decimal
 form [see lseek(2) for details], 'flags' denotes the octal O_xxx mask the
 file has been created with [see open(2) for details] and 'mnt_id' represents
 mount ID of the file system containing the opened file [see 3.5
 /proc/<pid>/mountinfo for details]. 'ino' represents the inode number of
-the file.
+the file, and 'size' represents the size of the file in bytes.
 
 A typical output is::
 
@@ -1900,6 +1901,7 @@ A typical output is::
 	flags:	0100002
 	mnt_id:	19
 	ino:	63107
+	size:	0
 
 All locks associated with a file descriptor are shown in its fdinfo too::
 
@@ -1917,6 +1919,7 @@ Eventfd files
 	flags:	04002
 	mnt_id:	9
 	ino:	63107
+	size:   0
 	eventfd-count:	5a
 
 where 'eventfd-count' is hex value of a counter.
@@ -1930,6 +1933,7 @@ Signalfd files
 	flags:	04002
 	mnt_id:	9
 	ino:	63107
+	size:   0
 	sigmask:	0000000000000200
 
 where 'sigmask' is hex value of the signal mask associated
@@ -1944,6 +1948,7 @@ Epoll files
 	flags:	02
 	mnt_id:	9
 	ino:	63107
+	size:   0
 	tfd:        5 events:       1d data: ffffffffffffffff pos:0 ino:61af sdev:7
 
 where 'tfd' is a target file descriptor number in decimal form,
@@ -1962,6 +1967,7 @@ For inotify files the format is the following::
 	flags:	02000000
 	mnt_id:	9
 	ino:	63107
+	size:   0
 	inotify wd:3 ino:9e7e sdev:800013 mask:800afce ignored_mask:0 fhandle-bytes:8 fhandle-type:1 f_handle:7e9e0000640d1b6d
 
 where 'wd' is a watch descriptor in decimal form, i.e. a target file
@@ -1985,6 +1991,7 @@ For fanotify files the format is::
 	flags:	02
 	mnt_id:	9
 	ino:	63107
+	size:   0
 	fanotify flags:10 event-flags:0
 	fanotify mnt_id:12 mflags:40 mask:38 ignored_mask:40000003
 	fanotify ino:4f969 sdev:800013 mflags:0 mask:3b ignored_mask:40000000 fhandle-bytes:8 fhandle-type:1 f_handle:69f90400c275b5b4
@@ -2010,6 +2017,7 @@ Timerfd files
 	flags:	02
 	mnt_id:	9
 	ino:	63107
+	size:   0
 	clockid: 0
 	ticks: 0
 	settime flags: 01
diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 32f55640890c..5f2ae38c960f 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -378,7 +378,6 @@ static void dma_buf_show_fdinfo(struct seq_file *m, struct file *file)
 {
 	struct dma_buf *dmabuf = file->private_data;
 
-	seq_printf(m, "size:\t%zu\n", dmabuf->size);
 	/* Don't count the temporary reference taken inside procfs seq_show */
 	seq_printf(m, "count:\t%ld\n", file_count(dmabuf->file) - 1);
 	seq_printf(m, "exp_name:\t%s\n", dmabuf->exp_name);
diff --git a/fs/proc/fd.c b/fs/proc/fd.c
index 913bef0d2a36..464bc3f55759 100644
--- a/fs/proc/fd.c
+++ b/fs/proc/fd.c
@@ -54,10 +54,11 @@ static int seq_show(struct seq_file *m, void *v)
 	if (ret)
 		return ret;
 
-	seq_printf(m, "pos:\t%lli\nflags:\t0%o\nmnt_id:\t%i\nino:\t%lu\n",
-		   (long long)file->f_pos, f_flags,
-		   real_mount(file->f_path.mnt)->mnt_id,
-		   file_inode(file)->i_ino);
+	seq_printf(m, "pos:\t%lli\n", (long long)file->f_pos);
+	seq_printf(m, "flags:\t0%o\n", f_flags);
+	seq_printf(m, "mnt_id:\t%i\n", real_mount(file->f_path.mnt)->mnt_id);
+	seq_printf(m, "ino:\t%lu\n", file_inode(file)->i_ino);
+	seq_printf(m, "size:\t%lli\n", (long long)file_inode(file)->i_size);
 
 	/* show_fd_locks() never deferences files so a stale value is safe */
 	show_fd_locks(m, file, files);
-- 
2.36.1.255.ge46751e96f-goog

