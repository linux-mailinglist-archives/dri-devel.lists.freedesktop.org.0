Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71414700410
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 11:41:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1463910E65C;
	Fri, 12 May 2023 09:41:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDCC10E65C;
 Fri, 12 May 2023 09:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683884501; x=1715420501;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Ml4e/WSWA27STqZR9yeyutwTu0stdOuinFsNGLsdYFw=;
 b=PmWYkpLG6CqbJ4yvWhTyjgL+fkOo0BD7Hc7O3ZH4Yib3eg2Nb9el5R9r
 S7nfYkukZCdxiQaCR+oiObbdI2Zw1lp9yJJ7UfKO2ConZnWXAQKKon1J1
 2/VzlP6xn9tiMCDHgkgew4Ils5+teH8vWy3HzQXNeUS+K9BlHcPG1Oj01
 ArvidlaJIQcqbKwYEULdSWwW0m5anIfmGdAya5kj4/O80KrBwnyRHpxEV
 Mes29SBxQbQkkLk5Mgn5FYEwMetrm2A5qOfpuP1VWLDraTQLeICVEmqb3
 G4WFS2IOQAOeSqBeUcL/ZpVnW5ix7ClX+HhG3P4dTSxTsHegCoMmRipFs Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="352998232"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="352998232"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 02:41:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="703136389"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="703136389"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.27.56])
 ([10.213.27.56])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 02:41:39 -0700
Message-ID: <0a540009-d31a-9faf-8d56-2c85ce53e0a9@intel.com>
Date: Fri, 12 May 2023 11:41:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/hwmon: Silence UBSAN uninitialized
 bool variable warning
Content-Language: en-US
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230510183606.2480777-1-ashutosh.dixit@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230510183606.2480777-1-ashutosh.dixit@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10.05.2023 20:36, Ashutosh Dixit wrote:
> Loading i915 on UBSAN enabled kernels (CONFIG_UBSAN/CONFIG_UBSAN_BOOL)
> causes the following warning:
> 
>    UBSAN: invalid-load in drivers/gpu/drm/i915/gt/uc/intel_uc.c:558:2
>    load of value 255 is not a valid value for type '_Bool'
>    Call Trace:
>     dump_stack_lvl+0x57/0x7d
>     ubsan_epilogue+0x5/0x40
>     __ubsan_handle_load_invalid_value.cold+0x43/0x48
>     __uc_init_hw+0x76a/0x903 [i915]
>     ...
>     i915_driver_probe+0xfb1/0x1eb0 [i915]
>     i915_pci_probe+0xbe/0x2d0 [i915]
> 
> The warning happens because during probe i915_hwmon is still not available
> which results in the output boolean variable *old remaining
> uninitialized. Silence the warning by initializing the variable to an
> arbitrary value.
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>


Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   drivers/gpu/drm/i915/i915_hwmon.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index a3bdd9f68a458..685663861bc0b 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -502,8 +502,11 @@ void i915_hwmon_power_max_disable(struct drm_i915_private *i915, bool *old)
>   	struct i915_hwmon *hwmon = i915->hwmon;
>   	u32 r;
>   
> -	if (!hwmon || !i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit))
> +	if (!hwmon || !i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit)) {
> +		/* Fix uninitialized bool variable warning */
> +		*old = false;
>   		return;
> +	}
>   
>   	mutex_lock(&hwmon->hwmon_lock);
>   

