Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A84946D29
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2024 09:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C34610E096;
	Sun,  4 Aug 2024 07:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e+dS8S33";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE5510E096
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2024 07:57:20 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1fc5549788eso77190695ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Aug 2024 00:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722758239; x=1723363039; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9th/bKhMjvRAjGGVHBeVqs/CIYRU9eynsJIFdR021yc=;
 b=e+dS8S33hwek7kR3Ecrd4g+gst+Vewt5vHhwwlI5O9WcIhHALc4VtdCc0yvNFNPfWR
 M4NVPZz+TAXDAEfyXtxNpUKUHpi45SDVJC1REhanvkSMMS7QgebpHZbMVAyAJ9nwT+sD
 peTTHCAs5yC0Jdlt+F5FmCJQ00OVDxMPiQve56KtL3CtCcfMVCkL5HyJ27VaLWXmdlv4
 qZZYkWbNSeOxro+G6LvCVr5nWY8BTtrKRzW3ZDHx0r2SSsc7yfwOI2i3RWhdGfVW6988
 4m+p3EZg+UpSYcLtceyyh8iaG67BLON/0dTmW3KcrG3qGlz2YFQK6PmNKlwKbwISp7I3
 y1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722758239; x=1723363039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9th/bKhMjvRAjGGVHBeVqs/CIYRU9eynsJIFdR021yc=;
 b=fl3VooHVn0ay6wjY+dyU6pcjPdBdCHiOpwEt5NfRBo32mzGJ0S1+a6oGCyAcxrZuGb
 eRhbVBdUUMvYvsioqa+f81saUBTJ27bpu0oPvku1hU+/fKR/RmcRUwGUc20VtvRLQexl
 QLpY4H7GbEgOIxS/dnzROW5mDHoyJU5UF60Hv3fO7W6peMtbUYirPn7+SjNW9XQ4xIHp
 bUM87lqgs3Y+8VS4a1ZOjOu7qnes0Lsp+Wdben/olkBOi/cDnuLrRB3A6VXBrduFemRH
 iiO+acEwwliM9GOpElEVQR1faJhJlgK158Jss7H5AZREy1jZ8RE4C+/c4dq8rBNPaBWm
 it1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwiv7wHgLD+E75ZF6t+vS3fPrZXEkzpM4XWvVi6dyPV+oPdaPy/4ZdjYXxG+zQXozvrgN4hUoACYTqURN8lXWaSjaoG4b5GMeQ4Nto7Tpv
X-Gm-Message-State: AOJu0YxEw5juJV3u7It1FpuAZmcrE2cHg2wixuJnxOwurTwm2mveX3ZB
 HE+oewo++A0iKRd0xeIF7hx+p/TFjrvWHjpH4ZEGtaFVYwjqK7NQ
X-Google-Smtp-Source: AGHT+IFtTPhQAQmKp5sRT0b26x8NVcEvgcuc+FRvXvXgBRo6DjcIq8upCUyDVHbaNG1PlsqP6YWdLQ==
X-Received: by 2002:a17:902:cecb:b0:1fc:5ed5:ff56 with SMTP id
 d9443c01a7336-1ff574a1977mr137301625ad.61.1722758239497; 
 Sun, 04 Aug 2024 00:57:19 -0700 (PDT)
Received: from localhost.localdomain ([39.144.105.172])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ff59178248sm46387605ad.202.2024.08.04.00.57.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 04 Aug 2024 00:57:19 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, ebiederm@xmission.com,
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, catalin.marinas@arm.com,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>
Subject: [PATCH v5 2/9] auditsc: Replace memcpy() with __get_task_comm()
Date: Sun,  4 Aug 2024 15:56:12 +0800
Message-Id: <20240804075619.20804-3-laoar.shao@gmail.com>
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
Acked-by: Paul Moore <paul@paul-moore.com>
Cc: Eric Paris <eparis@redhat.com>
---
 kernel/auditsc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 6f0d6fb6523f..0459a141dc86 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -2730,7 +2730,7 @@ void __audit_ptrace(struct task_struct *t)
 	context->target_uid = task_uid(t);
 	context->target_sessionid = audit_get_sessionid(t);
 	security_task_getsecid_obj(t, &context->target_sid);
-	memcpy(context->target_comm, t->comm, TASK_COMM_LEN);
+	__get_task_comm(context->target_comm, TASK_COMM_LEN, t);
 }
 
 /**
@@ -2757,7 +2757,7 @@ int audit_signal_info_syscall(struct task_struct *t)
 		ctx->target_uid = t_uid;
 		ctx->target_sessionid = audit_get_sessionid(t);
 		security_task_getsecid_obj(t, &ctx->target_sid);
-		memcpy(ctx->target_comm, t->comm, TASK_COMM_LEN);
+		__get_task_comm(ctx->target_comm, TASK_COMM_LEN, t);
 		return 0;
 	}
 
@@ -2778,7 +2778,7 @@ int audit_signal_info_syscall(struct task_struct *t)
 	axp->target_uid[axp->pid_count] = t_uid;
 	axp->target_sessionid[axp->pid_count] = audit_get_sessionid(t);
 	security_task_getsecid_obj(t, &axp->target_sid[axp->pid_count]);
-	memcpy(axp->target_comm[axp->pid_count], t->comm, TASK_COMM_LEN);
+	__get_task_comm(axp->target_comm[axp->pid_count], TASK_COMM_LEN, t);
 	axp->pid_count++;
 
 	return 0;
-- 
2.34.1

