Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 034ABA9BFDF
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 09:38:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8851910E8A3;
	Fri, 25 Apr 2025 07:38:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HAzVZ/B/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A6810E8A0;
 Fri, 25 Apr 2025 07:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745566697; x=1777102697;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kZPG0jn+XB0ti0kw0B6S18AL0653n0/1vY68IwFoE0Q=;
 b=HAzVZ/B/ih/J7wbjuUJi5/P7pDFUKzQFSEB64AUCjaw7GLpXHq7PoXoO
 C+6l1rM6oploeYk+vHneLdcKQCAZFnpR1IyXA448lAxs+I7EZlf9vnl/J
 yTPZkSn1ihIE5gWmFKZwC9IAJh19ATCS46t9psSXOtctdjjdppGyMOEzk
 39oxr7rdHF9Dmi4ZnmbEytm+qaAO21TNd1XwTaTJgIFjcJ0whcfbXdpb/
 qK+lK6KQwE9tzj2jsCcq/TV2ErPyhwCV2kWBd7/FmivqjYIInuzMSCMjc
 Y3fT9HwuvRvGYG+5xmI58ovEhUv9shen619UCcw6jR1FszwuiWmU70rh4 w==;
X-CSE-ConnectionGUID: Mx2UFqVJQG+YafqJLJMAZQ==
X-CSE-MsgGUID: jWExzZLuRIK0WSn/xKa+vA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="64638663"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="64638663"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 00:38:16 -0700
X-CSE-ConnectionGUID: 18qqWT6xTpmrbb6cjeYYWg==
X-CSE-MsgGUID: d8iz0tYpSEm+rHmOyI5aLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="133814338"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 00:38:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 25 Apr 2025 00:38:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 25 Apr 2025 00:38:14 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 25 Apr 2025 00:38:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b/TrdsP61LmWSe9fgH8Wby7bT3EZmYooTToPvZfw4h9XlS/G6YG1pLfaveRiYfLQMHH2mA2UlTEzU3R+72hF4mo0n7LRNfeRLSIhQI1NhtRyYvuuhf7Ek+HbMcixfw06pQNhJwZNowIMUfB0a71qJptTGlgHStw9EgZQzNHfCDO7iMwUHwsC1RrfUBCiLHe+BpCQ7Lx7XiJhxiJM8rB6ZoQ5KNhth655/xqWnhDXcNu81i0YN5t3FgvzyC+21sSgtHs/Z4qH+J+5pOu0nM8hE1nJOe+SnMY+6EuNIaU/Bz6qQrtUPsoUzkpNwh7OFypR2e0zXsRVO7SU/c7bPikfOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DgpTg6z40e3CvfZPICbWFk6WxzehIIfc21YmkAyX+yM=;
 b=jqgtd1UlsPiuylZSygHEIO/uMmM10OEOTKDh26gpXNz4v4vuxFftBMLyH7HMnDk3mfkr5ezcG694MM0PrAq+SZE/pUpRe4GeejEGJShOiiDtgJyMP3KS5nRq8296Uo8aW8DLhA0Oj+JhLHm2aninjD4CHZrev7m973RQF64Z6BymnYe6MFjVap0oJNEoaoilzUAM4+F8RgIhgkTFUzQV+/LfXQLikUkzUAMiPmC64MFLPJrCVEBa8fq7AX/xax0SkcS5G0MFK2RufSw5u4F0uzfZk4LVi0RyNZcmCjZcb7FyJAP4AimKROKTPzHjv/MdruGEJ3Iry9zWEUOj34XV6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4891.namprd11.prod.outlook.com (2603:10b6:806:11e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 07:37:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8655.037; Fri, 25 Apr 2025
 07:37:44 +0000
Date: Fri, 25 Apr 2025 00:39:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v4 2/5] drm/xe: Strict migration policy for atomic SVM
 faults
Message-ID: <aAs8GtJJm0zBNh1U@lstrano-desk.jf.intel.com>
References: <20250422170415.584662-1-matthew.brost@intel.com>
 <20250422170415.584662-3-matthew.brost@intel.com>
 <1391a2ab3cbf8b690f1ec371cdc932032a647645.camel@linux.intel.com>
 <aAp88xbpx3ik3H4p@lstrano-desk.jf.intel.com>
 <0a98149f281c081c4ef560c12a0e55fd2f3239aa.camel@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a98149f281c081c4ef560c12a0e55fd2f3239aa.camel@linux.intel.com>
