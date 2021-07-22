Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DD03D1FB3
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 10:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892B86E8C4;
	Thu, 22 Jul 2021 08:13:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C106E828;
 Thu, 22 Jul 2021 08:13:48 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="233404900"
X-IronPort-AV: E=Sophos;i="5.84,260,1620716400"; d="scan'208";a="233404900"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 01:13:48 -0700
X-IronPort-AV: E=Sophos;i="5.84,260,1620716400"; d="scan'208";a="470540265"
Received: from cstylian-mobl3.ger.corp.intel.com (HELO [10.213.198.98])
 ([10.213.198.98])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 01:13:47 -0700
Subject: Re: [Intel-gfx] [PATCH 47/51] drm/i915/selftest: Increase some
 timeouts in live_requests
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210716201724.54804-1-matthew.brost@intel.com>
 <20210716201724.54804-48-matthew.brost@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <d15aeb2c-3fa1-a78c-2d23-0f64112f3ca3@linux.intel.com>
Date: Thu, 22 Jul 2021 09:13:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210716201724.54804-48-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 16/07/2021 21:17, Matthew Brost wrote:
> Requests may take slightly longer with GuC submission, let's increase
> the timeouts in live_requests.

Hm "slightly" ends up 5x longer here and one second feels a lot.

Out of curiosity, given this is about a simple submit of a no-op batches 
in a tight loop, where does the huge amount of extra latency come from? 
Is it single H2G channel shared for all engines, the firmware, or GuC 
speed itself?

Regards,

Tvrtko

> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/selftests/i915_request.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
> index bd5c96a77ba3..d67710d10615 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_request.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_request.c
> @@ -1313,7 +1313,7 @@ static int __live_parallel_engine1(void *arg)
>   		i915_request_add(rq);
>   
>   		err = 0;
> -		if (i915_request_wait(rq, 0, HZ / 5) < 0)
> +		if (i915_request_wait(rq, 0, HZ) < 0)
>   			err = -ETIME;
>   		i915_request_put(rq);
>   		if (err)
> @@ -1419,7 +1419,7 @@ static int __live_parallel_spin(void *arg)
>   	}
>   	igt_spinner_end(&spin);
>   
> -	if (err == 0 && i915_request_wait(rq, 0, HZ / 5) < 0)
> +	if (err == 0 && i915_request_wait(rq, 0, HZ) < 0)
>   		err = -EIO;
>   	i915_request_put(rq);
>   
> 
