Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C95439F72A3
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 03:35:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE3E10E276;
	Thu, 19 Dec 2024 02:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="louE8tOR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5AC210E276;
 Thu, 19 Dec 2024 02:35:11 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-728f1525565so395032b3a.1; 
 Wed, 18 Dec 2024 18:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734575711; x=1735180511; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GFcOX4O91tQFD6muydW9g9dtgYf4vZjGzF6jEGHBeGo=;
 b=louE8tOR+kUhbQ+RyuqH7dQ5YQoKfVXulHTuHvRxbuelUOe/BEpKuOIRLcYpCxbC7y
 +GgycZ1O5tMl+SgeCT/s2V4jgaOCOOBYsw5ThLh5LDayG0f+RkeLVxhjsGKRswiFCNa3
 A757U2HVx234Dz4/16JzNf/SJPhc/OcxcuEz53Fkm+Nzhka0fa2XXsYYV+MtmuE2qHBi
 5ZwkSMtbXPQT/vpqfVvrSdHtXAXciKAUMR5fNRPT1SNmqqzdtw+243BL7Y3iQ4slw2r3
 v+xnt9iZUWlQF8yTB1BdAFqEUze0cYatgQWT5kHq0xq6LNtDhM4SXp0CxgAF6wfEUHoL
 WQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734575711; x=1735180511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GFcOX4O91tQFD6muydW9g9dtgYf4vZjGzF6jEGHBeGo=;
 b=dDxRMoRCmTgJgGDIkJ9zrD6yNDS0BQrEi7LbFK82/idZJC10uaq88qEQvb+kQ26bnz
 U3/pVxI3XDT7nXoJIRjgFHCfDaYJ2vn2pN6GIX5siKrRZH1PQJ4thZbU/OR/HPFBoUFf
 gAPzWfAZjkbedv70NgX6IzCpDGtyz5+FWqqLWmxEUjoNabbLPQHxDuVhaWjiL1HW7EeP
 qKH3lpKgtAOyoUrvbipDd1/YdIxNcPRxbPYTNBv0MKNFBxDSK5h9mzlzlvOVIbFKEAV3
 gEBPS3lQ8HPwkqHHg+7BXUymN6BP+OtWD+E7WrXcBtrjY4oWvoAj6veGBENui78XmgiF
 Ww+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMU2Xvd40qo22wQZ05SrUuMI8SNwJqq51O40d+ZOzL7XrXDZi/jUE4+ZS1US5bZCf6HyseaU4vjA==@lists.freedesktop.org,
 AJvYcCX9ZMrKxziyaBjBFsJb7DWlN1sFcRQOeilNuzXdr9DeLf026cfn15p1rkROnCIZeU7WFzdBdsJGaj0=@lists.freedesktop.org,
 AJvYcCXb8y6UiTcinDF0a2l96ma+tBo6BLb07O4BBpKG3j+4qhu/sbZJMjtvF2Todcz/lR9xgKdl0pn/99t9@lists.freedesktop.org,
 AJvYcCXvOM7tY2o9Jp55SZpmVr4PDD/JOcjw40magbneSAOwhYZoK+vxSXPnYA1o+QrJX6+Y7RpscWGvdo8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvtVJuNNdAD2i/io51JG+3tuH6h68uUefnQj3CLaK2Rgo9y4XV
 tYlVM+CdqoycKQUb/43jj2ZCxiDBwqLzCzSUsCB0uC3DqFp6fY1T
X-Gm-Gg: ASbGncv2ye3gZlCf2ZDjevekWizjHO5D9N4emvwKcj5Cj95bClan/xXOadH4qP/Ywo+
 0PvM/Wve8vMI3LSzCTl3+dv5rdSLz0IuQX5eJXT+oJo24BILoVVNQnYqyRq7H6c0LX6emPKsjKc
 WlD2ePXh28pgbI1TDr9jx+0EMgM+sllnSpfDMfVthxEQSjxekLl5U2xn7YdSNBLSnNXfkFKXAvv
 V2raxNf2zmm+3q6yrIms9voV0T8R8juwkOuUrwJMGbMKMZMboBRFTxZbOE+nRnnj+zs/XI4b2HK
 D9lXLm0=
