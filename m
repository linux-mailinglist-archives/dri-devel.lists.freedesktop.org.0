Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 010F39554FB
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 04:57:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C02210E86B;
	Sat, 17 Aug 2024 02:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GUvAZEFc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 050FB10E86B
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 02:57:07 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-7163489149eso1923234a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 19:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723863427; x=1724468227; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+RcIZVYUDMrvydSLTObUn9UWjAdkDM4CrmA64YTz3G4=;
 b=GUvAZEFc6SdD6ySO8Cx0ScSknc33ljM5HESR76xP8HEne0I0+1bzrhnCxDLEAaJE37
 TuMMcs9VOaiZiKqIYtPqiZ8TODZBKAIVUaA671hJu16LDejvKwva6pzjX8Y5K2mQQkqE
 H5NuaXcpG3lD5pKFzc/6EiIwI3IU3mGaPxkE/6rU/Psy6CLBJ3E9MH5R2zu9f5rjRnnt
 XR/CDZzFIlQiC6QCur4t0U3gKdPTCySs9KfPFVL8ruEZ92/smRacQ/mORg2Qbvb6OmTF
 8W8o8VWuDd06FRUJbz6rcI46hJxipEO03zjlFEmYCLKAwttq8D1D5KZK0CztCPXbbOwi
 88TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723863427; x=1724468227;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+RcIZVYUDMrvydSLTObUn9UWjAdkDM4CrmA64YTz3G4=;
 b=UN/T8M2e4qxu1vDBtwgtSP09T1cIABSuHDb7qszorzf7vrtnM1HU7FYYVX0Us4Y5uk
 LZBPlMoO2i3gDXFkPBD9ae42Zz5i9yMOCwB2XEFDrHflohbGtLPizLDXSJrGRe1mixyB
 f5zCU+akj5ebE1XGqrxm3lW94MKA0mc3+m3jiHFLQwTjjSR37K3Y7bFJl6ekc//N0+yV
 8QjyNxOXjfCGquK1UOJhpf98FCaJlb64G9/Vr4+/LV2Kr1Kobj7lLPvU4+NOgMP9E4cw
 vviMIId39mn14WGnDjX8++0a/y+8zRvkBC/od5VTOFHQb9LnLZvdAe1qTbEsyq3ABAA/
 U3BA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWEYh2Oca5qrbghL9GIW/U0SGiLWVrE6pD14bU/rs2InBS7sXALuDMZRVRhbX2RNlTXhQW5+e1SPBK6lrknr5cUxaXUG5C5v1dcHH3oajm
X-Gm-Message-State: AOJu0YzIp9tsPcWv0Pkj1YNkmzEOwhNoMvQWcff54C2tZElcbG1fyp8W
 H6T40Qv6a8uGAumBgFm0gq5EMi6EmkVM2DRNPh71AXTJVHi2i+rD
X-Google-Smtp-Source: AGHT+IGloZlxC12N+ArnDbFHNJc7Yrc4w00KFUrCatU21ag0p56SeEdkfwKvEveNvVnkzBGuU5AKpQ==
X-Received: by 2002:a17:903:32c9:b0:202:bc3:3e6e with SMTP id
 d9443c01a7336-2020bc33fc8mr44372525ad.33.1723863427201; 
 Fri, 16 Aug 2024 19:57:07 -0700 (PDT)
Received: from localhost.localdomain ([183.193.177.10])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201f031c5e1sm31801785ad.94.2024.08.16.19.56.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Aug 2024 19:57:06 -0700 (PDT)
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
 Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>
Subject: [PATCH v7 2/8] auditsc: Replace memcpy() with strscpy()
Date: Sat, 17 Aug 2024 10:56:18 +0800
Message-Id: <20240817025624.13157-3-laoar.shao@gmail.com>
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

Using strscpy() to read the task comm ensures that the name is
always NUL-terminated, regardless of the source string. This approach also
facilitates future extensions to the task comm.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Acked-by: Paul Moore <paul@paul-moore.com>
Cc: Eric Paris <eparis@redhat.com>
---
 kernel/auditsc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 6f0d6fb6523f..e4ef5e57dde9 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -2730,7 +2730,7 @@ void __audit_ptrace(struct task_struct *t)
 	context->target_uid = task_uid(t);
 	context->target_sessionid = audit_get_sessionid(t);
 	security_task_getsecid_obj(t, &context->target_sid);
-	memcpy(context->target_comm, t->comm, TASK_COMM_LEN);
+	strscpy(context->target_comm, t->comm);
 }
 
 /**
@@ -2757,7 +2757,7 @@ int audit_signal_info_syscall(struct task_struct *t)
 		ctx->target_uid = t_uid;
 		ctx->target_sessionid = audit_get_sessionid(t);
 		security_task_getsecid_obj(t, &ctx->target_sid);
-		memcpy(ctx->target_comm, t->comm, TASK_COMM_LEN);
+		strscpy(ctx->target_comm, t->comm);
 		return 0;
 	}
 
@@ -2778,7 +2778,7 @@ int audit_signal_info_syscall(struct task_struct *t)
 	axp->target_uid[axp->pid_count] = t_uid;
 	axp->target_sessionid[axp->pid_count] = audit_get_sessionid(t);
 	security_task_getsecid_obj(t, &axp->target_sid[axp->pid_count]);
-	memcpy(axp->target_comm[axp->pid_count], t->comm, TASK_COMM_LEN);
+	strscpy(axp->target_comm[axp->pid_count], t->comm);
 	axp->pid_count++;
 
 	return 0;
-- 
2.43.5

