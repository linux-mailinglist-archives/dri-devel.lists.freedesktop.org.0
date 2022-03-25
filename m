Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB354E7A3F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 19:37:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5125B10E182;
	Fri, 25 Mar 2022 18:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A042D10E182;
 Fri, 25 Mar 2022 18:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648233461; x=1679769461;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wuLEbTBz7SfTnuMZJ9l8kCMV8rdyCtiXOoi0m6I0OUE=;
 b=NFAJR6WxJd9CHefak+5q5mMUoq2lm8ExHXXrD4lvXps418c/iUj/9oor
 2zgF+6WFsd8jgubHnZT5LlJcVnjXTKeBIh++QadmxDTV0lf3LwA2slkbu
 Lcy3qScen0Dp6ub15StJZWB4wA9lTTsLOLagP7/GAopNrQPbWqQQyyEju
 PJ4SGvEUWuxBi2dXUIVvMtX0vDoRINPWF6LR2FETKGEBpdtST+fbXatz2
 ZeNgiXdSsvDbX98DNwnMeGbbiNm7+RZYvU2pW3Pg8Pn+t82gDTLvUsV7U
 vnY0tKnXhSwjkM+Z72yEIIJdAmIsuiD2A4ICKOwKErCotl9vYrUlGUvIS g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10297"; a="319401465"
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; d="scan'208";a="319401465"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 11:37:41 -0700
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; d="scan'208";a="561933074"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.61.27])
 ([10.252.61.27])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 11:37:40 -0700
Message-ID: <71bbc214-b3a0-d3ca-c3bc-fe6d0b8d162c@linux.intel.com>
Date: Fri, 25 Mar 2022 19:37:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915: fix remaining_timeout in
 intel_gt_retire_requests_timeout
Content-Language: en-US
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20220325175839.2717499-1-daniele.ceraolospurio@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20220325175839.2717499-1-daniele.ceraolospurio@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/25/2022 6:58 PM, Daniele Ceraolo Spurio wrote:
> In intel_gt_wait_for_idle, we use the remaining timeout returned from
> intel_gt_retire_requests_timeout to wait on the GuC being idle. However,
> the returned variable can have a negative value if something goes wrong
> during the wait, leading to us hitting a GEM_BUG_ON in the GuC wait
> function.
> To fix this, make sure to only return the timeout if it is positive.
>
> Fixes: b97060a99b01b ("drm/i915/guc: Update intel_gt_wait_for_idle to work with GuC")
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gt_requests.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> index edb881d756309..ef70c209976d8 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> @@ -197,7 +197,7 @@ out_active:	spin_lock(&timelines->lock);
>   		active_count++;
>   
>   	if (remaining_timeout)
> -		*remaining_timeout = timeout;
> +		*remaining_timeout = timeout > 0 ? timeout : 0;


Should the last flush_submission() be  "if ( timeout > 0 
&&flush_submission(gt, timeout))" ?


Nirmoy

>   
>   	return active_count ? timeout : 0;
>   }
