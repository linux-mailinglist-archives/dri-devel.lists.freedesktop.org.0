Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A81E39174C
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 14:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33DAD6ECC9;
	Wed, 26 May 2021 12:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B33F6ECC9;
 Wed, 26 May 2021 12:25:33 +0000 (UTC)
IronPort-SDR: owekpinC9JmaCR73j0MTkWr7L17Uc/pNK1vfYR31g7B8wx/7iY/hs51szb1ZhWw9MeZvUiEXkN
 0RVOooHyXObg==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="182096221"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="182096221"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 05:25:29 -0700
IronPort-SDR: 3bEwz9K/lmSM5rGBL8CsZuZg2LLMlRGenyJbly0QnHm13aXXavWkk7pR0G4yfAHFqR6jWoBD5j
 OnML+UkeShbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="476911921"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga001.jf.intel.com with ESMTP; 26 May 2021 05:25:28 -0700
Received: from [10.249.135.143] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.135.143])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 14QCPQgp013781; Wed, 26 May 2021 13:25:27 +0100
Subject: Re: [PATCH 13/18] drm/i915/guc: Relax CTB response timeout
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210526064237.77853-1-matthew.brost@intel.com>
 <20210526064237.77853-14-matthew.brost@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <cef31e1d-7502-78ae-84bd-60daaca01732@intel.com>
Date: Wed, 26 May 2021 14:25:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210526064237.77853-14-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 26.05.2021 08:42, Matthew Brost wrote:
> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> In upcoming patch we will allow more CTB requests to be sent in
> parallel to the GuC for processing, so we shouldn't assume any more
> that GuC will always reply without 10ms.
> 
> Use bigger value from CONFIG_DRM_I915_GUC_CTB_TIMEOUT instead.
> 
> v2: Add CONFIG_DRM_I915_GUC_CTB_TIMEOUT config option
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/Kconfig.profile      | 9 +++++++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 5 ++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/Kconfig.profile b/drivers/gpu/drm/i915/Kconfig.profile
> index 39328567c200..68ac707755d2 100644
> --- a/drivers/gpu/drm/i915/Kconfig.profile
> +++ b/drivers/gpu/drm/i915/Kconfig.profile
> @@ -38,6 +38,15 @@ config DRM_I915_USERFAULT_AUTOSUSPEND
>  	  May be 0 to disable the extra delay and solely use the device level
>  	  runtime pm autosuspend delay tunable.
>  
> +config DRM_I915_GUC_CTB_TIMEOUT
> +	int "How long to wait for the GuC to make forward progress on CTBs (ms)"

maybe worth to provide here explicit allowed range:

	range 10 60000

and then we can skip runtime adjustment for minimum 10ms timeout

> +	default 1500 # milliseconds
> +	help
> +	  Configures the default timeout waiting for GuC the to make forward
> +	  progress on CTBs. e.g. Waiting for a response to requeset.

typo

> +
> +	  A minimum value of 10 ms is allowed.
> +
>  config DRM_I915_HEARTBEAT_INTERVAL
>  	int "Interval between heartbeat pulses (ms)"
>  	default 2500 # milliseconds
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 916c2b80c841..5b0dece7a7cd 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -436,6 +436,7 @@ static int ct_write(struct intel_guc_ct *ct,
>   */
>  static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
>  {
> +	long timeout;
>  	int err;
>  
>  	/*
> @@ -443,10 +444,12 @@ static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
>  	 * up to that length of time, then switch to a slower sleep-wait loop.
>  	 * No GuC command should ever take longer than 10ms.
>  	 */
> +	timeout = max(10, CONFIG_DRM_I915_GUC_CTB_TIMEOUT);
> +
>  #define done INTEL_GUC_MSG_IS_RESPONSE(READ_ONCE(req->status))
>  	err = wait_for_us(done, 10);
>  	if (err)
> -		err = wait_for(done, 10);
> +		err = wait_for(done, timeout);
>  #undef done
>  
>  	if (unlikely(err))
> 
