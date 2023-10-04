Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC017B7ED4
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 14:14:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB8CF10E116;
	Wed,  4 Oct 2023 12:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB6B510E116;
 Wed,  4 Oct 2023 12:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696421662; x=1727957662;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=hKl+4lMfJCeBDRazjZ9yVR8Zl1pBpZAy/hnGuwCs3+I=;
 b=Jhy5osqhzMs3EQcjT+/XhB6HtAQ6sX3FE3yjGdKd0071Y1sJXvPhNgFw
 3s3Wk6xvp7vYG1P3prwbkN7GzTE2ejb3Zs+4cAPqO5/EUMCfsLp3YDKmM
 u2YcdMSaVZPK7a24y5N5xJYPT6SMBWh4GPAyFd6w/U6bd37vq7VuP15vC
 rC5nZw2EZdDHg/gGjIArzBZNhDFVR3hprTy9f5PI92J5S63MqWFWEGTb/
 DW73fbaOMynlgJ7d3xq/N0P6aTlZ+jM7AjIlYawvkUtI1K2Rt6n3o5BBk
 3XAa73ALnYMwJL6MT859L71PHD+XLQ/5v7uDVQ+GlmW1Bmyj3kYedr4Rz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="447325599"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="447325599"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 05:14:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="754895877"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="754895877"
Received: from cyrillet-mobl.ger.corp.intel.com ([10.252.55.203])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 05:14:17 -0700
Date: Wed, 4 Oct 2023 15:14:15 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH v2 06/16] platform/x86/amd/pmf: Add support to get inputs
 from other subsystems
In-Reply-To: <20230930083715.2050863-7-Shyam-sundar.S-k@amd.com>
Message-ID: <2eb2b3e5-4849-10ec-1c1b-66d2f0ba561@linux.intel.com>
References: <20230930083715.2050863-1-Shyam-sundar.S-k@amd.com>
 <20230930083715.2050863-7-Shyam-sundar.S-k@amd.com>
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
> index 6f4b6f4ecee4..60b11455dadf 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -149,6 +149,21 @@ struct smu_pmf_metrics {
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
> @@ -595,4 +610,7 @@ extern const struct attribute_group cnqf_feature_attribute_group;
>  int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev);
>  void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev);
>  int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev);
> +
> +/* Smart PC - TA interfaces */
> +void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
>  #endif /* PMF_H */
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> new file mode 100644
> index 000000000000..3113bde051d9
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
> +	/* get the avg C0 residency of all the cores */
> +	for (i = 0; i < ARRAY_SIZE(dev->m_table.avg_core_c0residency); i++)
> +		avg += dev->m_table.avg_core_c0residency[i];
> +
> +	/* get the max C0 residency of all the cores */
> +	max = dev->m_table.avg_core_c0residency[0];
> +	for (i = 1; i < ARRAY_SIZE(dev->m_table.avg_core_c0residency); i++) {
> +		if (dev->m_table.avg_core_c0residency[i] > max)
> +			max = dev->m_table.avg_core_c0residency[i];
> +	}

My comments weren't either answered adequately or changes made here.
Please check the v1 comments. I hope it's not because you feel hurry to 
get the next version out...

I'm still unsure if the u16 thing can overflow because I don't know what's 
the max value for avg_core_c0residency[i].

> +
> +	in->ev_info.avg_c0residency = avg / ARRAY_SIZE(dev->m_table.avg_core_c0residency);
> +	in->ev_info.max_c0residency = max;
> +	in->ev_info.gfx_busy = dev->m_table.avg_gfx_activity;
> +}
> +
> +static const char * const pmf_battery_supply_name[] = {
> +	"BATT",
> +	"BAT0",
> +};
> +
> +static int get_battery_prop(enum power_supply_property prop)
> +{
> +	union power_supply_propval value;
> +	struct power_supply *psy;
> +	int i, ret = -EINVAL;
> +
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
> +	val = get_battery_prop(POWER_SUPPLY_PROP_PRESENT);
> +	if (val != 1)
> +		return -EINVAL;
> +
> +	in->ev_info.bat_percentage = get_battery_prop(POWER_SUPPLY_PROP_CAPACITY);
> +	/* all values in mWh metrics */
> +	in->ev_info.bat_design = get_battery_prop(POWER_SUPPLY_PROP_ENERGY_FULL_DESIGN) / MILLI;
> +	in->ev_info.full_charge_capacity = get_battery_prop(POWER_SUPPLY_PROP_ENERGY_FULL) / MILLI;
> +	in->ev_info.drain_rate = get_battery_prop(POWER_SUPPLY_PROP_POWER_NOW) / MILLI;

There are defines specifically for watts so you should use them rather 
than generic MILLI.


-- 
 i.

