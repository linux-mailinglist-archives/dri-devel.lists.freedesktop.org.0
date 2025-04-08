Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDCCA7F95C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 11:25:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0CD310E1A8;
	Tue,  8 Apr 2025 09:25:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZDVZxifp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2D410E628;
 Tue,  8 Apr 2025 09:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744104339; x=1775640339;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=pTT4Ml9bb5XKFiQiU9ZBI/Orghx7e6/eU0FPAKm6sx0=;
 b=ZDVZxifp0SUFptvemGxc5Uri5b2q5rb7XvLv8oWzO6M1MrvjqZDPkO2h
 uZLsL04nyfK8EbwPeobE5TY4jjdmGxHdwzEnFCnpOHLjuLqSbBXtAWQxq
 9Trz6Pkm5eVw/LkvOxOedUha6g04dWOJm2CHn52nC730AFAIG0rkBNmfz
 2R7G7NI3JY3sTK7k+Uad3rauiHZe5sy5O0W4C9Sdth2cwBkK5giItffd3
 YiatWXq6ecV05R/lrN9SAIEbm6UnY6oHsMMdEjSfRYL2II/GrJIu1kdiQ
 PyWMlJp9e4mGo/2tZvB69+Wrm0faYtPN+LGlaGwBqP1PslLTLesBEEBE2 w==;
X-CSE-ConnectionGUID: a6bx9OqEQbGpkiIMQfyJvw==
X-CSE-MsgGUID: yMbcFEH+T/iHleyws7i+rQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56505548"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="56505548"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 02:25:39 -0700
X-CSE-ConnectionGUID: +SbL94xfQsqtasocl60HoA==
X-CSE-MsgGUID: fFXs07iHTYmmYHtT0v9USQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="129163247"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Apr 2025 02:25:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 8 Apr 2025 02:25:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 8 Apr 2025 02:25:34 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Apr 2025 02:25:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FY1myREoaD7UNEzfUPCcMs9ZrBhvEq8lEbKGgNPB9o4vJCSQgonmnx2YAxtHPz4NJEmpD/+4jSseg1x1cSPAwDwradQ40uSyFQKmTQTtGfX9D2+UJjAHDiwpgLg8BTMysBLj9URTmWNQ+0Hxw4WEG3WCPcrG1OjWRMpciAwCBEcyZloAXYQ3mxN6Cs29CF+kVV1KM1GzoPiW1TId3DkD0Vw3NfYdrryyyfSzHdG8ZhFLnGAQ8nMS1jqmBY8zuhUbFEC5Ajh9gKJXNtbMlrhx1NkxzOfBwE91s9SZElXv4D5VjXbJ5RjduKDBhB/GGsGzwy4jaH6CDDCt+7l9vhzceg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+tz2Mclp5Wr33uL0gdElWVWz13OVmnsT+nC8lZJ5AM=;
 b=A91Q0j0guMHgjnzZk/ACYs3cXc0LtzgYYekge+uRcdRQjzk1omDDtZzWRdUXVs50tjFCUxnD6I4clZF6fvM3RcCalhYaNfkdOrBThtft+K6IkITQogFj1qUYHVWRKffO95+M+HTTYSyHPugD2mcOk/sp9GyiZm9ELJ//07Q3xZJTA2/M4jjLmg/9kzFVcLSnllEp17QGg7s4IcGNqBKaOi32AYB4EEVV3jO3sjepeL3gJ2NxcHTXral//4NiarUxFosFvwwAa0ZP4mzdm7gOTMiZnD5nlHPD+QcaVnliCxcCu+vBFv+QI+bGygqpXGgBo3odUpSji3fkbXW+01tGOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DS0PR11MB8017.namprd11.prod.outlook.com (2603:10b6:8:115::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Tue, 8 Apr
 2025 09:25:19 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%5]) with mapi id 15.20.8632.017; Tue, 8 Apr 2025
 09:25:19 +0000
