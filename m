Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C08A879976
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 17:58:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BAEE10ED64;
	Tue, 12 Mar 2024 16:58:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dW6n3gpm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D55810ED64;
 Tue, 12 Mar 2024 16:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710262711; x=1741798711;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bJMsIS1MTt4EdMf6Q1pnfp6qPVJWV9CkpoG7ADXjO3A=;
 b=dW6n3gpm+kF4ZMJZ1y/5ckR2SG3y4tn1sceFtLMPGT418V5pJylUjLh1
 OpoFgdX/bGzRko74QrG1TUzRxaAIFTpIlNx7xQsUjucFs9lnSfFOBuGNk
 ST+sDXIomdSHv5amu2OwEwqeSR/eYLBlyvXm6x2Gu7ROJeL1QM2t4eYF1
 569oLvxDIOXgsjD4/8llLzkvHFksM4OHC10oaEqSUdb0wsTtdzA2VlCsn
 ac0I7vsz2AzO+wBt8+eJcQ8gpUpW7PXtFGpBSKfHjK5r8fe1SrESsMnaV
 xlcC7vb47ywQgNi12oePSVkIbb6fo+jOYwP3eJ5ehjFOGp2a6AqhMwN8e Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="8799783"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="8799783"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 09:58:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="49044216"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2024 09:58:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 09:58:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Mar 2024 09:58:29 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 09:58:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4cOlHtnSK8o4yO6IwRKkN4LqRTIPgEc7nTKTPbG+Mz0duZGVHKYJkh76gQH2QiT3cSo3O0R1FDjpW5kKPhZHQTnrcrdeJRB7Aj6yG6fjgEvvSbZ/Hh26GhNdMgxd8PCfK/dftrdrOXeWsc9Jk/fpBRd8WD7pAyaFKEpu+khPmJfyGb8xjOaaSrVK/waXPcevO3KWIeY79S2JY1SemcfyTlSMUv+C2F75fivARyZcl41V7tGxi94hSUQrsSpjjvABU+mdWNNy2yt9jhnUP6Q2hy2tfapCyBsIZLVPPCK+2pZrsrgikRU1GJ4gyx9jzhFvXQj8LEysNkpcWxMzqoi6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXJxxfJqc2qoT+S+UVL401Zkua8tnwm1977nD0u+Xfg=;
 b=Ew7SOS70zqsaCHzk7QbQd1LqtNwDpb8sBbiDL1jTtcu1z7TBrn0357gQsmzxce7CfYLC9Iw2oVgtqTaHmaOHKW8yp14MSrO/7slol5Tub1CdCCgy3k6w0x0mKyDwQ+2UJu6CEEqpTphoKt4ulY2Pm14x7EGUPXGXUr0n25xaGUSaYqQG+7+UzXvYmikzv/Kx+Rj1X9z+4uiQQ1kaKxeoak1d07/FXby64pBcLjB4NGbtXb1I8CLBbK0vIWFH4hXg+PFcA8GzqSUE+rtT3TXudgzinN38Lpx333BAc5XsVXxvhL4tzUECReiQ2SeAiHPiN4u8hveYQ+USAZEpcwI1Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB8227.namprd11.prod.outlook.com (2603:10b6:8:184::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Tue, 12 Mar
 2024 16:58:28 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7386.016; Tue, 12 Mar 2024
 16:58:28 +0000
Date: Tue, 12 Mar 2024 09:58:25 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, John Harrison <John.C.Harrison@intel.com>, 
 <stable@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Tvrtko Ursulin
 <tursulin@ursulin.net>
Subject: Re: [PATCH v5 1/4] drm/i915/gt: Disable HW load balancing for CCS
Message-ID: <20240312165825.GK718896@mdroper-desk1.amr.corp.intel.com>
References: <20240308202223.406384-1-andi.shyti@linux.intel.com>
 <20240308202223.406384-2-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240308202223.406384-2-andi.shyti@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0202.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::27) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB8227:EE_
