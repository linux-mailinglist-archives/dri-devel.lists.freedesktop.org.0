Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4D09D3258
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 04:02:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC45410E2C3;
	Wed, 20 Nov 2024 03:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bprsTeiG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287B210E2C3;
 Wed, 20 Nov 2024 03:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732071725; x=1763607725;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=W9YlbJlZeS2ANbQMeDLPaiRBFT8mBxBLGXFIBZtTR6o=;
 b=bprsTeiG09IqCu4OGxQ4jxNNTo58Lkq6sBTtVEVZg1D8z5433HZ9H/ot
 /ls7twSx4XgtGYPBfUL63ecIWa1F9aI+rVgV5rxSOvwgs4OEObiqqafGi
 zKG//3NtwLqN4ZW0NsiCZ1zdrM0zRjyGN+8K//HSESS9x0HYmrJdnefzq
 xrBYR/FPmFhCM5337bqKgTHoML++csRYLB6KcTZ+mWfRx9Bpr8rnLD8iY
 DpYrQvVhE1t9hys2XxUggMsUPTBjhCmW+LN0Jsqxv3jwSJZZ6VA3xu30h
 rjO5Oz1DIPppqADmKW7pLtDPkHT3ts7ZC1ld1/e5Wkomt/0nXeLdl4swW g==;
X-CSE-ConnectionGUID: 7Mjz5a6CQsGR8t09k/TCOA==
X-CSE-MsgGUID: zmCKMRjOQYyZTtZdiNamjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31481297"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; d="scan'208";a="31481297"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 19:02:04 -0800
X-CSE-ConnectionGUID: 0Ar+rveqR3OiFZbCoV3COg==
X-CSE-MsgGUID: DZB9l2RcQlWgTUIsZtJGyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; d="scan'208";a="90147651"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Nov 2024 19:02:04 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 19 Nov 2024 19:02:03 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 19 Nov 2024 19:02:03 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 19 Nov 2024 19:02:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t3Dp0OtXfDJC6HyFyLGtWhy7EPQLRVupRmAsHnSBfKZPaX46tlUJ08Basq6B62HhI3CDevRQ7ZwIJmwpODdKZwdBBoTFNLEBjViZ5fp+iLjVTUdGlKDZe2TpqWWvDfsBCyDXLrTqWb8iFdVwdvC8qK2GS/BL7JOiKgRD/MY4Jn56z8/3iQFn0W9I2KSmtpGFAW7dpRrTFqvlfGX8fCeSF79SJk5wbNt2ekuiqJnfkkDUP90IR5i/2hdqoQJS0sP/sQYchbnj3oNUYboMVO4GSd/no5f2/FWS93SLJxAHucpd9vxxkgAM1Rn4hIHhFw8LngKG5wi6UbA+M1THG4zhHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qkX4p7uDkL1fxSzUu29kC9hCk9FtYS9VUFBtAciv5rM=;
 b=UeCBlsSxLen/hgB5cpYWSM4s4VZCtbiN2bcLb2aEvqKbxdTQmf/ZHUdTI0rmmX7he0U21MxQYrPd8VWsledD4HB/+jOM3jzxjXh2bNaH/fuLse8ARovCDvULzfBgC60yEhGmfoswYMAHAcnhYUy8xreElfG+OtSD27Suj5r4OtSHFDtJAtzbrRcS6IibIA+7vo1GGAOGHU6J62snT6iu+x1g8EbpUb3EAxemr9YL19UGyCOzjx8jGQAPXK72/B+L865rvZEnzvV5lvy5Y1OJ60GHr7eYaSHOnYVHlDtObUiTRPMptCUjQtn3x8cZhmxSVqGq2VsbuejoZLZqZB60jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 DM3PR11MB8758.namprd11.prod.outlook.com (2603:10b6:0:47::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.23; Wed, 20 Nov 2024 03:02:01 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739%6]) with mapi id 15.20.8158.023; Wed, 20 Nov 2024
 03:02:01 +0000
