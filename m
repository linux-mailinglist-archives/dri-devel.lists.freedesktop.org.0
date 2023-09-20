Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3887A8873
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 17:32:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C5A10E490;
	Wed, 20 Sep 2023 15:32:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2710E10E490;
 Wed, 20 Sep 2023 15:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695223975; x=1726759975;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=a7HKqSTQd2pJTS++JjjmKo7EjWkTiEjMiBb8rRIWewA=;
 b=jM1FXEOMDU7Jlf0C2/fWbGEidMSwkZEqETdXTokUL2x896z7J1EZz/ER
 +tpiPM1R1hphrMWh8u7NEaoZXI07SRdUSbWPHgih3YRnGkF/eOGBKV8Dp
 izJBlDdSbybDdbylcU6TWrAAn0OKwG8VpWuURzTlyc8E70VHPdV5eoUSP
 M0jjspv7kNz/uX2i9FILGWb5lXQCww1vggADMfrdR+s4Z6F8Lb0aVyf4P
 gaMUqJbcbC1ZK3CKusYqadqfO4I5SPbAn2Wf1HZZLJb4sIpePeLBTZCsB
 aQe2aOVRDE6t9kmu3fm7lsewpPQ30V+l6db9/KE/FTuRPCcUpQxeDukR7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="411198689"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="411198689"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 08:32:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="696337302"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="696337302"
Received: from conorbyr-mobl1.ger.corp.intel.com (HELO [10.213.199.161])
 ([10.213.199.161])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 08:32:48 -0700
Message-ID: <ccfa3697-b015-ff35-fb92-0efcbd1d7d7c@linux.intel.com>
Date: Wed, 20 Sep 2023 16:32:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 6/6] drm/drm-file: Show finer-grained BO sizes in
 drm_show_memory_stats
Content-Language: en-US
To: =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, robh@kernel.org, steven.price@arm.com
References: <20230919233556.1458793-1-adrian.larumbe@collabora.com>
 <20230919233556.1458793-7-adrian.larumbe@collabora.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230919233556.1458793-7-adrian.larumbe@collabora.com>
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


On 20/09/2023 00:34, Adrián Larumbe wrote:
> The current implementation will try to pick the highest available size
> display unit as soon as the BO size exceeds that of the previous
> multiplier. That can lead to loss of precision in contexts of low memory
> usage.
> 
> The new selection criteria try to preserve precision, whilst also
> increasing the display unit selection threshold to render more accurate
> values.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> ---
>   drivers/gpu/drm/drm_file.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 762965e3d503..34cfa128ffe5 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -872,6 +872,8 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
>   }
>   EXPORT_SYMBOL(drm_send_event);
>   
> +#define UPPER_UNIT_THRESHOLD 100
> +
>   static void print_size(struct drm_printer *p, const char *stat,
>   		       const char *region, u64 sz)
>   {
> @@ -879,7 +881,8 @@ static void print_size(struct drm_printer *p, const char *stat,
>   	unsigned u;
>   
>   	for (u = 0; u < ARRAY_SIZE(units) - 1; u++) {
> -		if (sz < SZ_1K)
> +		if ((sz & (SZ_1K - 1)) &&

IS_ALIGNED worth it at all?

> +		    sz < UPPER_UNIT_THRESHOLD * SZ_1K)
>   			break;

Excuse me for a late comment (I was away). I did not get what what is 
special about a ~10% threshold? Sounds to me just going with the lower 
unit, when size is not aligned to the higher one, would be better than 
sometimes precision-sometimes-not.

Regards,

Tvrtko

>   		sz = div_u64(sz, SZ_1K);
>   	}
