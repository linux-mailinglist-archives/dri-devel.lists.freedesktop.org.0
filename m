Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 939089F0453
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 06:47:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AEAE10E441;
	Fri, 13 Dec 2024 05:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HKckgVgk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9276B10E441;
 Fri, 13 Dec 2024 05:47:07 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2165448243fso14748985ad.1; 
 Thu, 12 Dec 2024 21:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734068827; x=1734673627; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EmVT0W96xTTbgIHaje9qHPh+sH+dkYFHuEVe3qXraIA=;
 b=HKckgVgkXR8lst/xQOO3A2Mllj2EiENfQvsczcRf40JZ8kQ4LE4Bjaf0MGldiIp9zi
 BzxOUnDqs1inF7fjN8unovxw2On1rf3KkmAcdOWmvfzgDi7pEJDb95LFdDlpsEJAOVXL
 ZAoFzoPmeeT0Bc5sp9nAR0rkX7OBjhXMdc6ugKMeo7gHsk2JSaEtnf1zlTrWzagDnKVX
 t8UM0YM50PU1JaRQPj39715TJ7JGudUMJkFT8UXjHyqeE5iQ/a+F7Uais91E4Okrt7ku
 11Ut8avMT1uCtb7SuR87kmQymPz8K2DyddG1py8+W/fS3Fcyi23MnTk/kxevPhViBulf
 J9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734068827; x=1734673627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EmVT0W96xTTbgIHaje9qHPh+sH+dkYFHuEVe3qXraIA=;
 b=cweL9r/SN64G1vndWKSSPAsNjvOVffgBaQy3qOo9+Aebs3KV5EMTV2ON0bIA2YWaKl
 cR/+v0hDyozhPvmvL7cqw9f4L5ntvJkl7mMkWQerGzBYp2kk+KCLMsJTMmaoItR2+cR4
 2uw1Qru0v65w7PMkXp7r8t4zXD8G69kNvMIEvlyZtvSm4XbpT75GHGr7byniPXz5YGBk
 WpyQIvqo26lwuiKwf1Sw0Rf/881kRn2hK6M3/mzVvfvsHUsm3dkrt9h2sv572fz96kjR
 XP5zyonkQ7G2JKhPEy+zGlYeVdITo3seFGlGqzPuS6xpf510wJVxs2PkkDZMr3x4SQtj
 BFFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUN2YJJoXHS8uOMOcwhi0kBh0irYqPhWPrb/XkDwdEEjkOllaOGxwW9ZFA9Lck2fbB6KlRi729FTKAD@lists.freedesktop.org,
 AJvYcCV+bwF/zGLLVcUMG2LEjMXjsK446F6JqEJLyUUQ8HNkzjWj+/x2tLwWNOS5+haDLXr6zyERu4bZC3g=@lists.freedesktop.org,
 AJvYcCVIkCuDOr5mzMGO9X6ILsRQODbUJBSddIZBQKou7xp5JH7XtA9yui+S7N+Eces+wruzIQAhC9Oy+g==@lists.freedesktop.org,
 AJvYcCXVG+IDi/KPyaih+MOts/dfhYxnXTWqdhDeXqCq9xkhrJ1Pjv0MgUyIeQVm9emswz7YCVnSIK35qPE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvC01oMfJ6XRQBJ0psznOgFjqohGH8n5B4KbLDCgmH9b7eRrM9
 X6lAOG1KDOKkqUslA/OamNobhlZbFbKW8KWPF+2Zb/8insutdDz/
X-Gm-Gg: ASbGnctgchtJyQbmurXVAeDNQrVAKrlWKUvNrFFtO8oGuhpdAaozgKdjWtPVvLqDsbq
 oHcQOitf2UtzOxDoVMZDu83wQAe6TEV3+c7sh2ZSMtu6seRMaV1GxhstvPAQGXuzCnghtzIYzME
 ik6Ym0TLZQ3A5MY+joEKljdfq0Hs/UmKLfWlq5sSwLdtJ0ZlpsYPMT1W5bsQwafcNJFye1O7mdd
 XLBS0eBmFsIrKf3wu/Rpm6sOrwSYN7ZKRN0aDDtg3PtdYOX3JSyAR/KS9NpLCTd+LPgbsZ895dk
 IUWc0/0=
