Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5212494E4D9
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 04:30:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEAED10E041;
	Mon, 12 Aug 2024 02:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wv8yqc6X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D9110E041
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 02:30:45 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1ff1cd07f56so32429255ad.2
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2024 19:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723429845; x=1724034645; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zoIFivrPmimQFCGo/41HPdx35H3kdQIF/qhwBf2evw8=;
 b=Wv8yqc6X1WKOxvA6ltllDgk36l3v0wujOxLXytPt9E8+dPv/0XlzYLcTMlb73bptee
 hj7YPwFzW6g30OmlyXuVjDE9a42Zp0mvnk7OwUWx231927jD3n04ERcGdaQkV9QF8s5y
 FbZ8XWcyrDNStt1/7/b3jhXGodrm0VcFYDRDlxE3s3PIQ61CucrfesadxGjj84k8vSep
 WFpmZoj1EeB/nQFak/M6EF4DiCBHEL8YmYaN/m8E2iYZVSOKFjkQ5MJPt45VTNQLxoNx
 XQ9RYux0czrpn5OKSxduFkPFsP4Q4Gmhc8uQ7pwQk8lBmy61a+B4U8gcsUVej9EnoYFE
 rXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723429845; x=1724034645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zoIFivrPmimQFCGo/41HPdx35H3kdQIF/qhwBf2evw8=;
 b=dnZjauwQQ/GiO/vK7UtS8nUFHvsL2Fv1gUMhfEAOX2ptOpDPPRLjSwY7u9SovC048/
 Wair9Yr8rxmg48LT/k1Xh0yvb0mo+NEz04asP6LOefCbmybuJKO1AYQkKJnghLqy9jBk
 UJG+NSo1jgkbZEXHX6OTrsql+ud4yaZLP38JTpFcy03bDBxFpVBWL4r74e8f1/fmIxqn
 9FIR9F65TRWPSVAYi3qjwKrt4oXMuq87DECbLXNqtyEZb28LNaHECl4eVOv5eDbEAakh
 NXZjaOI5nMdqdDrXYZub0h0N0rntCNMQ3mcPO4t57lM5WHhL3JaSXObjTpqEfDF0Mgo9
 a7gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYERJ8yM0pdk56ESHTYGnbtc+q3bGDyVtc7/LMB3dnc06+enzojIc/ZgdaxOxodPAhplTBVWwhyHxZtzFn/P/70eiUOYcu9Y6qu+B67wD6
X-Gm-Message-State: AOJu0Yz7QrSSa/hwEkABKTImzyfX+wS1qscm4WuR6KsO7diQjcYGw9Ju
 enWQsNHLJN99M4WRBKANm4Tzml90EZlRxCxJ8sMOuP+jwdc2vKJh
X-Google-Smtp-Source: AGHT+IHsiTPfsy98RJjC8wpBNmaXvnlNH5fflWZLUy6tj95HlXDW+LhDZRUML9DQTQa1nKZJvXQLvQ==
X-Received: by 2002:a17:902:db05:b0:1fd:a0e9:910 with SMTP id
 d9443c01a7336-200ae5e811amr99536005ad.62.1723429844807; 
 Sun, 11 Aug 2024 19:30:44 -0700 (PDT)
Received: from localhost.localdomain ([39.144.39.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-200bb9fed69sm27884765ad.188.2024.08.11.19.30.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 11 Aug 2024 19:30:44 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, ebiederm@xmission.com,
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, catalin.marinas@arm.com,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>
Subject: [PATCH v6 2/9] auditsc: Replace memcpy() with strscpy()
Date: Mon, 12 Aug 2024 10:29:26 +0800
Message-Id: <20240812022933.69850-3-laoar.shao@gmail.com>
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
index 6f0d6fb6523f..7cbcf3327409 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -2730,7 +2730,7 @@ void __audit_ptrace(struct task_struct *t)
 	context->target_uid = task_uid(t);
 	context->target_sessionid = audit_get_sessionid(t);
 	security_task_getsecid_obj(t, &context->target_sid);
-	memcpy(context->target_comm, t->comm, TASK_COMM_LEN);
+	strscpy(context->target_comm, t->comm, TASK_COMM_LEN);
 }
 
 /**
@@ -2757,7 +2757,7 @@ int audit_signal_info_syscall(struct task_struct *t)
 		ctx->target_uid = t_uid;
 		ctx->target_sessionid = audit_get_sessionid(t);
 		security_task_getsecid_obj(t, &ctx->target_sid);
-		memcpy(ctx->target_comm, t->comm, TASK_COMM_LEN);
+		strscpy(ctx->target_comm, t->comm, TASK_COMM_LEN);
 		return 0;
 	}
 
@@ -2778,7 +2778,7 @@ int audit_signal_info_syscall(struct task_struct *t)
 	axp->target_uid[axp->pid_count] = t_uid;
 	axp->target_sessionid[axp->pid_count] = audit_get_sessionid(t);
 	security_task_getsecid_obj(t, &axp->target_sid[axp->pid_count]);
-	memcpy(axp->target_comm[axp->pid_count], t->comm, TASK_COMM_LEN);
+	strscpy(axp->target_comm[axp->pid_count], t->comm, TASK_COMM_LEN);
 	axp->pid_count++;
 
 	return 0;
-- 
2.43.5

