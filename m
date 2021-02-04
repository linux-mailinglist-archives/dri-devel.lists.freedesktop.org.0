Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C60D3106C4
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 09:33:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B986F39A;
	Fri,  5 Feb 2021 08:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A8496EEAF
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 23:30:13 +0000 (UTC)
Received: by mail-qk1-x749.google.com with SMTP id o16so4135350qkj.15
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 15:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:cc; bh=+DMZQSm/uaEUXJw9EFN7NIYygzQ6mIPslbKoTBQUvsQ=;
 b=WiPF6RbkD/Zm7dcNkPvnl02p57tzN9cu7c9cNHJG1mmc9lGt7Z0/nB7zndD/gk4np6
 K7Knd7DIOUPQQKVSo9sQT1kQ1Ggydy/VBFeXlwnNaJHBtZCBXhaxCn6ealEFq/igVY0e
 mVLER0rjGQAI9zK3qxTZJc5fv57Y9+vjW+ARS+hfIuFhBgTxQUezL7XmkIJxjWBMUKav
 E1jdUPerE/x4HE1ZuHvkOzho9FTcCj5dK3y8OwL3yR6WyZRLcwRUrWTwLIu/qP4ha47n
 +PlyqcV1VXzedm4o4MT5Ss2bGyDATHCeszcD7hdlBC5vzDHxIPBbNrCayImbF5uwe1r4
 QWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:cc;
 bh=+DMZQSm/uaEUXJw9EFN7NIYygzQ6mIPslbKoTBQUvsQ=;
 b=iHqQpu605DZJZzYBWYLyqEmsvYwxJ4P0CKL2AEZHN07lJDm9WBIiqsNGXxq4pzhNqu
 L1FRJWp9AsFvmEGT3TL6mRHHC5aybbG032wtC2aXaUww+qoivBhvqh1KsoaZogavA3Zv
 P+WmPhtiB5lmG9fKOKy+4UdqN0rfqkHQBFBwSvIL8nqTndd85yoaL39w2QYDpM1hObze
 D4jNlBT3JZdss4mtcMesr/gDkcl0mjej6R5vtP/1OG7CjoqpJe8eXB2ml7HAkcENonPb
 Tq/wdmfEYsFN91ulE//3KOC9JG8OWO/WFhzT+Ck/HN/PBmnIo9pUZxzPgTcfGzwTgwff
 q5Dw==
X-Gm-Message-State: AOAM532Wt6mB2W1PJBC20jY+aElRsRhnq5ByeKWd2d4uG7pZIq3Y/wXs
 bpYTBrwKBA33sdN2/Er2FU/b8U5x7j6RBliKXA==
X-Google-Smtp-Source: ABdhPJx3kg9I/fA5bBDYRFvfPdVTeyCfD6xE3qxRlCYQfUGKmYYfcWiSsJ3nZEdsX8iZC/R5fjsrlL6fZPjSx22Y7g==
X-Received: from kaleshsingh.c.googlers.com
 ([fda3:e722:ac3:10:14:4d90:c0a8:2145])
 (user=kaleshsingh job=sendgmr) by 2002:ad4:5be9:: with SMTP id
 k9mr1715632qvc.18.1612481412377; Thu, 04 Feb 2021 15:30:12 -0800 (PST)
Date: Thu,  4 Feb 2021 23:28:50 +0000
In-Reply-To: <20210204232854.451676-1-kaleshsingh@google.com>
Message-Id: <20210204232854.451676-2-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20210204232854.451676-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v2 2/2] dmabuf: Add dmabuf inode number to /proc/*/fdinfo
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
Cc: dri-devel@lists.freedesktop.org, Andrei Vagin <avagin@gmail.com>,
 Kalesh Singh <kaleshsingh@google.com>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Michel Lespinasse <walken@google.com>, jeffv@google.com,
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

Changes in v2: 
  - Update patch desciption

 drivers/dma-buf/dma-buf.c | 1 +
 1 file changed, 1 insertion(+)

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
2.30.0.365.g02bc693789-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
