Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 655C7A837A3
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 06:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3D210E2A3;
	Thu, 10 Apr 2025 04:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IGYMiXr/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5498810E02C;
 Thu, 10 Apr 2025 04:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744258180; x=1775794180;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UgPWrTT7Dfq4qlZASGxWTlYMXNHZFNrVpVJs+Gj7BuQ=;
 b=IGYMiXr/jHbQetqwJyzXRuu353UN0vhHzGg+4DoeQSoRfLhzijIsUojj
 Aealtg9ZdSzEt37QrOjaM/Jx8ynjMcrMBzl/Ab0KepKBSzCiKLduuLcf6
 70GB3nnEG00mG6Yxvqmm2ebU9zBQ0emc4zZz/9SkdRuuPc3mg2tGltNhQ
 3IUXfYi1I3MFo+z/KCFErpI+Y63U2CH5X4DktWmHQSDOlOfAm71gAnQqt
 axF0xMZaWok1VBB2+6Ykn4g/Dso/tfa+RYxddu2QQ8VxuJwSpoj8LvUPD
 YyOIOU56mb8nqfe5125VIAcffMr8QVJAO1GGYwiYuzLjCHDKowlB5zGSm A==;
X-CSE-ConnectionGUID: Me4i6Nk/RQ6O5R4Y3iMZCg==
X-CSE-MsgGUID: W2MfWWvvTgWmTu5o6QR6BA==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="49597832"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="49597832"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 21:09:40 -0700
X-CSE-ConnectionGUID: QG/E7mU1SKu/hrBCYjUYGw==
X-CSE-MsgGUID: 9X83D5txRNOLrq/ZPBVyAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="128756674"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 21:09:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 21:09:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 21:09:39 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 21:09:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pzqpM4XMkVgzZ+5IgvUGq+wReLl+RVORQFjwC8zDqwkS269FmlLutbJCthgkcVM1U/rG8MhiBL6ZON3p2+TKdCQ+Rpt615Fd9VA4vpUF0BA1/n5wNFRcRR/iwhbVU5poeIfvXQAf9gkQfC7TcWJXfJTTVlGen+xLANvbbxNhSgjY4KtS+AF03kHLWmBnt6oG/DQXEgv0WQSWYehgTZkBX3NSzdNxYiNfWlJhd5ZqhGozOJV+agEGRPehFtqnZKzWGOydVze4tjv3WmLr0ML/Eiq5ghgtMbgegLJqB8SjQ3xhEhniqTRq4B+mvkUEAhb6iiE1j5WawahleoPxRo4IaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VGCKfLfOLKyxSAKZKpBvtPhDQ38diJv705bQ8qKIzMA=;
 b=ut74LevllwbOy/5ByiSeqb3lnI//7WmYGdgGe0xhcnkqC3u32IzzAtcCscmEi3KEv7NnaTA2Hu6i/YzezISmOa4ieVVJUGWaGBVVr8dGwIe7mC0FYC+tVwKstrGhaNSk8jBbzJhIiquxr5FUoPRtI6a1ZE82D/FW+cHqqlE3yLMsPWDPwz8wmalCu3WTwWa04zxV9LNVk3+p/rLsRIvR8C2cyF0njG/LgBmq4O8JrVazYBMWCynsvsrLzFrBzib3sKi4sAVxFsccrQubzYMGjqG+VrCZ6trjRIEzCs5Emxgz0z2NYFZ7C8w1PmF6mcoZoYvhLyOUKB75QybnqpFwng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by CY5PR11MB6233.namprd11.prod.outlook.com (2603:10b6:930:26::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Thu, 10 Apr
 2025 04:08:55 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%2]) with mapi id 15.20.8632.017; Thu, 10 Apr 2025
 04:08:54 +0000
Message-ID: <85699642-8c12-4bba-b2fb-ecabb00060fe@intel.com>
Date: Thu, 10 Apr 2025 09:38:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/i915/backlight: Modify condition to use panel
 luminance
