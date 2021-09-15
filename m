Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CD240CAF1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 18:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB21F89DE1;
	Wed, 15 Sep 2021 16:46:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1EE6E978;
 Wed, 15 Sep 2021 16:46:18 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0d07008534a6109a52ea91.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0d:700:8534:a610:9a52:ea91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 04D0A1EC051F;
 Wed, 15 Sep 2021 18:46:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1631724372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=ohcK2lrqZI/0Un5cQQISQvRNuEO3HIFBods4v3gznU8=;
 b=OinwDiMHyIs6ppSqYums+HJ/wABxvhGKKUPvdDics4JXpIwsFCihfmg/tYjRwayQUS5zAl
 /A8dCEMw7DwHpgzspvS586x6N5hMBRCXCrXZr4wBrq7mNNSRVp8ss+I1qG84M8RgMvHJvz
 7a85Vcl/oUKHuIwbTjsfd22UCB+v5Mg=
Date: Wed, 15 Sep 2021 18:46:03 +0200
From: Borislav Petkov <bp@alien8.de>
To: Tom Lendacky <thomas.lendacky@amd.com>,
 Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 iommu@lists.linux-foundation.org, kvm@vger.kernel.org,
 linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-graphics-maintainer@vmware.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kexec@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Brijesh Singh <brijesh.singh@amd.com>,
 Joerg Roedel <joro@8bytes.org>, Andi Kleen <ak@linux.intel.com>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>,
 Christoph Hellwig <hch@infradead.org>,
 Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Baoquan He <bhe@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Hansen <dave.hansen@linux.intel.com>,
 Dave Young <dyoung@redhat.com>, David Airlie <airlied@linux.ie>,
 Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3 0/8] Implement generic cc_platform_has() helper function
Message-ID: <YUIjS6lKEY5AadZx@zn.tnic>
References: <cover.1631141919.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1631141919.git.thomas.lendacky@amd.com>
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

On Wed, Sep 08, 2021 at 05:58:31PM -0500, Tom Lendacky wrote:
> This patch series provides a generic helper function, cc_platform_has(),
> to replace the sme_active(), sev_active(), sev_es_active() and
> mem_encrypt_active() functions.
> 
> It is expected that as new confidential computing technologies are
> added to the kernel, they can all be covered by a single function call
> instead of a collection of specific function calls all called from the
> same locations.
> 
> The powerpc and s390 patches have been compile tested only. Can the
> folks copied on this series verify that nothing breaks for them. Also,
> a new file, arch/powerpc/platforms/pseries/cc_platform.c, has been
> created for powerpc to hold the out of line function.

...

> 
> Tom Lendacky (8):
>   x86/ioremap: Selectively build arch override encryption functions
>   mm: Introduce a function to check for confidential computing features
>   x86/sev: Add an x86 version of cc_platform_has()
>   powerpc/pseries/svm: Add a powerpc version of cc_platform_has()
>   x86/sme: Replace occurrences of sme_active() with cc_platform_has()
>   x86/sev: Replace occurrences of sev_active() with cc_platform_has()
>   x86/sev: Replace occurrences of sev_es_active() with cc_platform_has()
>   treewide: Replace the use of mem_encrypt_active() with
>     cc_platform_has()

Ok, modulo the minor things the plan is to take this through tip after
-rc2 releases in order to pick up the powerpc build fix and have a clean
base (-rc2) to base stuff on, at the same time.

Pls holler if something's still amiss.

Sathya,

if you want to prepare the Intel variant intel_cc_platform_has() ontop
of those and send it to me, that would be good because then I can
integrate it all in one branch which can be used to base future work
ontop.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
