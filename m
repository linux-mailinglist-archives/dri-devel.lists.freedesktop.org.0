Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 883EC86DC7F
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 08:55:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C7E10EBE2;
	Fri,  1 Mar 2024 07:55:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jfIZbZft";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F0810EBDD;
 Fri,  1 Mar 2024 07:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709279726; x=1740815726;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GOuoV5LeggiQ7EuyWZXTMUg3cf4E5/SRnNBbYF/uyBo=;
 b=jfIZbZftPnHy2tpddXx5ezkXaQxMhbGMUPW6ft5dKVDYV4ReqxIJCQoI
 ppP7AxT3tB/XIi/4ZKXUOTBaMDmRPcNgFq51bfI4jrpnnTEKH4MV23qez
 BjdaGvRepcgSrLn6XokLxqlZyA1+scItvWy3p2NpLfsDcoFgMigdfVE8O
 LAnsD7ShZCMDABsiS11aTeIeBMfh1UB2vVE8VY2D/WmN6AXWUgA2yiKqE
 SAR03A3mVzHbHH1bCxDAQgZZkB49QPb4TzWn2gMBim9NhcER7Lt3Teklu
 RQ8xRMHJPBLxn70rnloNL8WPsmjllg/Q2tFOlRAmhoE5QDjnNE3mXWVKP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3651881"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="3651881"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 23:55:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; d="scan'208";a="12800148"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Feb 2024 23:55:26 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 23:55:24 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 23:55:24 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 23:55:24 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 23:55:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYZ3g7e4QVxIJg7T2icXORCALKVc+OMn3zPrqJK+/E3p28kVFKcl4mS7XU11snAu/07QJIiTBD1WpO9dJrG+J3ThNvgsenrZDdTMXkLYLHNskPJw508xxTysbGSnpuuODQP7tmQxNYi1dbSxSiWkEeOZm5IcJbdv9Hi6Z1gGYzVyZ3rEirnoIb+e4nMEP71iEwiGx1vdwcX1ARJCYb/eMP3VSaOb7wCcmLN/+lA66DiyxSeaxe4aqxi87HOnX0dtvgLK1gX6N+qTSdnl0QuV1Vi9WCdogud0CSTUyA7v8O+kDtUMwalx7zkqD5G5XVOPRDylAyWP0vzTSDqVPbX2OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfL4bLG3l+9V2XrdcCANQsir92d7U3fip9yWzPyrxYw=;
 b=BgeCg9r7XR8vE1w3MvMKuNOliX6JP3+cPqXftig8uWG4vr4wgrUGZdDa2cqIeqaCmJ798mRoHd2kgyK6uWJbmT1sI8QyNhUO/6Dxb7Gj8UX2nd3CalEdV7ZsF17MUNv/TLUKFyn1jXY7N20ZS56rbJjCeTUaTN44yRLogCMgdRy/lnKguk45+91kuQT0eafeHn39/PsWNgrl1ZG5zvsHbcBR2As+zoJrJu8mgwh6SK5WhutlNV+juSXcWNg6Ae+xEVwHrfR3kKfonbZFollD9Wn0CB33lzyEeDwaTJ6Ap7kDRwdSFfbuOproBDHRgL4iJT1a08mOLKYR0r7lUCylDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.17; Fri, 1 Mar
 2024 07:55:21 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2%7]) with mapi id 15.20.7362.015; Fri, 1 Mar 2024
 07:55:20 +0000
