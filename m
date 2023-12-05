Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7456F804C7D
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 09:34:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6829A10E48E;
	Tue,  5 Dec 2023 08:34:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B83A10E49C;
 Tue,  5 Dec 2023 08:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701765248; x=1733301248;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=O8Lmjn1nDHBYRDdJW/oj+bugCU4rCHZ/pN/rDIGET3Q=;
 b=WMPSw9xWbHT3SxkdvOvW7o9dxu+n7P7+B6JzorR71sXf1jw+kKIcZRxB
 KXT5omaEPHFs27717yMRmXKBYrPluvjjTludU0dPRKverKcRH3EpkL3k7
 k5Ca2/no7D+nXxuVq6kDx3pG8HX3pqciNiCLHod9M5vc4SyOKmV2rgQRn
 ix6Irqb07r8OzXQzpE0piWOspLqflsZu7msDfynf9v+IY0e7ovQUGn7SK
 YLWJnswNsoooeAtKWBCA5sPK3xRCbhdsxQ+EwIHCQXkp1bRJOBETzZxgG
 KYywPJEHwNHmhnknxvVQMAXthvMvg9VgGud3/zArt70IcP60IpbQFrnw5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="393596402"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="393596402"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 00:34:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="17344270"
Received: from ctgorman-mobl.ger.corp.intel.com (HELO [10.213.202.242])
 ([10.213.202.242])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 00:34:06 -0800
Message-ID: <cff13a24-2f7f-4d44-8fd4-a45cbfa1c76e@linux.intel.com>
Date: Tue, 5 Dec 2023 08:34:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt: Reduce log severity on reset
 prepare.
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20231201154443.16660-1-nirmoy.das@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
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
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 01/12/2023 15:44, Nirmoy Das wrote:
> gen8_engine_reset_prepare() can fail when HW fails to set
> RESET_CTL_READY_TO_RESET bit. In some cases this is not fatal
> error as driver will retry.
> 
> Let the caller of gen8_engine_reset_prepare() decide if a
> failure in gen8_engine_reset_prepare is an error or not.

No complaints per se but I don't see the caller deciding and it is not 
really reducing log level but converting to trace. So commit message and 
patch do not align for me which I think should be improved.

Regards,

Tvrtko

> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5591
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
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
