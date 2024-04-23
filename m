Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A618ADA36
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 02:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B81910F91F;
	Tue, 23 Apr 2024 00:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fK8CbVzs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E06710ED2A;
 Tue, 23 Apr 2024 00:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713830881; x=1745366881;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sfxF2w5GfUKuqL4R6Rfpdv26yZSo6aVEgYYiMNEJgH0=;
 b=fK8CbVzs4f9jvamV621NeiiqZ9WH+WLEehAnxtDI1Q/DuJ8TQqkzjd8j
 uraKMf/CrCDz3iaECoVDZ5ALeMu5WGm3K20jyp45r8jMDCFQZ2vhTdVhn
 T6L3+390lHHARDvORNzs4ZCUg6f57yJXD3MSKwn6Qvb+at2rKvVr0PZxS
 tLpA7ZADTIbDoXGtgb9ISI9iZCn9Idua+qGZ/zOCt7bjVcLosmjjJWBGT
 2yrhl4mBuSzqB9RC75NU3k8ykJv3VMZvlZSp5v60wsc+wWFzh/AwltNyk
 mf/hBMWleETIzPBBdrPd25fmVtbt8/+Ll/gVCk+V4q6Fj9Qo0PXwuYFo5 g==;
X-CSE-ConnectionGUID: k9wMSKAxSUe8AgEf3K5yRQ==
X-CSE-MsgGUID: gkiQRpdATB6dDnL8XBnpMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="34794203"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="34794203"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 17:08:00 -0700
X-CSE-ConnectionGUID: M2P8ySBATlyy4OcuEpXyeQ==
X-CSE-MsgGUID: IjD2E2OgRo+tjLD/nomk6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24053763"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 17:08:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 17:07:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 17:07:59 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 17:07:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U2WrNyjn29RdHHmkNglURAHdxuVrmGc9eBLkR86gWbLb1ncRFZHK3Q+DlAoIUk8rVI3QICc9Aeju0XG4hkJrK15x5zYulBw2SCJxHz29CZoARlXXc3BUGwDteAyvRX2NdqXRhen5hY5wP4I6lOSyTKxfcmHIYa3INWgwO64C9XpO1i9jxbXoG0PKJRr4RZRwjtoRUimlnf9wfwIUR9VAjOG5pci9xG3mxRXUJyBYvtsuPESus44uYLNjDfuYNBx3izpO90AHvnOyXtlGotwjh1//WRuCL7S70wuATFbARutZVZ4+QhbNnb1ZySJStSjf1COD0Do8fx26JBOfB7OMFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=edxWkvySmJHsHjjPNGuZRzMXL1TrMh3Cbr+vmJ+6Q2E=;
 b=gcBUw77Wd7Wt1LodlS4Xupl0sr6TI5IYCtWoPhmD6bHK97EESQH+f9eCZQdY3gzAKSVcJm2h7HnuM72IEV790LvspJx5gtei7kuXtoW0uvzJ6Pd4Mab0sQ6P8Ovy3WkCUT/wRtide92CRvJfEkFeoQyXt9Xq/lhpmzAHGvm4YMYRbWPo/xeUcJD1+9d0EwUA90ZW1uRpKa+JO36KWNGAuDcudPxwuhTKEV/8MrBA0vEOXJ7/wNtY+jVKclNywgTEApFpfwYjDM2uSzlnQzVMDDOKqXUClWHyNUPKhETCqF1B1JMFWrQ5yNNdNbdAvJbGaZU7i6/iEP1AihHgAJX6Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by IA1PR11MB7295.namprd11.prod.outlook.com (2603:10b6:208:428::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.20; Tue, 23 Apr
 2024 00:07:56 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7519.018; Tue, 23 Apr 2024
 00:07:56 +0000
Message-ID: <9012795b-3a21-46ac-b262-7e993c977771@intel.com>
Date: Mon, 22 Apr 2024 17:07:54 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/i915: Refactor confusing __intel_gt_reset()
To: Nirmoy Das <nirmoy.das@intel.com>, <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>
References: <20240422201951.633-1-nirmoy.das@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240422201951.633-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::31) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|IA1PR11MB7295:EE_
X-MS-Office365-Filtering-Correlation-Id: fe062a3d-84f2-45ba-401e-08dc63296daf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTduQTlNNWEwYXFMTzJJS0d6VjNkWU9weEJ0bFZCVXRYdytXRFNZN0VkM3BO?=
 =?utf-8?B?eUdwM1lqQzlxUEhnVWhyY2xZeHEwWHU5Ym1Qbm1GN2RYeEQ2aEVmdXlBaFN5?=
 =?utf-8?B?b21iMUs0ejlqN2VtTFJ6M1lIUGFnSzVBb3FBZmkzbkdoc0xHcHExRVRjZ0lp?=
 =?utf-8?B?aERURDZUL1J0Y3FENGNMOHdNMmtWZ3JhOGpkU2JlVkhta3A1Mnk1YjFKaE40?=
 =?utf-8?B?Tm44N0EwZDhOWU5qZk9MZXh2ZHZZTUd1SGFtcm5ISmRUeUM5WjRUWXMxMHUx?=
 =?utf-8?B?b3ZzbGZKWUtQYlBkeDROMFM2NVhOcGxVUzFzcGt4VmxheEF0RVplTlhGTHYz?=
 =?utf-8?B?NVF3Rlh1SFhIUW52U2tZWXVYNGJsbnhkLzIvQUtDY05EQmZpWlg0Yy94UEVj?=
 =?utf-8?B?OVNZVmVmOEkwTzFWSWRjNWMvQWpYcU4zTGJ6SVlEOHZwQnk1QnFadm9YK0hz?=
 =?utf-8?B?TFVDWHBYeE5ma21ZTTA3cVJtY1NSSlVnbGtWR0JEaldzeDFOUENrelBJSmZB?=
 =?utf-8?B?eUhOR2R5Y3VRbUJJUHdyczVKNWR6VGw3bVR4NWVVTVpiVW5HWlZoOGxKRHVB?=
 =?utf-8?B?ZkpUbWt5SkwxRmpNOU9zeVkwSHBMdStLNVZZeDAveUdFM0dXeGRPMjBpWUQw?=
 =?utf-8?B?NE1ybFR4WHJwdkJrQmUrcThCWDhPY2xMcDNCYU1KdDFUUzJmOU04T3BnKzRq?=
 =?utf-8?B?QVhYOTBVTk8rdXNWaW83N0cyRjFpUXcrTTNFNTAra01DeWhVRklYdTdPMjlY?=
 =?utf-8?B?SmlJV0tYdWlIWndtT2IwRThwWnY0WWpXMHFicjlXV3BkYXB4RHZiMFoxOUor?=
 =?utf-8?B?dGFnb2hacDFLRmIzdVlnSGNhYlZNOTA3OUZqVlNURzdFZEphOHFOSXpRU2sv?=
 =?utf-8?B?QTE2aDF0NHQxcjhtdlYrR1BKTW1lV29wNXVEM3RESDlkZ1FMYVI0clpuQ0dG?=
 =?utf-8?B?L1A4SHpldEJ3cmQ2UHAybk9ySFA1K0dBcWZSNGFUc1RFYjVyQldob25vY3Vq?=
 =?utf-8?B?MXZrNzZnQ2ZTN29KODB3aWZOMUUxckFON2ZBS3NFMUdDd3hHNGlRa3FGdGRP?=
 =?utf-8?B?UHo3VFpQdE5oTmFxMWszNkVBSGw0UlVFa0pJQW5PbFA2Q1hjTzNqd3Mva3B2?=
 =?utf-8?B?N201SlhQYVFVcVZBYWgyQ0ZwWFhIYThmT0tYYTFvYVJRSW41SWlOdXY0VlI4?=
 =?utf-8?B?ZVhiNGZRVjc2UlBFa1BhandDYU5EMjJLNjFvMkNqaDRwM0FoTUhvU1N4R2Jx?=
 =?utf-8?B?K2w2dkdZczhKNFBhTzQwR1RpaXFacHE3b25zNHpUTDBNUU5OY2lGVXdEbUhH?=
 =?utf-8?B?WnRVcGlIbUVwY2NQY2IxV1lXeE1CcXlNdU03bHlEYjBYcnJ0Q1VrRDVTdnZE?=
 =?utf-8?B?bGowdVRNTmgvMDU1ZjhjVit3cXl3Y3FUTGY3NHppbDlJRTRTTWNOSnk1N2lW?=
 =?utf-8?B?Vm1aK2dyK0cvQXhydWtSa2M0MEJKVUMxNkJMUCszNHR1WDZTSTlUWm10SmRD?=
 =?utf-8?B?eUhZVWNrZE5wOUpTRkl0REhtaEw5S1VPeWEzaFNyOFBIN0hVNjREZVFrZWVj?=
 =?utf-8?B?Q2hNUWc2YmMyVUlVTmdTdlNYK2hnclVycURSWjN5WmZPKzVaNE5SZlBqM0Nn?=
 =?utf-8?B?cDhycDhyTzQ0S01GQ0QvVHQ2ampzWDNEYW95R21sQ0JHYi9xK1c0bml1a2FC?=
 =?utf-8?B?TC9Kd1RocmpJSEY3TzN3V3pOSTIyc200RnlQTnFkeG4ySW8yd1JNV3dRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHlaaUlmaUc2Y2hyZkFiU2xiVTFkcDhhWTNVQW41NE1sL2JyajZ4UVFOazl5?=
 =?utf-8?B?OXAvL3pFeG1PQXJ3YjZtampqbzhEL2EzY3E0NTAzdlk3QWxrM3ErUGduRHA1?=
 =?utf-8?B?THZXOXhlUVIwdW4rc21HOEFabkFrNTBsQ0p2REtEcWd1SDYwMjZUeHhYcDg5?=
 =?utf-8?B?OGlFRnQ0UDlsb3Z4SDdhU0pkODQweVRJZ1VqUjBFNjBhQzBwZFdHbkRRWnF1?=
 =?utf-8?B?ZkxLSFRGRGdrd1FaREpzMXQ2L1ZXN1YrTlZaNjBnREpsK0xuOHp5R2VCR1dr?=
 =?utf-8?B?MGF4RnlkeWRtaWR5MHpNN1p1Y0FxT3hqY1A4UkhiZm1CNHp2SXpOdXB5RFFl?=
 =?utf-8?B?MC8wUGgvc3V5dHhUcjVwTUZRZ1d4NHVPOTFubjh1S2ZGVXEvUkFGUVY5aTBk?=
 =?utf-8?B?V3BjMXliSXhzZ3F1aUpwKzRLMmJMci9HREVndVlRdlQvVlprTG5HbWRBY0o0?=
 =?utf-8?B?TUhrMGgrK3U5eWJ3SWl2dXVINStRYmR0aWRncTlKb0NzR1U0Y1dHc2JoWVJC?=
 =?utf-8?B?ZUFVYk95RVFYRHlwck1uRXJPVE9mZVlKY2x2WlRWZ0JxakROdnpsQ2F1TnRN?=
 =?utf-8?B?Rlg1ek9LZ0s0NnFFYzUzTy9aVVAvMXlLc3FWYkljRGdVaGN4TW9qTWN2U0RM?=
 =?utf-8?B?bHZhcTZKU0pZMDJaZVhPNEdmNUxzQk16QllpRFdHT3gvL1ZQU3FzcWZKMVAy?=
 =?utf-8?B?cStmQ2RqTGJ5NnE3U1VILzJmR1l5bE43clgrR3ZMZ2xFVGZ1amJ6M1NWOHBo?=
 =?utf-8?B?NmY1YU92Z3hkQ2F1MWNNZHJ6Slp6Rkk5eDd6YjZxWXVrMVNBTFBVdUVXQS9z?=
 =?utf-8?B?c3oxOXJrQWVaREtoQW9qQU92OFlrelBuaWQ2Y2k0dk8vVHpjb084NmJiTjAx?=
 =?utf-8?B?MDF3bklrSnlmWHBKSVd3ZTJIN1NNMm9SejRjMllJNGgvQkwxSFRycVRjL3ds?=
 =?utf-8?B?b3JSSGdmOUJkdkhveWNqN3BEV0lMU09kcGJlQlNVOXZlNWdqR1JlTVdzVWpt?=
 =?utf-8?B?cjVxUWVyYVlaTGlDenR5eDN5ZzliTWxhZDJPTWYwbjU2WkcxS2tKN295N0M2?=
 =?utf-8?B?M2o5UDlCTW42U0FLbGpaelNqM3Evbk9aMW96K1NoV0Qwd2Y1akZhdUdWMmxp?=
 =?utf-8?B?VlVseG4vek1iQjVZd1VPSTRLN3FQTWZuN2o0MHdHdW9PRVorcGg0alJEWUEv?=
 =?utf-8?B?c1hUdjJORWM3VjhnV1Q5T2VNQ2FyVHNvaytsalF6bkt6MGMzYktsRE05MGpU?=
 =?utf-8?B?YnQ5T1JiMEYwbVc1RWRieUZBN2kyeDF5enV2cm1EVGlQWlE3cXUwbXdMMzl5?=
 =?utf-8?B?SDlGNjQ3b2JsRVI4RkF3ZnJVV3RzZko4MzFUNmJIU3hRNnhmM2d1VWxsbXJn?=
 =?utf-8?B?VGdabnZvV2QvRVFNQUFWRG8yTXpmZDJSMjYyTGg2aTczTTJSSEdSL1lWS1Iz?=
 =?utf-8?B?Um1LOFVBQS93empuN0pibkZoRXFPSjJRV3g4bzBNM0I1d1g3SkFVK2NlY1BZ?=
 =?utf-8?B?UXk4akNGWVpEeGFmdnlJRlJNN3IramRIQlBNZGNUV05FTFVaQ2lyeHRnaDJk?=
 =?utf-8?B?K1BmajFiYXZHUUZCZHBPZDdPaHlXQTBOY2E1SVVkOUFFQ1dEVFoxcHZXRXV4?=
 =?utf-8?B?eEtVdTlKNHBXSzdTNTNmYjQ4cnZWbDNKbTNiWmc5VnVvdXIvMTV1bGpHMVor?=
 =?utf-8?B?UndKZkZrVytXL1NwMkVoOHVYSU16TnhBditOUVU2MnlnQmdGYW5rRWpPVGtG?=
 =?utf-8?B?aS9OM0VhOGYwdE9hUldOTUxXLzQzVkJKZysyeXh5azJDUVpkUzdXTVRXQVlo?=
 =?utf-8?B?aTJLQUNZYTB0OTk3NWl1ZlJyTEhtVlV3Uk15cm5MVmd3VGptSS9YMW91Z256?=
 =?utf-8?B?d3Qyc1hiTFhySWU3b0sxRHZOSURiRStjaU9vNnkyQk5rZU9yL1lNOXM3eFJW?=
 =?utf-8?B?UTMzS0FucUlnaWIwUngzL1c5ZlBpd1lmTjhXV25YL2hrZC9mVExYVDNNVG04?=
 =?utf-8?B?c205cUpxaFpBeTZuSnVTYnlRelA2RTMvMG5LbWJTZGlpc2xZbitqOUVVcWpr?=
 =?utf-8?B?aFl5WmJISlBzdWNHTER2cE50SUljaThrUHNvUFpTVWZOWUJmOWlDL0FRNFlP?=
 =?utf-8?B?M0Q5SGQwbk9YeE1zUWxUVGhBZ2JhNGlmcGU4L2l2TDk5WEFOMGZnYmVQVFJk?=
 =?utf-8?B?cUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe062a3d-84f2-45ba-401e-08dc63296daf
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 00:07:56.6545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rL1K+xEQq6a1GmQRXpsG7fw+KdM1HVUEnVD0uVcPkp+YDmpllwPL7HTolt0aE6ZNIhTNUI94iZcBRgc4PZanoEiePef//xH9tPnOMlhXKjE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7295
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

