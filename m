Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEFE6F136A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 10:45:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C9910E3AD;
	Fri, 28 Apr 2023 08:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1FB10E3A2;
 Fri, 28 Apr 2023 08:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682671496; x=1714207496;
 h=message-id:date:mime-version:subject:from:to:references:
 in-reply-to:content-transfer-encoding;
 bh=HaArLA49P7+6NLAqGisNOe4gyVgpD4p1Dtm5COyMi7k=;
 b=WLovsS0jrSAZOEgWbLTWwdsmRN7DVa3wfXaAFnZH8/MN8DJllU8offqG
 M2WtQMPNPfrBR1K5wEP5bTmSpC9t3y56sXvFLERcixlXrYhOPjXF3GdCU
 ++90FqZ1eVxOHh1SsVl2IbBbfSxibJr7ahRmKRH2V8EWKLOaOgq6PSovT
 V3oq60usapPqp8Y2ul6Rtr+Em5HFmmqltPshp7SC8G7/jW2/XIOz299gd
 HeMigVcyVFkCpETpzt7xGo01ijPU+RQlVnxGI8j5FCqfH325IIj+YG+Zj
 JyROVyto+cAjqACjawniwgljbO1nPSyt4+wEEzc0DKg1aomhXLGRzHYf1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="413069042"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="413069042"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 01:44:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="727456396"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="727456396"
Received: from ksathish-mobl.ger.corp.intel.com (HELO [10.213.194.196])
 ([10.213.194.196])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 01:44:54 -0700
Message-ID: <3b2a7f29-6490-00d0-8f29-f8bd5cea0d11@linux.intel.com>
Date: Fri, 28 Apr 2023 09:44:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [RFC 4/4] drm/i915: Expose RPS thresholds in sysfs
Content-Language: en-US
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230428081457.857009-1-tvrtko.ursulin@linux.intel.com>
 <20230428081457.857009-5-tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230428081457.857009-5-tvrtko.ursulin@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 28/04/2023 09:14, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> User feedback indicates significant performance gains are possible in
> specific games with non default RPS up/down thresholds.
> 
> Expose these tunables via sysfs which will allow users to achieve best
> performance when running games and best power efficiency elsewhere.
> 
> Note this patch supports non GuC based platforms only.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/8389

[snip]

> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index a5a7315f5ace..f790e81546ff 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -2588,7 +2588,12 @@ static int rps_set_threshold(struct intel_rps *rps, u8 *threshold, u8 val)
>   	ret = mutex_lock_interruptible(&rps->lock);
>   	if (ret)
>   		return ret;
> -	*threshold = val;
> +	if (*threshold != val) {
> +		*threshold = val;
> +		intel_rps_set(rps, clamp(rps->cur_freq,
> +					 rps->min_freq_softlimit,
> +					 rps->max_freq_softlimit));
> +	}
>   	mutex_unlock(&rps->lock);
>   
>   	return 0;

This hunk belongs to a previous patch - moved locally.

Regards,

Tvrtko
