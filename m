Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CB98D0930
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 19:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E930C10E098;
	Mon, 27 May 2024 17:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.b="UqEHkVvt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEEFD10E098
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 17:08:12 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4533540E01E8; 
 Mon, 27 May 2024 17:08:10 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id bimxyUlM5shO; Mon, 27 May 2024 17:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1716829686; bh=zzMPJ6U6LHHCwo8zSeCN578JvIc5clkBHFvMwav3ulA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UqEHkVvtmndf7yBXhPjClvB23jAwbCH2y9mrqWuQVDLzPL5LKRkma5X0WAIXAslDI
 OWVmIJ6/GQh6MyHgNXH12gJzDPwF0OdhwM57t/S13aSva8RZqSNOaZBXycdRifKOfv
 0nvKCVZHTyaWAw7nHg6JeCT936cjd8IHWbDZetP9R64GkqGGbhn/Rq2o5O1lyk3xV/
 nYbgRJAb6ONjxRmC5hUl9xcu+okxrmSuyhHurHx00V4k20COwpr6rwpzQwAnyXHLMV
 m+czfkJWEL1NjV2TVhDcJ7mBL7mIdcM1fI5dycnLvxv1o9EI8YpByQh6R2sDWMk4An
 cyNP5dzV8x2tieKXMH4ReySNhZogLEwuhTGWdRnt928uQUmNRt4zprDoIAHQL2n21X
 lXVQ8ULIoVGrW3v4XqisVCko5CYOCA7b7kJ3zZKQ0w+pU8jRgndQBA4PekevN9v4C/
 w3YVJhZ84GxfQ2Jik3lPfedBlRPhMRAq2l2f+Vcoqu4HBD5/+MgUTgLY61H9GyG6+u
 foPRRlYX+NMMmBytfFA9fURUfzSdFIQaPgb/IPIcecIx2VtLoNK4Odm8q386PsdDba
 yPB0wl/TmUP+FPiUpIIrpy1wELmaq/xXv7yeZPb769FOhG57ozS+Z17YhfsAIYc+rJ
 8LVjMkN2N08NqOt51W4fqTAo=
