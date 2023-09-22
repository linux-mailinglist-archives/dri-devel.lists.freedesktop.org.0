Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B265F7AB343
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 16:04:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E15110E194;
	Fri, 22 Sep 2023 14:04:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 440EF10E689;
 Fri, 22 Sep 2023 14:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695391450; x=1726927450;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BTfvrs5EOPQJfVJYIu6aaO3NsW53LRV0R0jYG09hQ3Y=;
 b=Dr87weIne0i6h6VKp92QFKpDrksSuKtgIhC7pRYW99wgharn5yhOikzB
 mZGh+CuuMvv8y7uhuVe6L4pibRMbvz/1Csu/spdeWly8ZuaLU6qWrRtaj
 QsIsvZ00LioXEI8Ajh2VIX/kXl/w9dyb0WlEvs1iLRwszX7UNQFEbi5XI
 h9Tiz4TLkwpPYmh2j6WLMLiYFTYYAeue+QOhM9FIZcH2F/hQkmcdVrhCy
 56NRZ5oWBvhyZYY99BZNVlNoaMWJ26noa9Xu4QdRYIJoByu10OVIFDURa
 ob8Sn7/qLCLCpyvi1EercxuIEIRiH4Sqix2i4kXXX302zdfFSEzY6XoIg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="378122886"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="378122886"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 07:03:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="871253379"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="871253379"
Received: from placki-mobl.ger.corp.intel.com (HELO [10.213.200.149])
 ([10.213.200.149])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 07:02:32 -0700
Message-ID: <5a92b93c-6c6c-059a-c07b-a8b0b4b2b364@linux.intel.com>
Date: Fri, 22 Sep 2023 15:02:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 6/6] drm/drm-file: Show finer-grained BO sizes in
 drm_show_memory_stats
Content-Language: en-US
To: =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>
References: <20230919233556.1458793-1-adrian.larumbe@collabora.com>
 <20230919233556.1458793-7-adrian.larumbe@collabora.com>
 <ccfa3697-b015-ff35-fb92-0efcbd1d7d7c@linux.intel.com>
 <6b9c8566-926d-40ff-7907-228d317fab3d@linux.intel.com>
 <rn5metso2yr2kyxix3fh2ub77jpjf6avs754eshgpd2lu33bkw@33way22pozgh>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <rn5metso2yr2kyxix3fh2ub77jpjf6avs754eshgpd2lu33bkw@33way22pozgh>
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
Cc: tzimmermann@suse.de, sean@poorly.run, quic_abhinavk@quicinc.com,
 mripard@kernel.org, steven.price@arm.com, freedreno@lists.freedesktop.org,
 healych@amazon.com, Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 dmitry.baryshkov@linaro.org, marijn.suijten@somainline.org,
 kernel@collabora.com, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 22/09/2023 12:03, Adrián Larumbe wrote:
> On 21.09.2023 11:14, Tvrtko Ursulin wrote:
>>
>> On 20/09/2023 16:32, Tvrtko Ursulin wrote:
>>>
>>> On 20/09/2023 00:34, Adrián Larumbe wrote:
>>>> The current implementation will try to pick the highest available size
>>>> display unit as soon as the BO size exceeds that of the previous
>>>> multiplier. That can lead to loss of precision in contexts of low memory
>>>> usage.
>>>>
>>>> The new selection criteria try to preserve precision, whilst also
>>>> increasing the display unit selection threshold to render more accurate
>>>> values.
>>>>
>>>> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>>>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
>>>> Reviewed-by: Steven Price <steven.price@arm.com>
>>>> ---
>>>>    drivers/gpu/drm/drm_file.c | 5 ++++-
>>>>    1 file changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>>>> index 762965e3d503..34cfa128ffe5 100644
>>>> --- a/drivers/gpu/drm/drm_file.c
>>>> +++ b/drivers/gpu/drm/drm_file.c
>>>> @@ -872,6 +872,8 @@ void drm_send_event(struct drm_device *dev, struct
>>>> drm_pending_event *e)
>>>>    }
>>>>    EXPORT_SYMBOL(drm_send_event);
>>>> +#define UPPER_UNIT_THRESHOLD 100
>>>> +
>>>>    static void print_size(struct drm_printer *p, const char *stat,
>>>>                   const char *region, u64 sz)
>>>>    {
>>>> @@ -879,7 +881,8 @@ static void print_size(struct drm_printer *p,
>>>> const char *stat,
>>>>        unsigned u;
>>>>        for (u = 0; u < ARRAY_SIZE(units) - 1; u++) {
>>>> -        if (sz < SZ_1K)
>>>> +        if ((sz & (SZ_1K - 1)) &&
>>>
>>> IS_ALIGNED worth it at all?
>>>
>>>> +            sz < UPPER_UNIT_THRESHOLD * SZ_1K)
>>>>                break;
>>>
>>> Excuse me for a late comment (I was away). I did not get what what is
>>> special about a ~10% threshold? Sounds to me just going with the lower
>>> unit, when size is not aligned to the higher one, would be better than
>>> sometimes precision-sometimes-not.
>>
>> FWIW both current and the threshold option make testing the feature very
>> annoying.
> 
> How so?

I have to build in the knowledge of implementation details of 
print_size() into my IGT in order to use the right size BOs, so test is 
able to verify stats move as expected. It just feels wrong.

>> So I'd really propose we simply use smaller unit when unaligned.
> 
> Like I said in the previous reply, for drm files whose overall BO size sum is enormous
> but not a multiple of a MiB, this would render huge number representations in KiB.
> I don't find this particularly comfortable to read, and then this extra precision
> would mean nothing to nvtop or gputop, which would have to scale the size to their
> available screen dimensions when plotting them.

I don't think numbers in KiB are so huge.

And I don't think people will end up reading them manually a lot anyway, 
since you have to hunt the pid, and fd, etc.. It is much more realistic 
that some tool like gputop will be used.

And I don't think consistency of units across drivers or whatever 
matters. Even better to keep userspace parser on their toes and make 
then follow drm-usage-stats.rst and not any implementations, at some 
point in time.

Regards,

Tvrtko