To: Suraj Kandpal <suraj.kandpal@intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
CC: <ankit.k.nautiyal@intel.com>
References: <20250408050138.2382452-1-suraj.kandpal@intel.com>
 <20250408050138.2382452-3-suraj.kandpal@intel.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <20250408050138.2382452-3-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0176.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::11) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|CY5PR11MB6233:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ef9bc63-8fe6-4115-56c3-08dd77e568d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFlqTjFscmw0T0I2d3lGbndzS3RQUW5WaXZoeUl3a3lndjF0Y3RCUHE4aUNV?=
 =?utf-8?B?QW1ORlFSTDJ4VHBGUmEwOGk3Q3o3WEpaTzZNcHpGeTFWYnNEZ3R0dVlxZFBO?=
 =?utf-8?B?TFcwY1VsdEZjZjNOeGFHLzJxZm1Gck00b24wUzVycGtDRUZMT2hBWHpkLzlW?=
 =?utf-8?B?MUt4R0VOTzdqYjlGSkJWVmNobjNpZ3VQcFRBQU1NVWJpUGpYK2hzQTdrSndo?=
 =?utf-8?B?dktaQ2RDUEp3NlpaaVlhTXR6b0EyYUZCbnMzRVFYVHFsN0pLVTNBVlJoZmFm?=
 =?utf-8?B?ZzdnNk44SmVCMmZza0l1anRwT2xidFU4VG5JNW1jWmhUNnJzRy9LNTFnRWJB?=
 =?utf-8?B?UHNoY2F3RXVaeEUvTGt4NW9FRVhwaXFmTHVETk1XNEF0b0htNEFUQzVLZk5L?=
 =?utf-8?B?N050QnJKVU5GaXJ5SFprYXd3M3ZnR3JPeS9GTldjMlZ1YW0xV0puQlRzcEs0?=
 =?utf-8?B?MlAzWHlMaUpPNExZNzF1UmllNUN5MTEzNVpFbjUzYnRHdzBncXVhZm1RTUFn?=
 =?utf-8?B?L1gxRU1RM3FZREhmTmNXcjBBeTZRY3B5cGxGRWgwWG1OaURyUldCZ3BtcFhD?=
 =?utf-8?B?dWtsb0pVNjZ6S0hTb0owR2hvTDczbE9WdFZya1p0d056L2JtT0VrRjlWUExs?=
 =?utf-8?B?VjN6QWhkT01BNXg3bEVxUWRyTGZGeVdYbUhGWlJHdmQ3cnY4TUNBYVdpSXJ2?=
 =?utf-8?B?U2RkV3g2MGNCdWtlZGd0bzM3cjNkak5MN01oWUNvc0tjRDcwcW5wck9hcVlM?=
 =?utf-8?B?RWxwT3Fvd09FSkxYbDZocUhybnlYVHRxVWFwWXczbnJDaGJ4MzY3UURhZTlu?=
 =?utf-8?B?SFJVWFBRVTJFTmlmN2ZscTd1VmVraXVjc1N3OEhkeldvQnRPTGRQZG9FTlZj?=
 =?utf-8?B?bkwrTXh4dGxwTnNKVGcwem1aOVRKQ0FrTTlESzBHTzI4a3FhV3Robjl5azZD?=
 =?utf-8?B?N1craThxSkdFUmtqZWhLMlFDVDUvSkhCQ0lzQlhxZzZtY3lwMTd2OXJzK3ZV?=
 =?utf-8?B?RzFKa2p3MjhsbWM1UHptblVwL2I1N0VQVXQ2aE5BZ2laWEJEcnRacFgyWVBi?=
 =?utf-8?B?dFdiODJFVEFjcW8zUjRKckY3eWIwN0picnJzZWV2OVRLY0JreERvZUpVTE51?=
 =?utf-8?B?eTBxd2U3bnErMDBlc003ekVtRE5OVjVyQXdTdnNQWTZGeWJZSy9GSmtMWFdT?=
 =?utf-8?B?dklkOGw2L0RPaEdLK1RUdzFoWVhEMzhWWTF2V01jME94VC9tSmlCUDJ4MTBy?=
 =?utf-8?B?UmpEY0dvTGZpZmNlbUN1TXF3cVI0czVIWEZFTC93YWtmOUFSQmFuYWMyUTFM?=
 =?utf-8?B?RDR0amlUUDdjOVhEbGJhUjF5OWFGQzRXRmljTm4wVHlEUFhITU1ESktPR250?=
 =?utf-8?B?aVVMRkF1WkZzb2s4bVRtQkp2dnZPVTRZTkxRTWRuaHNRaWZjS2M1Qk1FZFk2?=
 =?utf-8?B?YWNEck5KeGlDTDZqeEplUCs1elk4ejVTdHJNVitQRnR2NFd6UXZyUjU4NmZR?=
 =?utf-8?B?MjNTSjR4dCt0bi95WGVpYTRkT0wwYWk2WmNkamVmQ296WTVKYkRnbWFxNGtu?=
 =?utf-8?B?YThsSys4ZVpNSlhBdXp0eE5ydEFyRHN4eGVtT2F5UVZhVjMwR2RWRW9NdEdE?=
 =?utf-8?B?aDUzRVB4YU41Vi8wTUVpNkhiVTFRSkkwQXpMYlVseWhwTkVyTjNLTERHQ1k3?=
 =?utf-8?B?di81S2FaL1VCZGZpd0hpT1JxWHNsYVoxaGJ6RlhxcHhnUnRhODBWTDREcGJa?=
 =?utf-8?B?aEYyWFRLOUFud01sekdXZXdXK2E0ZXNMMFptVzA0NXpGcU15L1hLemoxaE5r?=
 =?utf-8?B?WTZvZUdzbnFYKzZsL1Z0bjZRQU5XekF6cFZKeEQwSzdHdWFTQTF1ZmJXTTFp?=
 =?utf-8?B?clo0VFZXSEViZ25IeForSm9qQUZtSDM5NmN1MGdDOVhBNW53NTc5Z0drK1Ra?=
 =?utf-8?Q?gNUE7knhhmQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVZNV1d1WTVvMDA3ckFYaVQwKzV0Y0doV0Z6OHZPZ0lZMUdPeDZ0TWtEV1NP?=
 =?utf-8?B?UXF2eldZNCsyZURTOWJEWkJTbkY2bDJCdFFwaCs5SUtuc095MFVjUUl5VitB?=
 =?utf-8?B?MFArSXpVQmRrSU1OSktQN29pMitxN3FCbnJ1Y2hCQkVHUlJ1L21xMTNoSVRR?=
 =?utf-8?B?RFFGMERLdmp0bzQwT0xtN3pabmMzT3ZMVTJnN0wySzl1TTcrZWNhZlRiTURF?=
 =?utf-8?B?bGNqZ2ZaejV0MTBYd2NLMCtvZHF1TUlVZ2xMK0ZqbnFoZ2IyMU9mL05MOTRq?=
 =?utf-8?B?TVRhcTF6YWJza1g2ajVpTitvbmFZdnM0NUlPbFUvVDdMekMraENvMzhoMGtF?=
 =?utf-8?B?NXdQSnltK3VKVFB5T1Brc1BPNEltYStvZmNveEI1YmVjOFQxQ3RwUUhFR3g5?=
 =?utf-8?B?YWlSeC92VkZqOGF2ZUxrUXRlUGhQQkYzcGg2bDhMa0dLSjNTclM3VmV4M29o?=
 =?utf-8?B?VWk1REw5UHk5eE4zbGUyOGxNdkUvcUxYaXVpamNMMU5oUGR5THdPZGJDbGVy?=
 =?utf-8?B?dnVBNnVJekxYZUZjK21DbWg1czZaUlpxYzhBOHlDRHJYV0dyN1U2alNxdTRY?=
 =?utf-8?B?NnU3SEM0TkpmcENjN0kzdjdmMkJzc3BBb3V1S1NjTXRHL1F5WHRscEQ4TUNJ?=
 =?utf-8?B?QmZxeWtqVm9tMVZmdGd1WkU1eHJnMENZMG5iY2ZyYjNZeGxBeVVWcFgzTlNY?=
 =?utf-8?B?SEhudEVtN3RHNU96Sk1Ca0xyRHBzeUsxNmlLTjFjMzZHc0ZlRk42QTBRUDdR?=
 =?utf-8?B?Wm9GS3BKaWVqTnRDVFhNL2lDa2h2VFJ5cjVGSEpPSnBoaExyamVqRFpadXAw?=
 =?utf-8?B?VkdTWnFCNmM2bFB2MWRxZXY4V3JxQnA1U095YktVNlFQck5yclpoVUoxbDFh?=
 =?utf-8?B?Vm43Q3lMbUxUSGJBTG9NSHlZYWxOU00rS0M5V1JPS3lwMEI0S21qSnF4ejF6?=
 =?utf-8?B?blpKdEk5R1VjMUpyOEUyK2UrUm5pTDlJNk1LSEVvVlI3NzNYZitMOVRaL3Ri?=
 =?utf-8?B?azJScWlxNzAxc3ZyVUJBN012a0U3Y0tiL3phelVYUDROT2tHNWtpZWpzZzlz?=
 =?utf-8?B?YTlGT3p5Uyt3dzhGUWp0eGVsUkllRjJWcytidkNrYmkrZEkxb240c0dnNWU4?=
 =?utf-8?B?KzVvdFNHb0g2Tis0ZDlJaFFWTnA0b1U3YlZBcnBXS0RHZkYvZm5nOExLeG8w?=
 =?utf-8?B?WFhEVGZEMWlsemhlY3EybmxmZlVDRlkyS0duQ25wb1RlMlZzRU85bUJnellz?=
 =?utf-8?B?RTdDV1VqNHpiVnZ1YTBUQ0hWaWROaGJybFBMdXNxNDlENVNOM1l5SnhmL0Rp?=
 =?utf-8?B?K2JLTXNvWmpDZVVnQkdXeTlHMVY0aEx5UjZqUjNCMm9hZU9tRnhGSVNLWiti?=
 =?utf-8?B?N1RaQnJUY3JSV0FSTU5QMXJTRGI5cEJvZVVQYm9XOThrT2lzOXNlbzJWNmNh?=
 =?utf-8?B?UmZReUxoa2JBckQrSnZVRk50U056Y1BOMlRHVUJXWFN6NGVxNlJWYWg5SFpG?=
 =?utf-8?B?UFI4Z3VzSVV0a29ZblpjL2s5bzhGWmlTeVZ1ZkRRZUI4anpNS3llRWo0dmJB?=
 =?utf-8?B?a3k0endCT2FmYXVhYnJETVZVcUJqRXVZeldMb3E1ek93dFlJc05LVDlnTjg5?=
 =?utf-8?B?bU82YkVlVTZQR2tnN2FPUEg5SWRRdVlKb0tkcjVVQjlSdlpRSFp6RnNZNlcz?=
 =?utf-8?B?c1A5WFVjMSsxNVNpSEJvYTZZYWxpNWlCV2VubGt5NGo2U3BqOCtCa0w2ZDR6?=
 =?utf-8?B?M2RubmR5eEFIOWRua1pvZ09ENlN5NHB4NUtKWlUxUDh4QTU2eXI0UEFpcHNj?=
 =?utf-8?B?SXl0VExndXc3L2lENjREVitwdUdEVnlIbmhFeUF4NUNDZFFjRVkrWWpaYUtn?=
 =?utf-8?B?N3lWV3ZvUll2NndSTDRNWld3V1FMYVo1Q25KWFk4NkxvOTlpZzdTSVdEYVN2?=
 =?utf-8?B?SHJiYTlQRUpGU25DOGtsdFpuOFNQL3FMWTRIbHRjeWp3Q1l4UXpXL1BoQzRJ?=
 =?utf-8?B?SU00bVR2VmZla29OWUc1RlRPK2JVNFhGaTVQbm5sNlFIQzhyZ0JocU9ibHpP?=
 =?utf-8?B?NjdiNDJRT1NpVWVQZDdDMFBBVGZ5R3VmRWxlM2hmUUZxY3kvdGRhYnlJdUk5?=
 =?utf-8?B?eXpnQllSVTlXdGxSMXNJeUNoTVh2NFdUcVZjTHg5QmpDQ0tRaUtWbVQvV0Ix?=
 =?utf-8?B?eVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ef9bc63-8fe6-4115-56c3-08dd77e568d2
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 04:08:54.9259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +VvRu7IC2lzLmtK5Ocmj1EvJgtkSUUxbEDpig+wLy7xHRff6RZg8WybrEJgbOK3Vw6yZ97jo9qiQCA/bCBSi7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6233
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

On 08-04-2025 10:31, Suraj Kandpal wrote:
> According to our internal spec we need to now check if both
> panel luminance and smooth brightness are available in panel for
> us to be able to change brightness using luminance value.
>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---

Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
--------------------

>   drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index 8173de8aec63..20ab90acb351 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -663,7 +663,8 @@ intel_dp_aux_supports_vesa_backlight(struct intel_connector *connector)
>   	struct intel_dp *intel_dp = intel_attached_dp(connector);
>   	struct intel_panel *panel = &connector->panel;
>   
> -	if ((intel_dp->edp_dpcd[3] & DP_EDP_PANEL_LUMINANCE_CONTROL_CAPABLE)) {
> +	if ((intel_dp->edp_dpcd[3] & DP_EDP_PANEL_LUMINANCE_CONTROL_CAPABLE) &&
> +	    (intel_dp->edp_dpcd[3] & DP_EDP_SMOOTH_BRIGHTNESS_CAPABLE)) {
>   		drm_dbg_kms(display->drm,
>   			    "[CONNECTOR:%d:%s] AUX Luminance Based Backlight Control Supported!\n",
>   			    connector->base.base.id, connector->base.name);
