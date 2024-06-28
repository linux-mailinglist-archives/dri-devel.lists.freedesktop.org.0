Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5C291BAB4
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 11:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE43910EBC3;
	Fri, 28 Jun 2024 09:05:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EOKJRzAy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 525CB10EBC3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 09:05:29 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1f9ffd24262so2091245ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 02:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719565529; x=1720170329; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/dYktotwfBu6Roz80A5YCXaIPxsklnKpN0JVw9YLBJ4=;
 b=EOKJRzAysVAMU7eicxAcrFaX8gyHXE81P3NBrPv9yFblilP7GEaT3+BjALpZTjFhyZ
 ZWodpg3VKXLEJOF2u1Lwrmkv8OjFFTx8EoC1gGUmHlvWEmgLWLnR70wvzvT24rDl+b5N
 CIzCGqKoMxKEjTyOLVdOYjUC75VpllyXlT5BsDFbv4iCFj0aoeotuAtMxoKdUxEcJGd7
 eSzU1ZhXBIGttDtLsSwN37TPvvx/jvJy+p4C986kmviByBWedhkBZ4RGqD8D7TX/dL5Q
 IZQZkfxnznPS3FWSrgWuMy/Vy+Q8aPVGRPYHEdZ76S/hJGtZyFfVEmsOkz9VEBcYxL4J
 EKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719565529; x=1720170329;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/dYktotwfBu6Roz80A5YCXaIPxsklnKpN0JVw9YLBJ4=;
 b=uj8qO0ndw1pp1xr5CFSrcOZLgrpffeydi8ChQqHn46V3tBp4L8P1ahaBqfHzIK3y92
 yMe1HoZ/JG7nqvBlVSU1xT948rxzHSkPskXeWhRL2S33G9SIdIj3YwOlGWo1I2Ack4Fw
 iExL/dY6BW5I7krUACcHoSj/rmwEYCGmyEGXzYyZ7M+qJq0YoQm9YIGP2GcI6Ao8+TOX
 MXnUaTPhES5cWMDfLvC+eB4XSC4hMFrcLaucVHFxoaN1iZvv59a/42Md6QnfqerrO3jo
 lHm1NPOJw5QXVo/rjZIxEyjX80VPvdMbA4dZC5jjwZVPxQa1ImnvxvqvTIzIq+axhQgL
 z1dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWG/Egx3wZGUTLARbVEIIe3KC5Io3MIMgR+j2rycl9XvNH4HB4wIYYwe5Vb0RNXPiPss2wbzAQpmMjbT7NZdW9NTYgPkAwph7l7iXVPbVFE
X-Gm-Message-State: AOJu0YzZCx8gBZcwTdbZfx4tKCxMvjhNyJaiqLAz0gG9JGKcXXA/6Ty4
 Bvg+kQJm1tkNcI1fOqqmlt3lc6mxBln70MkC74+gMCiKHMYUCar8
X-Google-Smtp-Source: AGHT+IHq12/wr4f/48x7wfiSbegh8HPUA/2boo4oAyw8ihJMGtAi4AloztlVccxiTIt0WgGf0DVrww==
X-Received: by 2002:a17:902:eccf:b0:1fa:3f05:20b2 with SMTP id
 d9443c01a7336-1fa3f05244emr164534885ad.65.1719565528645; 
 Fri, 28 Jun 2024 02:05:28 -0700 (PDT)
Received: from localhost.localdomain ([39.144.106.153])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac10e3a1dsm10473085ad.68.2024.06.28.02.05.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Jun 2024 02:05:27 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org,
	laoar.shao@gmail.com
Cc: akpm@linux-foundation.org, alexei.starovoitov@gmail.com,
 audit@vger.kernel.org, bpf@vger.kernel.org, catalin.marinas@arm.com,
 dri-devel@lists.freedesktop.org, ebiederm@xmission.com,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 netdev@vger.kernel.org, penguin-kernel@i-love.sakura.ne.jp,
 rostedt@goodmis.org, selinux@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, Matus Jokay <matus.jokay@stuba.sk>
Subject: [PATCH v4 01/11] fs/exec: Drop task_lock() inside __get_task_comm()
Date: Fri, 28 Jun 2024 17:05:07 +0800
Message-Id: <20240628090517.17994-1-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240628085750.17367-1-laoar.shao@gmail.com>
References: <20240628085750.17367-1-laoar.shao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoted from Linus [0]:

  Since user space can randomly change their names anyway, using locking
  was always wrong for readers (for writers it probably does make sense
  to have some lock - although practically speaking nobody cares there
  either, but at least for a writer some kind of race could have
  long-term mixed results

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://lore.kernel.org/all/CAHk-=wivfrF0_zvf+oj6==Sh=-npJooP8chLPEfaFV0oNYTTBA@mail.gmail.com [0]
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>
Cc: Eric Biederman <ebiederm@xmission.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Matus Jokay <matus.jokay@stuba.sk>
---
 fs/exec.c             | 10 ++++++++--
 include/linux/sched.h |  4 ++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/fs/exec.c b/fs/exec.c
index 40073142288f..fa6b61c79df8 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1238,12 +1238,18 @@ static int unshare_sighand(struct task_struct *me)
 	return 0;
 }
 
+/*
+ * User space can randomly change their names anyway, so locking for readers
+ * doesn't make sense. For writers, locking is probably necessary, as a race
+ * condition could lead to long-term mixed results.
+ * The strscpy_pad() in __set_task_comm() can ensure that the task comm is
+ * always NUL-terminated. Therefore the race condition between reader and writer
+ * is not an issue.
+ */
 char *__get_task_comm(char *buf, size_t buf_size, struct task_struct *tsk)
 {
-	task_lock(tsk);
 	/* Always NUL terminated and zero-padded */
 	strscpy_pad(buf, tsk->comm, buf_size);
-	task_unlock(tsk);
 	return buf;
 }
 EXPORT_SYMBOL_GPL(__get_task_comm);
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 61591ac6eab6..95888d1da49e 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1086,9 +1086,9 @@ struct task_struct {
 	/*
 	 * executable name, excluding path.
 	 *
-	 * - normally initialized setup_new_exec()
+	 * - normally initialized begin_new_exec()
 	 * - access it with [gs]et_task_comm()
-	 * - lock it with task_lock()
+	 * - lock it with task_lock() for writing
 	 */
 	char				comm[TASK_COMM_LEN];
 
-- 
2.43.5

