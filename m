Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C268D1D6F6A
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 05:49:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A5016E19C;
	Mon, 18 May 2020 03:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA596E19C
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 03:49:40 +0000 (UTC)
IronPort-SDR: nzLYq4nx0Q6YIZE5tKtDJFoGev6/yBc3Aaux8xW+esR/gjXpf3PMvABni4zX4M1D94OYq1+lCt
 rvr9LHrky2nA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2020 20:49:40 -0700
IronPort-SDR: QZjHgmmyJD5wcejwNXYudRxBmBXktkRK66clSGT09vVfYOCh2mQO0TRV8oDbLvZwqQC7nEa8om
 xW1Fi6/1MBPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,405,1583222400"; d="scan'208";a="263820256"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
 by orsmga003.jf.intel.com with ESMTP; 17 May 2020 20:49:39 -0700
Date: Sun, 17 May 2020 20:49:39 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH V3 07/15] arch/kunmap_atomic: Consolidate duplicate code
Message-ID: <20200518034938.GA3023182@iweiny-DESK2.sc.intel.com>
References: <20200507150004.1423069-1-ira.weiny@intel.com>
 <20200507150004.1423069-8-ira.weiny@intel.com>
 <20200516223306.GA161252@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200516223306.GA161252@roeck-us.net>
User-Agent: Mutt/1.11.1 (2018-12-01)
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-csky@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 16, 2020 at 03:33:06PM -0700, Guenter Roeck wrote:
> On Thu, May 07, 2020 at 07:59:55AM -0700, ira.weiny@intel.com wrote:
> > From: Ira Weiny <ira.weiny@intel.com>
> > =

> > Every single architecture (including !CONFIG_HIGHMEM) calls...
> > =

> > 	pagefault_enable();
> > 	preempt_enable();
> > =

> > ... before returning from __kunmap_atomic().  Lift this code into the
> > kunmap_atomic() macro.
> > =

> > While we are at it rename __kunmap_atomic() to kunmap_atomic_high() to
> > be consistent.
> > =

> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> =

> This patch results in:
> =

> Starting init: /bin/sh exists but couldn't execute it (error -14)
> =

> when trying to boot microblazeel:petalogix-ml605 in qemu.

Thanks for the report.  I'm not readily seeing the issue.

Do you have a kernel config?  Specifically is CONFIG_HIGHMEM set?

> =

> Bisect log attached.
> =

> Guenter
> =

> ---
> # bad: [bdecf38f228bcca73b31ada98b5b7ba1215eb9c9] Add linux-next specific=
 files for 20200515
> # good: [2ef96a5bb12be62ef75b5828c0aab838ebb29cb8] Linux 5.7-rc5
> git bisect start 'HEAD' 'v5.7-rc5'
> # good: [3674d7aa7a8e61d993886c2fb7c896c5ef85e988] Merge remote-tracking =
branch 'crypto/master'
> git bisect good 3674d7aa7a8e61d993886c2fb7c896c5ef85e988
> # good: [87f6f21783522e6d62127cf33ae5e95f50874beb] Merge remote-tracking =
branch 'spi/for-next'
> git bisect good 87f6f21783522e6d62127cf33ae5e95f50874beb
> # good: [5c428e8277d5d97c85126387d4e00aa5adde4400] Merge remote-tracking =
branch 'staging/staging-next'
> git bisect good 5c428e8277d5d97c85126387d4e00aa5adde4400
> # good: [f68de67ed934e7bdef4799fd7777c86f33f14982] Merge remote-tracking =
branch 'hyperv/hyperv-next'
> git bisect good f68de67ed934e7bdef4799fd7777c86f33f14982
> # bad: [54acd2dc52b069da59639eea0d0c92726f32fb01] mm/memblock: fix a typo=
 in comment "implict"->"implicit"
