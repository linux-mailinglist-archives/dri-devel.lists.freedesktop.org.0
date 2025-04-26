Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0F3A9D984
	for <lists+dri-devel@lfdr.de>; Sat, 26 Apr 2025 10:54:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F0C10E210;
	Sat, 26 Apr 2025 08:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eGGdQJsu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D38810E045;
 Sat, 26 Apr 2025 08:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745657656; x=1777193656;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=qxbjbnmWVw04AvBcJstLh3yX2u+HSxVYYzvRH4mny7k=;
 b=eGGdQJsu6FMuypBJ+ZUpgngbqEv7+IBErvUBLzrPPbVtmEe+yoiuTZXY
 wcY1Gq/nn5s0BZ7RhOSdRFBOuZCv3peTJc/DBzF/CdRw4o5G6mVRsUN2v
 gPOJcdv6OK+hFQ8sH6p3PeXa0wL3r78Qjcwi/Q27IFAEGhwmdQa2RXDLM
 eMmgomMB5ql+b4D0q8Ml13MUiVvGgOkW26QP6CT3Trsq/MgxL1Uc4j9Bd
 lipdbzhVkH60KfVglDbLy3STPOnUQCOTeyiHVRHC5F8istyGXaAPEZpdV
 KRjQVc53Bl1u1elPpDgAxvb0Ab8amsNiptNEQCXowxE0zuZxOEUh0UWFS A==;
X-CSE-ConnectionGUID: EuGJkz1FTSWTymJWjPFxvQ==
X-CSE-MsgGUID: BUHVElMSQu+awKbAggxLFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="47020711"
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; d="scan'208";a="47020711"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2025 01:54:14 -0700
X-CSE-ConnectionGUID: lcAssD4ARJq9bGVZdmo2UA==
X-CSE-MsgGUID: w+C19vPqS1m/SyARFBeKCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; d="scan'208";a="133405080"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2025 01:54:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sat, 26 Apr 2025 01:54:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sat, 26 Apr 2025 01:54:13 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 26 Apr 2025 01:54:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RKrReZQkYcnEc7HRRbkKzGYhXn6AtNuJ+C87p329no+BUX0ODIMfY6J1PeCCXZS7WkiR1rYC4EjdSrSNzA/3UPWMvFZMKAUTvmSVzQquO6/qXxzXe5icia/fMpi6N/6nE4+NJJYtNA/8amXG1ef/Ak+th9ihmlZosW4mBiHCQGfF9gNvEIlBoYrv4uDMR8aiaeanZM9Yf4xtLRCnOrDOzxvDOpNkqd5NqRqEiD3Kg36TaOAA+G374SLHznhtwLs/JRQyofMu4J5HxVCHAWTYJCDJTjlprSLeBoXDJQo3Rxf5KEOT17txWnm4UwISfayXkD/9FCYU07Xv8sH+FS35lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0lxnnTVWquPTTt1uCvwu3TSr8BFMQLi76CThk0HK3Y=;
 b=yUVUmSo7lj28G5zWrr69j6+RqoHEtR/3VxuUbvEj87ZixWVVctMuOexGtm0RBd2sBrGU+Z4iasoey33N+vycd/HwZpRFgal4JvJpMWJTqaS7Alqs/emDVBfFCZAS5wVGVFqIDVJM6kpKA8aTw3RfYby2PmnvAih9V7amUioVfHsM4INCgh+Th+9Y/kuXc04drnCiStORKPfYozBu1IYhQqxCieVh+27X6ukbPSxIMB+wzdY2D6ufUd8wnbeEDnmTNI8Ufy86Hj7aOb5vsClbKoxrMF0uhthWyrzGRI9dd6mTCBRS3KiYx26bfXQlkmoKZyGnEbp70xnpmz6YNzYyFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by PH0PR11MB5157.namprd11.prod.outlook.com (2603:10b6:510:3d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Sat, 26 Apr
 2025 08:54:11 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad%7]) with mapi id 15.20.8678.025; Sat, 26 Apr 2025
 08:54:11 +0000
