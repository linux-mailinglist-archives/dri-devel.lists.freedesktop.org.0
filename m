Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F173385B2FA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 07:37:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A14E610E155;
	Tue, 20 Feb 2024 06:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d2rB+Su7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28BE610E155;
 Tue, 20 Feb 2024 06:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708411066; x=1739947066;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tno3uIEqXcObpyJr9ZxXsAf4kumb2uCUdJ0N4oWvSNU=;
 b=d2rB+Su7akUAtu5imdXVi/iLXoqHVnWZGBWOHS2q+DNlwhupSccjfePS
 7GY78rSvkGR1+uPc97yUe+nZ6PiIYsYuqj06zh2dOvMYKcnB7jN55krLK
 gwCLO3iDta+tblM4Ob5eRLRX8QG6qQu/dgWvPEmInIaxcZbd5tAR8QnsR
 lV3QPziFR4EjDWfRcMY9E+vlnJrKL88CpH/+uze7nrAMQpkN15iW846hw
 BjSl+rFH2JmJVDW5TmgAh1OU9slajhHNg//Fh296W/WcKxhhmL1GtPqec
 C+88SlMYXYnLwCK4X8eWx5lNqPoVWMZ/09ag4PTpw2UIlWwhQAOvU6dvz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2376202"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="2376202"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 22:37:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="9297988"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Feb 2024 22:37:46 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 22:37:45 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 19 Feb 2024 22:37:45 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 19 Feb 2024 22:37:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PYz+gi2RkbrsR+hebgJINQZWI1LkYlf7jgP690cAHQgW/n7JiNFA/RgQI4mMymSlW0ci4X7pii/IZ1JRAJS9SAh42/uY6dulw4RP/FNnBPV5TJrmd+A/6swbHdszPmdpQ2DVveQiyPpyH8EknIEyeP5DSNpVgrtvR/7gKc+RbNeLBNclDDCYsRDo97U8gbZjyqYxqEu2NcrKSRH4MGyxHFgwflR2rmI0/0LgE4kXVwx1nZ7KgC6XVxHCR0FbsptYlHtiq0ex11R3r7rnqaW+fAWzfeUyC9MZRd8vmFvPzeGcEx5uMCztXNhDzz6NvRvAYJDpZTgZ4hQEeI4rHWS8Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCTK3P/rerIeP1DNj0exmUex8fHFSezyL75p1rH855U=;
 b=cxic4EQOG4a7LJ0my+kiz3onpi66p5Py4V8ftBxujhxa2FJQvcqpFj2sP6/Ie8rhS+5k2EAUDoZCOEi0SfEBctO9bWXb9oA3qWSOKG5X0PeSRbPKWc64aBEd8Z3b1tFK8J5lIA/ekazx6F7F7FwHALXlOoAQllfAXdw9ScRYJHPjx6UQ4ooM0orEr4BeMhbclx0EnGDWIoN4NzZG0Vjb/WkTCQJEPWY18bcCjTz8Q/0t6mhnOA9Awzfq3NAaApc4si9PcexrKGcKaB6o59w1qaxgVeLWSuFMrfMWK3xY7BoLKv1qQ1ypLIjJPT3VCsV7ilw5C1+cWCfhJ22iR7SQNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by MN6PR11MB8219.namprd11.prod.outlook.com (2603:10b6:208:471::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Tue, 20 Feb
 2024 06:37:43 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2%7]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 06:37:43 +0000
Message-ID: <72341035-b4b4-40ca-92a9-f633f18bc025@intel.com>
Date: Tue, 20 Feb 2024 12:07:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] drm/i915/display: Read/Write AS sdp only when
 sink/source has enabled
