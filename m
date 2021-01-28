Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4C5307ED0
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 20:45:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DEDC6EA0B;
	Thu, 28 Jan 2021 19:44:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com
 [IPv6:2607:f8b0:4864:20::f49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ABB36E9D3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 18:24:54 +0000 (UTC)
Received: by mail-qv1-xf49.google.com with SMTP id l3so4335672qvz.12
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 10:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:cc; bh=WO1Ps+Nvd/JhtfCCjwBjp1ZIkFI1epnqyV7iKoI3o6M=;
 b=kRyxNq1z6aP1oLR+T1rDCvOOEGgGBd0NT0WYQCd9JMMaGJ9KZ64ABn23wgetcIYIqk
 UgxIRZh2IxqO8TLPZAYS8UscufK7YBfdmAnzf6Thg7OwTRAEIGh+lDriUPVXWyxVBiTP
 vSV+VOHOKLatUnPHfVn57s9k68KhZe3ouL0kZrzVPeKvib0crdbJF5QcUQ1R/vr/lvxZ
 5FoHOJuQQruMx2fhUaWETT1ilWgTRt+Oqxwg68GfvRRZWi93epDFMlQxz0rY8QA5fdyj
 Y+WmVV46ZuoEnJrUkdOejUENnnnRes25LJGmKOMoa3ThqhEgE87zWQ8qkxgyvDzhhRdC
 5vGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:cc;
 bh=WO1Ps+Nvd/JhtfCCjwBjp1ZIkFI1epnqyV7iKoI3o6M=;
 b=kemqBKkzrUFDdpZZrCUIFfUCVUAWZ5m+xNxfPNrq1KXTcmYEoE+upukdNq0S7VH3WN
 VJKoctvvJGX+i0QFGXxar6kNAugffEX6nbxPGcmvSWEPBwX102kqQUoZdHBYwJC4iUYG
 ug0uNjxI5U4t9kCwRj1KA9fJVMWbef/+nhtq87CnZGUITIMb+0GWcpOwfbF3lwsCAXIZ
 tH7gH3GK7VBEnv7P+HaDGPUAoWmXZBGjGttiXpvDSnRwGbbz9ZxKpCaOt91EqbewAQgQ
 LqVc6gc4GGxy7535W8QYH583V/tPDo+zR6nZgGg03845ayqs2C9kv9bUV3z42cmx3DmR
 Frdg==
X-Gm-Message-State: AOAM5326hgKACwC8yHX5xUgr3LheSY7Urm6Q0pIcypyt/n8weFrZR/a+
 KI2RLbnL+KFhsCxvIBgOk/V8IDPqDw6pZ4TNqQ==
X-Google-Smtp-Source: ABdhPJxHCqtX2ZHgnqn1x3DYKD86aE5WR934LTPVMRYPiTVg9KKNFMi3ScBW4vQ0zl65Lu8rIgzHGPhMjlBRyKwGrA==
X-Received: from kaleshsingh.c.googlers.com
 ([fda3:e722:ac3:10:14:4d90:c0a8:2145])
 (user=kaleshsingh job=sendgmr) by 2002:ad4:4b6d:: with SMTP id
 m13mr614841qvx.56.1611858293408; Thu, 28 Jan 2021 10:24:53 -0800 (PST)
Date: Thu, 28 Jan 2021 18:24:31 +0000
In-Reply-To: <20210128182432.2216573-1-kaleshsingh@google.com>
Message-Id: <20210128182432.2216573-3-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20210128182432.2216573-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH 2/2] dmabuf: Add dmabuf inode no to fdinfo
From: Kalesh Singh <kaleshsingh@google.com>
X-Mailman-Approved-At: Thu, 28 Jan 2021 19:44:34 +0000
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
 Vlastimil Babka <vbabka@suse.cz>, Alexey Gladkov <gladkov.alexey@gmail.com>,
 linux-kernel@vger.kernel.org, minchan@kernel.org,
 Yafang Shao <laoar.shao@gmail.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>, hridya@google.com,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dmabuf inode number allows userspace to uniquely identify the buffer
and avoids a dependency on /proc/<pid>/fd/* when accounting per-process
DMA buffer sizes.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
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
