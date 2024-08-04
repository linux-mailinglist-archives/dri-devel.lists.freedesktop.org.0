Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3396946D2C
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2024 09:57:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6139010E0BB;
	Sun,  4 Aug 2024 07:57:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J3XbPaWS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C2D710E0BB
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2024 07:57:35 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-1fd66cddd4dso87078425ad.2
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Aug 2024 00:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722758255; x=1723363055; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B0KTkwxi3yTBFtdP01Ghiv9wnj3oEVaVdo6Xnw/VoxQ=;
 b=J3XbPaWSdSykVlchyZecodt4yDfXuHe+hJ/0TQVlIjpjoxwNCsVM6rPY4xvaMA82Zd
 Fm3dK9d/rvkSELczag5wQiHfG6b8tV4F2Ig+qY8BRYThKvE/5+e60NBNGNGkRUlLjYd+
 mQj4d4wJAdjr0S9RXlf/aSIaVdqicDQ6VJJDGHs8RS78ZO5fXytFCyjB8Pf7QXSub6K1
 Az+R2SPqGmLxLgA30y85kGHAfUfdO220dVLLQvy+riunPVIzWfA9dUs1jDRnplEYJN3D
 1muFTqA4vJQzb2liEaHhPpwLkS+W9ER+yN5mktGSlhCM/VOgGwT5egevt7PLZP0ZJPY3
 o9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722758255; x=1723363055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B0KTkwxi3yTBFtdP01Ghiv9wnj3oEVaVdo6Xnw/VoxQ=;
 b=jffVwtyhQ+KTGd5isc0J6OKiynbpWoXJIEId0W4Wqd91XW0qnp0+tRxdoJSQJl2URH
 Sr4m40cb6YU2DBNtyHuHAld1u9MtnaD8K1Jfz6ebhskSqLJi8LrmG8+t5XCN8sCl59p8
 3oOdBqeJuA5K+OUDuAUHvRQpzviCitK36NtUH3FiRib/wfrxc8OMMvigqRGFPUxZ+J6p
 KVFYBjwB4I4rzAMXjOxmuTq8TGn5fmqngtE4YhArAiH6W2qNYokxzKIMaLtRmEHzwvc3
 tha+KizOJJ7HLp5OCaj3Yo95TRt6e2XwR4RcLKj3RPN1Ym4hsCkNBtGyR1dx/EAmWTOU
 wFbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2FeDM2R0qgVJM4wOAxG1Fv9lXUjNuzRU2qWNGP/+mtBCEwDwGX0B92b06gsPTu/DUnx12cRlKw8xu4nmCVsH/S5eqkjewDacAQQ/bZcmX
X-Gm-Message-State: AOJu0Yz8Abesdn7DPSqGG/fDG1UoEWpCmE8JMNqnR22hfozplVwhjQzk
 7g6e1xeFxJgW0I/rS48/7CundqaWjZ/UhUJQuHkhwlcLnTMbtT93
X-Google-Smtp-Source: AGHT+IH6wosRQHFK1XrZrMQ/1/OazY5atARBRVgGVQBt8cXkjOG1KelkDNxLA3xQ6gKV/rMpiZ54sg==
X-Received: by 2002:a17:902:aa42:b0:1fd:96e1:7ffe with SMTP id
 d9443c01a7336-1ff57456f1cmr80659485ad.55.1722758254963; 
 Sun, 04 Aug 2024 00:57:34 -0700 (PDT)
Received: from localhost.localdomain ([39.144.105.172])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ff59178248sm46387605ad.202.2024.08.04.00.57.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 04 Aug 2024 00:57:34 -0700 (PDT)
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
Subject: [PATCH v5 3/9] security: Replace memcpy() with __get_task_comm()
Date: Sun,  4 Aug 2024 15:56:13 +0800
Message-Id: <20240804075619.20804-4-laoar.shao@gmail.com>
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
2.34.1