Message-ID: <90c6ea6d-c2d5-43f3-8ee6-fea6b14d9599@intel.com>
Date: Tue, 8 Apr 2025 14:55:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] drm/i915/display: Enable/disable casf
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
References: <20250402125647.361295-1-nemesa.garg@intel.com>
 <20250402125647.361295-10-nemesa.garg@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250402125647.361295-10-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::19) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DS0PR11MB8017:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a161eb4-0343-4be8-78b5-08dd767f47e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eit1cDlBRTR4aGRxS1U1STQrTms4Qi9zWFUyVUtsU29HZUoyWGw4cnQyWWl3?=
 =?utf-8?B?SzJBd2F2OXBscmZvTDV1aURzQ0ZkNHVBK3d1RWdOd2NIVDdaY01UWVFWYXkw?=
 =?utf-8?B?aUhHeWpjaCtSWGo1TE5TTVprbFBINmF5MFNwdVhnWEFOa2dZYmovL081VjRr?=
 =?utf-8?B?L3U2L2hOdVZNSFlSTkgzRFhkYlcxRTBaK1p3VW9NWDRrc3pWRjducytnNUFr?=
 =?utf-8?B?VFFoLzVoUG1EWmFLVHVMclpvc2RuTGdlV0Z6eW0ranBaWXRXYm5lbm94bzFE?=
 =?utf-8?B?cGU3QVI1aWFPbmZ2anEzbjdYR3gzdTBBQjc2UEV2ZlM5bDZsYWkwZ0MraXc1?=
 =?utf-8?B?bHFRUzlZR0M3aTh4SGJuS1NGVDdHcEw4Z2dHLzdZakptQ2R6U2FvVDNwUDJm?=
 =?utf-8?B?dkFUbThVNWxSZTdTZVA0VS9USlZSOE1RdDd3MzE5QkhobS9rU3VTdFZ3OFIx?=
 =?utf-8?B?UWVzY3FzWER4d0ZJeVVwQndhUWdUUE0vaVNMbHdkVU52Y3JIall0TFB5aWli?=
 =?utf-8?B?OEVQS0tVZVZ1RjFOVm5kSjk2QW44bmZPYlRZVEFDY0hqKzF6YnpXR2dqTDRT?=
 =?utf-8?B?RENuVkJSbHRpQ0NEQm1LT29kWlp2ZlZxR3ZlaXZZb0E3V3JUemsrVUh6Slp3?=
 =?utf-8?B?b25MYy9GRFVDNmZZeXVxUjEzRmJRVTNSWDY3OVNhQWt5K0RmZ0JiU3J1Vlky?=
 =?utf-8?B?VVdnWU0yTURTRU9sMkcwT2pUTHp6Z3pkTVlHK25yOXlSRE1MM1Q1dk12L2xV?=
 =?utf-8?B?NStwbGN4VWFKUDllQVU0VE1ibWkvQUxudEV6U0lCWkhuTkdBemFuYy90bzgz?=
 =?utf-8?B?NVlGUVllMlRpNkU3S0o3QmhYc0NkYmhKQXFWR1VXcWEwUGlaS0JTSGE1bGZN?=
 =?utf-8?B?UGxUQ2hlbWo0ekRsOVJVK2wyVWZleXRvQnMyKzFhWUIyUXVVeGxYWlNnRFI4?=
 =?utf-8?B?aVRFQXQ3a3pKcGtWVUhHa1lHYVJGOWdhdkRGaCs5V2VpOUR4Snd2YmpLb0Ey?=
 =?utf-8?B?TzY4ZHUvdDQ0ZkVqYnd3dk1nK1pZaHpHVldlUGlEM2pydklmbUdWL2JFUWs4?=
 =?utf-8?B?djUvQllvWi9NQWtHRUlFSmJLTGZZQnhNM0l0WUVvb0JaczlhMFNZM0lJS0Ur?=
 =?utf-8?B?QmFKaGIybzZueVNPakpHQU5oRWJsNGhKcEVoSEM3L0c3R1pibEZOLzV0WnZN?=
 =?utf-8?B?MytFQzBZWHhtYnNDc3paRTNMNXgrSlJMazFnMnp0alBUSDBROHJBbFFyei9p?=
 =?utf-8?B?UGJ6bXdyTTY1TUxhUHVGdit0b1NaRUlxSjRmcE9DSEpjVDBJWGdtdzVXU3cw?=
 =?utf-8?B?TDRLNEVwczk3Yno3UjVGVlNFeGdhRUtzRU9aOUs2U1Q2Q2MwbTFTMnpRQ20w?=
 =?utf-8?B?eTdYYnBtaUxYOXdqRkd1TXQ0cWNEdE1PbEFDcXFwWUljc0tScHR0TzByTmZR?=
 =?utf-8?B?WGJBWkFyNW9taHZMZjE0RFo5czNUTGsyS3hiUXV1STBHUVpydjRZN29uN3NY?=
 =?utf-8?B?ZEg2U2xmcElHdXB1SzhMSys1TkpVTTkydm43bzdDaU5JRlNaMm9JUkY5cUYr?=
 =?utf-8?B?TGlSMStZdWdzV0dxNWV3Q3JZNGpBSzhEaU1jd05RMkVxV0FlVUtyVW5XWkZ5?=
 =?utf-8?B?WmtjMW12SlJmZllhQlMrZytCcUVSajBOY3p3emJIU0dhZEloR1c0SXlFUmpY?=
 =?utf-8?B?dGxrSWZxTEp4aWNES1Uvek5wcG5xaHpvd0grVW0wK2xQc3JFYVlCb3ExUmw4?=
 =?utf-8?B?ZGgzSFgrQzJVTDRES1cxSm9tS1JUUUtUOEdXVzNXa3JWdVBEVktBeEc5YmZ5?=
 =?utf-8?B?ditXSkhsU1E3b0IzckZvcGx3Mm9aWnhNSlFoNUdZSVR3eGI0S3h1SHNkMUZM?=
 =?utf-8?Q?VFOxkqDQIiadc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTQrb3R0b01Hd1Q4dS82TmdtRk5vWXlUOCtiSEV0em53UTlLa1A1akFmMTU5?=
 =?utf-8?B?SGk2UFZIeFlDNDRzQjVoaDZYU3IrN1B1Sk5OQ0pKa1prdXV4NXVPTTNnaEZ3?=
 =?utf-8?B?NDdmelFLTURxbkRhY0xLK2NTRG1CZ0ZNUGIwcUtucWg3SGtodDVJSjhKQ3Y3?=
 =?utf-8?B?VnJEdjBMdHVjY0JxMksxclNTek1LVnFTNHM0OWN0b3lPaHlkalB4dDdCQzZ1?=
 =?utf-8?B?bGMyNEJwMVlUWW1pK0tzTG5qa2pmTTBLdE9yTmh1T2I2dUhVYVh4VU5qSlN6?=
 =?utf-8?B?S2VWZ05sUzZmVWZqZjYrSU15ZFJZcHRjSVNkcWM3MUJWMjcyMmduS1Nudno3?=
 =?utf-8?B?TDExMmJJQjZtai84WmxHaERsNGZqMnVZSFBhUTR6UVhwbHdBRkpOY3dtNnZs?=
 =?utf-8?B?ZmpnOHFwaDZvVS9QNC9lSXlMUXBBQ1FyZWRLMTZ1WVNxZ1BEV3h5cGNpT1ZH?=
 =?utf-8?B?cmo5OGZQS0hQUnpOWU1JV212S0FGeG1PY3QrSW1CSHVKVm5teEF6dThKSDdR?=
 =?utf-8?B?MTkrYUNHczFMWHVLNHVIblNEZDI5cmI5K3I4OG5IeGVScnFSdXBKTThyUzV2?=
 =?utf-8?B?SW9lQ0dPMWVtdVBidm0vdUVOQlZjTUh0RW5aN0lMeHFmcWxYeWlOdXRqeHUv?=
 =?utf-8?B?QUpMVEtFNWN5bXRKUzhsZDdoaEhGTmszUmFHTk80S2s1UGpZYUwwV1dFalJu?=
 =?utf-8?B?UDdmNDBiRGFkNHE5a0pkVEQwbW5XWDhSR1BLVXZHeGk5V2tvT09iYjR4Z0t0?=
 =?utf-8?B?dVBqLzMwL0lmTXFpK2FQVjZPK1lrY1FDbkJpYW05TmJaR2FKbDRXVi9iRmx1?=
 =?utf-8?B?L0o5K2lQa2ErT3p1eXBsWG5hcmFiUUx3QlJRSW9NNDlaU081TWplQjRJaWJx?=
 =?utf-8?B?T3haY3piNWVWZmRXVzUrLzUwSS8zUUlqOEQyWmZIcjR1cWZ0MXRRTDg0a2lQ?=
 =?utf-8?B?UGhNVDcyYURTcTI1NHkrMFA0Qk92eFQ3SytkTHM3RFh5aTllalUxT21LcmxX?=
 =?utf-8?B?ZWVNTS9IREZkU3VPV3JNb2lFdnJIR1ZkRXFJVFY4cUdNa2xjL2FSYWQ3RmZI?=
 =?utf-8?B?aVpZSnRHU1llVHI0Wk1aSzQrWkMwSmtyN3A0SEJBK2tpZUdIanhDMkFwRFVp?=
 =?utf-8?B?YzYvOGNUSjdCNjQ2VHJSNXJkM0s1Nnk1V2s3TEpiMXIxa2lKZ01XdStTbi9s?=
 =?utf-8?B?YjhOcHVkQ3Q4elBEbzJ2Y3NvZTU0bU5TWEZOaGlzbmx6WFpPUVZmRjBqNGh2?=
 =?utf-8?B?emZyWTVhclVnRWllZkgzb2hPL2hyeGcxMDlBS2RTRkJIVnU5OUQ0SUxiVXlY?=
 =?utf-8?B?d1FaSFBrZFVXUEFFL1pvNmVqN3VIdUV1V1pyaWh5SGRrN1hCS2FJSS9Va0Vq?=
 =?utf-8?B?QitCVGlyNm1VT25IdlA0NXZsYUlLWGVGb0p2bVNuZTVxeXNDc2Q3NHNkOUdL?=
 =?utf-8?B?V2w1M0hUUnR4b05MbXAxYk9laE9PZ0k0ZVBaNDcrNFBGQVN6QVJxdEd0VzlW?=
 =?utf-8?B?MWlqMHJDOWlnY1doUmxpOUEzWDRSM2xJVUxUUCtiY3ZnaEdTQ2x5eXJNYmhv?=
 =?utf-8?B?L3FaSElmanJpU0JFa3JTbldrY3Y4VXYvdDdpOHg5aE9kNGVtZ3N1NHFwNC9M?=
 =?utf-8?B?TmNNU0haZ0x6ZW03SFRQWkx0V1hkcGNvQ0Y0cGFnWlA4NzFFVmhHREludjZr?=
 =?utf-8?B?Ym9DaERIUjhWU1dRa3FTVlAyd09EMDJKZFd4SmJ0SzRENDQ0SVJWNmJUUFcr?=
 =?utf-8?B?TzB1VmNrSm5KeVhBQnBPOVFTcWdUZ0lkbkQyWDFLS2JsVXgxUlNSdGpPSHZm?=
 =?utf-8?B?QzF1emhyczRYNXJwelRjWGFkc3o5NUFIUmVtQzVsR3FRWUJmRm1TRXVUeFdW?=
 =?utf-8?B?ektOU28zenlJN1UvME90OTM5aWNFUjRGa2ZGRUFidTdzWGZtdDVMYUUvQmNI?=
 =?utf-8?B?U1dvTVQyMVhwUVNwVDV5M3pHcU5HQWRhcGU5cnNqblBvclRQYlBZOFlUaFUz?=
 =?utf-8?B?ZHlXS2FVeitnMzZWZUQ0VkxwTmY1cUZjbXNXKzJCNk9jcEpJUFoyTFdtcDNG?=
 =?utf-8?B?TW5jMlNzUWhldkpqTzVicm5kSkVmZmFaK01kOUNnTHBWVzBENkVWUjVGeDM0?=
 =?utf-8?B?REtiYXN5ajdEVWVCMm5oblFhWnRYdmZrazFHQTZGY045OVJCTFpQZm1oQ0Jv?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a161eb4-0343-4be8-78b5-08dd767f47e8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 09:25:19.7819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nun5380ORU17WzDKtUEzNk97Wq6SLv+L7XGnwIA/Wj3jqCskV/ptOSa0sydGhTTk4dAOu3vH72j7IA5JkhiCAaWT8DwhtMY+b6aqGSlcnes=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8017
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


