Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C9593EB57
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 04:38:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DCB810E1C0;
	Mon, 29 Jul 2024 02:38:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KginXM6C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB8610E1C0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 02:38:37 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2cd2f89825fso1631287a91.1
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 19:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722220717; x=1722825517; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/dYktotwfBu6Roz80A5YCXaIPxsklnKpN0JVw9YLBJ4=;
 b=KginXM6CGWAuHMxnWr08Dj1Gw2A5ajiaTxh+j6DTRSmB67DFGlTDtzFpopRfBcySX1
 wV5hmun9Cw0vbKlL47B5h3sR1cBLBMppredNmpj5N2tL4ta9URYQQd/n1+byA26hXOu1
 g3SQiksBkGZHJxL24MTcbKoV90zpOlJsv+2L0j2YvZSJrbQRoqX+5kPc0WvUVwe2wm31
 cu6wUSeDUnSi0riNO/c90AgVdTjFGPHdTuOffy25m+sB64cSOs4AQnNWbhVr1qpsIgzM
 J1uUO+l75sWECUyD+TOIZ5gTLdr1bwbYTnzo/GwKavoDr9s2CpoYl74iJ+DnEQwkoFoQ
 MQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722220717; x=1722825517;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/dYktotwfBu6Roz80A5YCXaIPxsklnKpN0JVw9YLBJ4=;
 b=HWpe7PgMlKDsKWH94kRH77EE25gns0h+Wrs2ev8dTtw1ln9LxlZAbjDScSm6KODCVv
 1krqLRU7dzc6K++gfKK3wBBFsPqtDh3fHsXX668YH3p6d2L+qkOpsJieRmnBKPHCzACC
 zMtBfZnbA9vMravoS9A8+nv8bjlN4+t1bgzealCMkT13K8QHXI8MrEidmh+U/nQkwfhV
 5KvN+bMnkmbgOVsw73zv/2Yg8d+0FdynykwY2bGKUB0Y+Z6CBS11Y05uliylWO85Y+Qp
 2QYbVHtlfCulB1yt1j9YZkustFHGbPCKlYYbabi9oMHackaiOox0JhjH/wP817lIEdcU
 4ubA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAKx7171RIMZ5OJPesZ0QWZSPNspkj3bj94QoeXE1wz3a7V+ZsLigaTGVBtZkS/13HPWXDYBegTniUwjiNr/Ey6xLP3WQ+12XGs0XvQtYd
X-Gm-Message-State: AOJu0YyDx+KbYduCyFWWlu2hZWYXrvqSRp9+mHeI5VlCYgSrIXttR4z2
 +8wpNM1kngI2wX6w3rTu5+5IwyuTfqiULRQjgBfjQAiCuim5CP1l
X-Google-Smtp-Source: AGHT+IEUvSCxvTt2iFtiQZnOEMmTj53JiCANDbCPnBaNHXCCebMev5gTq4Ke5agmpYOP2sLQoQ29tA==
X-Received: by 2002:a17:90b:3793:b0:2c9:5c7c:815d with SMTP id
 98e67ed59e1d1-2cf7e2275d2mr4251165a91.22.1722220716985; 
 Sun, 28 Jul 2024 19:38:36 -0700 (PDT)
Received: from localhost.localdomain ([223.104.210.31])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cf28c55a38sm7332247a91.10.2024.07.28.19.38.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 28 Jul 2024 19:38:36 -0700 (PDT)
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
Subject: [PATCH v4 01/11] fs/exec: Drop task_lock() inside __get_task_comm()
Date: Mon, 29 Jul 2024 10:37:09 +0800
Message-Id: <20240729023719.1933-2-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240729023719.1933-1-laoar.shao@gmail.com>
References: <20240729023719.1933-1-laoar.shao@gmail.com>
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

