Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5976191BABB
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 11:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B7810EBDC;
	Fri, 28 Jun 2024 09:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GeK6eqJl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934E910EBDC
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 09:05:42 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1f70c457823so1557115ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 02:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719565542; x=1720170342; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J+uQG4RKAtUTljj+c6PuEzvl8DtV0722F0vMFtL07WU=;
 b=GeK6eqJlXmgdMgo4oWKeeYJCqI+FSRPpR7UK2Sgc2huxYeVfcCV5YUiwytHmDKRknk
 U3TdlAKvNcpAwWswOscLsoYOolglMNDRZKED4WZfIL/4YT2cDsjv4X0+TurKHnutG5VM
 eO7dLbLHBRe3y9sKGHNR0N5Ro7SfGx2Q4O0BSU33LaSqaQWKqdJJcbEV98eN0L/GTGW+
 WyeNDaPju9zkPU9or7MmJ0pudYFJIxKYPbPWD1zyeMOf+7NaOCbEKpDu6YJ/BcxrOMNv
 Zc/F3d6ffx1Q2SL2KGXYTz3vI/EPwIzq3alZ8tfyuSIOE7mgQ+AEYlKSGUBNnEU69Og2
 dqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719565542; x=1720170342;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J+uQG4RKAtUTljj+c6PuEzvl8DtV0722F0vMFtL07WU=;
 b=FkAe06AGWCj6Lf84b3i4b1gy67UrW6KvRlh6U1PAsjfZSx3FYaLgBFOOYK2bK3oN0F
 xCiBFBQWQ8GNV+KpdoPlzqpft2x9ym4s7hzCkyXPvU2LJYChISSmOnTbAMTuVsPQ4L/P
 nHuNDESpB3r9v+/w/9q8YDTRLtK85wXAFuucbQqCyhIzlBzwcEQgUoDUMXWvSabb6umv
 cUat5XDSSB0CN+Q4HV8XGWu2pPnaotGqpLzfuJwK06LBbJEOtiYqkfpG5iPYeVgpN1ou
 IlrlHY3oC3QWW1uKNALzgFkWKg3HmlGnEgdsYSV8hHXNkhXqyTyNqyD/ifrqLmk6kQ+B
 XpKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYHW4j8nHYSzmLm6bpGRkFBypIZehjoKjL0l4pAKEQsjMfc6Cdjtlilz4uvUKn99/e7g7QJ3duX1t9gYmIReqz/U2e4OKYKv5rb+gLeFL9
X-Gm-Message-State: AOJu0YxDpOj5qJ7iGY76AU17PM9PSPPpi9q3IMP7WvLmYdcndPjox2+y
 ZDHbA2UskgR2yA3QBquYjbPeKRhfntJ4pJcndKWygJKF1HtfhOZv
X-Google-Smtp-Source: AGHT+IEiCe46L4L+6u8pFkskIn0tSNW3yZf9XlVCW3W2rC8VIHwBiWsCsriXmS70kmQMnPpYjn9ORg==
X-Received: by 2002:a17:902:a3cd:b0:1fa:a34e:8819 with SMTP id
 d9443c01a7336-1faa34e8cb9mr39730485ad.60.1719565541990; 
 Fri, 28 Jun 2024 02:05:41 -0700 (PDT)
Received: from localhost.localdomain ([39.144.106.153])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac10e3a1dsm10473085ad.68.2024.06.28.02.05.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Jun 2024 02:05:41 -0700 (PDT)
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
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>
Subject: [PATCH v4 03/11] security: Replace memcpy() with __get_task_comm()
Date: Fri, 28 Jun 2024 17:05:09 +0800
Message-Id: <20240628090517.17994-3-laoar.shao@gmail.com>
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

