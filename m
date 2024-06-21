Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B5891187E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 04:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FBA10E1AC;
	Fri, 21 Jun 2024 02:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fc+I/LLE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641A410E1AC
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 02:30:46 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-7062bf6d9a1so1240898b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 19:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718937046; x=1719541846; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zt6Zo0BQwE9mYz3Q0zCJOWUGA/XKEFxfC7Idotg6GZ4=;
 b=Fc+I/LLEzqYZLP43tMWtIJdIAg4ugkMuJ+MEAeRzYXa5GNoxXBhcRwKablQcO1JZ9r
 W3PCZJ8M/jtx+Myjjyh/esux/gbBt8WR5lkofQMNiHpmiAKCACW7a1jD2SSOn/KtCtYh
 UXMUmllAujyRfCzwSRf/Gr3/Shbeg2tafnyo2GssSOToeI9APM4K4Laznt7xNSTd5Uwf
 KCwKQBHpg3Ux0nKUsfXMV2S+ZHbG3B3MD0CG5HckJkWh2nxfIyTYR4gHvSMa6hNL04dS
 jQ6UHNvwtF1jWvQFEjqDMjfG8NHIGFepirSTqxwo/aAN/SvwjUPLdWfgSLblCAIcSwnS
 iing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718937046; x=1719541846;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zt6Zo0BQwE9mYz3Q0zCJOWUGA/XKEFxfC7Idotg6GZ4=;
 b=Y25ZkwbgjP7HJft1+hJWXe8RcAYsMsC5Z7q3SOAKB1951/j9gnwTAqj8HzneamrR+8
 Cj5FWkZn9ij/AdU2kWB+MUyfg758xsdV59yvV1xz/kn1lAK4qrQHJ+c7RQSuPbJAiBj1
 aYhVmfkNZfhOENM0O5/Ib5z5XcXO9zlUGY4xK/KmH8S5F20rRDke9h9WH40QQ5JpIbiE
 NawoNuaKbH02/S7RNZMHe61xnov2P13sojbXxhT85EQs6Xo6d6JtXQr/4Msl6sQ3Sw7G
 L/UhgkMfsEqGTKk1JmaFTXQnb3qra59SnHNSareXxheuPYRwgclmcjSnenbJ7ZCaPoFa
 dGCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9CEJ4jrIkqYMY71Dig4sSxpdbqxMGaeJg9LpCx4EWZwo1P4p/dDAwhDM7+5VG7V5FHMSdEaXeC6GBWg3weWgz4uSvX+Cr5o/Sbh6A+8J0
X-Gm-Message-State: AOJu0YyOBYY3wZGrFo/tYGrJdExEjl5FH9tv95w9l3EHjle0EKaaE+Qd
 60Dg+wG9OS1jakcxj/Q5BldtB1m35z5Ew4OzxocMF6CDjYGZwEjf
X-Google-Smtp-Source: AGHT+IGtfjPn4RgUkASb+Xbc5n3FAl++/e74fQb3jmqCcMo9NRTzTfAqzNgZkCzFDeDT/EYbemTCfA==
X-Received: by 2002:a05:6a00:22c5:b0:705:ddbf:5c05 with SMTP id
 d2e1a72fcca58-70629c4204cmr9525016b3a.11.1718937045659; 
 Thu, 20 Jun 2024 19:30:45 -0700 (PDT)
Received: from localhost.localdomain ([39.144.105.24])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-706511944d2sm332488b3a.70.2024.06.20.19.30.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2024 19:30:45 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org
Cc: ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 catalin.marinas@arm.com, akpm@linux-foundation.org,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, Matus Jokay <matus.jokay@stuba.sk>
Subject: [PATCH v3 01/11] fs/exec: Drop task_lock() inside __get_task_comm()
Date: Fri, 21 Jun 2024 10:29:49 +0800
Message-Id: <20240621022959.9124-2-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240621022959.9124-1-laoar.shao@gmail.com>
References: <20240621022959.9124-1-laoar.shao@gmail.com>
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
2.39.1

