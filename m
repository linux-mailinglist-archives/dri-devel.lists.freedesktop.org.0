Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0F5906899
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 11:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D0FD8926D;
	Thu, 13 Jun 2024 09:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZwhPghxH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63FAF10E960
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 02:32:06 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1f4a0050b9aso4929595ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 19:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718245926; x=1718850726; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HQT31JSkonb7Xmqn+k1uqrjgngeoHr6IFKrX/+KN6Ok=;
 b=ZwhPghxHBurUUIuCXnYUltvOD/m08/tgeoDoSLYqL6O0gn7rbjeKS4VAmRpkSJLX7z
 rf2HdBl9AGJGryY9gFn1a/l+2tPtdlDLvRWvGrQxf8rmNEmjVn0uviOi05ysxmcqZx2V
 XziEieb37GU+Arnctec3XQbhGUdA6GLYrS4lWj86VNwo0WpHYWYLTcD0Ma4+byCzbRjR
 PrwnbKtkh3nnTf+qojxwpZUKwIfP20vf6SpFuDUbKIxbFCMoKQQP3xUwuYOwao5HbzPO
 Rz84bLAuz4g7mA6PuIna1FezqVufaWrOOf4CFT5fPkam708jJZPdC8N5A36C7GuiJyjy
 ROzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718245926; x=1718850726;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HQT31JSkonb7Xmqn+k1uqrjgngeoHr6IFKrX/+KN6Ok=;
 b=PDTzDQDuwUVAOsAca5qVheaqxfJFNjS7vMWvW6URRoCUX9OUktVJcllWHDti5HIN5h
 5ocX6CXbHmeIj70sc+QsYGXD8tIEyJzz2A6HUPBHj/W/wpk1aTZZ11iX9IdWnbXu5NSo
 17gUA6bL4nxbfzR1R7ywleat+fWGLdvGkXKhu5+4gnB6QMMwWVfG/jV7QN5eNK1TOwXE
 OiMkvpw8AVmgpvwnnkUZfoDQRz8/3VvyLcefwGsfvaKVLI/AzqRxrwcqJ2cJ3o+CsrPa
 a+WsQ191WJz1pF0kjimNG3FSfi06y+c0Rya7EYUEULZXgLrEqhSlpnFnGeJmc6CEYgK4
 Rj6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxJGgjepLVo8QMK/Cgg1mOTL8+/UfOumKFyo7UXJ+7zzQE07R6rb3JGlz5k/BsuBBKmcIad7UAIHYEaV6FySO+Onz46M7fSLHRAwLyS2V5
X-Gm-Message-State: AOJu0YwQeZ8n06V9OIj6IJfmGPa8LOAGxRzLPv+yEnw2qOOSKHNZPwQM
 If7/bbxkbQGT4tFbB9WRgvztsyL1eRHkbij+C6Q9lvPRvl+ggfkR
X-Google-Smtp-Source: AGHT+IE/Thj9zy8OzNEgltY85A2YMlP/9PBe6RK31xV6C4QSBrLzPw+agMFJyhDUlBI6xydC6ujXaw==
X-Received: by 2002:a17:903:1c2:b0:1f6:89b1:a419 with SMTP id
 d9443c01a7336-1f83b5583a6mr41814045ad.17.1718245925584; 
 Wed, 12 Jun 2024 19:32:05 -0700 (PDT)
Received: from localhost.localdomain ([39.144.105.92])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855f4d159sm1755695ad.289.2024.06.12.19.31.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2024 19:32:05 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org
Cc: ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: [PATCH v2 08/10] tracing: Replace strncpy() with __get_task_comm()
Date: Thu, 13 Jun 2024 10:30:42 +0800
Message-Id: <20240613023044.45873-9-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240613023044.45873-1-laoar.shao@gmail.com>
References: <20240613023044.45873-1-laoar.shao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 13 Jun 2024 09:26:30 +0000
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

Using __get_task_comm() to read the task comm ensures that the name is
always NUL-terminated, regardless of the source string. This approach also
facilitates future extensions to the task comm.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 kernel/trace/trace.c             | 2 +-
 kernel/trace/trace_events_hist.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 578a49ff5c32..ce94a86154a2 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -1907,7 +1907,7 @@ __update_max_tr(struct trace_array *tr, struct task_struct *tsk, int cpu)
 	max_data->critical_start = data->critical_start;
 	max_data->critical_end = data->critical_end;
 
-	strncpy(max_data->comm, tsk->comm, TASK_COMM_LEN);
+	__get_task_comm(max_data->comm, TASK_COMM_LEN, tsk);
 	max_data->pid = tsk->pid;
 	/*
 	 * If tsk == current, then use current_uid(), as that does not use
diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index 6ece1308d36a..721d4758a79f 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -1599,7 +1599,7 @@ static inline void save_comm(char *comm, struct task_struct *task)
 		return;
 	}
 
-	strncpy(comm, task->comm, TASK_COMM_LEN);
+	__get_task_comm(comm, TASK_COMM_LEN, task);
 }
 
 static void hist_elt_data_free(struct hist_elt_data *elt_data)
-- 
2.39.1

