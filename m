Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DCF9F044F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 06:47:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7503310E238;
	Fri, 13 Dec 2024 05:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GakuZVnt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01CC810E238;
 Fri, 13 Dec 2024 05:46:59 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-21636268e43so18023675ad.2; 
 Thu, 12 Dec 2024 21:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734068819; x=1734673619; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fVaAhWgLsrOIaawWt+Es3lyBYssP2HU9Cngct4cKfGw=;
 b=GakuZVntB6g7YpyRFXN1LbQaFvhX6Tp4C8dD626BGiWJJ8miCR2UhHBtB7tF8EdU8b
 2+vNf/6vroXgQ6i52QtCoMPhLgm6mr1IYlqNaqXbmiTnfKa7BRDL/ff88hgD1F8EY1GA
 TD9z/8lQPo0TY7c3/y3L7wN0fxw3p0mnUg3lFeLe+PcVwZYz/bLm8LD0pncxItqUcZql
 9xx2voDZ31Y3FlxQbTRPir2wXbdY8RagkuUNMf7AoKGsmi4elQ8WT5CWgxOtNvy1EPwJ
 KMRH9FWNzxovAMm0AGEMoRTZ5PqJHU2ZA6wn4tGRIg2SXUzgZ+YBI26Nu5802I8HwGBH
 4CIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734068819; x=1734673619;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fVaAhWgLsrOIaawWt+Es3lyBYssP2HU9Cngct4cKfGw=;
 b=Z1Al96d1fL4r9t2EjTkugLXuI0xor/2ms9V8xx/IgIvWEKNPOUSYkIKJsYFbZypXWP
 2q6hCWXDvpT8a4WhaJWQzk6d0+jcFmkhbCs8YLvrEzmSvDgrHCELxX2OrvISz7MvK9W8
 AIUS2bxdJMMKI/lSaHoohOkMbA3JVuM6J74JZhp5LXOITpqOnEimbsK652GPeWHSafUe
 /q0tG8qe+eZHxiSpme018+ixhDGvDraXgECVZQjvuvFnFyReFwJ4DaYO77pgx30e44rc
 pWrem8XZKHjYYgaGXmJJUAQbWSOUkLzUOeZuQ2P4hJBFHOd+2MbVhhuVW2ATjT/QzVO4
 PfhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJJtT0kFOWVEv3VxhQRX+oTYrbEcrbeBAzAJqAe6OdfpMQeC3y8RWwLkoD3x7sFsr1JdaOWEDuJw==@lists.freedesktop.org,
 AJvYcCVNZ3zokedkAsWjJ7xk6cxLC0JIBVO517mcI26ATgTKKM2AkrteM3gJX7Xs3gyvDGUfwaFBr2g0sDg=@lists.freedesktop.org,
 AJvYcCWqiMKjXEs42LwXYNTrUVfyvoqf5vYqaFN3jP52Fk9THebwvqKYrrNgj6W4hLkGhrRyF2BXcIlefvg6@lists.freedesktop.org,
 AJvYcCXsiJS9IsxTwP0fanebPlfWVYCUXnVxjhc6t56iJszZiRTZE37psfhDTivKagEaVPtz6IXGbgd1hrs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzk7C3ITsCz1kD0wUtFddwUFHR9hcHrpvgnIk2+fwQzFrw0SbGa
 72+1cWCBtpVT1Eg06hlemej+27igEjUEEwmfylsPFc+27BER6j86
X-Gm-Gg: ASbGncvrupJm5nvhOc+ls9OksrE1EbczdoNiszt90N+Lb+G9hyHlxqQzU3s7YmOrKZR
 wp2Y2hiivTe79AEVrHihlB1Ep67zoqLI2jIvGqtkVIKFA0DZZOpbyrGf0L0fcD/dSQphSFu4n2M
 IVnvJkKq3nHeCYgSo6UBZgnWRZtpwzo81WpEjB4WkvpLPcGpCLh4UoJz9ySVZJfDkgcZXuaxOEn
 490q3wAGg9f+aaCPft6bvmyUz0wh5nWorgCVDabrDGKyQFh24+NlNSpG5SR7F8CZndK2vfiy55M
 CgeGeZI=
