Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3290EA31902
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 23:48:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6019910E0E9;
	Tue, 11 Feb 2025 22:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K7M2KY0d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE2E10E0E9;
 Tue, 11 Feb 2025 22:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739314089; x=1770850089;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2OhSo58lH61WX1A2+o3udi7g/7RM2VT5dTVpVl3cpjU=;
 b=K7M2KY0d+7T0g8eycsfFyQqjIs5CA4ungQmrRRduCja3rUMtpyKqmPVK
 8MZh25L7fw9eV8nOxWC6vIbucBMFHuEQ5WTgOq0oe4GH0Gb9/fazvWi69
 8xmSKs6kewbHIpDgucBaqrFeKCxMD/Qy5iRWIHVhwjhsFN1ov8Wrum5Lv
 En5GjoqWMpcrPxEzEQCmHIEg4ATjArUPGPPs3i2kYQHzmHDxO2gr72zP5
 2yqu4FHkKYQSMTVgiNIme8L0uRnhk+Ddx/9kO6WM+y0FHX/OwoIMu+IeR
 TwAY7K25jZurm9te7tAJ6eA+pQYUe0P9EbHU8ZECfBHabAC4DWty5khqW A==;
X-CSE-ConnectionGUID: EofHCSPnRLiX+s2MPnblKw==
X-CSE-MsgGUID: RKwQy86mQP2u8Hy4ofAr/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="50178563"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="50178563"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 14:48:09 -0800
X-CSE-ConnectionGUID: hk4deTuaRr60s4kOW7X6sQ==
X-CSE-MsgGUID: Z0gkZmFASuuKUI40lxKAGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="117586295"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 14:48:09 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 14:48:08 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 14:48:08 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 14:48:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nYQNI3fTaNID01vZQ61RhVZ2DOFW0A17jgCObCsz6iC71JG7tl2wO1b1hah6gK0Zv+s33l41JHcTrqbENOkwQyo3N2Z54R1DYGSbXLC4DteGpNY+dxgQsMJwZxE5SCT4uXm5FTc3ukB7h/S1gCDS0nlOJomQxG9iFQHzhUIrwUnuk+fff9vD6HdedYea//k3h4tURWKpBIBpmdY5kQft3vqPllIdoukVT29NXTi5bwVi3iCuVZqUtgYV8Pl2YVRErtMusm6WBBVg4bYpsBRv48q0+ukuLpnKTTMa1ioI/98qy4gSm8FMrZXFT/7jyWQp8C7Eoig/WF99BR5Pz73V2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntBbUepEpxgL3X1N+bqxRFQGdsVQgFExTi/+LRJlYqc=;
 b=yi3S0CHylJ2NnfuboHZlSHNehPWV52j7KTYOa8kJ77uVwlndiBq95VPt0NXYCsHuBUNrsaws1memlnCa5JGQDVqUpjnPtyZHmfKDfAcOLH9ihM2S6tCBqJmzkkBuACfzN1rt4a0+3B1vsJFpBRfjiV+zlmqiP1uYNVNszl9ZOHTb07wWhc+eU/q+OTaBt3BU+PXH/6INmlqsZzmRL4k8T0a4uv4scnWHF1ZGp3q0989SQYsqLMgQFMBMIi+Ph061V+80TgjWE3fV7rnj5tGcs6Oz8zR2Z1MzINj0Q8gdbrNXiVP+Ln5am2bPu1zBPoOeX780FP0ztSXE+oIqu56oQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by MW4PR11MB5800.namprd11.prod.outlook.com (2603:10b6:303:186::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Tue, 11 Feb
 2025 22:48:06 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 22:48:06 +0000
Message-ID: <0004aa7f-d6a6-4122-93b7-bae80f60009e@intel.com>
Date: Tue, 11 Feb 2025 17:48:02 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/6] drm/xe/guc: Split engine state print between
 xe_hw_engine vs xe_guc_capture
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, John Harrison <john.c.harrison@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20250210233254.419587-1-alan.previn.teres.alexis@intel.com>
 <20250210233254.419587-4-alan.previn.teres.alexis@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20250210233254.419587-4-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR06CA0003.namprd06.prod.outlook.com
 (2603:10b6:303:2a::8) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|MW4PR11MB5800:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aa92699-e74f-41b5-9beb-08dd4aee2625
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OGg2dzd5eGdkRWJqZDBieDBEMXd6TW1kbGppMlNTR1dXQVlENmpEMFBpdnI2?=
 =?utf-8?B?MklBQTQ3aURFRlNtaDFaRk82ak5kSlFVb2pmanh4OVhyZ0hKRFpQYWZBM1hF?=
 =?utf-8?B?MTVnUzFWUnE0T2RlNTBiRlRzc0RycS9od2xDUlNrMzBLQUFjbWRqTXVML1Qx?=
 =?utf-8?B?emppN3djYldsUHRiSVovNGtNSHM4WFV2d1BIcUNTenZTRktzbW9IVmE4dDJM?=
 =?utf-8?B?RXV3bzFKU0JwNTZ4THBFTDB0d3ZrYWg1S1NTb1dSeER1Zlo1dkNVUEJsZkJm?=
 =?utf-8?B?YVJUQ1F2cTRRVmlKc2hISkduWWNtbStLNWhOQ0VOQ0xwNEdNOUZCY2hNTVI2?=
 =?utf-8?B?dWJhUFdpOU0vVVFld2N0dDh6V0NPOVBwUG9CbTNEQXpMZFlKd0hTSHk3a25M?=
 =?utf-8?B?RXJrYm8yS3VGb2dVa2FjRUxzTzN6Tm5wSU1VTlpiZHloZThla0hGOUF1ejdS?=
 =?utf-8?B?clJNeHhucW92STFkWFAyNDdsUjFvYmlEQUZvZWhEdWI2RGVSK2REakE4eW90?=
 =?utf-8?B?ZlR4L1N5NDFGdFo3cnVTaGNvN2twbG1QYkw4SW4ySEJvL3hKamJJUWlva2Mx?=
 =?utf-8?B?dFFlaWxWeW9qemVxQ2ZZd0RHbSthYmJlQkdKSlkybnZHelhGM2tXVEVkNjNv?=
 =?utf-8?B?akVwTXdnck9BRzZ3cW1OMnVkMzJrUTFUM055cXhjU1BDRWkrNkl4Mm8vRU9x?=
 =?utf-8?B?QlMvL0twTC8zdlhlQTM4cmFFMEVoMnpOcmtFUHNrY2dFY0xXdThLclUvck9i?=
 =?utf-8?B?dXZ5dWJQYS9VRkJXN2VyNTc5QUdIK25wdzlBYnM3TmtybHZNVXhxTkdGZ1R6?=
 =?utf-8?B?ZldQeGVmSlZQdTBxVUNvUTBsZ0s1Vk1mSSt4Q2xwVUduMEk3UmE2eXJPSWR0?=
 =?utf-8?B?NGpjZ0Z4NmZJd0FpbzNUTjJTaXQrZTgzeHpMcTEwdjYwN1dOejlVTHAxM2p2?=
 =?utf-8?B?anB0emhNckwzclBCT3BmNE0yRVVKSWxHQ0hBRDdFMVRZMHlEZ0YvWk0wVmgv?=
 =?utf-8?B?VlEzV1Z6WWwrQzl5U0RHVjBzTWV1eXZ4QnBLUkt3aThsRkRINUJLb0xlaU0x?=
 =?utf-8?B?RFVQZDZLcHpxMDI5TVg1SitDRFZCVXJHSWtDbFdjVml4b1g2YXFKczJhRllM?=
 =?utf-8?B?Q2tkTjVHTkhMTkV3WFlpdVY5UEt4emJzVmVLTkp3SEFGaFhGYVp1QmRjWm4x?=
 =?utf-8?B?QUhqS1cwV0ZPZ3VXM0FPaHFsZVlvdUlEaTZQeWlhZU9rcVdHcmh2UVpXMU05?=
 =?utf-8?B?L0JDcVcwaHBWbWtKUXRYSmFydkJtbkhEMzRuQXJiWjRad3UxS0dUWm1ZOUNn?=
 =?utf-8?B?VTRrc1VrbzRQMmRzK3d4d2t5eE1WRlZ3R3crdGZ0T2VuVlBkSmgrdTRMTk04?=
 =?utf-8?B?SWh2Sm42SGRBeDFkSHA1TWJLbElyTlNyNkFkaGRuVU80a3BhWlN2L1dkb0RS?=
 =?utf-8?B?ek95VmZVVU5oT253UXJUb210WlYxcHU5bW5pQ0dORW8ySFRNczRGRVlRNHJ2?=
 =?utf-8?B?Mkk0TW0rSkU2eFhVVThGMkJUSEppQkQ1bGV2a0NucDNGa3lhaWw5TGYrRVhV?=
 =?utf-8?B?SThaRmQzMEtlWlY0SHF0VlgzWWZwWHNKQXZLMDR6dC8wYzlUVUFRYUp1TDUv?=
 =?utf-8?B?a2c0aFBtNWliWm5PemlJeTl5SlBjZ3A3T1VQRTFMM01IbTFpUzhTQk4wUnZq?=
 =?utf-8?B?VWdEb1BqQmRHaVIzcVVvaEozQjROUFBkSlpTU01BUENyeFU1UG1xNDdKajRS?=
 =?utf-8?B?S21ZcmduUjNsVW1aU29PUU5HTm1Yd1E3b2Y2RXJLbzh6ci9HSEkxa3BrbnhX?=
 =?utf-8?B?Ykx2ZGtLbmtJNVVkV0xrd2t4bEJ6MzY4TjZubFZwRWdnd1huYWR5U2ZhZ3dT?=
 =?utf-8?Q?IWjTIhKoKodx2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVpRWWZLd2swMlpUZkkvS2kwQkRMWFJjNE44ZWpEd3hZbTNOYXRFZExoNnFv?=
 =?utf-8?B?YStnRll0UXJTWUQ2VDBEUEhwbTlXY0pHNTJ6b1lITGJyNDJJYlk3K2laeEhK?=
 =?utf-8?B?QWVNVFVjTnZlN2pFS0NoQmNMS3N3dXFNM0VYY3hHYkowZzBhZ0k3TFpFL0ZX?=
 =?utf-8?B?QnZ0SHMrcXp1ZzFtaDZQaWNnR3Y2c1VkamU2YVBVZkY4VXIyQlU3cDV6UnBF?=
 =?utf-8?B?dTAxUWpaU3JUNWdITlRrZ0xkbUk5cFkzaGR0NnJ3bGljQkJ3djUxK2NrbFhi?=
 =?utf-8?B?V1lhTEwwYVE5Z1BUTkxreTQ5ZWlMRzVrV0FNcTRSNEpkTHIxODc3d2IzMmRm?=
 =?utf-8?B?QnM0QnIxZU1vY0RRa2VLaWNvZkRuTjF4OW9BZnM0dEpLTGZOMnZoSFI3bDVq?=
 =?utf-8?B?bXp2blVtU0lhQjRCRkpIZWlmT3l4MkFreXZFTjgvQjB4YVdub1htWitJTG8v?=
 =?utf-8?B?Q1ZjMmJPZ0l5NitqUnFCb2tsdkFrdUN1QjBJWENTazlWdS96VFFkVDE0N0Vy?=
 =?utf-8?B?aTVRQWpucm1ONm5QaHpRRW10aGw1eHJJbUYrTDRQNU5vRm9OTEhETlluUDd3?=
 =?utf-8?B?Um5abWwxN29DdWMzTy9VZjRTd09qbDB4NlNXSGRtQUtuL3lUU2U4dXRLalhz?=
 =?utf-8?B?QVRQUmV0UmFYbVRMUzlTeHpQRXV2dW9ZMk92VmsrQUFtdVhvS204ZmlXS1VO?=
 =?utf-8?B?QzZaZm1UVUZTYXM2MTNpRHhqTExuK0ZxSHpJK3pmbk11MVQwQXZFQTNNL0Vn?=
 =?utf-8?B?WXNDUlp4Tm9zWXFVUnkybjJjeVE2ZVJzMVcrR3Z1RXRvTE44Ujh0QTBHTURY?=
 =?utf-8?B?VGZSSlhtZFB5M3J2MExGT1JZU0lGRkFMTm9HVUNCRkhpVENSeVd1NzJRQURD?=
 =?utf-8?B?THhJU2k2SWsrZnV5YXJCbDQ5RGlEUmZPTXFWMEROS2YrTmRJQmlzeFgwa2lF?=
 =?utf-8?B?bWNpVzNFTjdLVVFhaHNBeXpmdWJSaXNsb1hodE5RR21PQzYvZDZUNE9Cc01j?=
 =?utf-8?B?Y0tkRlMvejh4WFRZd3d2V0xJTmZnc0hxUVlMZWZhNjVXVENYczkrOFlmdWI5?=
 =?utf-8?B?QXg3YXRMaENFTENsMHptbzZ2aVBIQnZQeUoxcDZkSS8rd0lIVlFPU0M2c3BW?=
 =?utf-8?B?SHlzeHJEMjRrOWpUVE5ZNTV2QXgwMC9WYnNCNnMxaVJPcEVLcjhhbDlMNExZ?=
 =?utf-8?B?VW1LdEQyTW9lRmxjU3ljMzF5T1hacFB3Mkx6NHdnNmRpR3g0TDMyelJWZTRV?=
 =?utf-8?B?R0tUZ3R0RC9lQTQ5NWh4eEJNL0pGaDFiU1JHOFg0WGF5dWR5cHZvZDFJM2J3?=
 =?utf-8?B?aFBmWmEyMC9Ja0N4ZTF6aFFrUHJJZ3R5aWN2bE93MFhQbUI0UGJ4NHgvTCs5?=
 =?utf-8?B?eFFoWmlBYU5SVUlKQjRYN1pQUXhlcGtWTEhUTGllVHp3RFFSVVdlOTVDVlpV?=
 =?utf-8?B?WXFhRVo5T3lLbVZaR2tnUXRObVRndU9kZHluSkNqaStOTTFGTVE4R0dvenRY?=
 =?utf-8?B?TzNPSGhVUUJZUmZkZVpnSlE4RmY5N0dneCsrS1MwSi9aSWdJRGZ6d1RXcXZZ?=
 =?utf-8?B?YkRGZ2dPRzJNOXVLaXc4d0d3b1NvbmpvbnliQjQwNi8wUzhmNjJSUnRFUWk1?=
 =?utf-8?B?Z3ZwQXVMYUF2L2hXMm9GdDI3d01KOFh1bVhOZjhwZ3ZpRWZoOG5mTTFOWkJh?=
 =?utf-8?B?NGZDeGd6NjkrRXg1V2FmUlNCZnhVYi9jV0RXcnhBNWwvejlid0FWNm05UW5u?=
 =?utf-8?B?R1lnYnRXS3hyK2hnMEVpWDVsWUQrN3ZzcG50RUhlOEczRkc3UHZJOUp2cEl3?=
 =?utf-8?B?QWwwcWN3Qk1WSVpnSnZMQU40TnJoSTZ6NXIzV2VlNkw4Y3RiVFNMclFjakNj?=
 =?utf-8?B?UncwZ3M4eTlNTlpyWmhISVhhNkp2clpKSklMZXdIT0RuaGVlT1NaY1MzWDBZ?=
 =?utf-8?B?bDdPNTNDK1lkbVNDMmNDUjhnNzdqVm1HbFNQcEN2MUdnQnRVU2hqNStiRzl6?=
 =?utf-8?B?Nm9iOHFoTUVFZnBPdDAzcmZjVEIwZGRxNFlkcFZQbWpyejhmYWpUZlRINUZt?=
 =?utf-8?B?eHBJZDE1akpTcWZjZG9aSjgxZ0JITlZtUm1HblhhMFdBd0ducWp1bXpMTkJ6?=
 =?utf-8?B?V3N4d0oxTzQ1OHlXTlpWR0lUZGU2ZHhiV0pSUWFPdlFKNDJneTg4ZWJHemNT?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aa92699-e74f-41b5-9beb-08dd4aee2625
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 22:48:06.1447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OW1Al3t91HDnN3SdpznGKeVbVrfD8z+2b7bRmQo3Ikf0NSJAKu0hXor4NFGcEDG8MEqQtg2Sm0Qg0zJBZItsXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5800
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



