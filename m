Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A74193AF95
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 12:06:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C600E10E66D;
	Wed, 24 Jul 2024 10:06:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PtjFDiws";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C4E10E67D;
 Wed, 24 Jul 2024 10:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721815564; x=1753351564;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=R6nytAPZD4VSGNeS55Spjqw6SGRF9f95mchzaxhpM1k=;
 b=PtjFDiwsaGynUAVPwDp7ixVQcRdhG+zh0/dJqNSB6iziZFCsyn0fLzOt
 e482SMZeeQIjZAUQ6vy+ahTTxZ3wpHt4MCOB2kogIGA7HeIGqbyHaqhz4
 x4wD3LLSbX//NzaMyRFGMEc4tEvouaPphu5CeAsm95RPmWLGMbBDcZjQe
 QlYoIG62Ny3NzWk1xcKjhagmhR9G9sJDZrLE5mUh1ixse6niNxEZtU5Ad
 fuU3UcP8IvKpuVzBzPr2W0MvPedFYwq3VAEVVfsKpZHDwZ828Pw9yKGZ9
 wrzLGXAqi0c1/V5qZM4iqepFLT8dfruGMxZrXdmPMMHAfmJr4775hkX3Y w==;
X-CSE-ConnectionGUID: h1zeJiyQTgW00zHbGQTugQ==
X-CSE-MsgGUID: hFqpsDZ5ScaKcU5ZajBDpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="19096983"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="19096983"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 03:06:04 -0700
X-CSE-ConnectionGUID: YtIHWzjnTKi1WnBKn0frTg==
X-CSE-MsgGUID: 23DthYL/QFaQDRvlZzjYGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="56684670"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.170])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 03:06:00 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Colin Ian King <colin.i.king@gmail.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/i915/dp: Make read-only array bw_gbps static
 const
In-Reply-To: <20240722153937.574819-1-colin.i.king@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240722153937.574819-1-colin.i.king@gmail.com>
Date: Wed, 24 Jul 2024 13:05:56 +0300
Message-ID: <87frrzf6kb.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 22 Jul 2024, Colin Ian King <colin.i.king@gmail.com> wrote:
> Don't populate the read-only array bw_gbps on the stack at run time,
> instead make it static const.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Pushed to drm-intel-next, thanks for the patch.

BR,
Jani.

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 59f11af3b0a1..a082ed8f5464 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -3434,7 +3434,7 @@ static void intel_dp_get_pcon_dsc_cap(struct intel_dp *intel_dp)
>  
>  static int intel_dp_pcon_get_frl_mask(u8 frl_bw_mask)
>  {
> -	int bw_gbps[] = {9, 18, 24, 32, 40, 48};
> +	static const int bw_gbps[] = {9, 18, 24, 32, 40, 48};
>  	int i;
>  
>  	for (i = ARRAY_SIZE(bw_gbps) - 1; i >= 0; i--) {

-- 
Jani Nikula, Intel
