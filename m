Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C41097FE0E7
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 21:22:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2257C10E675;
	Wed, 29 Nov 2023 20:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::617])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B5910E673;
 Wed, 29 Nov 2023 20:22:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VkmrzzkxuFv56ivjFF85roN1oT5NTxZroqgqgnwbJ7r5sQI7krkmC/ZgUAny+EeVDaGJbXYkxITpMdCKUZOanqtqPL/81aOQstGH8vTtQJMynK2slJseWhudl8AGCtVdyiIm4b2ThvhwbUFF2xzP9upgJJJHyw8Uv4XZqvm7UzxuqLW/0lZOitf/u7PHgtUeCW9LFO/ndNK6S+fQymTQLP3ThtopMRCdDMUe7gvQ05j45x7x8sCcjabJ1cBfVtuuQdMewopM9k7gQeSymMEdEoivSxziSStGSz1kCaXmz4CGI51r/TUIjHfazjgtjjsWePfVAxFdzjqMApnAgxM9bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=82NhE4vPrX5aeD/KWrZKziaLsD63+7fLZ3vjIgUq5iA=;
 b=PaeBTnUEKsrEp9tKeiPJIabrOqOyWSg1L2zbZdJ4nzpQv+brZDJBvP5wnwH2xK3vvxmi+v/yMh62hiV8fwIm13qu+iDMkff1Wp/T24p4eQpLdUOg+eib3PEQsprwbl9D6RXgtldNlWhI/5jdo7FeuqOzqYOU0oQFzn0LutKXwOpRk3dwfZPBkXtO3pySZRv9wznvC01Dt8haUgsVlc9cdap8gMxKuigrNRhy1ljwPP+AX05u1S2kKuS3urOhwG3In5T0Elck2vfEp9/uzNeW8L7PplybeWzfEYflxZM3SolCxQ87wcP5cgiDGvagHJA5/n+UAIyn14uqsvypTtQfKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82NhE4vPrX5aeD/KWrZKziaLsD63+7fLZ3vjIgUq5iA=;
 b=GaLhUkYUJiXgtS//XgTv+Icg9m2rNrI4ESmxUZFKo6MYgqhp73lMhaUCxr+wlLUrqVyFdPLKzldczPsgeoq4w1bsiYF2twIpYX9oUGMKJNNLnFRmSGVcfIRMruapp0+hL2bzQIOTZYWnJBrtD8etbX46R6+KZfU/PWQaRWE8QPs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 CH3PR12MB8260.namprd12.prod.outlook.com (2603:10b6:610:12a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.29; Wed, 29 Nov 2023 20:21:58 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5358:4ba6:417e:c368]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5358:4ba6:417e:c368%6]) with mapi id 15.20.7046.023; Wed, 29 Nov 2023
 20:21:58 +0000
