Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78161946D44
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2024 09:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C0210E0C3;
	Sun,  4 Aug 2024 07:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W6nivcY/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F05510E0C3
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2024 07:58:37 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id
 5614622812f47-3db2315d7ceso5601710b6e.1
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Aug 2024 00:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722758316; x=1723363116; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hHFsexRAvS3+Twdq3ZGpnUTD4jZRkYjFMffxIhD4B7E=;
 b=W6nivcY/2Qn+yajjHWxxeoDoVl86XQIPqaylEk7zhrgp21pxOyPcdIYo+9H7KSvgVi
 n72tBXifE0oGcwlMOrke5w/XIWUku64SRTLkOqmpIMc2AXvGm0MkiMHtnvYD/YiKr+hR
 M94OWbVwtKRH3tz71CUrWo+6p3sh+hZykiPFb+5RtalMVhkLYY8mqJNpy8b40jfnxA6b
 fgv2sq4PldCO0Q0nKTueN4CRCvbBYsvDAMEijNigu6fCGeNgU0++h2ZwPRYQfK0tW+/a
 ZzToltCDgqyR3ut1GhIy6WR3BswBkFO2zcHyQeNI+/kqFbbBDCx7XY/9MTZ1MSOYRzxz
 Kghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722758316; x=1723363116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hHFsexRAvS3+Twdq3ZGpnUTD4jZRkYjFMffxIhD4B7E=;
 b=izcwOX0AnxmzO/vtL8Qukfe+8+1lGKcbuOVmjE/izQVp0CCQMd+e3IOsAwf453Kw+G
 hexUGs1DHzZjll4ZbyJJwMsCjeofRfzvUqw3aRYuja80b1yqw8va8sGp8BGAnhrp1uqZ
 cA2eeOIzZtOAPv+QetjZinqXdrSAZLqlgNJQVYkq85iX4hles8AnKd/aBr/o966Xbc3t
 KClWz5ZcadSlb8yW9WjsgWK8bYSgpwIcLzsudWGuF+6yq5UnQpAy/QtuZttZWAGnQ/Xd
 IHD6kkd9roUn3jbvy7BGMklLYgtt0kS0V79/gh9aSa9Zk/qU7gfZVYTEOXlA8AuS9Y8j
 0PEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWj7hKIgvdXhsYr/S5MGdf5x+LEWCQnVw/TvrhcrSmVdZLR0h1SoIDM/lWzF7OfyC5rJX0T4ngbUSs82VXhia2fRGP1LoAUYILpU8dWT99A
X-Gm-Message-State: AOJu0YwbLhAVF+jd0tb4lRiyv8vvixnDRbTj1+fDQh76FPQ1ly7nmQlh
 yogN10i8TrGqQWF7zTqJVDYrjYM6AqMskhzjNqWdZ5OziuZoZBKA
X-Google-Smtp-Source: AGHT+IEQdsxKAJTw4i+uNNPkbgE3NiIW5Ir2yWohAneqMp4vDkArZBqW84U9DpBffvNg6sRs26e7Fw==
X-Received: by 2002:a05:6808:212a:b0:3d9:2562:7541 with SMTP id
 5614622812f47-3db5580f273mr11989986b6e.24.1722758316365; 
 Sun, 04 Aug 2024 00:58:36 -0700 (PDT)
Received: from localhost.localdomain ([39.144.105.172])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ff59178248sm46387605ad.202.2024.08.04.00.58.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 04 Aug 2024 00:58:35 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, ebiederm@xmission.com,
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, catalin.marinas@arm.com,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: [PATCH v5 7/9] tracing: Replace strncpy() with __get_task_comm()
Date: Sun,  4 Aug 2024 15:56:17 +0800
Message-Id: <20240804075619.20804-8-laoar.shao@gmail.com>
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

Using __get_task_comm() to read the task comm ensures that the name is
always NUL-terminated, regardless of the source string. This approach also
facilitates future extensions to the task comm.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 kernel/trace/trace.c             | 2 +-
 kernel/trace/trace_events_hist.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 10cd38bce2f1..985d2bf2bbc5 100644
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
2.34.1