X-ClientProxiedBy: MW2PR16CA0012.namprd16.prod.outlook.com (2603:10b6:907::25)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4891:EE_
X-MS-Office365-Filtering-Correlation-Id: 82732d17-6ce1-4815-14ac-08dd83cc115a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MCttb3d3ZjFhMEVtSjhYdkJBd2MxV2QwOUVCS1FxOXlTVEl4SDllVXltNlFs?=
 =?utf-8?B?c0NYcWdsYjZybnZabk9EenRHektialpybkxPS3dDSEt0SW1zRHpMaUdyVW8x?=
 =?utf-8?B?emJsTER2U0VpRHhxR0wydmNNTHM1VzB1WE5xN0krTWQxTTFRdG5Lc3ZGVFFN?=
 =?utf-8?B?clVOa0dtWUVPTDFtenM3bHpOcFp5WUxWenJQKzlXYWpGV1lCeUdxZGtyaTVD?=
 =?utf-8?B?TlphOXJSNmdwZU5KZ1FTdVg3djFRMzB4MDlOblk5cVVIUTIzRkVkdHh5cWk1?=
 =?utf-8?B?citkcTdkYWRyMWMwRGFZeTRZeWhzdmhpR3BPSXpHOGpnSXYxeDhKSEFMYkto?=
 =?utf-8?B?RXZwcUFBZXdvbmYrY24wdVA4djlUMzVSQlFrTm9wam5OM3FtcEpRY2ZHcXY5?=
 =?utf-8?B?ME9tQ3BNT1cxYXJmTlFPVHdzWEdHblM4Unh6OVVaU2x0NTJrbEcxdUZraU9V?=
 =?utf-8?B?S2t6TGpMRlZrQmdqblJJRjZVWUNtWk40enlweHdxQ3IyYzlIcU5kVVozanlu?=
 =?utf-8?B?eVFtSGwrTUd1NjQ3cHdGeVVDMHIrUGlYem4yVjE4Zll4QXVCTEJNTngwNjBk?=
 =?utf-8?B?M3o3dU1GMUQvYXprK2hmUXN5TWk3c2J0T1FsbS9XU1ZwZStFMFFuRy9KS1Nk?=
 =?utf-8?B?VHpMbURZaC8rc3RabVBKck94ZG9yazNHellySHlsWkphU3QvYzRwcWpMaVZR?=
 =?utf-8?B?RmxqdXFqVHozSWdDeDdWZDBiVG15dGhVcnhCcHF4K1BmMlZkQTQ3SzFqM3VP?=
 =?utf-8?B?WDZrZExIN0p2amhiU0xCSnh5QXZqTGp6N0JwRFZ2UGFpR2d2eFRVQTYyeWFi?=
 =?utf-8?B?aFBRZ2xhejNJUEc2R1d6R3EwS3F1dkFJQVpzVElJZkNINXAxNFV6QXQzTDZ6?=
 =?utf-8?B?MDVSb3VpV2ZyVVpvdzBxTmdnQVpweTEyc09GRmdnbklIM2NlbVdxYWsvRXRy?=
 =?utf-8?B?MXRXdVNPaENtemc4Tm5QQmdpZGdLWG5rT0xMb2RsSXdFMk9ReU44WUl6NVox?=
 =?utf-8?B?b0xBM1ZoM1hOT1VBeDdFU2t2cEZ5Wk1TWGlmS2h3N2JTSkVIbWZEZUk0N252?=
 =?utf-8?B?UHhjbUpmeCtSdUxCSEpyZUlnbE1aZ0VqcVlueTg2MytZQW1kYm01YVVCMm1D?=
 =?utf-8?B?akt0Vk1FaWxVcEtFZnp3WXAxTmZiQjExaWpDZ1cwbzRMK2xtMnhEYm9zSU54?=
 =?utf-8?B?OWo1MnUwVGtPbGtPUlVQbXpnSEs3cy9paVhRZTBCWnZ4MWcxSUdhUXdaSnBL?=
 =?utf-8?B?djRGN3J4aWZ2TDlFY252L1NXUHB3VVRjR2VhU3BrQXVxMEZ5NnVOUU9rbHZl?=
 =?utf-8?B?cFJ3WS9aUG9BZjEvaytCb1hWVVlleVNEbEpMQVBwY2VlTVhOcTJzek52b2Jy?=
 =?utf-8?B?enBrYUhGK2xVaEl3RE0xOWRMdUgyZDB0Ri81ODN1U1luQjltS0cyREhJdkpw?=
 =?utf-8?B?V2UzSjViWWhMTVRPN0hpSk1uSUdFUnZyNzg5VWw1TndOU2hsT2ZoUFpvYTRw?=
 =?utf-8?B?dE5tVHFaZkhrb3p2c1VFY0YzOXBWcmxjcmtLLzhoVURPOGJpeWNiQnZneEdK?=
 =?utf-8?B?bTRGNGJ4SzQvY29YUGJUV0Yxa1Z2QUdVSkM2aGRNaGptWkFmblZ4Si91aFc3?=
 =?utf-8?B?K2liMmFoclZ2d2ptbXVvM2p2Z1p5KytUMllkazg3QWpIemQ2K3B2Ym1EcW5s?=
 =?utf-8?B?aUg0MUNWSFlaQkdobytYMjlvc1JkY2dtanJyVXNLdHBpSG5OVnhsWHpNVmQw?=
 =?utf-8?B?L2dCdlA2MkxDNUN1cm9HdTBIVFN4RkFrcU8vRXQvaFVTdzQrMFdZYkdEY2dH?=
 =?utf-8?Q?npDggItQFlQX40QN5x/JVzNgnvIVZSLnAsJe0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVFVeGQvOGFYYzZmc3Q2MzlmZWNXRHRGeS9ZTVlwQXk5WG9WRUk2NnFzeG1B?=
 =?utf-8?B?WW1Nc1k0N1MwRFlFUUhwWVRHT2lEank5Yk9QbWd4c2R5dHJaREZrcUhsTGI3?=
 =?utf-8?B?Z3NKUndNUW4vdTV2RTFueDA5bTgxSFpzVmVwd1AyY2RBVEpQdmhCZEJBQWhl?=
 =?utf-8?B?QUVPS2s2Ym9lMlFIeXdKekFOV3h1a0V5UlFrQ3pFRnFqMnV2M3M2SkFEd1JE?=
 =?utf-8?B?dElpd1p5bk1WaWgwQ1VRNlBpdmFKSHRjd05OUVRYYmJpTTBqcG9jTkdaL3VX?=
 =?utf-8?B?T0JSbVpCeHVkRXJKQ2Y1cU1IWDdMMkZ6K3lURERpWEJpaDlEZ1gxSDZCU0I4?=
 =?utf-8?B?aUUvL29ERjcyRVVBUWNGdlhXb0t5aHBGeGJRcFJBT1ErQzRrUGV3RFVwMkRH?=
 =?utf-8?B?cXBkMklYR21lcFBqYUowNHZ2U3M3TEk4V1RHL3UrRWQ0ZHd5RjN4Y1dQTi9t?=
 =?utf-8?B?QWZmckNlODF0MVFwYWcvUTlxRG9NeGExSldQZi9BR0Njc0lLWmU5TmVWK2RV?=
 =?utf-8?B?RWZ5eVpRTnpIaWZMZzhaaVo2aDRhYU92QVBBVlJiTzV3ZmN6YTR0dFJ5OWlv?=
 =?utf-8?B?R1dpM2REMHl2UHRrRnQ5cG80NjZ0QVVqSk9hTnV3UVZQU05QVHZ1SDkwalFu?=
 =?utf-8?B?a1pvR0JZeDNFL2lIRGhQaEpzTysvTUxmbnc2M3JMaVp4aFVXS29zYmg3RlBK?=
 =?utf-8?B?TnNZZGxWdjY3WU41bFdBVWNwYjlkZzY3OTR4bFR0VUgrcWNYUWR2UVF6dERq?=
 =?utf-8?B?MWlnaHZYa3pkYXorMmN6TEFFcTUwcm1xNklaWFppTWJ4ekhxN0tIMlVmeGlC?=
 =?utf-8?B?eDIzazZ5K05WRXFzQjd2eUNuZCt5RERUVDVDK2JSei9GeUJJUkdhdDhiblp3?=
 =?utf-8?B?YzBXWjR6Q2M0WlRQUnd1Uk9GN3RpNmJYSjhGZkk5czlONUxwZERBNVFZa0pY?=
 =?utf-8?B?Rkc0Z1lITEJPRWlKVlMzdHJ6YUl2NDdsZ0ViSkhVdUxjTFVzQ2hpcUwrK3dN?=
 =?utf-8?B?akNUcVkwVzFLazVHWU1NU0Y3Mmpqa0xTVHM1OEgxcmpSY3BLNzYrakwwUU56?=
 =?utf-8?B?WEM2Z0x1WWVwL1JoSEZiSXd1OHY0Y2hmZXBhTG9NN2RxM2J6ZEhHRXJmcHZk?=
 =?utf-8?B?WWZQalZ2WHE0clVjd3ZhSVhCSS92Y3BsbWdVa2xJeXlQQnE1S0ZVcExuN1ZN?=
 =?utf-8?B?NUdrcERSeHJTQmhkMGVaSHU4MW9Zb0IzWmNXckhjaXlpN2trY3FmMjhGWUov?=
 =?utf-8?B?bS8xNS92S1VNR2hBWEN5Q3ZHbmc0OXR3b0hoUXRBbStKZmtrSUdqd3lvS1li?=
 =?utf-8?B?aERUNE9yZ1U5S1V1Vm9ueHdueXpQd1VnNU01a1Z3bk16RU54ZTdEemRoNGlI?=
 =?utf-8?B?R0Y4SWlGd0tOd0FLT3pRN2NTOWppbWQwYXQrSkZabEc0UXhqcnh3YUlZZ2Q1?=
 =?utf-8?B?M1lTOS9Da1RNRTIyZmJyejM3SUF2d0FUNTV3UWEvb2ZNT3pZaVRBOUpKelB6?=
 =?utf-8?B?NWxuVlN2bmQzeit5eFVmdFVDVjhyYmIwczFmWVQ1Rmx5QW04N1Y5K0w5MWlW?=
 =?utf-8?B?bWUvNEQyVjdzdVcyQm85SmRydzdMcStDUS9BQ0ZWMWpFWFNiZ1pKTmk3TmdQ?=
 =?utf-8?B?ZnhaR3c4MHI0cVFzS0d4QnJaWERGcDMvNk0yemQrTXdJWGZxUVdKNGRGOVBh?=
 =?utf-8?B?L2djYzBpUU50WnV5SCtIa1NxdDhJaTkzd0dwNktXY3F2RXdLbndaT21ESzBF?=
 =?utf-8?B?ZXptM2ZIQUR2cXZUcTYwZC9mTjZsYktGU0FsMXl3S3RIcGU2SWIyNVpGVVZB?=
 =?utf-8?B?Q2dER09MSXhaRGZJRkpNci9YbjN1SDl5UVcxYitjbmgvVS9DVzh5dEFmZS9L?=
 =?utf-8?B?Q0N5OFArNHhRdWNZeTZkSlkwYW5vZjQ2QkVrWFNyMXVqaTJaMk5LMXVOcHlQ?=
 =?utf-8?B?aWNYQ1lRSUFPNEZGdVlGby9GKzFic0F1a1ZVUTdYRXQ5WGQvNGN1eU5tR0tO?=
 =?utf-8?B?SExpcFlIZVpOT2NGM2U5TXUzSXZhUGN3K2hTd3JuTzk5am1ZajlZWmhIcjJF?=
 =?utf-8?B?TzVMeDNBY1E0bjJGcGVQV2k5Z1ErYWQ4T2c2VjdQb2FvcnZNcTVNMVpIaFE0?=
 =?utf-8?B?dDJYbWZTckZmbnJNQmhvRkZ2emYyaVM2TmYyQmhGQWs0NzV4L1VNQkJrbjFN?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82732d17-6ce1-4815-14ac-08dd83cc115a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 07:37:44.5496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p+mYNSW9W5nUvjNIsIauuNqOcfYsxEb+awd1vP8Tf0SDOkPBafQyS4fuRKuQJ4yBmWVBfFi8908XM7mMA569vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4891
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

