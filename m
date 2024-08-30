Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8AC9667CC
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 19:18:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43FF610EAAB;
	Fri, 30 Aug 2024 17:18:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J+jZiZYF";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AAF710E0EC;
 Fri, 30 Aug 2024 17:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725038284; x=1756574284;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UdSkmS63pRE9SZWYwkMLjvfSehUQe65KzSge0vdoHuo=;
 b=J+jZiZYFDuLFRl3HzJLAGq0o5UpKcCgtQflPQLChNfF056vjJdziv7r/
 PbvYFA/cGEYeIeV2IxZj+EuZts5uwh3X9xQgfSWkzuipwgggjbImKRxpa
 timrWNUYVDLjBUf8on3vd3bT+jhpIYMjhUyE/eEH45HK/RARmZuEMP/TM
 JqAlz+qa4syPo5L1tcb7HLC2ta4B2SNiPPXycT6+poDsq3sbH/BPBbH4p
 Fm0F8YqKPWu0Q4Y0r7C9BWsIgmcJciL1A/7MX+DKT8isYZRTnyGlSZ+6R
 gxnMWhQlT0/KPhrH1gsC1HHkww0jSVE5ST8tg7CAMmnT+L+7gpGVMtEgY A==;
X-CSE-ConnectionGUID: SO/1qmyxS/eBROq6Zhs9MQ==
X-CSE-MsgGUID: qXQTbP6TSb6Gq1NyfrUpsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23571993"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; d="scan'208";a="23571993"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 10:18:03 -0700
X-CSE-ConnectionGUID: qbfxE2IITcW3cy3fCNFJIA==
X-CSE-MsgGUID: Xw2/UwChR/KFcVekR8GYfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; d="scan'208";a="64147804"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Aug 2024 10:18:03 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 30 Aug 2024 10:18:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 30 Aug 2024 10:18:02 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 30 Aug 2024 10:18:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bz8xudoOgrrZffkWfmiaSoiLupHhYbulxI+E8P/9afbaF1KLqmj7K/aKyBbQEwUod9Sh64B2qAibKJvEbIGVPvfOcCBKiAnHmY5FmwCPQ7Ru0wDKkhNgFQvlq+MI9uDFOfYCJEP7ogKlo+8ru+iHjDiUiI9Z6UB10IVt1XaZzCgjjHf1Rnre9RntuCgG8lIHf+tkrlziMGH/cuCHywJ/8ULWKrQUYcq+e2dRYSbuSIh5VMphd1XV2KA/wff81lVQugFZLChSw75m3HGLiBk1HDX/eFwNLs/9+E4Xt3Fkyv2lkfE65lhdZXtOeK8HNT3XIbD4pyQfvVm56IETwzYF9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6yL4f3cbZub+q5I3VgyC2pmPs4QbT1ym8FO7fxIers=;
 b=JjOkA84E3z1vEFYY8YD28kk3WFYm6YfwFzHCdKK30CwKCo5Anf7dU9wPEfKMfZtE5wL/oVLYfjE/w2/ny1LJUdRDAiu8uozQkXJfxCbcE6tJ3VmAIrUDB3+O8Nsi+Dke/LLA9AN403pTZCV5CsaIt0fiuMOvtK5Z1rPRNdVxM+hpeoCnr/CEfEebS3dZfz21SY7vGlqNIVLMS1glm6dHFvUpVL1B5vtHU6uZNAM8O+j/5ZpfH/n0nCsp2vSZ7m2PXQfjUb7c2Hv6LIol/XkyttYKTZzk2ubfjB8nytfjDuHspNcwtCB2kHOzRNTSDd0KXwPdbcxAUwvgeNevaGahBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by CH0PR11MB5300.namprd11.prod.outlook.com (2603:10b6:610:bf::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 17:17:55 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%5]) with mapi id 15.20.7875.019; Fri, 30 Aug 2024
 17:17:55 +0000
