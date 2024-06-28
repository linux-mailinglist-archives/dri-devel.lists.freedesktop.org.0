Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 937B291BACD
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 11:06:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED5610EBE7;
	Fri, 28 Jun 2024 09:06:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gqNPdjw5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8FF10EBEA
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 09:06:14 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1f9cd92b146so1820135ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 02:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719565574; x=1720170374; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aN2V+duoRLP5mjQclolxXRJl1PN7YZIwA2PLtFFVKQo=;
 b=gqNPdjw58LEAnCrVHduK2HV0ue4uaWQBNb4wQvYdO+D+BBb4YQ9q+9dukjc0mq+qY5
 7UHqi6rb7EChKq9P5InanIaPEnk+AG7JldClBwkcjJcXhUi8TsRxn76QqpA66r8VJbR0
 6jChEymIz7XntjPD85mcM7OIajEwFSgBVm6nGdiicUu1RiE4kvvuOINJ62KjCDgzDFBG
 TFX5jWpsxapuzrhabjmFmG/Rd3CsX9AClHy2xXReRRB7ImvMiiIN9cmuDzyvjfIs9G81
 jubt+Wp+D9ox6vEW/o69v9FJsyyhnWHJvVnBBV+BTe5/n+CzVKV8bSXX4P369AridYr5
 4Syg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719565574; x=1720170374;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aN2V+duoRLP5mjQclolxXRJl1PN7YZIwA2PLtFFVKQo=;
 b=TlnHpJavokIOE0W4sfUcA7+KkZ4+TFoEjNsYpSmVd18xgGLNEGqb7deZ3bQnySxOcV
 nsFFmwLA69gUWetBKmr79ew+bh7f6uMtEsvbmjYcfzN6gu9N/0bu1EAfjM3yBLocboPz
 oy7FVgLZfG5JD4+StaNTfF/YWfh1QUw8t90NKL3w4apfZncD7m3dujuuUFtXkmlxOj5w
 KJ9U4x6upDbUgwihDUKz4bAWCpd/EjOKQpPpgbnY4lOoxrwQCPKpZXsF3CI7EQkXX9CX
 GVmFH81qjaxM6cpssyFq7hcNw1FzGBhWtOvCFlla0OtC/RBTXLvxgkzbuT+PTAMjTvJS
 IqYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6UGYf+5OLZqEMfDsK2qPRJ6IVXCODzd99M62SHPQNljdPrw4fhEl+ywgWIEh1B/roLWj3WUbgIpOiPRslUWt5DYM2YmwcZX0o0499D2Lz
X-Gm-Message-State: AOJu0YyhIho/SxJpkA0ZnXPArWXQOECbm72OpoNrBeIl6UL1OLkhEGNE
 udI3seFL0WNmYOpp306OP/aFngYhookJKpXb7zl6HlCdhUt8FIW2aBYVAEzoeFQ=
X-Google-Smtp-Source: AGHT+IH8hbTH/mkdkSjyBT5baT0IFO1FQw7wMYLskc8y3Zcc6iSLCmGElb9qtOP7mNAm10MFemyYoQ==
X-Received: by 2002:a17:902:d50b:b0:1f9:e7b4:5def with SMTP id
 d9443c01a7336-1fa1d3e0157mr181052415ad.3.1719565573956; 
 Fri, 28 Jun 2024 02:06:13 -0700 (PDT)
Received: from localhost.localdomain ([39.144.106.153])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac10e3a1dsm10473085ad.68.2024.06.28.02.06.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Jun 2024 02:06:13 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org,
	laoar.shao@gmail.com
Cc: akpm@linux-foundation.org, alexei.starovoitov@gmail.com,
 audit@vger.kernel.org, bpf@vger.kernel.org, catalin.marinas@arm.com,
 dri-devel@lists.freedesktop.org, ebiederm@xmission.com,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 netdev@vger.kernel.org, penguin-kernel@i-love.sakura.ne.jp,
 rostedt@goodmis.org, selinux@vger.kernel.org
Subject: [PATCH v4 08/11] tsacct: Replace strncpy() with __get_task_comm()
Date: Fri, 28 Jun 2024 17:05:14 +0800
Message-Id: <20240628090517.17994-8-laoar.shao@gmail.com>
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

Using __get_task_comm() to read the task comm ensures that the name is
always NUL-terminated, regardless of the source string. This approach also
facilitates future extensions to the task comm.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
---
 kernel/tsacct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/tsacct.c b/kernel/tsacct.c
index 4252f0645b9e..6b094d5d9135 100644
--- a/kernel/tsacct.c
+++ b/kernel/tsacct.c
@@ -76,7 +76,7 @@ void bacct_add_tsk(struct user_namespace *user_ns,
 	stats->ac_minflt = tsk->min_flt;
 	stats->ac_majflt = tsk->maj_flt;
 
-	strncpy(stats->ac_comm, tsk->comm, sizeof(stats->ac_comm));
+	__get_task_comm(stats->ac_comm, sizeof(stats->ac_comm), tsk);
 }
 
 
-- 
2.43.5