On Fri, Apr 25, 2025 at 09:18:19AM +0200, Thomas Hellström wrote:
> On Thu, 2025-04-24 at 11:03 -0700, Matthew Brost wrote:
> > On Thu, Apr 24, 2025 at 04:39:21PM +0200, Thomas Hellström wrote:
> > > On Tue, 2025-04-22 at 10:04 -0700, Matthew Brost wrote:
> > > > Mixing GPU and CPU atomics does not work unless a strict
> > > > migration
> > > > policy of GPU atomics must be device memory. Enforce a policy of
> > > > must
> > > > be
> > > > in VRAM with a retry loop of 2 attempts, if retry loop fails
> > > > abort
> > > > fault.
> > > > 
> > > > v2:
> > > >  - Only retry migration on atomics
> > > >  - Drop alway migrate modparam
> > > > v3:
> > > >  - Only set vram_only on DGFX (Himal)
> > > >  - Bail on get_pages failure if vram_only and retry count
> > > > exceeded
> > > > (Himal)
> > > >  - s/vram_only/devmem_only
> > > >  - Update xe_svm_range_is_valid to accept devmem_only argument
> > > > v4:
> > > >  - Fix logic bug get_pages failure
> > > > 
> > > > Signed-off-by: Himal Prasad Ghimiray
> > > > <himal.prasad.ghimiray@intel.com>
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_module.c |  3 --
> > > >  drivers/gpu/drm/xe/xe_module.h |  1 -
> > > >  drivers/gpu/drm/xe/xe_svm.c    | 89 +++++++++++++++++++++++++---
> > > > ----
> > > > --
> > > >  drivers/gpu/drm/xe/xe_svm.h    |  5 --
> > > >  4 files changed, 65 insertions(+), 33 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_module.c
> > > > b/drivers/gpu/drm/xe/xe_module.c
> > > > index 05c7d0ae6d83..1c4dfafbcd0b 100644
> > > > --- a/drivers/gpu/drm/xe/xe_module.c
> > > > +++ b/drivers/gpu/drm/xe/xe_module.c
> > > > @@ -33,9 +33,6 @@ struct xe_modparam xe_modparam = {
> > > >  module_param_named(svm_notifier_size,
> > > > xe_modparam.svm_notifier_size,
> > > > uint, 0600);
> > > >  MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier
> > > > size(in
> > > > MiB), must be power of 2");
> > > >  
> > > > -module_param_named(always_migrate_to_vram,
> > > > xe_modparam.always_migrate_to_vram, bool, 0444);
> > > > -MODULE_PARM_DESC(always_migrate_to_vram, "Always migrate to VRAM
> > > > on
> > > > GPU fault");
> > > > -
> > >  module_param_named_unsafe(force_execlist,
> > > > xe_modparam.force_execlist, bool, 0444);
> > > >  MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
> > > >  
> > > > diff --git a/drivers/gpu/drm/xe/xe_module.h
> > > > b/drivers/gpu/drm/xe/xe_module.h
> > > > index 84339e509c80..5a3bfea8b7b4 100644
> > > > --- a/drivers/gpu/drm/xe/xe_module.h
> > > > +++ b/drivers/gpu/drm/xe/xe_module.h
> > > > @@ -12,7 +12,6 @@
> > > >  struct xe_modparam {
> > > >  	bool force_execlist;
> > > >  	bool probe_display;
> > > > -	bool always_migrate_to_vram;
> > > >  	u32 force_vram_bar_size;
> > > >  	int guc_log_level;
> > > >  	char *guc_firmware_path;
> > > > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > > > b/drivers/gpu/drm/xe/xe_svm.c
> > > > index 890f6b2f40e9..f749ae367a8f 100644
> > > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > > @@ -650,9 +650,11 @@ void xe_svm_fini(struct xe_vm *vm)
> > > >  }
> > > >  
> > > >  static bool xe_svm_range_is_valid(struct xe_svm_range *range,
> > > > -				  struct xe_tile *tile)
> > > > +				  struct xe_tile *tile,
> > > > +				  bool devmem_only)
> > > >  {
> > > > -	return (range->tile_present & ~range->tile_invalidated)
> > > > &
> > > > BIT(tile->id);
> > > > +	return ((range->tile_present & ~range->tile_invalidated)
> > > > &
> > > > BIT(tile->id))
> > > > +		&& (!devmem_only || range-
> > > > > base.flags.migrate_devmem);
> > > >  }
> > > 
> > > So let's say devmem_only is true here, and range-
> > > > base.flags.migrate_devmem is false. Wouldn't that mean the range
> > > > is
> > > unusable and needs to be freed and re-allocated?
> > > 
> > 
> > This is typo, this should be s/migrate_devmem/has_devmem_pages.
> > 
> > This translates to:
> > 
> > Either devmem_only is not required or we have devmem pages with a
> > valid mapping.
> > 
> > If migrate_devmem is false and devmem_only is true, that is a fatal
> > error actually, we should have check for that and kill the fault. An
> > example of this would be shared mapping which cannot be migrated to
> > devmem.
> >  
> > > Also another thing going back to older code, it seems like range-
> > > > tile_invalidated is protected by the notifier lock, so shouldn't
> > > > we
> > > assert that to be held in the function? It seems not to be held
> > > further
> > > below:
> > 
> > Yea techincally to get a stable value we'd need the notifier lock but
> > this is an opportunistic check - at worst if we read a valid range we
> > skip the page faults and will immediately get another page fault. So
> > we
> > could take the notifier lock here but I don't think this is strickly
> > required. Let me know what you think here.
> 
> The problem with this is that the code gets harder to maintain and

Agree.

> understand. A new reader would probably first react over the lockless
> read, and then why there are no memory barriers and then what happens
> if the page-fault was marked as resolved without actually resolving it.
> 
> So IMO if we do opportunistic tests to opt out of locking (which is
> discouraged in the drm locking guidelines
> https://blog.ffwll.ch/2022/08/locking-hierarchy.html)
> we should definitely add separate functions for that with extensive
> docs and READ_ONCE() annotation.
> 

A lock here doesn't actually gain us anything, though, as the state can
immediately change after lock release triggering another fault. If you
agree, I'll go with READ_ONCE and add comments in the code indicating
it's an opportunistic check.

> But also think if this is really worth sacrificing readability instead
> of actually relying on alloc_vram() and get_pages() exiting early if
> everything looks ok?
> 

alloc_vram() as is very expensive, get_pages() less but still CPU cycles.

The idea here is to short-circuit "page fault storms," where many EUs
access the same page simultaneously. If I recall correctly, this was a
significant issue on PVC—so much so that we are considering firmware and
hardware changes going forward. We should try to mitigate these
conditions in the page fault handler, if possible.

Matt

> > 
> > > 
> > > >  
> > > >  #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> > > > @@ -726,6 +728,35 @@ static int xe_svm_alloc_vram(struct xe_vm
> > > > *vm,
> > > > struct xe_tile *tile,
> > > >  }
> > > >  #endif
> > > >  
> > > > +static bool supports_4K_migration(struct xe_device *xe)
> > > > +{
> > > > +	if (xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
> > > > +		return false;
> > > > +
> > > > +	return true;
> > > > +}
> > > 
> > > Do we have any hardware that supports pagefaults but not 4K VRAM
> > > pages?
> > > 
> > 
> > PVC
> 
> OK, I was under the impression that PVC actually supported 4K pages.
> But perhaps there was a bug encountered while implementing that.
> 
> 
> > 
> > > > +
> > > > +static bool xe_svm_range_needs_migrate_to_vram(struct
> > > > xe_svm_range
> > > > *range,
> > > > +					       struct xe_vma
> > > > *vma)
> > > > +{
> > > > +	struct xe_vm *vm = range_to_vm(&range->base);
> > > > +	u64 range_size = xe_svm_range_size(range);
> > > > +
> > > > +	if (!range->base.flags.migrate_devmem)
> > > > +		return false;
> > > > +
> > > > +	if (xe_svm_range_in_vram(range)) {
> > > > +		drm_dbg(&vm->xe->drm, "Range is already in
> > > > VRAM\n");
> > > > +		return false;
> > > > +	}
> > > > +
> > > > +	if (range_size <= SZ_64K && !supports_4K_migration(vm-
> > > > >xe))
> > > > {
> > > > +		drm_dbg(&vm->xe->drm, "Platform doesn't support
> > > > SZ_4K range migration\n");
> > > > +		return false;
> > > > +	}
> > > > +
> > > > +	return true;
> > > > +}
> > > >  
> > > >  /**
> > > >   * xe_svm_handle_pagefault() - SVM handle page fault
> > > > @@ -750,12 +781,15 @@ int xe_svm_handle_pagefault(struct xe_vm
> > > > *vm,
> > > > struct xe_vma *vma,
> > > >  			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> > > >  		.check_pages_threshold = IS_DGFX(vm->xe) &&
> > > >  			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> > > > ?
> > > > SZ_64K : 0,
> > > > +		.devmem_only = atomic && IS_DGFX(vm->xe) &&
> > > > +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> > > >  	};
> > > >  	struct xe_svm_range *range;
> > > >  	struct drm_gpusvm_range *r;
> > > >  	struct drm_exec exec;
> > > >  	struct dma_fence *fence;
> > > >  	struct xe_tile *tile = gt_to_tile(gt);
> > > > +	int migrate_try_count = ctx.devmem_only ? 3 : 1;
> > > >  	ktime_t end = 0;
> > > >  	int err;
> > > >  
> > > > @@ -777,23 +811,26 @@ int xe_svm_handle_pagefault(struct xe_vm
> > > > *vm,
> > > > struct xe_vma *vma,
> > > >  		return PTR_ERR(r);
> > > >  
> > > >  	range = to_xe_range(r);
> > > > -	if (xe_svm_range_is_valid(range, tile))
> > > > +	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only))
> > > 
> > > Requires notifier lock. Also see comment on re-allocating the range
> > > above.
> > > 
> > 
> > Same as above.
> > 
> > > >  		return 0;
> > > >  
> > > >  	range_debug(range, "PAGE FAULT");
> > > >  
> > > > -	/* XXX: Add migration policy, for now migrate range once
> > > > */
> > > > -	if (!range->skip_migrate && range-
> > > > >base.flags.migrate_devmem
> > > > &&
> > > > -	    xe_svm_range_size(range) >= SZ_64K) {
> > > > -		range->skip_migrate = true;
> > > > -
> > > > +	if (--migrate_try_count >= 0 &&
> > > > +	    xe_svm_range_needs_migrate_to_vram(range, vma)
> > > 
> > > Requires notifier lock.
> > > 
> > 
> > Same as above.
> > 
> > > Should we have some sort of timeout instead of a try-count? Perhaps
> > > as
> > > a last resort fall back to a 4K range?
> > > 
> > 
> > I did have code like that at one point to reduce range size but it is
> > a
> > bit complicated as we'd have to remove the range... I'd rather stick
> > with the retry loop for now and if this becomes problematic, circle
> > back
> > to reducing the size of the fault page on each retry loop.
> 
> OK, makes sense.
> 
> /Thomas
> 
> 
> > 
> > Matt
> > 
> > > /Thomas
> > > 
> > > 
> > > 
> > > > ) {
> > > >  		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
> > > >  		if (err) {
> > > > -			drm_dbg(&vm->xe->drm,
> > > > -				"VRAM allocation failed, falling
> > > > back to "
> > > > -				"retrying fault, asid=%u,
> > > > errno=%pe\n",
> > > > -				vm->usm.asid, ERR_PTR(err));
> > > > -			goto retry;
> > > > +			if (migrate_try_count ||
> > > > !ctx.devmem_only) {
> > > > +				drm_dbg(&vm->xe->drm,
> > > > +					"VRAM allocation failed,
> > > > falling back to retrying fault, asid=%u, errno=%pe\n",
> > > > +					vm->usm.asid,
> > > > ERR_PTR(err));
> > > > +				goto retry;
> > > > +			} else {
> > > > +				drm_err(&vm->xe->drm,
> > > > +					"VRAM allocation failed,
> > > > retry count exceeded, asid=%u, errno=%pe\n",
> > > > +					vm->usm.asid,
> > > > ERR_PTR(err));
> > > > +				return err;
> > > > +			}
> > > >  		}
> > > >  	}
> > > >  
> > > > @@ -801,15 +838,22 @@ int xe_svm_handle_pagefault(struct xe_vm
> > > > *vm,
> > > > struct xe_vma *vma,
> > > >  	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r,
> > > > &ctx);
> > > >  	/* Corner where CPU mappings have changed */
> > > >  	if (err == -EOPNOTSUPP || err == -EFAULT || err == -
> > > > EPERM) {
> > > > -		if (err == -EOPNOTSUPP) {
> > > > -			range_debug(range, "PAGE FAULT - EVICT
> > > > PAGES");
> > > > -			drm_gpusvm_range_evict(&vm->svm.gpusvm,
> > > > &range->base);
> > > > +		if (migrate_try_count > 0 || !ctx.devmem_only) {
> > > > +			if (err == -EOPNOTSUPP) {
> > > > +				range_debug(range, "PAGE FAULT -
> > > > EVICT PAGES");
> > > > +				drm_gpusvm_range_evict(&vm-
> > > > > svm.gpusvm,
> > > > +						       &range-
> > > > > base);
> > > > +			}
> > > > +			drm_dbg(&vm->xe->drm,
> > > > +				"Get pages failed, falling back
> > > > to
> > > > retrying, asid=%u, gpusvm=%p, errno=%pe\n",
> > > > +				vm->usm.asid, &vm->svm.gpusvm,
> > > > ERR_PTR(err));
> > > > +			range_debug(range, "PAGE FAULT - RETRY
> > > > PAGES");
> > > > +			goto retry;
> > > > +		} else {
> > > > +			drm_err(&vm->xe->drm,
> > > > +				"Get pages failed, retry count
> > > > exceeded, asid=%u, gpusvm=%p, errno=%pe\n",
> > > > +				vm->usm.asid, &vm->svm.gpusvm,
> > > > ERR_PTR(err));
> > > >  		}
> > > > -		drm_dbg(&vm->xe->drm,
> > > > -			"Get pages failed, falling back to
> > > > retrying,
> > > > asid=%u, gpusvm=%p, errno=%pe\n",
> > > > -			vm->usm.asid, &vm->svm.gpusvm,
> > > > ERR_PTR(err));
> > > > -		range_debug(range, "PAGE FAULT - RETRY PAGES");
> > > > -		goto retry;
> > > >  	}
> > > >  	if (err) {
> > > >  		range_debug(range, "PAGE FAULT - FAIL PAGE
> > > > COLLECT");
> > > > @@ -843,9 +887,6 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > > > struct xe_vma *vma,
> > > >  	}
> > > >  	drm_exec_fini(&exec);
> > > >  
> > > > -	if (xe_modparam.always_migrate_to_vram)
> > > > -		range->skip_migrate = false;
> > > > -
> > > >  	dma_fence_wait(fence, false);
> > > >  	dma_fence_put(fence);
> > > >  
> > > > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> > > > b/drivers/gpu/drm/xe/xe_svm.h
> > > > index 3d441eb1f7ea..0e1f376a7471 100644
> > > > --- a/drivers/gpu/drm/xe/xe_svm.h
> > > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > > @@ -39,11 +39,6 @@ struct xe_svm_range {
> > > >  	 * range. Protected by GPU SVM notifier lock.
> > > >  	 */
> > > >  	u8 tile_invalidated;
> > > > -	/**
> > > > -	 * @skip_migrate: Skip migration to VRAM, protected by
> > > > GPU
> > > > fault handler
> > > > -	 * locking.
> > > > -	 */
> > > > -	u8 skip_migrate	:1;
> > > >  };
> > > >  
> > > >  /**
> > > 
> 
