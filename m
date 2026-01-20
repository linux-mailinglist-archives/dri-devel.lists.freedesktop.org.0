Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNPRG+LAb2lsMQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 18:52:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCEA48E2E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 18:52:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A0EB10E63F;
	Tue, 20 Jan 2026 17:52:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tj9WSvzv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8498F10E14A;
 Tue, 20 Jan 2026 17:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768931551; x=1800467551;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XXJWBTrp/5gnHG2VI+qdrvLQhTvBedec/H8dhV/2xuQ=;
 b=Tj9WSvzv3If/BXcHa4Gy0qH8jMonxQuO5MoFpIBczrTigF1zj7cno8cl
 R3Lp7b9zqVi4pEhHAC6Dcu+Yxk5cj9TlaaR8k+fvDZpD0z6dm7uk6TsyH
 DBdzmadrj8coAkeyGypS9hSrCHMVY97nTM0LhuI1hPA5xgeQRhAwuNWGX
 yI0UgfPeMOojgBbMy9fad+G+cYNsupj/MDmrKQm6EzrKPzWLyxupRzoM1
 Eb71OmsU/GtTX8r2VWR/iUPOE2KV8BH/Tpu6/ysszTmkDqISUD5pyVG1B
 A4EcNpy79g0qMrKhCqcKJCjjn3FOhWDgFboiHe3MFkdhIpUxqMdMrNAt8 Q==;
X-CSE-ConnectionGUID: Y51LqkWKQ4SeJfnjpUxJ7g==
X-CSE-MsgGUID: /40JR8EiSLqu7mcH3Q/a/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="81257688"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="81257688"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:52:30 -0800
X-CSE-ConnectionGUID: 5EXjbW9jRveYJs1jxL9UrA==
X-CSE-MsgGUID: Y/tNCPV2TPG42uNZwLGW1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="229136361"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.70])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:52:28 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH v2] drm/i915/selftests: Prevent userspace mapping
 invalidation
Date: Tue, 20 Jan 2026 18:52:25 +0100
Message-ID: <2469032.yKrmzQ4Hd0@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <3zztbgcod4nqnh2ywwiembcqngtp7ib52wpv6x6fbb7brf2rv2@dfnmrbjlqsmk>
References: <5biajlwhi3oaep72si2dj2lhp2xwrpfa2gxqc2l36464uishjo@g26isdq64nv2>
 <11414299.5MRjnR8RnV@jkrzyszt-mobl2.ger.corp.intel.com>
 <3zztbgcod4nqnh2ywwiembcqngtp7ib52wpv6x6fbb7brf2rv2@dfnmrbjlqsmk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	CTE_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[janusz.krzysztofik@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 1FCEA48E2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tuesday, 20 January 2026 17:21:57 CET Krzysztof Karas wrote:
> On 2026-01-20 at 16:05:29 +0100, Janusz Krzysztofik wrote:
> > On Monday, 19 January 2026 15:56:06 CET Krzysztof Karas wrote:
> > > Hi Janusz,
> > > 
> > > > Hi Krzysztof,
> > > > 
> > > > On Monday, 19 January 2026 11:16:02 CET Krzysztof Karas wrote:
> > > > > IGT mmap testing in i915 uses current task's address space to
> > > > > allocate new userspace mapping, without registering real user
> > > > > for that address space in mm_struct.
> > > > > 
> > > > > It was observed that mm->mm_users would occasionally drop to 0
> > > > > during tests, which reaped userspace mappings, further leading
> > > > > to failures upon reading from userland memory.
> > > > > 
> > > > > Prevent this by artificially increasing mm_users counter for the
> > > > > duration of the test.
> > > > > 
> > > > > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
14204
> > > > > Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
> > > > > ---
> > > > > During testing I also found out that this problem affects
> > > > > another function, __igt_mmap(), which also utilizes userspace
> > > > > VMAs.
> > > > > 
> > > > > v2:
> > > > >  * use mmget/mmput() (Jani);
> > > > >  * include __igt_mmap() in the scope;
> > > > >  * change comments and commit message;
> > > > > 
> > > > >  .../drm/i915/gem/selftests/i915_gem_mman.c    | 24 ++++++++++++++++
+++
> > > > >  1 file changed, 24 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/
drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> > > > > index 0d250d57496a..82ab090f66c8 100644
> > > > > --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> > > > > +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> > > > > @@ -916,6 +916,13 @@ static int __igt_mmap(struct drm_i915_private 
*i915,
> > > > >  	if (err)
> > > > >  		return err;
> > > > >  
> > > > > +	/*
> > > > > +	 * Get a reference to tasks's mm_struct to artificially 
increase mm_users
> > > > > +	 * and ensure the kernel does not try to clean up the 
userspace mappings
> > > > > +	 * of the current task during the test.
> > > > > +	 */
> > > > > +	mmget_not_zero(current->mm);
> > > > 
> > > > What happens if that fails?
> > > This cannot really fail, it may return false, if no other
> > > references are currently held, which has its own implication
> > > that I overlooked:
> > > if mmget_not_zero() returns false, then we probably should not
> > > call mmput().
> > > 
> > > On the other hand, I observed that the issue does not occur if
> > > mm_users is 0 since the beginning. The problem only arises when
> > > we go from mm_users == 1 to mm_users == 0.
> > 
> > How can you explain those two different states (mm_users == 0 vs. mm_users 
> 
> > 0) possible on test startup?
> According to Documentation/mm/active_mm.rst:
> 'To support all that, the "struct mm_struct" now has two
>  counters: a "mm_users" counter that is how many "real address
>  space users" there are',
> and Documentation/mm/process_addrs.rst:
> 'All VMAs are contained within one and only one virtual address
>  space, described by a struct mm_struct object which is
>  referenced by all tasks (that is, threads) which share the
>  virtual address space. We refer to this as the mm.'
> mm_users represents how many threads actively use the virtual
> address space, so for value 0 that would mean nobody uses VMAs.
> This makes sense, because the test does not perform operations
> warranting user registration, we just hack the memory a bit to
> get a mapping. 

I'm not sure.  My understanding is that each userspace process gets its real 
address space and keeps a reference to it throughout its lifetime.  When we 
start the selftest from a userspace process (i915_selftest), the selftest 
inherits that process' real address space.  As long as the userspace process 
is not terminating (waiting for results from the selftest), it still keeps a 
reference to that real address space, then mm_users should be at least 1.  How 
is it possible you observed 0?

Thanks,
Janusz

> The only thing that does not sit right with me is
> whether we should be running the test with mm_users == 0:
>  1) if the test breaks due to reaping userland memory, then
>    that means something had to initialize this memory;
>  2) if the number of users is 0 from the beginning, does that
>    mean the test uses some uninitialized or already freed areas?
> 
> For the case with mm_users > 0 things work, because there is
> already active VMA at the start of the test, of which reference
> is held by another user (thread).
> 
> The proposed fix gets rid of those doubtful conditions when
> mm_users == 0, but I am ready to investigate further to figure
> out why the test would work without virtual address space setup
> if there is a need.
> 
> 




