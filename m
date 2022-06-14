Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B2254B577
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 18:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0198410FFFD;
	Tue, 14 Jun 2022 16:10:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46CE10FFD5;
 Tue, 14 Jun 2022 16:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655223015; x=1686759015;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=tcvZFuStgoE8L+NtGuRO1YE+9C8CbLA3tl7faHIAbKg=;
 b=njbp7fE4QSeoNh74ZJeg7EivOvA4hO3KuE62wkdYOvw+yChLbkJ/oGqv
 4QNnDk7QI5qfrJN8YXTIDFriDMaZ5di37DJ34ezGVSFkwNOqopXJiuUL1
 EJzzRBx5P8xrKiEU+Lro0D7CFDghxJAbKkp8I4fqUkbNj6F4S6Szjt7Hx
 ok1kBuU5y1jOYcqYb9/KnbN1BrwSL/FU2fliyvyExZ9Wi2YuzMZXvb2/j
 qDa6lgwxc1sjDVi+bzhUghVMqbKCXz0/VKFfA7S2q/yvUGSB9G7HHWprV
 c1L0FKR2rcmJp39B/GS4kGacZZFyQLh+MBL7K/9KjKl7Aim5FdQJoDb+j Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="340326035"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="340326035"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 09:10:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="762023752"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga005.jf.intel.com with ESMTP; 14 Jun 2022 09:10:13 -0700
Received: from [10.249.156.144] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.156.144])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 25EGACgG022330; Tue, 14 Jun 2022 17:10:12 +0100
Message-ID: <ff1f8ab2-2a1e-3b6b-9221-67153593567b@intel.com>
Date: Tue, 14 Jun 2022 18:10:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Check ctx while waiting for
 response
Content-Language: en-US
To: Zhanjun Dong <zhanjun.dong@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20220602172119.96324-1-zhanjun.dong@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20220602172119.96324-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 02.06.2022 19:21, Zhanjun Dong wrote:
> We are seeing error message of "No response for request". Some cases happened
> while waiting for response and reset/suspend action was triggered. In this
> case, no response is not an error, active requests will be cancelled.
> 
> This patch will handle this condition and change the error message into
> debug message.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index f01325cd1b62..a30a388877e2 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -467,7 +467,7 @@ static int ct_write(struct intel_guc_ct *ct,
>   * *	0 response received (status is valid)
>   * *	-ETIMEDOUT no response within hardcoded timeout
>   */
> -static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
> +static int wait_for_ct_request_update(struct ct_request *req, u32 *status, struct intel_guc_ct *ct)

if you need to add "intel_guc_ct *ct" param then make it the first one

>  {
>  	int err;
>  
> @@ -481,12 +481,14 @@ static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
>  #define GUC_CTB_RESPONSE_TIMEOUT_SHORT_MS 10
>  #define GUC_CTB_RESPONSE_TIMEOUT_LONG_MS 1000
>  #define done \
> -	(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, READ_ONCE(req->status)) == \
> +	(!intel_guc_ct_enabled(ct) || FIELD_GET(GUC_HXG_MSG_0_ORIGIN, READ_ONCE(req->status)) == \
>  	 GUC_HXG_ORIGIN_GUC)
>  	err = wait_for_us(done, GUC_CTB_RESPONSE_TIMEOUT_SHORT_MS);
>  	if (err)
>  		err = wait_for(done, GUC_CTB_RESPONSE_TIMEOUT_LONG_MS);
>  #undef done
> +	if (!intel_guc_ct_enabled(ct))
> +		err = -ECANCELED;
>  
>  	*status = req->status;
>  	return err;
> @@ -703,11 +705,15 @@ static int ct_send(struct intel_guc_ct *ct,
>  
>  	intel_guc_notify(ct_to_guc(ct));
>  
> -	err = wait_for_ct_request_update(&request, status);
> +	err = wait_for_ct_request_update(&request, status, ct);
>  	g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
>  	if (unlikely(err)) {
> -		CT_ERROR(ct, "No response for request %#x (fence %u)\n",
> -			 action[0], request.fence);
> +		if (unlikely(err == ECANCELED))

you are looking for -ECANCELED
and I guess you can safely drop "unlikely" hint here

> +			CT_DEBUG(ct, "Request %#x (fence %u) cancelled as CTB is disabled\n",
> +				action[0], request.fence);
> +		else
> +			CT_ERROR(ct, "No response for request %#x (fence %u)\n",
> +				action[0], request.fence);
>  		goto unlink;
>  	}
>  
> @@ -771,8 +777,9 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
>  
>  	ret = ct_send(ct, action, len, response_buf, response_buf_size, &status);
>  	if (unlikely(ret < 0)) {
> -		CT_ERROR(ct, "Sending action %#x failed (%pe) status=%#X\n",
> -			 action[0], ERR_PTR(ret), status);
> +		if (likely(ret != ECANCELED))

ditto

,Michal

> +			CT_ERROR(ct, "Sending action %#x failed (%pe) status=%#X\n",
> +				action[0], ERR_PTR(ret), status);
>  	} else if (unlikely(ret)) {
>  		CT_DEBUG(ct, "send action %#x returned %d (%#x)\n",
>  			 action[0], ret, ret);
