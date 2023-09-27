Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE7B7B021F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 12:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4959F10E4D3;
	Wed, 27 Sep 2023 10:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7437010E4D0;
 Wed, 27 Sep 2023 10:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695811476; x=1727347476;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Sevmqir3ZsDPHHj9KTUVJjXoSdUQ2CQ/oRL7tS2H6uQ=;
 b=ac+wQvYFbK55Rh1lD6ApE7TNN3o96nyJghHM/IqPzVLzoXG0VD156VUD
 1qJxhSTEdGf1Cl768nEPH8wlMZXhAQcNlCl8nllod8NHG5IBriAFXJPc6
 bOtGvXHYJH+PWL55QJf4Z1eGxpFvNtNcxw+0PARz9Y9HCGQc0QdP16QGM
 9aUUxPXwr2Sr1NWXRJFcNOaqFeRB3v4GZprt31LZR/e1+8CS5C6cBA9cr
 VM1r7j7GfhGFq1ua2D9nc9/Q0Z8UuLefisi4umywp8pz290c6PTvOVqrN
 eDDjtA5nJswDS05nKa0H6FjsHSZfCHIXKzeJTqpuWDAPFnKUTJwbzr9/W g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="361181765"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="361181765"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 03:44:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="814836904"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="814836904"
Received: from mscanex-mobl.ger.corp.intel.com (HELO [10.213.204.17])
 ([10.213.204.17])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 03:44:33 -0700
Message-ID: <a9250a89-d738-3fc8-3868-d92f60d096e5@linux.intel.com>
Date: Wed, 27 Sep 2023 11:44:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] drm/i915: Do not disable preemption for resets
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230926100855.61722-1-tvrtko.ursulin@linux.intel.com>
 <ZRKxy49j17qgg14y@ashyti-mobl2.lan>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZRKxy49j17qgg14y@ashyti-mobl2.lan>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@intel.com>,
 Paul Gortmaker <paul.gortmaker@windriver.com>, dri-devel@lists.freedesktop.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 26/09/2023 11:26, Andi Shyti wrote:
> Hi Tvrtko,
> 
> On Tue, Sep 26, 2023 at 11:08:55AM +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Commit ade8a0f59844 ("drm/i915: Make all GPU resets atomic") added a
>> preempt disable section over the hardware reset callback to prepare the
>> driver for being able to reset from atomic contexts.
>>
>> In retrospect I can see that the work item at a time was about removing
>> the struct mutex from the reset path. Code base also briefly entertained
>> the idea of doing the reset under stop_machine in order to serialize
>> userspace mmap and temporary glitch in the fence registers (see
>> eb8d0f5af4ec ("drm/i915: Remove GPU reset dependence on struct_mutex"),
>> but that never materialized and was soon removed in 2caffbf11762
>> ("drm/i915: Revoke mmaps and prevent access to fence registers across
>> reset") and replaced with a SRCU based solution.
>>
>> As such, as far as I can see, today we still have a requirement that
>> resets must not sleep (invoked from submission tasklets), but no need to
>> support invoking them from a truly atomic context.
>>
>> Given that the preemption section is problematic on RT kernels, since the
>> uncore lock becomes a sleeping lock and so is invalid in such section,
>> lets try and remove it. Potential downside is that our short waits on GPU
>> to complete the reset may get extended if CPU scheduling interferes, but
>> in practice that probably isn't a deal breaker.
>>
>> In terms of mechanics, since the preemption disabled block is being
>> removed we just need to replace a few of the wait_for_atomic macros into
>> busy looping versions which will work (and not complain) when called from
>> non-atomic sections.
>>
>> v2:
>>   * Fix timeouts which are now in us. (Andi)
>>   * Update one comment as a drive by. (Andi)
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Chris Wilson <chris.p.wilson@intel.com>
>> Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
>> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> 
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thank you, pushed to drm-intel-gt-next!

Regards,

Tvrtko
