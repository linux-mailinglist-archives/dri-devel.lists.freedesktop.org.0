Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A5A636430
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 16:42:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A2D10E59C;
	Wed, 23 Nov 2022 15:42:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0381210E59B;
 Wed, 23 Nov 2022 15:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669218129; x=1700754129;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kpvMgL7bhIO/OBnu6i47motW/ruLXZLpRUpjkbUCzL0=;
 b=j8dUyrXoKfc/gqI1+pepqc0XP/+B0xjhud3AiujsiBN+Y3se/cpAKBXl
 FTOord9VhOijY5n5xW/zgCL8RMxaOlJOBXTgWVNmVibYo/WXOETiUY6jI
 c9vg8UjTAZWdXCo2mky4P6tqAMU8bURCrjfbCu33DmxpgXTD2pSo/0yey
 28xenPnQPLfItAbd6wO60HDKo/pUZcl1VxGHqiuCnXbqHxF3fTnUpV7j6
 r60Ao/8j8TWDVEaJNZnWfywyf7ZAJ8m5a+Wktym/c2ARFsT4W6CNrFjSi
 lR5HturcDWQCtllwJnuT+xsri1Zru0YV1RsPEhAjWPAc8qRRPfbWHKywU w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="378350939"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="378350939"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 07:42:08 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="766760438"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="766760438"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.16.106])
 ([10.213.16.106])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 07:42:05 -0800
Message-ID: <713228b8-16ec-c791-7f1c-abae0316831a@intel.com>
Date: Wed, 23 Nov 2022 16:42:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.0
Subject: Re: [PATCH v3 2/2] drm/i915: Never return 0 if not all requests
 retired
Content-Language: en-US
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
References: <20221121145655.75141-1-janusz.krzysztofik@linux.intel.com>
 <20221121145655.75141-3-janusz.krzysztofik@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20221121145655.75141-3-janusz.krzysztofik@linux.intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@intel.com>, dri-devel@lists.freedesktop.org,
 John Harrison <John.C.Harrison@Intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 21.11.2022 15:56, Janusz Krzysztofik wrote:
> Users of intel_gt_retire_requests_timeout() expect 0 return value on
> success.  However, we have no protection from passing back 0 potentially
> returned by a call to dma_fence_wait_timeout() when it succedes right
> after its timeout has expired.
>
> Replace 0 with -ETIME before potentially using the timeout value as return
> code, so -ETIME is returned if there are still some requests not retired
> after timeout, 0 otherwise.
>
> v3: Use conditional expression, more compact but also better reflecting
>      intention standing behind the change.
>
> v2: Move the added lines down so flush_submission() is not affected.
>
> Fixes: f33a8a51602c ("drm/i915: Merge wait_for_timelines with retire_request")
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

I confirm my r-b.

Regards
Andrzej

> Cc: stable@vger.kernel.org # v5.5+
> ---
>   drivers/gpu/drm/i915/gt/intel_gt_requests.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> index edb881d756309..1dfd01668c79c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> @@ -199,7 +199,7 @@ out_active:	spin_lock(&timelines->lock);
>   	if (remaining_timeout)
>   		*remaining_timeout = timeout;
>   
> -	return active_count ? timeout : 0;
> +	return active_count ? timeout ?: -ETIME : 0;
>   }
>   
>   static void retire_work_handler(struct work_struct *work)