Message-ID: <fb9bb370-3e84-4490-a05a-602d7be5014a@intel.com>
Date: Wed, 20 Nov 2024 05:00:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/29] drm/gpusvm: Add support for GPU Shared Virtual
 Memory
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-6-matthew.brost@intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20241016032518.539495-6-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MI2P293CA0012.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::10) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|DM3PR11MB8758:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bf1b846-a29e-4d88-ea75-08dd090fb43f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWdaT2lGTWYyZmMvS04xUUJyVS9OQUJXdmRDUm1IRExZYjlDNzgzRHpGcW5C?=
 =?utf-8?B?c3lwcEtndW0yME0ySjRWM1pLaTRXSFBrMzltdzNSMmtJT1dUZyt2ck1mclJw?=
 =?utf-8?B?RnVwSDRYOEZ1bXdBd1hNOFBUR0d3RFVyVTZQazVwUllJcnVuTGVsZFNVZXp5?=
 =?utf-8?B?T2k3d08va29Zb0JPZjFKMUV4VnJ6bW50QWpYcHN2Z0NMd3lZZk5PeHFJV29k?=
 =?utf-8?B?WW56ZU4zOFVnR3ZRSW45dGxSTkM0dHRSNkVBQWRwbHpydVNYeW9sUkYwMG8y?=
 =?utf-8?B?ZUNtT2FsbmZta1hmL1dlSzlPU2R0aFoyQTg2OGFkYUx3dDJ2eXI4bXgxNkFh?=
 =?utf-8?B?MzJoTG4rYUJlNGp3eDl5MGpMaTlOQ0F4Y0JWb3c5UHpET1pHdXRkUzlub2NI?=
 =?utf-8?B?Q0Q5aGZObkVyaWM5WUxhQzF2bWxkRDlDSDhoaXRuZHQvMTdiSlE2MGl0dlNl?=
 =?utf-8?B?RTB3Lzd2cVd1S0FsTWVZOFVJMTBUUGJaeWJudktsZ3FEWVdVblE1Mk02Uy8r?=
 =?utf-8?B?dFg4dTNveEVhMjczTzlvMkl0T2NMY3dSRUc0UXFISmxGcEdSYWp2dWY5N1o1?=
 =?utf-8?B?RWN0RFRtY29JVnRmQnNVMHNjanVKcTk1aHN5K3dISWZqUVh0RkhWUWw4Z1li?=
 =?utf-8?B?MEJqYWNjR0pPaXltQW4zayt5SkV2V2E5bUdMNWFTL3NvYkNpVU5iWVU5eHZh?=
 =?utf-8?B?SGI2c0llVml6aTNiM1BWUzNBSXA4NmczWFZCMCtSTmsxbkxBRG5obGhBSzNM?=
 =?utf-8?B?dUV1c2NxcFlKYzVobGxTZEo1akpVQ0gvYXhXZFBWZWpLV2RVS1FFWndXb3pz?=
 =?utf-8?B?SnNHQnRyZmZuZzJ3RGM3ZE5xYjRacWI3MHFKK2VrWUhyL3ZJNTl3YXZaSEpp?=
 =?utf-8?B?eTkvMUdyQ3l2ZEt6d3VFRENLenhUS3pGd1VGeWlqckJtRmRiN0VNNCs4UlZq?=
 =?utf-8?B?U0IvaXhDVlBlYkVtTm0ycVVNQ1dyZDZ5akczREhHMlZST0svZjRjMDhha0t2?=
 =?utf-8?B?SWJQUHFqdGF3RTVrU1hrREVyc3ZvUzNRMjhpQ1pPZ1ZEYU15M0xHUnlWRnda?=
 =?utf-8?B?OXBvSXZRd3hpdXg0eUlTdGd3a2h1cjlkeFhvQXVjS3dCSnFzSkgwNlpza3Np?=
 =?utf-8?B?UU9iUXdyYTdVNXZXeW15UDh6N2VJMTdQSWtBTXYzRVZLQkZqVXo0Z2hxQmlK?=
 =?utf-8?B?QmMvWWZJZmZjUnhCTnpmMmV5NFZIa1BSWWI5SGYwemc0TDlyT3V5dFgwblVL?=
 =?utf-8?B?a3B0dElmTE9SMWxTL2JpajB3aWlPaHlJZmpxVWwyK0FyaGg0OWxrLzc0YzFq?=
 =?utf-8?B?elp0SnltQVFXTW52dmo1NDZqUlpCaXMvWnpCOW1NMWNrSjdXQjVlQTY3M0ox?=
 =?utf-8?B?SkdHbWhlakJwMjR6WXRjMUJ4VmcwV0NMKysxbmJjR1BxSzVGTU16Y0ZMUjAv?=
 =?utf-8?B?a20wSmlBdXMrdWFZeDRlcm5GbTQvbUxYaHhCTUI3RlJEVEtLajg1ZC95cTZG?=
 =?utf-8?B?V2k4ZEIwV2puQWNDVE0xdlpMelh4NzhHdFBWSVZiQnpTL3JJczYraC9ObCtW?=
 =?utf-8?B?bklYS2lUelY5NGVSVXdOa3FGUzdSVGhOK2FPeFI1ZmlJS2ZpLzhDdElDajg4?=
 =?utf-8?B?TitBWVF4MG1qejJKLy9sTTZVaFhjbzkyUk5oNHY2UUtWd0E1K2tnSkd4bisz?=
 =?utf-8?B?SzBldUJGNmJ2dHZyMXpQZTVFMTlVNXlqYVV5dkpNQXNwQ3VSVjAxZnJBeHFr?=
 =?utf-8?Q?q/0PH1XNt3NwEEyLLWobXbeBm4lRuJoC5+Pa9JZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzlMY1ZvaURrdnBIemxuQThiQU1hSHlCNUFDVTBtZmdrODNMZVJ2SGtNQnhR?=
 =?utf-8?B?dzNHeGNhbnM4Mk5sc3RYRnpBR01BRHFtUkJMdHJYMW1JSWNIeWExTWRoWGNJ?=
 =?utf-8?B?MjVyNEdYUGdyRlhrQjZSZTQ5RHAxbnhoVStBRG4rajhMUFRHOVFobjJmbDVh?=
 =?utf-8?B?RHNxY2pTeVBrV3RnSGl4ajZ0TUVtTk9mOGdpU2Q4YlFIdndPUFc4V0hydHFO?=
 =?utf-8?B?aHhaTkk4Y3ZVQ0R2eE9kTHR0MkxibGwxWXo4ZVc0akFBbzNsN0JsMi95dXRy?=
 =?utf-8?B?YmJzd2J3dXB5a0FGWkpkNmJBV1ZVRWZNQzFnVE1CSm93bnpCei9Lb2h0cE1H?=
 =?utf-8?B?RUN0WHVhOWlvREFla2pNNUFBMDVzZzR3OG1iZElkYUVtQkIrUGJTQ2tiQzU5?=
 =?utf-8?B?b1JHY2NFRzZMUytWZFlOM1BNN1Z1Z3l5RVh1dGlnd2lEeU9FWGhULzY1RFF4?=
 =?utf-8?B?UEJwaEtmQmtJb3FSSkVCUlloRVVxYkhqTWJCNDFiNllneE83VW5kcTZmaW9z?=
 =?utf-8?B?UFFLVHZRUHkwQlU5U3RLTzhNUnZiRytXU1FDT0paWVFSVmVCSVhkU0dGYWVW?=
 =?utf-8?B?Y1NNMzUxdjAyL01FUmNKK3AyRWhxTFRuMVpHYnkremtwWDBKYkJ2RVgyYlNq?=
 =?utf-8?B?dzdVVlEwaFNZNFNrSXBuZlJ1cEdSdHo2ZFJBcnN5SFF0NlJtNFNzenFxVi9P?=
 =?utf-8?B?bGRaZUxPcWxHd2oxV3dQMGFvZHRKdXNNa2xTd0xsMVRyS1VyR2luQ2dOYzUy?=
 =?utf-8?B?MFRiRGE3bUxUbGUreFMrak9BRUJ3NHVPeXBVR2RoUk1wbCt0ZVY4QjBscS9t?=
 =?utf-8?B?NmRvQnZvbWQyQlQ4eVRDT2RQTm1CNDNTT1AyTUVLTmdmY3V5Tk5ZZCtNRzZm?=
 =?utf-8?B?TVlHSjg1b0lKOXFiUzFMNVpFOW9zdFAxa3c5ZGlrdTE2ckF4S2FZNFVoTi9R?=
 =?utf-8?B?NlN3eVBkTUY1UmhrMUVucDRIN0d3RVhmUlY4WGJsdUJ4dU9UdCtNeG9LRHZD?=
 =?utf-8?B?OUl5TlBzMnJpZmhCUWR0d0RGdkwzUGJ2NEswdllZTXFleDhzQU1EaUZRRW5r?=
 =?utf-8?B?OVEwYzJNSWhtSG1MNGJGRmNXMVh5T0xIaGlja3pITWI2R01MZEZ6U0pENFpD?=
 =?utf-8?B?aEFIYVcrTWovRUVleXBkVG9FZWRFc0MyWkhibGhFRys3ZitCT2VpUG1PRDgy?=
 =?utf-8?B?RkNPbEtyWXc0Q2h0Q0JFSnViem9nL1JSK1ZiQUFVT2dpcndNTlh1VWoyUHBi?=
 =?utf-8?B?OGpOcGx3OXJqTjcyc05qR1lpaTdMYzZwNGUxMU5OaUkvWlZyaFozNW9SRDM2?=
 =?utf-8?B?SjgyVVZRLzdrQ1JkQlN3eEo2V04xNXhNdkRqbFZUeFZrZUgzMjlOa0dUQ0RQ?=
 =?utf-8?B?UzlGWThFaGR6aWhzM1VUd09kdTEyVkdXUVZGTDZMUW4raGlIZUNnNzlTNTEy?=
 =?utf-8?B?bjNaUVEwejV1Zld4U2dPUFptTHNUYTh4K1NveHIvM2s5THVHbG1ETWdYRXRz?=
 =?utf-8?B?NDZpNzBzcGluVVpTd25tWWZVbWdnekNLcXZlL2pNNGlaV3AwNEZJbUVoUkFQ?=
 =?utf-8?B?dUlvc3gxL0hDSjBlV2oxQ28yd05hZmx1UEJibzdhc1N4TWFldVQrMUIzUlZM?=
 =?utf-8?B?TWdURHhsM2l0Um14YzBNREVrNVpSK3V6RUxmc3pHT28vZmRQRlE5WDVMSVBa?=
 =?utf-8?B?aTJITXdydzBLL2ZxcW5Bd1AwTlVIaGtiUjY2YjJkWjA4OFlZNUFnWCt6OExj?=
 =?utf-8?B?ZUlPdmlOOXo3M2RObHZTenZZMHczS0VobWtFTHhybEc5VGovL1E1MURYa2t0?=
 =?utf-8?B?OTJQTXFYUGZKNmw4MWdrQkdPdkF6SEpPRy8vN2k4ZitDZFNXSUtLUlozSE9y?=
 =?utf-8?B?S0pzQXVjRlFscjdRTGgxc0hVYkdJdGMwVWhhN05lMHhtZXBFSDA3bjN5Q2R0?=
 =?utf-8?B?OFpTaURLV3Nac2pHRUZJZ1Brd1MrbFJ5dm10cThEdndQeEdoWkNLdGxwSnFm?=
 =?utf-8?B?WlZhNmtHbDZoOEJsNG9MbkxUcUNTMWgvMXdXZ2JaZXR5eTRPUE9FRVNidDly?=
 =?utf-8?B?N3FQODR4Y2F6YUIwTFo1eW81b0pwRWE4cHkxT1RPTE1iOHpoZ3lUZXNxK1FD?=
 =?utf-8?B?SCtCMDhDUDJEbDFlR1hNNGRScUFoZWsza3FaWnN4cEdFS1hQdEQrdFdtSE9I?=
 =?utf-8?B?bnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bf1b846-a29e-4d88-ea75-08dd090fb43f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 03:02:01.3654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V/YILj/zyCzS9Y9kEWLO+GOODnvCfDlXupmQ0To/U+p3+DDONZfmkbSFPSMK51qqxF6GTqLyj2HLmPGNIeeMjDb9kRM/d6jKD3922DzSTv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8758
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



On 10/16/24 6:24 AM, Matthew Brost wrote:

> +
> +/**
> + * drm_gpusvm_get_devmem_page - Get a reference to a device memory page
> + * @page: Pointer to the page
> + * @zdd: Pointer to the GPU SVM zone device data
> + *
> + * This function associates the given page with the specified GPU SVM zone
> + * device data and initializes it for zone device usage.
> + */
> +static void drm_gpusvm_get_devmem_page(struct page *page,
> +				     struct drm_gpusvm_zdd *zdd)
> +{
> +	page->zone_device_data = drm_gpusvm_zdd_get(zdd);
> +	zone_device_page_init(page);
> +}
> +
To use the zone_device_page_init() function, CONFIG_ZONE_DEVICE=y in config.
To resolve build issues, CONFIG_ZONE_DEVICE dependency is required in 
xe's kconfig.
