Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 502FA955500
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 04:57:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA3010E86C;
	Sat, 17 Aug 2024 02:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AEWcDuYM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E0B10E86C
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 02:57:17 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2021c08b95cso1042235ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 19:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723863437; x=1724468237; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mIIMsSPqVp5AusgTbRbdrgF3qEr8ccJBENe3BbQ0UBw=;
 b=AEWcDuYMzY1Qu4yXSblWx87XwW+jf6GRlGCoHLof9bzhUNPkviVSnvIiiAyn+f7pa5
 FG3cIg9Zt8KWaTPmX/x/vL9JMJvhwl82o62qgvg3OubWplQNWuZnS/74G40VwBSkRW0y
 5JFBQhH7t7FmkFjWfnTVFvVpPUWgcUQ+EUJzu7heaBg9rJ1+AaUiJTnk5yX3/AZn7Un+
 BTV41dmjeSATiLmzmZal3cDf39nV8fpTwFrGkJADe03/6DXtWQH3XPbBeQZqwGSgJzjM
 riP/3gBXEEFIt7M7iEPCLpjlLCGoec0lYJkRKY7qQvVRXLGiINyOTetwXzQ75EsefqdD
 pVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723863437; x=1724468237;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mIIMsSPqVp5AusgTbRbdrgF3qEr8ccJBENe3BbQ0UBw=;
 b=TC3bzv15T0PBVBKUI5x6mkHyuIFCxr0MqNd9mlKbZy/hEBHv0uYBbwN3HtKFIpFo1I
 hxnFYcdhIJC1Epv7PoihdiddFXhi7jYL/i6awdzjT0r/4xDmlPinFOCaYZjXFI9/dqPv
 E+8o6MsRwcfC6Vjcpz9phODEZv8X01LKUBV/++GW7QL5ncGaFN6f79Ag7e6dUZQiV1D9
 ztrvE/RRz5ZzrGPjmRIyHzG3HUEZJULTukrGg0QXDGjwDEhkJVQA8buCaMCY+Angfevk
 IuQZHqdJQMs0+0rtFcIhDmtAzstiYnlaRo9mA5WMXQxk+c0XAp1MkyfOgKZPZpl3SWVB
 ulyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNBZW/Gh4EZ6xWNfd6aMpPgIMfQkY7jy90OvEV67iKLdvByE/cGIMB4UbTTHKKHBDxju52H8jUWCP1EjPeYpPjOtaYRXEjnNmnBtB1xNtc
X-Gm-Message-State: AOJu0YxMKeGku5DBYW5broYo4bodaZ2bdiPOP/QvQ98cIVHujuoh4Rng
 EscPSLWgfuKP8QiY11YSXmUV0DNosVT8XPD8th4oSg+cyz/4TwTx
X-Google-Smtp-Source: AGHT+IEzug8bsagNMxwK7nm29ecXIwIfZ9FH+TLEi6IcVkbHtwlg4mlyU3SBLgFEVqycM3+Rn/pQ8Q==
X-Received: by 2002:a17:903:2303:b0:1fb:9b91:d7d9 with SMTP id
 d9443c01a7336-202062963e7mr80764935ad.26.1723863436587; 
 Fri, 16 Aug 2024 19:57:16 -0700 (PDT)
Received: from localhost.localdomain ([183.193.177.10])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201f031c5e1sm31801785ad.94.2024.08.16.19.57.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Aug 2024 19:57:16 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, alx@kernel.org, justinstitt@google.com,
 ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 catalin.marinas@arm.com, penguin-kernel@i-love.sakura.ne.jp,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>
Subject: [PATCH v7 3/8] security: Replace memcpy() with get_task_comm()
Date: Sat, 17 Aug 2024 10:56:19 +0800
Message-Id: <20240817025624.13157-4-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240817025624.13157-1-laoar.shao@gmail.com>
References: <20240817025624.13157-1-laoar.shao@gmail.com>
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

