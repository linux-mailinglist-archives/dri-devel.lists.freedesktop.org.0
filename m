Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57086961C80
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 05:04:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C5B10E486;
	Wed, 28 Aug 2024 03:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jaVEkhiH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7146910E486
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 03:04:00 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-7c6b4222fe3so3832187a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 20:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724814240; x=1725419040; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mIIMsSPqVp5AusgTbRbdrgF3qEr8ccJBENe3BbQ0UBw=;
 b=jaVEkhiHFkThKbYjOe8DnHXaYD6XuOYkYpP+LNAKleCcznczay9TkATtVDVdxCh7/z
 mRR3nY5GSg18SEDBw+k1ZICR0PeF+w6hlY6srtVSfUTp0vHizdWN5pJDX2f18DsooNBH
 2heu5g8kdW3KK7+ybgdMlo7yNqyXr2WXR6yuVtrWyIgT3swaQI7g49yd7LvrI64wdPHX
 ZUfeyxHTJ2KX+Tex7ezfwwiLrNid/KJ4Vc+kdZeOgHmyVVARcFrjxuQtNvCCzAyo1TaE
 y/+Z4gu845JD/QIYg2mfKCV19AanjzhVjcFZFMWfPhBNgsErCsh6ieNGcILsBzTe+sKZ
 7wkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724814240; x=1725419040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mIIMsSPqVp5AusgTbRbdrgF3qEr8ccJBENe3BbQ0UBw=;
 b=d1CDoiplAXUeAeEe2kL2A4TOXvUirf2aX6kn4uCmgHbQN6CMX3ighjJARRTNFBgv4N
 +v4WpVsNpVVY1Q84SIVs4EqTSTsZuUgoAwcasJj8EAOXTRasiHd+Lcyxul1Jryel5jRB
 l5iY5kBovN9nvIE0Vq//Q9v1t3SwopQY6OFabSa30VLH5Uj4TFFRPo6WgYG5k34chYb1
 aHCZ5378CM6WsNhLx1n0qw/DvLG1ZKDgYAzZ21pej5C53CSxXW87piYt2hIXEoFiQa08
 EZ/L0cCFPPAPxHRDHg6GmkT0WGwCNY66IvzZ/n1SP1CvRldd6Jt5BxSIInnzWLY8j4ad
 TXoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5t+aq/vt20qx51wBdcsjAu56kSdWBVO7qMShZfy283U3EfXxswp4BLkP+hw3C3pkw/7lnUGK0VRc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyoT2543FCd3PIvIMdfFYO5z2iWDA6DeG9RyGRLkynvcJkEp5Ew
 i+aVJ8nAWyxlJUrzFrLk7h1CHpdEPsRzkX3zmE14jY2OLQhOaScT
X-Google-Smtp-Source: AGHT+IFERm607QheW54BofDpcXniBv+8JM5KHrTSMUx7woXR1463qkdvSKbT6nvldL/lDZfqmA0dvg==
X-Received: by 2002:a05:6a20:43a5:b0:1c4:c7ae:ecea with SMTP id
 adf61e73a8af0-1ccd286f499mr543329637.11.1724814239886; 
 Tue, 27 Aug 2024 20:03:59 -0700 (PDT)
Received: from localhost.localdomain ([39.144.104.43])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d8445db8f6sm317977a91.1.2024.08.27.20.03.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Aug 2024 20:03:59 -0700 (PDT)
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
Subject: [PATCH v8 3/8] security: Replace memcpy() with get_task_comm()
Date: Wed, 28 Aug 2024 11:03:16 +0800
Message-Id: <20240828030321.20688-4-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240828030321.20688-1-laoar.shao@gmail.com>
References: <20240828030321.20688-1-laoar.shao@gmail.com>
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

