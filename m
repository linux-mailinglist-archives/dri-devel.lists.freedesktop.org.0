Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B57FD558B1A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 00:06:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A4410E9A1;
	Thu, 23 Jun 2022 22:06:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72A810E9A1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 22:06:44 +0000 (UTC)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-317597643bfso5807027b3.20
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 15:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=a2jg4UNQjviND3cH82kQJDjQu+6LwBTunrM4AXOvyQQ=;
 b=GEqvezpitihwD1TDcPv/qNvBJOGfHHvcsuOZN512C3aYaCbS2r8hGXoqtFxTRaWRPH
 ONl8vk6GXcTdTullSPSHeTQweqyptRyDMrz7r+0cehuL7f+HmxtyScPTTrul+ODzkU6L
 NNk4Vd1huXBU/7OvU6cGpVx4N3IU6SgKjursyVHLc4xxYcLhKjxJyinTqR4Fi9oPvCLO
 nVTMvb5EyVfxqZjUt2LvIg1y6pPENDp1ltIZFCXzKN1tnYrOaBZRHd3IuXe3LgYYeRu4
 /dBMfFa7gyn9Fytx1/ODtSwfTOswRSRgxTFFAOki5A2+kW24OVc+8kXSBb2/tk8MvIsE
 EHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=a2jg4UNQjviND3cH82kQJDjQu+6LwBTunrM4AXOvyQQ=;
 b=fRoy7gPuMPP8V2I/i7jUrJkTGokQNpkemmXf8tfSWc4A/99jP4jtGr+jz7mloe/NLZ
 mKRicblnYZbqsov9DemnBy30Fli3kPHM8AyoKjFpMxhjmh2zD35sQIxYCoCjst49BnP7
 TpSyqBn9YNo7r1X6htpyavbgHwmPajh7BNvY54FbPefmu6uKO/Xk9Ah/C4R7M3Hd5efW
 /fh6qBYTA/uQ2gQzsGH9v7Qo7W2Ji+qIhR2h9I5fhDREmA2TW7XjNfAVAk+iT7JwWLRf
 s3TSQ6RCl9OSF9pRNmjXx3mfED/EQxti64zF+oUmfGlcpQsKjuT+QLA9YlUpD2Kvvsws
 5JGA==
X-Gm-Message-State: AJIora+RO8WtrueMJ2iG/cXFxNMsw2HB1eiv6HScJbBZoIoMSr8ZP6yO
 MOn3pYqzwIucDO+pHHMuIfVB7p6+fp0jViJY2w==
X-Google-Smtp-Source: AGRyM1vSTrTtNaDILcKLNUvdvxUtr0gmEZ7meLNus5pJkbvDd0DxxtAacCrYBtze6AGzcMMeOrwshzpBaYuShELJSQ==
X-Received: from kaleshsingh.mtv.corp.google.com
 ([2620:15c:211:200:ac62:20a7:e3c5:c221])
 (user=kaleshsingh job=sendgmr) by 2002:a0d:c482:0:b0:317:8bf3:f07f with SMTP
 id g124-20020a0dc482000000b003178bf3f07fmr13205255ywd.11.1656022003907; Thu,
 23 Jun 2022 15:06:43 -0700 (PDT)
Date: Thu, 23 Jun 2022 15:06:07 -0700
In-Reply-To: <20220623220613.3014268-1-kaleshsingh@google.com>
Message-Id: <20220623220613.3014268-3-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20220623220613.3014268-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v2 2/2] procfs: Add 'path' to /proc/<pid>/fdinfo/
From: Kalesh Singh <kaleshsingh@google.com>
To: ckoenig.leichtzumerken@gmail.com, christian.koenig@amd.com, 
 viro@zeniv.linux.org.uk, hch@infradead.org, stephen.s.brennan@oracle.com, 
 David.Laight@ACULAB.COM
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
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>,
 Christoph Anton Mitterer <mail@christoph.anton.mitterer.name>,
 kernel-team@android.com, Johannes Weiner <hannes@cmpxchg.org>,
 ilkos@google.com, linux-kernel@vger.kernel.org,
 Colin Cross <ccross@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Paul Gortmaker <paul.gortmaker@windriver.com>,
 dri-devel@lists.freedesktop.org, Kalesh Singh <kaleshsingh@google.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 surenb@google.com, tjmercier@google.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to identify the type of memory a process has pinned through