X-Google-Smtp-Source: AGHT+IF8uDHPAeHRKoSWXDpZOfxN83+9I3jRkG5wW7qXuv+87XI+9vIxsP70Tcc6kEOf0TdmQfwRSg==
X-Received: by 2002:a05:6a20:c6c2:b0:1e1:ca25:8da3 with SMTP id
 adf61e73a8af0-1e5b4820f26mr9200947637.20.1734575711218; 
 Wed, 18 Dec 2024 18:35:11 -0800 (PST)
Received: from localhost.localdomain ([180.159.118.224])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-842b821da83sm142163a12.40.2024.12.18.18.35.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 18 Dec 2024 18:35:10 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, pmladek@suse.com, kvalo@kernel.org,
 bp@alien8.de, andriy.shevchenko@linux.intel.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 x86@kernel.org, linux-snps-arc@lists.infradead.org,
 linux-wireless@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ocfs2-devel@lists.linux.dev,
 Yafang Shao <laoar.shao@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v2 2/5] arch: Remove get_task_comm() and print task comm
 directly
Date: Thu, 19 Dec 2024 10:34:49 +0800
Message-Id: <20241219023452.69907-3-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20241219023452.69907-1-laoar.shao@gmail.com>
References: <20241219023452.69907-1-laoar.shao@gmail.com>
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

Since task->comm is guaranteed to be NUL-terminated, we can print it
directly without the need to copy it into a separate buffer. This
simplifies the code and avoids unnecessary operations.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Cc: Vineet Gupta <vgupta@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/arc/kernel/unaligned.c | 5 ++---
 arch/x86/kernel/vm86_32.c   | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arc/kernel/unaligned.c b/arch/arc/kernel/unaligned.c
index d2f5ceaaed1b..3b2d8b1bd271 100644
--- a/arch/arc/kernel/unaligned.c
+++ b/arch/arc/kernel/unaligned.c
@@ -200,7 +200,6 @@ int misaligned_fixup(unsigned long address, struct pt_regs *regs,
 		     struct callee_regs *cregs)
 {
 	struct disasm_state state;
-	char buf[TASK_COMM_LEN];
 
 	/* handle user mode only and only if enabled by sysadmin */
 	if (!user_mode(regs) || !unaligned_enabled)
@@ -212,11 +211,11 @@ int misaligned_fixup(unsigned long address, struct pt_regs *regs,
 			     " performance significantly\n. To enable further"
 			     " logging of such instances, please \n"
 			     " echo 0 > /proc/sys/kernel/ignore-unaligned-usertrap\n",
-			     get_task_comm(buf, current), task_pid_nr(current));
+			     current->comm, task_pid_nr(current));
 	} else {
 		/* Add rate limiting if it gets down to it */
 		pr_warn("%s(%d): unaligned access to/from 0x%lx by PC: 0x%lx\n",
-			get_task_comm(buf, current), task_pid_nr(current),
+			current->comm, task_pid_nr(current),
 			address, regs->ret);
 
 	}
diff --git a/arch/x86/kernel/vm86_32.c b/arch/x86/kernel/vm86_32.c
index e9e803a4d44c..e6cc84143f3e 100644
--- a/arch/x86/kernel/vm86_32.c
+++ b/arch/x86/kernel/vm86_32.c
@@ -246,9 +246,8 @@ static long do_sys_vm86(struct vm86plus_struct __user *user_vm86, bool plus)
 
 	/* VM86_SCREEN_BITMAP had numerous bugs and appears to have no users. */
 	if (v.flags & VM86_SCREEN_BITMAP) {
-		char comm[TASK_COMM_LEN];
-
-		pr_info_once("vm86: '%s' uses VM86_SCREEN_BITMAP, which is no longer supported\n", get_task_comm(comm, current));
+		pr_info_once("vm86: '%s' uses VM86_SCREEN_BITMAP, which is no longer supported\n",
+			     current->comm);
 		return -EINVAL;
 	}
 
-- 
2.43.5

