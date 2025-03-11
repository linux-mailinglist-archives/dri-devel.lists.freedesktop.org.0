Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 783B0A5BFCF
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 12:55:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BAEA10E56E;
	Tue, 11 Mar 2025 11:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MhqmxYA6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0EB10E186;
 Tue, 11 Mar 2025 11:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741694156; x=1773230156;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Ar5G8jEv5aLXfQEX2/hT7Mc892eglQRhS3PB1uyIjb8=;
 b=MhqmxYA6KaqnTRvjtebkVCWIp8eLCPD+eqL1HNge78Sxfiwn/V7v5XC/
 eZCgOOal8NA3sGrxEQcyg7vx4AyTkbmUQmMzxK4ivg7B3/DP2pkQ7wq4O
 qqzIUzCUr01dnXiM+mYmD7nf9ORWnuaNGMSbMmwjb5tQJz0NSV82iG7CA
 +S+SpUdfnnrPVUsFA2E7IuiJJ2iLR0YE4K7fI6FqjUWYFtImAGFhOhZRI
 HkpNXnqyG8VX8Y10fIuBtY3JzWSUzk3k4fzb28jse8lTWkAGGmvYNLXD6
 jYWqbRAiy49D2sbid1ROFu/TXxPmBMJKv/b2HG4s4A0n1I/hr5v2oW1TE A==;
X-CSE-ConnectionGUID: 2Bjd22NzQh+0pC8paiz/+g==
X-CSE-MsgGUID: 8nJBfZZXQCW0gfgjUQ8Qzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42638914"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="42638914"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 04:55:55 -0700
X-CSE-ConnectionGUID: EVOlc/NzTtS60eVbf3a8ZA==
X-CSE-MsgGUID: KK6NjOAnT+avdV4ca7+LHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="120018915"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 04:55:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 11 Mar 2025 04:55:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 11 Mar 2025 04:55:54 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 04:55:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SnkUrO69/ORtas9g764CA2+CEhXw46Yefrcsw1R5MgH+SSJLdQ5w18/WHU2bRfUo170NOVo3jyj0roaAd9od4RHXfsYt6UWX+KEGCnmA56HXxmeGdhKZEKx5nAQ7J3WVMjGbzeEQP0fwUshS7kIuFkDLz7J8a+9KdASiJMuPi15vtnZCZTcrAzfQ6vRBPySwr3ElT8kswWMlqRLPZZ5wYbnZE9RAjAHZQMiGYWVZ+k5wTzZjQfm/lEz+ocF6Wv595jBVOUJL7wjGeVq24P9Bo2ObhTZ80ba2JXi8p6Oh5GvwZOWZvoBztXPXIvoYPrKPw895WOqq/hspLlVlX6vCHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CB02uBIo5THFm4wa9QKzC+iUdDNwHPqN7NAdAXrImKY=;
 b=p1mp3jjkOoQsVrlIrfsEnC2NbH+mD3mhGXMuR6t7+cVLWJdrq6SWz09x8H63jWeQnj6p/AJepGSGz5opjM3fZju3FcJSODni/OLapcCXdTzt1fyMP8MftSeT1DD/99P29Gx9kMrQ/VeNC7VeN7Z7ar/LJkUU4W0f5iXPpPo/NXDFNVs6H2RWZfm2V5YOCDhkZtktoezhNO0CgljpeNLVIZtw4t6sUO0NMoIbQkpcTRHx2kl3JPZalqzFAVnHKMEX9+yFsovQwc2IfwjRhjshtXT1NSjFYjAex3+IK1Fqhv2unMO+Mec8Ui4oqE+/hrq2T2rMNl8F1hV4Yw8G4dRPug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DS0PR11MB8666.namprd11.prod.outlook.com (2603:10b6:8:1bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 11:55:48 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8489.025; Tue, 11 Mar 2025
 11:55:48 +0000
Message-ID: <ce7813be-90a5-4bdf-ac9b-01fe9071590f@intel.com>
Date: Tue, 11 Mar 2025 17:25:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] drm/i915/display: Introduce HAS_CASF macro
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20250304102857.326544-1-nemesa.garg@intel.com>
 <20250304102857.326544-3-nemesa.garg@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250304102857.326544-3-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0070.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::15) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DS0PR11MB8666:EE_
