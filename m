Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D0DD165B5
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 03:48:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10D210E2E5;
	Tue, 13 Jan 2026 02:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ua+ynB3P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 434C910E2E5;
 Tue, 13 Jan 2026 02:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768272486; x=1799808486;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=5ouqQBVLVE9p6w0i5nIbScN2Mc+8QHCQTWeP2+PzJaQ=;
 b=Ua+ynB3Pg3RHVUD+uFOLzdqn6cR62E/4u++fbih/aLqRnAwjiFiF7YIH
 hstgodf7AMgFaK4AcgX12bw1JbkFuuK/aq4OQdD/m5C+q09yhbZqdSpDr
 Tnx/1L708ofv6IoEksUtwb5iG3N/q3a4UjW8q1uJ5eeG2Hj0D9cEOykzy
 WeJ/mpkrXNmeupEySVOMrvTvRQi/mhMli+nxrgcquyCwdTJeut/KKT++1
 HcM5PJkDIzuuuVsabfR6G3cde0P6Dm6d3P6tkzITaQzIcfOIgfsAlHlrn
 iL2f+S8Q/vSOCZZjfit0c6CpRWt38/7ULSmtgs0YYWKVUYFU+Ld5ceIxh g==;
X-CSE-ConnectionGUID: J+h7WlZ/RcGQu+6+zSX1nw==
X-CSE-MsgGUID: c6CQhYBRRLC1pL7GupUOQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69464914"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208,217";a="69464914"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 18:48:05 -0800
X-CSE-ConnectionGUID: vBesM3Q3TleOlozNdfUn0w==
X-CSE-MsgGUID: b9y+Ccr6Td6s0hPCzehuCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
 d="scan'208,217";a="204162746"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 18:48:05 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 18:48:04 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 18:48:04 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.1) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 18:48:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ukKUYycGxn+5iUNjCCrpxWFNROeNyIWpRrZkNpInPEt4IK2+cEukw+Mz5N1cn6Qj/Yy+93KwIMQIdZoHNE6mx4Na6YFkfMVypIOHA6u26bb9kvPlmR1UXSkR1aiRZxvCo12OeeY0GR2BUpPIEB3KRe3yx/e+Tx31tHXFPMkQ0lBPLStw0Uf7mq1thTQ6Kex1H6QPx5vxq4IlFC3/N826hletNoD/gbgkm+gqp/+gsA+JWdHw3StIpkTJYH4G8SbZDj+g1eIsy2qCZZCIqCR+3Wkd5QmW2hQctfSNtfjWhX6bdlS5r1/6NNWUuHzWiVqYU3hRiu+QYWgCdRkc+CRcZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5PQ4yd3EMB95te8WtJKmJ7b/U3xf/ajJpdkIql6cew=;
 b=GX9S+m5ZvGVi3tCAFiVuinsI/SlkSqMK1FFrrHSbNn7bkMvBImoAa99FA7J0XsSIJd1JBV0La3QPwjntaL74kjj7dLjVoqBNM+96N3oI1GSbabgiHdfspr7I3zc7LP5wUasGJF4nM0D0dOAfQ5E+fKtWvUpSiRt9VDZGB7lF0AGO6oCOMJVPSURrBC/GJGJym4Q7rn0bSLQJW74ElV+G63Q8tDIwtCwZjKTGCWMd7i/A4cBfymCQTCIS7UNGKigT/UHZw7aijqKGV+FLBiXfFufHCsBcpvwesRP9BsmOZJGD472KnctPLYl06Oa1ax2GQHqLEXoLpZ/G7Kk17jJK/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DM4PR11MB6165.namprd11.prod.outlook.com (2603:10b6:8:ae::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.7; Tue, 13 Jan 2026 02:48:02 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%6]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 02:48:02 +0000
Content-Type: multipart/alternative;
 boundary="------------4jWdDClFEj3gjCl64a5tJflb"
Message-ID: <8a403d10-a5e6-4332-a584-a1aa554c4040@intel.com>
Date: Tue, 13 Jan 2026 08:17:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH [RFC] v3 5/7] drm/atomic: Allow planes with NULL fb along
 with async flip
