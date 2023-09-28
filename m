Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1E67B1CE2
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 14:47:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE34B10E63B;
	Thu, 28 Sep 2023 12:47:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF7D10E637;
 Thu, 28 Sep 2023 12:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695905238; x=1727441238;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=oqSTRmcjCYqRw0sfeiy8ehQSNUX+X8drzSf7sahkeqQ=;
 b=mOESQrQ1X7Ydb/FlusnKdVSwJP2KfY3c75UeOmoXZFeb01ZHNL2KumWl
 8cI8BEUOm80hET56pyi2Jd2OhvsduPVYPVPoFrfE4irQtL1pk+nSiiwtK
 3dufRiqY8dK/sG1GiapBs7+F6/CtHMuM3oo7BsnV+v7tW431nsPhADkNV
 gUMA5/E5+HYtVTmUWeudtPjtD4fsM0Ml+xmhvcyTHIrfROVrA9dn4yG8y
 uihzP4/ulO5ELIK7Fndfx65aLSG3vGLumQjmHR3de0xAr8kLGMYwbiVcg
 b/KEkmG++tcaK2XKKupwKPyYf8lgy/taNrZnFYk9llRsQlL4LsbV7fxqa A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="361419475"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="361419475"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 05:47:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="893001088"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="893001088"
Received: from nlachman-mobl.ger.corp.intel.com (HELO [10.213.204.130])
 ([10.213.204.130])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 05:46:06 -0700
Message-ID: <d1a3df17-4c50-68ba-35d4-8a7ef62b84fb@linux.intel.com>
Date: Thu, 28 Sep 2023 13:47:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/7] drm: Do not round to megabytes for greater than 1MiB
 sizes in fdinfo stats
Content-Language: en-US
To: Steven Price <steven.price@arm.com>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230927133843.247957-1-tvrtko.ursulin@linux.intel.com>
 <20230927133843.247957-2-tvrtko.ursulin@linux.intel.com>
 <3344d3cf-2883-27d1-424e-d33b739dceb5@arm.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <3344d3cf-2883-27d1-424e-d33b739dceb5@arm.com>
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
Cc: =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 27/09/2023 14:48, Steven Price wrote:
> On 27/09/2023 14:38, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> It is better not to lose precision and not revert to 1 MiB size
>> granularity for every size greater than 1 MiB.
>>
>> Sizes in KiB should not be so troublesome to read (and in fact machine
>> parsing is I expect the norm here), they align with other api like
>> /proc/meminfo, and they allow writing tests for the interface without
>> having to embed drm.ko implementation knowledge into them. (Like knowing
>> that minimum buffer size one can use for successful verification has to be
>> 1MiB aligned, and on top account for any pre-existing memory utilisation
>> outside of driver's control.)
>>
>> But probably even more importantly I think that it is just better to show
>> the accurate sizes and not arbitrary lose precision for a little bit of a
>> stretched use case of eyeballing fdinfo text directly.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Rob Clark <robdclark@gmail.com>
>> Cc: Adrián Larumbe <adrian.larumbe@collabora.com>
>> Cc: steven.price@arm.com
> 
> Reviewed-by: Steven Price <steven.price@arm.com>

Thanks! Rob? Can we have your blessing? Could you live with KiBs? :)

Regards,

Tvrtko

>> ---
>>   drivers/gpu/drm/drm_file.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>> index e692770ef6d3..ecb5038009e7 100644
>> --- a/drivers/gpu/drm/drm_file.c
>> +++ b/drivers/gpu/drm/drm_file.c
>> @@ -913,7 +913,7 @@ static void print_size(struct drm_printer *p, const char *stat,
>>   	unsigned u;
>>   
>>   	for (u = 0; u < ARRAY_SIZE(units) - 1; u++) {
>> -		if (sz < SZ_1K)
>> +		if (sz == 0 || !IS_ALIGNED(sz, SZ_1K))
>>   			break;
>>   		sz = div_u64(sz, SZ_1K);
>>   	}
> 