On 2025-02-10 6:32 p.m., Alan Previn wrote:
> Relocate the xe_engine_snapshot_print function from xe_guc_capture.c
> into xe_hw_engine.c but split out the GuC-Err-Capture register printing
> portion out into a separate helper inside xe_guc_capture.c so that
> we can have a clear separation between printing the general engine info
> vs GuC-Err-Capture node's register list.
> 
>     v7: - Fix function name to respect "xe_hw_engine" name space. (Rodrigo)
>         - Remove additional newline in engine dump (Jose Souza) +
>           ensure changes didn't break mesa's aubinator tool (Rodrigo)
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_devcoredump.c |  2 +-
>   drivers/gpu/drm/xe/xe_guc_capture.c | 79 +++++++++++++----------------
>   drivers/gpu/drm/xe/xe_guc_capture.h |  4 +-
>   drivers/gpu/drm/xe/xe_hw_engine.c   | 29 ++++++++++-
>   drivers/gpu/drm/xe/xe_hw_engine.h   |  1 +
>   5 files changed, 67 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 006041997550..7a4610d2ea4f 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -128,7 +128,7 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
>   	drm_puts(&p, "\n**** HW Engines ****\n");
>   	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
>   		if (ss->hwe[i])
> -			xe_engine_snapshot_print(ss->hwe[i], &p);
> +			xe_hw_engine_snapshot_print(ss->hwe[i], &p);
>   
>   	drm_puts(&p, "\n**** VM state ****\n");
>   	xe_vm_snapshot_print(ss->vm, &p);
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index f118e8dd0ecb..76c20ff97864 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -917,9 +917,10 @@ guc_capture_init_node(struct xe_guc *guc, struct xe_guc_capture_snapshot *node)
>    * --------------------
>    *      --> xe_devcoredump_read->
>    *             L--> xxx_snapshot_print
> - *                    L--> xe_engine_snapshot_print
> - *                         Print register lists values saved at
> - *                         guc->capture->outlist
> + *                    L--> xe_hw_engine_print --> xe_hw_engine_snapshot_print
> + *                          L--> xe_guc_capture_snapshot_print
> + *                               Print register lists values saved in matching
> + *                               node from guc->capture->outlist
>    *
>    */
>   
> @@ -1655,22 +1656,16 @@ guc_capture_find_reg(struct gcap_reg_list_info *reginfo, u32 addr, u32 flags)
>   }
>   
>   static void
> -snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p,
> -			     u32 type, const struct __guc_mmio_reg_descr_group *list)
> +print_noderegs_by_list_order(struct xe_guc *guc, struct gcap_reg_list_info *reginfo,
> +			     const struct __guc_mmio_reg_descr_group *list, struct drm_printer *p)
>   {
> -	struct xe_gt *gt = snapshot->hwe->gt;
> -	struct xe_guc *guc = &gt->uc.guc;
> -	struct gcap_reg_list_info *reginfo = NULL;
> -	u32 i, last_value = 0;
> +	u32 last_value, i;
>   	bool is_ext, low32_ready = false;
>   
>   	if (!list || !list->list || list->num_regs == 0)
>   		return;
>   
> -	XE_WARN_ON(!snapshot->matched_node);
> -
>   	is_ext = list == guc->capture->extlists;
> -	reginfo = &snapshot->matched_node->reginfo[type];
>   
>   	/*
>   	 * loop through descriptor first and find the register in the node
> @@ -1740,8 +1735,8 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
>   
>   				group = FIELD_GET(GUC_REGSET_STEERING_GROUP, reg_desc->flags);
>   				instance = FIELD_GET(GUC_REGSET_STEERING_INSTANCE, reg_desc->flags);
> -				dss = xe_gt_mcr_steering_info_to_dss_id(gt, group, instance);
> -
> +				dss = xe_gt_mcr_steering_info_to_dss_id(guc_to_gt(guc), group,
> +									instance);
>   				drm_printf(p, "\t%s[%u]: 0x%08x\n", reg_desc->regname, dss, value);
>   			} else {
>   				drm_printf(p, "\t%s: 0x%08x\n", reg_desc->regname, value);
> @@ -1760,13 +1755,18 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
>   }
>   
>   /**
> - * xe_engine_snapshot_print - Print out a given Xe HW Engine snapshot.
> - * @snapshot: Xe HW Engine snapshot object.
> + * xe_guc_capture_snapshot_print - Print out a the contents of a provided Guc-Err-Capture node
> + * @guc : Target GuC for operation.
> + * @node: GuC Error Capture register dump node.
>    * @p: drm_printer where it will be printed out.
>    *
> - * This function prints out a given Xe HW Engine snapshot object.
> + * This function prints out a register dump of a GuC-Err-Capture node that was retrieved
> + * earlier either by GuC-FW reporting or by manual capture depending on how the
> + * caller (typically xe_hw_engine_snapshot) was invoked and used.
>    */
> -void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p)
> +
> +void xe_guc_capture_snapshot_print(struct xe_guc *guc, struct xe_guc_capture_snapshot *node,
> +				   struct drm_printer *p)
>   {
>   	const char *grptype[GUC_STATE_CAPTURE_GROUP_TYPE_MAX] = {
>   		"full-capture",
> @@ -1774,45 +1774,36 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
>   	};
>   	int type;
>   	const struct __guc_mmio_reg_descr_group *list;
> -	enum guc_capture_list_class_type capture_class;
>   	struct xe_gt *gt;
>   
> -	if (!snapshot)
> +	if (!guc)
>   		return;
> -
> -	gt = snapshot->hwe->gt;
> -
> -	if (!snapshot->matched_node)
> +	gt = guc_to_gt(guc);
> +	if (!node) {
node was called snapshot befrore.
> +		xe_gt_warn(gt, "GuC Capture printing without node!\n");
>   		return;
> +	}
> +	if (!p) {
New printer pointer check, good.
> +		xe_gt_warn(gt, "GuC Capture printing without printer!\n");
> +		return;
> +	}
>   
> -	xe_gt_assert(gt, snapshot->hwe);
> -
> -	capture_class = xe_engine_class_to_guc_capture_class(snapshot->hwe->class);
> -
> -	drm_printf(p, "%s (physical), logical instance=%d\n",
> -		   snapshot->name ? snapshot->name : "",
> -		   snapshot->logical_instance);
>   	drm_printf(p, "\tCapture_source: %s\n",
> -		   snapshot->matched_node->source == XE_ENGINE_CAPTURE_SOURCE_GUC ?
> +		   node->source == XE_ENGINE_CAPTURE_SOURCE_GUC ?
>   		   "GuC" : "Manual");
> -	drm_printf(p, "\tCoverage: %s\n", grptype[snapshot->matched_node->is_partial]);
> -	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
> -		   snapshot->forcewake.domain, snapshot->forcewake.ref);
> -	drm_printf(p, "\tReserved: %s\n",
> -		   str_yes_no(snapshot->kernel_reserved));
> +	drm_printf(p, "\tCoverage: %s\n", grptype[node->is_partial]);
Yes, I see the printout order was changed:
vcs0 (physical), logical instance=0
	Capture_source: GuC
	Coverage: full-capture
	Forcewake: domain 0x8, ref 1
	Reserved: no
	FORCEWAKE_GT: 0x00000000
