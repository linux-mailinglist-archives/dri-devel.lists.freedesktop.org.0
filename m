Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C885191BAB8
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 11:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1234E10EBDA;
	Fri, 28 Jun 2024 09:05:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ytv/HBaT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E430D10EBDA
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 09:05:35 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-6eab07ae82bso242474a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 02:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719565535; x=1720170335; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y+o2QcP3zzShPD5bpWdvqtRKk4SGVf/ncCjWPDHjjaM=;
 b=Ytv/HBaT4FVlaFBv/h+OKw6vdrUlhS4kV4E0VIAJoWb4NVHT8HbAAXDdcMdreuP5rX
 eL40X9yfS8Z5zKjjHcta4o2hRKQJ4uls8ioUh1Cy0e9+yYgGTFHrLM0VERCbvJWiGyXU
 CcznM36NoQkyH046teNnQI//Sq0exlooREpVPoSqHlj4nVjMsXGqT9AcIWxsI+BRpntD
 8Y4Gvzh6ZP/1ASRGGltvtOMJ/fZn0UNM3RHzliKGQ9WNt+96Aohqfxblbm6CsVD4ln9U
 d5ryi2cbtobT515A8rA7WencaKBMxndmuGlHrvzVAOe+df4cOuKhhn8bdgsFkMILk+h/
 9mTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719565535; x=1720170335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y+o2QcP3zzShPD5bpWdvqtRKk4SGVf/ncCjWPDHjjaM=;
 b=O4dy6uwCFeNUHtnR1vIHWblrgnes6giGRi9rY/cgb00zSA4lj8ApZnDwEf8c4c2jI/
 upUnkAjyJ5PGKGU33w2DGnx0PFA+jyse9Pz46j+2Nf5MkOFR3gVR3PskyOxtD21oa3JY
 +dlNO/qDUCxzWgEafGPXNH8iStefc+ES+EIoC4Trw8aBU3IwZ4KMtEnorOO6RbwR6etM
 HUt5CKfe3nVQhMdY6ZeXmT/a7kCimglCx3Nl96eOqSpzybcSmi3nzfhJGyTbT0zpoTES
 DrmwGIE8gl5noO/r+k4DV570502F1tbSjLfBT3HF33S5s2vQbgt55BWqs+5QbLmJveLK
 4m/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU171N364bOGqCBD7QvC0zf43KH5YAJRXh8rofILmTEF2Q+JMtL3cio8R3DBHhmLACPZKASkaGXMvWrKzAmt7VJ/QAlaN4EgfQ+ADPRMkAV
X-Gm-Message-State: AOJu0Yxx6jRnsKPDJG7CoB50xXtAcLZ5eVOmABCNCo8/IY64K5rdzbpT
 rngXCN1zr4KlZV2EYMqajY5QtURsfClTKZIRw0ynkKTjFhaAZ7Pv
X-Google-Smtp-Source: AGHT+IGiL1nE/JPCYxh777n4qtTvEfwnEp1By9NjDz6oRHtLGf4s+XwALk3c6cvWzb1jiZh3cdfwuw==
X-Received: by 2002:a05:6a20:c325:b0:1bd:2267:b45e with SMTP id
 adf61e73a8af0-1bd2267b4edmr8264153637.50.1719565535182; 
 Fri, 28 Jun 2024 02:05:35 -0700 (PDT)
Received: from localhost.localdomain ([39.144.106.153])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac10e3a1dsm10473085ad.68.2024.06.28.02.05.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Jun 2024 02:05:34 -0700 (PDT)
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
 Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>
Subject: [PATCH v4 02/11] auditsc: Replace memcpy() with __get_task_comm()
Date: Fri, 28 Jun 2024 17:05:08 +0800
Message-Id: <20240628090517.17994-2-laoar.shao@gmail.com>
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
2.43.5

