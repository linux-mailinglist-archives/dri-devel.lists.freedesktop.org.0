Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0183B42C5
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 13:59:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943C96ED1E;
	Fri, 25 Jun 2021 11:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E3B6ED1B;
 Fri, 25 Jun 2021 11:58:53 +0000 (UTC)
IronPort-SDR: vNEaWcLfnNgs5mDOVBKlSKsd8kP0WxORo2kj18ERjivBwbtYm5ePKpqV+ZpBrhzFz4m5XH8lKw
 yfN/BPHJwt8A==
X-IronPort-AV: E=McAfee;i="6200,9189,10025"; a="187344554"
X-IronPort-AV: E=Sophos;i="5.83,298,1616482800"; d="scan'208";a="187344554"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2021 04:58:52 -0700
IronPort-SDR: /YMA5UrnRQj8X18hsbeD0giOTzIhYyDQU7VsMHewpp9rA4Lq8tOduLMpxeIJETLURCkl8K6B/C
 t2OtezSlzvUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,298,1616482800"; d="scan'208";a="455417668"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga008.fm.intel.com with ESMTP; 25 Jun 2021 04:58:51 -0700
Received: from [10.249.158.233] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.158.233])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 15PBwoAo021739; Fri, 25 Jun 2021 12:58:50 +0100
Subject: Re: [Intel-gfx] [PATCH 02/47] drm/i915/guc: Improve error message for
 unsolicited CT response
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-3-matthew.brost@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <827f1f84-de98-5a29-d3f7-c806ff3315e1@intel.com>
Date: Fri, 25 Jun 2021 13:58:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624070516.21893-3-matthew.brost@intel.com>
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



On 24.06.2021 09:04, Matthew Brost wrote:
> Improve the error message when a unsolicited CT response is received by
> printing fence that couldn't be found, the last fence, and all requests
> with a response outstanding.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index a59e239497ee..07f080ddb9ae 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -730,12 +730,16 @@ static int ct_handle_response(struct intel_guc_ct *ct, struct ct_incoming_msg *r
>  		found = true;
>  		break;
>  	}
> -	spin_unlock_irqrestore(&ct->requests.lock, flags);
> -
>  	if (!found) {
>  		CT_ERROR(ct, "Unsolicited response (fence %u)\n", fence);
> -		return -ENOKEY;
> +		CT_ERROR(ct, "Could not find fence=%u, last_fence=%u\n", fence,
> +			 ct->requests.last_fence);
> +		list_for_each_entry(req, &ct->requests.pending, link)
> +			CT_ERROR(ct, "request %u awaits response\n",
> +				 req->fence);

not quite sure how listing of awaiting requests could help here (if we
suspect that this is a duplicated reply, then we should rather track
short list of already processed messages to look there) but since it
does not hurt too much, this is:

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> +		err = -ENOKEY;
>  	}
> +	spin_unlock_irqrestore(&ct->requests.lock, flags);
>  
>  	if (unlikely(err))
>  		return err;
> 
