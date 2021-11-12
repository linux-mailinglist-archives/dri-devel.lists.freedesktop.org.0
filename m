Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCD444ED02
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 20:04:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650BD6F412;
	Fri, 12 Nov 2021 19:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 267FC6E1F3;
 Fri, 12 Nov 2021 19:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=sw9KzIf5vZUC10cdm21n9r6yeef7LSOGNJpq3h8tSms=; b=rLTlqUUlAiGbtl1O5iekR2GnJA
 sfAPhF9YEzCExNPlrXlMw8BrqfMh0Li2vHFgh5xp8GKOGscpg4J5eZ3cO9ezn38W+WFh8PNJ0Hxb+
 HUDq44vdhRD8qRY+b92H6sHJfm2K7+iub9UyXyrh4bSEb3S3Ixh6+Dgj6+tmq6IsKbJsVOEVclwdu
 YbDFoLHDBtzI9w3nxz8D2ACQxruoKSlXrPgf1NFcEZEMi/R0BxdBmk8Wzp/QXrGSPRkSWBvLe28+U
 BnrYs6BcByw78i/zr4kEEp4oVkMqv1+cQLkpqy6oC/72jrLO9ta+XPxsehu95/49P+CC3lrNTU663
 O3TXwQBw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlbqG-003lfG-2J; Fri, 12 Nov 2021 19:04:04 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id CFA2C986981; Fri, 12 Nov 2021 20:04:03 +0100 (CET)
Date: Fri, 12 Nov 2021 20:04:03 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 0/2] Nuke PAGE_KERNEL_IO
Message-ID: <20211112190403.GK174703@worktop.programming.kicks-ass.net>
References: <20211021181511.1533377-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021181511.1533377-1-lucas.demarchi@intel.com>
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
Cc: linux-arch@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 x86@kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 21, 2021 at 11:15:09AM -0700, Lucas De Marchi wrote:
> Last user of PAGE_KERNEL_IO is the i915 driver. While removing it from
> there as we seek to bring the driver to other architectures, Daniel
> suggested that we could finish the cleanup and remove it altogether,
> through the tip tree. So here I'm sending both commits needed for that.
> 
> Lucas De Marchi (2):
>   drm/i915/gem: stop using PAGE_KERNEL_IO
>   x86/mm: nuke PAGE_KERNEL_IO
> 
>  arch/x86/include/asm/fixmap.h             | 2 +-
>  arch/x86/include/asm/pgtable_types.h      | 7 -------
>  arch/x86/mm/ioremap.c                     | 2 +-
>  arch/x86/xen/setup.c                      | 2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_pages.c | 4 ++--
>  include/asm-generic/fixmap.h              | 2 +-
>  6 files changed, 6 insertions(+), 13 deletions(-)

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
