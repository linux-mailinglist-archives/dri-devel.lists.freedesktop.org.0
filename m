Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDE193EB5E
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 04:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81DF010E1FC;
	Mon, 29 Jul 2024 02:39:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CXEYN7M5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA3110E1FC
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 02:39:00 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1fc692abba4so14763905ad.2
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 19:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722220740; x=1722825540; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y+o2QcP3zzShPD5bpWdvqtRKk4SGVf/ncCjWPDHjjaM=;
 b=CXEYN7M5Gfe7/n9cH95OyNAdpYnO1KKOPZZhlE7DscyyJHWr/oX9XDxFxHGQqKPMt3
 p6qWWIYP4vDt/b29/ASiwUIMAWS+1EQOwSqu9r2gi7+vPpW1uYnYr2y2l7ubCS09i6jf
 gd1RpGPTaeG0bWm1RTEwKkllZIbIsMykS6xuHo5Ps9zUHUbzzBTlEL34nT6R8YS8YfHb
 CwJDXrAYKkI8xqk7n5UqSTrLYQ2FAIHjvSkwsIDKbxjHsICLDJdDpvIpTwqrpttbLBSs
 8+9T6P2C8xrqWNrfCBswPvQVXiEqfywM7S8LGrAGL51L/7Rlv/1k+8TrYCzsnYZnZGgi
 hQ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722220740; x=1722825540;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y+o2QcP3zzShPD5bpWdvqtRKk4SGVf/ncCjWPDHjjaM=;
 b=vLL+hHtRg0lQFVIOHH3avholVqShBsPZXjHhEUssA/m17l/Q/MtCX1bQ2WtKpD3S4B
 MIR0LmzLrHe4PHx8dPlTovjNhcGXj2G5LMe8Vm7qz06lWY6yRgWP8i07HBcFdGcnDChM
 MT6WdNUKRna+Id+pa/CKuLwadmhbQsgVcCv31rTtgarxbOontcHdhZk+E6dwqQWN4mKz
 hisOu8GyU+mdj5eBMFkGmbh5gZT10rtNlAnfCOfgVp91E0M9wlmr6nK/ZO7L6i/vAnQO
 o26TIDOMhYL4uwQfKA5+Q/USU0rwBF4g1tawHiw2R1gRUHr1ooKyjb37CKqyutSaFVrv
 axEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZWncxNSOaUl3zSPOrl5j0H1oZQehIDbhIBajOeuhwCc88a999cQty4OQXD3C7E4xse8w7tuqet0sjYPjr72Q8S2xZAdi2a0cgGcM9i+8I
X-Gm-Message-State: AOJu0YwxIkM6Hg+J+8KqNKGrqRymm3YtrDEpCNOCjboCfG+cgn9hGpGl
 RzKmap8jN13zF0ybsDu9G3F/9y26dxn94HOcEp7Ie9HTKH71J3RX
X-Google-Smtp-Source: AGHT+IGBArXuQ6UfIKXak7ZIiMIQBzEmqSTo4bq3Ao5W++iZVvXLvRGW5ku9X9sKf2s7GMsSLwtHOA==
X-Received: by 2002:a17:90b:1649:b0:2c9:6f91:fc43 with SMTP id
 98e67ed59e1d1-2cf7e1a3e76mr4224751a91.3.1722220739919; 
 Sun, 28 Jul 2024 19:38:59 -0700 (PDT)
Received: from localhost.localdomain ([223.104.210.31])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cf28c55a38sm7332247a91.10.2024.07.28.19.38.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 28 Jul 2024 19:38:59 -0700 (PDT)
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
Subject: [PATCH v4 02/11] auditsc: Replace memcpy() with __get_task_comm()
Date: Mon, 29 Jul 2024 10:37:10 +0800
Message-Id: <20240729023719.1933-3-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240729023719.1933-1-laoar.shao@gmail.com>
References: <20240729023719.1933-1-laoar.shao@gmail.com>
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

