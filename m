Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3861D558B13
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 00:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4844A10E6BF;
	Thu, 23 Jun 2022 22:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029BB10E6BF
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 22:06:33 +0000 (UTC)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-3178996424dso5713097b3.21
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 15:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=LuVwJu2XTJotGIIzCTAGr4F0lNY10/cZV2iS+VHdvuo=;
 b=IoqZwDtQveOkId40Codht810g407pd1np3iZsZaGpC0V+df4/QXkWF3oB4Mp5XiG4z
 AkHfVLodnJPGIXXOQOLZpEs3oP05HDStEn81Gzp/08IpMjXs+0WkBYIt5XFIGs4UBBt9
 vDn9LYFjKXjjip1WPCH+zWI6ouiNaFo7GzIbYf9UpUCSYtX8reoBMCBcFfdoHjTENNmM
 rb7T+ScF4HCojuFb8n6t9OTfcdLiboWa5W6743biCT0C/MQg55OQP00HVu/5M2H9xT2M
 1lmQhJi74VDMDyRTyFxvnlsIezy7d1O119TmXhSw1uakyz4IwS29YleI9L5cXoCl9O+V
 3mFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=LuVwJu2XTJotGIIzCTAGr4F0lNY10/cZV2iS+VHdvuo=;
 b=nGEivG124/UReImHaZIpiW3/sJIm0RQiTaUXR+YMzyNj10/3GI5iUeQWM5VLW9SLaj
 SPlX2isyJvQa2hruOpT8gzd8D1qXzhyQ57ZSwhIFdlpkrzUcDx2p3BjZFo396HLuXYtF
 JBeImIDgFLgNwzPBYc+WezgQNbDCitZaIjZsgrDUdtNSRDnU/ccK+YcA8ZLczkOw/v1F
 Ar2ih5ZP3M7lqlFXBwxKUyfmFWGhByYmLTroZzsR0T5VtLSCZ1LtKVeZmVgI9kP9lPdJ
 SyTytpsvoIwEtXfFxQ7EotcsiiPLVC5yOpjcF7z1+P2uFrHBx3Frt4Rale9DppDS6T3R
 HvVA==
X-Gm-Message-State: AJIora+3oTAobq2DpLOVhyZyBiBtgA+qGH82otf20jaVFNveellOy90D
 BLhUxwqS33sHyKWbmN9E9AyW1q7kqeXtSlyUFw==
X-Google-Smtp-Source: AGRyM1sUtTt9Hgz8VwrY8RPCyKlElkJLkRs2tNxEPPEXYBDiEywoCy3hLf1D/wC013YTlrfFlZGqN4FoX1llld8RZQ==
X-Received: from kaleshsingh.mtv.corp.google.com
 ([2620:15c:211:200:ac62:20a7:e3c5:c221])
 (user=kaleshsingh job=sendgmr) by 2002:a25:9305:0:b0:668:d3a8:cb0b with SMTP
 id f5-20020a259305000000b00668d3a8cb0bmr11286577ybo.156.1656021993192; Thu,
 23 Jun 2022 15:06:33 -0700 (PDT)
Date: Thu, 23 Jun 2022 15:06:06 -0700
In-Reply-To: <20220623220613.3014268-1-kaleshsingh@google.com>
Message-Id: <20220623220613.3014268-2-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20220623220613.3014268-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v2 1/2] procfs: Add 'size' to /proc/<pid>/fdinfo/
From: Kalesh Singh <kaleshsingh@google.com>
To: ckoenig.leichtzumerken@gmail.com, christian.koenig@amd.com, 
 viro@zeniv.linux.org.uk, hch@infradead.org, stephen.s.brennan@oracle.com, 
 David.Laight@ACULAB.COM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>,
 Christoph Anton Mitterer <mail@christoph.anton.mitterer.name>,
 kernel-team@android.com, Johannes Weiner <hannes@cmpxchg.org>,
 ilkos@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Paul Gortmaker <paul.gortmaker@windriver.com>,
 Kalesh Singh <kaleshsingh@google.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, surenb@google.com,
 tjmercier@google.com, Mike Rapoport <rppt@kernel.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To be able to account the amount of memory a process is keeping pinned
by open file descriptors add a 'size' field to fdinfo output.

dmabufs fds already expose a 'size' field for this reason, remove this
and make it a common field for all fds. This allows tracking of
other types of memory (e.g. memfd and ashmem in Android).

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
---

Changes in v2:
  - Add Christian's Reviewed-by