On 4/2/2025 6:26 PM, Nemesa Garg wrote:
> To enable or disable the sharpness check the
> casf_enable flag. While enabling the sharpness
> write the programmable coefficients, sharpness
> register bits and also enable the scaler.
> Load the filter lut value which needs to be done
> one time while enabling the sharpness.
>
> v2: Introduce casf_enable here[Ankit]
> v3: Use is_disabling in casf_disabling[Ankit]
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_casf.c    | 27 ++++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_casf.h    |  2 ++
>   drivers/gpu/drm/i915/display/intel_display.c | 26 +++++++++++++++++++
>   3 files changed, 55 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
> index 91ed12210e60..ce2f7fed33bb 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf.c
> +++ b/drivers/gpu/drm/i915/display/intel_casf.c
> @@ -251,3 +251,30 @@ void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state)
>   					      filter_coeff[i]);
>   	}
>   }
> +
> +void intel_casf_enable(struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> +	u32 sharpness_ctl;
> +
> +	intel_filter_lut_load(crtc, crtc_state);
> +
> +	intel_casf_write_coeff(crtc_state);
> +
> +	sharpness_ctl = FILTER_EN | FILTER_STRENGTH(crtc_state->hw.casf_params.strength);
> +
> +	sharpness_ctl |= crtc_state->hw.casf_params.win_size;
> +
> +	intel_de_write(display, SHARPNESS_CTL(crtc->pipe), sharpness_ctl);
> +
> +	skl_scaler_setup_casf(crtc_state);
> +}
> +
> +void intel_casf_disable(const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> +
> +	intel_de_write(display, SHARPNESS_CTL(crtc->pipe), 0);
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.h b/drivers/gpu/drm/i915/display/intel_casf.h
> index 026a2b8348df..301a9fbd930f 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf.h
> +++ b/drivers/gpu/drm/i915/display/intel_casf.h
> @@ -18,5 +18,7 @@ void intel_filter_lut_load(struct intel_crtc *crtc,
>   			   const struct intel_crtc_state *crtc_state);
>   void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state);
>   bool intel_casf_needs_scaler(const struct intel_crtc_state *crtc_state);
> +void intel_casf_enable(struct intel_crtc_state *crtc_state);
> +void intel_casf_disable(const struct intel_crtc_state *crtc_state);
>   
>   #endif /* __INTEL_CASF_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index db82da523323..c75dbd0ca329 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -1036,6 +1036,24 @@ static bool audio_disabling(const struct intel_crtc_state *old_crtc_state,
>   		 memcmp(old_crtc_state->eld, new_crtc_state->eld, MAX_ELD_BYTES) != 0);
>   }
>   
> +static bool intel_casf_enabling(const struct intel_crtc_state *new_crtc_state,
> +				const struct intel_crtc_state *old_crtc_state)
> +{
> +	if (!new_crtc_state->hw.active)
> +		return false;
> +
> +	return is_enabling(hw.casf_params.casf_enable, old_crtc_state, new_crtc_state);
> +}
> +
> +static bool intel_casf_disabling(const struct intel_crtc_state *new_crtc_state,
> +				 const struct intel_crtc_state *old_crtc_state)

