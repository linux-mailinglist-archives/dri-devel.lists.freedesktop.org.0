Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CEC4D2C78
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 10:49:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA6810E11B;
	Wed,  9 Mar 2022 09:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ECCC10E349;
 Wed,  9 Mar 2022 09:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646819338; x=1678355338;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=skqK4ekP+jaJdGJ2Qw2JrG7jPV40g1I3Zcdcj+wxnO4=;
 b=WNLJXFduBlBzfN66tKCkxZmT+AS+F9jXc8G9RvdOn8Foeed7Zp1+wdKk
 qLWUxT6zeld6flFNmNtdr1Z6nw6pv3I1DVmf3UniYjWYo4zc/ov9Jbz+M
 ZRQw6ydvHcLf6gChn30rsPBlZv/5Rda9rB1EggJg3k/5smN4XWEhdOC6+
 HStcrIJDvQCTwrvLFkm5N8iJaWRrLuHqALAjfRjUZT3QA1YywiIin8Mcj
 zUJE098pCrx3+q5k2lsc03snW/OCkoIJeJ1AEIwhJpNYuVmikbZD9y4y1
 6uyPR4zciQTLTqJM8X753rAWjS8NfZSXLyl/AnzkNzWhVmCo9/t4lmn0P g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="252505566"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="252505566"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 01:48:57 -0800
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="537942978"
Received: from byrnec1x-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.29.235])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 01:48:54 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Colin Ian King <colin.i.king@gmail.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/dpll: make read-only array div1_vals static const
In-Reply-To: <20220307220007.162830-1-colin.i.king@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220307220007.162830-1-colin.i.king@gmail.com>
Date: Wed, 09 Mar 2022 11:48:52 +0200
Message-ID: <87sfrrzcaj.fsf@intel.com>
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 07 Mar 2022, Colin Ian King <colin.i.king@gmail.com> wrote:
> Don't populate the read-only array div1_vals on the stack but
> instead make it static const. Also makes the object code a little
> smaller.

Thanks, but this was just fixed in commit fe70b262e781 ("drm/i915: Move
a bunch of stuff into rodata from the stack").

BR,
Jani.

>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> index 569903d47aea..17668b58b30c 100644
> --- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> +++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> @@ -2759,7 +2759,7 @@ static bool icl_mg_pll_find_divisors(int clock_khz, bool is_dp, bool use_ssc,
>  				     bool is_dkl)
>  {
>  	u32 dco_min_freq, dco_max_freq;
> -	int div1_vals[] = {7, 5, 3, 2};
> +	static const int div1_vals[] = {7, 5, 3, 2};
>  	unsigned int i;
>  	int div2;

-- 
Jani Nikula, Intel Open Source Graphics Center
