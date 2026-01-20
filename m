Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mL1kBEqib2mWDgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:42:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B155146699
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:42:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090E010E617;
	Tue, 20 Jan 2026 15:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="azvLzQcb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3430510E615;
 Tue, 20 Jan 2026 15:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768921534; x=1800457534;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yojAahukgi0FBGoY8rT4+taXSPras5XUztQ98rVQffE=;
 b=azvLzQcbAhdYivkFDQS2slStQvKBTThk67YNp0r9m3GUrScsZ17Dq06s
 wSvNGwlkzLVbYdQlnm3gkMUi1IIAW63S08HiKkeEAcNuLmWdYxT7z7Bki
 c3WQhh8OfedZEL3Rh/CWm6oqaj5sbcFwVrTh6KtfMVI2/MKSO5z2xOP9F
 tmOV0fgEbfWdROEPmFQqOPMm5sOEdAAZwJbcIjkB1ntgy3ebKpQkIzz/P
 E+Z2q9hxzT8t66fKoHXEj/oeuuG+WercZ+8cPZf5th9kkLeSs/NgI6GgV
 Kg1/ltEWNlSNHnAv8gqpfEhoUIioSwXNQdkMZtLczBMUjpbBUYnByixVL Q==;
X-CSE-ConnectionGUID: FsxPSzfWS8WOO30dShiGWg==
X-CSE-MsgGUID: kQkXc/AVRk+DeNLvxZzcAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="81505309"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="81505309"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 07:05:34 -0800
X-CSE-ConnectionGUID: h8OiwNQ+SRKEBm+FzUV4Fw==
X-CSE-MsgGUID: PP/mfveIRXCbBQGFENFDcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="206397612"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.70])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 07:05:32 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH v2] drm/i915/selftests: Prevent userspace mapping
 invalidation
Date: Tue, 20 Jan 2026 16:05:29 +0100
Message-ID: <11414299.5MRjnR8RnV@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <iblv3rpsvbxv5eic6i6nneanqdovuloprnksyxxgvkz5miwmdu@7usprrsui25o>
References: <5biajlwhi3oaep72si2dj2lhp2xwrpfa2gxqc2l36464uishjo@g26isdq64nv2>
 <3333011.vfdyTQepKt@jkrzyszt-mobl2.ger.corp.intel.com>
 <iblv3rpsvbxv5eic6i6nneanqdovuloprnksyxxgvkz5miwmdu@7usprrsui25o>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,jkrzyszt-mobl2.ger.corp.intel.com:mid,gitlab.freedesktop.org:url,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: B155146699
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Monday, 19 January 2026 15:56:06 CET Krzysztof Karas wrote:
> Hi Janusz,
> 
> > Hi Krzysztof,
> > 
> > On Monday, 19 January 2026 11:16:02 CET Krzysztof Karas wrote:
> > > IGT mmap testing in i915 uses current task's address space to
> > > allocate new userspace mapping, without registering real user
> > > for that address space in mm_struct.
> > > 
> > > It was observed that mm->mm_users would occasionally drop to 0
> > > during tests, which reaped userspace mappings, further leading
> > > to failures upon reading from userland memory.
> > > 
> > > Prevent this by artificially increasing mm_users counter for the
> > > duration of the test.
> > > 
> > > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204
> > > Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
> > > ---
> > > During testing I also found out that this problem affects
> > > another function, __igt_mmap(), which also utilizes userspace
> > > VMAs.
> > > 
> > > v2:
> > >  * use mmget/mmput() (Jani);
> > >  * include __igt_mmap() in the scope;
> > >  * change comments and commit message;
> > > 
> > >  .../drm/i915/gem/selftests/i915_gem_mman.c    | 24 +++++++++++++++++++
> > >  1 file changed, 24 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> > > index 0d250d57496a..82ab090f66c8 100644
> > > --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> > > +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> > > @@ -916,6 +916,13 @@ static int __igt_mmap(struct drm_i915_private *i915,
> > >  	if (err)
> > >  		return err;
> > >  
> > > +	/*
> > > +	 * Get a reference to tasks's mm_struct to artificially increase mm_users
> > > +	 * and ensure the kernel does not try to clean up the userspace mappings
> > > +	 * of the current task during the test.
> > > +	 */
> > > +	mmget_not_zero(current->mm);
> > 
> > What happens if that fails?
> This cannot really fail, it may return false, if no other
> references are currently held, which has its own implication
> that I overlooked:
> if mmget_not_zero() returns false, then we probably should not
> call mmput().
> 
> On the other hand, I observed that the issue does not occur if
> mm_users is 0 since the beginning. The problem only arises when
> we go from mm_users == 1 to mm_users == 0.

How can you explain those two different states (mm_users == 0 vs. mm_users > 
0) possible on test startup?

Thanks,
Janusz

> 
> However, I think it would be better to use unconditional mmget()
> to better show our intentions and ensure no tampering with
> userspace takes place (if the test works with mm_users == 0 and
> with mm_users > 0, as long as the condition remains unchanged
> throughout the test, then we could force the latter to ensure
> stable userspace state accross every test run).
> 
> This was a bit lenghty, but does it answer your question?
> 
> 