its open fds, add the file path to fdinfo output. This allows
identifying memory types based on common prefixes:
  e.g. "/memfd...", "/dmabuf...", "/dev/ashmem...".

To be cautious, only expose the paths for anonymous inodes, and this
also avoids printing path names with strange characters.

Access to /proc/<pid>/fdinfo is governed by PTRACE_MODE_READ_FSCREDS
the same as /proc/<pid>/maps which also exposes the file path of
mappings; so the security permissions for accessing path is consistent
with that of /proc/<pid>/maps.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - Only add path field for files with anon inodes.

Changes from rfc:
  - Split adding 'size' and 'path' into a separate patches, per Christian
  - Fix indentation (use tabs) in documentaion, per Randy

 Documentation/filesystems/proc.rst | 10 ++++++++++
 fs/libfs.c                         |  9 +++++++++
 fs/proc/fd.c                       | 13 +++++++++++--
 include/linux/fs.h                 |  1 +
 4 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index 779c05528e87..ca23a9af4845 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -1907,6 +1907,9 @@ All locks associated with a file descriptor are shown in its fdinfo too::
 
     lock:       1: FLOCK  ADVISORY  WRITE 359 00:13:11691 0 EOF
 
+Files with anonymous inodes have an additional 'path' field which represents
+the anonymous file path.
+
 The files such as eventfd, fsnotify, signalfd, epoll among the regular pos/flags
 pair provide additional information particular to the objects they represent.
 
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
 
diff --git a/fs/libfs.c b/fs/libfs.c
index 31b0ddf01c31..6911749b4da7 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1217,6 +1217,15 @@ void kfree_link(void *p)
 }
 EXPORT_SYMBOL(kfree_link);
 
+static const struct address_space_operations anon_aops = {
+	.dirty_folio	= noop_dirty_folio,
+};
+
+bool is_anon_inode(struct inode *inode)
+{
+	return inode->i_mapping->a_ops == &anon_aops;
+}
+
 struct inode *alloc_anon_inode(struct super_block *s)
 {
 	static const struct address_space_operations anon_aops = {
diff --git a/fs/proc/fd.c b/fs/proc/fd.c
index 464bc3f55759..5bac79a2fa51 100644
--- a/fs/proc/fd.c
+++ b/fs/proc/fd.c
@@ -23,6 +23,7 @@ static int seq_show(struct seq_file *m, void *v)
 	struct files_struct *files = NULL;
 	int f_flags = 0, ret = -ENOENT;
 	struct file *file = NULL;
+	struct inode *inode = NULL;
 	struct task_struct *task;
 
 	task = get_proc_task(m->private);
@@ -54,11 +55,19 @@ static int seq_show(struct seq_file *m, void *v)
 	if (ret)
 		return ret;
 
+	inode = file_inode(file);
+
 	seq_printf(m, "pos:\t%lli\n", (long long)file->f_pos);
 	seq_printf(m, "flags:\t0%o\n", f_flags);
 	seq_printf(m, "mnt_id:\t%i\n", real_mount(file->f_path.mnt)->mnt_id);
-	seq_printf(m, "ino:\t%lu\n", file_inode(file)->i_ino);
-	seq_printf(m, "size:\t%lli\n", (long long)file_inode(file)->i_size);
+	seq_printf(m, "ino:\t%lu\n", inode->i_ino);
+	seq_printf(m, "size:\t%lli\n", (long long)inode->i_size);
+
+	if (is_anon_inode(inode)) {
+		seq_puts(m, "path:\t");
+		seq_file_path(m, file, "\n");
+		seq_putc(m, '\n');
+	}
 
 	/* show_fd_locks() never deferences files so a stale value is safe */
 	show_fd_locks(m, file, files);
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 9ad5e3520fae..73449e620b66 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3111,6 +3111,7 @@ extern void page_put_link(void *);
 extern int page_symlink(struct inode *inode, const char *symname, int len);
 extern const struct inode_operations page_symlink_inode_operations;
 extern void kfree_link(void *);
+extern bool is_anon_inode(struct inode *inode);
 void generic_fillattr(struct user_namespace *, struct inode *, struct kstat *);
 void generic_fill_statx_attr(struct inode *inode, struct kstat *stat);
 extern int vfs_getattr_nosec(const struct path *, struct kstat *, u32, unsigned int);
-- 
2.37.0.rc0.161.g10f37bed90-goog

