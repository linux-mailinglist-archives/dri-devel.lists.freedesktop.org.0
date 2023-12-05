Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADFB804AC9
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 07:58:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C508110E220;
	Tue,  5 Dec 2023 06:58:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4130310E220;
 Tue,  5 Dec 2023 06:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701759496; x=1733295496;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QthsoLoEwf9ZS86db24jDse9/mtkERxxgcHr8jOKuWU=;
 b=TqTPuT2OuTyrHyrnXzhoufDO3WTTOTWJGoMNsQmfm97+vX4f5yFkzGz3
 PjiAjXTueU+77Eye+EJOyNM6JKzxIItEoFgP+34znjha24WLpKbsgs0TN
 2CFfB6LfHm0SEnIHmgmvb6fPEsDLplfud8E1EWef3cUGmKyKM/1wjfpxn
 M1JU4mp5K7oJ9Au+iBrhkWPUIKLMQWFnIkdKsN+duLmVOvHz5Mh8r3cfJ
 bD61N5tj47tIsNKgmLJIRMflzhhO08ILn3Xb+cbFI9q7pDuDL4SL9Rq+I
 GjcLaRBFlvq0mKvqnJEwont4/KLuaNzoNmdi15faUZ6RfW72uwSCOzi7S g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="458173026"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="458173026"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 22:58:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1102353649"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="1102353649"
Received: from kkrzywdz-mobl.ger.corp.intel.com (HELO [10.213.18.237])
 ([10.213.18.237])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 22:58:12 -0800
Message-ID: <948df4ec-fff5-452e-bc60-d1bb9492bf80@intel.com>
Date: Tue, 5 Dec 2023 07:58:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/gt: Reduce log severity on reset prepare.
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20231201154443.16660-1-nirmoy.das@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20231201154443.16660-1-nirmoy.das@intel.com>
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 01.12.2023 16:44, Nirmoy Das wrote:
> gen8_engine_reset_prepare() can fail when HW fails to set
> RESET_CTL_READY_TO_RESET bit. In some cases this is not fatal
> error as driver will retry.
>
> Let the caller of gen8_engine_reset_prepare() decide if a
> failure in gen8_engine_reset_prepare is an error or not.
>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5591
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

>   drivers/gpu/drm/i915/gt/intel_reset.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> index d5ed904f355d..e6fbc6202c80 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -593,10 +593,10 @@ static int gen8_engine_reset_prepare(struct intel_engine_cs *engine)
>   	ret = __intel_wait_for_register_fw(uncore, reg, mask, ack,
>   					   700, 0, NULL);
>   	if (ret)
> -		gt_err(engine->gt,
> -		       "%s reset request timed out: {request: %08x, RESET_CTL: %08x}\n",
> -		       engine->name, request,
> -		       intel_uncore_read_fw(uncore, reg));
> +		GT_TRACE(engine->gt,
> +			 "%s reset request timed out: {request: %08x, RESET_CTL: %08x}\n",
> +			 engine->name, request,
> +			 intel_uncore_read_fw(uncore, reg));
>   
>   	return ret;
>   }