I think there is typo here, we are passing old_crtc_state first and 
new_crtc_state second.

Missed to point this earlier. Need to fix this.


Regards,

Ankit

> +{
> +	if (!new_crtc_state->hw.active)
> +		return false;
> +
> +	return is_disabling(hw.casf_params.casf_enable, old_crtc_state, new_crtc_state);
> +}
> +
>   #undef is_disabling
>   #undef is_enabling
>   
> @@ -1185,6 +1203,9 @@ static void intel_pre_plane_update(struct intel_atomic_state *state,
>   	if (audio_disabling(old_crtc_state, new_crtc_state))
>   		intel_encoders_audio_disable(state, crtc);
>   
> +	if (intel_casf_disabling(old_crtc_state, new_crtc_state))
> +		intel_casf_disable(new_crtc_state);
> +
>   	intel_drrs_deactivate(old_crtc_state);
>   
>   	if (hsw_ips_pre_update(state, crtc))
> @@ -6718,6 +6739,11 @@ static void intel_pre_update_crtc(struct intel_atomic_state *state,
>   			intel_vrr_set_transcoder_timings(new_crtc_state);
>   	}
>   
> +	if (intel_casf_enabling(new_crtc_state, old_crtc_state))
> +		intel_casf_enable(new_crtc_state);
> +	else if (new_crtc_state->hw.casf_params.strength != old_crtc_state->hw.casf_params.strength)
> +		intel_casf_update_strength(new_crtc_state);
> +
>   	intel_fbc_update(state, crtc);
>   
>   	drm_WARN_ON(display->drm, !intel_display_power_is_enabled(display, POWER_DOMAIN_DC_OFF));