Received: from zn.tnic (p5de8ee85.dip0.t-ipconnect.de [93.232.238.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2CF0E40E016A;
 Mon, 27 May 2024 17:07:41 +0000 (UTC)
Date: Mon, 27 May 2024 19:07:34 +0200
From: Borislav Petkov <bp@alien8.de>
To: Alexey Makhalov <alexey.makhalov@broadcom.com>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 hpa@zytor.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 tglx@linutronix.de, x86@kernel.org, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-input@vger.kernel.org,
 dmitry.torokhov@gmail.com, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com, pv-drivers@vmware.com,
 timothym@vmware.com, akaher@vmware.com,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, horms@kernel.org,
 kirill.shutemov@linux.intel.com
Subject: Re: [PATCH v10 1/8] x86/vmware: Introduce VMware hypercall API
Message-ID: <20240527170734.GCZlS91uXD68HRN1na@fat_crate.local>
References: <20240523191446.54695-1-alexey.makhalov@broadcom.com>
 <20240523191446.54695-2-alexey.makhalov@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240523191446.54695-2-alexey.makhalov@broadcom.com>
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

On Thu, May 23, 2024 at 12:14:39PM -0700, Alexey Makhalov wrote:
> +#define VMWARE_HYPERCALL						\
> +	ALTERNATIVE_3("",						\
> +		      "jmp .Lport_call%=", X86_FEATURE_HYPERVISOR,	\
> +		      "jmp .Lvmcall%=", X86_FEATURE_VMCALL,		\
> +		      "vmmcall\n\t"					\
> +		      "jmp .Lend%=", X86_FEATURE_VMW_VMMCALL)		\
> +		      "cmpb $"						\
> +			__stringify(CPUID_VMWARE_FEATURES_ECX_VMMCALL)	\
> +			", %[mode]\n\t"					\
> +		      "jg .Lvmcall%=\n\t"				\
> +		      "je .Lvmmcall%=\n\t"				\
> +		      ".Lport_call%=: movw %[port], %%dx\n\t"		\
> +		      "inl (%%dx), %%eax\n\t"				\
> +		      "jmp .Lend%=\n\t"					\
> +		      ".Lvmmcall%=: vmmcall\n\t"			\
> +		      "jmp .Lend%=\n\t"					\
> +		      ".Lvmcall%=: vmcall\n\t"				\
> +		      ".Lend%=:"

So applied (and with minor fixups for the proper indentation, see end of
this mail) this looks like this:

.pushsection .altinstructions,"a"
 .long 661b - .
 .long 6641f - .
 .4byte ( 4*32+31)
 .byte 663b-661b
 .byte 6651f-6641f
 .long 661b - .
 .long 6642f - .
 .4byte ( 8*32+18)
 .byte 663b-661b
 .byte 6652f-6642f
 .long 661b - .
 .long 6643f - .
 .4byte ( 8*32+19)
 .byte 663b-661b
 .byte 6653f-6643f
.popsection
.pushsection .altinstr_replacement, "ax"
# ALT: replacement 1
6641:
        jmp .Lport_call72
6651:
# ALT: replacement 2
6642:
        jmp .Lvmcall72
6652:
# ALT: replacement 3
6643:
        vmmcall
        jmp .Lend72
6653:
.popsection
        cmpb $((((1UL))) << (0)), vmware_hypercall_mode(%rip)   # vmware_hypercall_mode
        jg .Lvmcall72
        je .Lvmmcall72
.Lport_call72:
        movw $22104, %dx        #
        inl (%dx), %eax
        jmp .Lend72
.Lvmmcall72:
        vmmcall
        jmp .Lend72 
.Lvmcall72:
        vmcall
.Lend72:

---

so AFAICT, you want three things:

1. X86_FEATURE_HYPERVISOR - that is always set when running as a guest.
   For that it should do:

        movw $22104, %dx        #
        inl (%dx), %eax

2. X86_FEATURE_VMCALL:

	vmcall

3. X86_FEATURE_VMW_VMMCALL:

	vmmcall

So why don't you simply do that?

vmware_set_capabilities() sets vmware_hypercall_mode *and* those feature
flags at the same time.

And you either support VMCALL or VMMCALL so the first thing should be the
fallback for some ancient crap.

IOW, your hypercall alternative should simply be:

	ALTERNATIVE_2("vmcall", "vmmcall", X86_FEATURE_VMW_VMMCALL, "movw %[port], %%dx; "inl (%%dx), %%eax", X86_FEATURE_HYPERVISOR);

without any more silly dance?

Hmmm?

---

Fixup indentation for proper .s output:

diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
index 5114f4c75c54..8be877d8bb7c 100644
--- a/arch/x86/include/asm/vmware.h
+++ b/arch/x86/include/asm/vmware.h
@@ -70,17 +70,18 @@ extern u8 vmware_hypercall_mode;
 		      "jmp .Lvmcall%=", X86_FEATURE_VMCALL,		\
 		      "vmmcall\n\t"					\
 		      "jmp .Lend%=", X86_FEATURE_VMW_VMMCALL)		\
-		      "cmpb $"						\
-			__stringify(CPUID_VMWARE_FEATURES_ECX_VMMCALL)	\
-			", %[mode]\n\t"					\
+		      "\tcmpb $" __stringify(CPUID_VMWARE_FEATURES_ECX_VMMCALL) ", %[mode]\n\t" \
 		      "jg .Lvmcall%=\n\t"				\
-		      "je .Lvmmcall%=\n\t"				\
-		      ".Lport_call%=: movw %[port], %%dx\n\t"		\
+		      "je .Lvmmcall%=\n"				\
+		      ".Lport_call%=:\n\t"				\
+		      "movw %[port], %%dx\n\t"				\
 		      "inl (%%dx), %%eax\n\t"				\
-		      "jmp .Lend%=\n\t"					\
-		      ".Lvmmcall%=: vmmcall\n\t"			\
-		      "jmp .Lend%=\n\t"					\
-		      ".Lvmcall%=: vmcall\n\t"				\
+		      "jmp .Lend%=\n"					\
+		      ".Lvmmcall%=:\n\t"				\
+		      "vmmcall\n\t"					\
+		      "jmp .Lend%=\n"					\
+		      ".Lvmcall%=:\n\t"					\
+		      "vmcall\n"					\
 		      ".Lend%=:"
 
 static inline


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
