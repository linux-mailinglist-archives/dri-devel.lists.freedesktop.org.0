Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D747B03F5
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 14:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 330B210E043;
	Wed, 27 Sep 2023 12:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2668410E4FD;
 Wed, 27 Sep 2023 12:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695817562; x=1727353562;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=w7Z7GAGvbkE0au25RJJjN4TJdomnd2iP3p/t+pD5fTU=;
 b=THU3rD4igytA4t9c8ZOEn8LYvTd3Zm2EH/RQhlkE45o+tnU5bn5ww4fU
 DgWIr33TkIYBlD5+2f6Hlt7ETpgLByc+rsD16BA24zp4fQo15WWctQyTF
 HknaKqcTVf4ZjyGkvGfN7RsCEX3VSMFQHIiLoHkpADq4dGM7MWD3JSrRF
 H8fZgLlqpIe3I+6+pbkhl1TF8mTv2F1wGsBpfDiLYOnBAKqzgqJJzH/nr
 xiZUMleNxfZD3/u0+UgbaAWf6YvAzhMOm7R8TXgx+pnj/+oH8JdaxsXei
 oCQKZl1fMpFjn8VMHnRTDVDuf4FZkwoSBIHgT1W0K6AhniUQqoxvp6P8r g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="381712699"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="381712699"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 05:26:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="778523583"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="778523583"
Received: from clkuhl-mobl.amr.corp.intel.com (HELO
 idecesar-mobl.ger.corp.intel.com) ([10.252.53.225])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 05:25:54 -0700
Date: Wed, 27 Sep 2023 15:25:47 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH 09/15] platform/x86/amd/pmf: Add facility to dump TA inputs
In-Reply-To: <20230922175056.244940-10-Shyam-sundar.S-k@amd.com>
Message-ID: <3c1893f2-cf72-c423-5de8-1423b2113a9e@linux.intel.com>
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
 <20230922175056.244940-10-Shyam-sundar.S-k@amd.com>
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
 markgross@kernel.org, hdegoede@redhat.com, benjamin.tissoires@redhat.com,
 mario.limonciello@amd.com, linux-input@vger.kernel.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 Sep 2023, Shyam Sundar S K wrote:

> PMF driver sends constant inputs to TA which its gets via the other
> subsystems in the kernel. To debug certain TA issues knowing what inputs
> being sent to TA becomes critical. Add debug facility to the driver which
> can isolate Smart PC and TA related issues.
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
> index c5334f1177a4..61a0f3225b62 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -592,6 +592,7 @@ int apmf_get_static_slider_granular(struct amd_pmf_dev *pdev,
>  bool is_pprof_balanced(struct amd_pmf_dev *pmf);
>  int amd_pmf_power_slider_update_event(struct amd_pmf_dev *dev);
>  
> +const char *source_as_str(unsigned int state);
>  
>  int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx);
>  int amd_pmf_set_sps_power_limits(struct amd_pmf_dev *pmf);
> @@ -622,4 +623,6 @@ int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev);
>  
>  /* Smart PC - TA interfaces */
>  void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
> +void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
> +
>  #endif /* PMF_H */
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index 08159cd5f853..5c6745f56ed1 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -13,6 +13,43 @@
>  #include <linux/power_supply.h>
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
> +	dev_dbg(dev->dev, "Battery Percentage : %d\n", in->ev_info.bat_percentage);
> +	dev_dbg(dev->dev, "Designed Battery Capacity : %d\n", in->ev_info.bat_design);
> +	dev_dbg(dev->dev, "Fully Charged Capacity : %d\n", in->ev_info.full_charge_capacity);
> +	dev_dbg(dev->dev, "Drain Rate : %d\n", in->ev_info.drain_rate);
> +	dev_dbg(dev->dev, "Socket Power : %d\n", in->ev_info.socket_power);
> +	dev_dbg(dev->dev, "Skin Temperature : %d\n", in->ev_info.skin_temperature);
> +	dev_dbg(dev->dev, "Avg C0 Residency : %d\n", in->ev_info.avg_c0residency);
> +	dev_dbg(dev->dev, "Max C0 Residency : %d\n", in->ev_info.max_c0residency);
> +	dev_dbg(dev->dev, "GFX Busy : %d\n", in->ev_info.gfx_busy);
> +	dev_dbg(dev->dev, "Connected Display Count : %d\n", in->ev_info.monitor_count);
> +	dev_dbg(dev->dev, "LID State : %s\n", in->ev_info.lid_state ? "Close" : "Open");
> +	dev_dbg(dev->dev, "==== TA inputs END ====\n");

Again, the printf format specifiers are wrong, shouldn't the compiler warn 
about them?

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
> index 1629856c20b4..4844782d93c7 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -186,6 +186,7 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>  	}
>  
>  	if (ta_sm->pmf_result == TA_PMF_TYPE__SUCCESS && out->actions_count) {
> +		amd_pmf_dump_ta_inputs(dev, in);
>  		dev_dbg(dev->dev, "action count:%d result:%x\n", out->actions_count,
>  			ta_sm->pmf_result);
>  		amd_pmf_apply_policies(dev, out);
> 

-- 
 i.