X-MS-Office365-Filtering-Correlation-Id: aebc206f-4128-4e4b-4ccf-08dd6093a9f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2pDNThGYjRvYTJqeUtmTGNKS2ZqQkFIOWh1MTFpYUQ3TVFkOU04TDZyNWNh?=
 =?utf-8?B?eWd2SEJiZEgwbkFZSHdCNmlBUDdzRUp4Rm1zbW5vdDEwd3NlOTE3N2xXQlFD?=
 =?utf-8?B?SzQ4SVcvcHQ2TlBUMk05UGdSZDhZWEdQNnBYc0NyYXM3Y1RIUEhyamdpNmdZ?=
 =?utf-8?B?MERhVzlEeDFsd3hHS2I3bXBQeUsvZnpzL0tiT29aWGZlSkVDSzRGSy92WWFE?=
 =?utf-8?B?aEgvMTJFTzVqZnQxd3g1ZlBzekFtdEZ1QWRnSGVQckhHZzRJeVlsMW02M3VN?=
 =?utf-8?B?WmxWLzY2ZGF3Ukp6VVdxMTA1aVR4MDRhNHY3RVZvb3NjaXlpNllvQ0JGKzNQ?=
 =?utf-8?B?RU5Vb3pFOFJQOEpTRHNDVS9ndC80Q3JXL0lzV3VETGFKTVExR0U2TGUxdWxN?=
 =?utf-8?B?TjdYaExMdlB2eTRJZFVIdGQvelJyaGx2d3UvQXlIcmFMdXNjNHJRWVM4SVZC?=
 =?utf-8?B?SWhBUS9tM1I0Wkh2dTRvRmZYWmJMTzk0OGtsbWdtMjl5QlpjM0Eyakhyc0Vv?=
 =?utf-8?B?cExNUVAzUmpUbTFLOXRJWUJLdlN4NEVGRlJiVGlZK2lsMmYzUzhUS1czNDNX?=
 =?utf-8?B?OXJpbUJyOEo5UFgwUFNtbnN1Tk1yUHdtSXY1VThSMWptRmloWWkwUnB6K2RP?=
 =?utf-8?B?cmhONGVLVW50eEVTOTdlN3JCRmVJcDA5aHZIVTh2WUp3cEliMTBPd3haV0hC?=
 =?utf-8?B?UE5PUHI2WGM5TXJUbmJWaFBteUVmMmdNRTBXZHdsZnY3VnhtdDFkM2x5QWZl?=
 =?utf-8?B?MTJNQVRvTlRVbmFFelF4SDc4dUI4aFpWYnl0ZG5vV1F0QUlRUkRRa3E2Snds?=
 =?utf-8?B?bnkzTlRpNUdRbWxrS0U5T3VOQVJickFnNGFXaTJ0ZkEzMGNBWlRRZnhZTm1E?=
 =?utf-8?B?YS9ZT1Vuanc2QTVWMjAvT2lRK25kSVBDK3UxeTJDenMrLzdKenNwN3ZpUGN2?=
 =?utf-8?B?YTdGUWtYVFJScjV1YmdVam85cDVDd3JNMUZ3L05KOEZDd0tFK1NRQmRPSEVn?=
 =?utf-8?B?bXFncW9KekszWHpNSm8rUy85V1VOTEF0Z3hyTlhCQ2VxTWhRbGQ5eWlidWRG?=
 =?utf-8?B?RXJwcDVTTFNoRVZXaGVHSldVVU9aRjdpbXlqbEd0OFZ3eVNTWnE0WDErSzhX?=
 =?utf-8?B?QXFSTEdvMVY3UU0vSTJOK3J4NW43ZXlGdlpzVHFyaHhzKzVxYTVWK3RJY2th?=
 =?utf-8?B?YmpMMXpESmtVTlY0RzJpbzVDKzVKTUQ3Zy9BOUNML2RqZEpyUnQrSDlRbUpt?=
 =?utf-8?B?dFdtV1FYVFlVTnBrUzZXVUx4WndtYXZRNHlTN3BKbjNUZXZFekdLZFRIN0R1?=
 =?utf-8?B?cjcrdmorYjNkMjRBb0I5a0NOYVcwczY1bm1BdktGR3IyaXVjYU9vREQzMCtM?=
 =?utf-8?B?ckhCL01RWDQ5NXlsMzhMUFlnQkp2Qzk4VE9kNXpwb1gvam1GZjMzejRtMXdr?=
 =?utf-8?B?NHVmd3pIVlpZODdyVWphNTBHMnhZN2h0cDh1RXBWK3RJQUZ1NC9OVTZSWEF3?=
 =?utf-8?B?M3orakpKV0RUY1pac0xXdGpCbTh4WFYrdzhuU2lPejgvdHNRcHp3Z21WVUdn?=
 =?utf-8?B?RGpBUGxaWVg0ZEtjNDBQT3N6M2FJdnZScmRzUURoaHh6aE1hYkJWNnJZRUdJ?=
 =?utf-8?B?N0lmN3ByYVIvMFgvWUJ0Q0tIemZoZEliTFpVZDEyS2R2aFFWS2RuMDVQcHNn?=
 =?utf-8?B?d1JBZ2t1clEyTHFkSDRjQWc5U3hGWVhUQW1wUlVtclU1Tzhlby9EUjhrT3Jl?=
 =?utf-8?B?MVVibnRsQ2FjcE54UWNMU3l1eWF1b2RFSmNieVdTS2xCMmJ1MFZGdXRTZEp5?=
 =?utf-8?B?c3lhckJKa0tTTWM2ZjNHY1VjVmkzNkRBNVdsY3laN29VYWhkNURUQUdldCtz?=
 =?utf-8?Q?XwTVm1kMJhRwv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmlmemcwdEFsKzRHZWw0Sm96RHhvQk82UGJqU3grU0dua3pjL3ErYVFYOCtq?=
 =?utf-8?B?d3F0M0FJNitucVczYlFRQ1Eyc3pNSmpsck9lTnJpVm5BSk5vall6YmRjMTF6?=
 =?utf-8?B?UEpKRGRiNDdrbGQrYmF5dnUrcUppQ1I1RWd6SEpldGJVdHFuVSt4WFBJZW1y?=
 =?utf-8?B?bXFJdlpiYzFZNVkzZmYzNlRTdG1vM0trY0xldXpTc1dRNEU0ODNPTWdWM0ZQ?=
 =?utf-8?B?MVo3bWZVM3drSzUyVUxCQkFEb2FKSTVidzhsVXpzd3AyUzVjbEt3WE9YcUZ1?=
 =?utf-8?B?Sk92UFIyN0tpMUM2QTB4bWdjUUZSaERCWStuMU42TGxJdXhadzJORDlPSTR2?=
 =?utf-8?B?RWFFYWE3c2dPbGhvb3Zxb0traituOVlsTDBwc2cxaC80aEswS0lOYTBFTG9Y?=
 =?utf-8?B?UEg0S3BpUGt1cmpSejFqb2J1a0ZwMmlSWkY4WU9CUmsyR0JPVms4cjJxaGRq?=
 =?utf-8?B?dG5XRi9oWURlWFJJRytUTTZ2VWM3RU9YVi9zWkdtVVpZSnZTTGhTdVlOdFRE?=
 =?utf-8?B?SXVJMFVsMkZsRHhuc1liQ1FybkFOcXBDWTNwUXE1cWI1dTE5Z0QzdkxKeXVu?=
 =?utf-8?B?TGtmeVhmYVNxNmgxVUdvaDNCa2prM0pNQVcxN0hlYWRXUWNZdDNkQW0rZ045?=
 =?utf-8?B?UGFmV2FnWkZhZWpOU1lpTEJPQm1jZDVEVkFCZEI0TytvMzlFeW4ydmVja3FM?=
 =?utf-8?B?clBpVzJaQUxCbTZIVGRNMkxQZXk0QVM0TzkvL09vOW00MENPTzBVQzJnZTU5?=
 =?utf-8?B?RGphY1NONnhSdTVKb1J6U21WS3hHZzRidWpoeG9MS3hMUVp1NUdZOU9waFdi?=
 =?utf-8?B?K3pkTmNmQWk5VHVxaEFvaDZJR0Z6eVdFZDI2b0tUOGlpeTVTR2ZwOWwrTXhv?=
 =?utf-8?B?eXNkUDFZdDNCeHBYdUFUM3RSNnVvc3EvOXQ1Y1lCMlEvUlZuV0RyY1NLRERs?=
 =?utf-8?B?bTN5VmVtN1NPQ1o4bUsyK2RMTGpMVkFCLzArZS96WTNUYmtTRlZxNzBmeUQw?=
 =?utf-8?B?TkhmYjd1YXBDM1pRL3hwWU5RcGZKSExYdWN6T1BneVZFOTdjbHA0bDRBTmJa?=
 =?utf-8?B?Nk1SajFoUTNZOFZ1K1BxOWhLM3FkQWJLN0FOSUNra2NDdzA3emd5Q0ppZ2VZ?=
 =?utf-8?B?enZIN0NCaDE1MWxPb1pYUjZJeDZPZDN3NEUwclJRR3RWaTA2MExSNkVMVVkx?=
 =?utf-8?B?ZjNRcDB6ZXdwYThKeERwWlBBSW5ZT21CRmFiN1lUelovU21aODNYZWhPdVhJ?=
 =?utf-8?B?Tmh4WlVSZmRRSDFYZk90S2FPVmhNSGxhRnNXcTk0VUJuTUJDS05ReVM5TStL?=
 =?utf-8?B?QkE2ZjlXbzg4MjgrUW5tQ01qM1FOY29jU0J3QTQxbS91bWJHL0tYWk9yTCtW?=
 =?utf-8?B?T0wvUFV4V3VxTDl1V0JicnZJNUhuTng4QXFqSy82eXQ3UzZtNWFPUUN0QVQv?=
 =?utf-8?B?cTlBd0lhSXF0b1dtN0l4SnhGYzRhWHRVSGFMdTI3RnlGWWxjTm9ML0gyNSs5?=
 =?utf-8?B?bzNXZUJjTjdBMFd0VkxaekNTMWkrditoUis0UnBWT3VnMEFQL2JDaWlCNmFD?=
 =?utf-8?B?YzFuV3FiT0xYRXd5YWdqb1c1ZXgzWUx0UUtUZjN3L1ZIclkzYUpxdWZyY2pl?=
 =?utf-8?B?WDJiQ3JEb3pQejVlV2Jzb2VJWG5KcFFFTk0wTEpEWTM1M2E1WXRMZU9sM09Q?=
 =?utf-8?B?WmpFMFZOR2FNeFNBd1U1VmpIYnRVTjNmNmtnb0FpVVVhVGVQRHUrVGNITlll?=
 =?utf-8?B?aEdFbnlxeVVOMHYzY0NWUzhpOEVQcFdNN3E0WGtmSzhTb0FDMko2YUI3cnJu?=
 =?utf-8?B?Vlh2dm5hcnlMV3JGMEhpNlZVTm9ERWFpSDZkcFJ4OUFPTGZXNHNkbGp4Yiti?=
 =?utf-8?B?blZvZHU5Y3dMSDV4TThtbXVQbzVhZ1o1US9FbTV2c3Rod3h1emFrcnRGZ2pp?=
 =?utf-8?B?ZW5NUDlScTNUcGc1WUVabDZpUjYxVFQ3UXc5NmlWeHZubk5nS2FBY1QzQmxJ?=
 =?utf-8?B?Q0U2RmNTbFdRdENJR0FDQjBlMWRTcW00N3lianRGRFpGdm5hMmdld2czSVZM?=
 =?utf-8?B?dENpYWd4WE9FMDJINzF0RTJJbThOZUF2bmFSK2lFbGxTRkc3ektWQkJFaEpj?=
 =?utf-8?B?N3hKMWtiRmJOdHQ2M3lIRENUVk03azkzZXBRdEUyUnBNZmRrZE91aWlSWnpG?=
 =?utf-8?B?aUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aebc206f-4128-4e4b-4ccf-08dd6093a9f1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 11:55:48.8088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5wcQdvXBwWAQIt7kK+Kn+WzSughqxXv8Y0R++Sexj9YgON4D3kO1/oT/KT2kmHa4hcjitKk9fI/RFBbXnU/S5ytVvIs0BTNGsD/reVg4m9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8666
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


