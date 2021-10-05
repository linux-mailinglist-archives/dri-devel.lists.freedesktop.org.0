Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BD8421F4D
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 09:13:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A9416E2F2;
	Tue,  5 Oct 2021 07:13:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91B56E2EF;
 Tue,  5 Oct 2021 07:13:44 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="223087210"
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; d="scan'208";a="223087210"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 00:13:44 -0700
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; d="scan'208";a="713967759"
Received: from jstleger-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.209.157.147])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 00:13:43 -0700
Date: Tue, 5 Oct 2021 00:13:43 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org,
 Masahiro Yamada <masahiroy@kernel.org>,
 Steven Price <steven.price@arm.com>, Andrzej Hajda <a.hajda@samsung.com>,
 intel-gfx@lists.freedesktop.org,
 "Sarvela, Tomi P" <tomi.p.sarvela@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: remove IS_ACTIVE
Message-ID: <20211005071343.nufuh3fx3vnxrzro@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20211001074041.2076538-1-lucas.demarchi@intel.com>
 <163308055415.8412.14215483004176995847@build.alporthouse.com>
 <87bl49t6di.fsf@intel.com>
 <20211004205227.xpx67yawrs23gzr2@ldmartin-desk2>
 <20211005061939.GF2083@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20211005061939.GF2083@kadam>
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

On Tue, Oct 05, 2021 at 09:19:39AM +0300, Dan Carpenter wrote:
>On Mon, Oct 04, 2021 at 01:52:27PM -0700, Lucas De Marchi wrote:
>> Cc'ing Dan Carpenter
>>
>> On Fri, Oct 01, 2021 at 12:57:13PM +0300, Jani Nikula wrote:
>> > On Fri, 01 Oct 2021, Chris Wilson <chris@chris-wilson.co.uk> wrote:
>> > > Quoting Lucas De Marchi (2021-10-01 08:40:41)
>> > > > When trying to bring IS_ACTIVE to linux/kconfig.h I thought it wouldn't
>> > > > provide much value just encapsulating it in a boolean context. So I also
>> > > > added the support for handling undefined macros as the IS_ENABLED()
>> > > > counterpart. However the feedback received from Masahiro Yamada was that
>> > > > it is too ugly, not providing much value. And just wrapping in a boolean
>> > > > context is too dumb - we could simply open code it.
>> > > >
>> > > > As detailed in commit babaab2f4738 ("drm/i915: Encapsulate kconfig
>> > > > constant values inside boolean predicates"), the IS_ACTIVE macro was
>> > > > added to workaround a compilation warning. However after checking again
>> > > > our current uses of IS_ACTIVE it turned out there is only
>> > > > 1 case in which it would potentially trigger a warning. All the others
>> > > >   can simply use the shorter version, without wrapping it in any macro.
>> > > > And even that single one didn't trigger any warning in gcc 10.3.
>> > > >
>> > > > So here I'm dialing all the way back to simply removing the macro. If it
>> > > > triggers warnings in future we may change the few cases to check for > 0
>> > > > or != 0. Another possibility would be to use the great "not not
>> > > > operator" for all positive checks, which would allow us to maintain
>> > > > consistency.  However let's try first the simplest form though, hopefully
>> > > > we don't hit broken compilers spitting a warning:
>> > >
>> > > You didn't prevent the compilation warning this re-introduces.
>> > >
>> > > drivers/gpu/drm/i915/i915_config.c:11 i915_fence_context_timeout() warn: should this be a bitwise op?
>> > > drivers/gpu/drm/i915/i915_request.c:1679 i915_request_wait() warn: should this be a bitwise op?
>> >
>> > Looks like that's a Smatch warning. The immediate fix would be to just
>> > add the != 0 in the relevant places. But this is stuff that's just going
>> > to get broken again unless we add Smatch to CI. Most people aren't
>> > running it on a regular basis.
>
>I would really prefer that instead of ensuring that code doesn't
>generate Smatch warnings, people just look over the warnings and then
>mass mark them all as false positives and never look at them again.
>
>It let's us warn about more complicated things without worrying so much
>about being perfect.  When code is fresh in your head then warnings are
>not a big deal to review and you want to warn about every possible issue
>After a year then they take forever and so you really want them to be
>correct or it's a huge waste of time.  I'd prefer Smatch live in the
>space where people run it when the code is fresh.
>
>You would have received some automated emails about this Smatch warning
>but I look over the zero day output and filter the results.
>
>>
>> clang gives a warning only in drivers/gpu/drm/i915/i915_config.c and the
>> warning is gone if the condition swapped:
>>
>> -	if (context && CONFIG_DRM_I915_FENCE_TIMEOUT)
>> +	if (CONFIG_DRM_I915_FENCE_TIMEOUT && context)
>
>I like this rule that when the constant is on the left it's not a mask.
>That makes sense.  I will add that.

thanks, that would be great, so we can really get rid of the macro by
sticking this rule since it works for smatch and clang (and gcc doesn't
give this warning).


thanks
Lucas De Marchi


>
>>
>> which would make sense if we think about shortcutting the if condition.
>> However smatch still reports the warning and an additional one
>> in drivers/gpu/drm/i915/i915_request.c. The ways I found to stop the
>> false positives with smatch are:
>>
>> if (context && CONFIG_DRM_I915_FENCE_TIMEOUT != 0)
>> or
>> if (context && !!CONFIG_DRM_I915_FENCE_TIMEOUT)
>> or
>> if (context && CONFIG_DRM_I915_FENCE_TIMEOUT > 0)
>>
>
>I guess I prefer the first and third but I'll add the rule that Clang
>uses to silence the warning.
>
>regards,
>dan carpenter
>