Message-ID: <139fc142-1f61-41cd-b5eb-568470ca639c@intel.com>
Date: Fri, 30 Aug 2024 10:17:50 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/uc: Includ requested frequency in slow firmware
 load messages
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
CC: <DRI-Devel@Lists.FreeDesktop.Org>
References: <20240830165823.3681368-1-John.C.Harrison@Intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20240830165823.3681368-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0019.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::24) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|CH0PR11MB5300:EE_
X-MS-Office365-Filtering-Correlation-Id: f3f444b1-50bb-4fc1-3b27-08dcc917afbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDcvekRnMzFjRlRHbWQrcFhPdTNMM3hUWGlYM3h5VGIzL2drRWo2NDh0Yk1O?=
 =?utf-8?B?YjY1OWx6NXlCTTgzeVRwZFNHaXdEZCt4NEpGSUZzOEM5dndlc0RqOFBSL0Q0?=
 =?utf-8?B?Rmo5dWJoVmNXRW5peDZ4d29kc2dHR2Q2cFcvcXBEbjhVZkRvYzV1enRhckEw?=
 =?utf-8?B?Wm1ucENYZHM0YWIrK0tRYk1rUUJrR3RaWVU0QXRvQXlnaEJYTFNTSzB0VUtI?=
 =?utf-8?B?NGZZUDBwNTh6eW96NG5vL2YwS1lDcFZWT3p5c3ZUWWRMUjNhVVVsY3NJaGdx?=
 =?utf-8?B?N3dpWHlkMkJxUFlBYUMxK3kzeVU2WVliZW5ENGVqaXQ2S3gxQUtBOWxIN0V5?=
 =?utf-8?B?Tm04cjVxaUs1VUpFOURBWWFkUEp1Zm1sTFA5bWdreHM0MlhKNWJGK2N4dXNj?=
 =?utf-8?B?bFp2U3dBM1dBSkoyb3J3dVRzeERSUlAzaWF3L2dqRFNWR0FnK0tMY2VPNCtW?=
 =?utf-8?B?aGJqelFqbERnWDdTeGh0dUoramtpTkppSXFSS0FTa0w0bUI0Q0JsRDJ1SHBW?=
 =?utf-8?B?K0FsSUloWFVtRHpmVzk1MCt5Y0xSVmpWUit5ZGJJUDNmVHdwK1V0bEdnL1dx?=
 =?utf-8?B?bDFSQkZQVm1rNy80Mko4LzdMUXpEZ3pSNC9IN0hSeWpZTmFnaDFrWTdCSmZo?=
 =?utf-8?B?N0g3YUNwV2tFWldiaXhIbkpUMlNvVlczd2FYVEt1Y2w1OWNycitVSUFVZiti?=
 =?utf-8?B?UFdBeEJxZ0sydDlBQmZGcCtPL09GbW5aaCtycWtmM3FzNWIzVGFjcFNqZUth?=
 =?utf-8?B?TTFmeHpkV1ZJVDlQNXhUc1RCQm4xU1piQkR1ejdzWHl4dWtlVmNsajFNRnIx?=
 =?utf-8?B?bnZGbTBKTHA1V081dzZIY1g5K2dveEIwNXhnM1dJOTNXUy84b1VOTHN4N1Mx?=
 =?utf-8?B?VDU0bEg5QWVobWJtekdzd0tlT3dvZ0xyM2VWcUUzVTF2c3pZd2VBbXo2RjZk?=
 =?utf-8?B?MHRxMllWQU9PUmpVYkpoUGJyTUxBNi9HZldMWXowLzl3aERDWE1ZNmVGWDMw?=
 =?utf-8?B?c2Flb1IydE5HYUFSbWVWejhuc0tJZDFBQWw2bjFMRFFSU0RMNDBtb2ZkWWp0?=
 =?utf-8?B?dnhJZXRPakhIdmQyQlExUmlwVVJDa2FuaXpkV3NGVlZxMDF4ejVPZW54eENq?=
 =?utf-8?B?SWV6bm9QY1p1MlB0ZlRJdVdDTjZ1UnM0L2RPbUJDZ3VyS2psQWYzYmVKeThz?=
 =?utf-8?B?OGkvNTBsVkNxZXpkSlMxVG1seWFicmRFM3B4ZlBnVFVtSU93Y0FsREdSb2ZF?=
 =?utf-8?B?aGVxdW5hejhHWVdFVjNkczB4d1I4aWFneDd6K0JuK00yYTAycHRRSGp4MmNV?=
 =?utf-8?B?ak5XeFlQVmpURy9UNytpUFhZejdGTENtRnpSVFFLOVF6cUhmNmFqOUdSN1lp?=
 =?utf-8?B?OE9QY1pvWGUwZ21IcmRXNnVoMzRidDFEOXRQZUpEQ29KNCtPaVdnUEVvZSt0?=
 =?utf-8?B?c3Y2NkYrL01VUUV0ZFFzcE5INEVadm5VQVpkbHNJTU1YeXJiMk5KbmNvdEFx?=
 =?utf-8?B?c2lla1hjYTJ6RXVaZURsODlyaXNOMVRXaUIvY1dRR01jendpdXdIbGh1TlVN?=
 =?utf-8?B?K3JOL25sQUlaeXhpdVlsRDBTbE5jZ2xPZGE2TE5ab1V1dG5sb1RVdHdJT3Z1?=
 =?utf-8?B?cmZpM3p2WnZxODMwbzJzOG5hWko2b1crdUdqVTBMaFU5c2lBY213WmNTS1dP?=
 =?utf-8?B?Rk1hQ2xpVk9md1BheFdDU05tdUZLMWtHOUt3VHN4QzkvTndGVDEwMGRrS1dn?=
 =?utf-8?B?STZUMUx1Qzd4cVVWd0lvd2NWR2l0TmNmRVNoT1dPUHBDWHpOV3A3UHhobEZH?=
 =?utf-8?B?Q1J6ZEVCSzBCZEV5eGZsZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnBOUklOWmJxUWpYSERzN3l6K2k2WGxMSU94WXRGMDNXZnFvT2Q0K0JyQlNX?=
 =?utf-8?B?YS9TNkF2dnh0U2lqY3RvREhHRW9qRHlnUlE3UjdpL1E0QVB1ejdYbVg3NXpk?=
 =?utf-8?B?WndCUnZ4VUVkWUNrSyt3MExGOG5Yamt4aURBVlpQUHd5WFZwdnB5SVgvUzZK?=
 =?utf-8?B?RVFmKzhPdUNuR1NmRUFLUytKTWIxY2FzVENiSGwzdHdMVXc3SkhQWlVjZjZT?=
 =?utf-8?B?YTZuWFdEWUY1RHVQaXlyYmRvRjV1aHU4eGZ2dUtmMVRoRVNMemd2M2dmQmd1?=
 =?utf-8?B?dkJNaGRMclM1TFQrVG9PalcrbnR5b0dMbVhObldUMUlaRzE1OFlkSkdBd0Q4?=
 =?utf-8?B?Y1pmSTkxSHdJVkN6SVBuT3FCdkRwa3hCTG5nVjUvMG9YRmhrdTFSQkN4NHFs?=
 =?utf-8?B?S1FJSHY2L3piais1cW5qT2YvQWtJUzJVMXQ2TUZGUTJtN3B5bnY5SGoyM3Iz?=
 =?utf-8?B?UWFhaEJyaEtONnBLS1NXSkJVQVlCbFEvNDBQSWhFdTl1VytHWnhvSUIwVkx6?=
 =?utf-8?B?d3FVM1ZGS0c0dk52dW9nSGg3QmRnRkVaM28wSGdzWTRLVk9rSkpGK09NbGo0?=
 =?utf-8?B?MmxGOFVvWk5JSDRZZHRzS3NGbVZJanAveUdaWEkxZm1kQmVIOE81dWkvVVQ2?=
 =?utf-8?B?Sk13S2ZBUEFSdVlRNE9rZlV3RjR4c2tDc0V6SS9iTDZZRVVuRW51WHczVUtH?=
 =?utf-8?B?WDE5WW0xaVdGdFg2SXhxTFdLbjlmMCt5Rk9HUU02cGUyYTJyMlhFR2ZDQmto?=
 =?utf-8?B?MWtYMFc5TFRBaHJ6UjIwZlkweG10dVkyWW5UNU5Pa0VnenV2MmZhZDZrVW41?=
 =?utf-8?B?VkhLWUJKa2EwRzJyNWx6ekpzeEx2NitxbGR0OUZyRllRbE1iejZtUkxDcmM5?=
 =?utf-8?B?UkMyMDZhYVB0QjYyOThoNlhNN3Z4dDhrdFF0dGVZWWNGYkpValN4akhPb0J0?=
 =?utf-8?B?bzIxWjU4Z0F5UHQ0QmhIVjZUbVdRRXpXU0gvVGV6SFVQSkRaNllxSGtvOC95?=
 =?utf-8?B?UHErYUs2MTN0ODA2U2FqbXBFMTkvNjdJUnMwVnJDdzhjbzE5N0xYM3QvWHIw?=
 =?utf-8?B?SzFwbkZ0MUhweU8zSkhGUWRjR3Evc1RETUVvRFlraUo2enEva3pwMzBIY3Fn?=
 =?utf-8?B?WnRrL2hxN2lSM0NZbUxCd2N2WkV0d2xBN2cxQ1FSWnR2TnRFRFJyb0pVekpG?=
 =?utf-8?B?MkpPbkkyblpXcG5Cc0ViQ1d3T3U2VXMxZ0xNdXFYZFpYRTMwQXNqcDU4NkRU?=
 =?utf-8?B?UXJnT0ZuWnJveWlPMHFMUko3bmsrbVhjZ1NZZHEwTXBTN2lzeUlmZWg0Tk12?=
 =?utf-8?B?ZGJpZUVqamtKSGwxZ0F6U1k2YzlLeDdzK0cyblhFbjd1YXVCT1ZoNHY1Q1hV?=
 =?utf-8?B?bXZ0ZEk0ZjVmOTFnWHlGZm9jcGFQaDdLY3Z4dlljOEVpdk9YK2hIRVpnMS9j?=
 =?utf-8?B?VFZSRmVTQVhOdmNLMXpkZ2N3TWsvR0NJSUhSbS90cDQ4WXU3U3E5V0NXUi9T?=
 =?utf-8?B?ZDg3L01vdzRNY2krYXQ4dTZua3FOSE45bElyakViZ3I3eWgrWW5VRUZzR0pN?=
 =?utf-8?B?ejN5Z3cyRDBIbWs2M1Q5RXlCUEF2eVhTZWx4U2lNZHNmUG00bXNiRnBFMFdI?=
 =?utf-8?B?NEVpOHhWeUZTTlR5RFlGMHhvQXdYTEZ3Z0x1WXo5UitCL1piZGZpVmZwbXBB?=
 =?utf-8?B?ZWlqTVduL2VXNjFKMklmNjZvYUJ2UVEvOHd1cVJ3c2daR2szbTBXbDVNUFhE?=
 =?utf-8?B?WVA1UXNCRTZMY0hPK25HYXdzVUZBRms1SmhaN1ptSVphU1FnL3J1aXJsd2dZ?=
 =?utf-8?B?MkJMRlkvQjk2WEFTZ3BKTDEzdGw1cjdCUU5VNExFbnprMGZ5a2tzN1czNEQr?=
 =?utf-8?B?MWVkdUNMSkg0cXFsaEd1QTl6Vy9tVmFRYlUwMGp6WVlWRU1zenVHQUJ2dVVj?=
 =?utf-8?B?NFlkeWJ6RnFvRFU5WTRmMzVCcFVxNjFKeElpY0NhRHNOMkVlUjdabllIYjlz?=
 =?utf-8?B?d0F1YXR6L29kYzdFek1TM0VjNFE1ajhGTVZoZzlNbHM4ZUxKQm8xc2pDaExy?=
 =?utf-8?B?WGFEL3RHZ1RPSGRwdkdISm5jb1JHc2x4UEhVMnVjckNDRGd1UktQZnFyNnFU?=
 =?utf-8?B?Y1dLRkcvQW1PNzRtMVRtcFRlTElBVXJ5RDB0MkhxR1QwK1pGeXNSSy9sRTYx?=
 =?utf-8?B?MXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3f444b1-50bb-4fc1-3b27-08dcc917afbe
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 17:17:55.0697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zU16uS8fQHzGTnmNDswXHar5qahlWpfOfcmtrhK2Z18c+r6D5CKWNrVOH74gJE2NMBKWclEXedozdJ58x4NlNLQyvC7qD6Fa++1rdwPb+qg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5300
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