Message-ID: <72248f22-6337-487a-9979-a0d79e37a9ed@amd.com>
Date: Wed, 29 Nov 2023 15:21:55 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] drm: enable W=1 warnings by default across the subsystem
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
References: <20231129181219.1237887-1-jani.nikula@intel.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20231129181219.1237887-1-jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0054.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::26) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|CH3PR12MB8260:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d213407-647f-47e9-7a6e-08dbf118d6b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hhd8HcmqROltFHXtPWp6JbfwoFvTOEVcaIwYCMcdSehXCDlnb4MyqTN4g7S7JOTyoZ8dXKg6u1l6yU14Fym1pt9XaQnpFVurxW5Bi89E44yO7cWT760/Dzs4A37CMLI9l1ZbnOqq3NUnyw/8f9mSO8GZMBiXyQ+NkryBsvqx+ne15LX2rMEmpQn8lLeHjt9XVB/9BbfZ5O1nr36JSVIso89U0lE1qja19FmW/j6gBJnufWNgtHbVrd3Aw5OPibUUlh3pruR83gM7onC1ZbBFQkgMWsxSG0kphowKa8f6DYqlKi/rKxreArnWisBeK8svSnRmd/k/ooa/iGdraRNOl6E5BhE4uq2yRhMJ8H71xTlIF8T+5Txbhp+tS7DNKRqEqrgqOsvKy+DTV5tHFujBwRkNeIJFNYBaCpi/jgVaFcvRdSiGu8Jd49csmcnt49VVM2fZ3NQJQ6mjt8C328R3B/golAb6DAvlywRJtq/PhKKCEpIk/6B0fy25e3uogofYsJxlkzqtkjpgUy5bUe2zQZQbwuHd3UwTMfg/GQDNL8WMgTRUnQWKHHqzafmaOtspxcsSx0RHCwaA7RGDjljbz+wmhpD3CgH0+7mtw3Ruep4vrd1137nygox8iJtgeBCQyfpXGnr/HdW87Whzo4F2lu6zLIEH1FcfjgiVPTPDrhjUnyVyg4l9XxmLRPHuEhBcBNOsjIzA71VpQM7M6Nyu1+qHqr9sw4NUauTgH4P8RCI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(346002)(39860400002)(396003)(366004)(230173577357003)(230922051799003)(230273577357003)(1800799012)(451199024)(186009)(64100799003)(38100700002)(31696002)(36756003)(86362001)(202311291699003)(66946007)(316002)(66556008)(54906003)(41300700001)(6512007)(53546011)(8676002)(66476007)(6486002)(478600001)(6666004)(4326008)(5660300002)(7416002)(2906002)(31686004)(44832011)(6506007)(8936002)(26005)(66574015)(2616005)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkFXZzRMeTBBREFXYjdYUFhKWS9vQUpSdTE5ZnRIVE9lSHNBK0JtaW1MdWM3?=
 =?utf-8?B?S2k5SGsvejhFNjFXQkJPNnZpL3pHem15VFJPR3dMb1RzZDYvUk1rQzhUZE14?=
 =?utf-8?B?Y2wweDVBZzBnci9lb2tXYVBWeGhZZEFiYWt6WHdFSW5COXBNZDAyaEhZTUhM?=
 =?utf-8?B?dHJ4dlk2UE5BODhBaENoUGdyd2xGK3BMREt1S2JFdE1RTE5nQitRVXZtRzVn?=
 =?utf-8?B?eGhIeU16eWsrejliRElSWGEvRG1WZjV1TThmenZjYlFRRXBpVlA0eGVaU081?=
 =?utf-8?B?ZE5LemNLd2ViT3prNTFHMno1L0Z1TSs5aWd2Q1lVallYWlF5alFkRHZaV1ZG?=
 =?utf-8?B?c210eWVoY2E5cjByY254UkpOOWxqdkpRK0ptdG14NTlMdEFkekF1RUxEZzRu?=
 =?utf-8?B?eGpUV3Z2dkg1WmhDOVZEYXZqUVlXN0NseW9Rb1pob0pWUEhiNUFHaldVVWUw?=
 =?utf-8?B?WjRpenpZUnNvYkoxL2Z4R0c2R0RsR1FUV2d2Z29JSmhlNnZVdXBCc0VnYTlN?=
 =?utf-8?B?TE5BSFZiQ2FySGVodlk1dmdoY205bHJndXFUb2luOTVna1Z2Y1FqV1N4VVVx?=
 =?utf-8?B?UXA2b2I3djA3eVc0QVNFWWNUUWt1WUloOTQzczNpVEgzdnlId2d2dUNvK1lD?=
 =?utf-8?B?YmYzejRtVDc3UkxnaHg5c3J6NUp0cEt4Vk5UenpiU25TK0Z6THNkWXlBcnQx?=
 =?utf-8?B?eUpSUXR3VXpOSmNmTkd3UzFyM1hiNzZRWER3eW1kSFB3Vy93c3E0d2FIOGx5?=
 =?utf-8?B?amVQYkpyRHdLQjA0cmtKNUU5V3dDYVhHNWlrTWVOcEZtdmhTZitDYklYS2VZ?=
 =?utf-8?B?QU9KK3JIYXU0NHlyUXJYNFlZY1N2Ni9xbFZlTHdhY2VwZEd3NTVET25yZm5z?=
 =?utf-8?B?RXZoZzlyWWptOFdTS3BxemJabkJiaUM0S0tlNzZmOW10Z000Mm12UHEwYUsx?=
 =?utf-8?B?R0RUdDJQaEsvdENqcFZaQXhwd01sNmRSbVk0UlV2clpaaEhNc2JKQnp1bHMz?=
 =?utf-8?B?ZzM2MkZyV1dwQVNYaVFtOXVUK2FDU1pBcElKbldpaEZQSHM1dHRXRld5QzVh?=
 =?utf-8?B?dTdQWlN6MHdiajAyNE1WTkRkZ3JPVGloVEVJcWZvazRXUm5ZSE9BcDN5REtS?=
 =?utf-8?B?L3Z2MU9QWStWMGhYT3ptZDZrL0ZjRE9FbHJtSkprUHViVXJkT2RVbS9wUkR4?=
 =?utf-8?B?UmoxdDRyM25TYWFudE9OQktORDVDWEg4b0FIUWlrZ2g1ZWNLQ1ZRc3Z1eDFq?=
 =?utf-8?B?NVdhYnpuNmh5NEZNZFFHRXd1NEFJcmpDUzRLOGVpWndON28wQkxsL0pvYmZv?=
 =?utf-8?B?aHl4SHNPMzJnTmptYzVXTWdPSVgvUVdyMC9ieDhPWHBmMTZWRjhFclRwaThq?=
 =?utf-8?B?Qk81ekVUZ291U3BUMGcrSWtjbzE1Z0p4Z0NUR1RGb3FBaUhtaE9lY0R1aU94?=
 =?utf-8?B?ZnJrT21sc3dTOTlCZnlnbzI5TVZBTjdjOFduUlRaRnR0UXJJcUxMa21YKzE2?=
 =?utf-8?B?djRQU1hqakF3MFc4allrSGs2ZnYweGNJaExhVUZCU2hHUm04NWsyT0hmV1Nt?=
 =?utf-8?B?anE5NDBlUzNXVlVGR08zMnV4a2psMm9JdzNnV2dENStiQWxCd3VFZktwV3Er?=
 =?utf-8?B?OEFYekQvdzRIYnpEQU93ZytaeGpES2xXK2dPQ0dSWmZCb1pWbllhbTdxNkY0?=
 =?utf-8?B?TWRNbVVxdmVNMXFvOWJyci94K2JpQTQwMmJhbkNhdTZBOU5jeGpjTldpSExj?=
 =?utf-8?B?eithTTZKeU9lWmdsd29uNEZVdyttblVKTG04STNWQklmcVVPYTAyWmR1WHdJ?=
 =?utf-8?B?d0ZscXl3Q2J1dHByaXR2cVlSaG1nSzhrSWNaVWNxOFJnS2tBMzZaMFVydmda?=
 =?utf-8?B?bDgrdm5wM2duQ3dFSldKdDJDUkpvblhYK2JVYUZ5UXltanhCc0FuaVlwV0hB?=
 =?utf-8?B?RkVxbFdUNHUxYXdMdWVWbGIyYW5LcEd6TmJlTDJXUkppc1Z4UDl5UGUxR0pY?=
 =?utf-8?B?ZWR4RDVkQlBrNVFObEhtVlAzYkJpazBwR21yVExnbVgwUmRXYnNVMmNIZjhu?=
 =?utf-8?B?L1RIV3cza1hJQ21yczdiS01udTJUVlJnL2JjWm0vKzVXYnFHL1g1UkNHVTEr?=
 =?utf-8?Q?8lLP5KHbD4yKhpcvgPF0kTjbS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d213407-647f-47e9-7a6e-08dbf118d6b0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 20:21:58.7479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uz49NlqAbylWg1D8+W8VNG21y8YbXW9E1mIG+sgM3ghJPWicut4iHn5X05eOpVMEEiAFuE+3eekvaDx3ObwNjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8260
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
Cc: Pan@freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 intel-gfx@lists.freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Danilo Krummrich <dakr@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cc: Nathan Chancellor <nathan@kernel.org>