Message-ID: <73d41816-497b-479f-8c85-2ba0a887ad46@intel.com>
Date: Sat, 26 Apr 2025 14:24:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/slpc: Balance the inc/dec for num_waiters
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20250425215118.3035166-1-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <20250425215118.3035166-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::11) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|PH0PR11MB5157:EE_
X-MS-Office365-Filtering-Correlation-Id: c3646489-031a-4f73-f161-08dd849fe960
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YkYxeEpPSEpjZ1FVVEpZclA1QlBGSDJCUHVvc05SZnU2YjJaVE5EaEMxeGVj?=
 =?utf-8?B?TGpaMktoSWFsTFhpek0vY2pWdXBuQ2pWakJ2Q3lSRUVFZjMvMTNuYWp6SGx5?=
 =?utf-8?B?bWp5SE54R3hMTTVVTXpZNDhXbDQvbHNZNEZxTjN0cmxiNG1STUJlNXk4WFNj?=
 =?utf-8?B?b29CdGIvNVJPYUlaSitvbVE1d3UyOUppMzhlL2hOVVlxazlKeTJBVS8vWFBn?=
 =?utf-8?B?Q3NYdEF3ek1HWUc4dmFCUnN1RC9LdTZWOTc1NFVjWXBqU3BxQkd0Zmlydk5B?=
 =?utf-8?B?RFFzMW9CTGNFeDhlaS9GeFpNNUVsVkRYY3YyaGpEVk5nRTRBRjg5R3c4YTQw?=
 =?utf-8?B?VWUwNXd0VVhXNFRUYmRmMWd1ekd4WEl0MmpYNmpZeEx6aVprME9UbGVJQnQ3?=
 =?utf-8?B?NU9EaDM4cVFwbUNWSTRjMEpnWHFtd3Fld2pURTBlRHhIbkNPd3NEZ3laY1kv?=
 =?utf-8?B?QXBCRnI3VDljUWczajcvQXdIcEdqVVRieHFJU2dTaTM4aUZjTFBUKzNSOXZI?=
 =?utf-8?B?czcza2JHcy9OQkVaWUlrV1dZK0R0QjJHZDFhV3hiREx3TGlUMmVyWnUyM0RM?=
 =?utf-8?B?TVkxdFhmSHhpZTRkWWUybTFnMkdDc3VIcmtKQnRTYVMzcXJYN2VLc3FiaUdJ?=
 =?utf-8?B?VDBtRXhUL2xWNkVCQUxydVZEK3N3ZTk2cHdQL2hZNmE2VTFSUHlPT2JpaHBi?=
 =?utf-8?B?Z2RzVnozMzhSQm1nM0I4RjhQR3ErbVhmM1BDRTBUdnZoeERsVFFGRER2SXFN?=
 =?utf-8?B?OVgzY2FMdk85WGM4ZUd6d3RPMjE0THQyVysyc1o4Tmd3QU9oZmNMcHQ4QUxC?=
 =?utf-8?B?TzJLQTIvK2tCOE9yMi9lSmhoOHBlTjU1RVlVRDRrU2lCKytOa0dWVDZySEtu?=
 =?utf-8?B?NXJucmdDZU5ac09nQ0dxUGJxRzFUa3o0ZVV5WkNyVC9SdFdDMjdpWXJoa3RY?=
 =?utf-8?B?QnEwTVdxaXJURTBBTFRMbk1DS2ZxK0NwY2xpbHFkUENWM3R3N2ZqVFUzUXhl?=
 =?utf-8?B?emtZaUdGR3h5cUYvd21zbFhySEpSemF4b1p1YjljeG5RZ2lVTlZST1JOdld3?=
 =?utf-8?B?cmp3WGM3bmlGMmYzalZaSzl4ZThBdER1K2RwR05NdTc5NU4zZTMwQVh4b2Rv?=
 =?utf-8?B?Y0FHTmFRblhYam1RenpGRmFLSytEMUlkWnhtRStrdDRUTGNRUGZ5N3d3ZllM?=
 =?utf-8?B?Nm9xTFVCZkwrYmlyajFueityY2xLRUVwZ3lOWHE5OU9VNmVOVFMwbWovNjJt?=
 =?utf-8?B?dS96RXViQVB0TkRhVmJRdDNVRmhQa0UzdmtjeU9sMDIvVjZHS3hnbmlNLzZ2?=
 =?utf-8?B?YjRkTzE4bEh2dlU2V0M2eEhrZ08xaUNxajYwOTNDbWZwRllEa2w1a3gzL21h?=
 =?utf-8?B?Z1dVclpHL1RMQUVPQTRka00vQjJBRnpFcnpMS0U1T2RoQ3Q4Z0RyWm1valFL?=
 =?utf-8?B?cFBLaXBKdVJqSmZ0VDJHM0xTVXczcjV6QjBaMUlZUmQxYk5ldnRiWHdnWDhK?=
 =?utf-8?B?dSs5NDRzL0FLTmpucU5vWjRTVk02aTVqdHNqU2o2S3pzUWZKYnBndm9kbEU2?=
 =?utf-8?B?cFRubjNhQytUY3N2YUZPQitGSHZDZUNISkpUNEh1QU1GQzNaM2w0cS96NVlh?=
 =?utf-8?B?RnR5bWd2c0FjMjdXZUtSY3Y5UDd6Z3M5VUZZRVNycmtEb0Y3cFBySk5UQzkw?=
 =?utf-8?B?OUJuWkROZm94TC9oaW90cDk4aitDQ1FaaWw5Znltc2EvUmFWMmNFVy9XOWFs?=
 =?utf-8?B?TUxKNDBoNTVNQyt2STduR0NsZmNDR0NpVGlnQm9BR2U5S25CbVRDazFicjFJ?=
 =?utf-8?Q?e9BVFPJN5dtEmIBglTkypU+N1NGTO+YGidi+Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDFIclE3L2RXTytCNDRFRy94UDdXUzVPN2c3YXYydzNDVHE3QWs3VkZFYVRZ?=
 =?utf-8?B?Q3NidUkyS3BoMzlYcXJpcFpMSmxtaS9QSXNVenkxRHFWY0txTWhoYUZKZEhH?=
 =?utf-8?B?U0NjanUveE85NFNMbFYxWTZ5UFRWWHdmZFRhamk4SU5FWTlpbElKeHFVU2J4?=
 =?utf-8?B?eDBmd2FlUDd1U3k5WTlNRjdFM1ljdEk5NXZkZVhyc2I2elByYkh2VVE2R1Qr?=
 =?utf-8?B?VTkyeTBOaHBQS0pWR0xyNG5VdWluRTRnU0svRVBNd1Z5TVFHbDlZZThlQTFO?=
 =?utf-8?B?MVJ5WUl6SlNPWXg1K1AxSjhya1VxbWR6NEdjdmMwWU14ZzFWR3pGK2l5WHZI?=
 =?utf-8?B?ek1ZeDZIYWhPRUVJblNmLy9vWi9aWm1PUWkvVU1STXdxbWlkaUpobmlzc015?=
 =?utf-8?B?Q0dHamFiWC9RT2JGeHBBeHVvRnBpYXJYRkVOZGdoZEFTTlhIdkZzQkhmSTY2?=
 =?utf-8?B?Y2JoSDdIMnRJZ2NGZTBaekRybWRYa2tZQUNEaFZBdjFvT2gvOFVuRHNYbHF4?=
 =?utf-8?B?U1ZiMmNmWFNna3MzMWtjdW9uM004MVlCM0Q1UThCR1NuTVJmaEEreWliNFgz?=
 =?utf-8?B?aTFZQUF3SHQ2V0RjNC9SNTNDVHhBZGwwME93Qzc3dThlMThzakhWT0JxQWZI?=
 =?utf-8?B?ZG5pOUZBcDdkWlZDTGd2ampjQkdDWk9SQVBFMTlOcEpONHk2WGhHdm9WZFpy?=
 =?utf-8?B?WWUzSDh2TjB6TU1HK05lM2FCWHJQWTJGZXdiQ2hUS1NsL1pJblhUeVRIWjdn?=
 =?utf-8?B?V0VFZGRCdFlhL0wvNmYzQWVTQVdlNkcza2MzMkFQQm9QRFhGYmYrQUVLb2Ir?=
 =?utf-8?B?N3BpaTE3dTFJdGRvT1dmOTJjYnVGa0lJek9WTG4xVnVCRjQ4MFhWalAvUUNC?=
 =?utf-8?B?ZVNMR3dGcCtrMFF1NWExV0VYdW9pMmwyR291eS9Od0tXZnVYYVRFd2ZBQ1ds?=
 =?utf-8?B?RVVOUVI2QmdIdjhFeFpwSHVsdzl6dnlNK2N1Z2VRZnhCdHRaUDFxdjhibDlM?=
 =?utf-8?B?U1Nqd0xWN1JKakxvQ0RnSEVVME04QlhmcXVVTnR2TktOZXNnTWhJTlRSTVNu?=
 =?utf-8?B?RVNzRUJoZFN3ZmI1Y3FxV3BkL0Q3KzJ0QURLRUdXUjJCajNJdnFFaHpXeUE3?=
 =?utf-8?B?WE9XSzMwdHh2QmhzKzZhby9ySTFFeUFYTmcxaWw2SjNNdWFVN21hZ01QZnZw?=
 =?utf-8?B?K3JiaWljSnlPc3Y5K2hzd1BnRGpOTDROcDNreXZra0tCeFRncUY1TnVFMVRG?=
 =?utf-8?B?MzBEWGVVS1Z5R2xBcjRpUzFxT3B2Q3BDdUVyL2xuOXVWbmVacUFSVjgxdmhv?=
 =?utf-8?B?Tk52Yk81VG5NUU9vQlcvdWFXL244QVFFN2dUTUJvbFlkZjJIUEJmMVkrcnRu?=
 =?utf-8?B?VHBiWW1ydC85dXhHL3NkNUN0L0RvbzJJTHQ1SHBaQzREZ1hzU2lxRjFSTXZl?=
 =?utf-8?B?ZnBqWkhCaCtsajlWSExUTHRlaWt5ZUxrWjdQbTNNMWJ4blhqZjVUMlZxZ2VG?=
 =?utf-8?B?MjFHUzIyNXpjUWFlTUFNU29lUEZyMDhPemhoWmlmZkhLeE5KSXkxZi9WOG14?=
 =?utf-8?B?VExmaXArS1B3d2hmVjVUSjEwUVAvRUJSNTlmY0R3Q1huYVNNKy8yQVRObmcz?=
 =?utf-8?B?di9wOWk3enJ0NDI5eHJDQzRvaDJ2OVBGU0RsR3VuM3dudUJPQXMyZERwVkxV?=
 =?utf-8?B?eDRuUWpkSHc5VE5YWitZUUZYYlpvNm5NdktSckp2YnROdWRTTEt3MXcwZmZR?=
 =?utf-8?B?Mk1hTTN1VjlEa1VsVlYwbnZrL21FVm82b1pnd1ZxdXZIU2JTTHdyUlJsYkJ0?=
 =?utf-8?B?TmNCVFExWENSY1crd3ZwQWZuN1VIK09iZlAvUlZWYXVER1VaRXQwR1IwcjJR?=
 =?utf-8?B?RmRrazBpNVM1M0RrRVNuTVVrRFFyUTI2UEtoVGduM3BPUHR6Zk85S3Nwb0dJ?=
 =?utf-8?B?NFNQdzU1MUc5L0JEeXgzMFVBRUhSMkc4ajlSMFFaYlFCOHdzYWVlYW1KdUlV?=
 =?utf-8?B?UVR0RUlTMzJ5OGhydEswanJ5RE95cWNBYUdRejRxdVdzcnNwSHI3WmhKOFJl?=
 =?utf-8?B?QytyaUxwSVVuU2x5MnNCbDVYNmxrT1FRaEZSbDZkNHVaTVc0TTZNL0hvSG9S?=
 =?utf-8?Q?WwXxt/ZwvuCEgDUdzWu3HpXJ4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3646489-031a-4f73-f161-08dd849fe960
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2025 08:54:10.9988 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TPRw+TDEss/y1+lGaVz8LN6KMOeCh5kUO2KV4tyWWmHmr/fwL4ADqaVYtodDHjBgjxtfVQQnzxJUpYOWl6hkIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5157
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


