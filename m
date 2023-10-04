Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C40767B7F05
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 14:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E503D10E11A;
	Wed,  4 Oct 2023 12:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2210710E11A;
 Wed,  4 Oct 2023 12:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696422429; x=1727958429;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=hB9Yjd4NQ30uhK42hDWzL7lVygrB4+lP1EZ4tgefKrU=;
 b=gD+rp3hThldIQjwEIWM+2lPk1pym8rOCIfZjBxmNmTaascVT2k/L7xH7
 0C7F3EqJW/LLo3mJNblXtl2TFDSBZBVhwzrBxORBZveHegl9BaX33wa5q
 R+F8y3GtFzA5rSPR200V7cdZrmhrwEpernXXuT9jO7zdF4FVzM3Mq8Kic
 q4awvZHyBKESePbCKirBqLb3kXOJIsd/DA2N/SLUUml2eSCDqoXj52Fdp
 1jP3qlWQbQOAfMEybYB0wzuBlw2mvA3NfN5hURrDmNHAcdOI+3ysCmlq0
 IpECjBAuDmn3tG+5DBTQqxQHpIEK/tRfl/Q/7wwzzxSe19Pj5HhC1+N9y Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="368208327"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="368208327"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 05:27:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="867343413"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="867343413"
Received: from cyrillet-mobl.ger.corp.intel.com ([10.252.55.203])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 05:27:04 -0700
Date: Wed, 4 Oct 2023 15:27:01 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH v2 09/16] platform/x86/amd/pmf: Add facility to dump TA
 inputs
In-Reply-To: <20230930083715.2050863-10-Shyam-sundar.S-k@amd.com>
Message-ID: <a81a6c40-7489-292c-b0df-90b851e4ef75@linux.intel.com>
References: <20230930083715.2050863-1-Shyam-sundar.S-k@amd.com>
 <20230930083715.2050863-10-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Xinhui.Pan@amd.com, Patil.Reddy@amd.com, basavaraj.natikar@amd.com,
 dri-devel@lists.freedesktop.org, jikos@kernel.org,
 amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 markgross@kernel.org, Hans de Goede <hdegoede@redhat.com>,
 benjamin.tissoires@redhat.com, mario.limonciello@amd.com,
 linux-input@vger.kernel.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 30 Sep 2023, Shyam Sundar S K wrote:

> PMF driver sends constant inputs to TA which its gets via the other
> subsystems in the kernel. To debug certain TA issues knowing what inputs
> being sent to TA becomes critical. Add debug facility to the driver which
> can isolate Smart PC and TA related issues.
> 
> Also, make source_as_str() as non-static function as this helper is
> required outside of sps.c file.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/pmf.h    |  3 +++
>  drivers/platform/x86/amd/pmf/spc.c    | 37 +++++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/sps.c    |  2 +-
>  drivers/platform/x86/amd/pmf/tee-if.c |  1 +
>  4 files changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 34778192432e..2ad5ece47601 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -595,6 +595,7 @@ int apmf_get_static_slider_granular(struct amd_pmf_dev *pdev,
>  bool is_pprof_balanced(struct amd_pmf_dev *pmf);
>  int amd_pmf_power_slider_update_event(struct amd_pmf_dev *dev);
>  
> +const char *source_as_str(unsigned int state);

Too generic name, add prefix to the name.

-- 
 i.

>  int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx);
>  int amd_pmf_set_sps_power_limits(struct amd_pmf_dev *pmf);
> @@ -625,4 +626,6 @@ int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev);
>  
>  /* Smart PC - TA interfaces */
>  void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
> +void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
> +
>  #endif /* PMF_H */
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index 3113bde051d9..3aee78629cce 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -14,6 +14,43 @@
>  #include <linux/units.h>
>  #include "pmf.h"
>  
> +#ifdef CONFIG_AMD_PMF_DEBUG
> +static const char *ta_slider_as_str(unsigned int state)
> +{
> +	switch (state) {
> +	case TA_BEST_PERFORMANCE:
> +		return "PERFORMANCE";
> +	case TA_BETTER_PERFORMANCE:
> +		return "BALANCED";
> +	case TA_BEST_BATTERY:
> +		return "POWER_SAVER";
> +	default:
> +		return "Unknown TA Slider State";
> +	}
> +}
> +
> +void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
> +{
> +	dev_dbg(dev->dev, "==== TA inputs START ====\n");
> +	dev_dbg(dev->dev, "Slider State : %s\n", ta_slider_as_str(in->ev_info.power_slider));
> +	dev_dbg(dev->dev, "Power Source : %s\n", source_as_str(in->ev_info.power_source));
> +	dev_dbg(dev->dev, "Battery Percentage : %u\n", in->ev_info.bat_percentage);
> +	dev_dbg(dev->dev, "Designed Battery Capacity : %u\n", in->ev_info.bat_design);
> +	dev_dbg(dev->dev, "Fully Charged Capacity : %u\n", in->ev_info.full_charge_capacity);
> +	dev_dbg(dev->dev, "Drain Rate : %d\n", in->ev_info.drain_rate);
> +	dev_dbg(dev->dev, "Socket Power : %u\n", in->ev_info.socket_power);
> +	dev_dbg(dev->dev, "Skin Temperature : %u\n", in->ev_info.skin_temperature);
> +	dev_dbg(dev->dev, "Avg C0 Residency : %u\n", in->ev_info.avg_c0residency);
> +	dev_dbg(dev->dev, "Max C0 Residency : %u\n", in->ev_info.max_c0residency);
> +	dev_dbg(dev->dev, "GFX Busy : %u\n", in->ev_info.gfx_busy);
> +	dev_dbg(dev->dev, "Connected Display Count : %u\n", in->ev_info.monitor_count);
> +	dev_dbg(dev->dev, "LID State : %s\n", in->ev_info.lid_state ? "Close" : "Open");
> +	dev_dbg(dev->dev, "==== TA inputs END ====\n");
> +}
> +#else
> +void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in) {}
> +#endif
> +
>  static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>  {
>  	u16 max, avg = 0;
> diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
> index a70e67749be3..13e36b52dfe8 100644
> --- a/drivers/platform/x86/amd/pmf/sps.c
> +++ b/drivers/platform/x86/amd/pmf/sps.c
> @@ -27,7 +27,7 @@ static const char *slider_as_str(unsigned int state)
>  	}
>  }
>  
> -static const char *source_as_str(unsigned int state)
> +const char *source_as_str(unsigned int state)
>  {
>  	switch (state) {
>  	case POWER_SOURCE_AC:
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 961011530c1b..b0711b2f8c8f 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -187,6 +187,7 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>  	}
>  
>  	if (ta_sm->pmf_result == TA_PMF_TYPE_SUCCESS && out->actions_count) {
> +		amd_pmf_dump_ta_inputs(dev, in);
>  		dev_dbg(dev->dev, "action count:%u result:%x\n", out->actions_count,
>  			ta_sm->pmf_result);
>  		amd_pmf_apply_policies(dev, out);
> 

