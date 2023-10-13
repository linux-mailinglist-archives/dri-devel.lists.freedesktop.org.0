Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 450A27C855F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 14:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F5E10E0E7;
	Fri, 13 Oct 2023 12:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC0B10E5EF;
 Fri, 13 Oct 2023 12:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697198906; x=1728734906;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=OSw6l43ir41hu+uAu44wskdYdJS8SB0MXqT78SOJiMM=;
 b=lFzTNPDTpmBOjPUKgiXmiNfEyLFy6DusivzO5AX4Cbu6shaIWkhlldc3
 TQlUMY1rGwidq6va99BfmgXhlsEsYFzd1gr919bp38X55a52J9V5ELQyR
 KzbiRyof3F4D+aGdIPSnIK2U8WEPumfMRt4k8f8K9UrR5whwepoB/ovML
 /nrlYvTxFBgWz+FMb6EMIkZ5cA1o+6cbxAQBQ8rO82SltvKh4J5pd6hQM
 byZMPcCYzW560jXVBfDc3jmhRlsMHZYpRpSsqWP1BlmWNETwmS6xFKmh6
 QUGC/lz3oH9JX7sHkyt0opvsKo8vGKqbXVeA2C5kJV6zKWn8p6N4tKCYX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="449358150"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="449358150"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 05:08:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="784133205"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="784133205"
Received: from ttmerile-mobl1.ger.corp.intel.com ([10.249.37.202])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 05:08:22 -0700
Date: Fri, 13 Oct 2023 15:08:19 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH v3 06/16] platform/x86/amd/pmf: Add support to get inputs
 from other subsystems
In-Reply-To: <20231010125917.138225-7-Shyam-sundar.S-k@amd.com>
Message-ID: <6bb2eab3-f683-f7cf-1c49-391e20c6e1ca@linux.intel.com>
References: <20231010125917.138225-1-Shyam-sundar.S-k@amd.com>
 <20231010125917.138225-7-Shyam-sundar.S-k@amd.com>
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

On Tue, 10 Oct 2023, Shyam Sundar S K wrote:

