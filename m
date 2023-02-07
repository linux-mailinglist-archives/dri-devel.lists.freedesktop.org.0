Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AF668D21F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 10:08:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E9B10E487;
	Tue,  7 Feb 2023 09:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 578A010E0F5;
 Tue,  7 Feb 2023 09:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675760897; x=1707296897;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GfvOZtIA+hGZNSxBEhmhkS+pbfR6R1+2fCbhLEMUDwg=;
 b=lKygwrjTxkKZaswqHlpyL0CQ8fxlyQLWCVXrzJczYwQ+8AzQOnJfq1aj
 yUOFwOaDIEuzdosP7CTe0dbThXecPSU5vh4Wl8PJl7gXbsG+9YIRI0jf4
 PnIsDO/4GLROndzAkBd+4b7lw19WojNLWIlaLcHJ8qD8xhafj+lborDsH
 XV1BdTwQJKOx5/hQYmTP7aK17/DYKtmR+ZKprhZTN0gjE2KmDH0/j7Fl+
 O0WiR98bxLdJ3LY3JPn3WJ5XcuYo+N9AEnePN1zo6J21zINYmoltlStLR
 1Q+5JorJP7CmsYOhnSExgzf0fVQ4B/n8v3lpHMB8uRHLaAPCSSvcHY9gY A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="331591135"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; d="scan'208";a="331591135"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2023 01:08:16 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="775488968"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; d="scan'208";a="775488968"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.7.15])
 ([10.213.7.15])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2023 01:08:14 -0800
Message-ID: <d88c8392-ebd5-ffd3-d64a-a461a0f50f53@intel.com>
Date: Tue, 7 Feb 2023 10:08:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/pcode: Give the punit time to
 settle before fatally failing
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20230206183236.109908-1-andi.shyti@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230206183236.109908-1-andi.shyti@linux.intel.com>
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06.02.2023 19:32, Andi Shyti wrote:
> From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> 
> During module load the punit might still be busy with its booting
> routines. During this time we try to communicate with it but we
> fail because we don't receive any feedback from it and we return
> immediately with a -EINVAL fatal error.
> 
> At this point the driver load is "dramatically" aborted. The
> following error message notifies us about it.
> 
>     i915 0000:4d:00.0: drm_WARN_ON_ONCE(timeout_base_ms > 3)
> 
> It would be enough to wait a little in order to give the punit
> the chance to come up bright and shiny, ready to interact with
> the driver.
> 
> Wait up 10 seconds for the punit to settle and complete any
> outstanding transactions upon module load. If it still fails try
> again with a longer timeout, 180s, 3 minutes. If it still fails
> then return -EPROBE_DEFER, in order to give the punit a second
> chance.
> 
> Even if these timers might look long, we should consider that the
> punit, depending on the platforms, might need long times to
> complete its routines. Besides we want to try anything possible
> to move forward before deciding to abort the driver's load.
> 
> The issue has been reported in:
> 
>     https://gitlab.freedesktop.org/drm/intel/-/issues/7814
> 
> The changes in this patch are valid only and uniquely during
> boot. The common transactions with the punit during the driver's
> normal operation are not affected.
> 
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Co-developed-by: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

With improved commit message it looks OK for me. There is still question 
why it takes so long for punit to become ready.
Anyway:
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
> Hi,
> 
> I'm proposing again the same patch as v1 with a hopefully more
> descriptive commit log in order to minimize the
> misunderstandings that we had during the v1 review.
> 
> Thanks,
> Andi
> 
> Changelog:
> ==========
> v1 -> v2:
>   - write a more descriptive commit log.
>   - add Chris SoB which was triggering a checkpatch error.
> 
>   drivers/gpu/drm/i915/intel_pcode.c | 35 ++++++++++++++++++++++++++----
>   1 file changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_pcode.c b/drivers/gpu/drm/i915/intel_pcode.c
> index a234d9b4ed143..3db2ba439bb57 100644
> --- a/drivers/gpu/drm/i915/intel_pcode.c
> +++ b/drivers/gpu/drm/i915/intel_pcode.c
> @@ -204,15 +204,42 @@ int skl_pcode_request(struct intel_uncore *uncore, u32 mbox, u32 request,
>   #undef COND
>   }
>   
> +static int pcode_init_wait(struct intel_uncore *uncore, int timeout_ms)
> +{
> +	if (__intel_wait_for_register_fw(uncore,
> +					 GEN6_PCODE_MAILBOX,
> +					 GEN6_PCODE_READY, 0,
> +					 500, timeout_ms,
> +					 NULL))
> +		return -EPROBE_DEFER;
> +
> +	return skl_pcode_request(uncore,
> +				 DG1_PCODE_STATUS,
> +				 DG1_UNCORE_GET_INIT_STATUS,
> +				 DG1_UNCORE_INIT_STATUS_COMPLETE,
> +				 DG1_UNCORE_INIT_STATUS_COMPLETE, timeout_ms);
> +}
> +
>   int intel_pcode_init(struct intel_uncore *uncore)
>   {
> +	int err;
> +
>   	if (!IS_DGFX(uncore->i915))
>   		return 0;
>   
> -	return skl_pcode_request(uncore, DG1_PCODE_STATUS,
> -				 DG1_UNCORE_GET_INIT_STATUS,
> -				 DG1_UNCORE_INIT_STATUS_COMPLETE,
> -				 DG1_UNCORE_INIT_STATUS_COMPLETE, 180000);
> +	/*
> +	 * Wait 10 seconds so that the punit to settle and complete
> +	 * any outstanding transactions upon module load
> +	 */
> +	err = pcode_init_wait(uncore, 10000);
> +
> +	if (err) {
> +		drm_notice(&uncore->i915->drm,
> +			   "Waiting for HW initialisation...\n");
> +		err = pcode_init_wait(uncore, 180000);
> +	}
> +
> +	return err;
>   }
>   
>   int snb_pcode_read_p(struct intel_uncore *uncore, u32 mbcmd, u32 p1, u32 p2, u32 *val)

