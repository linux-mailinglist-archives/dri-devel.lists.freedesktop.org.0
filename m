Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 324612B5B4A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 09:52:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FEB6E140;
	Tue, 17 Nov 2020 08:52:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0CF9899FF;
 Mon, 16 Nov 2020 14:39:34 +0000 (UTC)
IronPort-SDR: xkRwS4SqNRjBWslAqe1BStqofHB+nntFyddjgUTF9y38iLbIaoXU7cN6W/NA20YqjdcfHdN3Hc
 nylu3+eIDgZA==
X-IronPort-AV: E=McAfee;i="6000,8403,9806"; a="234906669"
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; d="scan'208";a="234906669"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 06:39:34 -0800
IronPort-SDR: R6b3oY/v3CnCcOWkuMD518Pf+r9xY3R/HlBlbNUEWA4/XongdjhCPwsEJXiVwdh5oZQoql/h+N
 vG/Na9Zap50A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; d="scan'208";a="400465398"
Received: from gaia.fi.intel.com ([10.237.72.192])
 by orsmga001.jf.intel.com with ESMTP; 16 Nov 2020 06:39:32 -0800
Received: by gaia.fi.intel.com (Postfix, from userid 1000)
 id 1D5CA5C2038; Mon, 16 Nov 2020 16:37:34 +0200 (EET)
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>, zhangxiaoxu5@huawei.com,
 chris@chris-wilson.co.uk, jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/selftests: Fix wrong return value of
 perf_request_latency()
In-Reply-To: <20201116143540.3648870-1-zhangxiaoxu5@huawei.com>
References: <20201116143540.3648870-1-zhangxiaoxu5@huawei.com>
Date: Mon, 16 Nov 2020 16:37:34 +0200
Message-ID: <87y2j1mkpd.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 17 Nov 2020 08:51:59 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Zhang Xiaoxu <zhangxiaoxu5@huawei.com> writes:

> If intel context create failed, the perf_request_latency() will return 0
> rather than error, because we doesn't initialize the return value.
>
> Fixes: 25c26f18ea79 ("drm/i915/selftests: Measure dispatch latency")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>

Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/selftests/i915_request.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
> index 64bbb8288249..6b512fc13ca7 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_request.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_request.c
> @@ -2293,8 +2293,10 @@ static int perf_request_latency(void *arg)
>  		struct intel_context *ce;
>  
>  		ce = intel_context_create(engine);
> -		if (IS_ERR(ce))
> +		if (IS_ERR(ce)) {
> +			err = PTR_ERR(ce);
>  			goto out;
> +		}
>  
>  		err = intel_context_pin(ce);
>  		if (err) {
> -- 
> 2.25.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
