Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1053F0791
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 17:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2BD16E914;
	Wed, 18 Aug 2021 15:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA0C6E914
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 15:11:35 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id q2so1960041plr.11
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 08:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BATSV86SaK5afBXIFxzdzZX4j4EhGdui2K0OHBJGQcw=;
 b=nKyY7H15ZclPASn0mrCWStoJsQEVzP5/BmW4V3jtYB1HxVdnZRQQ4l+PtPCRG/dTV6
 xfDqZKumuBc2DNoifQ7E+k+2RHNCKiMDNP3onIJnlrl5OiL/2iza72Z9iX+5k4rKwpSO
 /m3Ffp/F03wd5BcOk1ihua3YxRddIsYpot1qTBRf+xRtenjeQ4qFFoOSIN66Jft6TSfW
 c2t4wMFRzHKGD7LvgQQ/GVhG8mAh1vCDNxP/Inly9yMM79tpqdyKRQdjifrNITzwA6c7
 yGxl1c2NhdVpvxPZ2G3/l6okDceS2O7mIXsDYuviCR6t29nOh+UDrTcg3BH0FRZEUvzE
 zLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BATSV86SaK5afBXIFxzdzZX4j4EhGdui2K0OHBJGQcw=;
 b=ccyTO7CZrpeQ5400gek8ODgmlv29atOTksSVC56EDS8nqd99FXxbCmZ3pLjqiZEWmP
 0hwK8iS79bGgTPSUHETjoubGfbLDpFvfXqPPYZs0ctu3ysSKAQvRVdnkKujPVhYqTE7w
 yY8s3m9yAL9a63ENS6CUWi8dk6rkePS7VII1l1i787FjtCHfChoOXIUKiKEBvw6dwqKQ
 GNu+8neza8VNZukx50fRYqjJZRAVWzJ7NpYln4A6jiPSUjLzhwX8JJQaTStFnMnJrnBh
 aqkgUAkwr50X9VrwuIPiqXUxgwIhg8WPZgkw58dVp/sTjWGakC8L0M+y/jc+/NXJLXAu
 /kRQ==
X-Gm-Message-State: AOAM532tamnLwtjDnKnGEaen1PzrYLe4WF9FBJkvm41GtR1WKJoFMH/S
 vjf3Re9UqnGdAkSAQ754kKSpjg==
X-Google-Smtp-Source: ABdhPJyb9v3aI2ukGkg+KeS46DSybL7HwTNvsJIGANZduqIYX0SVbX0PrpsQIc/aOBu7eADDQMvgoA==
X-Received: by 2002:a17:90b:1e03:: with SMTP id
 pg3mr9751970pjb.203.1629299494765; 
 Wed, 18 Aug 2021 08:11:34 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id m7sm28291pfc.212.2021.08.18.08.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 08:11:34 -0700 (PDT)
Date: Wed, 18 Aug 2021 15:11:28 +0000
From: Sean Christopherson <seanjc@google.com>
To: Kees Cook <keescook@chromium.org>
Cc: linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 kvm@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev,
 linux-block@vger.kernel.org, linux-kbuild@vger.kernel.org,
 clang-built-linux@googlegroups.com,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 53/63] KVM: x86: Use struct_group() to zero decode cache
Message-ID: <YR0jIEzEcUom/7rd@google.com>
References: <20210818060533.3569517-1-keescook@chromium.org>
 <20210818060533.3569517-54-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818060533.3569517-54-keescook@chromium.org>
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

