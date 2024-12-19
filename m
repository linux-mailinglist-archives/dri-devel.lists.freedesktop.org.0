Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 079769F72A0
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 03:35:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A08C10E271;
	Thu, 19 Dec 2024 02:35:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HZe8BTSZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B661C10E271;
 Thu, 19 Dec 2024 02:35:06 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-216395e151bso2164065ad.0; 
 Wed, 18 Dec 2024 18:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734575706; x=1735180506; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6yZ75uwrgzXS/KAS9XiI4pfcH/Aa7U+Upt9QqSiD0i8=;
 b=HZe8BTSZyJ+q9OGkdxCCAQx+r1VJ6B4lUDaoZ2M/B4yhqxskkOvNxU6zAC3W3PMT4h
 KWyW3LYM8S+LqxSmySPt2PCo3ckrAXW+zfg1Ato2Y7CX3Nrrz8iE/1i9a6TKzHCNgkAM
 NQV4IoqRTDuVNIAUP0YAOG9XWVcgqXsLg8DWhrDupuHE/3a15y04Y25TZSVMNc1juPrp
 LCeyeAB8U5HXgmuSU0JQsmZFQjy+AGnJHxNLMIOjhQYmn25RICqpgrbivXW6AJngE/Q5
 6Rdo1hyUyog0wx3xMeeRevgmDrHUJvHC2B76D4OCvx1KJYTldxkCR0rekTrNkvpjtaqY
 yxfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734575706; x=1735180506;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6yZ75uwrgzXS/KAS9XiI4pfcH/Aa7U+Upt9QqSiD0i8=;
 b=cVJBrCDp5SBkUoscNKAeMHaMRaj7aLuWV3DeiWLav+vjezszTjRvPUpOAx3YFFmaZ1
 226StqDHF6xinC899zkP7R6l3wZPe4xKwdLgZqMXEIvGPr/Vo2xWS29OQ8UsCkTtQZFG
 Kst8ILvRAxsJVGLM0ubHVJqv7AAAsntEBgZya3Xh1+cXTpNL+DzuU+HHIoJpAxzryHGr
 eJDmxBlheEoFVsi5XRSm/pA5eyjgD+wdU1F+MCw46ZMCtnUwDFcYduB5FtNTtjgrHBrM
 iv5hPCtCQAPxrW+ZsqxBxBe590KKiGF6rkXfrsyzG3+CRIzbcVL3QzmuQMLPtbQTC1jH
 5CmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBgPoSAn2KpbigBv3DY4KGBBMY3cBh4DqF9kQ3YCMWCdUiUT4akv96y23TvOtoYG5LnjLJrllxc6g=@lists.freedesktop.org,
 AJvYcCVRrvozocophIB3uM2gcCkmJLVB60xXhJSTb4/GLTRBz567oSD0HDjas43MdatWuCOdyHm06/eQOZ35@lists.freedesktop.org,
 AJvYcCW0CxuwCRc1XwfsfZB6w8qu0otKqHN0ulV5+cAU2kE9CLKeRT6VTN82UCQVpjP08i8BA5yfSf02og==@lists.freedesktop.org,
 AJvYcCXhldZKnKlmJD0Y7TIq5ZlOTcb29dUyPGdvsdW8QgdyoX5z0P4skdYN10vodDT5pkklQKju21iGsBY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXA9GyD3/yxKsp6KZqGIh/sPetBIw79a9YKGKtU8ydT7BI0wdN
 cIBpXFQulhRv/bO4c6n+onMRyvBWBGFdIPjk44RY1kiwfjf2tWbV
X-Gm-Gg: ASbGncu+KmTEYn0K1MfqYLN34iq9z+fDiSQNQ4cSeoxGpcmn7zL6Rg8cbCJD08ewNst
 ZrZcFEBmdUsoZJMyNz6h3ndYxSP9A6NI645H/qn1Hlmu8HqblqRgcmjeJq27AXzfOJ54MZUK+Tm
 lD4af+Igevk+V5M9ZKF9Mxt5rB101NRw3Qg7lmV/aXFkJBwXyfws6FA1RlKXvQEfCuIW87kPdhH
 xJjW5CcqJSaaP9FQKjEASi1YRboP4Ur99zoY3EXc53ozrwWtD2mTTOs9Id6ICo0SzKKa3TRG9JB
 BHpYovQ=
X-Google-Smtp-Source: AGHT+IHDUXmWYVlYvXYhHIsD36N49JfOorXAToNFZUciCwG5nEYfG9fZ9g2sYrKUGUIeEzsd5pUGJQ==
X-Received: by 2002:a17:902:f689:b0:215:2d2c:dd0c with SMTP id
 d9443c01a7336-219da5e3b97mr23433885ad.14.1734575706180; 
 Wed, 18 Dec 2024 18:35:06 -0800 (PST)
Received: from localhost.localdomain ([180.159.118.224])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-842b821da83sm142163a12.40.2024.12.18.18.35.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 18 Dec 2024 18:35:05 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, pmladek@suse.com, kvalo@kernel.org,
 bp@alien8.de, andriy.shevchenko@linux.intel.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 x86@kernel.org, linux-snps-arc@lists.infradead.org,
 linux-wireless@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ocfs2-devel@lists.linux.dev,
 Yafang Shao <laoar.shao@gmail.com>, Serge Hallyn <serge@hallyn.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v2 1/5] kernel: Remove get_task_comm() and print task comm
 directly
Date: Thu, 19 Dec 2024 10:34:48 +0800
Message-Id: <20241219023452.69907-2-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20241219023452.69907-1-laoar.shao@gmail.com>
References: <20241219023452.69907-1-laoar.shao@gmail.com>
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
directly without the need to copy it into a separate buffer. This
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
 kernel/capability.c     | 8 ++------
 kernel/futex/waitwake.c | 3 +--
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/kernel/capability.c b/kernel/capability.c
index dac4df77e376..e089d2628c29 100644
--- a/kernel/capability.c
+++ b/kernel/capability.c
@@ -38,10 +38,8 @@ __setup("no_file_caps", file_caps_disable);
 
 static void warn_legacy_capability_use(void)
 {
-	char name[sizeof(current->comm)];
-
 	pr_info_once("warning: `%s' uses 32-bit capabilities (legacy support in use)\n",
-		     get_task_comm(name, current));
+		     current->comm);
 }
 
 /*
@@ -62,10 +60,8 @@ static void warn_legacy_capability_use(void)
 
 static void warn_deprecated_v2(void)
 {
-	char name[sizeof(current->comm)];
-
 	pr_info_once("warning: `%s' uses deprecated v2 capabilities in a way that may be insecure\n",
-		     get_task_comm(name, current));
+		     current->comm);
 }
 
 /*
diff --git a/kernel/futex/waitwake.c b/kernel/futex/waitwake.c
index 3a10375d9521..eb86a7ade06a 100644
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
 			pr_info_ratelimited("futex_wake_op: %s tries to shift op by %d; fix this program\n",
-					get_task_comm(comm, current), oparg);
+					    current->comm, oparg);
 			oparg &= 31;
 		}
 		oparg = 1 << oparg;
-- 
2.43.5

