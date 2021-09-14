Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3894740ACE7
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 13:58:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 161016E489;
	Tue, 14 Sep 2021 11:58:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D516E489;
 Tue, 14 Sep 2021 11:58:17 +0000 (UTC)
Received: from zn.tnic (p200300ec2f1048001e15ef619509992f.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f10:4800:1e15:ef61:9509:992f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8B7241EC04EC;
 Tue, 14 Sep 2021 13:58:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1631620690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=b/N09IsvqYn24JfFZ47aDfAefXmwmXR82Pt3awNAfbs=;
 b=bxwwIzIyK+Rg4oIy01BbpgT86ORE1XKclCEYAaQ9uu2p2YFJBhtO9vvO21Z67RPc0ptMoP
 47+Ry7kCX0P48iid+/PmdkrtsbH5uZdiuAmR5uxqjBKZy74znSrvhF2nYkipmdb9VWoPx/
 PSVn04awQpG91qOKWcYNAHUkxFtjb44=
Date: Tue, 14 Sep 2021 13:58:04 +0200
From: Borislav Petkov <bp@alien8.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, iommu@lists.linux-foundation.org,
 kvm@vger.kernel.org, linux-efi@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 linux-graphics-maintainer@vmware.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kexec@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Brijesh Singh <brijesh.singh@amd.com>,
 Joerg Roedel <joro@8bytes.org>, Andi Kleen <ak@linux.intel.com>,
 Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>,
 Christoph Hellwig <hch@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v3 4/8] powerpc/pseries/svm: Add a powerpc version of
 cc_platform_has()
Message-ID: <YUCOTIPPsJJpLO/d@zn.tnic>
References: <cover.1631141919.git.thomas.lendacky@amd.com>
 <9d4fc3f8ea7b325aaa1879beab1286876f45d450.1631141919.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9d4fc3f8ea7b325aaa1879beab1286876f45d450.1631141919.git.thomas.lendacky@amd.com>
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

On Wed, Sep 08, 2021 at 05:58:35PM -0500, Tom Lendacky wrote:
> Introduce a powerpc version of the cc_platform_has() function. This will
> be used to replace the powerpc mem_encrypt_active() implementation, so
> the implementation will initially only support the CC_ATTR_MEM_ENCRYPT
> attribute.
> 
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> ---
>  arch/powerpc/platforms/pseries/Kconfig       |  1 +
>  arch/powerpc/platforms/pseries/Makefile      |  2 ++
>  arch/powerpc/platforms/pseries/cc_platform.c | 26 ++++++++++++++++++++
>  3 files changed, 29 insertions(+)
>  create mode 100644 arch/powerpc/platforms/pseries/cc_platform.c

Michael,

can I get an ACK for the ppc bits to carry them through the tip tree
pls?

Btw, on a related note, cross-compiling this throws the following error here:

$ make CROSS_COMPILE=/home/share/src/crosstool/gcc-9.4.0-nolibc/powerpc64-linux/bin/powerpc64-linux- V=1 ARCH=powerpc

...

/home/share/src/crosstool/gcc-9.4.0-nolibc/powerpc64-linux/bin/powerpc64-linux-gcc -Wp,-MD,arch/powerpc/boot/.crt0.o.d -D__ASSEMBLY__ -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -O2 -msoft-float -mno-altivec -mno-vsx -pipe -fomit-frame-pointer -fno-builtin -fPIC -nostdinc -include ./include/linux/compiler_attributes.h -I./arch/powerpc/include -I./arch/powerpc/include/generated  -I./include -I./arch/powerpc/include/uapi -I./arch/powerpc/include/generated/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux/compiler-version.h -include ./include/linux/kconfig.h -m32 -isystem /home/share/src/crosstool/gcc-9.4.0-nolibc/powerpc64-linux/bin/../lib/gcc/powerpc64-linux/9.4.0/include -mbig-endian -nostdinc -c -o arch/powerpc/boot/crt0.o arch/powerpc/boot/crt0.S
In file included from <command-line>:
././include/linux/compiler_attributes.h:62:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
   62 | #if __has_attribute(__assume_aligned__)
      |     ^~~~~~~~~~~~~~~
././include/linux/compiler_attributes.h:62:20: error: missing binary operator before token "("
   62 | #if __has_attribute(__assume_aligned__)
      |                    ^
././include/linux/compiler_attributes.h:88:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
   88 | #if __has_attribute(__copy__)
      |     ^~~~~~~~~~~~~~~
...

Known issue?

This __has_attribute() thing is supposed to be supported
in gcc since 5.1 and I'm using the crosstool stuff from
https://www.kernel.org/pub/tools/crosstool/ and gcc-9.4 above is pretty
new so that should not happen actually.

But it does...

Hmmm.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
