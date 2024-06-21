Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 342A69118A2
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 04:32:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B6E10E900;
	Fri, 21 Jun 2024 02:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yk3NkvDt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FB4110E900
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 02:32:26 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-7041ed475acso1456252b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 19:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718937145; x=1719541945; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HQT31JSkonb7Xmqn+k1uqrjgngeoHr6IFKrX/+KN6Ok=;
 b=Yk3NkvDt7ur3k5ON3R/nWjE9tnnqGlJrcWrNky6cXlO5PHaAx0VZAnouZS0mlCnx9I
 8Fyifx2kHf8PsgnPaq9n7b66KYkQSgrwq1lNBC5rdxgVFVm/aKgh42Nj2TAmNM+evkWd
 Z93BD+cG8mCzuIYHSy3vPGOE2eJLD0YO+ipgk9V8SPygZsd22Sj/QLE5zCBZ7ejXkyiP
 TFXrxw5fYDaP2jpXS8D48m3w1Og1Hju4dq8nr7izNtnX5JmOrBDpw9jx56epRX3t4jO9
 UytnEbgIAmz9NStpA9ki/hr13nx8gCI2VYaTIVfLGkYndPBWXzmMDMTaTmgEC+rzP8De
 uTYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718937145; x=1719541945;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HQT31JSkonb7Xmqn+k1uqrjgngeoHr6IFKrX/+KN6Ok=;
 b=JWvznIO3vwbhINxiFZtIRKYn9x5PoHbgUcHE9Ds/V/xmAGfjn/+to6rtwBoA4BL4Nv
 Av85htywQ7VFa0o1tKtr5FYhlIcgJQ8Fte5hSiUxagpviRCUJi7GEqZhccdm/IA9vOSW
 LDB+pAg8WZI1+Nmk4sYIWxFQBxJpWxv3UNL63p+Bk8NyZM4AVW1RyfRyM11liUC+PLU4
 B7drZn0GVhhzW7LPCOH93VMAewwhddfzwj15QyHOARofx2qObiWi4Fbmal42QDCyAtlu
 5EsJKHG/1qLYSdQO5FgfJY+ySaEp3Ma0A3sbjdea6jc9GvylhgvixrT7PeSQz43zlYjz
 QzZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUV47y7stJ2Esw5PfRS2YptdsSJ7CLCM8fgMdXJtWFOduqAQxUMZWHfAKbLEprKUuvc+70ULQOxotLXKsGaTAsESqQhNmuuC4Cc1mJs5Dj9
X-Gm-Message-State: AOJu0YwaqKsJQChXfrhcxpe3IQCg576OZ1iXkOrj/JaS1V/KWoiTYH7h
 N+rYENX9yTYvw0TeFymlDQRwjDohQJ+TTw0F5zpwut7uPSXFMUAb
X-Google-Smtp-Source: AGHT+IGhhQvd2U/sH2KdV0ZtBjJthL8CznXxKI/3OBzCZg9mpyXqgc1aLbbwbnNImYe317PDiBUknw==
X-Received: by 2002:aa7:8b0f:0:b0:705:d9e3:6179 with SMTP id
 d2e1a72fcca58-7062bf98e16mr5991736b3a.26.1718937132481; 
 Thu, 20 Jun 2024 19:32:12 -0700 (PDT)
Received: from localhost.localdomain ([39.144.105.24])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-706511944d2sm332488b3a.70.2024.06.20.19.32.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2024 19:32:11 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org
Cc: ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 catalin.marinas@arm.com, akpm@linux-foundation.org,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: [PATCH v3 09/11] tracing: Replace strncpy() with __get_task_comm()
Date: Fri, 21 Jun 2024 10:29:57 +0800
Message-Id: <20240621022959.9124-10-laoar.shao@gmail.com>
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

