Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D538262FE74
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 20:57:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE0C10E7BD;
	Fri, 18 Nov 2022 19:57:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F6610E7BB;
 Fri, 18 Nov 2022 19:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668801416; x=1700337416;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ertAS7sO+LutJ++r3QWxXHOc0JbtT13lQbmphNWZS+g=;
 b=aYSVMhQ/Rhh3TBygvPEenzXI4/44OE4LfJLxG7rUuywy7jDHnEicn97E
 XNHvHD6YeQA5B5q0hjeEQcpw/1c2qgI87NHHQbSENAteekqLa2j1wMI5q
 x+0Vtu04XnhYfH9gVSU642xJ5Pgdugb4TIZjtyTSZXW459B1molHrmFWb
 CeqVkSzzR2jvrTz/DK53+0MPJWew1BldG6TYQevVHg2JXNPm7Ywg+llhD
 GdxRsRFFX89+s5yezNMlS56yXjhxNyjJySJQbB273GNhAN2Gyt3t9UEB2
 NffVjFV4ZjybRijUrJLWOGyY4jLT7WBO+aWE4klTWViBLhw6XFuKW606t A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="314371698"
X-IronPort-AV: E=Sophos;i="5.96,175,1665471600"; d="scan'208";a="314371698"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2022 11:56:55 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="709146116"
X-IronPort-AV: E=Sophos;i="5.96,175,1665471600"; d="scan'208";a="709146116"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.251.221.159])
 ([10.251.221.159])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2022 11:56:52 -0800
Message-ID: <b7b01eef-3550-9f9f-11d0-8698fa322f66@linux.intel.com>
Date: Fri, 18 Nov 2022 20:56:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/2] drm/i915: Never return 0 if not all requests
 retired
Content-Language: en-US
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
References: <20221118104222.57328-1-janusz.krzysztofik@linux.intel.com>
 <20221118104222.57328-3-janusz.krzysztofik@linux.intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20221118104222.57328-3-janusz.krzysztofik@linux.intel.com>
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
 dri-devel@lists.freedesktop.org, Chris Wilson <chris.p.wilson@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/18/2022 11:42 AM, Janusz Krzysztofik wrote:
> Users of intel_gt_retire_requests_timeout() expect 0 return value on
> success.  However, we have no protection from passing back 0 potentially
> returned by a call to dma_fence_wait_timeout() when it succedes right
> after its timeout has expired.
>
> Replace 0 with -ETIME before potentially using the timeout value as return
> code, so -ETIME is returned if there are still some requests not retired
> after timeout, 0 otherwise.
>
> v2: Move the added lines down so flush_submission() is not affected.
>
> Fixes: f33a8a51602c ("drm/i915: Merge wait_for_timelines with retire_request")
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: stable@vger.kernel.org # v5.5+
> ---
>   drivers/gpu/drm/i915/gt/intel_gt_requests.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> index edb881d756309..3ac4603eeb4ee 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> @@ -199,6 +199,9 @@ out_active:	spin_lock(&timelines->lock);
>   	if (remaining_timeout)
>   		*remaining_timeout = timeout;
>   
> +	if (!timeout)
> +		timeout = -ETIME;

This will return error, -ETIME when 0 timeout is passed, 
intel_gt_retire_requests().

We don't want that. I think you can use a separate variable to store 
return val from the dma_fence_wait_timeout()


Regards,

Nirmoy

> +
>   	return active_count ? timeout : 0;
>   }
>   
