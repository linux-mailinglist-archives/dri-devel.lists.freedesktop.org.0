Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BB3718947
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 20:21:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A05E210E50D;
	Wed, 31 May 2023 18:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 390 seconds by postgrey-1.36 at gabe;
 Wed, 31 May 2023 18:20:54 UTC
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6774D10E50D
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 18:20:54 +0000 (UTC)
Received: from zn.tnic (pd9530d32.dip0.t-ipconnect.de [217.83.13.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9779C1EC042D;
 Wed, 31 May 2023 20:14:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1685556857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ShXFZDFEDmPlX5Y3XBvXdK5GQ9yQ1nqotnDFM/A0v50=;
 b=pSEmarCJ7ae6RE2dRKTy4kIE02HMibao+y7kGU9agAA2DuF8wAfoL5qq1I+OlPHwsjAX8h
 c43XOwoKhOSLLUUBEzqTdf3i49wT0Excdpw2bFcleHfp+yxHzMJqYSc8wNl6UpluFmcUYq
 WO9QuqV6jYjwZkzRbDAZ7cGF6gVIWU8=
Date: Wed, 31 May 2023 20:14:12 +0200
From: Borislav Petkov <bp@alien8.de>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Juergen Gross <jgross@suse.com>
Subject: Re: [RESUBMIT][PATCH] x86/mm: Fix PAT bit missing from page
 protection modify mask
Message-ID: <20230531181412.GFZHeOdMHIGOXB2hwL@fat_crate.local>
References: <20230519183634.190364-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230519183634.190364-1-janusz.krzysztofik@linux.intel.com>
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
Cc: x86@kernel.org, Yu Zhao <yuzhao@google.com>,
 David Hildenbrand <david@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, drm-intel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 Ingo Molnar <mingo@redhat.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 19, 2023 at 08:36:34PM +0200, Janusz Krzysztofik wrote:
> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
> index 15ae4d6ba4768..56466afd04307 100644
> --- a/arch/x86/include/asm/pgtable.h
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -654,8 +654,10 @@ static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
>  #define pgprot_modify pgprot_modify
>  static inline pgprot_t pgprot_modify(pgprot_t oldprot, pgprot_t newprot)
>  {
> -	pgprotval_t preservebits = pgprot_val(oldprot) & _PAGE_CHG_MASK;
> -	pgprotval_t addbits = pgprot_val(newprot) & ~_PAGE_CHG_MASK;
> +	unsigned long mask = _PAGE_CHG_MASK | _PAGE_CACHE_MASK;
> +
> +	pgprotval_t preservebits = pgprot_val(oldprot) & mask;
> +	pgprotval_t addbits = pgprot_val(newprot) & ~mask;
>  	return __pgprot(preservebits | addbits);
>  }
>  
> -- 

This certainly needs Jürgen and he's on CC already, moving him to To:.

Also, why isn't this a Xen-specific fix but you're keeping _PAGE_PAT for
baremetal too, i.e., modifying the generic function?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