On 4/22/2024 13:19, Nirmoy Das wrote:
> __intel_gt_reset() is really for resetting engines though
> the name might suggest something else. So add a helper function
> to remove confusions with no functional changes.
>
> v2: Move intel_gt_reset_all_engines() next to
>      intel_gt_reset_engine() to make diff simple(John)
>
> Cc: John Harrison <john.c.harrison@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  2 +-
>   .../drm/i915/gt/intel_execlists_submission.c  |  2 +-
>   drivers/gpu/drm/i915/gt/intel_gt.c            |  2 +-
>   drivers/gpu/drm/i915/gt/intel_gt_pm.c         |  2 +-
>   drivers/gpu/drm/i915/gt/intel_reset.c         | 35 +++++++++++++++----
>   drivers/gpu/drm/i915/gt/intel_reset.h         |  3 +-
>   drivers/gpu/drm/i915/gt/selftest_reset.c      |  2 +-
>   drivers/gpu/drm/i915/i915_driver.c            |  2 +-
>   8 files changed, 37 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 8c44af1c3451..5c8e9ee3b008 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -678,7 +678,7 @@ void intel_engines_release(struct intel_gt *gt)
>   	 */
>   	GEM_BUG_ON(intel_gt_pm_is_awake(gt));
>   	if (!INTEL_INFO(gt->i915)->gpu_reset_clobbers_display)
> -		__intel_gt_reset(gt, ALL_ENGINES);
> +		intel_gt_reset_all_engines(gt);
>   
>   	/* Decouple the backend; but keep the layout for late GPU resets */
>   	for_each_engine(engine, gt, id) {
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 355aab5b38ba..21829439e686 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -2898,7 +2898,7 @@ static void enable_error_interrupt(struct intel_engine_cs *engine)
>   		drm_err(&engine->i915->drm,
>   			"engine '%s' resumed still in error: %08x\n",
>   			engine->name, status);
> -		__intel_gt_reset(engine->gt, engine->mask);
> +		intel_gt_reset_engine(engine);
>   	}
>   
>   	/*
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 580b5141ce1e..626b166e67ef 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -832,7 +832,7 @@ void intel_gt_driver_unregister(struct intel_gt *gt)
>   
>   	/* Scrub all HW state upon release */
>   	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
> -		__intel_gt_reset(gt, ALL_ENGINES);
> +		intel_gt_reset_all_engines(gt);
>   }
>   
>   void intel_gt_driver_release(struct intel_gt *gt)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> index 220ac4f92edf..c08fdb65cc69 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> @@ -159,7 +159,7 @@ static bool reset_engines(struct intel_gt *gt)
>   	if (INTEL_INFO(gt->i915)->gpu_reset_clobbers_display)
>   		return false;
>   
> -	return __intel_gt_reset(gt, ALL_ENGINES) == 0;
> +	return intel_gt_reset_all_engines(gt) == 0;
>   }
>   
>   static void gt_sanitize(struct intel_gt *gt, bool force)
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> index c8e9aa41fdea..b1393863ca9b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -764,7 +764,7 @@ wa_14015076503_end(struct intel_gt *gt, intel_engine_mask_t engine_mask)
>   			 HECI_H_GS1_ER_PREP, 0);
>   }
>   
> -int __intel_gt_reset(struct intel_gt *gt, intel_engine_mask_t engine_mask)
> +static int __intel_gt_reset(struct intel_gt *gt, intel_engine_mask_t engine_mask)
>   {
>   	const int retries = engine_mask == ALL_ENGINES ? RESET_MAX_RETRIES : 1;
>   	reset_func reset;
> @@ -978,7 +978,7 @@ static void __intel_gt_set_wedged(struct intel_gt *gt)
>   
>   	/* Even if the GPU reset fails, it should still stop the engines */
>   	if (!INTEL_INFO(gt->i915)->gpu_reset_clobbers_display)
> -		__intel_gt_reset(gt, ALL_ENGINES);
> +		intel_gt_reset_all_engines(gt);
>   
>   	for_each_engine(engine, gt, id)
>   		engine->submit_request = nop_submit_request;
> @@ -1089,7 +1089,7 @@ static bool __intel_gt_unset_wedged(struct intel_gt *gt)
>   	/* We must reset pending GPU events before restoring our submission */
>   	ok = !HAS_EXECLISTS(gt->i915); /* XXX better agnosticism desired */
>   	if (!INTEL_INFO(gt->i915)->gpu_reset_clobbers_display)
> -		ok = __intel_gt_reset(gt, ALL_ENGINES) == 0;
> +		ok = intel_gt_reset_all_engines(gt) == 0;
>   	if (!ok) {
>   		/*
>   		 * Warn CI about the unrecoverable wedged condition.
> @@ -1133,10 +1133,10 @@ static int do_reset(struct intel_gt *gt, intel_engine_mask_t stalled_mask)
>   {
>   	int err, i;
>   
> -	err = __intel_gt_reset(gt, ALL_ENGINES);
> +	err = intel_gt_reset_all_engines(gt);
>   	for (i = 0; err && i < RESET_MAX_RETRIES; i++) {
>   		msleep(10 * (i + 1));
> -		err = __intel_gt_reset(gt, ALL_ENGINES);
> +		err = intel_gt_reset_all_engines(gt);
>   	}
>   	if (err)
>   		return err;
> @@ -1270,7 +1270,30 @@ void intel_gt_reset(struct intel_gt *gt,
>   	goto finish;
>   }
>   
> -static int intel_gt_reset_engine(struct intel_engine_cs *engine)
> +/**
> + * intel_gt_reset_all_engines() - Reset all engines in the given gt.
> + * @gt: the GT to reset all engines for.
> + *
> + * This function resets all engines within the given gt.
> + *
> + * Returns:
> + * Zero on success, negative error code on failure.
> + */
> +int intel_gt_reset_all_engines(struct intel_gt *gt)
> +{
> +	return __intel_gt_reset(gt, ALL_ENGINES);
> +}
> +
> +/**
> + * intel_gt_reset_engine() - Reset a specific engine within a gt.
> + * @engine: engine to be reset.
> + *
> + * This function resets the specified engine within a gt.
> + *
> + * Returns:
> + * Zero on success, negative error code on failure.
> + */
> +int intel_gt_reset_engine(struct intel_engine_cs *engine)
>   {
>   	return __intel_gt_reset(engine->gt, engine->mask);
>   }
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.h b/drivers/gpu/drm/i915/gt/intel_reset.h
> index f615b30b81c5..c00de353075c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.h
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.h
> @@ -54,7 +54,8 @@ int intel_gt_terminally_wedged(struct intel_gt *gt);
>   void intel_gt_set_wedged_on_init(struct intel_gt *gt);
>   void intel_gt_set_wedged_on_fini(struct intel_gt *gt);
>   
> -int __intel_gt_reset(struct intel_gt *gt, intel_engine_mask_t engine_mask);
> +int intel_gt_reset_engine(struct intel_engine_cs *engine);
> +int intel_gt_reset_all_engines(struct intel_gt *gt);
>   
>   int intel_reset_guc(struct intel_gt *gt);
>   
> diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
> index f40de408cd3a..2cfc23c58e90 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_reset.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
> @@ -281,7 +281,7 @@ static int igt_atomic_reset(void *arg)
>   		awake = reset_prepare(gt);
>   		p->critical_section_begin();
>   
> -		err = __intel_gt_reset(gt, ALL_ENGINES);
> +		err = intel_gt_reset_all_engines(gt);
>   
>   		p->critical_section_end();
>   		reset_finish(gt, awake);
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index 4b9233c07a22..622a24305bc2 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -202,7 +202,7 @@ static void sanitize_gpu(struct drm_i915_private *i915)
>   		unsigned int i;
>   
>   		for_each_gt(gt, i915, i)
> -			__intel_gt_reset(gt, ALL_ENGINES);
> +			intel_gt_reset_all_engines(gt);
>   	}
>   }
>   