On 8/30/2024 9:58 AM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> To aid debug of sporadic issues, include the requested frequency in
> the debug message as well as the actual frequency. That way we know
> for certain that the clamping is not because the driver forgot to ask.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 11 ++++++-----
>   drivers/gpu/drm/i915/gt/uc/intel_huc.c    | 12 +++++++-----
>   2 files changed, 13 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> index 23f54c84cbab2..e37d227dc199e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> @@ -259,13 +259,14 @@ static int guc_wait_ucode(struct intel_guc *guc)
>   	} else if (delta_ms > 200) {
>   		guc_warn(guc, "excessive init time: %lldms! [status = 0x%08X, count = %d, ret = %d]\n",
>   			 delta_ms, status, count, ret);
> -		guc_warn(guc, "excessive init time: [freq = %dMHz, before = %dMHz, perf_limit_reasons = 0x%08X]\n",
> -			 intel_rps_read_actual_frequency(&gt->rps), before_freq,
> +		guc_warn(guc, "excessive init time: [freq = %dMHz -> %dMHz vs %dMHz, perf_limit_reasons = 0x%08X]\n",
> +			 before_freq, intel_rps_read_actual_frequency(&gt->rps),
> +			 intel_rps_get_requested_frequency(&gt->rps),
>   			 intel_uncore_read(uncore, intel_gt_perf_limit_reasons_reg(gt)));
>   	} else {
> -		guc_dbg(guc, "init took %lldms, freq = %dMHz, before = %dMHz, status = 0x%08X, count = %d, ret = %d\n",
> -			delta_ms, intel_rps_read_actual_frequency(&gt->rps),
> -			before_freq, status, count, ret);
> +		guc_dbg(guc, "init took %lldms, freq = %dMHz -> %dMHz vs %dMHz, status = 0x%08X, count = %d, ret = %d\n",
> +			delta_ms, before_freq, intel_rps_read_actual_frequency(&gt->rps),
> +			intel_rps_get_requested_frequency(&gt->rps), status, count, ret);
>   	}
>   
>   	return ret;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index 2d9152eb72825..4324ccda667b1 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -502,13 +502,15 @@ int intel_huc_wait_for_auth_complete(struct intel_huc *huc,
>   	if (delta_ms > 50) {
>   		huc_warn(huc, "excessive auth time: %lldms! [status = 0x%08X, count = %d, ret = %d]\n",
>   			 delta_ms, huc->status[type].reg.reg, count, ret);
> -		huc_warn(huc, "excessive auth time: [freq = %dMHz, before = %dMHz, perf_limit_reasons = 0x%08X]\n",
> -			 intel_rps_read_actual_frequency(&gt->rps), before_freq,
> +		huc_warn(huc, "excessive auth time: [freq = %dMHz -> %dMHz vs %dMHz, perf_limit_reasons = 0x%08X]\n",
> +			 before_freq, intel_rps_read_actual_frequency(&gt->rps),
> +			 intel_rps_get_requested_frequency(&gt->rps),
>   			 intel_uncore_read(uncore, intel_gt_perf_limit_reasons_reg(gt)));
>   	} else {
> -		huc_dbg(huc, "auth took %lldms, freq = %dMHz, before = %dMHz, status = 0x%08X, count = %d, ret = %d\n",
> -			delta_ms, intel_rps_read_actual_frequency(&gt->rps),
> -			before_freq, huc->status[type].reg.reg, count, ret);
> +		huc_dbg(huc, "auth took %lldms, freq = %dMHz -> %dMHz vs %dMHz, status = 0x%08X, count = %d, ret = %d\n",
> +			delta_ms, before_freq, intel_rps_read_actual_frequency(&gt->rps),
> +			intel_rps_get_requested_frequency(&gt->rps),
> +			huc->status[type].reg.reg, count, ret);

LGTM,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>   	}
>   
>   	/* mark the load process as complete even if the wait failed */
