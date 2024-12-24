Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E9D9FC198
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 20:10:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 220E110E49E;
	Tue, 24 Dec 2024 19:10:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KtzBxTSR";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0694F10E49D;
 Tue, 24 Dec 2024 19:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735067414; x=1766603414;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=JI5AcDUwNAI6Pa/KXG/usksV5IaHRom+KyaPOMI6vcU=;
 b=KtzBxTSRTDWEHKtDRJ/68e6P1ANrXQc8psOL/uKmNrRNCC9Mgw8q5/5q
 D/OWjE6Oqo2RwqVE2iZIMH7AKXClWjk5hOpmY9qftXDUTALTau7t4iKbX
 Ozqqamt28c3b52EtFVCuichZOcbncsU4IIIgxhCycR31fVX1JAzMrVn0q
 J9ug6ED0lPBX1JGmpmT1iWHlMX+qEh1hUr8nHljOyUNTT+imfgsVvdiZg
 8fZzCTSvzvV5gy9ZoDDUthkVYmCj/OptkTNwhaU8z8kiFgSkQKjrSC9QO
 JzuIfkzJkkBDHJAOAVCMdGFyZYip96MVI6XFaAw1Z+ExXt5gW+6dUQAL2 A==;
X-CSE-ConnectionGUID: uHfGBcsRQ9a2qK0F8pH7bw==
X-CSE-MsgGUID: E8CaiVmqSiuSIOJTGzDZDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35756254"
X-IronPort-AV: E=Sophos;i="6.12,261,1728975600"; d="scan'208,217";a="35756254"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2024 11:10:14 -0800
X-CSE-ConnectionGUID: PpvXgq2dSTCPM+3ZJvFaAA==
X-CSE-MsgGUID: 9ezBP7PGQ6yMQb6Z6HyFNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,261,1728975600"; d="scan'208,217";a="99771710"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Dec 2024 11:10:13 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Dec 2024 11:10:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 24 Dec 2024 11:10:12 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 24 Dec 2024 11:10:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wc7F/qMc8NISz9gqcxMj+BalWvA0fPOAvb7qorAkPn8R0QnDUBv0qMC4IGGBvHjlrcwU8dnjD9r1MGP08Qg4KcDgY/d2c/phphJnyofp2VlwfglJ2+ORt/LZyv3u+LkCxyvMkGjjiC3B6pla9fNnZJ8YdgA9kQvjGgvww0s+XShN8NUOG3wjKmIb+YtzOmQIq2xl7jGu4ArDp4relb3NHh2ylKOkGPPKPOdOhP/1yto7Ly3po7ya8TtZk7wpmk4c1aEh/fnKHAdXNtwCMVgLP3IpUfU2m61t/eZrfKuZzKpn2jBP+BxQUJfr1GYOgPGfAidjAPjltBHwiUh6VS9Qag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHGVxiC8YAH9c5Uj/a3WybmVUcMJjs1kQsWPSHpbZ1s=;
 b=cTDpJeECd1GjC6P19ytMyURTqXZBgUT36HMmn56BA0VaAAbeiG08GEnyon4WqufOjNIHFFf0DUsZfV3AgSpiZPSwnSKQ4jO9bqn1PsaCmqAwQNgwGhZpsd/dqvJwEBLiMxjTVGgbuJ1MO8c7O71heGx/0g96i9xin7UX4shnBGyssh2ZvT99TJS2BtufWODIhhuGYgMrdLIayKnu3KNLO35QOVGRp71JXdwnPseRiuYHiqka8lj6EkgTx/ihjamuzqmYd+5EGD9b+YYW/d7Jt7DsT4B1eWbNhTKXfh22zewJd7KAEnzfRivfNgq4jAsJXf1d8ZHrN6mfzujmAacPkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH7PR11MB6860.namprd11.prod.outlook.com (2603:10b6:510:200::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Tue, 24 Dec
 2024 19:10:06 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8293.000; Tue, 24 Dec 2024
 19:10:06 +0000
Content-Type: multipart/alternative;
 boundary="------------HexL2bbO7p1tLx8s78ZHqHSU"
Message-ID: <5c2c8e5c-c16d-41c1-90e7-07b1ddf0f923@intel.com>
Date: Tue, 24 Dec 2024 11:10:04 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915: Add debug print about hw config table size
To: John Harrison <john.c.harrison@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
CC: <DRI-Devel@Lists.FreeDesktop.Org>
References: <20241221011925.3944625-1-John.C.Harrison@Intel.com>
 <27c27339-cde3-4028-99e5-deb574c091ec@intel.com>
 <16414d38-e5ae-4bc5-9b22-a2a7a928264b@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <16414d38-e5ae-4bc5-9b22-a2a7a928264b@intel.com>
X-ClientProxiedBy: SJ0PR05CA0155.namprd05.prod.outlook.com
 (2603:10b6:a03:339::10) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH7PR11MB6860:EE_
X-MS-Office365-Filtering-Correlation-Id: 391c6f3e-3f51-4bd8-6dc4-08dd244e93e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjEzdWs2bDNwL1RranJlUzhwYWhScmFvNFFXOFdWQ1JTcnpaVzFXOXVlRE1p?=
 =?utf-8?B?Z3NvdWkyUlhLKzJBend5UTdsUzFSRFZWOURkWGVhWHVQejJuZUFWNWlkL084?=
 =?utf-8?B?UUVBU0pGYStKejVCdjd5aFpuRXcwUkh3TzFWZEEvMU0zNlRnazJiTmo0ZGVB?=
 =?utf-8?B?WlBZVlVxN21wcy9zSmMrUnBJSkJHUUp0dUZVOERKL2cwYzlmRk1URjhiYkNt?=
 =?utf-8?B?MnhGYlFRSld2aWFZRGNPeWw0YzdKSXN4WUtvRU5OV2d2aTZQZldHbjZVS1J4?=
 =?utf-8?B?UDNHTTdQaWdtYzRscUlZTU5DMHJiM1VubTkyYzJ3UTE3bEM3SWIvU0ZrUjRv?=
 =?utf-8?B?ZHVVektEd3k2c3B5Ukg2Zm9VT0g1YUxxdmlBV1gzdHd0OXhic0hMSTJjOXVj?=
 =?utf-8?B?aFhmWWhheW9WdzRjTUtjdWVoWHBTYXVDdTcvNnhDQUdGbU5HUjZBTWRVV01Z?=
 =?utf-8?B?dHNLc2pBMUFVbXZ6RjN6bDJpM0JybnI4azUrY3dhakoxb29jQlpMa1FmNFlu?=
 =?utf-8?B?aUhyMHZXRzd6QUVuNTV0N0szTkdPR1UyZWNKa0k3eFlnbU1odkVvWWNWOWZm?=
 =?utf-8?B?VHlQUEZpSU8xV09LU0tmWjlhQTZCeURHNksyTGZKYWxYSVJpZXJnNE9wNEVw?=
 =?utf-8?B?SnVheEh2eG5aUVFWYzVXSU5IUWZLZmVXbGVOQjRiUEdPODFOSEVlMi9xOTlz?=
 =?utf-8?B?SEtFS2Z3VzlrMytWVHAwVnVxZTF6SW9kUTdWRUhJY3VkUU5SRjgrVTZKMHIy?=
 =?utf-8?B?b0lvbUVhT0FFNEFkSjdiSlV2UW9LU3dsZHgrSGsvK1BTOWo2SWl5RVBUTU92?=
 =?utf-8?B?ekx3RU0vRnEyL1Q1aVNiVlZwZ01TSGRlNTVpUE81anFmVFdSOHZZd3M2d3dR?=
 =?utf-8?B?UXFNZDlvVXFWZ0FlOVpZd1dma0NwRXJEZjlyZVVxaHVMbUdSaE1UMnVtTWw0?=
 =?utf-8?B?WW4waWh0TDF2MXlKSVl4bjV6dUVzTml1MUY1RHc4bGxzZTNMbENyTWZzOFFV?=
 =?utf-8?B?UTgrMGJFd0pQL2lWZVFnVmNGTTllMEdCWXRON0E4TmVlZnNnbnlaSVNUQVJ5?=
 =?utf-8?B?ZnE3cnlGQWdYdmw3YkduWmUyZkxGRHlRT3hjREpxcUtpYWlIdlkzVXhBK1Bp?=
 =?utf-8?B?V095UnBybnI1T0p2dGQ5UWt1b2UyMmxMUkFqeEpjRy9mWGtBaWY2L1R4QXJX?=
 =?utf-8?B?aUVWczhnVDkybFYwVHUzT3Q5cVgxVVc2TzF0a0hVWlAvTnI0VVVYWTlhVHZ6?=
 =?utf-8?B?Zm91Yi9zMHhCUnBXeUE0bUl2WC9JeG8vTEF3OFhHVmxwdmY0WVdrOWlFc09a?=
 =?utf-8?B?d0ZEK1IyWko4VjhhS1U0OWxJbWI5eWxrd2Mxa21FNzJnVk12MG80alRXODYz?=
 =?utf-8?B?WDJhZDl5V0FrWnJmZW5laGFMU0cyMDY5TnR4ZXRrdHI4b0VlVVFWS21XeXJ1?=
 =?utf-8?B?dHFnRmN2ZExpM0k0MXkxd25wdzV6QUlWRDJCbWFPQ1RldlA5T084VUpTL0Qx?=
 =?utf-8?B?cHFKWURQbTVKc1VCMTlxU0k0clVRcHFLekk3TWl3TkVNM0tybkJNdmxjMEZY?=
 =?utf-8?B?Vk5IYkdjYXJsa1FEeEtrRWlDTllwNmVpMFZHQmx1QkxYT3VqcVpjL3ZSc1Zn?=
 =?utf-8?B?SFAxMVlaOG8vWFhCeHFISEZZMEsrL2Yzb09uN2hWM2NXNHVnbGpFVGwzLzZS?=
 =?utf-8?B?aFNKRU1pTTB5akhyVW84MENVVnJLTlhGNUNFWDQ2VGFWN29kTEsrTEdZUENs?=
 =?utf-8?B?cW9JWno4bGlabWppVzJzWVI4dGVnSjNJdXBaTVdxYm5BcE5lTW9Jb09IRnJU?=
 =?utf-8?B?ZkdVVzNlZFBxMXhxbVRoQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFN1Rk1Pbm1NbUNta0IwMWVHSENXOWM1N25SaUhscE9Cc0tGL0kyMTlqK1JH?=
 =?utf-8?B?VVo2Y1FxdEZUNitpNDM2MXRETWVSTkFZS3VKQ0tpRHRhMXpqTFlZcHNVN2l1?=
 =?utf-8?B?QUdrUzJyNnRTcWh1ZDQ3Tk4wcVl1U0Y5aUhPRjllL2l5d3phZGgwTHhJV1JZ?=
 =?utf-8?B?ZWh1TFZBbUJEc1BUY0QvRHlwRUJPMmY3NEdleldzSFplSHg3MStwV1pSODZK?=
 =?utf-8?B?NzU5SmRUeVhTNUNrTUlOYU13K2RUeUhzUTR4U0ZsWTZEN3JDaUNubU5KdHdt?=
 =?utf-8?B?V05FdjJ0Y1daVmNwZThlcnREVUZDblJrK2IrOFQ5dmdLVzNTYi85K3dLU0hG?=
 =?utf-8?B?ZkxvbzEyV1h2MlI5SDloUlpkVXh3NWIrQjZ0MXowYkJhUnhDQVdqUlN4akgy?=
 =?utf-8?B?Tm9uWWMzME5mOUIxazMwVXEzWGlZVGh1SFhXUzRNdG9YL0hlRmNJMGYyVlIz?=
 =?utf-8?B?aXJTRFZBaXZ5NElEZGVmTVZKWDRpRlh4TEs0RFMwMDVabmVlbjkyLzNMOVlR?=
 =?utf-8?B?YjBnMHEybzMrUzRTRVZadGdPSXp5UHZNL3Foc3hhNXVxTE16SDNkTzdXNWlS?=
 =?utf-8?B?OUJpNUJraTFEQzhIK1d2L3dlaTBWRUNzUVZId01SNzFrQmh5Ums2TDVrNlFD?=
 =?utf-8?B?REZJVkp5SDIwVXB6Y25VcUJtREgvckdoRnBXRURDeVdGdjNTTG11LzI2Niti?=
 =?utf-8?B?aFdlQjdpOTFGazlna2tDRWpIalFvRVJsNG9LTXZlYlgrSVBvOFVneGZIQkxY?=
 =?utf-8?B?Q050NW9pZUhWMHRLWUpRaElNRGN6NmJGeW4wMTNXR3E2SWZseHRGTUU3bVpN?=
 =?utf-8?B?RkxDaEhLRkExOUZRdWNXZGQ4TTVVUGpjalEyZ2ZZV3l3MW5WdXJ5RTBGZGRr?=
 =?utf-8?B?MTBYS3E1aUZ4SEZ3UHhnbnU3b25uR2FDNkVxa2hORFdOK1loK2N1V2I0V3ZH?=
 =?utf-8?B?eGo2Mm9pMEZJSDB6ejZFYmIrajNnZFNQbk5OdUJrRitqMmZJS29RVXIzOEMx?=
 =?utf-8?B?M2JDdllENTNxdENNcXFaajdURHR6ZFI1MURCaVcvNi9leFRLZUxyWnhoWGtW?=
 =?utf-8?B?bFMwbXFpOG1zUk5NM2hlODZleDNPM1ZvcUVrdTFzOVo2UGNBbWo0ako1UjJT?=
 =?utf-8?B?Q282WEs2VVpzZ1VXNlRyL2oreGpoQjhQRE90a1RTVWlveERYdkxHSDgxOFAx?=
 =?utf-8?B?bVhxOC94dGpyaTgrc0FHUUV1M0liRkE4WXhhdUxiUWVuZTJUczVZbXRzamZV?=
 =?utf-8?B?em9OUElDeWVuRU5RVTQrdU5WeUZ6UUVCYlJBODhMaDI5Y0lDOXFkUTJhdGhP?=
 =?utf-8?B?SUxBaCttQ2FGNU1YZ00zeExWNjJ2S2hhdDBYRy90WVhvR1QvallNRzR0UmtL?=
 =?utf-8?B?QVJ0SUhCSGtqQTNNcmdJSHlvUWhkMWY2bm9SazcrYUt5ZkxzMUY2dG0vQjZt?=
 =?utf-8?B?TENCNjA4VU1lQUxOQjJ3eGtQd2JkVDVOeVkwOEljVWF1czZqTTdkWDdhV21J?=
 =?utf-8?B?ZkJqSWRxK2ErMDU2RS9BRXJESkpCUzZwUUdwQ1ZjenJ0bjhIc1JqVk5TVmUx?=
 =?utf-8?B?cG44SEVvVnRud1Y2MTlVZGhmWWxvK1QyUlNyWnBUY21Db2dobzlXK2U4c2hV?=
 =?utf-8?B?TUFSMFM1Zm0vd0VydkcvTi9wNW5mVDJUbzg3RnFRMCtKblRXRnF4NDNJMTYz?=
 =?utf-8?B?bjVmMWdLMTZ0OHVOU3FFblJ4WEt2ZXhldW1PS0FBd0NxZXNYSWlSQmJGNng5?=
 =?utf-8?B?bmlNQlBhNTNQbGhXMG9tOGdTb3lndFhGNERXemo0NGJDTUt4b2N6eCtYam9t?=
 =?utf-8?B?SkNKWFZpQ2FVMXNOWWNLUy8vYS9JNEtyekVzS0tSSzFXRmNKUWprM05wanVH?=
 =?utf-8?B?cCtnbnBLbVR4TGNvamJ4V2RyMTVpZ1dpWTRRa052Uk1OT3JjOXRjeUJMV0k3?=
 =?utf-8?B?UkdzVkpFMldtdWEvdW9nRllici9pQXNxOEdvcklqSmY2RThpeDk5cGFOcWRi?=
 =?utf-8?B?c3BPTWdzZGVrN1laY2xZcWQ2NWNENkNDNkxhQThOMDJka2cxdDgxVE94ZjUw?=
 =?utf-8?B?dHNHMm4wYVRVSis3WThCOFl2WGdRSG9vRTljZktJQ2w2WGtZSkhtRGRBT3RL?=
 =?utf-8?B?QU5hblhNa3daZ09wam0ySzgvRUhqRzZsM3Mrb2lGYlJCeXBWQzNEWWZHckZK?=
 =?utf-8?B?RWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 391c6f3e-3f51-4bd8-6dc4-08dd244e93e1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2024 19:10:06.5041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 72afJ4qCeXaDOS7EeGOTHMyBWCt/8V/f35i1EmrEZBX1k4uqWsbC9y2ElW6aBLrGxwXmsXo+g3s94u2bbFerg7357PzRQoYv18CZBpWq2B0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6860
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

--------------HexL2bbO7p1tLx8s78ZHqHSU
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit




On 12/24/2024 10:13 AM, John Harrison wrote:
> On 12/23/2024 15:20, Daniele Ceraolo Spurio wrote:
>> On 12/20/2024 5:19 PM, John.C.Harrison@Intel.com wrote:
>>> From: John Harrison<John.C.Harrison@Intel.com>
>>>
>>> Add debug info to help investigate a very rare bug:
>>>    https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13385
>>>
>>> Signed-off-by: John Harrison<John.C.Harrison@Intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
>>> index b67a15f742762..868195c33f5b3 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
>>> @@ -7,6 +7,7 @@
>>>   #include "gt/intel_hwconfig.h"
>>>   #include "i915_drv.h"
>>>   #include "i915_memcpy.h"
>>> +#include "intel_guc_print.h"
>>>   
>>>   /*
>>>    * GuC has a blob containing hardware configuration information (HWConfig).
>>> @@ -42,6 +43,8 @@ static int __guc_action_get_hwconfig(struct intel_guc *guc,
>>>   	};
>>>   	int ret;
>>>   
>>> +	guc_dbg(guc, "Querying HW config table: size = %d, offset = 0x%08X\n",
>>> +		ggtt_size, ggtt_offset);
>>
>> This seems to result in a double-log where the first print has no 
>> useful information, e.g.:
>>
>> [drm:__guc_action_get_hwconfig [i915]] GT0: GUC: Querying HW config 
>> table: size = 0, offset = 0x00000000
>> [drm:__guc_action_get_hwconfig [i915]] GT0: GUC: Querying HW config 
>> table: size = 752, offset = 0x00D05000
>>
>> Given that only the second log is useful, IMO better to move the 
>> guc_dbg to guc_hwconfig_fill_buffer(), because the info needed for 
>> the second print is available there and it is only called once.
> I disagree that the first print has no useful information. It tells us 
> that a call is being made and these are the parameters. We do not know 
> what the failure is. It seems highly unlikely that the size changes 
> from query to the next given that the table is a fixed entity. It is 
> much more likely to be a caching type issue with GuC reading data the 
> KMD did not write. If so, GuC could potentially read non-zero data for 
> the initial size query and complain that data is invalid.
>
> The intention is to report all calls with their parameters to try to 
> narrow down exactly what calls are not working.

But we don't need both prints to know which of the 2 calls has failed, 
if the error comes before we get the second print then we know the 
failure was in the first call, otherwise it was in the second.

Daniele

>
> John.
>
>
>>
>> Daniele
>>
>>>   	ret = intel_guc_send_mmio(guc, action, ARRAY_SIZE(action), NULL, 0);
>>>   	if (ret == -ENXIO)
>>>   		return -ENOENT;
>>
>

--------------HexL2bbO7p1tLx8s78ZHqHSU
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <br>
    <br>
    <br>
    <div class="moz-cite-prefix">On 12/24/2024 10:13 AM, John Harrison
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16414d38-e5ae-4bc5-9b22-a2a7a928264b@intel.com">
      
      <div class="moz-cite-prefix">On 12/23/2024 15:20, Daniele Ceraolo
        Spurio wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:27c27339-cde3-4028-99e5-deb574c091ec@intel.com"> On
        12/20/2024 5:19 PM, <a class="moz-txt-link-abbreviated moz-txt-link-freetext" href="mailto:John.C.Harrison@Intel.com" moz-do-not-send="true">John.C.Harrison@Intel.com</a>
        wrote:<br>
        <blockquote type="cite" cite="mid:20241221011925.3944625-1-John.C.Harrison@Intel.com">
          <pre wrap="" class="moz-quote-pre">From: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com" moz-do-not-send="true">&lt;John.C.Harrison@Intel.com&gt;</a>

Add debug info to help investigate a very rare bug:
  <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13385" moz-do-not-send="true">https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13385</a>

Signed-off-by: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com" moz-do-not-send="true">&lt;John.C.Harrison@Intel.com&gt;</a>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
index b67a15f742762..868195c33f5b3 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
@@ -7,6 +7,7 @@
 #include &quot;gt/intel_hwconfig.h&quot;
 #include &quot;i915_drv.h&quot;
 #include &quot;i915_memcpy.h&quot;
+#include &quot;intel_guc_print.h&quot;
 
 /*
  * GuC has a blob containing hardware configuration information (HWConfig).
@@ -42,6 +43,8 @@ static int __guc_action_get_hwconfig(struct intel_guc *guc,
 	};
 	int ret;
 
+	guc_dbg(guc, &quot;Querying HW config table: size = %d, offset = 0x%08X\n&quot;,
+		ggtt_size, ggtt_offset);</pre>
        </blockquote>
        <br>
        This seems to result in a double-log where the first print has
        no useful information, e.g.:<br>
        <br>
        <div style="font-family: Roboto, Oxygen-Sans, Ubuntu, Cantarell, sans-serif; color: rgb(0, 0, 0); font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: nowrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><span id="dmesg-normal420" class="dmesg dmesg-normal" style="font-family: monospace; white-space: pre; overflow-wrap: normal;">[drm:__guc_action_get_hwconfig [i915]] GT0: GUC: Querying HW config table: size = 0, offset = 0x00000000</span></div>
        <div style="font-family: Roboto, Oxygen-Sans, Ubuntu, Cantarell, sans-serif; color: rgb(0, 0, 0); font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: nowrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><span id="dmesg-normal421" class="dmesg dmesg-normal" style="font-family: monospace; white-space: pre; overflow-wrap: normal;">[drm:__guc_action_get_hwconfig [i915]] GT0: GUC: Querying HW config table: size = 752, offset = 0x00D05000</span></div>
        <br>
        Given that only the second log is useful, IMO better to move the
        guc_dbg to guc_hwconfig_fill_buffer(), because the info needed
        for the second print is available there and it is only called
        once.<br>
      </blockquote>
      I disagree that the first print has no useful information. It
      tells us that a call is being made and these are the parameters.
      We do not know what the failure is. It seems highly unlikely that
      the size changes from query to the next given that the table is a
      fixed entity. It is much more likely to be a caching type issue
      with GuC reading data the KMD did not write. If so, GuC could
      potentially read non-zero data for the initial size query and
      complain that data is invalid.<br>
      <br>
      The intention is to report all calls with their parameters to try
      to narrow down exactly what calls are not working.<br>
    </blockquote>
    <br>
    But we don't need both prints to know which of the 2 calls has
    failed, if the error comes before we get the second print then we
    know the failure was in the first call, otherwise it was in the
    second.<br>
    <br>
    Daniele<br>
    <br>
    <blockquote type="cite" cite="mid:16414d38-e5ae-4bc5-9b22-a2a7a928264b@intel.com"> <br>
      John.<br>
      <br>
      <br>
      <blockquote type="cite" cite="mid:27c27339-cde3-4028-99e5-deb574c091ec@intel.com"> <br>
        Daniele<br>
        <br>
        <blockquote type="cite" cite="mid:20241221011925.3944625-1-John.C.Harrison@Intel.com">
          <pre wrap="" class="moz-quote-pre"> 	ret = intel_guc_send_mmio(guc, action, ARRAY_SIZE(action), NULL, 0);
 	if (ret == -ENXIO)
 		return -ENOENT;
</pre>
        </blockquote>
        <br>
      </blockquote>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------HexL2bbO7p1tLx8s78ZHqHSU--
