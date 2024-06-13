Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20847906898
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 11:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3CE10E9C9;
	Thu, 13 Jun 2024 09:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jhwipbGH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31D710E960
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 02:31:11 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-6c53a315c6eso393872a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 19:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718245871; x=1718850671; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zt6Zo0BQwE9mYz3Q0zCJOWUGA/XKEFxfC7Idotg6GZ4=;
 b=jhwipbGHqhe0gib78A5WHgcMsExTtIxJCyvJXMyyv82LZ/qgojA5OXKR3Hg8u6FYMC
 vO5GICsi0Otf+hPML69UHGs21GvCLA9iBBoj/k4RBFZrnTc0kQDfrWAerTGr3AhmqhCn
 MfPBW5LZSkOVYuA3boXQiBy1AoOPqxHldk4JEfnh9NRQDU8BukshGaXJ9Z7566n68lkx
 dkJkQ6tcfueO61u/aSsMCPMRqHcU3X5/+rQ3u1kkQ6Z0E+Kx5ghO+AdvA7G3JOgE2/Ek
 YcuyhYmvrx93ko15K/FymO3IHDt3v/mXBSejLSWjl1S8vTIzc1NZpRjJ40Kb9CG5evHF
 6skg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718245871; x=1718850671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zt6Zo0BQwE9mYz3Q0zCJOWUGA/XKEFxfC7Idotg6GZ4=;
 b=PNJlsNlH4jqIgRWG0s9a+YnZ49L0pxkneUhulBaCh5R2nhXiM0gq5mYyCYuFoyDfaZ
 TENP0jG1gVsbTxJerINrhzBwXY80ERtH0+dSzgxLK9RfTAu1OgP00UbKb8dHzljRN7La
 hYjTrotJhOwRTBOz3vZruESg4AuBxKFZzePXvmLEwykYYhJunlfetd/2oIB1XRiRRupd
 amSkjq8IQm1p2x33iRFtFAEd5tc7/Vx4FrBC9FpvcT908teHtoBCAbb6w73URfBqKMNE
 GdiR4OW7pLZfFUzu8pN5bXKAvAhecHRK1zEyLDrqSx2Wzwl6f2vG7sG1qDRNMvOhXJdI
 ZvDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+IrMWAuyjwGQZlo8DWTFVkJnJ38+6vHjfAQAnyHy2u9zybpq7/d9Eq+DYCaDmerwVX2RPxjwPKLQx11bScSoudhtL0882zJVEfUCXyP/4
X-Gm-Message-State: AOJu0YxPaSq8QtRa9Li1gKdi0EfPjFj1YwIsf2BDYjU1fa0iXxptYgDL
 S1RmRWcoVXb7wzTAxaxGxeNpj/vKT5BHbzKVx6YNSkzc6c2ReutO
X-Google-Smtp-Source: AGHT+IGepHvi+lKqMo1GYaife0L6fUJVRPiktMyHkXeHwR+7tr6qOJAeLHRN5Lin69VRxAqus5DeJQ==
X-Received: by 2002:a17:902:ecc1:b0:1f6:6ef0:dae4 with SMTP id
 d9443c01a7336-1f83b5f3fffmr43616545ad.32.1718245871101; 
 Wed, 12 Jun 2024 19:31:11 -0700 (PDT)
Received: from localhost.localdomain ([39.144.105.92])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855f4d159sm1755695ad.289.2024.06.12.19.31.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2024 19:31:10 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org
Cc: ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, Matus Jokay <matus.jokay@stuba.sk>
Subject: [PATCH v2 01/10] fs/exec: Drop task_lock() inside __get_task_comm()
Date: Thu, 13 Jun 2024 10:30:35 +0800
Message-Id: <20240613023044.45873-2-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240613023044.45873-1-laoar.shao@gmail.com>
References: <20240613023044.45873-1-laoar.shao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 13 Jun 2024 09:26:31 +0000
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
2.39.1

