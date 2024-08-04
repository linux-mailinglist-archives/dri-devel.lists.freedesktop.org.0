Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0838946D24
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2024 09:57:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E3610E090;
	Sun,  4 Aug 2024 07:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GChRmBzt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B008610E090
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2024 07:57:04 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-6c5bcb8e8edso7082454a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Aug 2024 00:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722758224; x=1723363024; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3hHqe/dVMoVlxAlcEkx88W0WqBv09P0jej1HBEqhafw=;
 b=GChRmBztxcXqlVfhPFx4rpkj2eikeXj1RjMOPg2vHwCWnXTKdPETeDmjeuC/8HpXnZ
 tysbzpZch16FXJKQBkoS5/bOshEf5F/9OPlLZAQ9Cx8TnTkJO0IAMVEQDOSYAJXH/tD5
 v0EDNO+iD10VwXWaX280Ssasix2RbHSz36MamxgY7+RPvclQ1FnXqkwBJ1P4PQUguSkE
 LjC6Laz28+agHyADSK9lyT3dHmN39SDYmzRBkkoecU8xhfqXcxmkSMR909vhLiRFR7X/
 JyoS6WLxJWZZi7EaMwanviICfXniSw2RR+qFFNMh+UyfzfbJ5YWsTsZySIgnOsDmluxD
 vtwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722758224; x=1723363024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3hHqe/dVMoVlxAlcEkx88W0WqBv09P0jej1HBEqhafw=;
 b=VQ2C1jzbjfw/bBk4sXOJZZLOj/81pDb6J2qaVEy2v3kVSxEdgWqfrbov3ZXxSxtHaO
 XASLzuqaca/gqQHH1Q8JWR2a6PF7kkXUvTC8jsEleUNJa+/LGH5lp71QCVRnob4a9ogD
 J9V0ZODOtSEL6yDtAvT1Hf/i5mS8QPpYqUJOavltOEZYuHlhXbIMANb+E59jnq5fg5my
 AWQzNT5gjU+Ug9JrVhZ25b9L5dGAa+fvp/k2p4fD+1BYitJRN4YMWiuPi20HKL35ZxOF
 E9EqX02igKyAPDTzDA5vA91OwFRgEhJMEik9RD10eo9dW1j/B0c97/SwdZlW2Vnhh8VW
 mgTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjGPUfkKqq4fFqY8ZxUd2wk7/QeZww00NGiPerChSkiZ4hAXVeXHn5LIyOfJbAhrTROrqz+YRX6BTS4yR8pZF1ST11+lGBJPySnqHL27l0
X-Gm-Message-State: AOJu0YzU+ENhJBTruTce3Fv8BL1x9ElXo+K4cFwT/TvG6kA6NaB7EmIz
 s3umHb6bjJv/thjof/AGAZONvt2X0SYlo0O3kIS7loVpib539FU2
X-Google-Smtp-Source: AGHT+IGGd4NHuT97uC6xOQQvHv4GaxRo9+Vf+VhHCShMz8IgX/0qP5KyCL4xcS6MgRK6pPd/R/ObqA==
X-Received: by 2002:a17:902:f685:b0:1fc:719c:5f0 with SMTP id
 d9443c01a7336-1ff573e75a3mr134700565ad.49.1722758224055; 
 Sun, 04 Aug 2024 00:57:04 -0700 (PDT)
Received: from localhost.localdomain ([39.144.105.172])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ff59178248sm46387605ad.202.2024.08.04.00.56.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 04 Aug 2024 00:57:03 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, ebiederm@xmission.com,
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, catalin.marinas@arm.com,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, Matus Jokay <matus.jokay@stuba.sk>
Subject: [PATCH v5 1/9] fs/exec: Drop task_lock() inside __get_task_comm()
Date: Sun,  4 Aug 2024 15:56:11 +0800
Message-Id: <20240804075619.20804-2-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240804075619.20804-1-laoar.shao@gmail.com>
References: <20240804075619.20804-1-laoar.shao@gmail.com>
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
index e55efc761947..6a0ff2e3631f 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1195,12 +1195,18 @@ static int unshare_sighand(struct task_struct *me)
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
index f8d150343d42..71002f0fc085 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1096,9 +1096,9 @@ struct task_struct {
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
2.34.1

