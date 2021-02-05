Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2963106C6
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 09:33:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95ADB6F39D;
	Fri,  5 Feb 2021 08:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 913BD6F3AD
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 02:24:18 +0000 (UTC)
Received: by mail-qk1-x74a.google.com with SMTP id s4so4480185qkj.18
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 18:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:cc; bh=6d9ABw+2MMja8w+m/Ge5BEthUdZ4QJrI2VfEHE0lgZM=;
 b=Wc16uuiBzr8uRjh+FFc3aIVuYhA4o0xASF2SZxYJnSmlvoMBSrBe3o+TwZR3i71wu/
 fqI4C+NddGfKrN79A8uKvB/q6omI/GP9hEtW/sg69RyL3/2WcO4gxwzosiUilwevKO40
 W9GedpIGi4x2wd5wgj4dMTWcXsvW6I8ncM32cwEbWi8ZNJnCsROyGUBiIZhNqKZXGMjO
 /EVsU2QqlGJReEo8F1Rg79kqGShzlt0flDZIvLOZWrIW0e54pnTDADWfK6X72sHXMBFE
 PzRiVNGkqfISNW+tz/s/6UL65wp2v17Qg95lrHV9rWpeAfNgdamhTwR58a+JTd0plkzx
 Racg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:cc;
 bh=6d9ABw+2MMja8w+m/Ge5BEthUdZ4QJrI2VfEHE0lgZM=;
 b=agTEbaXc6qGgrEnDqOhBMswl2JCkvtDwZUf8X8ZTZyo0aOnsF98GVYOIqlvckLbL0A
 L+lmzQTlTXopfsiiUH8eCJREEpRWPig4PAV0hUSDYYzC78JkyPQXmwhyKWpHDWYO7Cs+
 zMmaN5GKW2886Tt+j/uuux7bMZ0+4Ai45ygAbkozDLtnP0BRIgJctWyIi53iWB/RlPmM
 Lji5noK7y/zr6LOh3wmjjtuUhmy1oOlExHAeaxY88Ul2QjQCVa6dtj6kVHdqgSxdY11E
 g8GsKog7aNhJm1nDpLeU/1BUOOeKREyK2LR9Xlx8UWeQkUG5zQp9w9C7/o7AulM5rK3A
 n4IQ==
X-Gm-Message-State: AOAM5310nuNk4aFyzdnMHQmfApHhhlhN0D4PnGSHQjRIMuH45funmpDn
 oELTwFnbWFFHaGibWr7HcZsD4K40TTTbxvrHuQ==
X-Google-Smtp-Source: ABdhPJw8Yeorck2XB7ovp4pfEx707riZ2xycBS0Z28A1vOhEhNyxFRWBW6rhdYjGLZma2NqW8dSu+H8zYFEZQD05eA==
X-Received: from kaleshsingh.c.googlers.com
 ([fda3:e722:ac3:10:14:4d90:c0a8:2145])
 (user=kaleshsingh job=sendgmr) by 2002:ad4:5606:: with SMTP id
 ca6mr2501087qvb.1.1612491857373; Thu, 04 Feb 2021 18:24:17 -0800 (PST)
Date: Fri,  5 Feb 2021 02:23:20 +0000
In-Reply-To: <20210205022328.481524-1-kaleshsingh@google.com>
Message-Id: <20210205022328.481524-2-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20210205022328.481524-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v3 2/2] dmabuf: Add dmabuf inode number to /proc/*/fdinfo
From: Kalesh Singh <kaleshsingh@google.com>
X-Mailman-Approved-At: Fri, 05 Feb 2021 08:33:33 +0000
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
Cc: Michal Hocko <mhocko@suse.com>, Anand K Mistry <amistry@google.com>,
 linux-doc@vger.kernel.org, NeilBrown <neilb@suse.de>,
 dri-devel@lists.freedesktop.org, Andrei Vagin <avagin@gmail.com>,
 Kalesh Singh <kaleshsingh@google.com>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Michel Lespinasse <walken@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, jeffv@google.com,
 kernel-team@android.com, Alexey Dobriyan <adobriyan@gmail.com>,
 linux-media@vger.kernel.org, keescook@chromium.org, jannh@google.com,
 linaro-mm-sig@lists.linaro.org, linux-fsdevel@vger.kernel.org,
 Bernd Edlinger <bernd.edlinger@hotmail.de>, surenb@google.com,
 Alexey Gladkov <gladkov.alexey@gmail.com>, linux-kernel@vger.kernel.org,
 minchan@kernel.org, Yafang Shao <laoar.shao@gmail.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>, hridya@google.com,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If a FD refers to a DMA buffer add the DMA buffer inode number to
/proc/<pid>/fdinfo/<FD> and /proc/<pid>/task/<tid>/fdindo/<FD>.

The dmabuf inode number allows userspace to uniquely identify the buffer
and avoids a dependency on /proc/<pid>/fd/* when accounting per-process
DMA buffer sizes.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
Changes in v3:
  - Add documentation in proc.rst
Changes in v2:
  - Update patch description

 Documentation/filesystems/proc.rst | 17 +++++++++++++++++
 drivers/dma-buf/dma-buf.c          |  1 +
 2 files changed, 18 insertions(+)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index 2fa69f710e2a..fdd38676f57f 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -2031,6 +2031,23 @@ details]. 'it_value' is remaining time until the timer expiration.
 with TIMER_ABSTIME option which will be shown in 'settime flags', but 'it_value'
 still exhibits timer's remaining time.
 
+DMA Buffer files
+~~~~~~~~~~~~~~~~
+
+::
+
+	pos:	0
+	flags:	04002
+	mnt_id:	9
+	dmabuf_inode_no: 63107
+	size:   32768
+	count:  2
+	exp_name:  system-heap
+
+where 'dmabuf_inode_no' is the unique inode number of the DMA buffer file.
+'size' is the size of the DMA buffer in bytes. 'count' is the file count of
+the DMA buffer file. 'exp_name' is the name of the DMA buffer exporter.
+
 3.9	/proc/<pid>/map_files - Information about memory mapped files
 ---------------------------------------------------------------------
 This directory contains symbolic links which represent memory mapped files
diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 9ad6397aaa97..d869099ede83 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -414,6 +414,7 @@ static void dma_buf_show_fdinfo(struct seq_file *m, struct file *file)
 {
 	struct dma_buf *dmabuf = file->private_data;
 
+	seq_printf(m, "dmabuf_inode_no:\t%lu\n", file_inode(file)->i_ino);
 	seq_printf(m, "size:\t%zu\n", dmabuf->size);
 	/* Don't count the temporary reference taken inside procfs seq_show */
 	seq_printf(m, "count:\t%ld\n", file_count(dmabuf->file) - 1);
-- 
2.30.0.478.g8a0d178c01-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
