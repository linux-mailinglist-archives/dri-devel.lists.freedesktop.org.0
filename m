Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D4194E4DC
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 04:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D5E10E04E;
	Mon, 12 Aug 2024 02:30:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lICm0Htw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB47610E046
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 02:30:52 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1fd9e70b592so28944095ad.3
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2024 19:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723429852; x=1724034652; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Po06JAJWHpcwq2qZykUbq7VkC01v3704cEIBIqD0N8=;
 b=lICm0HtwazW/d/A81JxiuVlkE1A263U/bJiqTu8G8TVLtmFpgm1ZqEC2/o3Tfa48ZN
 I+ywP/vTNtwDF8Bri5zPyPwfyPgR0HK7Ja7Qy2bZWwH5VHL7Aiu6rJLMX0csfQoxtJut
 3ujo/DndKtFHMvCYlF92LJ/IOzNrPIkBAy3ifhKOsUf/Na4CjFbfr0hw6Bmd7KySsVoW
 Yy2b/H4zah7drRW6q0bbIYNCpF7X1TPm/GMCPsdZQcNFNxubxwa67scRfxdFTnRlAt6y
 cLb3u8el0xwy15+jfzFz398+JmPCoBQxX10wD1Iv91BpP5h0YjLUe0VKz8cCk1DaFE/l
 ZDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723429852; x=1724034652;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Po06JAJWHpcwq2qZykUbq7VkC01v3704cEIBIqD0N8=;
 b=ktEZnlTHr/fQDt6Z+/Ne+Hzyy5hCMG9fh9KoGKKuzGy+p01OosuUn8FbvZT2d9UEk+
 mSTiwqN+sUX8nd7ytErKVKHexz2Y0xiPGdyqEARdglqmEjl8e6sWaubnzI3tpMTJY9Qb
 /6ygQH90c2MpmuR103YSwqyO1AYJ8QkoBTQ6NzPLEWVEz9F/MVpj6kM7LDycfMWZGwIB
 FGUtUnGh2/9wlFQ1TcH9YgpUL0pwdJX2jdjA/C3IvhXd11BLONNnqaQTwVcT8kAGCMGv
 zVYOaaRPtHyVdJJ4HesmEJuUVAxziH32zj4oWz34Pw62KwYI9W6sdq0qJORTYDI1w9XE
 SA8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmINrcv7GaasKveO65NnRgElAKMPsl5x4PXbFtl7jtiPQd1R/xD8QA+4eEHnt2dtr7+Tsu9goTOHhKSQoCk3KQrmz3y1OqI3dgx/N8wmno
X-Gm-Message-State: AOJu0YxwnCOi+oH4KK8uKuzvb1hvo7r0wMPXJuJQCb97hLp0Qfi5G+Rm
 RHIlp2R0Rl/z/lRpcxJkLwnBOP7ohWwb+IhcVJmmBPqeuF6ysWCm
X-Google-Smtp-Source: AGHT+IE1xZMlHs3Cuw2myWpVVx1UE/beU7sYLAE8S60uxm8E0L6tTVwuNzgTetxBMMEWFVehNVy1XQ==
X-Received: by 2002:a17:902:d2c8:b0:1fd:8eaf:eaa0 with SMTP id
 d9443c01a7336-200ae550a83mr99817585ad.38.1723429852169; 
 Sun, 11 Aug 2024 19:30:52 -0700 (PDT)
Received: from localhost.localdomain ([39.144.39.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-200bb9fed69sm27884765ad.188.2024.08.11.19.30.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 11 Aug 2024 19:30:51 -0700 (PDT)
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
Subject: [PATCH v6 3/9] security: Replace memcpy() with get_task_comm()
Date: Mon, 12 Aug 2024 10:29:27 +0800
Message-Id: <20240812022933.69850-4-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240812022933.69850-1-laoar.shao@gmail.com>
References: <20240812022933.69850-1-laoar.shao@gmail.com>
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
index e172f182b65c..57e014ff3076 100644
--- a/security/selinux/selinuxfs.c
+++ b/security/selinux/selinuxfs.c
@@ -708,7 +708,7 @@ static ssize_t sel_write_checkreqprot(struct file *file, const char __user *buf,
 	if (new_value) {
 		char comm[sizeof(current->comm)];
 
-		memcpy(comm, current->comm, sizeof(comm));
+		strscpy(comm, current->comm, sizeof(comm));
 		pr_err("SELinux: %s (%d) set checkreqprot to 1. This is no longer supported.\n",
 		       comm, current->pid);
 	}
-- 
2.43.5

