Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC92B49CDF
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 00:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4ED410E20E;
	Mon,  8 Sep 2025 22:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tu23M7gi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5646510E20E;
 Mon,  8 Sep 2025 22:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757370912; x=1788906912;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qL3Sa3Ia2/qquX3ki6rghaM0IfaWH8Dj6pYogC8iN2U=;
 b=Tu23M7gijvpBnVvZXeWaOJ8mQt/feqncUyQbA6WDTGNCJ1iIGoV+ma8+
 ORIeeva3Ctgf87+TmMZF5fmaTKWRAHzBS5vWT5s/A2BonYTFKCaWG4o32
 qtIwKMnYxVdBF0r0heIFsAgbRcu1AGjOYjkXYeuR/zLk/qb0fJa/Dq9sh
 NC82Uq/QSuT30mpJG68Q3PP63LT3QAvTG47o11d+Z5ePzHm1hpBVVhFXY
 4voz+uc0bFcVILs5Eqk8dI4k7EbPx9VWaONDmnIEdfrGUxeefWk/PrR2T
 z6JOlV3zn/pZi33TQBgwgaxr6SrRtTnLFRyC3PaxAIyPQwLRVv8gTowiy g==;
X-CSE-ConnectionGUID: OQpWZXloSvCeqTWUAL1D4Q==
X-CSE-MsgGUID: bww55iHmSD2vQV/HyoEqDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="71064813"
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; d="scan'208";a="71064813"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 15:35:11 -0700
X-CSE-ConnectionGUID: AIdFzUQoQHefR76isM6NQQ==
X-CSE-MsgGUID: I4sjh3ViQPeF2WB19V5vcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; d="scan'208";a="173715785"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 15:35:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 15:35:09 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 8 Sep 2025 15:35:09 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.71)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 15:35:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vSEoohv5O1ahvvrOzhvEHrD4IAmZDPzkWga77e80tMGMRYMKivlaXczT0RfUEmIFPG3MZuPpnBvvqcGD7bHtUR8wMNuTsmW+vH9bD4EBYBJxlLXD9PpPYcInwoY8LGxxrRkiGuNR76jxNIY/HLcaQeOGZc/Pdh98vK/xJG59LrUJR4fyHfMxh79DRZeKLK451GPjIU8qeoVfbFJKnUp3WkSEcXtJF6MNZyGXubX20UYraXGVa3xfsPojcd3EvU17qxHdqeN49TtvgO7nDejdBPiT7oDfAO2AF3+H45TuAEZCyVKWzn6T3KL+f/qmG7e2FOD9JAJ+tqDQpyk1kLMuXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jk3KinnB8p5but9Pi+VRgrwM74WR4Dgh5jheo7t/Sso=;
 b=R7tnzu2s9ZJOOzqd64Xrv+gcdXkv8T+KsiVN3RuMwsNuAlWxO+OSGsRDZXcbKUhRESOeKb92o1DnJLvmA89x/i/iOpS3xA/nr+fKODJGy/gquRGbyvP8iRHmTiKHtkwF0aqp4Vu05Dc4lY3ThRa+x/mqIHG2y62eSaJ6oO4LtNPW4MVNc0xufLKJ3xBDnnuyZl7Z1ZSd38q+DZTYCr0r69Ba93MkZ3BTHdSvfXWLaPdMX4ZibIiZPfF+TQ0NVvqArkqlPu5xrK0iiorPFfH9TT5VyyUQREprHO2utxApDCPcQjYfEyxmvIBsxD1oFLz9L73gsOuzaGt0IEGwbxYCRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SA2PR11MB4905.namprd11.prod.outlook.com (2603:10b6:806:117::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 22:35:06 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%5]) with mapi id 15.20.9094.021; Mon, 8 Sep 2025
 22:35:06 +0000
