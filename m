Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB177B0546
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 15:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A10210E519;
	Wed, 27 Sep 2023 13:23:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D37F610E519;
 Wed, 27 Sep 2023 13:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695821003; x=1727357003;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1/+VUs+Dk0YwCmbA/fdddi35Tw2RI33cc6EBCmejS0Q=;
 b=Ju8JOlt4Krz9Z4h9OlXHwSslI9IDGYGZXMFb3pKzc1kkspPYcm80SmbE
 B3QonRFWuShgvX60VNy2Bs8p1N61KFjCqEPCkVJP6aps+Fd57u7jGuZiL
 SbR9kZgnRN+9GMTWi9iL5DVTxm0DQUhhoY1HToo5KrYDwjNcQBKYSxVBZ
 6gSMjIm6i7s1gdlae7ErR5C9Byy7gFmHMRm9UvTBZPcWfqlepbZIkoRIP
 4aFvbkZvGvHWdsIyXRrhkJiIlwR9f4aemNp3yWWXy2XH/Z4JmO4lk7/55
 bSriQJHx36MccOuEGxjx5QeY367VNg4OShkQvecg59aazt1q4ZwjZ1j7O g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="412735063"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="412735063"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 06:23:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="996154982"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="996154982"
Received: from mscanex-mobl.ger.corp.intel.com (HELO [10.213.204.17])
 ([10.213.204.17])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 06:23:21 -0700
Message-ID: <e71f48e4-b2a9-3e73-23d8-a7fddef19ab8@linux.intel.com>
Date: Wed, 27 Sep 2023 14:23:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 6/6] drm/i915: Implement fdinfo memory stats printing
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230922134700.235039-1-tvrtko.ursulin@linux.intel.com>
 <20230922134700.235039-7-tvrtko.ursulin@linux.intel.com>
 <ZRPRmaSyZlKnK+xl@ashyti-mobl2.lan>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZRPRmaSyZlKnK+xl@ashyti-mobl2.lan>
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
 Tejas Upadhyay <tejas.upadhyay@intel.com>, dri-devel@lists.freedesktop.org,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 27/09/2023 07:54, Andi Shyti wrote:
> Hi Tvrtko,
> 
>> Use the newly added drm_print_memory_stats helper to show memory
>> utilisation of our objects in drm/driver specific fdinfo output.
>>
>> To collect the stats we walk the per memory regions object lists
>> and accumulate object size into the respective drm_memory_stats
>> categories.
>>
>> v2:
>>   * Only account against the active region.
>>   * Use DMA_RESV_USAGE_BOOKKEEP when testing for active. (Tejas)
>>
>> v3:
>>   * Update commit text. (Aravind)
>>   * Update to use memory regions uabi names.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Rob Clark <robdclark@gmail.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> # v1
>> Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com> # v2
> 
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks guys, just the IGTs remaining now. I've just sent a respin of one 
patch in that series which will hopefully fix things up.

* https://patchwork.freedesktop.org/series/124118/

First two patches is what we need to merge the kernel side, while the 
rest are intel_gpu_top fixes followed by per client memory support.

Regards,

Tvrtko

