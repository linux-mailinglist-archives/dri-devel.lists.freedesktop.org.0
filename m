Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D71727D84FC
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 16:43:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6543E10E806;
	Thu, 26 Oct 2023 14:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4387F10E803;
 Thu, 26 Oct 2023 14:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698331423; x=1729867423;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=gvRj8zoEAQvNHFPvydfFtoWh9Gm+3/cEfgKjtecgi2A=;
 b=PdTlvvoG4NhMN6UYnGLUPVGhA2GZZhVnufsJkk8mqXk8s1ifSP0Mf8jK
 CfR83m7MOqT9IaVR+e/5AubP4yBJu2sn+TtR0O5G+fGZyql4RGP96dGMw
 PC8MNj8qKHgLBnUpAkvlBAuK/VDcJHcNxFA7gkEC+m0qSJgmJycGxpNBy
 fXLUpYyyhHA3B0hptNQPY/+GUBQqW1mHU4kkRIrnr2wh1J/WdEcisTda0
 hr6wCy8x3rbEyqqSpE+wHT2fVVVS3yNJsrjNJqSZMQmuXiwEeVoRc5VKR
 fiQFih2mKqM0v9bx1BVqxdu7ZKubtKwl0AayMv4g0KTehB4x91GNpk8Ax A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="384770003"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; d="scan'208";a="384770003"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 07:43:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="882843733"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; d="scan'208";a="882843733"
Received: from lthwaite-mobl.ger.corp.intel.com (HELO [10.213.229.85])
 ([10.213.229.85])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 07:43:39 -0700
Message-ID: <6b4eb4bd-fe32-477e-836a-4f745a173772@linux.intel.com>
Date: Thu, 26 Oct 2023 15:43:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm: Do not round to megabytes for greater than 1MiB
 sizes in fdinfo stats
Content-Language: en-US
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Steven Price <steven.price@arm.com>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230927133843.247957-1-tvrtko.ursulin@linux.intel.com>
 <20230927133843.247957-2-tvrtko.ursulin@linux.intel.com>
 <3344d3cf-2883-27d1-424e-d33b739dceb5@arm.com>
 <d1a3df17-4c50-68ba-35d4-8a7ef62b84fb@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <d1a3df17-4c50-68ba-35d4-8a7ef62b84fb@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 28/09/2023 13:47, Tvrtko Ursulin wrote:
> 
> On 27/09/2023 14:48, Steven Price wrote:
>> On 27/09/2023 14:38, Tvrtko Ursulin wrote:
>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>
>>> It is better not to lose precision and not revert to 1 MiB size
>>> granularity for every size greater than 1 MiB.
>>>
>>> Sizes in KiB should not be so troublesome to read (and in fact machine
>>> parsing is I expect the norm here), they align with other api like
>>> /proc/meminfo, and they allow writing tests for the interface without
>>> having to embed drm.ko implementation knowledge into them. (Like knowing
>>> that minimum buffer size one can use for successful verification has 
>>> to be
>>> 1MiB aligned, and on top account for any pre-existing memory utilisation
>>> outside of driver's control.)
>>>
>>> But probably even more importantly I think that it is just better to 
>>> show
>>> the accurate sizes and not arbitrary lose precision for a little bit 
>>> of a
>>> stretched use case of eyeballing fdinfo text directly.
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> Cc: Rob Clark <robdclark@gmail.com>
>>> Cc: Adrián Larumbe <adrian.larumbe@collabora.com>
>>> Cc: steven.price@arm.com
>>
>> Reviewed-by: Steven Price <steven.price@arm.com>
> 
> Thanks! Rob? Can we have your blessing? Could you live with KiBs? :)

Acked received on #dri-devel:

[12:15] <tursulin> robclark: ping on https://lists.freedesktop.org/archives/dri-devel/2023-September/424905.html - can you live with it or object?
[14:41] <robclark> tursulin: a-b

Adding the drm-misc maintainers with an ask to merge please.

Regards,

Tvrtko

> 
> Regards,
> 
> Tvrtko
> 
>>> ---
>>>   drivers/gpu/drm/drm_file.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>>> index e692770ef6d3..ecb5038009e7 100644
>>> --- a/drivers/gpu/drm/drm_file.c
>>> +++ b/drivers/gpu/drm/drm_file.c
>>> @@ -913,7 +913,7 @@ static void print_size(struct drm_printer *p, 
>>> const char *stat,
>>>       unsigned u;
>>>       for (u = 0; u < ARRAY_SIZE(units) - 1; u++) {
>>> -        if (sz < SZ_1K)
>>> +        if (sz == 0 || !IS_ALIGNED(sz, SZ_1K))
>>>               break;
>>>           sz = div_u64(sz, SZ_1K);
>>>       }
>>
