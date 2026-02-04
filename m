Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BaZL9AQg2kPhQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 10:26:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F50CE3CFB
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 10:26:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7232F10E599;
	Wed,  4 Feb 2026 09:26:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aWgTejNO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B93B10E599;
 Wed,  4 Feb 2026 09:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770197197; x=1801733197;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=S1nzuNSJMTBoOxH6sKw/202K31gvAx+KFP3lq5TqC5Y=;
 b=aWgTejNOMi/h2ZmSCwvlpgkr8O3oQM0znOzzQ0Us5KJZLqjQvc3Dp2Ii
 w/e0iWQnN62IF+wkVjnGPAK8xLVkvjRD5kzhhFhPYZ1JKG3w6nxsl8u4C
 Nobi4PbgzhcgQBmMhW8qpOBYTxbWrJKNOoXXvFduwSgSZrH7GTgUaf9OF
 TOGrC4gOuu5moO4aFIr0hx7rYHeGx11ziz3TW22Zpl/M0dt7Y1IuppaDy
 AFXIondUrW22rwWnY23Q9hr+5MXjT+mpS/TiNNw31XAqfKYVVyDhEa/xn
 d61hkrAAXCvRBQllsoA0I14MmXKo15RpxZo6HfOUL9j2ij9dqySfp/qvV Q==;
X-CSE-ConnectionGUID: XMo3ujGNQjGah5IVIhgOBw==
X-CSE-MsgGUID: IzhpAF1bQOWX9f519tM/CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71276396"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="71276396"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 01:26:37 -0800
X-CSE-ConnectionGUID: n1iv16PmS3mg1jffErXZPg==
X-CSE-MsgGUID: AuorOw+QQMyB65iZEao1DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="210153564"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.209])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 01:26:35 -0800
Date: Wed, 4 Feb 2026 10:26:32 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH v4] drm/i915/selftests: Defer signalling the request fence
Message-ID: <aYMQyMS1b5PhLPyv@ashyti-mobl2.lan>
References: <20260130184507.45233-2-krzysztof.niemiec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130184507.45233-2-krzysztof.niemiec@intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url,ashyti-mobl2.lan:mid];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andi.shyti@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 1F50CE3CFB
X-Rspamd-Action: no action

Hi Krzysztof,

On Fri, Jan 30, 2026 at 07:45:08PM +0100, Krzysztof Niemiec wrote:
> The i915_active selftests live_active_wait and live_active_retire
> operate on an i915_active attached to a mock, empty request, created as
> part of test setup. A fence is attached to this request to control when
> the request is processed. The tests then wait for the completion of the
> active with __i915_active_wait(), and the test is considered successful
> if this results in setting a variable in the active callback.
> 
> However, the behavior of __i915_active_wait() is such that if the
> refcount for the active is 0, the function is almost completely skipped;
> waiting on a already completed active yields no effect. This includes a
> subsequent call to the retire() function of the active (which is the
> callback that the test is interested about, and which dictates whether
> its successful or not). So, if the active is completed before the
> aforementioned call to __i915_active_wait(), the test will fail.
> 
> Most of the test runs in a single thread, including creating the
> request, creating the fence for it, signalling that fence, and calling
> __i915_active_wait(). However, the request itself is handled
> asynchronously. This creates a race condition where if the request is
> completed after signalling the fence, but before waiting on its active,
> the active callback will not be invoked, failing the test.
> 
> Defer signalling the request's fence, to ensure the main test thread
> gets to call __i915_active_wait() before request completion.
> 
> v4:
> - Lower the delay timeout to 50ms (Jonathan)
> - Put the check on work_finished inside a helper function (Jonathan)
> 
> v3:
> - Embed the variables inside the live_active struct (Andi)
> - Move the schedule_delayed_work call closer to the wait (Andi)
> - Implement error handling in case an error state - the wait has
>   finished, but the deferred work didn't run - is somehow achieved (Andi)
> 
> v2:
> - Clarify the need for a fix a little more (Krzysztof K., Janusz)
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14808
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

BTW, I don't want to block this patch, I'm just not feeling
comfortable at merging it and I don't have better suggestions.

BTW, you already have consensus here:

Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

And, BTW, can you please add comments through the lines so that
people understand what you are doing.

Moreover, as Janusz suggested I would also like to have a real
use case description of the issue and how it appeared in our
environment.

Thanks,
Andi