On 11/29/23 13:12, Jani Nikula wrote:
> At least the i915 and amd drivers enable a bunch more compiler warnings
> than the kernel defaults.
> 
> Extend the W=1 warnings to the entire drm subsystem by default. Use the
> copy-pasted warnings from scripts/Makefile.extrawarn with
> s/KBUILD_CFLAGS/subdir-ccflags-y/ to make it easier to compare and keep
> up with them in the future.
> 
> This is similar to the approach currently used in i915.
> 
> Some of the -Wextra warnings do need to be disabled, just like in
> Makefile.extrawarn, but take care to not disable them for W=2 or W=3
> builds, depending on the warning.

I think this should go in after drm-misc-next has a clean build (for
COMPILE_TEST builds) with this patch applied. Otherwise, it will break a
lot of build configs.

> 
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Pan, Xinhui <Xinhui.Pan@amd.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 
> With my admittedly limited and very much x86 focused kernel config, I
> get some -Wunused-but-set-variable and -Wformat-truncation= warnings,
> but nothing we can't handle.
> 
> We could fix them up front, or disable the extra warnings on a per
> driver basis with a FIXME comment in their respective Makefiles.
> 
> With the experience from i915, I think this would significantly reduce
> the constant loop of warnings added by people not using W=1 and
> subsequently fixed by people using W=1.
> 
> Note: I've Cc'd the maintainers of drm, drm misc and some of the biggest
> drivers.
> ---
>   drivers/gpu/drm/Makefile | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index b4cb0835620a..6939e4ea13d5 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -5,6 +5,33 @@
>   
>   CFLAGS-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
>   
> +# Unconditionally enable W=1 warnings locally
> +# --- begin copy-paste W=1 warnings from scripts/Makefile.extrawarn
> +subdir-ccflags-y += -Wextra -Wunused -Wno-unused-parameter
> +subdir-ccflags-y += -Wmissing-declarations
> +subdir-ccflags-y += $(call cc-option, -Wrestrict)
> +subdir-ccflags-y += -Wmissing-format-attribute
> +subdir-ccflags-y += -Wmissing-prototypes
> +subdir-ccflags-y += -Wold-style-definition
> +subdir-ccflags-y += -Wmissing-include-dirs
> +subdir-ccflags-y += $(call cc-option, -Wunused-but-set-variable)
> +subdir-ccflags-y += $(call cc-option, -Wunused-const-variable)
> +subdir-ccflags-y += $(call cc-option, -Wpacked-not-aligned)
> +subdir-ccflags-y += $(call cc-option, -Wformat-overflow)
> +subdir-ccflags-y += $(call cc-option, -Wformat-truncation)
> +subdir-ccflags-y += $(call cc-option, -Wstringop-overflow)
> +subdir-ccflags-y += $(call cc-option, -Wstringop-truncation)
> +# The following turn off the warnings enabled by -Wextra
> +ifeq ($(findstring 2, $(KBUILD_EXTRA_WARN)),)
> +subdir-ccflags-y += -Wno-missing-field-initializers
> +subdir-ccflags-y += -Wno-type-limits
> +subdir-ccflags-y += -Wno-shift-negative-value
> +endif
> +ifeq ($(findstring 3, $(KBUILD_EXTRA_WARN)),)
> +subdir-ccflags-y += -Wno-sign-compare
> +endif
> +# --- end copy-paste
> +
>   drm-y := \
>   	drm_aperture.o \
>   	drm_atomic.o \
-- 
Hamza

