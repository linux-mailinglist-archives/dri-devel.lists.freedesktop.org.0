Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E296C45CB
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 10:10:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE7910E8C5;
	Wed, 22 Mar 2023 09:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A398010E8C5;
 Wed, 22 Mar 2023 09:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679476214; x=1711012214;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=USG+g8lheJpL7vWPQy/qU5DepydtaWJssDhTBt71quY=;
 b=DGpXOiGr0f/spI01au7X76lyJ3kPSoyOrir8frvoYQ+Qj0EhE/UP9BFd
 Pkvt/LsgOJqqvIyl5ML5HUIFrjmYCmHSY3Mp0BLKZrZsqFhg+wChUOxKV
 xcJ3QrIcLnMdTe6+9sGBvNf7gGCXhm+H5voN3XGfjSkBaxQGi6YMuMgsd
 5496YxuJNu+APmeqhcOFmUfHYUoHC0XQOO3Ev2NywDRzclST2jVxFvWCu
 WILkKtPyj08zkBg791T5ptfz0FlRrl1S+7aQ1e9sW92XC4Arbm1/+ZwkK
 vqEebNkO4eiVAU4hZEVPK0Fawl0axRuS1WY7IA8/InCV2Roxv/wxjyp9H g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="336669486"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="336669486"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 02:10:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="792465752"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="792465752"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.22.233])
 ([10.213.22.233])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 02:10:12 -0700
Message-ID: <72ab4666-2b3b-86c9-110e-14217dc2c3eb@intel.com>
Date: Wed, 22 Mar 2023 10:10:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [Intel-gfx] [PATCH v2 2/2] drm/i915: Check for unreliable MMIO
 during forcewake
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>
References: <20230321170936.478631-1-andi.shyti@linux.intel.com>
 <20230321170936.478631-3-andi.shyti@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230321170936.478631-3-andi.shyti@linux.intel.com>
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
Cc: Andi Shyti <andi.shyti@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21.03.2023 18:09, Andi Shyti wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> Although we now sanitycheck MMIO access during driver load to make sure
> the MMIO BAR isn't returning all 0xFFFFFFFF, there have been a few cases
> where (temporarily?) unreliable MMIO access has happened after GPU
> resets or power events.  We'll often notice this on our next GT register
> access since forcewake handling will fail; let's change our handling
> slightly so that when this happens we print a more meaningful message
> clarifying that the problem is the MMIO access, not forcewake
> specifically.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/intel_uncore.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index 0b69081d6d285..303a5d38c93a5 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -178,9 +178,15 @@ static inline void
>   fw_domain_wait_ack_clear(const struct intel_uncore_forcewake_domain *d)
>   {
>   	if (wait_ack_clear(d, FORCEWAKE_KERNEL)) {
> -		drm_err(&d->uncore->i915->drm,
> -			"%s: timed out waiting for forcewake ack to clear.\n",
> -			intel_uncore_forcewake_domain_to_str(d->id));
> +		if (fw_ack(d) == ~0)
> +			drm_err(&d->uncore->i915->drm,
> +				"%s: MMIO unreliable (forcewake register returns 0xFFFFFFFF)!\n",
> +				intel_uncore_forcewake_domain_to_str(d->id));
> +		else
> +			drm_err(&d->uncore->i915->drm,
> +				"%s: timed out waiting for forcewake ack to clear.\n",
> +				intel_uncore_forcewake_domain_to_str(d->id));
> +
With:

if (!wait_ack_clear(...))
	return;

you do not need to indent.
And since drm_err have the same set of args in both cases, except fmt, 
it could be also simplified.

Anyway I am not sure if it is worth effort, so:
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej


>   		add_taint_for_CI(d->uncore->i915, TAINT_WARN); /* CI now unreliable */
>   	}
>   }