To: Xaver Hugl <xaver.hugl@kde.org>
CC: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, "andrealmeid@igalia.com" <andrealmeid@igalia.com>,
 "Kumar, Naveen1" <naveen1.kumar@intel.com>, "Syrjala, Ville"
 <ville.syrjala@intel.com>, Dmitry Baryshkov <lumag@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20260108-async-v3-0-e7730c3fe9ff@intel.com>
 <20260108-async-v3-5-e7730c3fe9ff@intel.com>
 <6316ba11-0660-419c-afb6-a1588f6efef5@mailbox.org>
 <IA0PR11MB73076D91D60F168B9D112051BA82A@IA0PR11MB7307.namprd11.prod.outlook.com>
 <05ac3e30-b3dc-48ea-96db-1cbdb4454730@mailbox.org>
 <385071a7-15c9-4265-87b0-fe30dcf6f87e@intel.com>
 <702511b9-28bc-4ea0-809c-f14135a80af1@mailbox.org>
 <63c2c8b1-d695-454b-ada1-b79d61018bd6@intel.com>
 <CAFZQkGw5GTsebz_7vp48zkwtfNfu1uRU3p=nhibY8+WxgeEBOQ@mail.gmail.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <CAFZQkGw5GTsebz_7vp48zkwtfNfu1uRU3p=nhibY8+WxgeEBOQ@mail.gmail.com>
