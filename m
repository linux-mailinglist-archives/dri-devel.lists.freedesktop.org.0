Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B5A413C49
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 23:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D756E5BF;
	Tue, 21 Sep 2021 21:21:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809C26E5BF
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 21:21:00 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id b20so3096257lfv.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 14:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GYWKxxwDs0cZgU7zoLo4TUhsJ8M50sSfexrGGa7nvK0=;
 b=6GA+nKi4dJGN5Y/djnNixBrKu6T3pljCu3U/BgzvrwouwWOron03nG2FotSmE1IvQS
 MgoEePxggSU/gxjqerZifjJ0UmN+Rpgv4VXnbx+GeN6FcHZXKGVGGXh/gwowELfGRgeB
 k1v+6RGz165vVjf8qTg9T5T2FYUEcrHSwLBk5fRy4e1eic4Bwe7QkdtvB988rBItCSlw
 5pJbiBObITlEWIumnOpwgWSOod/vvf6//SPAXj5IzXKsXsn8DowBeLy2GH+tdsAPmUH0
 ZbwUoQIW4DTzzxX46eJW+ys3iupLGzexzYNkzIcWmfRnNP3AUY1kX51pUUaEoehoA6Yb
 KPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GYWKxxwDs0cZgU7zoLo4TUhsJ8M50sSfexrGGa7nvK0=;
 b=g0feqvVfXqG3gwVBR1kKLtEMDd/rF5FQ3aJYAG8OTfR/PvUkwf+h450IoW1JbnhK/J
 xcFw1utT8ioHOGw7C9e7Sum43YNfJMtwr/i7vFMxmahPpWH9V6x3Xpg1A0f7r5kj+P2o
 SQQyul5BMtPETNzpcIXX3nsZ5hbmegnG8A2cdWOq2+hbjAAXIpouu5bYSlxBXVaHuu3/
 PZoi1qrB882gJa4be/25Or0K0keabkXFkrKGOG0e894hN4soDAAK5n3XeK/3RvYfJwlv
 KfTYd9DaA34j2SsV2AV1xzieolglkAfIrHwnfz/nB9/FtjdM23/3B3bbpWdEm6SpZYZE
 HfuA==
X-Gm-Message-State: AOAM530h6mD+LXlRyT1EeQphCxYzb8q6PGz3sRhOJRRe26TPRdag5iqf
 MyUvIUBnM/bAuwO4yuf730Gf1Q==
X-Google-Smtp-Source: ABdhPJwekUVL/x16ZZDpG4z5bQ8XnWA1mYPT1pSdbtQA7F8rIf0C+IYx6L1iOsCNob4BliQK4ObStw==
X-Received: by 2002:a2e:5009:: with SMTP id e9mr25102801ljb.245.1632259258818; 
 Tue, 21 Sep 2021 14:20:58 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id t12sm13948lfc.55.2021.09.21.14.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 14:20:58 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id 1B39910305C; Wed, 22 Sep 2021 00:20:59 +0300 (+03)
Date: Wed, 22 Sep 2021 00:20:59 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Borislav Petkov <bp@alien8.de>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
 x86@kernel.org, iommu@lists.linux-foundation.org,
 kvm@vger.kernel.org, linux-efi@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 linux-graphics-maintainer@vmware.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kexec@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Brijesh Singh <brijesh.singh@amd.com>,
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
Message-ID: <20210921212059.wwlytlmxoft4cdth@box.shutemov.name>
References: <cover.1631141919.git.thomas.lendacky@amd.com>
 <367624d43d35d61d5c97a8b289d9ddae223636e9.1631141919.git.thomas.lendacky@amd.com>
 <20210920192341.maue7db4lcbdn46x@box.shutemov.name>
 <77df37e1-0496-aed5-fd1d-302180f1edeb@amd.com>
 <YUoao0LlqQ6+uBrq@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUoao0LlqQ6+uBrq@zn.tnic>
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

On Tue, Sep 21, 2021 at 07:47:15PM +0200, Borislav Petkov wrote:
> On Tue, Sep 21, 2021 at 12:04:58PM -0500, Tom Lendacky wrote:
> > Looks like instrumentation during early boot. I worked with Boris offline to
> > exclude arch/x86/kernel/cc_platform.c from some of the instrumentation and
> > that allowed an allyesconfig to boot.
> 
> And here's the lineup I have so far, I'd appreciate it if ppc and s390 folks
> could run it too:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/bp/bp.git/log/?h=rc2-cc

Still broken for me with allyesconfig.

gcc version 11.2.0 (Gentoo 11.2.0 p1)
GNU ld (Gentoo 2.37_p1 p0) 2.37

I still believe calling cc_platform_has() from __startup_64() is totally
broken as it lacks proper wrapping while accessing global variables.

I think sme_get_me_mask() has the same problem. I just happened to work
(until next compiler update).

This hack makes kernel boot again:

diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index f98c76a1d16c..e9110a44bf1b 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -285,7 +285,7 @@ unsigned long __head __startup_64(unsigned long physaddr,
 	 * there is no need to zero it after changing the memory encryption
 	 * attribute.
 	 */
-	if (cc_platform_has(CC_ATTR_MEM_ENCRYPT)) {
+	if (0 && cc_platform_has(CC_ATTR_MEM_ENCRYPT)) {
 		vaddr = (unsigned long)__start_bss_decrypted;
 		vaddr_end = (unsigned long)__end_bss_decrypted;
 		for (; vaddr < vaddr_end; vaddr += PMD_SIZE) {
diff --git a/arch/x86/mm/mem_encrypt_identity.c b/arch/x86/mm/mem_encrypt_identity.c
index eff4d19f9cb4..91638ed0b1db 100644
--- a/arch/x86/mm/mem_encrypt_identity.c
+++ b/arch/x86/mm/mem_encrypt_identity.c
@@ -288,7 +288,7 @@ void __init sme_encrypt_kernel(struct boot_params *bp)
 	unsigned long pgtable_area_len;
 	unsigned long decrypted_base;
 
-	if (!cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT))
+	if (1 || !cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT))
 		return;
 
 	/*
-- 
 Kirill A. Shutemov
