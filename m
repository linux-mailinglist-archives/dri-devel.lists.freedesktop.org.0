Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBD51C9CB5
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 22:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8FB66EA67;
	Thu,  7 May 2020 20:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F9B6EA67
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 20:53:00 +0000 (UTC)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E2E7920735;
 Thu,  7 May 2020 20:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588884780;
 bh=TyVMubmSwnb6HspI26I671gs2+xz/BioghUujIiqGH8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pLECSGx/bjY/e6dPZHg/pogKtFknD7CQxEbYnTijPvo31G65TH5qkje/0482SYoYN
 DUxu9XSArBxL1RHMChRsQBx2Ke74CL6dm6TMRGPJJfX7xkDXTBpZl44fWyvfgMqhU0
 epsvy3zKnV8VlRwcWKCyI4E8L4mB8LcbloZDf/RA=
Date: Thu, 7 May 2020 13:52:58 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: ira.weiny@intel.com
Subject: Re: [PATCH V3 13/15] parisc/kmap: Remove duplicate kmap code
Message-Id: <20200507135258.f430182578c0d63b7488916e@linux-foundation.org>
In-Reply-To: <20200507150004.1423069-14-ira.weiny@intel.com>
References: <20200507150004.1423069-1-ira.weiny@intel.com>
 <20200507150004.1423069-14-ira.weiny@intel.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

On Thu,  7 May 2020 08:00:01 -0700 ira.weiny@intel.com wrote:

> parisc reimplements the kmap calls except to flush it's dcache.  This is
> arguably an abuse of kmap but regardless it is messy and confusing.
> 
> Remove the duplicate code and have parisc define
> ARCH_HAS_FLUSH_ON_KUNMAP for a kunmap_flush_on_unmap() architecture
> specific call to flush the cache.

checkpatch says:

ERROR: #define of 'ARCH_HAS_FLUSH_ON_KUNMAP' is wrong - use Kconfig variables or standard guards instead
#69: FILE: arch/parisc/include/asm/cacheflush.h:103:
+#define ARCH_HAS_FLUSH_ON_KUNMAP

which is fair enough, I guess.  More conventional would be

arch/parisc/include/asm/cacheflush.h:

static inline void kunmap_flush_on_unmap(void *addr)
{
	...
}
#define kunmap_flush_on_unmap kunmap_flush_on_unmap


include/linux/highmem.h:

#ifndef kunmap_flush_on_unmap
static inline void kunmap_flush_on_unmap(void *addr)
{
}
#define kunmap_flush_on_unmap kunmap_flush_on_unmap
#endif


static inline void kunmap_atomic_high(void *addr)
{
	/* Mostly nothing to do in the CONFIG_HIGHMEM=n case as kunmap_atomic()
	 * handles re-enabling faults + preemption */
	kunmap_flush_on_unmap(addr);
}


but I don't really think it's worth bothering changing it.	

(Ditto patch 3/15)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