to:
vcs0 (physical), logical instance=0
	Forcewake: domain 0x8, ref 1
	Reserved: no
	Capture_source: GuC
	Coverage: full-capture
	FORCEWAKE_GT: 0x00000000
The xe_exec_capture igt test can handle this change, as long as it not 
cause other tools stop working, I'm fine.

Reviewed-by: Zhanjun Dong <zhanjun.dong@intel.com>

>   
>   	for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_STATE_CAPTURE_TYPE_MAX; type++) {
>   		list = xe_guc_capture_get_reg_desc_list(gt, GUC_CAPTURE_LIST_INDEX_PF, type,
> -							capture_class, false);
> -		snapshot_print_by_list_order(snapshot, p, type, list);
> +							node->eng_class, false);
> +		print_noderegs_by_list_order(guc, &node->reginfo[type], list, p);
>   	}
>   
> -	if (capture_class == GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE) {
> +	if (node->eng_class == GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE) {
> +		type = GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS;
>   		list = xe_guc_capture_get_reg_desc_list(gt, GUC_CAPTURE_LIST_INDEX_PF,
> -							GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
> -							capture_class, true);
> -		snapshot_print_by_list_order(snapshot, p, GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
> -					     list);
> +							type, node->eng_class, true);
> +		print_noderegs_by_list_order(guc, &node->reginfo[type], list, p);
>   	}
>   
>   	drm_puts(p, "\n");
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
> index 8ac893c92f19..e67589ab4342 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.h
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.h
> @@ -15,7 +15,6 @@
>   struct xe_exec_queue;
>   struct xe_guc;
>   struct xe_hw_engine;
> -struct xe_hw_engine_snapshot;
>   
>   static inline enum guc_capture_list_class_type xe_guc_class_to_capture_class(u16 class)
>   {
> @@ -55,7 +54,8 @@ struct xe_guc_capture_snapshot *
>   xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q,
>   				     enum xe_guc_capture_snapshot_source srctype);
>   void xe_guc_capture_snapshot_store_manual_job(struct xe_guc *guc, struct xe_exec_queue *q);
> -void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p);
> +void xe_guc_capture_snapshot_print(struct xe_guc *guc, struct xe_guc_capture_snapshot *node,
> +				   struct drm_printer *p);
>   void xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q);
>   void xe_guc_capture_steered_list_init(struct xe_guc *guc);
>   void xe_guc_capture_put_matched_nodes(struct xe_guc *guc, struct xe_guc_capture_snapshot *n);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 02871d319471..c980a5c84a8b 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -907,6 +907,33 @@ void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot)
>   	kfree(snapshot);
>   }
>   
> +/**
> + * xe_hw_engine_snapshot_print - Print out a given Xe HW Engine snapshot.
> + * @snapshot: Xe HW Engine snapshot object.
> + * @p: drm_printer where it will be printed out.
> + *
> + * This function prints out a given Xe HW Engine snapshot object.
> + */
> +void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p)
> +{
> +	struct xe_gt *gt;
> +
> +	if (!snapshot)
> +		return;
> +
> +	gt = snapshot->hwe->gt;
> +
> +	drm_printf(p, "%s (physical), logical instance=%d\n",
> +		   snapshot->name ? snapshot->name : "",
> +		   snapshot->logical_instance);
> +	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
> +		   snapshot->forcewake.domain, snapshot->forcewake.ref);
> +	drm_printf(p, "\tReserved: %s\n",
> +		   str_yes_no(snapshot->kernel_reserved));
> +
> +	xe_guc_capture_snapshot_print(&gt->uc.guc, snapshot->matched_node, p);
> +}
> +
>   /**
>    * xe_hw_engine_print - Xe HW Engine Print.
>    * @hwe: Hardware Engine.
> @@ -919,7 +946,7 @@ void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p)
>   	struct xe_hw_engine_snapshot *snapshot;
>   
>   	snapshot = xe_hw_engine_snapshot_capture(hwe, NULL);
> -	xe_engine_snapshot_print(snapshot, p);
> +	xe_hw_engine_snapshot_print(snapshot, p);
>   	xe_hw_engine_snapshot_free(snapshot);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> index 6b5f9fa2a594..069b32aa7423 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -58,6 +58,7 @@ u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
>   struct xe_hw_engine_snapshot *
>   xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q);
>   void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot);
> +void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p);
>   void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p);
>   void xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe);
>   

