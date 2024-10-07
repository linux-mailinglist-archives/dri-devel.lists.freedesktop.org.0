Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 940BD992FD0
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 16:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DFBC10E3BC;
	Mon,  7 Oct 2024 14:49:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G2UFD1xS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A81710E3BC
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 14:49:57 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-71df2de4ed4so1276559b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2024 07:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728312596; x=1728917396; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4ED8sTWekie9637+cHBCmQFpLStnm64j/0llImVgOxU=;
 b=G2UFD1xSzSKQWKRxL14keOkdaC2SnHHBsg0p8oGFId/GLG9MLytavLGY7lb00YnDB4
 p/tCE8I16CEYGPjGVV2V+GjRcLLrY0/+NGV4f6ZP9oLZQnRJWLyBDMkJH5Y9Nuc9oTlA
 oQOxjf5g6fNtIF93ic2wngpB0NF3GrY901B6MZvbUsOTNG2uZgiPCxT7Mjxd9tnD75VC
 qpWvqWIXfmUJAOOp6Q0TY4z1bzHv0J7fjbfQJEVTJfo4v0ohytbUoniEglTVEEa2b4IN
 VTu+AmKpz8bwR5/hCWS0UQs+nMF8G+UUQPYOt501UJG8/wWafB5jcPpQTGJN1WXHlRGb
 5yLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728312596; x=1728917396;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4ED8sTWekie9637+cHBCmQFpLStnm64j/0llImVgOxU=;
 b=YxdfIYFDDCNIb679NBVg+klFsZXTmXijcSZUJYEAURWIrbw/cFDqqFeJMseL5+bSvl
 Oa6yxe2w0sXQ8dvLXehToHYd54EEgvmklchkYOwAkHCyjEZrygXegxRjTdBRvpwf/uoW
 z7zwe1yHl22TwXHLsXyS53a4sCowin+/03tQH442Yxeqc7ByeMHaScjhTB5FjY5TocnB
 WbTHYd/Me/PkhLN16CzJ7RwTYlErw1eP3ppkmlR068LYJ8+lk8JFC/gPjm/P7yEqk7ZF
 IUlX/6Qcn4ORsBdmA0Q6URCvYL2Z+GNPEUVzh1C5QXz+RUaIZArE1CMvZIFqhwdxFGBy
 9LOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhOw2qg4G0Hs1OHy2HZ1VwSWf7Gyu1HNEqVomvdHI3NHkiVTWH8OOotFt4uD5Gh0X9ryHbw2tG62w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxE6AvPWOj159f2NoXRAFVrB3Jeivf3uM6oyrCHceSbETo0jAfO
 sTOV4GIq+gpxVlVoqec9zgYMyph4cKJv2dhvQsANmmedIujZy85s
X-Google-Smtp-Source: AGHT+IFSfr8aGR6hntBNP4HQUskHiw0vm/RzkrWx6VpNUZENgDQ4iLauIOQbi4o7xjraSFHRBCGRjw==
X-Received: by 2002:a05:6a00:2316:b0:71e:1ad:a4a2 with SMTP id
 d2e1a72fcca58-71e01adb733mr6378569b3a.13.1728312596499; 
 Mon, 07 Oct 2024 07:49:56 -0700 (PDT)
Received: from localhost.localdomain ([223.104.210.43])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71df0d7cf82sm4466432b3a.200.2024.10.07.07.49.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Oct 2024 07:49:56 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, keescook@chromium.org, alx@kernel.org,
 justinstitt@google.com, ebiederm@xmission.com,
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, catalin.marinas@arm.com,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>
Subject: [PATCH v9 2/7] auditsc: Replace memcpy() with strscpy()
Date: Mon,  7 Oct 2024 22:49:06 +0800
Message-Id: <20241007144911.27693-3-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20241007144911.27693-1-laoar.shao@gmail.com>
References: <20241007144911.27693-1-laoar.shao@gmail.com>
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
Acked-by: Paul Moore <paul@paul-moore.com>
Reviewed-by: Justin Stitt <justinstitt@google.com>
Cc: Eric Paris <eparis@redhat.com>
---
 kernel/auditsc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index cd57053b4a69..7adc67d5aafb 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -2730,7 +2730,7 @@ void __audit_ptrace(struct task_struct *t)
 	context->target_uid = task_uid(t);
 	context->target_sessionid = audit_get_sessionid(t);
 	security_task_getsecid_obj(t, &context->target_sid);
-	memcpy(context->target_comm, t->comm, TASK_COMM_LEN);
+	strscpy(context->target_comm, t->comm);
 }
 
 /**
@@ -2757,7 +2757,7 @@ int audit_signal_info_syscall(struct task_struct *t)
 		ctx->target_uid = t_uid;
 		ctx->target_sessionid = audit_get_sessionid(t);
 		security_task_getsecid_obj(t, &ctx->target_sid);
-		memcpy(ctx->target_comm, t->comm, TASK_COMM_LEN);
+		strscpy(ctx->target_comm, t->comm);
 		return 0;
 	}
 
@@ -2778,7 +2778,7 @@ int audit_signal_info_syscall(struct task_struct *t)
 	axp->target_uid[axp->pid_count] = t_uid;
 	axp->target_sessionid[axp->pid_count] = audit_get_sessionid(t);
 	security_task_getsecid_obj(t, &axp->target_sid[axp->pid_count]);
-	memcpy(axp->target_comm[axp->pid_count], t->comm, TASK_COMM_LEN);
+	strscpy(axp->target_comm[axp->pid_count], t->comm);
 	axp->pid_count++;
 
 	return 0;
-- 
2.43.5

