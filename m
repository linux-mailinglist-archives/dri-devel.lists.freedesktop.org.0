Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 532B67B054D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 15:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E2BF10E51B;
	Wed, 27 Sep 2023 13:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A173210E51B;
 Wed, 27 Sep 2023 13:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695821075; x=1727357075;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=+XHNQWCVBETgIRjyBme4UQPCGlCFaK0AZIBF1FSbCnw=;
 b=S5fhXsG2+LgkvuYzlE9WzrUdM5xEepaRZyREZPGkZIHjXVgWpYBtucg8
 dlnAEn3CXXP67g4TsMxcmrdKFutjNn4ltv0b6Mu/Q10ijjCBwe6fgf8Ox
 pSD0Pg1JOsDSnP10d1gQyNeQfaQT+aHnTXCFlZQpXdA0sxwsIPBIbn8gt
 gwIpIhhS4Gmk7LmBaDU+5s9PUyAnuz5ojGtHcUlfaz+yxY6ZBtGcz9nNY
 Fmub1GsNB2e7EdFU9KoGJZOuhDzE2FipYY/zfam/tGPOpiG7i99BNMKwx
 l0wxVt9qBtR624gbz8P+9gmIl02ILfkjMLoIqTW7zWAPitKbw6tlos6jz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="412735596"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="412735596"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 06:24:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="996155181"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="996155181"
Received: from mscanex-mobl.ger.corp.intel.com (HELO [10.213.204.17])
 ([10.213.204.17])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 06:24:33 -0700
Message-ID: <fda0350f-0552-6bd0-68c0-9c922d1a6e4e@linux.intel.com>
Date: Wed, 27 Sep 2023 14:24:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 6/6] drm/i915: Implement fdinfo memory stats printing
Content-Language: en-US
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230922134700.235039-1-tvrtko.ursulin@linux.intel.com>
 <20230922134700.235039-7-tvrtko.ursulin@linux.intel.com>
 <ZRPRmaSyZlKnK+xl@ashyti-mobl2.lan>
 <e71f48e4-b2a9-3e73-23d8-a7fddef19ab8@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <e71f48e4-b2a9-3e73-23d8-a7fddef19ab8@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
 Tejas Upadhyay <tejas.upadhyay@intel.com>, dri-devel@lists.freedesktop.org,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 27/09/2023 14:23, Tvrtko Ursulin wrote:
> 
> On 27/09/2023 07:54, Andi Shyti wrote:
>> Hi Tvrtko,
>>
>>> Use the newly added drm_print_memory_stats helper to show memory
>>> utilisation of our objects in drm/driver specific fdinfo output.
>>>
>>> To collect the stats we walk the per memory regions object lists
>>> and accumulate object size into the respective drm_memory_stats
>>> categories.
>>>
>>> v2:
>>>   * Only account against the active region.
>>>   * Use DMA_RESV_USAGE_BOOKKEEP when testing for active. (Tejas)
>>>
>>> v3:
>>>   * Update commit text. (Aravind)
>>>   * Update to use memory regions uabi names.
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>> Cc: Rob Clark <robdclark@gmail.com>
>>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> # v1
>>> Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com> # v2
>>
>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> 
> Thanks guys, just the IGTs remaining now. I've just sent a respin of one 
> patch in that series which will hopefully fix things up.

Actually no, I forgot that decided I will respin the i915 series with 
yet one more patch. Stay tuned please.

Regards,

Tvrtko

> * https://patchwork.freedesktop.org/series/124118/
> 
> First two patches is what we need to merge the kernel side, while the 
> rest are intel_gpu_top fixes followed by per client memory support.
> 
> Regards,
> 
> Tvrtko
> 
