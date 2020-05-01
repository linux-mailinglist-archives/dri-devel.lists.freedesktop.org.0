Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6D61C19A1
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 17:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2746B6ECC0;
	Fri,  1 May 2020 15:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200086ECC0
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 15:35:53 +0000 (UTC)
IronPort-SDR: K3iTQTm0zTXSHZWPTclWbt5t/QTplKGthcYZIhoKlwhMXd8Uz503XpJ3RcQBgvpswMhrXmdu7J
 wE45ml0/WfYg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2020 08:35:52 -0700
IronPort-SDR: eiOWyZIKI7vO19DR7OCFr64BqstCK2TpjbIFtfZ8MAqSSlMpCoVlOTcj7hUJ1GBJabMYzWffE+
 Y8JGzvryIPoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,339,1583222400"; d="scan'208";a="460295055"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
 by fmsmga006.fm.intel.com with ESMTP; 01 May 2020 08:35:52 -0700
Date: Fri, 1 May 2020 08:35:52 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: sparc-related comment, to Re: [PATCH V1 07/10] arch/kmap: Ensure
 kmap_prot visibility
Message-ID: <20200501153551.GA673107@iweiny-DESK2.sc.intel.com>
References: <20200430203845.582900-1-ira.weiny@intel.com>
 <20200430203845.582900-8-ira.weiny@intel.com>
 <20200501084446.GG27858@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200501084446.GG27858@infradead.org>
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
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 01, 2020 at 01:44:46AM -0700, Christoph Hellwig wrote:
> > --- a/arch/sparc/mm/highmem.c
> > +++ b/arch/sparc/mm/highmem.c
> > @@ -33,6 +33,7 @@
> >  #include <asm/vaddrs.h>
> >  
> >  pgprot_t kmap_prot;
> > +EXPORT_SYMBOL(kmap_prot);
> 
> Btw, I don't see why sparc needs this as a variable, as there is just
> a single assignment to it.

Because sparc uses non-standard defines which I'm not familiar with.

        kmap_prot = __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CACHE);

SRMMU_ET_PTE and friends are defined in 

arch/sparc/include/asm/pgtsrmmu.h

Since I can't readily test sparc this was easier to put out than let 0-day
crank on the entire series checking if including that header in the common
header chain would be an issue.

> 
> If sparc is sorted out we can always make it a define, and use a define
> for kmap_prot that defaults to PAGE_KERNEL, avoiding a little
> more duplication.

Agreed.  But it seems easier as a follow up (for me with 0-day).  Perhaps
someone from sparc can weigh in on the specifics of those defines and why they
are different from the normal ones?  Or even provide a follow on patch?

Ira

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
