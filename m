Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 109431C7B2D
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 22:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4EF889356;
	Wed,  6 May 2020 20:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E9189356
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 20:25:15 +0000 (UTC)
IronPort-SDR: swCUIvzYFqdMda+7d45JDul3Q+HqxiMumAQRZ8w4DzNpuYIu3RrCJM3muvu3HqO6t7yteG3nTi
 VRE2UTzvdHLQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 13:25:15 -0700
IronPort-SDR: xSrhp4VCcSvP5bv2WtfYo6vFeSsnnsv3N44sSopWfpFOgIk9uc/zRJt3WrQM/g5MZyK9rPCoAV
 JVwDj2vxz4ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,360,1583222400"; d="scan'208";a="461881349"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
 by fmsmga006.fm.intel.com with ESMTP; 06 May 2020 13:25:14 -0700
Date: Wed, 6 May 2020 13:25:14 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH V2 05/11] {x86,powerpc,microblaze}/kmap: Move preempt
 disable
Message-ID: <20200506202514.GF1084880@iweiny-DESK2.sc.intel.com>
References: <20200504010912.982044-1-ira.weiny@intel.com>
 <20200504010912.982044-6-ira.weiny@intel.com>
 <20200506061113.GA5192@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200506061113.GA5192@infradead.org>
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
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Huang Rui <ray.huang@amd.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 05, 2020 at 11:11:13PM -0700, Christoph Hellwig wrote:
> On Sun, May 03, 2020 at 06:09:06PM -0700, ira.weiny@intel.com wrote:
> > From: Ira Weiny <ira.weiny@intel.com>
> > 
> > During this kmap() conversion series we must maintain bisect-ability.
> > To do this, kmap_atomic_prot() in x86, powerpc, and microblaze need to
> > remain functional.
> > 
> > Create a temporary inline version of kmap_atomic_prot within these
> > architectures so we can rework their kmap_atomic() calls and then lift
> > kmap_atomic_prot() to the core.
> > 
> > Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> > 
> > ---
> > Changes from V1:
> > 	New patch
> > ---
> >  arch/microblaze/include/asm/highmem.h | 11 ++++++++++-
> >  arch/microblaze/mm/highmem.c          | 10 ++--------
> >  arch/powerpc/include/asm/highmem.h    | 11 ++++++++++-
> >  arch/powerpc/mm/highmem.c             |  9 ++-------
> >  arch/x86/include/asm/highmem.h        | 11 ++++++++++-
> >  arch/x86/mm/highmem_32.c              | 10 ++--------
> >  6 files changed, 36 insertions(+), 26 deletions(-)
> > 
> > diff --git a/arch/microblaze/include/asm/highmem.h b/arch/microblaze/include/asm/highmem.h
> > index 0c94046f2d58..ec9954b091e1 100644
> > --- a/arch/microblaze/include/asm/highmem.h
> > +++ b/arch/microblaze/include/asm/highmem.h
> > @@ -51,7 +51,16 @@ extern pte_t *pkmap_page_table;
> >  #define PKMAP_NR(virt)  ((virt - PKMAP_BASE) >> PAGE_SHIFT)
> >  #define PKMAP_ADDR(nr)  (PKMAP_BASE + ((nr) << PAGE_SHIFT))
> >  
> > -extern void *kmap_atomic_prot(struct page *page, pgprot_t prot);
> > +extern void *kmap_atomic_high_prot(struct page *page, pgprot_t prot);
> > +void *kmap_atomic_prot(struct page *page, pgprot_t prot)
> 
> Shouldn't this be marked inline?

Yes Thanks.  Done.

> 
> The rest looks fine:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Thanks,
Ira

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
