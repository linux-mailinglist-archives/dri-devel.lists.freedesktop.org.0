Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB2B7229E1
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 16:54:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F3210E2D2;
	Mon,  5 Jun 2023 14:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A9A10E2B0;
 Mon,  5 Jun 2023 14:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685976871; x=1717512871;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UYYHFeEVlWX986yoPTAijJL1NHZxed0Rg+GKJp87O18=;
 b=YWtrWukkm1GyIxvx7wnoq84PxUTPw9P1o5hGTAkRPhPft3gzJyZEscHh
 OAlhFjowQj9kbeuhosalHFseYtHAoverQjbVUQKRS09Z0ajq1T7I+Y7N4
 wrU34tZksuyvZ4UdOCgnFumRxl4ZxwoJ68XZdB05qMGQV4OXvSlrfdh0h
 43yTKFXl5Hrwfq7Gs9jZ4RbVTb7FfjRavCTC+BTfh5wcBZMglKnraUl2D
 ZFwZg0zO2/mhxxX8sCOGBAwxS1JjamcevQiz919LKiMYPY52GKB+eMQRD
 J88f5Bjl2m5VawHBsejjLnOMu7RZeI5uiqGBiwpf6GYcYAvnPNiPQEU4e A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="384692017"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="384692017"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 07:54:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="708684015"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="708684015"
Received: from mloughma-mobl1.ger.corp.intel.com (HELO [10.213.238.159])
 ([10.213.238.159])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 07:54:29 -0700
Message-ID: <4bfc14c0-19f3-459c-f71c-1b6a92c46d69@linux.intel.com>
Date: Mon, 5 Jun 2023 15:54:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/i915/selftests: Add some missing error propagation
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <20230605131135.396854-1-tvrtko.ursulin@linux.intel.com>
 <b47de249-085d-482a-afb2-eee82a06aba8@kadam.mountain>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <b47de249-085d-482a-afb2-eee82a06aba8@kadam.mountain>
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
Cc: Intel-gfx@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 05/06/2023 14:43, Dan Carpenter wrote:
> On Mon, Jun 05, 2023 at 02:11:35PM +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Add some missing error propagation in live_parallel_switch.
>>
>> To avoid needlessly burdening the various backport processes, note I am
>> not marking it as a fix against any patches and not copying stable since
>> it is debug/selftests only code.
>>
> 
> This patch is unlikely to make a difference in real life, but I don't
> think avoiding Fixes tags and backports is the right thing.
> 
> I would add a Fixes tag and not add a stable tag.
> 
> The real burden with Fixes tags is if it breaks someone's system.  But
> if it's breaking selftests then hopefully those are the people best
> able to deal with it.
> 
> Fixes tags are different from stable tags.  If the code is very recent
> then the fixes tag can automatically allow us to filter out that patch
> from going back to stable.  So for new patches Fixes is the opposite of
> CC'ing stable.
> 
> If the bug is old, then adding a Fixes tag does increase the chance of a
> backport though, that's true.
> 
> My guess is that if the stable maintainers thought that selftests/ were
> causing too much issue with backports they would add a grep line to
> their scripts to solve that problem.  Instead we were having the
> opposite discussion the other week where the bpf people didn't want to
> backport selftest stuff and Greg wanted to.

I just don't see the benefit since to my knowledge no one outside our CI systems runs selftests. And this implies mostly the current development kernel is tested. So backporting is irrelevant.

Even with just the Fixes: tags the internal tooling will be picking the patches up during the -rc phase and even that can cause conflicts and some mental load to maintainers.

Granted, *if* patch truly is a fix for a selftest failure which can actually happen then it is useful to pick it up for the -rc window. Although that feels extremely rare, otherwise it would have been spotted much before.

In any case, I struggle to make myself interested into Fixes: tag for "impossible" selftests failures.

But I can also put them in, 99% of time is not a big deal:

Fixes: 50d16d44cce4 ("drm/i915/selftests: Exercise context switching in parallel")
Fixes: 6407cf533217 ("drm/i915/selftests: Stop using kthread_stop()")

Stable is even worse since to handle them the pointless workload is even bigger. But if stable wants everything sure, we can send everything. :)

Cc: <stable@vger.kernel.org> # v5.5+

As long as it is accepted that it is unlikely no one will bother to create conflict free backports for all kernels where those don't apply.

Regards,

Tvrtko

> https://lore.kernel.org/all/2023052647-tacking-wince-85c5@gregkh/
> 
> regards,
> dan carpenter
> 
