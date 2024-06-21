Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E98911881
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 04:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA21210E23B;
	Fri, 21 Jun 2024 02:30:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I6ZTLyKg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64B210E23B
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 02:30:57 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-6eab07ae82bso1093065a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 19:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718937057; x=1719541857; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j1cpGZH9ekrwOk4ggaybwp6iXeGg5lCIICWIGBwiSB0=;
 b=I6ZTLyKgoNQ1iEfmmE4oT27fbWDL9Ed2I4x7EFvESAMjm5iSprvM909cp07w1cRRiC
 7c+3CuE1sOJXlKllk0GzXMrZ7pn/Lda5PokFNv06MFEkNs6Kc6s9bv7iIy+O1bVkkUI3
 o4sOAGwwuD3nOXg42q6OXFbRaaY9c/SNDnISxUbFgkOTIC778ZaLCqPVE2IRqxm6eVu4
 gg5DzCvbZZGxtlEKzBKXlX+ifaiT3ZXrJyrmm9R1r4l7j6P/jpbIAxAjsnYXJZmFY/Rv
 BSSVzJGeMkE+IsyPjHzRnHl6k/nl9JZR0QQRi/pj1CbQihk1AVdV4Dp7hD+LUWBpJaBB
 koUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718937057; x=1719541857;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j1cpGZH9ekrwOk4ggaybwp6iXeGg5lCIICWIGBwiSB0=;
 b=qKpjNfQ48aG5GW9LxdAqJxJY60QLneObSSoBxZFhft5DvzbK7Dv2JEw9tZEp+GCRsX
 WmPT+tsFanEDX1EKJ8YMqjKp3sjM4d9uqWRki/D7tL4dJ2DkPrvptekCXlkpYqClC+AF
 sbH7G9THORTU5sicvJ3inxgL7mjFzf982qF0NawPS3lZkq2nLbPcQdsjeuJx3x0zmWzJ
 EWFkE7yAtKZkXPkJq1S97suGqUW1VNjwFhajGlHAJyx2nvAHLBzQBycuoKIbRGocWAhD
 ztAkTS+GPFktScFgD2aL07hRl88+KhH/sCyYEWOpi+VlPZNFUJDJuTP0y2bYhZXYIRKO
 +IxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqC9XWMceis4xxbiV5y3pGNEYI4F271B41z2Qs8DqfVyPsxtXDFgO+vuCckX/ADZLLNgq4Z6MuD3bpgRYGq0I6s6qoPQKrEFinTTtybJsx
X-Gm-Message-State: AOJu0Yz/wvRENWoSaqJ1E/G1odo80OgMdgLo8IhwZEFxc9DxjMYXgShv
 Dibhkx7z1Ruq3IP6dX8iQLubPcWS3feZv1AxhJqwCKGcpbGxijSw
X-Google-Smtp-Source: AGHT+IEXObDJFHHEU4ritIMxu9doHb5HpGV/yXlLGQ5OCeoryIQ6hRw+mWkpUWLLJXrRfBg1YmPPYg==
X-Received: by 2002:a05:6a20:9313:b0:1b8:b517:9bf9 with SMTP id
 adf61e73a8af0-1bcbb574a9cmr6631143637.25.1718937057021; 
 Thu, 20 Jun 2024 19:30:57 -0700 (PDT)
Received: from localhost.localdomain ([39.144.105.24])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-706511944d2sm332488b3a.70.2024.06.20.19.30.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2024 19:30:56 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org
Cc: ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 catalin.marinas@arm.com, akpm@linux-foundation.org,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>
Subject: [PATCH v3 02/11] auditsc: Replace memcpy() with __get_task_comm()
Date: Fri, 21 Jun 2024 10:29:50 +0800
Message-Id: <20240621022959.9124-3-laoar.shao@gmail.com>
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

