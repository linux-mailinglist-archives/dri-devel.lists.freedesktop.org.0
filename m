Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4C091BAD1
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 11:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E91C10EBEA;
	Fri, 28 Jun 2024 09:06:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ayIoKq+9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1986610EBEA
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 09:06:21 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1f9cd92b146so1820615ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 02:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719565580; x=1720170380; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Cv3tjdGG97YCwgOlXgEBsrvlHrrgiTFYRDjMKYVYxc=;
 b=ayIoKq+9wcLiXatP0UP/0cvrU19FoFvMq88R/fdA/q2RL6OTQsnQHChGKqEOdBd/Li
 ja+h9EXIjTApswYR72xLIxTBr8P7XjA3yioJ3EX0Xocw1X1OXDZzOJG7pAfb7I5OpyFD
 MQadkb/QYfASXornLkwot5iD91G/8tLVeppkRNz41G2whpkO877ACR8Ik5Lh1TQH4aJi
 IJZU1kEefAB/nSfNGhTDchC1WL79jGAogHZOECdsTWNFyTMmE5tCSKlg+MS2Anscihcl
 ePTXb00YBat0/hPynCOaWfrBYBs6bgG+7g846veQlSwJBgKypInnt64DANGmbtSQ7nvJ
 0/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719565580; x=1720170380;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Cv3tjdGG97YCwgOlXgEBsrvlHrrgiTFYRDjMKYVYxc=;
 b=I9rNlxBjISg5KLN+tfjcZQgzxjdgqnr2QskeAB0VNm1tWuXkcaZM2IZCSTLw/fSAy3
 /jC//CBWfmkNrG9JXUPpJFlxYv7G/FT/gr4OIq08qWvOI8bIXhBMn9r6yx1bkvQIyofl
 3PSrUwLdJO42Bew6kjBxVgfGWM8Eid83MUZX8VO9hutAYdVD6wynZVzecuf1ohVIgP00
 9tsXZ3KpcncXYlsd+ObPqScc38Kml+ICMMxjKtYp5PrZhojZldrcI9dAX1dsLSohsApz
 aS1yyJNqbL03E2LuIBD5E/yjgkgObioftOgPrPT3jSpd0yzW67G2o7r/pOjKEoX4FvmV
 SCKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQmBvA9FgIgAAZQL9EfF9V4UQdSrV5ScaXMEgNVXr/umGc8BlzIa1WQXRse0I1MszYo2S4XfsDKpMt5wmtTVPn4sFnd3fL6iCtE8N+RtJ7
X-Gm-Message-State: AOJu0YzAyJwLjGRyiAAbMEXTi/KxdX3HYs2d5O9dOG8RoVLcK/GK3Ey1
 pdjK8qHy4y96e0mdZImNd6OqdTNEhxPDGAit0+8XdkgH+ow2lEVp
X-Google-Smtp-Source: AGHT+IHxho2IY/KPtiPSOQ+4V3CqX1HJNyhpaejcbnnpb1PpTk/59mlf95gQnvz1ll6XSDBM+JJ4SA==
X-Received: by 2002:a17:903:1c3:b0:1f9:9cdd:dc76 with SMTP id
 d9443c01a7336-1fa1d667d19mr200814765ad.47.1719565580537; 
 Fri, 28 Jun 2024 02:06:20 -0700 (PDT)
Received: from localhost.localdomain ([39.144.106.153])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac10e3a1dsm10473085ad.68.2024.06.28.02.06.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Jun 2024 02:06:19 -0700 (PDT)
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
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: [PATCH v4 09/11] tracing: Replace strncpy() with __get_task_comm()
Date: Fri, 28 Jun 2024 17:05:15 +0800
Message-Id: <20240628090517.17994-9-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240628090517.17994-1-laoar.shao@gmail.com>
References: <20240628085750.17367-1-laoar.shao@gmail.com>
 <20240628090517.17994-1-laoar.shao@gmail.com>
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
2.43.5