X-MS-Office365-Filtering-Correlation-Id: 91bd46b8-f373-4357-a71a-08dc42b5a36a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c0+msbBlMPYFVFUnzQFuC8aXoMlB6yJIEcU4AIOTpT7yfCxFZran6RE8xoEpQZSlbvWkKOu4zGNQ7UrY5QHg6Kn7NmrhRP5WG5F8acXLG5LQKYIWr1dBTBmyUwESyeSbnKTy0F6EpQIBE7fugKiSxs31owrwEnupEYmnme0VDP6fxBDRXdN8ugwzPiJO3Tl+Vuff0U5mPRwr51Dupul/8yU4XJJ8Dhrh6GbNWYiOMaHCbkYTUJN2drROdaUdES88wSA47vXS8Crrr+Orv1/WiluHb0Mbk7PuBD1E0P21XzkFBfcRybeSVbp4V1ELiayMEKFtv45mE8Nrh1msCCP9TIeM8vx6ZYEdqlEpaqvDFGxlAPTP7hOjwPA+OokqWXuzQL1Nc9MpHGnt4alnx0Z9EW61GdLkzLoHqFDE4nIB9YzJbbCWMWIrG49qcpSonsexqpNDBfXn4ghKL5OAtISNsESzBMuODngPfSZBYnDddxBLjUCc3hCow37o48qcEDOzyusCePGpcVy53J0VsCbPu3JM++uhqSUAMoDy77QQi1ymo5YCwDLLz2gzelK7NnVxLAOBiQI+pPkmHWcjGUaeaC10mz1IP+E24BH3OTJtZBZzmXnjCutSsoNXOniglAINqfOzC0XeywyUy7hHHWjkGsp9EZEFQd9mmq0QpH/NLOg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?etfEhQC20+gjpdsMt+3CHWIt1vRuEZGyoX3vLeuPjFL2klb/FnlEQn8/SQAQ?=
 =?us-ascii?Q?AVFj9Bo6CYCComT9AKZNWEuxHRoTzC3tPj7Efx2vZmgxdHOz6cZn/3aAeiUU?=
 =?us-ascii?Q?PuSTOjwZbL1A7QY5CepFtZuVO+fICDyT7Ym74OlMBJkey5mJe8ysH56uWw4P?=
 =?us-ascii?Q?O+s709bYHOr7wphA+peggYQctp+6OhxK/vw6qF2FWvX4QJAymJNyRWhR2J37?=
 =?us-ascii?Q?NH/qbFzvM0S3jVPF869sk/ZI+tecr+911r55YHrB0eYUKD78O9Bs8CghR3T2?=
 =?us-ascii?Q?/7AsxfWVXdbyuIZoeoRCc63yrPUw/f5DK5A1i9aUhFJJGRNwHK/WfVGnU+qw?=
 =?us-ascii?Q?UsTQxj3xAvfOoh7XDw5LflLu1nUyVEMqAcuGofMXE4oAlz1vukkls7Rp8JnE?=
 =?us-ascii?Q?ov12KpVE4hn/+zXkZhisDL32Q7Dv3r4T3gECovWPlUU9hCPCIJyng3VmrsjZ?=
 =?us-ascii?Q?ZWmZaw/pzq/RKUgYR3Vg3AQ6YBcA/qqcCMYqa4rEU9nXpULPg5ixCS642Tbd?=
 =?us-ascii?Q?xKIEFsZTQVB0V3R5qjOJomuv0ZZvSgdKy/7HPLxnyVAl4JSCcxKOOlpK/ydr?=
 =?us-ascii?Q?lGRqs6LcmrKMy+O3CgAWwciUkOfalQH1WXMP1zhpw2fFOUcAaeHO6VciUGS7?=
 =?us-ascii?Q?3CZbNg6hW34YM5DOZM77bL0uDDnWNwNzUcf4m3iF6OhylUQosh+uj2Udwxmj?=
 =?us-ascii?Q?RcTmf/lpwnq7JbLv7CJ5SYefxLY4OFywT8f7mJl5vCvmaINnQU6I4pAweNZe?=
 =?us-ascii?Q?T8UNys2j7DDrCBlmaFfamq6u2AOq8X06dGsUt4qDGYBLpO5mJU29G7o27eni?=
 =?us-ascii?Q?yat+4HZ5+OsC11Gsar9SjcLD1o/lvZ/RDxCVgqxkjkrs3X6rzmmspYVxrFx9?=
 =?us-ascii?Q?ffDIkHAgi1m492vcKwziGXzMTwiYPoZN+EJOztZiQI+EMU/zCsvahFhIFd92?=
 =?us-ascii?Q?aU/fmEdM9Y8zfrwTdHNJOLeNBJrvbNQ1vDTr38vydhe9Z1PG42tz3lsS4VKx?=
 =?us-ascii?Q?pA2Mt3iD1kx70N8ADl1vcRQ4BIBjSNlvQ0dTdAMiFriuV9T8JaSDCFZRtwiO?=
 =?us-ascii?Q?ufoQPRD3ahtaBeqYpRtUlJc8i1YraWPcdDKzl0ChdBURBPL4TwH0aUnj9XhB?=
 =?us-ascii?Q?CGuh6cOTOfk9EvKlOt4nihWHr4/J/pLKFU/5RYRD0zpYmRD0IXvzVDD1No3E?=
 =?us-ascii?Q?OUSSEfgrstYQNjuK9IXDem/umNKb7ZbRNQK2wsumAl/ZCUkTMCoi2DBtXy2l?=
 =?us-ascii?Q?CPONm0dwDUpoBFEsq8yZ7ameKgR1Ewzn/aMfLmh9IsUUsqTxmv66bWkbqKdy?=
 =?us-ascii?Q?MpqR89KTyEu+vBa5QdoW9gOszGjtCWiRCD4hELCeG1CJKs6RDuC5C8BuuHxc?=
 =?us-ascii?Q?Wl1TXypQrVGvtDNS6wsq5Xkwd20rrbQBIRj3Lmsk/PS/KREyPWRHLJu3LEL7?=
 =?us-ascii?Q?mjHfxkh0uQL3oGdf/yHOGsPYJzXmyM1HB8i1G6vkNWyKqVR8X/qH64J5P258?=
 =?us-ascii?Q?mylKXI8V9VD8eVmxvNwFOtNWzdDy5TU1trTxKlLf6Xw72d05xJQUg7TuULb5?=
 =?us-ascii?Q?RgUD/aOkoABUvnQhUvptThm6k5CcQjE88un3woJnR27QKUftbT3jh3rVqo+r?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91bd46b8-f373-4357-a71a-08dc42b5a36a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 16:58:28.0454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RawEkkMGnoOrnFaVziUXP1K0nSd8Xo6++2ZWZA8ZEPfJhiB8lMWg5nsfb/MeRFvxmHH1tOhGLH90j7VPFwt+hZwYgycY077slVGdLYImjeY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8227