Content-Language: en-US
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>
References: <20240216142024.1884258-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240216142024.1884258-7-mitulkumar.ajitkumar.golani@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240216142024.1884258-7-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0077.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::22) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|MN6PR11MB8219:EE_
X-MS-Office365-Filtering-Correlation-Id: d2d1af24-b7fc-4ebc-4079-08dc31de711b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8aylKcgV4Onztlj/IntXURaTiX5dRAu2Qj6lJ2/YoSLUdclU7rZhxSxaek8QBLtWhUYrPYCGpF3pLFvy/xy0WYSMeZUoIEjwHNrzgIiIGIZgRqofHaDbmueC3AW9f4hbHD1QoV+PMp22iHZMpQcOKcJs1QztDhnHqTf+xdsQcdm7C6P7btjUTG8+eIkQ9wofUn7GkEeL2fPHtUDB0u+u2QrtCT+TTo/oewuxf4zVWyKoIlmWeYoePfG8fX3p75gsGkL0i2JhDz17oOj6MHEJiOE8B9r6oInHI/z6+pxVKhlNXpT6iZinS1wV1r8jQY6bbe7vsePqzPxrEFcrQ/XmK56/Zlz5v+NQjKv2VLuMjVrYfqUSTHmZKQ/CtGRYXLv2qJs0tNA6Ayz5NTOng4bxwhSUeaOPEabo+HExu+f0WGs/aocMW8XjK3YeDIe71phfTtltQFdNmp1LQmTm/A4lI9Lb3WCkW2om7SKMdScUNudOgXtD3attx2Ur5ngyU4E1p0twMPKfpyO03T9DsLd/4f/4vK5UIKO+p49l7NtXIDM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnBROW93YzNWZUNGRURPdGc5UnJKZitEUlg0V0o2SXZhcExwLzhPMjhzNW5n?=
 =?utf-8?B?VWI4SjlRMk5hTGRVZUtSdmhqTGYwWUg3SUhkK0s0aXgzRVI5dHpOQnNQTEhM?=
 =?utf-8?B?YmJmdWlWUmRreEd5SVhFTXBrVEhqZUtiYXkrYUMzMTFodG5KNUN1eGZlclo5?=
 =?utf-8?B?SkJuM2ZqY1Y1M0NoSFFtbnFQZU12c1l1U1M0LzJMUTc3SDRGbm5IVHhxWFV2?=
 =?utf-8?B?d1lyMkprMWVRbk1LNk5VQlNIYitFSVUzby9RcEwwSHNXL3YrY1JVQm84VUxD?=
 =?utf-8?B?Q0Z4NU9EcDMxaTRZV2Mxd1g0VVlUeGhEVGkxeXp6WTdOdzd3K3FHZ1RRRExD?=
 =?utf-8?B?NXo1c28wOGpTbDRpTFNxRGo2SUo2WWcxdXUrREdySnF3Y3NnR3JwdEx1QmZ5?=
 =?utf-8?B?NGljUTQ5a2I2VnZEbGJqYndJQlFIazJyZVA3RTczUTdBdnZvbXFOZEIyN0Nr?=
 =?utf-8?B?Y0N6V1JVdUdWQ0d2TjZnVDVGTzUzdVVCN1V5eHozWTVNRkVYeDd4RFBSWHYv?=
 =?utf-8?B?WjNxdDhZV0xqMjhod0pnNGJjZnlIMFFDb1hWODNSdE0wdXh5bVFEa2hrcHRT?=
 =?utf-8?B?UUZXeEtDeENhZWI4eGZjdnZQaGl3ekhiQTA3WTFWc1pHUkdETTFLNGtKZTZo?=
 =?utf-8?B?QjlabmRaOTFXc0JMMmtNejdNdGptcHlNV1J3RUhFcDFXaHBhS2lUYmlEMG9q?=
 =?utf-8?B?QUdiMC8rQ1pCUFRKZEQrd1A3MnE3MFYzU1hCc0x0d2ZkZS9XRm1jd3RTU1Vn?=
 =?utf-8?B?QTNwbmhTTHM1RkdPK3o0MkROLzZxY3hlRzNIY25DTTdvTUM0bXErQjIvb3Qx?=
 =?utf-8?B?b25uTzg3K1FBMW5tNlZpelB5RGp6Y1ZZWmZUSzlrdWZiTmttSFVNeUFIWEFU?=
 =?utf-8?B?MUl0cldjeU1aU1QvdFZqTE9YNDJmQTZ2Ris0Tng5N3ZVM3BHeGZGL1pUcEgr?=
 =?utf-8?B?RHdXbVpQQXF2RUlGVGUxSlpIVWd2NE1kNDBHcjhWMkZ2TUV5bnZTcTZVUGdw?=
 =?utf-8?B?VzRFWDR1Rml6Tms2dDY3Tjg1Q0pTNHFRQ0tPUHpTLzR0dWdReUw4YU15d0Uz?=
 =?utf-8?B?SWVVZnJGc0R4VmpwbG1BUnBHS0Rtdno4R1lLZWNqM0ROMjNadXRZbnN2WmRk?=
 =?utf-8?B?dUFIRXg3TXBWK01Gam5GaTc0NTNkMUtJMDNYRld1ajdoR2NxbmhDOFIzUzYy?=
 =?utf-8?B?RHVtbXNzU29sMTIzWk1qVjJINHdPN3JBc254YVZtYW9wQXRFYXhTQ0Zlcm53?=
 =?utf-8?B?Wmc0Ujg0Z3I1OFpJRGNWSnpMNDI3SC9tem9xWTd0Z2YzZVJQUlBDK1VCL05a?=
 =?utf-8?B?U09DMEVTU05DVDhpd0o2WlhBTEkrTXlzbDVjUXRIMVBjaDVXN3lnTElCa0lH?=
 =?utf-8?B?dVdvcmxldHAvNmVPMDFWUWJMUTB4SW5rZjhjWm9MRlRkRndCb01KTzdtOFZB?=
 =?utf-8?B?WVpQRmt2YWVPbm14WDFmMjdOOU16TUJwaFRnc2NLS2JXUk5RN0R2S1JuZlFr?=
 =?utf-8?B?K1hCbnFiOWdzTWJqQS85eGNBa1Z2Sng2OGtBbUdVUjFyVjhZSVo3ODVmVVZr?=
 =?utf-8?B?OC94Q2tSM1lZTWNleWdxK0hQOE0ySW9vWGFJVFB2bkV4S1poUFdkV0FxYjZC?=
 =?utf-8?B?UDNWd0NGYklDM3RuVCtQeDNZMHBDSTh4QU9ORWQ2RW5oRkYxdlJqV2kwZnBh?=
 =?utf-8?B?YmdyOUdzb3RITXhTSkZGUTEwQjhaMGw1TmE4RUcxRXNVRmlzY1ZuYld5KzhU?=
 =?utf-8?B?TTVkOWYzSHFFeGZjL3owS21YelV6UFhUemthV0hzZDdRT292cFpUcm1JczBX?=
 =?utf-8?B?UXh4TFY1RmVFaERNU2s2c04xUEtUMDByM1JzVHlmN2F6bUlIaENxWGR3bnhz?=
 =?utf-8?B?WVRmUDJjRFZ1ODd1aXBBMWphNkRKNUVCYVp6RkpHVHFmQVluOGpaN1JmbldS?=
 =?utf-8?B?L1lCS3VnRWlkM2hSSS9DY1ViRDZqaWtBY1Y5YXNBYkJqenpDUzc5MjFPa1Ny?=
 =?utf-8?B?YkZ6Q29Qa1dlb2JjYzdoMStoRTRWV015VUcwNUFUKzlSZHRSUEZGbWdiVmRH?=
 =?utf-8?B?K2dxc1ZVRWEvcUFVUTRrTlk2THNxTndYKzVIbzVuNGhrRUliM3VUemVTSGhj?=
 =?utf-8?B?RmpZVkZtZnJWTUpwRmJDWnE4TmdqYXpkOTNjRXVWbVg2Ykl2OFJzdHFMc3JF?=
 =?utf-8?B?dFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2d1af24-b7fc-4ebc-4079-08dc31de711b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 06:37:43.3093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O1FtQMiouobPiohhlBuNSdaLS+lyJ4JwF64pMik2XvMLr2n5/vGmW8yVUwKGNiWGn/soUxaPHHcNhgcg5EVSaZvY69faefxFdgbUYlZks8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8219
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