Message-ID: <9cd8b971-2e9c-47d4-9552-196a2ac0dee6@intel.com>
Date: Fri, 1 Mar 2024 13:25:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 4/9] drm/i915/dp: Add Read/Write support for Adaptive
 Sync SDP
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <jani.nikula@intel.com>
References: <20240229163957.2948182-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240229163957.2948182-5-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240229163957.2948182-5-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0043.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::18) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DS0PR11MB8208:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d376fa6-00fc-4dc2-e4ab-08dc39c4f13a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SB3wsAzzSlf/ZrGTyjyRwWtRk6CtWpHLuyr9G/n2y4EA0DYlfxQUdB/TQ1u4fvh1hK/QlmjYNYopaqkHvE8TdAW7/7BVDKY9GoN+4YGynybJuuUUPO0PG+RohdF7D7e9ZXo5t2TYzRVPwIQTCD7rczMD5SGcSU9b2q+tCpqdtlFBo/K1sJBLLuLy9tDIFUqSnsoekTV/Hm/v6kjcUXfTLjF+vdNTmYSJQy6YDvnrNn3esDyW/LWjjKW9+bsyxkeITBbe3cWzdsc95xxU+4uM9teCrTpck23l/CNzAOoZePAI7QnGFCKAu63zsi0wFBEfv7LSY8IWyQHYZL4yDgwcGwGuVEHfg0VjYAj9iaupA68/GYgxXfoM5R0i6/SqJtiSlua9vrbSf/vOYJOG/LnGOeXfAIw/YphJI6i53BzK2DlEmnj8jiV9Ov7jqayNI/IganqgdjzFMR5t7wu2jf22b61mMgE+5Dj+ykMGvJclKbJ7zPW0nVGuIcXvUZLZmOtYdPJ9fsQO3Og14QOPmy1ex9UnM/2uyP+oPzgprRBBdYQF3RkEACmpKnbgLA2ZTaEivLi/RYM6lCe4happxX9b/GpV3IQSyLp+AFCxxBOkpCFMB8KTvC8pJJX0qvzaBTf/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Znhnb1Yzd1JnRVk2MFcxaC8rTWFRcERtSEZHSzNyMlpRdHhveXlOT00yVFdE?=
 =?utf-8?B?OFlxVE9MT3FmcWJmblN5OUpYZ3ZISERZOXJTMk9TR2U4bEhxNjAwaVpZb2l4?=
 =?utf-8?B?SlNSRFgzeDBKQkdSTEExdm9QR1pPcStndE9BTDFIKzNETGZTb0xTbHlib1di?=
 =?utf-8?B?Mi9Lb3ZZQnhjU2pGa05LSkZPeVhaUy9pYUsxOFY4SnBsNEZmMUhQdElNWmgy?=
 =?utf-8?B?SXFRVHVWWXdaWElLeWovUmZ0ODlVR1hKVUJNY0VSZ1d3cmN0Q3hhYmF0YXVi?=
 =?utf-8?B?amlOTnV5b3lxQzR6RVh4Z2lodGgveW5LcmJSZ2ErcmM3NGo4bG1rQkZpUEJL?=
 =?utf-8?B?ZkVldzhHUlNYcCszZG5ySFRhc3R6VzlhVVNuNVg2d1ZCM0pta25iZ0tycDhP?=
 =?utf-8?B?ZDhFRENaNFdOVHV0dHZFdGVSTUVCeVpVYm5qUHI5cHBGc0d0blRDcXlFeWgr?=
 =?utf-8?B?VURpVVB2eGNMYVYzbVF4OEJ2cTE4T3pIaDVhRm5EODNhcHZ0KzZtbmF4R2du?=
 =?utf-8?B?cFdVaW01QzZNNkdyNlovSkYwbVlPVm9aMzdWeVc5YkFDalpZem5rMlVoZzgv?=
 =?utf-8?B?WnVnZUNZQm9YYitSWGdJM2hoSkErYXdNWndXMU9HZ0tncm4xcEN1WXFtcG9r?=
 =?utf-8?B?S3hQNVJoYkttTzFFYXRkZHF0S0F5K3FBRUpEcFEyMEFrYTlEQ3lnaDlCS1ls?=
 =?utf-8?B?am52TUtBQlBZNnJKYUFsWkVJUVRJYkdNYmU1VmoyN0xGZTZEVUZFQWN1L0pO?=
 =?utf-8?B?OVJDRCtFQzF2NE1CQ2pybE1MVEhiRFZUY2VoTmxmOXN2Y2h2Y1c3bnBabVNT?=
 =?utf-8?B?aFdDVGI4SVJyZzI1RWtBdUFXTm1aUVd6RkNINTZxRWl4cVhpaitnRUxFVUxm?=
 =?utf-8?B?OUlKRkJ6bllBUHdQMElzT3RJa2tzOXRPNmRKRlFxM053NGJ6SUU1OEFpVlJG?=
 =?utf-8?B?Vi9Mb016UHpQaFlCUnFSZUNVeHRBbEg5YVBDZERiSXBJVHJ2cVNpVGt3V2dw?=
 =?utf-8?B?TkhLcU1vWWR6WEplL1I1V09sM29kcW1vU1VIUFN2bkxoVnFzT2MwZVExa2o5?=
 =?utf-8?B?VTNpMXBJd2VuZWEya2RGaUN1Y0NnaUZzeGd3SjJxRkQ0Q0kzVzU4R3RySm13?=
 =?utf-8?B?dE9hQmdZeW0wY0oxRk1KdllPZkpQMEowTlJrTGwrL05Ta3BjQzhYcktUYXJR?=
 =?utf-8?B?a0RWQ0xQVUVBcEhyYURhVndscklreSsrSUptL2EyOGM1SEozc09vTlRxekY5?=
 =?utf-8?B?UERxL0ptQVRONnR4Ym5vRXFyb2xGc1Z4ckk2SUVHYzVJc3R3UG5YY3FiZS9C?=
 =?utf-8?B?Z2U5R1RPam15MGFsN0hhM3RTUHRtM2kvVjI2azRPdVNzemZPMVlzZEt2K09Q?=
 =?utf-8?B?aWdvemxBaW5meFdkTy93NXlCUTZSWkVLL1B3eGxlSDhaTi9oL3ZKQWxPbXpj?=
 =?utf-8?B?ZTVGR2ROUTVTd044T2FiVGpCRXZ3b0xIYlNjS1FNbkJrQ2NGam5tWmRvUUtM?=
 =?utf-8?B?bnpYekRjdnJWUUJBNWs3Snc3cDBaRnhQWVBYaUJDam9USFU4QUJ1a0RBQUp1?=
 =?utf-8?B?QUNjRGFEdFk5V2l2Q3V6cDNmK0gva3hqcll2RHBNUEpHbkYzck82WnNZeGhO?=
 =?utf-8?B?dDBsNkNOVVA2QTQvMW42NkVDbHV4aTFUWDBCNkcxZXRoZmxlTi9RU0o2eGxq?=
 =?utf-8?B?akF0eEloYmJWdDB5RkdQRWk1VlIxWmJmVmFDcUFmS3A4UG9nT3UzN2tvWEVs?=
 =?utf-8?B?MkJDNUFKS0JJb01vSTNUZ1pFSzVodmhyTEhQcmF2NVd2d1RaYTQ4dnVXMTA0?=
 =?utf-8?B?S2g4NlN4VUV5NllnNjdYaTVzMFdDc0V4WmE5bThsZ3hsWk94Y1VYVncrZ2h2?=
 =?utf-8?B?RDNiQkoxQ2UrT3kvMDdaNHJKMHVFZGI5R0lHRHRmL2hENVhMRllkYUc2K1A1?=
 =?utf-8?B?NGVZYkQweGxCZ3lvRGV0a3lkM1RNdGQ4azVjZTZOdlB0VlpvWmY1bnlzQy82?=
 =?utf-8?B?UEYrSkVsSHBVYWEzZzFUUUEwY0gybjczakcwK21uZExDdFN0K2JpSzRySXV2?=
 =?utf-8?B?T2lHVENodVJVYmtFSWc0cURtT3RXNlpjWHlqaXNvT1VXVnN1TmdSbHlaZ2RJ?=
 =?utf-8?B?Y0xZWjJUUDhEWFVyN0RJek9sSXY2YW9wOTNtVDVHK3VZbm1hU1JXZUxhVFJJ?=
 =?utf-8?B?TWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d376fa6-00fc-4dc2-e4ab-08dc39c4f13a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 07:55:20.9183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1yaSttVpW8IH/Ru2GXUVgigoC0F/iQHzmE1CBgLiMQlGw9Dto4x7xdo9gmp6mghNEfu2cCUP+vWRpi6i2E0bcjL94gXYxHo4TPOajv2DAdo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8208
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


