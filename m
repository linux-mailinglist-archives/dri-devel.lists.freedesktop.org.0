Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C59E94E4EA
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 04:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1580010E04B;
	Mon, 12 Aug 2024 02:31:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KwlWjRqT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6928510E04B
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 02:31:18 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1fd9e6189d5so28754955ad.3
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2024 19:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723429878; x=1724034678; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qdEfItmwefU07w76SDkXtsO/LaxPCVZAR+StHmo8iTc=;
 b=KwlWjRqTNw+vBV9AtrZSR1TPKWKGiCLqPajOUZWfpW+KtHN34OyUaFYJYM7E1YsQvD
 iNn9neJXJ1mIQ6PfVoeXDoD3jCW0LSsvpQU/wGKwnSKCdxP9HAkgdc8HfrX2nSEPj6dv
 QBicDgQykGfjZHM5JpCkpxiwGZnHfxuld5h8Ni/D3De21bkY6Ctkzf08RmU74n9ppoW7
 UX6qglUYSeMQMuMHgNt5ED+nqdW9dbnfsto6OhBi6zw3yNOk9JQ8s+S7vdOo1OtT6K+p
 de1hQ9IXejjov1o7TFLRyX8uvFWQ59l4jB6tjz/8bAIpjpH49swyMKjJBwuCSxYC6FMg
 wZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723429878; x=1724034678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qdEfItmwefU07w76SDkXtsO/LaxPCVZAR+StHmo8iTc=;
 b=RFVKO0MXkSqvT//3UExyrt45za7hLNnt5c226xF7OgnzUaT2PglGxasaObL6aP0vV9
 yAsFJWjiFc27iibHPL32QeSA+ULSrNREyiKf/seuyDCLZGJW+/yP1llXcp1XFwdTDcXv
 uDLOeZzIMdDWC4Qs18+gEyFpd99yaLuPpSzr9yIOPTFwZ1DCFh6Xvqck09o9++qBHFM3
 GvOoHavKY/bn8GUugO2PfpiD64L8iXnnqHvnyiTLcob4c67CjJ3KrxtPMJWZqabKkiEo
 ARIRBgCpdodsJE4hd/8N8F/gzEFsg8RmKdhYskY1Bzyn8obLU2kjDdYxSfjOT5SqkAOP
 bUrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC2HeuaIGxLWkulie3ahtdQWYwEWS03MDiL+Dl4FHle+xIc/gdYKhG+U4+ObIQ4RPYu4FeZQFljCuZa1ADcig2/R3GYgI24w8DzfzvtgTr
X-Gm-Message-State: AOJu0YxhyJ6pRHad2agR2F3bikG0OEZQ4TfsrTEITfLduiMjK2jLNpkk
 k6BprC7kln5ORJsderRO5ZP+VvUXGqI53IEdtmm7Egd05rF11Hzj
X-Google-Smtp-Source: AGHT+IGvMeJ1WDvZRyKICOlWBdf489ybDgp4ZGppLiFztYYS3nDRhT+W8sx80+j2UnrjElUuwI0I0g==
X-Received: by 2002:a17:902:e804:b0:1fc:57b7:995c with SMTP id
 d9443c01a7336-200ae4dba44mr56315805ad.7.1723429877770; 
 Sun, 11 Aug 2024 19:31:17 -0700 (PDT)
Received: from localhost.localdomain ([39.144.39.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-200bb9fed69sm27884765ad.188.2024.08.11.19.31.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 11 Aug 2024 19:31:17 -0700 (PDT)
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
Subject: [PATCH v6 7/9] tracing: Replace strncpy() with strscpy()
Date: Mon, 12 Aug 2024 10:29:31 +0800
Message-Id: <20240812022933.69850-8-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240812022933.69850-1-laoar.shao@gmail.com>
References: <20240812022933.69850-1-laoar.shao@gmail.com>
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

Using strscpy() to read the task comm ensures that the name is
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
index 578a49ff5c32..1b2577f9d734 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -1907,7 +1907,7 @@ __update_max_tr(struct trace_array *tr, struct task_struct *tsk, int cpu)
 	max_data->critical_start = data->critical_start;
 	max_data->critical_end = data->critical_end;
 
-	strncpy(max_data->comm, tsk->comm, TASK_COMM_LEN);
+	strscpy(max_data->comm, tsk->comm, TASK_COMM_LEN);
 	max_data->pid = tsk->pid;
 	/*
 	 * If tsk == current, then use current_uid(), as that does not use
diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index 6ece1308d36a..4cd24c25ce05 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -1599,7 +1599,7 @@ static inline void save_comm(char *comm, struct task_struct *task)
 		return;
 	}
 
-	strncpy(comm, task->comm, TASK_COMM_LEN);
+	strscpy(comm, task->comm, TASK_COMM_LEN);
 }
 
 static void hist_elt_data_free(struct hist_elt_data *elt_data)
-- 
2.43.5