X-Google-Smtp-Source: AGHT+IGGw/OV/ScatMLc+XWrd5qwOO8iHzpYdxpzWycga8KUsVtQ1P1ntSP55wYL5SQs/JpC5cq7/g==
X-Received: by 2002:a17:902:d484:b0:215:431f:268f with SMTP id
 d9443c01a7336-21892999536mr21105555ad.10.1734068827157; 
 Thu, 12 Dec 2024 21:47:07 -0800 (PST)
Received: from localhost.localdomain ([180.159.118.224])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-216483dd292sm82564985ad.226.2024.12.12.21.47.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Dec 2024 21:47:06 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org,
	akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 x86@kernel.org, linux-snps-arc@lists.infradead.org,
 linux-wireless@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ocfs2-devel@lists.linux.dev,
 Yafang Shao <laoar.shao@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 3/7] arch: Replace get_task_comm() with %pTN
Date: Fri, 13 Dec 2024 13:46:06 +0800
Message-Id: <20241213054610.55843-4-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20241213054610.55843-1-laoar.shao@gmail.com>
References: <20241213054610.55843-1-laoar.shao@gmail.com>
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
 arch/arc/kernel/unaligned.c | 9 ++++-----
 arch/x86/kernel/vm86_32.c   | 5 ++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/arc/kernel/unaligned.c b/arch/arc/kernel/unaligned.c
index d2f5ceaaed1b..fb8e995823e3 100644
--- a/arch/arc/kernel/unaligned.c
+++ b/arch/arc/kernel/unaligned.c
@@ -200,23 +200,22 @@ int misaligned_fixup(unsigned long address, struct pt_regs *regs,
 		     struct callee_regs *cregs)
 {
 	struct disasm_state state;
-	char buf[TASK_COMM_LEN];
 
 	/* handle user mode only and only if enabled by sysadmin */
 	if (!user_mode(regs) || !unaligned_enabled)
 		return 1;
 
 	if (no_unaligned_warning) {
-		pr_warn_once("%s(%d) made unaligned access which was emulated"
+		pr_warn_once("%pTN(%d) made unaligned access which was emulated"
 			     " by kernel assist\n. This can degrade application"
 			     " performance significantly\n. To enable further"
 			     " logging of such instances, please \n"
 			     " echo 0 > /proc/sys/kernel/ignore-unaligned-usertrap\n",
-			     get_task_comm(buf, current), task_pid_nr(current));
+			     current, task_pid_nr(current));
 	} else {
 		/* Add rate limiting if it gets down to it */
-		pr_warn("%s(%d): unaligned access to/from 0x%lx by PC: 0x%lx\n",
-			get_task_comm(buf, current), task_pid_nr(current),
+		pr_warn("%pTN(%d): unaligned access to/from 0x%lx by PC: 0x%lx\n",
+			current, task_pid_nr(current),
 			address, regs->ret);
 
 	}
diff --git a/arch/x86/kernel/vm86_32.c b/arch/x86/kernel/vm86_32.c
index e9e803a4d44c..1f55d5c2628d 100644
--- a/arch/x86/kernel/vm86_32.c
+++ b/arch/x86/kernel/vm86_32.c
@@ -246,9 +246,8 @@ static long do_sys_vm86(struct vm86plus_struct __user *user_vm86, bool plus)
 
 	/* VM86_SCREEN_BITMAP had numerous bugs and appears to have no users. */
 	if (v.flags & VM86_SCREEN_BITMAP) {
-		char comm[TASK_COMM_LEN];
-
-		pr_info_once("vm86: '%s' uses VM86_SCREEN_BITMAP, which is no longer supported\n", get_task_comm(comm, current));
+		pr_info_once("vm86: '%pTN' uses VM86_SCREEN_BITMAP, which is no longer supported\n",
+			     current);
 		return -EINVAL;
 	}
 
-- 
2.43.5

