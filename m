Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A8D1C9EAC
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 00:50:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E53746E0D9;
	Thu,  7 May 2020 22:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09836E0D9
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 22:50:41 +0000 (UTC)
IronPort-SDR: vUoxWz6YtlvmSzH5zS0wCVALlZgytzCn9yexc2b6lUY8PP9HrDFXD5KHC9FJtFJMv1tapihyOt
 foLYhrTyD6Dg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 15:50:41 -0700
IronPort-SDR: A94YOimG+GBTCtRnotihIHXo/4uYOm9rsXy8xtuLX5Aw2+CVkRWX3diLimU1sfCOXtFd1OcX1r
 bTWfMT7evkVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,365,1583222400"; d="scan'208";a="278753786"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
 by orsmga002.jf.intel.com with ESMTP; 07 May 2020 15:50:40 -0700
Date: Thu, 7 May 2020 15:50:40 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH V3 13/15] parisc/kmap: Remove duplicate kmap code
Message-ID: <20200507225039.GA1428632@iweiny-DESK2.sc.intel.com>
References: <20200507150004.1423069-1-ira.weiny@intel.com>
 <20200507150004.1423069-14-ira.weiny@intel.com>
 <20200507135258.f430182578c0d63b7488916e@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200507135258.f430182578c0d63b7488916e@linux-foundation.org>
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
 Thomas Gleixner <tglx@linutronix.de>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-csky@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 07, 2020 at 01:52:58PM -0700, Andrew Morton wrote:
> On Thu,  7 May 2020 08:00:01 -0700 ira.weiny@intel.com wrote:
> 
> > parisc reimplements the kmap calls except to flush it's dcache.  This is
> > arguably an abuse of kmap but regardless it is messy and confusing.
> > 
> > Remove the duplicate code and have parisc define
> > ARCH_HAS_FLUSH_ON_KUNMAP for a kunmap_flush_on_unmap() architecture
> > specific call to flush the cache.
> 
> checkpatch says:
> 
> ERROR: #define of 'ARCH_HAS_FLUSH_ON_KUNMAP' is wrong - use Kconfig variables or standard guards instead
> #69: FILE: arch/parisc/include/asm/cacheflush.h:103:
> +#define ARCH_HAS_FLUSH_ON_KUNMAP
> 
> which is fair enough, I guess.  More conventional would be
> 
> arch/parisc/include/asm/cacheflush.h:
> 
> static inline void kunmap_flush_on_unmap(void *addr)
> {
> 	...
> }
> #define kunmap_flush_on_unmap kunmap_flush_on_unmap
> 
> 
> include/linux/highmem.h:
> 
> #ifndef kunmap_flush_on_unmap
> static inline void kunmap_flush_on_unmap(void *addr)
> {
> }
> #define kunmap_flush_on_unmap kunmap_flush_on_unmap
> #endif
> 
> 
> static inline void kunmap_atomic_high(void *addr)
> {
> 	/* Mostly nothing to do in the CONFIG_HIGHMEM=n case as kunmap_atomic()
> 	 * handles re-enabling faults + preemption */
> 	kunmap_flush_on_unmap(addr);
> }
> 
> 
> but I don't really think it's worth bothering changing it.	
> 
> (Ditto patch 3/15)

Yes I was following the pattern already there.

I'll fix up the last patch now.
Ira

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