On 3/4/2025 3:58 PM, Nemesa Garg wrote:
> Add the macro for casf HAS_CASF.

A bit explanation about the macro and why is this introduced will be good.


>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_display_device.h | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
> index 717286981687..238488c4c3aa 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_device.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.h
> @@ -191,6 +191,7 @@ struct intel_display_platforms {
>   #define HAS_VRR(__display)		(DISPLAY_VER(__display) >= 11)
>   #define HAS_AS_SDP(__display)		(DISPLAY_VER(__display) >= 13)
>   #define HAS_CMRR(__display)		(DISPLAY_VER(__display) >= 20)
> +#define HAS_CASF(__display)		(DISPLAY_VER(__display) >= 20)


I think all other macros are in alphabetical order so would be good to 
follow suite.
CMRR and AS_SDP are the exception, for which I am partly to be blamed as 
a reviwer.

But lets do the right thing for CASF.

Regards,

Ankit

>   #define INTEL_NUM_PIPES(__display)	(hweight8(DISPLAY_RUNTIME_INFO(__display)->pipe_mask))
>   #define I915_HAS_HOTPLUG(__display)	(DISPLAY_INFO(__display)->has_hotplug)
>   #define OVERLAY_NEEDS_PHYSICAL(__display)	(DISPLAY_INFO(__display)->overlay_needs_physical)
