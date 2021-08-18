Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 134BD3EFC6A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 08:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51BF86E444;
	Wed, 18 Aug 2021 06:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A36C6E440
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 06:24:18 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id r2so1185269pgl.10
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 23:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dkCK961ZyttB0QG+MUzGRc9GbPNZyJOzxDRl3nXU6Gc=;
 b=F3ghc0DUnRIAuSynTOo4HhTisr9dY2clGPt7Tp2ELGFpLUMoqQjF17RYWes7eco0Fp
 HKzP4hJH6W8dElSRC/l4MPe4WbDo+9mFg+K8Li9eyi19QvOkLGzu4axj3QbMT/3x3/oK
 4mFZNJ8jfnCy22ecNEUEUkyyEwRPO3Ye/ohuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dkCK961ZyttB0QG+MUzGRc9GbPNZyJOzxDRl3nXU6Gc=;
 b=dgf2p1OqiiCoBWcq9ux3dpRahop/uPMYw8Oa8QvXg6D7NWZZ5iQkYaLtxNhA1TUr5s
 ILJVI4fr2glgqC9Yyj0BnTTuhHH6aQMFX7RYWX8G+FEjkeFQJjNXNyfflOKrK4TCtMvr
 QUxfRqPnuJ9jRCGOcm59I1+eaz9L2Z9+4qqOwgA4SlwVpRlJ9UBFcL1Au/fKx9undHSp
 KKfxSYYn18SbvY11dSem8SQAeAbEiG6nUYKy3P5UpiDhnmHzSt932FiHbuIOJ45bE1L1
 nhDrSo7DS3/DuYZVj7TiGEZoZbxtsOHrTlJ+aLbqWI1BuP+K/5XcSFCifwEXT11T274a
 YRRA==
X-Gm-Message-State: AOAM533852tbAaXp5Zf2sSCSx0H9PqwXPe1q2PyFWHXrNm9kKJ9nj3hN
 m5O0lbC/+WT4vXbg7638C6CPfw==
X-Google-Smtp-Source: ABdhPJzB6Fpw5lksE03mTikq/l8Ungtb52rwsKcOwzebsF0lTq2QR4kdwv8iqtPBdlFbyxw6WcuEBA==
X-Received: by 2002:aa7:8c19:0:b0:3e1:4b9e:cf89 with SMTP id
 c25-20020aa78c19000000b003e14b9ecf89mr7683859pfd.58.1629267857641; 
 Tue, 17 Aug 2021 23:24:17 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id t18sm4582599pfg.111.2021.08.17.23.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 23:24:15 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Sudeep Holla <sudeep.holla@arm.com>, linuxppc-dev@lists.ozlabs.org,
 kernel test robot <lkp@intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-staging@lists.linux.dev, linux-block@vger.kernel.org,
 linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-hardening@vger.kernel.org
Subject: [PATCH v2 57/63] powerpc/signal32: Use struct_group() to zero spe regs
Date: Tue, 17 Aug 2021 23:05:27 -0700
Message-Id: <20210818060533.3569517-58-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818060533.3569517-1-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2908; h=from:subject;
 bh=uD1y/xoxNTfC/kMxy1YHPqDr4W4r5gvR6/3LUb/d/+Q=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHKMqjnaaYE2W2OottJ48+Kv314H+c4/L+2RqMHXv
 r7V1BciJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyjKgAKCRCJcvTf3G3AJgmYD/
 4xOx64rrId3koq1dIVBd1c7qtDRXBXq8ocvbv6TiAzQ5OW2IJsAcesmEDGB0aarLTux96zhVYvPuEY
 ekfg39GKhCgEPeb5jXP+UH57m9qopfeReANE1S4LvEsOJWuHGa5N2yh0MVFMYdstmPHkfTVtOzOdnW
 4FpfS36c3/G650GjYZjHYGK93aUv37ocoMf05CH9DSjWcOrGk+21jowTwXALShjZMmIjz5FWSiAPe+
 +1eUzjLiqUeJOGZ7Lv40/p3giVTD2/7lEzVVufOf7KMLHvSJmrltr2bLt88CSW+0Qs2cDc8kDwit4g
 NSusBANylY1K/6uJsrHXOzr8UYkdtB6bsttgeE9V1+wOYhLMeNib3XArxbwXJKppaNHkpLdAyqOc1N
 hNWxNmFkEb7gLQI+lgaRv2CySpbhIO+o8h7UWzfZ9W2P7Sz8/0+TLD68DRwxBbPxMHy7FpShanbdlR
 HAvsXrcU8SaCn8kjeuW7pbNPk+pnaYiQiMH5cl3iCfgq1I13gvGVNmMUEdqsNskPE6H1JjH3DkRQLj
 i7n33M3844UZk+msL24HAJukYQmiAtXqJDGZb3S179NpLnEREMRQveIz0XRN96WDiRCpbvwy644xQe
 qmxn1RnVllos5p0W46DDS5Z/a2ezsgCPxronRiihYw6gD81m/cUYTrPKHDSw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memset(), avoid intentionally writing across
neighboring fields.

Add a struct_group() for the spe registers so that memset() can correctly reason
about the size:

   In function 'fortify_memset_chk',
       inlined from 'restore_user_regs.part.0' at arch/powerpc/kernel/signal_32.c:539:3:
>> include/linux/fortify-string.h:195:4: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]
     195 |    __write_overflow_field();
         |    ^~~~~~~~~~~~~~~~~~~~~~~~

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/powerpc/include/asm/processor.h | 6 ++++--
 arch/powerpc/kernel/signal_32.c      | 6 +++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index f348e564f7dd..05dc567cb9a8 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -191,8 +191,10 @@ struct thread_struct {
 	int		used_vsr;	/* set if process has used VSX */
 #endif /* CONFIG_VSX */
 #ifdef CONFIG_SPE
-	unsigned long	evr[32];	/* upper 32-bits of SPE regs */
-	u64		acc;		/* Accumulator */
+	struct_group(spe,
+		unsigned long	evr[32];	/* upper 32-bits of SPE regs */
+		u64		acc;		/* Accumulator */
+	);
 	unsigned long	spefscr;	/* SPE & eFP status */
 	unsigned long	spefscr_last;	/* SPEFSCR value on last prctl
 					   call or trap return */
diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index 0608581967f0..77b86caf5c51 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -532,11 +532,11 @@ static long restore_user_regs(struct pt_regs *regs,
 	regs_set_return_msr(regs, regs->msr & ~MSR_SPE);
 	if (msr & MSR_SPE) {
 		/* restore spe registers from the stack */
-		unsafe_copy_from_user(current->thread.evr, &sr->mc_vregs,
-				      ELF_NEVRREG * sizeof(u32), failed);
+		unsafe_copy_from_user(&current->thread.spe, &sr->mc_vregs,
+				      sizeof(current->thread.spe), failed);
 		current->thread.used_spe = true;
 	} else if (current->thread.used_spe)
-		memset(current->thread.evr, 0, ELF_NEVRREG * sizeof(u32));
+		memset(&current->thread.spe, 0, sizeof(current->thread.spe));
 
 	/* Always get SPEFSCR back */
 	unsafe_get_user(current->thread.spefscr, (u32 __user *)&sr->mc_vregs + ELF_NEVRREG, failed);
-- 
2.30.2

