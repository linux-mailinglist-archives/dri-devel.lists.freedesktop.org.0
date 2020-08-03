Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2785323B5AE
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 09:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E67086E44A;
	Tue,  4 Aug 2020 07:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com
 [IPv6:2607:f8b0:4864:20::849])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF97F6E02D
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 14:47:46 +0000 (UTC)
Received: by mail-qt1-x849.google.com with SMTP id d2so23533435qtn.8
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Aug 2020 07:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=exegq5bRss6SDj4yQZt05Kc3+gr2w1N7iotmmiqvfaE=;
 b=mGbuS+pGC2mlZ1nnEmD1UyJJXrsA49ua7zPcaT6Pb99vdkfquF0DlxLELzi2UVFHnz
 UQUik19iARwlMzlIFxykMeRfQ6oge5n7bchL6BZu8lyh6evqernJZXAnv0/9WYrja5HD
 Q9W8tFLfkY4oPAcwJ4a0TnaLj217q3Daa7ocYAM6w+zVg8lJ9OjeITJ9jMx9RHiIcrB7
 v5SJIb3A7rjAEpFPOqH6WpNaQLYoBGUgvH3dH8xM+4XSyt1OAM6VgEjlSccwOg8rJXEw
 qlBvT/iCSh0JFz0QGdWGzwIzM+bYQPBo/ooJ6ucHbeDPUskeVvdf+SxdjQ3AyeiIHfZk
 ZuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=exegq5bRss6SDj4yQZt05Kc3+gr2w1N7iotmmiqvfaE=;
 b=PudYEhs/K5ubCDhMBCeP9CYnldl55itOhRVAOcizZwOtVN6Ad6NlS8IGGeQuU5uVE9
 Nfz4EtOus+zglBrNEzpFRSvc7DojmoPXaBhw/HBNuuPmvNyTJvIw7X57jOgsIrkHyYas
 nxzTCrDddN3rL8CshmWV+tNLQvlOgfmN4pmci6rR3wQGft9pttCmxHURdhGyTCyPv9cQ
 m9cWCULBP4bYmEXgXcpf7lCbL3MbTVeoPPGIYhVavnN1BNmiuERS9NewznIz62ouEW2Q
 YgrxNmFdmkDKNMoi/WF4KPckeg0DKr+rY5ZDb6Fxhxx94HdelQnjXSpcRsppAOxHwMtY
 BzwQ==
X-Gm-Message-State: AOAM530vGHfhq4DE1COQlzTdRitcrstREfw9mYfo5AuJO+gEPiCF1R0+
 BBgZlyNwE8c36WN4FdJiWYMY9dmLNkqSSDU0ew==
X-Google-Smtp-Source: ABdhPJzDwQ0aX/7NlvPVgwHIaoyHgpXGgCOEtbhY3RvNh0Xr+RtcQtfdf3+ncwToVPid9YW6tzvTvt4z+owCWodSjw==
X-Received: by 2002:a0c:b743:: with SMTP id q3mr16777556qve.229.1596466065553; 
 Mon, 03 Aug 2020 07:47:45 -0700 (PDT)
Date: Mon,  3 Aug 2020 14:47:18 +0000
In-Reply-To: <20200803144719.3184138-1-kaleshsingh@google.com>
Message-Id: <20200803144719.3184138-2-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20200803144719.3184138-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.28.0.163.g6104cc2f0b6-goog
Subject: [PATCH 1/2] fs: Add fd_install file operation
From: Kalesh Singh <kaleshsingh@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>
X-Mailman-Approved-At: Tue, 04 Aug 2020 07:27:04 +0000
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
Cc: linux-doc@vger.kernel.org, kernel-team@android.com,
 Ioannis Ilkos <ilkos@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Hridya Valsaraju <hridya@google.com>, Kalesh Singh <kaleshsingh@google.com>,
 linux-fsdevel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Provides a per process hook for the acquisition of file descriptors,
despite the method used to obtain the descriptor.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 Documentation/filesystems/vfs.rst | 5 +++++
 fs/file.c                         | 3 +++
 include/linux/fs.h                | 1 +
 3 files changed, 9 insertions(+)

diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
index ed17771c212b..95b30142c8d9 100644
--- a/Documentation/filesystems/vfs.rst
+++ b/Documentation/filesystems/vfs.rst
@@ -1123,6 +1123,11 @@ otherwise noted.
 ``fadvise``
 	possibly called by the fadvise64() system call.
 
+``fd_install``
+	called by the VFS when a file descriptor is installed in the
+	process's file descriptor table, regardless how the file descriptor
+	was acquired -- be it via the open syscall, received over IPC, etc.
+
 Note that the file operations are implemented by the specific
 filesystem in which the inode resides.  When opening a device node
 (character or block special) most filesystems will call special
diff --git a/fs/file.c b/fs/file.c
index abb8b7081d7a..f5db8622b851 100644
--- a/fs/file.c
+++ b/fs/file.c
@@ -616,6 +616,9 @@ void __fd_install(struct files_struct *files, unsigned int fd,
 void fd_install(unsigned int fd, struct file *file)
 {
 	__fd_install(current->files, fd, file);
+
+	if (file->f_op->fd_install)
+		file->f_op->fd_install(fd, file);
 }
 
 EXPORT_SYMBOL(fd_install);
diff --git a/include/linux/fs.h b/include/linux/fs.h
index f5abba86107d..b976fbe8c902 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1864,6 +1864,7 @@ struct file_operations {
 				   struct file *file_out, loff_t pos_out,
 				   loff_t len, unsigned int remap_flags);
 	int (*fadvise)(struct file *, loff_t, loff_t, int);
+	void (*fd_install)(int, struct file *);
 } __randomize_layout;
 
 struct inode_operations {
-- 
2.28.0.163.g6104cc2f0b6-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
