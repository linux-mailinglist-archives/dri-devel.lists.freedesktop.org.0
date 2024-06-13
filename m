Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3F7906897
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 11:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E753510E9C6;
	Thu, 13 Jun 2024 09:26:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WrxJFv32";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC18D10E960
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 02:31:18 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-705b9a89e08so480717b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 19:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718245878; x=1718850678; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j1cpGZH9ekrwOk4ggaybwp6iXeGg5lCIICWIGBwiSB0=;
 b=WrxJFv32gohLUCv/zA/KhLg6jimn/yBSTPte2T09Do4aanr/WZHTRdRIBS0uamq7PM
 pHMHLTvuz6OmTlP+F33ZF4dX2Lo1yzmn5G7NJ71eS/K98vS/LdGDkhoo0HrkN4kR92lr
 dVx6EL9aZBR4c5o9l+BlQ7D3xtO6lUVzK7tbC1nkNSEM58JpszP5MSs5QR2oMERZt1xE
 HGxcB4YjuZSicfX6ohLb8WextZyyGnur/3ijZ8O2XiKKcg0BTdJn/UgeKVoPOQie5299
 8Ep2dTgwOBFbdbIeso402SNBYU1IDaYwlrz1kzaHyMRN/YDCADkIDCkrcjW6pnup2kl4
 H0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718245878; x=1718850678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j1cpGZH9ekrwOk4ggaybwp6iXeGg5lCIICWIGBwiSB0=;
 b=RY04MghA+nkj3KqZ1UriEQJl0c0h6eZ3W3HPetziUPVbk32pIa33VhYtgouvlWyRP5
 Ah0XbTtPdv+l5otXxiaHqMLmoomNX9CME3TSmxObAG0nCYWD1mbbaDZaPkMOkkuzbpWC
 swr/AhDoRmL6XS32CBVgPPDs6fJ0wyjGoQRNEKlcFF/dQisHQC4MSNCaAAdsaXHC4C42
 KxbhwkulmTmzSISWVzPNwm1kdAiavNjTSxFJcakQg6vFDSqSSvICYT9Hbrtwq2rKBUUH
 +w2dQQrGltTfak87+8WqM2nts9s3rEV1RMjryOQIpojwH1A4KIPfw7Bo/mUpA3hCSo7U
 pFqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJov17EbfWxN5TeH+gsSmDElhIx7x5njfYvTRqcRrsR6DeA8qwW+ZVyXyd0JkUgkxK2M2WhyiYy6cF4M3ckRK0H9Ty9cOOq+Ecjvj2NxLK
X-Gm-Message-State: AOJu0YzHa3yII9biHb43/TtbmpBPjCO/RpzIA6lt3qfDfrcMyjFC6pAJ
 pkDk/SubF4+uEVDZRe57r4iiwr+R1Pn5+w9c9I/PbNiPoDPLr3ww
X-Google-Smtp-Source: AGHT+IHxE49dVlqeBIraoeODhxKMszGj4KYKBCDFAoiQKvyi2cHrcHMBy4aCqKmXdfgNqTCtDPqmtg==
X-Received: by 2002:a05:6a20:3948:b0:1af:8fa8:3126 with SMTP id
 adf61e73a8af0-1b8a9b773c5mr4249289637.6.1718245878051; 
 Wed, 12 Jun 2024 19:31:18 -0700 (PDT)
Received: from localhost.localdomain ([39.144.105.92])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855f4d159sm1755695ad.289.2024.06.12.19.31.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2024 19:31:17 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org
Cc: ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>
Subject: [PATCH v2 02/10] auditsc: Replace memcpy() with __get_task_comm()
Date: Thu, 13 Jun 2024 10:30:36 +0800
Message-Id: <20240613023044.45873-3-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240613023044.45873-1-laoar.shao@gmail.com>
References: <20240613023044.45873-1-laoar.shao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 13 Jun 2024 09:26:31 +0000
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
2.39.1

