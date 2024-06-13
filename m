Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C040B906893
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 11:26:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B2210E9C0;
	Thu, 13 Jun 2024 09:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iGPLNBTc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416C310E960
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 02:31:26 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1f4a5344ec7so3676335ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 19:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718245886; x=1718850686; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nQwUpm7TadSQyuNlGOfh8JWtJNghSVDBcHtu3NLgdvg=;
 b=iGPLNBTcZKkvrleH1jBmCWqma/g+/WHNAXNdmqaokoN87UjQ0OL9apPr/Gq0mG3jlT
 grF3DsonNMD/MxJz+5P2CMzJSkTO4Vx1PAiMAnBSHcbA0OS0RSOJTir0dozCfxHpURO8
 /QEgNzZa81IWkTxsEZF1UjuVtiFHmDDwguqbQLWKz9dZaeE4BMdJa+ATbIcmpnHdyafG
 VrnHZaWVeqEf8flGS0GcRoNQtHLmhvlqJNVtec0y/DKSGA4i0GFvloqGNYZ0ZiEbY3mw
 pM8Vg7rIpA/GFnFn0891N6hGbyVPp2FAokFdjNouuULpp/eo4vWezsH+QVxCH7x9dyZC
 n80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718245886; x=1718850686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nQwUpm7TadSQyuNlGOfh8JWtJNghSVDBcHtu3NLgdvg=;
 b=w7MzyaiQk8P8TK+bIrQVluGvM5+fT6qSA3jfFuQKjt4hIFmXjR1YncDFlUT9u0L+ys
 X1aq8z+GSNsvgLY0EtKjojzSk8kPeBNOT6WNjBRC2l6a1NQJCIU0bwfiQp9ARpf+Mtnq
 25l9zo8dHIfYOLm9FUpsE9YnwlgZ7GZK1fHLNVsaumqeI1Xlfw6QJ2Yjrnifz/m27BPa
 FqrFl9yOOEkvZXH2TvlRzw+Vdg0zk9ttWOrYVfghXXTVmA4v+Ri5rVF0nX4V9Z8T5YM9
 2teBsVy2CsZMQA5Or+2tCJotX4zqstDG+bq/9XU6GMoXusl/iyd+fpdGa6VQY9oTnWgH
 oDYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAlsLwkRDkPr+56eP2WcdBDfE7VJ6rzIrS92jgh+NyJ7hEt45V8nGuzUmYYkO9h4K0zQcsfcNIncN4VYQvHpriX2HpBXietPxhJDLTCpWC
X-Gm-Message-State: AOJu0Yxsnrct2PLdCQkeEFDEC5TjLD6FgETquDTAAy5c+2qPITruzQDr
 Pfuf0LfShq+LMci/ai5AdszS9SlNk9aVX2vmypUgTEyMdfgjqwxM
X-Google-Smtp-Source: AGHT+IGMO7B1LQEga8czanZyIFvbKD26XnoiSA9hTxuO951zhYSmXnFwAhLQKN8VIXez5ya7Dmvfhw==
X-Received: by 2002:a17:903:40d2:b0:1f6:ed6d:7890 with SMTP id
 d9443c01a7336-1f84e2cc0b3mr21158875ad.16.1718245885659; 
 Wed, 12 Jun 2024 19:31:25 -0700 (PDT)
Received: from localhost.localdomain ([39.144.105.92])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855f4d159sm1755695ad.289.2024.06.12.19.31.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2024 19:31:25 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org
Cc: ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>
Subject: [PATCH v2 03/10] security: Replace memcpy() with __get_task_comm()
Date: Thu, 13 Jun 2024 10:30:37 +0800
Message-Id: <20240613023044.45873-4-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240613023044.45873-1-laoar.shao@gmail.com>
References: <20240613023044.45873-1-laoar.shao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 13 Jun 2024 09:26:30 +0000
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
2.39.1