On 2/16/2024 7:50 PM, Mitul Golani wrote:
> Write/Read Adaptive sync SDP only when Sink and Source is enabled
> for the same. Also along with write TRANS_VRR_VSYNC values.
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_ddi.c          |  4 ++++
>   .../gpu/drm/i915/display/intel_display_device.h   |  1 +
>   drivers/gpu/drm/i915/display/intel_dp.c           | 15 +++++++++++++++
>   drivers/gpu/drm/i915/display/intel_dp.h           |  1 +
>   drivers/gpu/drm/i915/display/intel_vrr.c          |  7 +++++++
>   5 files changed, 28 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index bea441590204..68cd49193d03 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -3926,6 +3926,7 @@ static void intel_ddi_get_config(struct intel_encoder *encoder,
>   {
>   	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
>   	enum transcoder cpu_transcoder = pipe_config->cpu_transcoder;
> +	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
>   
>   	/* XXX: DSI transcoder paranoia */
>   	if (drm_WARN_ON(&dev_priv->drm, transcoder_is_dsi(cpu_transcoder)))
> @@ -3972,6 +3973,9 @@ static void intel_ddi_get_config(struct intel_encoder *encoder,
>   	intel_read_dp_sdp(encoder, pipe_config, HDMI_PACKET_TYPE_GAMUT_METADATA);
>   	intel_read_dp_sdp(encoder, pipe_config, DP_SDP_VSC);
>   
> +	if (HAS_AS_SDP(dev_priv) && intel_dp_sink_as_sdp_supported(intel_dp))

> +		intel_read_dp_sdp(encoder, pipe_config, DP_SDP_ADAPTIVE_SYNC);
> +
>   	intel_audio_codec_get_config(encoder, pipe_config);
>   }
>   
> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
> index fe4268813786..6399fbc6c738 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_device.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.h
> @@ -68,6 +68,7 @@ struct drm_printer;
>   #define HAS_TRANSCODER(i915, trans)	((DISPLAY_RUNTIME_INFO(i915)->cpu_transcoder_mask & \
>   					  BIT(trans)) != 0)
>   #define HAS_VRR(i915)			(DISPLAY_VER(i915) >= 11)
> +#define HAS_AS_SDP(i915)		(DISPLAY_VER(i915) >= 13)
>   #define INTEL_NUM_PIPES(i915)		(hweight8(DISPLAY_RUNTIME_INFO(i915)->pipe_mask))
>   #define I915_HAS_HOTPLUG(i915)		(DISPLAY_INFO(i915)->has_hotplug)
>   #define OVERLAY_NEEDS_PHYSICAL(i915)	(DISPLAY_INFO(i915)->overlay_needs_physical)
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 0759266e7bfb..5bd99fa8f200 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -119,6 +119,17 @@ bool intel_dp_is_edp(struct intel_dp *intel_dp)
>   	return dig_port->base.type == INTEL_OUTPUT_EDP;
>   }
>   
> +bool
> +intel_dp_sink_as_sdp_supported(struct intel_dp *intel_dp)
> +{
> +	u8 dpcd[DP_RECEIVER_CAP_SIZE];
> +
> +	if (drm_dp_read_dpcd_caps(&intel_dp->aux, dpcd))
> +		return -EIO;
> +

This is already read in intel_dp->dpcd, we can use that.



> +	return drm_dp_as_sdp_supported(&intel_dp->aux, dpcd);
> +}
> +
>   static void intel_dp_unset_edid(struct intel_dp *intel_dp);
>   
>   /* Is link rate UHBR and thus 128b/132b? */
> @@ -4330,6 +4341,7 @@ void intel_dp_set_infoframes(struct intel_encoder *encoder,
>   			 VIDEO_DIP_ENABLE_SPD_HSW | VIDEO_DIP_ENABLE_DRM_GLK |
>   			 VIDEO_DIP_ENABLE_ADAPTIVE_SYNC;
>   	u32 val = intel_de_read(dev_priv, reg) & ~dip_enable;
> +	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
>   
>   	/* TODO: Sanitize DSC enabling wrt. intel_dsc_dp_pps_write(). */
>   	if (!enable && HAS_DSC(dev_priv))
> @@ -4347,6 +4359,9 @@ void intel_dp_set_infoframes(struct intel_encoder *encoder,
>   
>   	intel_write_dp_sdp(encoder, crtc_state, DP_SDP_VSC);
>   
> +	if (HAS_AS_SDP(dev_priv) && intel_dp_sink_as_sdp_supported(intel_dp))
> +		intel_write_dp_sdp(encoder, crtc_state, DP_SDP_ADAPTIVE_SYNC);
> +
>   	intel_write_dp_sdp(encoder, crtc_state, HDMI_PACKET_TYPE_GAMUT_METADATA);
>   }
>   
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
> index 530cc97bc42f..09ab313af896 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> @@ -180,5 +180,6 @@ intel_dp_compute_config_link_bpp_limits(struct intel_dp *intel_dp,
>   					struct link_config_limits *limits);
>   
>   void intel_dp_get_dsc_sink_cap(u8 dpcd_rev, struct intel_connector *connector);
> +bool intel_dp_sink_as_sdp_supported(struct intel_dp *intel_dp);
>   
>   #endif /* __INTEL_DP_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index 2fa0004d00c7..86729e145991 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -192,6 +192,9 @@ void intel_vrr_set_transcoder_timings(const struct intel_crtc_state *crtc_state)
>   {
>   	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
>   	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
> +	bool is_as_sdp_enabled = intel_de_read(dev_priv,
> +					       HSW_TVIDEO_DIP_CTL(cpu_transcoder)) &
> +					       VIDEO_DIP_ENABLE_ADAPTIVE_SYNC;
>   
>   	/*
>   	 * TRANS_SET_CONTEXT_LATENCY with VRR enabled
> @@ -210,6 +213,10 @@ void intel_vrr_set_transcoder_timings(const struct intel_crtc_state *crtc_state)
>   	intel_de_write(dev_priv, TRANS_VRR_VMAX(cpu_transcoder), crtc_state->vrr.vmax - 1);
>   	intel_de_write(dev_priv, TRANS_VRR_CTL(cpu_transcoder), trans_vrr_ctl(crtc_state));
>   	intel_de_write(dev_priv, TRANS_VRR_FLIPLINE(cpu_transcoder), crtc_state->vrr.flipline - 1);
> +
> +	if (is_as_sdp_enabled)

As mentioned in Patch#4, lets use the crtc_state->vrr.as_sdp_enable, 
instead of this.

Regards,

Ankit

> +		intel_de_write(dev_priv, TRANS_VRR_VSYNC(cpu_transcoder),
> +			       crtc_state->vrr.vsync_end << 16 | crtc_state->vrr.vsync_start);
>   }
>   
>   void intel_vrr_send_push(const struct intel_crtc_state *crtc_state)