> PMF driver sends changing inputs from each subystem to TA for evaluating
> the conditions in the policy binary.
> 
> Add initial support of plumbing in the PMF driver for Smart PC to get
> information from other subsystems in the kernel.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/Makefile |   2 +-
>  drivers/platform/x86/amd/pmf/pmf.h    |  18 ++++
>  drivers/platform/x86/amd/pmf/spc.c    | 119 ++++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/tee-if.c |   3 +
>  4 files changed, 141 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/platform/x86/amd/pmf/spc.c
> 
> diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
> index d2746ee7369f..6b26e48ce8ad 100644
> --- a/drivers/platform/x86/amd/pmf/Makefile
> +++ b/drivers/platform/x86/amd/pmf/Makefile
> @@ -7,4 +7,4 @@
>  obj-$(CONFIG_AMD_PMF) += amd-pmf.o
>  amd-pmf-objs := core.o acpi.o sps.o \
>  		auto-mode.o cnqf.o \
> -		tee-if.o
> +		tee-if.o spc.o
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 51c0e17f7720..88ee3c705913 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -150,6 +150,21 @@ struct smu_pmf_metrics {
>  	u16 infra_gfx_maxfreq; /* in MHz */
>  	u16 skin_temp; /* in centi-Celsius */
>  	u16 device_state;
> +	u16 curtemp; /* in centi-Celsius */
> +	u16 filter_alpha_value;
> +	u16 avg_gfx_clkfrequency;
> +	u16 avg_fclk_frequency;
> +	u16 avg_gfx_activity;
> +	u16 avg_socclk_frequency;
> +	u16 avg_vclk_frequency;
> +	u16 avg_vcn_activity;
> +	u16 avg_dram_reads;
> +	u16 avg_dram_writes;
> +	u16 avg_socket_power;
> +	u16 avg_core_power[2];
> +	u16 avg_core_c0residency[16];
> +	u16 spare1;
> +	u32 metrics_counter;
>  } __packed;
>  
>  enum amd_stt_skin_temp {
> @@ -596,4 +611,7 @@ extern const struct attribute_group cnqf_feature_attribute_group;
>  int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev);
>  void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev);
>  int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev);
> +
> +/* Smart PC - TA interfaces */
> +void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
>  #endif /* PMF_H */
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> new file mode 100644
> index 000000000000..91a7f1da911c
> --- /dev/null
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -0,0 +1,119 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * AMD Platform Management Framework Driver - Smart PC Capabilities
> + *
> + * Copyright (c) 2023, Advanced Micro Devices, Inc.
> + * All Rights Reserved.
> + *
> + * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> + *          Patil Rajesh Reddy <Patil.Reddy@amd.com>
> + */
> +
> +#include <acpi/button.h>
> +#include <linux/power_supply.h>
> +#include <linux/units.h>
> +#include "pmf.h"
> +
> +static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
> +{
> +	u16 max, avg = 0;
> +	int i;
> +
> +	memset(dev->buf, 0, sizeof(dev->m_table));
> +	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
> +	memcpy(&dev->m_table, dev->buf, sizeof(dev->m_table));
> +
> +	in->ev_info.socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
> +	in->ev_info.skin_temperature = dev->m_table.skin_temp;
> +
> +	/* Get the avg and max C0 residency of all the cores */
> +	max = dev->m_table.avg_core_c0residency[0];
> +	for (i = 0; i < ARRAY_SIZE(dev->m_table.avg_core_c0residency); i++) {
> +		avg += dev->m_table.avg_core_c0residency[i];
> +		if (dev->m_table.avg_core_c0residency[i] > max)
> +			max = dev->m_table.avg_core_c0residency[i];
> +	}
> +
> +	in->ev_info.avg_c0residency = avg / ARRAY_SIZE(dev->m_table.avg_core_c0residency);

Not saying the current is wrong and the difference might be 
insignificantly small... But you might want to consider using 
DIV_ROUND_CLOSEST() instead of the truncating divide (I'm not sure which 
is the best here so I leave it up to you).

> +	in->ev_info.max_c0residency = max;
> +	in->ev_info.gfx_busy = dev->m_table.avg_gfx_activity;
> +}
> +
> +static const char * const pmf_battery_supply_name[] = {
> +	"BATT",
> +	"BAT0",
> +};
> +
> +static int amd_pmf_get_battery_prop(enum power_supply_property prop)
> +{
> +	union power_supply_propval value;
> +	struct power_supply *psy;
> +	int i, ret = -EINVAL;

Unnecessary to initialize ret here.

> +	for (i = 0; i < ARRAY_SIZE(pmf_battery_supply_name); i++) {
> +		psy = power_supply_get_by_name(pmf_battery_supply_name[i]);
> +		if (!psy)
> +			continue;
> +
> +		ret = power_supply_get_property(psy, prop, &value);
> +		if (ret) {
> +			power_supply_put(psy);
> +			return ret;
> +		}
> +	}
> +
> +	return value.intval;
> +}
> +
> +static int amd_pmf_get_battery_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
> +{
> +	int val;
> +
> +	val = amd_pmf_get_battery_prop(POWER_SUPPLY_PROP_PRESENT);
> +	if (val != 1)
> +		return -EINVAL;

If amd_pmf_get_battery_prop() returns an error code, it would be better to 
pass that on instead of inventing another code. It's probably better to 
split the if into two checks to cover both cases.

For val >= 0 but not 1, -ENODEV might be better justified than -EINVAL 
because it doesn't look like input parameters are invalid here.

-- 
 i.


> +	in->ev_info.bat_percentage = amd_pmf_get_battery_prop(POWER_SUPPLY_PROP_CAPACITY);
> +	/* all values in mWh metrics */
> +	in->ev_info.bat_design = amd_pmf_get_battery_prop(POWER_SUPPLY_PROP_ENERGY_FULL_DESIGN) /
> +		MILLIWATT_PER_WATT;
> +	in->ev_info.full_charge_capacity = amd_pmf_get_battery_prop(POWER_SUPPLY_PROP_ENERGY_FULL) /
> +		MILLIWATT_PER_WATT;
> +	in->ev_info.drain_rate = amd_pmf_get_battery_prop(POWER_SUPPLY_PROP_POWER_NOW) /
> +		MILLIWATT_PER_WATT;
> +
> +	return 0;
> +}
> +
> +static int amd_pmf_get_slider_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
> +{
> +	int val;
> +
> +	switch (dev->current_profile) {
> +	case PLATFORM_PROFILE_PERFORMANCE:
> +		val = TA_BEST_PERFORMANCE;
> +		break;
> +	case PLATFORM_PROFILE_BALANCED:
> +		val = TA_BETTER_PERFORMANCE;
> +		break;
> +	case PLATFORM_PROFILE_LOW_POWER:
> +		val = TA_BEST_BATTERY;
> +		break;
> +	default:
> +		dev_err(dev->dev, "Unknown Platform Profile.\n");
> +		return -EOPNOTSUPP;
> +	}
> +	in->ev_info.power_slider = val;
> +
> +	return 0;
> +}
> +
> +void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
> +{
> +	/* TA side lid open is 1 and close is 0, hence the ! here */
> +	in->ev_info.lid_state = !acpi_lid_open();
> +	in->ev_info.power_source = amd_pmf_get_power_source();
> +	amd_pmf_get_smu_info(dev, in);
> +	amd_pmf_get_battery_info(dev, in);
> +	amd_pmf_get_slider_info(dev, in);
> +}
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 38f02676261d..277103e4346d 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -113,6 +113,7 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>  {
>  	struct ta_pmf_shared_memory *ta_sm = NULL;
>  	struct ta_pmf_enact_result *out = NULL;
> +	struct ta_pmf_enact_table *in = NULL;
>  	struct tee_param param[MAX_TEE_PARAM];
>  	struct tee_ioctl_invoke_arg arg;
>  	int ret = 0;
> @@ -123,11 +124,13 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>  	memset(dev->shbuf, 0, dev->policy_sz);
>  	ta_sm = dev->shbuf;
>  	out = &ta_sm->pmf_output.policy_apply_table;
> +	in = &ta_sm->pmf_input.enact_table;
>  
>  	memset(ta_sm, 0, sizeof(*ta_sm));
>  	ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES;
>  	ta_sm->if_version = PMF_TA_IF_VERSION_MAJOR;
>  
> +	amd_pmf_populate_ta_inputs(dev, in);
>  	amd_pmf_prepare_args(dev, TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES, &arg, param);
>  
>  	ret = tee_client_invoke_func(dev->tee_ctx, &arg, param);
> 