Message-ID: <96ea5929-1254-4b36-8d7d-f63cc769a756@intel.com>
Date: Mon, 8 Sep 2025 15:35:03 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/i915/guc: Add synchronization on interrupt enable
 flag
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-gfx@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: Andi Shyti <andi.shyti@kernel.org>
References: <20250902151419.231828-1-zhanjun.dong@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250902151419.231828-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0017.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::30) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SA2PR11MB4905:EE_
X-MS-Office365-Filtering-Correlation-Id: 0290c94b-e543-401d-4f1a-08ddef27f4ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVJzdk1ycWM1SDYvZDBMY2R5YlVRbmxWd3lDeVFub2NWZ2tOcUpXSEZSSUI0?=
 =?utf-8?B?aGwrOVo1WEw1N2d0NHVWVVluSGR2Z3BwM3RLdmJuNEFKblJOVDdQWTZjd3U2?=
 =?utf-8?B?UWpDZjlocmNxYjR1d0RRakNZUEhXT1JybzBhNUMyWEh5T1hSRlBMRDc1aktu?=
 =?utf-8?B?ZVlrbWNTMGI4Q1VXcERlcWF5NnZNSEZoVmdOQzhDQlZlVU1qYm9kdms5RzUw?=
 =?utf-8?B?K0UveStsSTlmM0hDUnFYay96N3F6UWhTVFNnVHBLTlhYTXhRTEs5UGF1SkpR?=
 =?utf-8?B?MCtTWGlERkdmVS9zaXVrdFp5KzkwNno0RHBHUSt6T1FNMkliaXNnZDhjZmRm?=
 =?utf-8?B?RUxCbkdPaG5UTmF3VElycDBXdFBrdkpOQ05lL3kwS3BSR0ZEcUpDTGNOR1lH?=
 =?utf-8?B?MG1ZNTMzMjFqMi9nKytiUkFIL0wxcjRrWTdiZlhhZVEzVmI3blhrQjBPRW9H?=
 =?utf-8?B?eUtwZXNvYzFSajI4VEtPRzBMbnRjUHVPVkE5RUNEVmFEbEovVTZRQ2VOTnBz?=
 =?utf-8?B?VEN6QVpqd3NxUGRJaGg4TUtnWkRjS3EyeTBjK25ONWN4bVhKYmJTdGs1NDF3?=
 =?utf-8?B?MHBrVVU0azRKaUlFL2VyZ0hSdzRaa3c5b1ZhVXBkdFB3eERHdUVyNFpzUGJC?=
 =?utf-8?B?MFlVQXpTODlXQW5vMzFlcnBwdGxGdVRKM1k1eGpJMGJ0MU9jMHVKbHd6dHln?=
 =?utf-8?B?M1E2TldWZ2U1R2lET3ZsNjlRYitieHdueTlsa2xoaHJ6VG9xU2lDRXZDYmJr?=
 =?utf-8?B?T2RNekIzNXNHYUpLY0J1Z2kxa3JNZDJlZ1NScndGUlVWYUdYMGRoNktGNWFx?=
 =?utf-8?B?QW5zalpRSVNFMzV0WjlZV0NEUTk3cnp2WFlBT0tvZlZhWXVmanY4Mm4vSGk0?=
 =?utf-8?B?V1NqdFlLL0d1cW5xSEZYbkVNK0hLMGRiUjQ3bURld2NhVmVhZUxQYjRZRmRt?=
 =?utf-8?B?bVMxVFp3d2M3THdSNHROSHh3RHRuSSt3ZlY3ckpNck9wMmVOckgwMkphdWUy?=
 =?utf-8?B?V3pDUmxsWlRsMjhyQ0dkaW02OXhRbmNUN25JWFZ3NHFtb1Fyc2lsdU5NNWRM?=
 =?utf-8?B?d0FMalBqa1FzeUQzN3lFc0lnTXJ2dG1MdHUvakoxMnpmamhhV2JYVzl0V0po?=
 =?utf-8?B?d1ovVWVLR1cvYVcvM2FvaWVPYnFZNEZTTmlwQmN3VDFBYUl1c1VCTW5FMmFy?=
 =?utf-8?B?MHkxTFhxaU9QUFJUSThINDRWaHEvM2tQOXZpODYrb0tLNnExRjY5QjZ1Zi92?=
 =?utf-8?B?bzg1a2haY1lmbVZ0VURodGZyU0c2Q2p4aU1ZMjJzQTRsTTRCV2xFY2FpRENT?=
 =?utf-8?B?c2hLc2htbUJyK0hOSzFDYUxoS2hmeWFvMWlaVkkwdVlBalQySHlnb3pDR3dW?=
 =?utf-8?B?UTFnblkwMkVYTDN6a1pPKzNlT1Qvc0RMN0pNK3p1SXRTZVF5Q0xONmpaQW41?=
 =?utf-8?B?ZU9YR21NRWxBcFRieithYUJPS1AyZWlrWHRkelZTU1YwTCs3YWNna2NoS2ZL?=
 =?utf-8?B?c1RwbUhUd3Ftd3lKeWV5djAwaEk1dDZMSFk3dk4yZ2gzOU8raGRJUWFvRGRG?=
 =?utf-8?B?WjRlTGVuM2FaVUNzMlRZTjN1RVlkWmpyamJ0QytIYU9DVkVGSmxYMTJuY3FQ?=
 =?utf-8?B?a2Z0SFJNNTIvSFUrUnZLYWpiQUxPbXNXR3hrd2FBc3NoL1pBMk50R3pXTVR3?=
 =?utf-8?B?RTd1cW1wVElSdUJGaGVNbGJmWUJsSTJjWW92dGt3MHNwTklpNVZnK0xjbHp4?=
 =?utf-8?B?VHl6RmVGM1NCZ1BKT2Z5R2Z6Y1pjQTR3Tkx0bVZZMm4vUUl0d3JtUnF2N2gw?=
 =?utf-8?Q?eSj67gl3V5BGuljrbLq2JDoqBzZJolwA5zRjs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUpHZ2RpTFRDMThhWG52UVFnM3JPTUFaOHBKV002aHpoTGFETDZGQng2NXM3?=
 =?utf-8?B?YXYrbDQ4ZVZFd1RZdFdkcUZGd2hBRjdLQUhsZ05FTVNoU0VPK3lsR24wbWxE?=
 =?utf-8?B?b3FCQ3NSak5SUWdXRlRwdTY0Sms4UVBtOC9GTmFhQU55Q0dHOHVreThoN1NG?=
 =?utf-8?B?VUJJV3ZSU3ZscnltOFB6TEpBcDRvakFJK2l5TWpIY2k4UHp1KytvYTRXc0dB?=
 =?utf-8?B?YUN0ZnVLWXlRZTBsUHVlcHNTNWUrQUxZaVVBOWQwZEt3RDZGWmhJZ2tOb2t6?=
 =?utf-8?B?ZmZpS1VrUHdFWFNrcWdneXpOeHpxeVJlU01GbTBOTnl4a2xQUm5MdzBYZk95?=
 =?utf-8?B?dzI5eDFwS1ZyQmdGbithOGZWZlFUdWZlMUgyNkpGTDdGNm55djlRZld5U3ZN?=
 =?utf-8?B?Y3l4UENONG9xaFYxSkVXQUVhOC9yQTFZdDlCR0pQM1dVcEJBcXd6T3dzeTdF?=
 =?utf-8?B?cG1Qd3llNFRvWkgwc2hsamZPdWcrMVZBMklvcWtmeHJlbjhydnk1Y0h5QW9U?=
 =?utf-8?B?YVNPaG5USnRvN0xDUmRtcTJTcnRrVlhnamEwWmFXaHFhZ3NMZlZPWFJTMUZ1?=
 =?utf-8?B?Y3gzN1VPRHB6MmM3SkpjTGU3S1ZTQUFoNEdIT0pNZlZqOG5SSVlacGtWN1RS?=
 =?utf-8?B?a3pUN0M2aDBNdjlBM0psOGZHUFcrL0tJQ1BQZit3Mkd2U3ZvZ2FkVnZVWXpv?=
 =?utf-8?B?aWV4Y1dya2dGREVTVGNDK2lKOWQ5RStWVkZFV0tqbjY2Q05NSXRSOHIyeHVG?=
 =?utf-8?B?ZmdaTWROQnhXM3VRUklYYitOSHBYek56Sk9IZGFDdGt3WGdwdEFsN3dmdGpH?=
 =?utf-8?B?WTZpVzRXVmhtK1RpVy9KVFdOR2hEZVZ5YjFtRUtRZnJGNHFNL0dCRE9zb3dm?=
 =?utf-8?B?NWZJTTBDUWhFeEJjM3crTjhhR3VXV25tdFZqNFRsQXM5VjArdDFWbXVGMzNk?=
 =?utf-8?B?b1owaFdIMk9rZWZyczErbjlnUVRkcDRHS1ppWFNEYy9hdStsOStZM2RveGFn?=
 =?utf-8?B?NHFQbGNYUjE5ajZTYlJncVIvTFpxMlJFRm1uYjNodFB6TzZhMEw1TWZpSEpG?=
 =?utf-8?B?eXZtcGNBMy9JT0doOWVKcCswdHk4RHVrRGwrakREWUkyS2ZHVmRQMEFOb1ZP?=
 =?utf-8?B?QlRuQVJpaThSc09CMHMxMFJTeVJESGhjNllBV1h3aDErMFlWS2Q2c24zSXp2?=
 =?utf-8?B?cnY4WXpoOHJ1c3NlOHJrZEpaVDM2MDN4OWFiVHhNaGhpVGxSL3VoNEI2SVZN?=
 =?utf-8?B?S1ZhV29BYk5LdjNsMzdmcmMrN1ZzN2xHR0JQVG9LejBHOGJJdWtBV1Z5RzVt?=
 =?utf-8?B?MUFzM2FGK3RLN2I0WWtaMGJIaFJzUzVUV3d0R0VXQUFZWmN4R1B4b3RoNnMw?=
 =?utf-8?B?YlNFQVBaYVlhOHRnRElYUXBDSTA3U3FkS0ZBVkZ2YThYak40ZFhSRllXYi9N?=
 =?utf-8?B?b3hzeUlKSmI3RC9YczlmSjdHdHM2MGY5clNJejVUcW12K1U4Yi82NGNKdkov?=
 =?utf-8?B?MnE4UVpHNjBHUG5qVktUaG50bUJjZkoyYnI3eEFNc25vRW50enpEWUF1Ymlt?=
 =?utf-8?B?b09DazRyMXFWN09qZTIydnF0R0JBMVhWTUlMbmNxL013c3F6NmpUeVJUdHJu?=
 =?utf-8?B?aTBHbjRmNHFJc1czdzhCcU5qYnZSdXRPWFVhS1U5ZVdlc1ZMU3V0S080SDB0?=
 =?utf-8?B?a21JWlo4Q0VWTE1QYVk1NmVsMWdwbGxnMFEyaFhFcnRGeVhJNzN3RW13OVQ3?=
 =?utf-8?B?N1JYOENONEpKRlNoQ0EvSytUUFNHUFJ4VUg4Y0FqY3VwZ2hFSFdmNDVlaitm?=
 =?utf-8?B?MzdKMG4zcktXZWhmZXVTdEJJQ2trWG92MS91dVpveFR1SnhBdHoydnQ5Mzha?=
 =?utf-8?B?ams2VkhFVHUyTDV0VmRFNVl3RUF6WnkxMG11MGo4aEdtRmRlYWNoOVp5WDdP?=
 =?utf-8?B?SUNjekRGME0zdU1kU2pFQTFCOVpuaFpZUXZIWE15SWJxbXVPSjg3TXhidUZw?=
 =?utf-8?B?cEo4VzZ0eERVMjNrMGNBOTNzaDVVZ2ZySG9wM09IMk5pMDljWWVIOSt1K21H?=
 =?utf-8?B?dTdsRjZPQVVYWkZCbmFNQ2U2RGlnV0UzSElFVnJMOERyNUl4TzdrRzBFYW1y?=
 =?utf-8?B?em9qRFhMeUx6Z2xXNFBnbUM3VlBacmRoVUVBSGE3cVM0YVVUK0dkWFNDUUdG?=
 =?utf-8?Q?8PiZES9260oJHf93gkERfN8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0290c94b-e543-401d-4f1a-08ddef27f4ed
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 22:35:06.0770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KWkWo+NsCECTCiSJ7EkyOUnSQs/PW4sjftNUlsU+/7LwqX2cxVAvznXuA+L/+ZP2HVabfN9NLlr0Tr24QFLuiYal4a/VZ00WHKAOQwMZP5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4905
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



