Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E833A3C66
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 08:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBEED6E5AE;
	Fri, 11 Jun 2021 06:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80DB6E5AE;
 Fri, 11 Jun 2021 06:55:55 +0000 (UTC)
IronPort-SDR: enDEGqoRgnjMme1JhlpqlthApMfkikqWd7DFivEY2VJyMQ+F6bIwrhIS5vigoAmNDXeAUHxlj2
 S0gBzMLR0KZw==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="192787658"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; d="scan'208";a="192787658"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 23:55:52 -0700
IronPort-SDR: ppCayO4jrH3gEexB/qlBG1ftfcd/8iCQh/8MdUHYXByhrgEOtZq9QRLrxBeNzulFCvftDtBlJe
 xi8DrGKGXchw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; d="scan'208";a="470534794"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga004.fm.intel.com with ESMTP; 10 Jun 2021 23:55:52 -0700
Received: from [10.249.153.175] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.153.175])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 15B6tnm2015421; Fri, 11 Jun 2021 07:55:49 +0100
Subject: Re: [PATCH 1/1] drm/i915/guc: Relax CTB response timeout
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210611000555.133859-1-matthew.brost@intel.com>
 <20210611000555.133859-2-matthew.brost@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <2576cc2b-ae11-1ae4-127d-7b2b1b51bfb6@intel.com>
Date: Fri, 11 Jun 2021 08:55:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210611000555.133859-2-matthew.brost@intel.com>
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



On 11.06.2021 02:05, Matthew Brost wrote:
> In upcoming patch we will allow more CTB requests to be sent in
> parallel to the GuC for processing, so we shouldn't assume any more
> that GuC will always reply without 10ms.

s/without/within

> 
> Use bigger value hardcoded value of 1s instead.
> 
> v2: Add CONFIG_DRM_I915_GUC_CTB_TIMEOUT config option
> v3:
>  (Daniel Vetter)
>   - Use hardcoded value of 1s rather than config option

if this is v3 then it's likely still my patch, so I can't give r-b

> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 8f7b148fef58..bc626ca0a9eb 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -475,12 +475,14 @@ static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
>  	/*
>  	 * Fast commands should complete in less than 10us, so sample quickly
>  	 * up to that length of time, then switch to a slower sleep-wait loop.
> -	 * No GuC command should ever take longer than 10ms.
> +	 * No GuC command should ever take longer than 10ms but many GuC
> +	 * commands can be inflight at time, so use a 1s timeout on the slower
> +	 * sleep-wait loop.

this is x100 increase of timeout that not only looks nice, but it should
cover for ~100 CTB messages (of len 10 dwords) in our current 4K send CT
buffer, so LGTM

Michal

ps. unless in the future we decide to increase that CT size to something
much bigger, so maybe we should connect this timeout with number of
possible concurrent messages in flight? not a blocker

>  	 */
>  #define done INTEL_GUC_MSG_IS_RESPONSE(READ_ONCE(req->status))
>  	err = wait_for_us(done, 10);
>  	if (err)
> -		err = wait_for(done, 10);
> +		err = wait_for(done, 1000);
>  #undef done
>  
>  	if (unlikely(err))
> 
