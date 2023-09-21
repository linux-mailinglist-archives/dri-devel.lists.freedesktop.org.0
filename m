Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B917A937D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 12:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8EA110E0E7;
	Thu, 21 Sep 2023 10:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7BC10E0E7;
 Thu, 21 Sep 2023 10:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695291275; x=1726827275;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=DUAFX+JNi4nRkne3bhKFanmYulDhmk2cpGuyh+eKgqo=;
 b=kHqLSJd18gFY98e8hfcjhY9NxF+FBZGu6nFqsFJE0brbQ3gkbCyF5IIL
 HpzcLcmD74h8ZZQXO71aC+nU2RSvpCi/fMVSBR1Rl7sQlaA45Bfdevg7B
 8iJAcOQbZ1FWktLsPMUD8Q8C7JKxwpIDh7rtzHBUeWIdnEXfinpL7ZZ+0
 gj/6c+dbDvrLH/ICXJKrdP3SMda7dvgj9+L84kQ9bZ+Wj7rSrVBGW8lUk
 2mhR7+BQI19a3Qqb2rdGOixrxq4QHuxx4GgYmE+zeL3ZkBUU+7ZKqGSOR
 VxIf/7LNR/IWdC/odT9DotG5RjKolF6m1CGaCTCRZFIIWvRA1Y49ipGuG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="411422763"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="411422763"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 03:14:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="723688411"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="723688411"
Received: from asilke-mobl2.ger.corp.intel.com (HELO [10.213.199.249])
 ([10.213.199.249])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 03:14:29 -0700
Message-ID: <6b9c8566-926d-40ff-7907-228d317fab3d@linux.intel.com>
Date: Thu, 21 Sep 2023 11:14:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 6/6] drm/drm-file: Show finer-grained BO sizes in
 drm_show_memory_stats
Content-Language: en-US
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, robh@kernel.org, steven.price@arm.com
References: <20230919233556.1458793-1-adrian.larumbe@collabora.com>
 <20230919233556.1458793-7-adrian.larumbe@collabora.com>
 <ccfa3697-b015-ff35-fb92-0efcbd1d7d7c@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ccfa3697-b015-ff35-fb92-0efcbd1d7d7c@linux.intel.com>
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, healych@amazon.com,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 20/09/2023 16:32, Tvrtko Ursulin wrote:
> 
> On 20/09/2023 00:34, Adrián Larumbe wrote:
>> The current implementation will try to pick the highest available size
>> display unit as soon as the BO size exceeds that of the previous
>> multiplier. That can lead to loss of precision in contexts of low memory
>> usage.
>>
>> The new selection criteria try to preserve precision, whilst also
>> increasing the display unit selection threshold to render more accurate
>> values.
>>
>> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
>> Reviewed-by: Steven Price <steven.price@arm.com>
>> ---
>>   drivers/gpu/drm/drm_file.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>> index 762965e3d503..34cfa128ffe5 100644
>> --- a/drivers/gpu/drm/drm_file.c
>> +++ b/drivers/gpu/drm/drm_file.c
>> @@ -872,6 +872,8 @@ void drm_send_event(struct drm_device *dev, struct 
>> drm_pending_event *e)
>>   }
>>   EXPORT_SYMBOL(drm_send_event);
>> +#define UPPER_UNIT_THRESHOLD 100
>> +
>>   static void print_size(struct drm_printer *p, const char *stat,
>>                  const char *region, u64 sz)
>>   {
>> @@ -879,7 +881,8 @@ static void print_size(struct drm_printer *p, 
>> const char *stat,
>>       unsigned u;
>>       for (u = 0; u < ARRAY_SIZE(units) - 1; u++) {
>> -        if (sz < SZ_1K)
>> +        if ((sz & (SZ_1K - 1)) &&
> 
> IS_ALIGNED worth it at all?
> 
>> +            sz < UPPER_UNIT_THRESHOLD * SZ_1K)
>>               break;
> 
> Excuse me for a late comment (I was away). I did not get what what is 
> special about a ~10% threshold? Sounds to me just going with the lower 
> unit, when size is not aligned to the higher one, would be better than 
> sometimes precision-sometimes-not.

FWIW both current and the threshold option make testing the feature very 
annoying.

So I'd really propose we simply use smaller unit when unaligned.

Regards,

Tvrtko