On 9/2/2025 8:14 AM, Zhanjun Dong wrote:
> Boolean flag access from interrupt context might have synchronous issueis
> on multiple processor platform, flags modified by one core might be read
> as an old value by another core. This issue on interrupt enable flag might
> causes interrupt misses or leakage.
> Change the interrupts.enable type to atomic to ensure memory
> synchronization.

I am not convinced that making this variable atomic is actually helping. 
The issue is that the tasklet is running after we think we have stopped 
it, which is much later than us setting guc->interrupts.enabled to 
false, so there should be no risk of concurrent access to that variable.

>
> Fixes: a187f13d51fa0 ("drm/i915/guc: handle interrupts from media GuC")

I'm not sure if this is the correct guilty patch. While this adds 
guc->interrupts.enabled, that shouldn't have changed the timing of 
things around reset. The issue seems to be that a task already started 
isn't cleaned up properly, while that patch changes how we stop new 
tasks from starting.

> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14834
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> Cc: Andi Shyti <andi.shyti@kernel.org>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>
> ---
> Change history:
> v4: Add back skip on disabled case for tasklet
> v3: Drop skip on disabled case for tasklet
>      Drop memory barrier
> v2: Add skip on disabled case for tasklet
>      Add memory barrier after flag changed
>      Add Closes tag and typo fix
> ---
>   drivers/gpu/drm/i915/gt/intel_gt_irq.c    |  2 +-
>   drivers/gpu/drm/i915/gt/uc/intel_guc.c    | 11 +++++++----
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h    |  4 ++--
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c |  3 +++
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c     |  5 +++--
>   5 files changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> index 75e802e10be2..21804eec8320 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> @@ -20,7 +20,7 @@
>   
>   static void guc_irq_handler(struct intel_guc *guc, u16 iir)
>   {
> -	if (unlikely(!guc->interrupts.enabled))
> +	if (unlikely(!atomic_read(&guc->interrupts.enabled)))
>   		return;
>   
>   	if (iir & GUC_INTR_GUC2HOST)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index f360f020d8f1..1b8d3bbfa16d 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -100,8 +100,8 @@ static void gen9_enable_guc_interrupts(struct intel_guc *guc)
>   			 gt->pm_guc_events);
>   	gen6_gt_pm_enable_irq(gt, gt->pm_guc_events);
>   	spin_unlock_irq(gt->irq_lock);
> +	atomic_set(&guc->interrupts.enabled, true);
>   

