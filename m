Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7665F54B5CE
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 18:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D9C112791;
	Tue, 14 Jun 2022 16:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F3411279E;
 Tue, 14 Jun 2022 16:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655223709; x=1686759709;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=IxFj9GRXGTqdp2VxtF9DrhIr3ecVCP7jPtbFkEus/2E=;
 b=h+XC/gaU6CPogFuJ04g2e88gWL+P0sCQ3DBHnWS6MqBT07puF0vus71a
 zKSt7Q3ZDdeqPLlD0rGFmd8ULOWddmWYRjyQsafTqPIftsA7Knek0/muC
 YYn9GofQkNnBWLEtZ55ZmkJFg5clzSko6wmnxXb7pevSNJl73S8ueEt55
 0YhmEaEB4troiXJEYdlmo0iNfc2o4eWyowpfJagrN7N5o9Hy0r0mdiTus
 tYrnkCxpSC8gCnggXW8GqiDqGu3gQfdZunu8T8kEu48chXrtoE8PZvLnp
 mDzRX88alMu6j92582FcGSTnmleRyFUW2YpNAMoHwaMIcfaHJm5Ne2WZR A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="259121199"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="259121199"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 09:21:48 -0700
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="640457908"
Received: from nncongwa-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.32.178])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 09:21:46 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Check ctx while waiting for
 response
In-Reply-To: <20220602172119.96324-1-zhanjun.dong@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220602172119.96324-1-zhanjun.dong@intel.com>
Date: Tue, 14 Jun 2022 19:21:44 +0300
Message-ID: <87k09jxlk7.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 02 Jun 2022, Zhanjun Dong <zhanjun.dong@intel.com> wrote:
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

I think you mean -ECANCELED, not ECANCELED.

Please drop the unlikely(). I no longer want to see a single unlikely()
or likely() added anywhere without proper performance
justification. They make the code harder to read, for no real benefit,
and people just cargo cult copy paste them everywhere. Moreover, nested
unlikely/likely is just silly.

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

Ditto for -ECANCELED and likely().

BR,
Jani.

> +			CT_ERROR(ct, "Sending action %#x failed (%pe) status=%#X\n",
> +				action[0], ERR_PTR(ret), status);
>  	} else if (unlikely(ret)) {
>  		CT_DEBUG(ct, "send action %#x returned %d (%#x)\n",
>  			 action[0], ret, ret);

-- 
Jani Nikula, Intel Open Source Graphics Center
