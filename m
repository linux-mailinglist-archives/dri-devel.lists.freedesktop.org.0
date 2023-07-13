Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1041D751A12
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 09:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD5610E60F;
	Thu, 13 Jul 2023 07:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B2010E60F;
 Thu, 13 Jul 2023 07:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689234033; x=1720770033;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6hJsoL45XgxJRNVny9jsx3ll2cerkILMJl07BIk0jc0=;
 b=HA6bJY9gjh7KBg8ouf5IceiCx4Lf8peYZAP0mT0dVn/9doLqBrZdzZea
 8md47w+f9+chLvvZH899Fbw5CbUOxkKrx+h+5U2Slj0UvacS1JvzQlUhL
 OyudXR2Lk7Ghxn60kTi6iPAQee5Kh+MXVZfCr0YLP7ervyJxhHWjDSyio
 P3v3W/wsu+CLdNIV3tiNOXXWy0EEPe8PCaOIn0MiEaN6EvRDsZPPDUay1
 Ps026DwMdT7Hecp5ZqbrD7hgdbFm2RmX4SjYkUMJPvh0799O0bfgZe0PT
 VaJO8INtPx/nolBO1N+XbABY1lWgYTo5K+RVGEGapNMuIDNFWX3thrUrI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="355031872"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="355031872"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 00:40:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="699164094"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="699164094"
Received: from apaulaux-mobl.ger.corp.intel.com (HELO [10.213.206.56])
 ([10.213.206.56])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 00:40:31 -0700
Message-ID: <8afb8958-cbdb-b230-abe5-02ecdfa500a3@linux.intel.com>
Date: Thu, 13 Jul 2023 08:40:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Intel-gfx] [PATCH v4] drm/i915/selftest/gsc: Ensure GSC Proxy
 init completes before selftests
Content-Language: en-US
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20230711220204.2085513-1-alan.previn.teres.alexis@intel.com>
 <564e2cfd-4597-9f90-d8df-bf028519e689@linux.intel.com>
 <134d8655487a1e2b43eebd4b5bd79962a8a6b285.camel@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <134d8655487a1e2b43eebd4b5bd79962a8a6b285.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/07/2023 18:49, Teres Alexis, Alan Previn wrote:
> On Wed, 2023-07-12 at 10:19 +0100, Tvrtko Ursulin wrote:
>> On 11/07/2023 23:02, Alan Previn wrote:
>>> On MTL, if the GSC Proxy init flows haven't completed, submissions to the
>>> GSC engine will fail. Those init flows are dependent on the mei's
>>> gsc_proxy component that is loaded in parallel with i915 and a
>>> worker that could potentially start after i915 driver init is done.
>>>
>>> That said, all subsytems that access the GSC engine today does check
>>> for such init flow completion before using the GSC engine. However,
>>> selftests currently don't wait on anything before starting.
>>>
>>>
>>>
> alan:snip
> 
>>> +	/*
>>> +	 * The gsc proxy component depends on the kernel component driver load ordering
>>> +	 * and in corner cases (the first time after an IFWI flash), init-completion
>>> +	 * firmware flows take longer.
>>> +	 */
>>> +	unsigned long timeout_ms = 8000;
>>> +
>>> +	if (need_to_wait &&
>>> +	    (wait_for(intel_gsc_uc_fw_proxy_init_done(&i915->media_gt->uc.gsc, true),
>>> +	    timeout_ms)))
>>> +		pr_info(DRIVER_NAME "Timed out waiting for gsc_proxy_completion!\n");
>>
>> Would it make sense to error out here? Or at least upgrade to pr_warn or
>> something?
> alan: agree on pr_warn (especially since need_for_wait being true and we tried for 8 secs - this should never happen).
> 
>>
>> I didn't quite understand the points Daniele raised about engine loops
>> and resets - in my mind GSC engine is this special thing exercised for
>> highly specialized operations and not touched in random for_each_engine
>> loop tests, but I also did not really look so might be totally wrong.
> 
> alan: after consulting with Daniele further, the concern in the case of
> having gsc-proxy-init mid-execution while other selttests
> are running (when thinking of tests that have nothing to do with GSC
> but has indirect effect like memory-pressure, engine-resets,
> etc) is that the proxy-init will bail-out print an error but
> that would result in CI reporting a false-negative. We can't skip
> that error since CONFIG_INTEL_MEI_GSC_PROXY tells us that the kernel
> owner wants GSC-PROXY working.
> 
>>
>> In any case, v4 reads clear - no confusing comments and not
>> over-engineered so is acceptable to me.
>>
> alan: thanks Tvrtko.
> 
> 
>> P.S. Maybe the check *could* be moved to i915_live_selftests, where hw
>> dependencies conceptually fit better, and maybe i915_perf_selftests
>> would need it too then (?), but it is up to you.
> alan: i can do this quickly as a rev5 (after a bit of manual check if perf needs it)
> 
>>
>> Maybe even in the array selftests/i915_live_selftests.h if we could add
>> a facility to make unskippable tests and add this one after the sanity
>> check. Which would then achieve the same generalized thing you had in
>> the previous version without needing to add a new array/loop.
> alan: i rather not attempt this as part of the current patch but will
> consider it as a separate patch if you are okay with that?

Yes that is fine.

Regards,

Tvrtko
