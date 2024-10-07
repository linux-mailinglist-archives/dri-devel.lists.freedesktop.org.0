Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6282992FD7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 16:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34DE610E3BF;
	Mon,  7 Oct 2024 14:50:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RUwEDDL5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF06410E3BF
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 14:50:10 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-7e6d04f74faso3641006a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2024 07:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728312610; x=1728917410; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mIIMsSPqVp5AusgTbRbdrgF3qEr8ccJBENe3BbQ0UBw=;
 b=RUwEDDL5XcsCvO8N9J/KNLUhKwPW7WNOVosh74yO84QHJVUgccw1LzoAYoTFhMhp5s
 PhcOXeEwKOX51MtxBcyvf+YTLXfdpjZ7QNlAvOV+CzKVY7BTRquROkM8Ku4HYMB9+MxM
 8xF2Ytf6te1xyfs6T5gVWJE+wu4ndAINV0ftKgsxulZ3hVZ/gmFscY53x/4xEWZ/YOOE
 UYJuq4xebUXysbzB7sD9Gnf0b/c9W69+coyunupfXaffrYP1XHv1uvq9VtVVsyexiudK
 tK6zQ/DD0EhyNmXLigwdo0uKiKQHhZmhpvGhR/qSVI+x7ci4vJf/q5Q6FH2NAnYIV12r
 u+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728312610; x=1728917410;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mIIMsSPqVp5AusgTbRbdrgF3qEr8ccJBENe3BbQ0UBw=;
 b=kkICPnYbM7b8LM2hLOj/EP9K3iLNZjr/lgefHySvq1X5O/Q4+3gCOKcyKO7huUhdxX
 rcQ3YBRkJ0BXCvuiMgwVjJrbOfMiDUI4K23nDUQPhGhkSHGjHgEDebzgpUOZD2sIPOJd
 /heijfHVytAq7S41aCvF3+yeUc7D7tCfOXVlZHUONlsLPlPG9k3g19IVlvvwWTVcvCKJ
 f/YO5Qz1cZhaAwYLqXY3iCbPdK/8GtgfucgIgwJkvT7aHFMTaQxPu8jGpG0N5UEEycwg
 RPj7kzF2FywHPKp+LNDteEt9aesD0AFdki1v2NqWgPph9xZwtchTv7JqXysRhJSVFeTj
 20QA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBBHVufso1oiLp29cUNzILI5aUPLUl3WIFldNvoQAG0nODul8pzxfhKQASM7vjIMPjRtZwh6Q6w3w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGuH1AAOwIimqvkq2WcJD3XZbi5NuJCs1Vq+DD2dcrmR8x30VG
 1Vd3hjLgIs/vUzvdY2d66oIAGy08yMZy7MXPJKMAwzjW+IOuU5TD
X-Google-Smtp-Source: AGHT+IH1T8Z0gS8IM4ef+l7Ymhr8kCvYXDO1WRSDOYONvg5988rUz94lZcz2t9FfyyE+YN0pNKr/oQ==
X-Received: by 2002:a05:6a21:9204:b0:1d4:fafb:845d with SMTP id
 adf61e73a8af0-1d6e02b14a1mr18448839637.2.1728312610165; 
 Mon, 07 Oct 2024 07:50:10 -0700 (PDT)
Received: from localhost.localdomain ([223.104.210.43])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71df0d7cf82sm4466432b3a.200.2024.10.07.07.49.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Oct 2024 07:50:09 -0700 (PDT)
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
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>
Subject: [PATCH v9 3/7] security: Replace memcpy() with get_task_comm()
Date: Mon,  7 Oct 2024 22:49:07 +0800
Message-Id: <20241007144911.27693-4-laoar.shao@gmail.com>
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

Quoted from Linus [0]:

  selinux never wanted a lock, and never wanted any kind of *consistent*
  result, it just wanted a *stable* result.

Using get_task_comm() to read the task comm ensures that the name is
always NUL-terminated, regardless of the source string. This approach also
facilitates future extensions to the task comm.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
LINK: https://lore.kernel.org/all/CAHk-=wivfrF0_zvf+oj6==Sh=-npJooP8chLPEfaFV0oNYTTBA@mail.gmail.com/ [0]
Acked-by: Paul Moore <paul@paul-moore.com>
Cc: James Morris <jmorris@namei.org>
Cc: "Serge E. Hallyn" <serge@hallyn.com>
Cc: Stephen Smalley <stephen.smalley.work@gmail.com>
Cc: Ondrej Mosnacek <omosnace@redhat.com>
---
 security/lsm_audit.c         | 4 ++--
 security/selinux/selinuxfs.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/security/lsm_audit.c b/security/lsm_audit.c
index 849e832719e2..9a8352972086 100644
--- a/security/lsm_audit.c
+++ b/security/lsm_audit.c
@@ -207,7 +207,7 @@ static void dump_common_audit_data(struct audit_buffer *ab,
 	BUILD_BUG_ON(sizeof(a->u) > sizeof(void *)*2);
 
 	audit_log_format(ab, " pid=%d comm=", task_tgid_nr(current));
-	audit_log_untrustedstring(ab, memcpy(comm, current->comm, sizeof(comm)));
+	audit_log_untrustedstring(ab, get_task_comm(comm, current));
 
 	switch (a->type) {
 	case LSM_AUDIT_DATA_NONE:
@@ -302,7 +302,7 @@ static void dump_common_audit_data(struct audit_buffer *ab,
 				char comm[sizeof(tsk->comm)];
 				audit_log_format(ab, " opid=%d ocomm=", pid);
 				audit_log_untrustedstring(ab,
-				    memcpy(comm, tsk->comm, sizeof(comm)));
+				    get_task_comm(comm, tsk));
 			}
 		}
 		break;
diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
index e172f182b65c..c9b05be27ddb 100644
--- a/security/selinux/selinuxfs.c
+++ b/security/selinux/selinuxfs.c
@@ -708,7 +708,7 @@ static ssize_t sel_write_checkreqprot(struct file *file, const char __user *buf,
 	if (new_value) {
 		char comm[sizeof(current->comm)];
 
-		memcpy(comm, current->comm, sizeof(comm));
+		strscpy(comm, current->comm);
 		pr_err("SELinux: %s (%d) set checkreqprot to 1. This is no longer supported.\n",
 		       comm, current->pid);
 	}
-- 
2.43.5

