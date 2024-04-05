Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C1889A022
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 16:48:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF23113B0D;
	Fri,  5 Apr 2024 14:48:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dwol0GCP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1353610E04F;
 Fri,  5 Apr 2024 14:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712328490; x=1743864490;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=LreOfBm3nT3gJWEyzyhSzgs3L/UNn7htcugC08IxS+o=;
 b=Dwol0GCPWx+Us9Nc1oDUYLAbXkYQJcB5drZ+e/z/NKeBnRPKlHflWqwg
 Yw4hfY96xZ99qi69FRx5ApTzn4s2dFblzbbBBZNmELoBZmGrLsyqtM1Tt
 7XjrCxjQMHslh/maB2ZlqYKL/yOQMjvgJRfWGYWnGNV7Vntchhy9rR8TZ
 Bb2dQ7D0gvEJ7yATUvatm8poVjm9GIXwUZIigfZX2E2sxkH557mmMjsO5
 rZ7L7bNjJUz2yHE8sx+31QYnqvC2LiTeEdXaUSgSRysjyX39H+VV/136X
 wLuzAh2SxZvbL9cXjjV9ut1CJiMFoQgDWGkSykGgExg565dSBn0UcBDyS g==;
X-CSE-ConnectionGUID: s4IC2S7SRuC2srad0MJIdg==
X-CSE-MsgGUID: 1WHp9JyyQU++++/zggxUxQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="11478918"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="11478918"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 07:48:09 -0700
X-CSE-ConnectionGUID: H55LyW5ASaqr4vhL9J0MYQ==
X-CSE-MsgGUID: +963A5O0TASYUpMZv+tuJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="23821308"
Received: from dtorrice-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.41.202])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 07:47:59 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Peter Zijlstra <peterz@infradead.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, linux-xtensa@linux-xtensa.org, Arnd
 Bergmann <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 loongarch@lists.linux.dev, Rodrigo Vivi <rodrigo.vivi@intel.com>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org, Andrew Morton
 <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [Intel-gfx] [PATCH v5 0/7] Introduce __xchg, non-atomic xchg
In-Reply-To: <Y/y0/VoPAVCXGKp3@hirez.programming.kicks-ass.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230118153529.57695-1-andrzej.hajda@intel.com>
 <Y/ZLH5F8LA3H10aL@hirez.programming.kicks-ass.net>
 <17f40b7c-f98d-789d-fa19-12ec077b756a@intel.com>
 <Y/y0/VoPAVCXGKp3@hirez.programming.kicks-ass.net>
Date: Fri, 05 Apr 2024 17:47:56 +0300
Message-ID: <87r0fjc1cz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 27 Feb 2023, Peter Zijlstra <peterz@infradead.org> wrote:
> On Thu, Feb 23, 2023 at 10:24:19PM +0100, Andrzej Hajda wrote:
>> On 22.02.2023 18:04, Peter Zijlstra wrote:
>> > On Wed, Jan 18, 2023 at 04:35:22PM +0100, Andrzej Hajda wrote:
>> > 
>> > > Andrzej Hajda (7):
>> > >    arch: rename all internal names __xchg to __arch_xchg
>> > >    linux/include: add non-atomic version of xchg
>> > >    arch/*/uprobes: simplify arch_uretprobe_hijack_return_addr
>> > >    llist: simplify __llist_del_all
>> > >    io_uring: use __xchg if possible
>> > >    qed: use __xchg if possible
>> > >    drm/i915/gt: use __xchg instead of internal helper
>> > 
>> > Nothing crazy in here I suppose, I somewhat wonder why you went through
>> > the trouble, but meh.
>> 
>> If you are asking why I have proposed this patchset, then the answer is
>> simple, 1st I've tried to find a way to move internal i915 helper to core
>> (see patch 7).
>> Then I was looking for possible other users of this helper. And apparently
>> there are many of them, patches 3-7 shows some.
>> 
>> 
>> > 
>> > You want me to take this through te locking tree (for the next cycle,
>> > not this one) where I normally take atomic things or does someone else
>> > want this?
>> 
>> If you could take it I will be happy.
>
> OK, I'll go queue it in tip/locking/core after -rc1. Thanks!

Is this where the series fell between the cracks, or was there some
follow-up that I missed?

I think this would still be useful. Andrzej, would you mind rebasing and
resending if there are no objections?

BR,
Jani.


-- 
Jani Nikula, Intel