X-OriginatorOrg: intel.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 08, 2024 at 09:22:16PM +0100, Andi Shyti wrote:
> The hardware should not dynamically balance the load between CCS
> engines. Wa_14019159160 recommends disabling it across all
> platforms.
> 
> Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: <stable@vger.kernel.org> # v6.2+
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  1 +
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 23 +++++++++++++++++++--
>  2 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 50962cfd1353..cf709f6c05ae 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1478,6 +1478,7 @@
>  
>  #define GEN12_RCU_MODE				_MMIO(0x14800)
>  #define   GEN12_RCU_MODE_CCS_ENABLE		REG_BIT(0)
> +#define   XEHP_RCU_MODE_FIXED_SLICE_CCS_MODE	REG_BIT(1)

Nitpick: we usually order register bits in descending order.  Aside from
that,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

although I still hope our architects will push through a formal
documentation update for this.


Matt

>  
>  #define CHV_FUSE_GT				_MMIO(VLV_GUNIT_BASE + 0x2168)
>  #define   CHV_FGT_DISABLE_SS0			(1 << 10)
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 25413809b9dc..4865eb5ca9c9 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -51,7 +51,8 @@
>   *   registers belonging to BCS, VCS or VECS should be implemented in
>   *   xcs_engine_wa_init(). Workarounds for registers not belonging to a specific
>   *   engine's MMIO range but that are part of of the common RCS/CCS reset domain
> - *   should be implemented in general_render_compute_wa_init().
> + *   should be implemented in general_render_compute_wa_init(). The settings
> + *   about the CCS load balancing should be added in ccs_engine_wa_mode().
>   *
>   * - GT workarounds: the list of these WAs is applied whenever these registers
>   *   revert to their default values: on GPU reset, suspend/resume [1]_, etc.
> @@ -2854,6 +2855,22 @@ add_render_compute_tuning_settings(struct intel_gt *gt,
>  		wa_write_clr(wal, GEN8_GARBCNTL, GEN12_BUS_HASH_CTL_BIT_EXC);
>  }
>  
> +static void ccs_engine_wa_mode(struct intel_engine_cs *engine, struct i915_wa_list *wal)
> +{
> +	struct intel_gt *gt = engine->gt;
> +
> +	if (!IS_DG2(gt->i915))
> +		return;
> +
> +	/*
> +	 * Wa_14019159160: This workaround, along with others, leads to
> +	 * significant challenges in utilizing load balancing among the
> +	 * CCS slices. Consequently, an architectural decision has been
> +	 * made to completely disable automatic CCS load balancing.
> +	 */
> +	wa_masked_en(wal, GEN12_RCU_MODE, XEHP_RCU_MODE_FIXED_SLICE_CCS_MODE);
> +}
> +
>  /*
>   * The workarounds in this function apply to shared registers in
>   * the general render reset domain that aren't tied to a
> @@ -3004,8 +3021,10 @@ engine_init_workarounds(struct intel_engine_cs *engine, struct i915_wa_list *wal
>  	 * to a single RCS/CCS engine's workaround list since
>  	 * they're reset as part of the general render domain reset.
>  	 */
> -	if (engine->flags & I915_ENGINE_FIRST_RENDER_COMPUTE)
> +	if (engine->flags & I915_ENGINE_FIRST_RENDER_COMPUTE) {
>  		general_render_compute_wa_init(engine, wal);
> +		ccs_engine_wa_mode(engine, wal);
> +	}
>  
>  	if (engine->class == COMPUTE_CLASS)
>  		ccs_engine_wa_init(engine, wal);
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