X-ClientProxiedBy: MA0PR01CA0016.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::23) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|DM4PR11MB6165:EE_
X-MS-Office365-Filtering-Correlation-Id: 95ab18e8-beff-436e-47d9-08de524e2b0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WG4vVWhFZ3NCdGNONFdlaTVQakhzdzNzT3E5a2JKNy9Sb3VsZGlDUnltY2Ew?=
 =?utf-8?B?dTFheitSTEVBWEJpa3JBQmJoK012WGFBMlRDQ1NYZytPMlk4MXhqMHo3ZjUr?=
 =?utf-8?B?Ukh3V2cydmxSbDZOVERwTHpGVGduSnAwSnVFVERFeEw3dE0vUmMzd0NDbmVB?=
 =?utf-8?B?a1BSWEExdUY5ZXRRMHJGUU41d1lIdHprRTBNTTc4bkJSdjFwTFFQWW03TDJs?=
 =?utf-8?B?ekR5UEN2Z3cwSHU2eUgwMTJVaVBZVGxuQzBwNC9ITUN2V2ptelpyajNSOVBU?=
 =?utf-8?B?NzVja1R5aW5nTlJSNER6YVpxYzJFUVJnR0JBRGhneW1XcW14STBDbCtlU0dU?=
 =?utf-8?B?L0RFeFZSZnBad3NpNFhxbnJBOWdXa3hTTlY2TTRSME9LY29SNVFFcllvWGFz?=
 =?utf-8?B?SnRXeFdWcGpPeFgrMmg4OHFVOHpYZmU3N1BHZWtHakxDL3dwTHFtUGFRM3pO?=
 =?utf-8?B?WFd3NEpmZU5ZY1dNcWdMWHk3T21KcHpvUzRJdlhsNHMvY2ZpTWRNVnFzamJ6?=
 =?utf-8?B?cEEvTGtnLytlT3Ftb3lNR0ZLU1ZlT21TVkxaMkh4dmJiM0RkT0RlTTdkM3Iv?=
 =?utf-8?B?eTJlRkQyL2krNXc4aU1PWnc1aC9OU0hMY0tZS0sydHFRMWFxUVM1bkcreU5P?=
 =?utf-8?B?MnE4bm1XTzVVUTY2NzE5VkR2MERUQXQva1gyQk1GLzNmQXpFV1VsbVJGZWVR?=
 =?utf-8?B?NnhsWHdGMkpMTWNBMkxoalUzbXUyWkE4c200TTZPR3Q1ZUR2RXkycmZWakpV?=
 =?utf-8?B?bEgxRFBrMExQdWZYOXNPeFY3cnpvcXJHQURyN0x4aHRaSnlybXdSRXM5cVZi?=
 =?utf-8?B?QmZFZXMxYUc4eUJ4dmEvUXZJY0U3RXVzM2ZPbng5UGVQRU9DZk9kMUNhN0JP?=
 =?utf-8?B?bGJkZXhuVmgwYjlLRlM3bXpjZldUa3QrN1NEbjFMR0d1TldPLzhzS2VpS0NF?=
 =?utf-8?B?SXk1dllPRGx5alE4ZHhyWjAwc3drckZWNTZrMFllTXJCeEM0aUJwOHRiL1p6?=
 =?utf-8?B?dm5mUHVDSXZZVzVJZjdJTkRrWHlDUjNFVWwzZno5RkZRdGZXcWFGelpkNVcw?=
 =?utf-8?B?OVlheHVrYmFTZy9VM0FQQ1pWWE9SWlRtVStqS3ZzeUZ5V0phQ1ZIK2xSWC9s?=
 =?utf-8?B?VVg1djNBbzlVNDJMa0xFS0dpdTlseGFUUGZHRnJnemxxQnlWd2xoZURiWEdU?=
 =?utf-8?B?QTJJdzg4NlBISWRRblBKa205SHVOL1lPWkpTNU9DdlliYVFlMWZXdURhalhQ?=
 =?utf-8?B?eDN5K2dIRFVhT09SMnNkeWlaeUdQZmtNengwd1NvZkxmRnhwTHRHUEx3b2xJ?=
 =?utf-8?B?djZiak5vb3c0dFg1dkd5aUhsZ3R0WFVGNUQwdlE3QittVnlQdlpGcE8waE9t?=
 =?utf-8?B?Q2JNWFNzcjRxZllXa0RCRjJLRGhNci8ydGZvMmNIQjJzYXZzcit5V01zOUJD?=
 =?utf-8?B?Yk41NW1IbW13R2I0bXJPQWJ1YnpGOFlSVE1aREtWQWg1UWtDdEQxYm5RakpH?=
 =?utf-8?B?N0dvcWJTUi9Bd1J1MzNQaHd6VWZHd2tRSG5tdzlmbFpUc0pCYUMxNTFWbG1P?=
 =?utf-8?B?V3Z2VXRhRStNS1hZc0VOMkF6dEdYaVQ3U28vNldMMGVZVzNyMUJickRCNTM3?=
 =?utf-8?B?YVg1SEFrUDFNVTVpcGg0V0lrK3VKbkRWeXdpTkFMb01TaFVqczNaNGE1NTRs?=
 =?utf-8?B?Tm1NSG4rTGJDVFFNUVJ4SDBPY2Z0aFF2WSs2cFVaTVN4bG9tREJqdHZMbVlh?=
 =?utf-8?B?cmVpS0RWem5SaDFleHloRW5YUjJmR2J2WXM4ckFIMjhaRituR0llZkhNRHli?=
 =?utf-8?B?V294ODVtVVRKMGR0clNkdEJ2TUtsRzBNdEttTm1TZnZhTGphTEpwYndGcThO?=
 =?utf-8?B?allxN3owSElVTjZnYWVUU1AwVldLK3hYMlA2ZHdXRnhnbkptWDBmcHRLZ1VI?=
 =?utf-8?Q?BQqH8muFupw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(13003099007)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjJrbEV4ODQ2R3p3VGJKWkNMZ2grbkxnZVViU2NidXBhRGlmTzZsUmNpRGdm?=
 =?utf-8?B?LzF2ZkRtQ1lneFJTNGFqNWMxUjVWYzFMRDR1czB2eFJVdVJaYWJnZ3VLQ282?=
 =?utf-8?B?VFQwM2tXVk9DMytWYmJvTXhvSERQaG93YllQYW9pbk92MjFpTzY2WjY5Z2Nq?=
 =?utf-8?B?NW13L09raXBGR01uRUR3eDV2NUN6U0hTb1J1OGdXQmgwWllNcGNENnVFdUJz?=
 =?utf-8?B?S1RPNmU2bGFXbXR2NVRCdXUvUlh1WDlOSHh3TVFnM3R3SDl5R3p2aUU2TzNI?=
 =?utf-8?B?WmpabmJLRi9pTkRSRjlOSGh1ek1vOFBmak43K242RGZFOGFBbmdORmh1ZUFp?=
 =?utf-8?B?WUxEUERzME5YeFBEcmZXM0JKODVzMUZFRVA3cGZ3b3Eyc3hqdnNnVDVobnVT?=
 =?utf-8?B?VkluMyt1R1hualFpMHlhNzU3b0R3UlBMT2h3bUY1Z3JZaEs2aGo0RUU2eGpQ?=
 =?utf-8?B?cUdHZUVZSE91NUlZNVphWTUyeVExL1Jhajduc0R4cFliTHFJc0FTSWNEblMy?=
 =?utf-8?B?RFJCZVRVWEdjbkZoZEpBU2lYN2VtTGxVUkpYZGpYK0NsenFPb1lSQXFxcjha?=
 =?utf-8?B?SlJqc3I1OExvNTUydnFOdGg1ZWV4ME9TQ3lwUFVEMnl3bFYvSExYaWQwNjZi?=
 =?utf-8?B?eWQ0UmNQbzcvR0xNN1ZMamVFdys5YWxtcVpOTDdLakh1MXc2aENReGFyTEt5?=
 =?utf-8?B?bEVZZkFhNnRzRVc0NEhvN0dwaUw2MFhoQXZicmdmTEJwOVJPL29Pakx1dUh2?=
 =?utf-8?B?bFlwMVFkaU1GR3hyTCs5RjREOHJWRXpFN1d4QmZ3bkJKdHFYc3VTcUlKWUNH?=
 =?utf-8?B?SVdYSkJmTDZGVjg3b0FPMHZuaXFFbVRrcTl6c1FBbmljdXhRNzFDaDZ5U091?=
 =?utf-8?B?TkRkbTlPSXhyNXlMWkNzdjMzbk1xeXJkYkJTYTVLaGl1Zlg1d0w0blZyeHhD?=
 =?utf-8?B?cWU2N1lDSjlOVWd1YWJMVkp5Q1UxRXNuT2ZHMlVTWDdnWC9ORmxhOGUyalNx?=
 =?utf-8?B?Rmsvdm43aldhM2ZnYVBtUjZSVWx6UTdHdm1UZ3JaSGc2bytXcmtDaDZvdnlP?=
 =?utf-8?B?MHVRSjE0ZEFxOWZmcWd6YnBHUWE0MDRGQ21idlg5eTB2OXhDN014ZytBY2ZF?=
 =?utf-8?B?TjJqQTVyRTlYZmlBWEI2UjhNQy95SkFmZkVvUFhBbk1RNDkwbzRLTHpRNlcr?=
 =?utf-8?B?Tnd3OW9lZkNJbXBpM1k2aHVkLzV5OW9QN3ROMmFlaGEraTNzbVVBMFlZRmpO?=
 =?utf-8?B?YmI4TTFsMjMydDJMWmIrdmtNREhaU2ZZR1FJVnI2TWNjUUg4Rk9jeVhqV2ky?=
 =?utf-8?B?SU0wUUgvQk5qUVk5Zzk5aVNOZUxKVjN2eSsyNVNOYWpHK3FVVThJL0N6dUlW?=
 =?utf-8?B?cWNjUTFwcWJTUjIweG50R3F1ODBTcFZTMlI4M2kvdDhZcUtIQTUwV2pZV2w3?=
 =?utf-8?B?V3pIMlNTZHpyVjNLdFl6VXlUdTFpNFF1VFVvcnZpVUxuSWRFcnliNkI3ays5?=
 =?utf-8?B?d3VrN2NJRnhxVUxHc1JXeEVYMzMzRHZNMG9RdkFJWDV3eGhNOGttYmdVdUsw?=
 =?utf-8?B?UDdWM292RXk2KzFxczd4N3YxZEJDaFFGZCtobGJ1d2dDbnlFRmRoMm5oc3hV?=
 =?utf-8?B?cDNTYjN5ZXUwZll6Qmdpb0VNNnc4Y1ZUODYwVHZTbTdxUjJnZkphKzhtWGRm?=
 =?utf-8?B?c28wSXV6V28wUDVKNFRYVjdvKzFVbGowMjd3Qi9vSWE1dGZ1OEcycmpqSlYw?=
 =?utf-8?B?WmRuVFp5VG1vRnJhZ0wxNVJrT2JzdHA4cExxZCtWUjFLejRLVDlKdEpZczFi?=
 =?utf-8?B?Z0J1cnRnM1p5YkJSaWZtNEh1SFdoNmU0aHdMUk5PbVIycklFd1RrNzZOUTBF?=
 =?utf-8?B?RDRuWWxidnF6MUZBb2VwQmN4SmlDdE1HU05oMitxUk5zZ0VPWjJyQjJOV24z?=
 =?utf-8?B?djlEcjJTT1haWWhvV1ErTnMzM2JOdFFpSk9weGFvQ2pxZmVXYjdFY01ORnZi?=
 =?utf-8?B?UitGMm1ZbUpSd2Z1MlM5bmk2a0RaKzZETHY0ZTNHZlA2NlIyazdrczNXRDJY?=
 =?utf-8?B?SUVJWjErQi9NMmVURFV6azBzTU1aUGNJMXEzbWQ3ek5UUzVRV3lwTFpwZDJF?=
 =?utf-8?B?YS9CZDJiZmlkSHZYcTNYNDlOM3Vkc2h5OEpLREQxem80TElqelUyR3hIMGp6?=
 =?utf-8?B?M01NVEJBaWd4Y2dOUk1KbXdyci9adkRBbVF5M3RLc2RuRytxY1I1em5ZSzNi?=
 =?utf-8?B?dlBVbWFuKzhqY0V6MnJJM2k0d3lXdXRCeVRHSFQzYlRvdHNGOTZpTzc0OUQw?=
 =?utf-8?B?WHVteFRNWXozSkNyNTVqTVhvMEk3VTVWcWw2RGtONDczM01sYkxDdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ab18e8-beff-436e-47d9-08de524e2b0a
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 02:48:01.9350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NxprOgBWr0sk7NubaNoaV4YymTE7XnlUzcUaX80VfiF6GF5FVd6eIXykf/kgz44rOV1QzcIVOmKGb+soEn69iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6165
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