> git bisect bad 54acd2dc52b069da59639eea0d0c92726f32fb01
> # good: [784a17aa58a529b84f7cc50f351ed4acf3bd11f3] mm: remove the pgprot =
argument to __vmalloc
> git bisect good 784a17aa58a529b84f7cc50f351ed4acf3bd11f3
> # good: [6cd8137ff37e9a37aee2d2a8889c8beb8eab192f] khugepaged: replace th=
e usage of system(3) in the test
> git bisect good 6cd8137ff37e9a37aee2d2a8889c8beb8eab192f
> # bad: [6987da379826ed01b8a1cf046b67cc8cc10117cc] sparc: remove unnecessa=
ry includes
> git bisect bad 6987da379826ed01b8a1cf046b67cc8cc10117cc
> # good: [bc17b545388f64c09e83e367898e28f60277c584] mm/hugetlb: define a g=
eneric fallback for is_hugepage_only_range()
> git bisect good bc17b545388f64c09e83e367898e28f60277c584
> # bad: [9b5aa5b43f957f03a1f4a9aff5f7924e2ebbc011] arch-kmap_atomic-consol=
idate-duplicate-code-checkpatch-fixes
> git bisect bad 9b5aa5b43f957f03a1f4a9aff5f7924e2ebbc011
> # good: [0941a38ff0790c1004270f952067a5918a4ba32d] arch/kmap: remove redu=
ndant arch specific kmaps
> git bisect good 0941a38ff0790c1004270f952067a5918a4ba32d
> # good: [56e635a64c2cbfa815c851af10e0f811e809977b] arch-kunmap-remove-dup=
licate-kunmap-implementations-fix
> git bisect good 56e635a64c2cbfa815c851af10e0f811e809977b
> # bad: [60f96b2233c790d4f1c49317643051f1670bcb29] arch/kmap_atomic: conso=
lidate duplicate code
> git bisect bad 60f96b2233c790d4f1c49317643051f1670bcb29
> # good: [7b3708dc3bf72a647243064fe7ddf9a76248ddfd] {x86,powerpc,microblaz=
e}/kmap: move preempt disable
> git bisect good 7b3708dc3bf72a647243064fe7ddf9a76248ddfd
> # first bad commit: [60f96b2233c790d4f1c49317643051f1670bcb29] arch/kmap_=
atomic: consolidate duplicate code

I'm confused by this.  This points to an earlier commit being bad?

commit 60f96b2233c790d4f1c49317643051f1670bcb29                            =
     =

Author: Ira Weiny <ira.weiny@intel.com>                                    =
     =

Date:   Thu May 14 13:39:54 2020 +1000                                     =
     =

                                                                           =
     =

    arch/kmap_atomic: consolidate duplicate code                           =
     =

                                                                           =
     =

    Every arch has the same code to ensure atomic operations and a check fo=
r    =

    !HIGHMEM page.                                                         =
     =

                                                                           =
     =

    Remove the duplicate code by defining a core kmap_atomic() which only  =
     =

    calls the arch specific kmap_atomic_high() when the page is high memory=
.    =

                                                                           =
     =

    Link: http://lkml.kernel.org/r/20200507150004.1423069-7-ira.weiny@intel=
.com =

    Signed-off-by: Ira Weiny <ira.weiny@intel.com>                         =
     =

    Reviewed-by: Christoph Hellwig <hch@lst.de>                            =
     =

    Cc: Al Viro <viro@zeniv.linux.org.uk>                                  =
     =

    Cc: Andy Lutomirski <luto@kernel.org>                                  =
     =

    Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>                  =
     =

    Cc: Borislav Petkov <bp@alien8.de>                                     =
     =

    Cc: Christian K=F6nig <christian.koenig@amd.com>                       =
       =

    Cc: Chris Zankel <chris@zankel.net>                                    =
     =

    Cc: Daniel Vetter <daniel.vetter@ffwll.ch>                             =
     =

    Cc: Dan Williams <dan.j.williams@intel.com>                            =
     =

    Cc: Dave Hansen <dave.hansen@linux.intel.com>                          =
     =

    Cc: "David S. Miller" <davem@davemloft.net>                            =
     =

    Cc: Helge Deller <deller@gmx.de>                                       =
     =

    Cc: "H. Peter Anvin" <hpa@zytor.com>                                   =
     =

    Cc: Ingo Molnar <mingo@redhat.com>                                     =
     =

    Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>     =
     =

    Cc: Max Filippov <jcmvbkbc@gmail.com>                                  =
     =

    Cc: Paul Mackerras <paulus@samba.org>                                  =
     =

    Cc: Peter Zijlstra <peterz@infradead.org>                              =
     =

    Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>                    =
     =

    Cc: Thomas Gleixner <tglx@linutronix.de>                               =
              =

    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>               =
     =

    Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>                 =
     =



Any idea which one it is?

Ira

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
