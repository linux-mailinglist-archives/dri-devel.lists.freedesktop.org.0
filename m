Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D534126D1
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 21:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A0A6E838;
	Mon, 20 Sep 2021 19:23:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D22036E838
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 19:23:43 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id z24so45922111lfu.13
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 12:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lfxmCAIn9aHEGlNTCFP6oI4sdv4GtF/cTPp74Gw1WBM=;
 b=51peZIPp0Z/EhYUJjOrVhklffvLaouyg2C5XP2pPvI6GKpQqRTRJNH9z0riNU6JUST
 o0XwKLmOpbRlulubaDys5ESijC7RfZDY0btoMVLhd24Wbuq4HCPaAcFG5bL/hMGrqGtL
 7xl5z5ix8Uq+1/IFKbmMGW0qkcT6Kblu2SXf54ogQOpF0XmbXZnVwYt6ayxUDZ2i0zc5
 ndwQC+lLTjKOM/5Nx96ULxzCt3Is+WBaiGfGuvvkAWuKo2L9VaqIf1rPaXJawFd0DZaR
 UVhdwOrDahN59n5xgeFFwe62qLfoeS4Srs8f0W8HdLOxbwittlQusCzObDZLZ8VTA7Ay
 5WSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lfxmCAIn9aHEGlNTCFP6oI4sdv4GtF/cTPp74Gw1WBM=;
 b=DKj+KGQd37j+eI3oULwGIYSS03Ey1KvN73dtFSCiLjY+b9oK17c0JyXFxbdoEA24Tm
 tl9GivF8F8IJPaWLlG1cIMaBSA4KcS7CYCFgVVa+STvlxoiNjycQCuHEQeHbvrWT0Uyv
 GTTuKeWuEk4syKnAhIvaIhceeex/2T2mMOGErI8/ZOkpM9CyekB5czzB1FufOFTW/1L3
 0JNlcqiZZwwAvYM7n6nCIt2cVwuXVDZ6q3U2Zczdk/u24qsogb2i6P5IEZQJHbC7PWcA
 0EMPe15J7OTpgvonX45mfREUKaYpvrcCyAkzkZuUxopX5lKAZPmhSjKf+ejlxSygX+BI
 aLzA==
X-Gm-Message-State: AOAM533x6uPYUsGptrVbI4k8l0Aj7vb/dzxofJ5yO8ynHv9XgkgGEPEB
 sb0NKqvXikpidxyOzsJGW92vjA==
X-Google-Smtp-Source: ABdhPJzBd1RwKOZT1XWwd9VMdTBk2dtlBYL+yyroRGVVu01s956l3lUsknRhzDPFsjv00pVQxtEqOw==
X-Received: by 2002:a05:651c:83:: with SMTP id
 3mr23323003ljq.341.1632165822010; 
 Mon, 20 Sep 2021 12:23:42 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id j21sm1858858ljh.87.2021.09.20.12.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 12:23:41 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id B961C103053; Mon, 20 Sep 2021 22:23:41 +0300 (+03)
Date: Mon, 20 Sep 2021 22:23:41 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 iommu@lists.linux-foundation.org, kvm@vger.kernel.org,
 linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-graphics-maintainer@vmware.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kexec@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Brijesh Singh <brijesh.singh@amd.com>,
 Joerg Roedel <joro@8bytes.org>, Andi Kleen <ak@linux.intel.com>,
 Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>,
 Christoph Hellwig <hch@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3 5/8] x86/sme: Replace occurrences of sme_active() with
 cc_platform_has()
Message-ID: <20210920192341.maue7db4lcbdn46x@box.shutemov.name>
References: <cover.1631141919.git.thomas.lendacky@amd.com>
 <367624d43d35d61d5c97a8b289d9ddae223636e9.1631141919.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <367624d43d35d61d5c97a8b289d9ddae223636e9.1631141919.git.thomas.lendacky@amd.com>
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

On Wed, Sep 08, 2021 at 05:58:36PM -0500, Tom Lendacky wrote:
> diff --git a/arch/x86/mm/mem_encrypt_identity.c b/arch/x86/mm/mem_encrypt_identity.c
> index 470b20208430..eff4d19f9cb4 100644
> --- a/arch/x86/mm/mem_encrypt_identity.c
> +++ b/arch/x86/mm/mem_encrypt_identity.c
> @@ -30,6 +30,7 @@
>  #include <linux/kernel.h>
>  #include <linux/mm.h>
>  #include <linux/mem_encrypt.h>
> +#include <linux/cc_platform.h>
>  
>  #include <asm/setup.h>
>  #include <asm/sections.h>
> @@ -287,7 +288,7 @@ void __init sme_encrypt_kernel(struct boot_params *bp)
>  	unsigned long pgtable_area_len;
>  	unsigned long decrypted_base;
>  
> -	if (!sme_active())
> +	if (!cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT))
>  		return;
>  
>  	/*

This change break boot for me (in KVM on Intel host). It only reproduces
with allyesconfig. More reasonable config works fine, but I didn't try to
find exact cause in config.

Convertion to cc_platform_has() in __startup_64() in 8/8 has the same
effect.

I believe it caused by sme_me_mask access from __startup_64() without
fixup_pointer() magic. I think __startup_64() requires special treatement
and we should avoid cc_platform_has() there (or have a special version of
the helper). Note that only AMD requires these cc_platform_has() to return
true.

-- 
 Kirill A. Shutemov