X-Google-Smtp-Source: AGHT+IGnQMpyX4qO4c9TaUxIvkW9bvqpb4HtTDVE3C9gZFkXCVV6ksZB8lAWhFJzpiBj11HO1t8PNw==
X-Received: by 2002:a17:902:e88b:b0:212:615f:c1 with SMTP id
 d9443c01a7336-218929a19c2mr20599995ad.14.1734068819460; 
 Thu, 12 Dec 2024 21:46:59 -0800 (PST)
Received: from localhost.localdomain ([180.159.118.224])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-216483dd292sm82564985ad.226.2024.12.12.21.46.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Dec 2024 21:46:58 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org,
	akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 x86@kernel.org, linux-snps-arc@lists.infradead.org,
 linux-wireless@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ocfs2-devel@lists.linux.dev,
 Yafang Shao <laoar.shao@gmail.com>, Serge Hallyn <serge@hallyn.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH 2/7] kernel: Replace get_task_comm() with %pTN
Date: Fri, 13 Dec 2024 13:46:05 +0800
Message-Id: <20241213054610.55843-3-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20241213054610.55843-1-laoar.shao@gmail.com>
References: <20241213054610.55843-1-laoar.shao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Since task->comm is guaranteed to be NUL-terminated, we can print it
directly without the need to copye it into a separate buffer. This
simplifies the code and avoids unnecessary operations.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Cc: Serge Hallyn <serge@hallyn.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Darren Hart <dvhart@infradead.org>
Cc: Davidlohr Bueso <dave@stgolabs.net>
Cc: "André Almeida" <andrealmeid@igalia.com>
---
 kernel/capability.c     | 12 ++++--------
 kernel/futex/waitwake.c |  5 ++---
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/kernel/capability.c b/kernel/capability.c
index dac4df77e376..4512cd797f49 100644
--- a/kernel/capability.c
+++ b/kernel/capability.c
@@ -38,10 +38,8 @@ __setup("no_file_caps", file_caps_disable);
 
 static void warn_legacy_capability_use(void)
 {
-	char name[sizeof(current->comm)];
-
-	pr_info_once("warning: `%s' uses 32-bit capabilities (legacy support in use)\n",
-		     get_task_comm(name, current));
+	pr_info_once("warning: `%pTN' uses 32-bit capabilities (legacy support in use)\n",
+		     current);
 }
 
 /*
@@ -62,10 +60,8 @@ static void warn_legacy_capability_use(void)
 
 static void warn_deprecated_v2(void)
 {
-	char name[sizeof(current->comm)];
-
-	pr_info_once("warning: `%s' uses deprecated v2 capabilities in a way that may be insecure\n",
-		     get_task_comm(name, current));
+	pr_info_once("warning: `%pTN' uses deprecated v2 capabilities in a way that may be insecure\n",
+		     current);
 }
 
 /*
diff --git a/kernel/futex/waitwake.c b/kernel/futex/waitwake.c
index 3a10375d9521..df8f8c85d776 100644
--- a/kernel/futex/waitwake.c
+++ b/kernel/futex/waitwake.c
@@ -210,13 +210,12 @@ static int futex_atomic_op_inuser(unsigned int encoded_op, u32 __user *uaddr)
 
 	if (encoded_op & (FUTEX_OP_OPARG_SHIFT << 28)) {
 		if (oparg < 0 || oparg > 31) {
-			char comm[sizeof(current->comm)];
 			/*
 			 * kill this print and return -EINVAL when userspace
 			 * is sane again
 			 */
-			pr_info_ratelimited("futex_wake_op: %s tries to shift op by %d; fix this program\n",
-					get_task_comm(comm, current), oparg);
+			pr_info_ratelimited("futex_wake_op: %pTN tries to shift op by %d; fix this program\n",
+					    current, oparg);
 			oparg &= 31;
 		}
 		oparg = 1 << oparg;
-- 
2.43.5