Hi Vinay,

On 26-04-2025 03:21, Vinay Belgaumkar wrote:
> As seen in some recent failures, SLPC num_waiters value is < 0.
> This happens because the inc/dec are not balanced. We should skip
> decrement for the same conditions as the increment. Currently, we
> do that for power saving profile mode. This patch also ensures that
> num_waiters is incremented in the case min_softlimit is at boost
> freq. It ensures that we don't reduce the frequency while this request
> is in flight.
>
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13598
> Cc: Sk Anirban <sk.anirban@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_rps.c | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index 8731f275fdd9..b609e3aa2122 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -1003,6 +1003,10 @@ void intel_rps_dec_waiters(struct intel_rps *rps)
>   	if (rps_uses_slpc(rps)) {
>   		slpc = rps_to_slpc(rps);
>   
> +		/* Don't decrement num_waiters for req where increment was skipped */
> +		if (slpc->power_profile == SLPC_POWER_PROFILES_POWER_SAVING)
> +			return;
> +
>   		intel_guc_slpc_dec_waiters(slpc);
>   	} else {
>   		atomic_dec(&rps->num_waiters);
> @@ -1031,11 +1035,15 @@ void intel_rps_boost(struct i915_request *rq)
>   			if (slpc->power_profile == SLPC_POWER_PROFILES_POWER_SAVING)
>   				return;
>   
> -			if (slpc->min_freq_softlimit >= slpc->boost_freq)
> -				return;
> -
>   			/* Return if old value is non zero */
>   			if (!atomic_fetch_inc(&slpc->num_waiters)) {
> +				/*
> +				 * Skip queuing boost work if frequency is already boosted,
> +				 * but still increment num_waiters.
> +				 */
> +				if (slpc->min_freq_softlimit >= slpc->boost_freq)
> +					return;
> +
>   				GT_TRACE(rps_to_gt(rps), "boost fence:%llx:%llx\n",
>   					 rq->fence.context, rq->fence.seqno);
>   				queue_work(rps_to_gt(rps)->i915->unordered_wq,
Tested on DG2, working as expected.
Reviewed-by: Sk Anirban <sk.anirban@intel.com>