On 2/29/2024 10:09 PM, Mitul Golani wrote:
> Add the necessary structures and functions to handle reading and
> unpacking Adaptive Sync Secondary Data Packets. Also add support
> to write and pack AS SDP.
>
> --v2:
> - Correct use of REG_BIT and REG_GENMASK. [Jani]
> - Use as_sdp instead of async. [Jani]
> - Remove unrelated comments and changes. [Jani]
> - Correct code indent. [Jani]
>
> --v3:
> - Update definition names for AS SDP which are starting from
> HSW, as these defines are applicable for ADLP+.(Ankit)
>
> --v4:
> - Remove as_sdp_mode from crtc_state.
> - Drop metadata keyword.
> - For consistency, update ADL_ prefix or post fix as required.
>
> --v5:
> - Check if AS_SDP bit is set in crtc_state->infoframes.enable. If not
>    return.
> - Check for HAS_AS_SDP() before setting VIDEO_DIP_ENABLE_AS_ADL mask.
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   .../drm/i915/display/intel_display_device.h   |  1 +
>   drivers/gpu/drm/i915/display/intel_dp.c       | 91 +++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_hdmi.c     | 12 ++-
>   drivers/gpu/drm/i915/i915_reg.h               |  8 ++
>   include/drm/display/drm_dp_helper.h           |  2 +-
>   5 files changed, 112 insertions(+), 2 deletions(-)
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
> index e13121dc3a03..7cf849015797 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4089,6 +4089,32 @@ intel_dp_needs_vsc_sdp(const struct intel_crtc_state *crtc_state,
>   	return false;
>   }
>   
> +static ssize_t intel_dp_as_sdp_pack(const struct drm_dp_as_sdp *as_sdp,
> +				    struct dp_sdp *sdp, size_t size)
> +{
> +	size_t length = sizeof(struct dp_sdp);
> +
> +	if (size < length)
> +		return -ENOSPC;
> +
> +	memset(sdp, 0, size);
> +
> +	/* Prepare AS (Adaptive Sync) SDP Header */
> +	sdp->sdp_header.HB0 = 0;
> +	sdp->sdp_header.HB1 = as_sdp->sdp_type;
> +	sdp->sdp_header.HB2 = 0x02;
> +	sdp->sdp_header.HB3 = as_sdp->length;
> +
> +	/* Fill AS (Adaptive Sync) SDP Payload */
> +	sdp->db[0] = as_sdp->mode;
> +	sdp->db[1] = as_sdp->vtotal & 0xFF;
> +	sdp->db[2] = (as_sdp->vtotal >> 8) & 0xFF;
> +	sdp->db[3] = as_sdp->target_rr;
> +	sdp->db[4] = (as_sdp->target_rr >> 8) & 0x3;
> +
> +	return length;
> +}
> +
>   static ssize_t
>   intel_dp_hdr_metadata_infoframe_sdp_pack(struct drm_i915_private *i915,
>   					 const struct hdmi_drm_infoframe *drm_infoframe,
> @@ -4188,6 +4214,10 @@ static void intel_write_dp_sdp(struct intel_encoder *encoder,
>   							       &crtc_state->infoframes.drm.drm,
>   							       &sdp, sizeof(sdp));
>   		break;
> +	case DP_SDP_ADAPTIVE_SYNC:
> +		len = intel_dp_as_sdp_pack(&crtc_state->infoframes.as_sdp, &sdp,
> +					   sizeof(sdp));
> +		break;
>   	default:
>   		MISSING_CASE(type);
>   		return;
> @@ -4209,6 +4239,10 @@ void intel_dp_set_infoframes(struct intel_encoder *encoder,
>   	u32 dip_enable = VIDEO_DIP_ENABLE_AVI_HSW | VIDEO_DIP_ENABLE_GCP_HSW |
>   			 VIDEO_DIP_ENABLE_VS_HSW | VIDEO_DIP_ENABLE_GMP_HSW |
>   			 VIDEO_DIP_ENABLE_SPD_HSW | VIDEO_DIP_ENABLE_DRM_GLK;
> +
> +	if (HAS_AS_SDP(dev_priv))
> +		dip_enable |= VIDEO_DIP_ENABLE_AS_ADL;
> +
>   	u32 val = intel_de_read(dev_priv, reg) & ~dip_enable;
>   
>   	/* TODO: Sanitize DSC enabling wrt. intel_dsc_dp_pps_write(). */
> @@ -4230,6 +4264,36 @@ void intel_dp_set_infoframes(struct intel_encoder *encoder,
>   	intel_write_dp_sdp(encoder, crtc_state, HDMI_PACKET_TYPE_GAMUT_METADATA);
>   }
>   
> +static
> +int intel_dp_as_sdp_unpack(struct drm_dp_as_sdp *as_sdp,
> +			   const void *buffer, size_t size)
> +{
> +	const struct dp_sdp *sdp = buffer;
> +
> +	if (size < sizeof(struct dp_sdp))
> +		return -EINVAL;
> +
> +	memset(as_sdp, 0, sizeof(*as_sdp));
> +
> +	if (sdp->sdp_header.HB0 != 0)
> +		return -EINVAL;
> +
> +	if (sdp->sdp_header.HB1 != DP_SDP_ADAPTIVE_SYNC)
> +		return -EINVAL;
> +
> +	if (sdp->sdp_header.HB2 != 0x02)
> +		return -EINVAL;
> +
> +	if ((sdp->sdp_header.HB3 & 0x3F) != 9)
> +		return -EINVAL;
> +
> +	as_sdp->mode = sdp->db[0] & DP_ADAPTIVE_SYNC_SDP_OPERATION_MODE;
> +	as_sdp->vtotal = ((u64)sdp->db[2] << 32) | (u64)sdp->db[1];
> +	as_sdp->target_rr = (u64)sdp->db[3] | ((u64)sdp->db[4] & 0x3);
> +
> +	return 0;
> +}
> +
>   static int intel_dp_vsc_sdp_unpack(struct drm_dp_vsc_sdp *vsc,
>   				   const void *buffer, size_t size)
>   {
> @@ -4300,6 +4364,29 @@ static int intel_dp_vsc_sdp_unpack(struct drm_dp_vsc_sdp *vsc,
>   	return 0;
>   }
>   
> +static void
> +intel_read_dp_infoframe_as_sdp(struct intel_encoder *encoder,

This can simply be intel_read_dp_as_sdp.


> +			       struct intel_crtc_state *crtc_state,
> +			       struct drm_dp_as_sdp *as_sdp)
> +{
> +	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
> +	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
> +	unsigned int type = DP_SDP_ADAPTIVE_SYNC;
> +	struct dp_sdp sdp = {};
> +	int ret;
> +
> +	if ((crtc_state->infoframes.enable &
> +	     intel_hdmi_infoframe_enable(type)) == 0)
> +		return;
> +
> +	dig_port->read_infoframe(encoder, crtc_state, type, &sdp,
> +				 sizeof(sdp));
> +
> +	ret = intel_dp_as_sdp_unpack(as_sdp, &sdp, sizeof(sdp));
> +	if (ret)
> +		drm_dbg_kms(&dev_priv->drm, "Failed to unpack DP AS SDP\n");
> +}
> +
>   static int
>   intel_dp_hdr_metadata_infoframe_sdp_unpack(struct hdmi_drm_infoframe *drm_infoframe,
>   					   const void *buffer, size_t size)
> @@ -4406,6 +4493,10 @@ void intel_read_dp_sdp(struct intel_encoder *encoder,
>   		intel_read_dp_hdr_metadata_infoframe_sdp(encoder, crtc_state,
>   							 &crtc_state->infoframes.drm.drm);
>   		break;
> +	case DP_SDP_ADAPTIVE_SYNC:
> +		intel_read_dp_infoframe_as_sdp(encoder, crtc_state,
> +					       &crtc_state->infoframes.as_sdp);
> +		break;
>   	default:
>   		MISSING_CASE(type);
>   		break;
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 90d2236fede3..fb134bf64dae 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -137,6 +137,8 @@ static u32 hsw_infoframe_enable(unsigned int type)
>   		return VIDEO_DIP_ENABLE_GMP_HSW;
>   	case DP_SDP_VSC:
>   		return VIDEO_DIP_ENABLE_VSC_HSW;
> +	case DP_SDP_ADAPTIVE_SYNC:
> +		return VIDEO_DIP_ENABLE_AS_ADL;


Need to add an entry in g4x_infoframe_enable too, similar to DP_SDP_VSC. 
(See BAT failure for CI machine fi-bsw-n3050)


Regards,

Ankit


>   	case DP_SDP_PPS:
>   		return VDIP_ENABLE_PPS;
>   	case HDMI_INFOFRAME_TYPE_AVI:
> @@ -164,6 +166,8 @@ hsw_dip_data_reg(struct drm_i915_private *dev_priv,
>   		return HSW_TVIDEO_DIP_GMP_DATA(cpu_transcoder, i);
>   	case DP_SDP_VSC:
>   		return HSW_TVIDEO_DIP_VSC_DATA(cpu_transcoder, i);
> +	case DP_SDP_ADAPTIVE_SYNC:
> +		return ADL_TVIDEO_DIP_AS_SDP_DATA(cpu_transcoder, i);
>   	case DP_SDP_PPS:
>   		return ICL_VIDEO_DIP_PPS_DATA(cpu_transcoder, i);
>   	case HDMI_INFOFRAME_TYPE_AVI:
> @@ -186,6 +190,8 @@ static int hsw_dip_data_size(struct drm_i915_private *dev_priv,
>   	switch (type) {
>   	case DP_SDP_VSC:
>   		return VIDEO_DIP_VSC_DATA_SIZE;
> +	case DP_SDP_ADAPTIVE_SYNC:
> +		return VIDEO_DIP_ASYNC_DATA_SIZE;
>   	case DP_SDP_PPS:
>   		return VIDEO_DIP_PPS_DATA_SIZE;
>   	case HDMI_PACKET_TYPE_GAMUT_METADATA:
> @@ -563,6 +569,9 @@ static u32 hsw_infoframes_enabled(struct intel_encoder *encoder,
>   	if (DISPLAY_VER(dev_priv) >= 10)
>   		mask |= VIDEO_DIP_ENABLE_DRM_GLK;
>   
> +	if (HAS_AS_SDP(dev_priv))
> +		mask |= VIDEO_DIP_ENABLE_AS_ADL;
> +
>   	return val & mask;
>   }
>   
> @@ -570,6 +579,7 @@ static const u8 infoframe_type_to_idx[] = {
>   	HDMI_PACKET_TYPE_GENERAL_CONTROL,
>   	HDMI_PACKET_TYPE_GAMUT_METADATA,
>   	DP_SDP_VSC,
> +	DP_SDP_ADAPTIVE_SYNC,
>   	HDMI_INFOFRAME_TYPE_AVI,
>   	HDMI_INFOFRAME_TYPE_SPD,
>   	HDMI_INFOFRAME_TYPE_VENDOR,
> @@ -1212,7 +1222,7 @@ static void hsw_set_infoframes(struct intel_encoder *encoder,
>   	val &= ~(VIDEO_DIP_ENABLE_VSC_HSW | VIDEO_DIP_ENABLE_AVI_HSW |
>   		 VIDEO_DIP_ENABLE_GCP_HSW | VIDEO_DIP_ENABLE_VS_HSW |
>   		 VIDEO_DIP_ENABLE_GMP_HSW | VIDEO_DIP_ENABLE_SPD_HSW |
> -		 VIDEO_DIP_ENABLE_DRM_GLK);
> +		 VIDEO_DIP_ENABLE_DRM_GLK | VIDEO_DIP_ENABLE_AS_ADL);
>   
>   	if (!enable) {
>   		intel_de_write(dev_priv, reg, val);
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index e00557e1a57f..dce276236707 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -2312,6 +2312,7 @@
>    * (Haswell and newer) to see which VIDEO_DIP_DATA byte corresponds to each byte
>    * of the infoframe structure specified by CEA-861. */
>   #define   VIDEO_DIP_DATA_SIZE	32
> +#define   VIDEO_DIP_ASYNC_DATA_SIZE	36
>   #define   VIDEO_DIP_GMP_DATA_SIZE	36
>   #define   VIDEO_DIP_VSC_DATA_SIZE	36
>   #define   VIDEO_DIP_PPS_DATA_SIZE	132
> @@ -2350,6 +2351,8 @@
>   #define   VIDEO_DIP_ENABLE_VS_HSW	(1 << 8)
>   #define   VIDEO_DIP_ENABLE_GMP_HSW	(1 << 4)
>   #define   VIDEO_DIP_ENABLE_SPD_HSW	(1 << 0)
> +/* ADL and later: */
> +#define   VIDEO_DIP_ENABLE_AS_ADL	REG_BIT(23)
>   
>   /* Panel fitting */
>   #define PFIT_CONTROL	_MMIO(DISPLAY_MMIO_BASE(dev_priv) + 0x61230)
> @@ -5040,6 +5043,7 @@
>   #define _HSW_VIDEO_DIP_SPD_DATA_A	0x602A0
>   #define _HSW_VIDEO_DIP_GMP_DATA_A	0x602E0
>   #define _HSW_VIDEO_DIP_VSC_DATA_A	0x60320
> +#define	_ADL_VIDEO_DIP_AS_DATA_A	0x60484
>   #define _GLK_VIDEO_DIP_DRM_DATA_A	0x60440
>   #define _HSW_VIDEO_DIP_AVI_ECC_A	0x60240
>   #define _HSW_VIDEO_DIP_VS_ECC_A		0x60280
> @@ -5054,6 +5058,7 @@
>   #define _HSW_VIDEO_DIP_SPD_DATA_B	0x612A0
>   #define _HSW_VIDEO_DIP_GMP_DATA_B	0x612E0
>   #define _HSW_VIDEO_DIP_VSC_DATA_B	0x61320
> +#define _ADL_VIDEO_DIP_AS_DATA_B	0x61484
>   #define _GLK_VIDEO_DIP_DRM_DATA_B	0x61440
>   #define _HSW_VIDEO_DIP_BVI_ECC_B	0x61240
>   #define _HSW_VIDEO_DIP_VS_ECC_B		0x61280
> @@ -5083,6 +5088,9 @@
>   #define GLK_TVIDEO_DIP_DRM_DATA(trans, i)	_MMIO_TRANS2(trans, _GLK_VIDEO_DIP_DRM_DATA_A + (i) * 4)
>   #define ICL_VIDEO_DIP_PPS_DATA(trans, i)	_MMIO_TRANS2(trans, _ICL_VIDEO_DIP_PPS_DATA_A + (i) * 4)
>   #define ICL_VIDEO_DIP_PPS_ECC(trans, i)		_MMIO_TRANS2(trans, _ICL_VIDEO_DIP_PPS_ECC_A + (i) * 4)
> +/*ADLP and later: */
> +#define ADL_TVIDEO_DIP_AS_SDP_DATA(trans, i)	_MMIO_TRANS2(trans,\
> +							     _ADL_VIDEO_DIP_AS_DATA_A + (i) * 4)
>   
>   #define _HSW_STEREO_3D_CTL_A		0x70020
>   #define   S3D_ENABLE			(1 << 31)
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index 94eb0d92abae..3f6003656e3d 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -130,8 +130,8 @@ void drm_dp_as_sdp_log(struct drm_printer *p,
>   void drm_dp_vsc_sdp_log(struct drm_printer *p, const struct drm_dp_vsc_sdp *vsc);
>   
>   bool drm_dp_vsc_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
> -bool drm_dp_as_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
>   
> +bool drm_dp_as_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
>   int drm_dp_psr_setup_time(const u8 psr_cap[EDP_PSR_RECEIVER_CAP_SIZE]);
>   
>   static inline int