Changes from rfc:
  - Split adding 'size' and 'path' into a separate patches, per Christian
  - Split fdinfo seq_printf into separate lines, per Christian
  - Fix indentation (use tabs) in documentaion, per Randy

 Documentation/filesystems/proc.rst | 12 ++++++++++--
 drivers/dma-buf/dma-buf.c          |  1 -
 fs/proc/fd.c                       |  9 +++++----
 3 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems=
/proc.rst
index 1bc91fb8c321..779c05528e87 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -1886,13 +1886,14 @@ if precise results are needed.
 3.8	/proc/<pid>/fdinfo/<fd> - Information about opened file
 ---------------------------------------------------------------
 This file provides information associated with an opened file. The regular
-files have at least four fields -- 'pos', 'flags', 'mnt_id' and 'ino'.
+files have at least five fields -- 'pos', 'flags', 'mnt_id', 'ino', and 's=
ize'.
+
 The 'pos' represents the current offset of the opened file in decimal
 form [see lseek(2) for details], 'flags' denotes the octal O_xxx mask the
 file has been created with [see open(2) for details] and 'mnt_id' represen=
ts
 mount ID of the file system containing the opened file [see 3.5
 /proc/<pid>/mountinfo for details]. 'ino' represents the inode number of
-the file.
+the file, and 'size' represents the size of the file in bytes.
=20
 A typical output is::
=20
@@ -1900,6 +1901,7 @@ A typical output is::
 	flags:	0100002
 	mnt_id:	19
 	ino:	63107
+	size:	0
=20
 All locks associated with a file descriptor are shown in its fdinfo too::
=20
@@ -1917,6 +1919,7 @@ Eventfd files
 	flags:	04002
 	mnt_id:	9
 	ino:	63107
+	size:   0
 	eventfd-count:	5a
=20
 where 'eventfd-count' is hex value of a counter.
@@ -1930,6 +1933,7 @@ Signalfd files
 	flags:	04002
 	mnt_id:	9
 	ino:	63107
+	size:   0
 	sigmask:	0000000000000200
=20
 where 'sigmask' is hex value of the signal mask associated
@@ -1944,6 +1948,7 @@ Epoll files
 	flags:	02
 	mnt_id:	9
 	ino:	63107
+	size:   0
 	tfd:        5 events:       1d data: ffffffffffffffff pos:0 ino:61af sdev=
:7
=20
 where 'tfd' is a target file descriptor number in decimal form,
@@ -1962,6 +1967,7 @@ For inotify files the format is the following::
 	flags:	02000000
 	mnt_id:	9
 	ino:	63107
+	size:   0
 	inotify wd:3 ino:9e7e sdev:800013 mask:800afce ignored_mask:0 fhandle-byt=
es:8 fhandle-type:1 f_handle:7e9e0000640d1b6d
=20
 where 'wd' is a watch descriptor in decimal form, i.e. a target file
@@ -1985,6 +1991,7 @@ For fanotify files the format is::
 	flags:	02
 	mnt_id:	9
 	ino:	63107
+	size:   0
 	fanotify flags:10 event-flags:0
 	fanotify mnt_id:12 mflags:40 mask:38 ignored_mask:40000003
 	fanotify ino:4f969 sdev:800013 mflags:0 mask:3b ignored_mask:40000000 fha=
ndle-bytes:8 fhandle-type:1 f_handle:69f90400c275b5b4
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
@@ -378,7 +378,6 @@ static void dma_buf_show_fdinfo(struct seq_file *m, str=
uct file *file)
 {
 	struct dma_buf *dmabuf =3D file->private_data;
=20
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
=20
-	seq_printf(m, "pos:\t%lli\nflags:\t0%o\nmnt_id:\t%i\nino:\t%lu\n",
-		   (long long)file->f_pos, f_flags,
-		   real_mount(file->f_path.mnt)->mnt_id,
-		   file_inode(file)->i_ino);
+	seq_printf(m, "pos:\t%lli\n", (long long)file->f_pos);
+	seq_printf(m, "flags:\t0%o\n", f_flags);
+	seq_printf(m, "mnt_id:\t%i\n", real_mount(file->f_path.mnt)->mnt_id);
+	seq_printf(m, "ino:\t%lu\n", file_inode(file)->i_ino);
+	seq_printf(m, "size:\t%lli\n", (long long)file_inode(file)->i_size);
=20
 	/* show_fd_locks() never deferences files so a stale value is safe */
 	show_fd_locks(m, file, files);
--=20
2.37.0.rc0.161.g10f37bed90-goog

