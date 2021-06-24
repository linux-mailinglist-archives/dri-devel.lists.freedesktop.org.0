Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 286BC3B34B5
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 19:23:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B03A6EC65;
	Thu, 24 Jun 2021 17:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF856EC65;
 Thu, 24 Jun 2021 17:23:43 +0000 (UTC)
IronPort-SDR: 59GGth4mRilw9Uxtg/9mrHZrOCbIsG8YJWnmmwjSJpvjB0x9Fo6nF26td+YKDnjcTZ4XMbuHvi
 V2i7/Kdng97Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10025"; a="207459910"
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="207459910"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 10:23:39 -0700
IronPort-SDR: hL45tMUpUbt1ivbxqFLOeu6LPUcJ3/SMp8KCYuQ7ducPt+71F2hcd85ySe0v1m7ZGx4D4asfpS
 nFQWjkTArhfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="642376669"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga005.fm.intel.com with ESMTP; 24 Jun 2021 10:23:38 -0700
Received: from [10.249.129.39] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.129.39])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 15OHNaTW013527; Thu, 24 Jun 2021 18:23:36 +0100
Subject: Re: [PATCH 01/47] drm/i915/guc: Relax CTB response timeout
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-2-matthew.brost@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <3aa378b9-a4e6-37fa-d5f8-ea791ec6f010@intel.com>
Date: Thu, 24 Jun 2021 19:23:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624070516.21893-2-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 24.06.2021 09:04, Matthew Brost wrote:
> In upcoming patch we will allow more CTB requests to be sent in
> parallel to the GuC for processing, so we shouldn't assume any more
> that GuC will always reply without 10ms.
> 
> Use bigger value hardcoded value of 1s instead.
> 
> v2: Add CONFIG_DRM_I915_GUC_CTB_TIMEOUT config option
> v3:
>  (Daniel Vetter)
>   - Use hardcoded value of 1s rather than config option
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 43409044528e..a59e239497ee 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -474,14 +474,16 @@ static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
>  	/*
>  	 * Fast commands should complete in less than 10us, so sample quickly
>  	 * up to that length of time, then switch to a slower sleep-wait loop.
> -	 * No GuC command should ever take longer than 10ms.
> +	 * No GuC command should ever take longer than 10ms but many GuC
> +	 * commands can be inflight at time, so use a 1s timeout on the slower
> +	 * sleep-wait loop.
>  	 */
>  #define done \
>  	(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, READ_ONCE(req->status)) == \
>  	 GUC_HXG_ORIGIN_GUC)
>  	err = wait_for_us(done, 10);
>  	if (err)
> -		err = wait_for(done, 10);
> +		err = wait_for(done, 1000);

can we add #defines for these 10/1000 values? with that

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

>  #undef done
>  
>  	if (unlikely(err))
> 
