Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7856E76EA79
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 15:33:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 153E210E216;
	Thu,  3 Aug 2023 13:33:04 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F6210E1AE;
 Thu,  3 Aug 2023 13:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691069582; x=1722605582;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qOrih1jiYxlbUokyDmYtkY4b+TEofzrba+mxe36q6kU=;
 b=M5/G7uxr/ohf5XBl+HMVl4FKTSMpJdx+ebuji1EJJ4odqMHCYWO2bCf2
 xsrIlqALu+l/Gp/QFLUgTaLKpYHDU4+1J85BFTFonT762nqbG3v/v6uOF
 r99dp5bgfPmdD7oREeAS2Y4a17EoZD0rtuh7lqpMQBbnCwXDQN3utz75W
 4N2s52SVUI7rmV9DE2dZ42XG7Iy0fo5wftqa5s7MIVvbWikEiRLFBoou/
 Q9yaA1Eup1ZFTlAJkphvaAWjfTHz4xjspFokDFEf91zPrTKbN/gfOScdF
 2ooEfZwcXz/ZQdQ0XnWlI4jIz/NuJOV+wjc0rRVyPlJwbFLAgkvwJESU+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="368773485"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; d="scan'208";a="368773485"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 06:28:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="819653818"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; d="scan'208";a="819653818"
Received: from cavram-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.251.210.12])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 06:28:32 -0700
Date: Thu, 3 Aug 2023 15:28:29 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: John.C.Harrison@intel.com
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Fix potential null pointer
 deref in GuC 'steal id' test
Message-ID: <ZMurfYjREPl5NIGB@ashyti-mobl2.lan>
References: <20230802184940.911753-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802184940.911753-1-John.C.Harrison@Intel.com>
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
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi John,

On Wed, Aug 02, 2023 at 11:49:40AM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> It was noticed that if the very first 'stealing' request failed to
> create for some reason then the 'steal all ids' loop would immediately
> exit with 'last' still being NULL. The test would attempt to continue
> but using a null pointer. Fix that by aborting the test if it fails to
> create any requests at all.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/selftest_guc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> index 1fd760539f77b..bfb72143566f6 100644
> --- a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> @@ -204,9 +204,9 @@ static int intel_guc_steal_guc_ids(void *arg)
>  		if (IS_ERR(rq)) {
>  			ret = PTR_ERR(rq);
>  			rq = NULL;
> -			if (ret != -EAGAIN) {
> -				guc_err(guc, "Failed to create request %d: %pe\n",
> -					context_index, ERR_PTR(ret));
> +			if ((ret != -EAGAIN) || !last) {

isn't last alway NULL here?

Andi

> +				guc_err(guc, "Failed to create %srequest %d: %pe\n",
> +					last ? "" : "first ", context_index, ERR_PTR(ret));
>  				goto err_spin_rq;
>  			}
>  		} else {
> -- 
> 2.39.1
