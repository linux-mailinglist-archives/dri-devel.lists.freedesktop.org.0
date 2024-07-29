Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C52E93EB66
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 04:39:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C42CF10E212;
	Mon, 29 Jul 2024 02:39:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kcHQXOIS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA54810E212
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 02:39:28 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-7ae3d7222d4so619089a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 19:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722220768; x=1722825568; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J+uQG4RKAtUTljj+c6PuEzvl8DtV0722F0vMFtL07WU=;
 b=kcHQXOISH1q8xWspIVQD5wvjnr/tiSLaLzabcyBWP/mJH4et/g7AY8KEuRGZ3s4em0
 vjzjxdbSb8V4oRV7neE7R1mtc9HJcSxByqR3GUNrgEzWC2Y3rmcfSf5iOtkHkSp8tSgi
 /PAwAOLq2ihbwYNkIZhSYFDIZg4iaOAg6Ot8qG6jkjx6vl0fiY5LdJSQDwh30CI3i2Z7
 r2I4L5/kaltf9lG2AJR75+lDIFIr7fXMuVqMYG5tGp9jk+TFPJj4ao8HtlcIR/+Ys99y
 RUAxua+jTCBr415oI4mrXHF7HY6VHNCGW7aMTFE66FXO3MJMWNyJYFEqNvd0VOLeHTSR
 xeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722220768; x=1722825568;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J+uQG4RKAtUTljj+c6PuEzvl8DtV0722F0vMFtL07WU=;
 b=Uic8pgDqXUJm6qno9GKCanExsNnKniaPIRDY5goD34uR6ioO1L+jHCxyskVDgyEOcS
 a3GEcS3OFevGiyVI4ePf1brE8Ca9uyyGDCMSiDD8XFmW4uryMPF0v8nX4jYtIq9egmoC
 uA9JTdy0xloXbqUN4MORHs48SyAdyWLb2Q43kyN7mFsuDOBPlNfixxOf5CRLSvEd0v2d
 K6qNh25yPQXaCzo0qCZfTRo+4HaOcalpt9uyE2d/koK775txQXpT2xKDt+ocIGKrBQWr
 uJkntNZ1Dv+8oIlxBHGktMIThzCzVABA5CemSQYnl74HLMzTQBF9zBwIXmc89CMBG3S9
 PitA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlx7TB+SbH+5b+sSgW6yBtBXy+Tgcejkzfu3IdMHZMN3I1y19jRYWAKfWfrVLI195KaM+uTzAiUQpmUx61iTqL/7R/+OVWDYD2ECKkBeB1
X-Gm-Message-State: AOJu0YwmW2+dJJPAJk60UpUBc+wYOt4wfZ33M+FZhAX2AbnIdz1B1drv
 bL7Yfm4rS98KMjVvZuHlTTDOQDqkTqefD6CVCqe/Uosq6XCrA8E5
X-Google-Smtp-Source: AGHT+IGDDVacAHzuqJf1zY2UQsKDkDe/fVaez1tdPtuFhqBPLEHRkdQpCzionBNRtCrdgKFvX6YkKg==
X-Received: by 2002:a05:6a20:d50a:b0:1c4:8bba:76e9 with SMTP id
 adf61e73a8af0-1c4a153afecmr8452767637.53.1722220768309; 
 Sun, 28 Jul 2024 19:39:28 -0700 (PDT)
Received: from localhost.localdomain ([223.104.210.31])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cf28c55a38sm7332247a91.10.2024.07.28.19.39.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 28 Jul 2024 19:39:27 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, ebiederm@xmission.com,
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
Subject: [PATCH v4 03/11] security: Replace memcpy() with __get_task_comm()
Date: Mon, 29 Jul 2024 10:37:11 +0800
Message-Id: <20240729023719.1933-4-laoar.shao@gmail.com>
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

Quoted from Linus [0]:

  selinux never wanted a lock, and never wanted any kind of *consistent*
  result, it just wanted a *stable* result.

Using __get_task_comm() to read the task comm ensures that the name is
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
index 849e832719e2..a922e4339dd5 100644
--- a/security/lsm_audit.c
+++ b/security/lsm_audit.c
@@ -207,7 +207,7 @@ static void dump_common_audit_data(struct audit_buffer *ab,
 	BUILD_BUG_ON(sizeof(a->u) > sizeof(void *)*2);
 
 	audit_log_format(ab, " pid=%d comm=", task_tgid_nr(current));
-	audit_log_untrustedstring(ab, memcpy(comm, current->comm, sizeof(comm)));
+	audit_log_untrustedstring(ab, __get_task_comm(comm, sizeof(comm), current));
 
 	switch (a->type) {
 	case LSM_AUDIT_DATA_NONE:
@@ -302,7 +302,7 @@ static void dump_common_audit_data(struct audit_buffer *ab,
 				char comm[sizeof(tsk->comm)];
 				audit_log_format(ab, " opid=%d ocomm=", pid);
 				audit_log_untrustedstring(ab,
-				    memcpy(comm, tsk->comm, sizeof(comm)));
+				    __get_task_comm(comm, sizeof(comm), tsk));
 			}
 		}
 		break;
diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
index e172f182b65c..a8a2ec742576 100644
--- a/security/selinux/selinuxfs.c
+++ b/security/selinux/selinuxfs.c
@@ -708,7 +708,7 @@ static ssize_t sel_write_checkreqprot(struct file *file, const char __user *buf,
 	if (new_value) {
 		char comm[sizeof(current->comm)];
 
-		memcpy(comm, current->comm, sizeof(comm));
+		__get_task_comm(comm, sizeof(comm), current);
 		pr_err("SELinux: %s (%d) set checkreqprot to 1. This is no longer supported.\n",
 		       comm, current->pid);
 	}
-- 
2.43.5