--------------4jWdDClFEj3gjCl64a5tJflb
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-01-2026 21:33, Xaver Hugl wrote:
>>> I see no request for being able to mix sync & async plane updates in a single commit.
>>>
>> Sorry maybe I might be creating more confusion or my words are not
>> giving clarity.
>>
>> Let me try to put it in simple words.
>> The
>> comment(https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13834#note_2857640)
>> from Xaver says that disabling of cursor plane along with a sync flip
>> should work.
>> Uma in the
>> comment(https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13834#note_2863599)
>> has acknowledged the changes.
> That's about a plane that was previously already disabled by a
> non-async atomic commit. The issue is about the async commit failing
> in a sequence like this:
> - disable cursor plane in sync commit
> - disable cursor plane in async commit + flip on the primary plane
>
> I would *in general* like to be able to use the cursor plane while
> doing async flips on the primary one, but I think doing that requires
> more discussion on the high level API design first.
>
Few discussion around this in the v2 version of this series.

*https://lore.kernel.org/dri-devel/16c6c70f-0b89-4a41-8e3c-835a9ce296d5@intel.com/*

Thanks and Regards,
Arun R Murthy
--------------------

--------------4jWdDClFEj3gjCl64a5tJflb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 12-01-2026 21:33, Xaver Hugl wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CAFZQkGw5GTsebz_7vp48zkwtfNfu1uRU3p=nhibY8+WxgeEBOQ@mail.gmail.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">I see no request for being able to mix sync &amp; async plane updates in a single commit.

</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Sorry maybe I might be creating more confusion or my words are not
giving clarity.

Let me try to put it in simple words.
The
comment(<a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13834#note_2857640">https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13834#note_2857640</a>)
from Xaver says that disabling of cursor plane along with a sync flip
should work.
Uma in the
comment(<a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13834#note_2863599">https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13834#note_2863599</a>)
has acknowledged the changes.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">That's about a plane that was previously already disabled by a
non-async atomic commit. The issue is about the async commit failing
in a sequence like this:
- disable cursor plane in sync commit
- disable cursor plane in async commit + flip on the primary plane

I would *in general* like to be able to use the cursor plane while
doing async flips on the primary one, but I think doing that requires
more discussion on the high level API design first.

</pre>
    </blockquote>
    Few discussion around this in the v2 version of this series.<br>
    <p><b><a class="moz-txt-link-freetext" href="https://lore.kernel.org/dri-devel/16c6c70f-0b89-4a41-8e3c-835a9ce296d5@intel.com/">https://lore.kernel.org/dri-devel/16c6c70f-0b89-4a41-8e3c-835a9ce296d5@intel.com/</a></b></p>
    <p>Thanks and Regards,<br>
      Arun R Murthy<br>
      --------------------</p>
  </body>
</html>

--------------4jWdDClFEj3gjCl64a5tJflb--