On Tue, Aug 17, 2021, Kees Cook wrote:
>  arch/x86/kvm/emulate.c     |  3 +--
>  arch/x86/kvm/kvm_emulate.h | 19 +++++++++++--------
>  2 files changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/x86/kvm/emulate.c b/arch/x86/kvm/emulate.c
> index 2837110e66ed..2608a047e769 100644
> --- a/arch/x86/kvm/emulate.c
> +++ b/arch/x86/kvm/emulate.c
> @@ -5377,8 +5377,7 @@ static int fastop(struct x86_emulate_ctxt *ctxt, fastop_t fop)
>  
>  void init_decode_cache(struct x86_emulate_ctxt *ctxt)
>  {
> -	memset(&ctxt->rip_relative, 0,
> -	       (void *)&ctxt->modrm - (void *)&ctxt->rip_relative);
> +	memset(&ctxt->decode_cache, 0, sizeof(ctxt->decode_cache));
>  
>  	ctxt->io_read.pos = 0;
>  	ctxt->io_read.end = 0;
> diff --git a/arch/x86/kvm/kvm_emulate.h b/arch/x86/kvm/kvm_emulate.h
> index 68b420289d7e..9b8afcb8ad39 100644
> --- a/arch/x86/kvm/kvm_emulate.h
> +++ b/arch/x86/kvm/kvm_emulate.h
> @@ -341,14 +341,17 @@ struct x86_emulate_ctxt {
>  	 * the rest are initialized unconditionally in x86_decode_insn
>  	 * or elsewhere
>  	 */
> -	bool rip_relative;
> -	u8 rex_prefix;
> -	u8 lock_prefix;
> -	u8 rep_prefix;
> -	/* bitmaps of registers in _regs[] that can be read */
> -	u32 regs_valid;
> -	/* bitmaps of registers in _regs[] that have been written */
> -	u32 regs_dirty;
> +	struct_group(decode_cache,

This is somewhat misleading because half of this struct is the so called "decode
cache", not just these six fields.

KVM's "optimization" is quite ridiculous as this has never been such a hot path
that saving a few mov instructions would be noticeable.  And hilariously, the
"optimization" is completely unnecessary because both gcc and clang are clever
enough to batch the first five into a movq even when zeroing the fields individually.

So, I would much prefer to go with the following:

From dbdca1f4cd01fee418c252e54c360d518b2b1ad6 Mon Sep 17 00:00:00 2001
From: Sean Christopherson <seanjc@google.com>
Date: Wed, 18 Aug 2021 08:03:08 -0700
Subject: [PATCH] KVM: x86: Replace memset() "optimization" with normal
 per-field writes

Explicitly zero select fields in the emulator's decode cache instead of
zeroing the fields via a gross memset() that spans six fields.  gcc and
clang are both clever enough to batch the first five fields into a single
quadword MOV, i.e. memset() and individually zeroing generate identical
code.

Removing the wart also prepares KVM for FORTIFY_SOURCE performing
compile-time and run-time field bounds checking for memset().

No functional change intended.

Reported-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/emulate.c     | 9 +++++++--
 arch/x86/kvm/kvm_emulate.h | 6 +-----
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kvm/emulate.c b/arch/x86/kvm/emulate.c
index 2837110e66ed..bf81fd017e7f 100644
--- a/arch/x86/kvm/emulate.c
+++ b/arch/x86/kvm/emulate.c
@@ -5377,8 +5377,13 @@ static int fastop(struct x86_emulate_ctxt *ctxt, fastop_t fop)

 void init_decode_cache(struct x86_emulate_ctxt *ctxt)
 {
-	memset(&ctxt->rip_relative, 0,
-	       (void *)&ctxt->modrm - (void *)&ctxt->rip_relative);
+	/* Clear fields that are set conditionally but read without a guard. */
+	ctxt->rip_relative = false;
+	ctxt->rex_prefix = 0;
+	ctxt->lock_prefix = 0;
+	ctxt->rep_prefix = 0;
+	ctxt->regs_valid = 0;
+	ctxt->regs_dirty = 0;

 	ctxt->io_read.pos = 0;
 	ctxt->io_read.end = 0;
diff --git a/arch/x86/kvm/kvm_emulate.h b/arch/x86/kvm/kvm_emulate.h
index 68b420289d7e..bc1fecacccd4 100644
--- a/arch/x86/kvm/kvm_emulate.h
+++ b/arch/x86/kvm/kvm_emulate.h
@@ -336,11 +336,7 @@ struct x86_emulate_ctxt {
 		fastop_t fop;
 	};
 	int (*check_perm)(struct x86_emulate_ctxt *ctxt);
-	/*
-	 * The following six fields are cleared together,
-	 * the rest are initialized unconditionally in x86_decode_insn
-	 * or elsewhere
-	 */
+
 	bool rip_relative;
 	u8 rex_prefix;
 	u8 lock_prefix;
--
2.33.0.rc1.237.g0d66db33f3-goog

> +		bool rip_relative;
> +		u8 rex_prefix;
> +		u8 lock_prefix;
> +		u8 rep_prefix;
> +		/* bitmaps of registers in _regs[] that can be read */
> +		u32 regs_valid;
> +		/* bitmaps of registers in _regs[] that have been written */
> +		u32 regs_dirty;
> +	);
> +
>  	/* modrm */
>  	u8 modrm;
>  	u8 modrm_mod;
> -- 
> 2.30.2
> 