Leftover blank line

> -	guc->interrupts.enabled = true;
>   }
>   
>   static void gen9_disable_guc_interrupts(struct intel_guc *guc)
> @@ -109,7 +109,8 @@ static void gen9_disable_guc_interrupts(struct intel_guc *guc)
>   	struct intel_gt *gt = guc_to_gt(guc);
>   
>   	assert_rpm_wakelock_held(&gt->i915->runtime_pm);
> -	guc->interrupts.enabled = false;
> +	atomic_set(&guc->interrupts.enabled, false);
> +
>   
>   

Extra blank line

> 	spin_lock_irq(gt->irq_lock);
>   
> @@ -146,14 +147,16 @@ static void gen11_enable_guc_interrupts(struct intel_guc *guc)
>   	__gen11_reset_guc_interrupts(gt);
>   	spin_unlock_irq(gt->irq_lock);
>   
> -	guc->interrupts.enabled = true;
> +	atomic_set(&guc->interrupts.enabled, true);
> +

extra blank line

>   }
>   
>   static void gen11_disable_guc_interrupts(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
>   
> -	guc->interrupts.enabled = false;
> +	atomic_set(&guc->interrupts.enabled, false);
> +
>   	intel_synchronize_irq(gt->i915);
>   
>   	gen11_reset_guc_interrupts(guc);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 053780f562c1..40242bbb166e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -93,7 +93,7 @@ struct intel_guc {
>   
>   	/** @interrupts: pointers to GuC interrupt-managing functions. */
>   	struct {
> -		bool enabled;
> +		atomic_t enabled;
>   		void (*reset)(struct intel_guc *guc);
>   		void (*enable)(struct intel_guc *guc);
>   		void (*disable)(struct intel_guc *guc);
> @@ -393,7 +393,7 @@ static inline int intel_guc_send_busy_loop(struct intel_guc *guc,
>   /* Only call this from the interrupt handler code */
>   static inline void intel_guc_to_host_event_handler(struct intel_guc *guc)
>   {
> -	if (guc->interrupts.enabled)
> +	if (atomic_read(&guc->interrupts.enabled))
>   		intel_guc_ct_event_handler(&guc->ct);
>   }
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 380a11c92d63..f0ee3f1235d4 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -1326,6 +1326,9 @@ static void ct_try_receive_message(struct intel_guc_ct *ct)
>   {
>   	int ret;
>   
> +	if (!atomic_read(&ct_to_guc(ct)->interrupts.enabled))
> +		return;
> +

The GEM_WARN_ON below is there to guarantee that the tasklet is not 
running when we don't expect it to. By adding this check above, you make 
the check below impossible to hit, because interrupts.enabled is always 
set to false before ct->enabled, so we'd always exit silently here 
before reaching the GEM_WARN_ON.

I see 2 alternative approaches here:

1) If you can motivate the fact that we're ok with exiting silently here 
without logging an error, then just remove the WARN_ON from below and 
exit silently if !ct->enabled
2) Make absolutely sure that the tasklet is gone and not running before 
setting ct->enabled to false (e.g., you could leave the tasklet as 
disabled and re-enable it after the GuC is re-loaded).

Daniele

>   	if (GEM_WARN_ON(!ct->enabled))
>   		return;
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index 4a3493e8d433..9d01c3c3d504 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -659,7 +659,8 @@ void intel_uc_runtime_suspend(struct intel_uc *uc)
>   	struct intel_guc *guc = &uc->guc;
>   
>   	if (!intel_guc_is_ready(guc)) {
> -		guc->interrupts.enabled = false;
> +		atomic_set(&guc->interrupts.enabled, false);
> +
>   		return;
>   	}
>   
> @@ -687,7 +688,7 @@ void intel_uc_suspend(struct intel_uc *uc)
>   	wake_up_all_tlb_invalidate(guc);
>   
>   	if (!intel_guc_is_ready(guc)) {
> -		guc->interrupts.enabled = false;
> +		atomic_set(&guc->interrupts.enabled, false);
>   		return;
>   	}
>   

