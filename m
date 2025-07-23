Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0969DB0F605
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 16:52:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4235D10E7EB;
	Wed, 23 Jul 2025 14:52:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZnNXrh3A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A7710E7EA;
 Wed, 23 Jul 2025 14:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753282355; x=1784818355;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qnjVzIIcQFZYMLtYQwBdg0GHV2OdFg4PsOzNJn3kWQw=;
 b=ZnNXrh3AWAIO4tdTbsyEHZ88fAYR70GZD4fyJKRg0McxTEMhHKOtynGN
 CxW4hR/SnjN3TWvnTdVOhUQWAkwsmg9Nn8QOwpT9ylGXKS3ypIYYioMx6
 mMJ2s9QIoqS/j8RxmHsNOArN+uOe1VI4rzR7+vLJRmWjJMHRcjjCTpJSD
 xAKt+SnqRcZ6xaPliABx4almJYyizrm8yPTktM/GO8luPf+ae0Kc62aoB
 4CqW/Tyj3X7tLY1ahgJv81OeOViYUYMwwRy+w5+bADtSbf2So5Hd8cAjV
 pktWvyh/6IuZgIQjDTRhVGvyuhLTb7oA/D+7G1Eai1o9OvcBbAXga0GPl A==;
X-CSE-ConnectionGUID: EwHqcrDaQkiMVKuF26y0QA==
X-CSE-MsgGUID: HreNbKk1S02T74KnnGPBsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55447203"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="55447203"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 07:52:35 -0700
X-CSE-ConnectionGUID: Uvri+5qkTZqSmHT4miGavw==
X-CSE-MsgGUID: 2U67Psb3SEWINVrCefBXow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="165010551"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 07:52:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 07:52:33 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 23 Jul 2025 07:52:33 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.43) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 07:52:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NxUUtjpugn1m2VZ4OkDUzFk5kuHC2jmhoXuGWCj5omdHKGAT3keiYArOJI6VtPd2SrvOc3eRaYFJrUIKaKzhe3sG15hFN8CAVd7H90icUCjPyjF+jeVJKHPZefsTNF9j3Gvp+YKC3JpQqSPAHewxH6m7JmazJMRSFGnBqotYOutZVwqwrscfK0SYDvL2xwON7aS/8wSH6m9pcJMnhkg78ekksQwGmDTeMrOH0aEqjMIfT0ifsBUvwgPfqbXsLoQjTBWFU8PhxlR+cRtwfv44XtROcsV/GZZml1ITvFD0OypJ/V6A0HAtiLRzJlaaCReX2hMfYsAO12BUsxvE0XxHwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30mf5UKW/KszOLQjM0nmoXDBeOJfNFwx1ECwg/0fduk=;
 b=RSLjb9l1XNN24fDzthyXyKO47VR6I3oNfBIpX5l2AhtL1sePK4amVHCW3//Xux7vbSYm+OKLu5CMMFf2Q+jT9wZzbqcDxWmyaS9wSyuTq+8Wa48+SOAKsL/CaAsr/98XM8wRMutk2hF/B+wOdo5+elJOloZv25vhF3hVFYCl5HILYPRjM/M99edz0GVljkBr906tR2PfbRMQJw3MzaBZDiXiyKY4IEGwnZ+DHwz0pM2KY7QhDAWi9dCA5ztwii6oPcLdcLHCxfTGx8iCg5U6zZxVoN1ZG9dDxyBLzrcVuYzWZlslCrT3YzdmxIeHXa8CBVhZ1I/ASIbHKQZfYJJHPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH3PR11MB7274.namprd11.prod.outlook.com (2603:10b6:610:140::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.21; Wed, 23 Jul 2025 14:52:26 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 14:52:26 +0000
Message-ID: <57adc235-a249-479d-b998-a7620a9d023f@intel.com>
Date: Wed, 23 Jul 2025 20:22:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/9] drm/xe/xe_survivability: Refactor survivability
 mode
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <lucas.demarchi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <frank.scarbrough@intel.com>,
 <sk.anirban@intel.com>, <simona.vetter@ffwll.ch>, <airlied@gmail.com>
References: <20250715104730.2109506-1-riana.tauro@intel.com>
 <20250715104730.2109506-5-riana.tauro@intel.com>
 <aIDrCMRK2gPGmIs6@black.fi.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aIDrCMRK2gPGmIs6@black.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0024.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::25) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH3PR11MB7274:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e2189f8-427a-46ec-a111-08ddc9f88a29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MS80dU5BaWU1WHpTSytwU1cweWtxbWU3Z2QzVUhIUUhQb1ZTNGJkejU0VGh1?=
 =?utf-8?B?dUJEZDVpRFRSWHlkVTVCZGNOZExqc3BnNkpnak1USXp1L01jWFdpbTdaZDEx?=
 =?utf-8?B?ZzhjL3ZhMnRBWFpQOWgvSGtNZlRwLytYaUNTV0g5RGVma25CcGt4d0N3RlNP?=
 =?utf-8?B?VkxnL3ZlaFBFMG81aTg1cjNkMEhtSHdKMWNRSWVUQ1hlT1RQR3RBbmRiSkxH?=
 =?utf-8?B?NlduQ3UxcVBzeitzb3lNR0FmYXZrYndHdXdtTTRnSm1seEJGMnVqMEgrQVZ3?=
 =?utf-8?B?NWJQaHFMOTVnVkpuYTgvZTI3T3dOdkxjdWlabG8rNnF5aVNqSnUxWS9jNHp4?=
 =?utf-8?B?VS9rUzFKS3F5K1MxbFhxY0Jvc2swQm5DUXdDcEphanRxMTVweXdZNUtwREhs?=
 =?utf-8?B?UDBuL2g1aktLd1FEcERzVlJZbkNkWStURUNCODNyTjBLVG0wQ0drWHFKalNJ?=
 =?utf-8?B?WTZGdHFjbzV3WmlGcC9VQkg0WlpYQkJIQUdMbkV1MHlVT1hOV0RrbTd5eGcx?=
 =?utf-8?B?MXg3cnVqOG8zYzBONUluNVk4ZVhudWJ2dmpReDBvQk41ZDV0dDlNOWhjUWlZ?=
 =?utf-8?B?Ynp2dC9BY0JNYmtEc0IrcTBMeXI3ZGdMdk1ZMDI2Y1YyanBnWkRhU1ZMSmc4?=
 =?utf-8?B?NTF1OWFRKzZaZTFsdzkzNjB4RnJYekMzbDFNblJMLzJwQUJpdWxodjEvWjhB?=
 =?utf-8?B?R3NHMEExeE5iV3ZPOUJvWmxPQXVLOHBBNUpNUnRtWTR3REdEeHNjbFd5WjJN?=
 =?utf-8?B?bXd5NXZhay94NkJPQWxvZEtxVXJZZzlVTHIraTRnZVA3MVo4YlhjODdmVkZx?=
 =?utf-8?B?VGdxbWV1NWcyNEdUd1ErSyt2elF2TTFZZGlZSEFOdEJyZllZSkMvUW4rNHU1?=
 =?utf-8?B?QkhXdzFsSkY1cC8xRzlVK2IwV2hWeU5GTFMyZjFwZ0RFeUR6SUhVa2hBWS82?=
 =?utf-8?B?UkJCWWQ3Nm5zKy9MUkhrMXZrc1VkaGdCZzlSaGhBWHFtOXlwUnIweFpIejlV?=
 =?utf-8?B?Nll1bGk5dlduZGVIbmNzbTFYZ0U3SThveEZqd0NodU42dHRrck53VDlZMmR6?=
 =?utf-8?B?eUlQVHo2RjdWcm5hNzBWc0lZUzkyU0RDZytQVHh2bFZxV3M3S0NlRVkvWHhH?=
 =?utf-8?B?YmdaRjk5NEU5L2MzVE01aGYzOFhrV2ttOUVBaXEwMkVQT3R2ZXJBK1QxeG55?=
 =?utf-8?B?S3A5NDh5TWtGY3BReVBwNzM0MGc2ajQ0c01ZcEs3dWl3YnVoREQ3YW81a1N0?=
 =?utf-8?B?WHJRNEFwYTV0YUNMenIvVFVmbXA3dnJLU0FQdkZRM1RnYisxanRVcFVzdHQ1?=
 =?utf-8?B?YW84QVhUdnloVmRweEJ0ME9VUFNxSC9BWEtCWXd1QTNZdVExa3cxRGVuTk51?=
 =?utf-8?B?N0VWb2tlWXFxeG14K2F6OU5iTE1WKzVvbVE5dWtKRlhQMnI0bkZRZTF0QVdB?=
 =?utf-8?B?MFM5N3lMcnhVWkM2dmxKN3ZVWjVXMVNtTzJkUDZwRm15Ym1PckwwdnFYdWh2?=
 =?utf-8?B?Ykh0UWkrbWZyUWdNaEhxWkRXSWRpcHVxRXgwMjM1a0EzczNYZHlINmdrb0hW?=
 =?utf-8?B?eDZlYk5LRzhIVE0yZzZLS3JyMlJYcDhKY0I1V3hMR0JEbXAzTmxTZERtQ0pR?=
 =?utf-8?B?aFBwb1ZUdGxrdWp5RnpTMVROTmNoeFIxU0dWS1FMZkpEV0F0d3lWT3hnVzJV?=
 =?utf-8?B?Y1FyTUJrK2M0UllMRXhIN2RsS3dQV2FYQ0RBTHJxMmxOSEN1UWRuZUVyZDhi?=
 =?utf-8?B?MzFPR1JDSGRuRDg0V3RTbDVXL1RYTDkxMTBSc2tLNWEyR1A2YmZqd2dDYW56?=
 =?utf-8?B?SFdJWkZhNlM3ZVJRVTVZQVNHWXdJZkhaVFRoWXJtaDZDblZJMXZDOTlsTkNs?=
 =?utf-8?B?bi9lYUVNbkpEd2RjZzBDdmJrMHEvN29vY3lOZWFjT0YvdWZQd2RYOXFwMElI?=
 =?utf-8?Q?QUog7C8HQIc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2J4dFhrL2F2c01qamFIVHVYTFBMcytSM3VOblZ1MGcxZzdzMndMSjR1SGk1?=
 =?utf-8?B?VjQyMDVZMWt6a3FuVnB6cGMxV2Q0YUw4SzQ2elRWVzVpVnhDbDg1OU5FM3Jy?=
 =?utf-8?B?OFJoaUE1dTR0M3FCQ3NnNGlYRDJqUVl6QnpSWXNLQ3prUncwZkxuSzgwdzRU?=
 =?utf-8?B?aGNGSUZtTkcvME81dFBSQ3hPU0FDRy9qUm5ZeUxVTGQrbll2SVNrMHBxa3dh?=
 =?utf-8?B?d1VxYXYzRTRrZSt5SFF1MWVpanVXV2NlS2Y5UEdUMzZrTlJxYWh4Vkw2dms0?=
 =?utf-8?B?ZWFsb0oyWXltRDlQV2NxQVFLSlFCVEhtc3RNckk1Vy9jZCsxZFd4Vyttc2l5?=
 =?utf-8?B?eGxpMkt5eEdONG9WQ3RFUlJJbTdwMk53K012Rkw2VjEwY3ljSlZuWHRTdXg2?=
 =?utf-8?B?dWZXUWhsc3BiMTFHUE9LUFNmTWVLQmtyRjFzbHdSZzZZRGNlNDlGcGpHdS9F?=
 =?utf-8?B?aVhMWU1YejNiZ3BHaGVuc2dROHVweTJzM0RtM1JBaGtmWllvd1B2L2N5dzkw?=
 =?utf-8?B?K3k5aVd3SzFXNkVna2NSeTVNY3o4T2M3cTdaQlpsY2JqWDU5M1dHYTJXSG9I?=
 =?utf-8?B?VS9USWk3SFVhMFdNTnZpVW1DUTJzSmhZWVhocmZocUVWd3VNN3NnSFZKbHoy?=
 =?utf-8?B?Vk04dlRIYmdNRU9od3o5dmJMU2RwZHhwb2JPM2wrSXRpVXcraWlaK1BFZjdE?=
 =?utf-8?B?Ty81SFZNbEY0VW5jWkZXOUNkYVFqcFEzUHRRS2E4WXEvMXczU1VDZ082ZUxE?=
 =?utf-8?B?WG81cWJ2ZzNxNGhyN1krWldmdXEyNE02ZkRnTVAzVXd0bmY4bEs0WGpYeTE4?=
 =?utf-8?B?YnVMWFpBTWFvYWVZc0N1K3NhbHpaelRjQUxjVGFBRitIZ1hrQzF1ZS96d2Iy?=
 =?utf-8?B?V24rM3JlM0RmTFA3TEVGMVhDUUtjOXBuK2l2UkpZeTlseWcxSGdVdGlSMGFL?=
 =?utf-8?B?R1kwamlydjh5L2g3VmNjOGlmUlBHTGJUMElNRUZCaE0vL0QvS1hDMDU0WEc2?=
 =?utf-8?B?ZGhtYXd4Uzh1QWFGQTJNWDhZczFRYW01TE1ibG9rYWh6SXZrcWt5clY5RGdq?=
 =?utf-8?B?V2MrTEhiNGFXZjZ0YjdGTkxsY09JUEJrY1QxYUl2bjRjd3JTNitlSmJrMDVl?=
 =?utf-8?B?ZjhFYk1FWTlSKzVQUUZFdGZVZWJQVCtjZG5FOXJFUlBuS3A5QzM4ak8vUndi?=
 =?utf-8?B?ZStPUTVXQWxsNk5nV29kd1pPSXJibjVVemh1SjJFRlFJTjdMZkViY0QvMFVK?=
 =?utf-8?B?YkRqM05kUnZqSE00OFZwMEVrZ3FpOVJCZWFJVWFYeWljMkZOT2c1Z0cyamRW?=
 =?utf-8?B?N0xKakM2R2NjVE9BelhtUjhUWWpFZFd4RkQ4MksvcWp6bzhQVTJMdVBQMjUv?=
 =?utf-8?B?akRtQ2puRmFiUEdoVlRrNDBXLzJYN2NaUG4rZFRIak5tbW44V1B5Q24rd3Vx?=
 =?utf-8?B?Qmw1NTBTdjYyMEh4ekM1WXdaVGgyRTdDa1p2TEExTUFOQWxIQXNvZFoxNEY4?=
 =?utf-8?B?cWFsc0dicFk2aU5CMHRyWlBoN1dKSHkrZ0tLdmUyRDBJMG5MdlU2U0RCMUlX?=
 =?utf-8?B?eng1RnQvdStlS0tZaWZFVmpDRmtNZ0RRYUR1MVd4UkVySlhSNzlHOWdNMDFL?=
 =?utf-8?B?aGxsMHF2MXpJV09ONk1DcnprRlBuRmc1Z1VQK2lmdWlmTkw3OGxDYUtwSkxr?=
 =?utf-8?B?WStBQmhZbFJyaXQ3ZG5ScldiRG5qakNPNmUxMEQxSUg1V2E4RHhLcVBWVWt3?=
 =?utf-8?B?eUpJK21tdlZWR09UMXlBZDlTZFducFVZck9mZGRPMjZOajI4ajF2ZnNyVmQz?=
 =?utf-8?B?cjVWU2g3Z2lsWngzVE9mUFY1UjlZcGJPKzhDWHRJbWJMdGI3RGJHVVk2UEZa?=
 =?utf-8?B?NmRyL2pXckRwT2pkc0dVM0FKc3p3VFVHUmVPN1VUOVBEc3BRanJlNEtqM0Vi?=
 =?utf-8?B?K1EwYlUzVHZ4YmxNdVVxa3B5NjljZ0ZCM1UxYW54aTVWeVRJRmMxOUxpY1BQ?=
 =?utf-8?B?bitYVjF3cXlpS1gwd0lZMkVEcFRnTStRbXl3Qkd2QitQaFhwdXNNdGNFaFB1?=
 =?utf-8?B?TlBNeC9xWUthS3VUY0FSNTdnYlI0QVUyL2tPSjdKNHBBaWJONGRkeUZ5VDYz?=
 =?utf-8?Q?w6bFOhlzjboN5y0rdWUGWzUAy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e2189f8-427a-46ec-a111-08ddc9f88a29
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 14:52:26.5085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jXQpBO1hQTSY+EIwmD7BLKN3/Q/XogDDgbG/a0n3Q3BzZxgSOU/bAw1wqlE+naUHNo8pWbmX+5RMfri1uak/Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7274
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



On 7/23/2025 7:30 PM, Raag Jadav wrote:
> On Tue, Jul 15, 2025 at 04:17:24PM +0530, Riana Tauro wrote:
>> The patches in these series refactor the boot survivability code to
>> allow adding runtime survivability
>> Refactor existing code to separate both the modes
> 
> Punctuations please!
> 
>> This patch renames the functions and separates init and enable
> 
> ...
> 
>>   static ssize_t survivability_mode_show(struct device *dev,
>>   				       struct device_attribute *attr, char *buff)
>>   {
>> @@ -130,6 +138,11 @@ static ssize_t survivability_mode_show(struct device *dev,
>>   	struct xe_survivability_info *info = survivability->info;
>>   	int index = 0, count = 0;
>>   
>> +	count += sysfs_emit_at(buff, count, "Survivability mode type: Boot\n");
> 
> Although I'm okay with this but, should we make it something more parseable
> from userspace?

Suggestions?

All the rest of the information is also in <name>:<value> pairs.
Dumping scratch registers is not useful for runtime survivability so 
added a line instead of an empty file

> 
>> +	if (!check_boot_failure(xe))
>> +		return count;
>> +
> 
> ...
> 
>> +int xe_survivability_mode_boot_enable(struct xe_device *xe)
>>   {
>>   	struct xe_survivability *survivability = &xe->survivability;
>> -	struct xe_survivability_info *info;
>>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +	int ret;
>>   
>>   	if (!xe_survivability_mode_is_requested(xe))
>>   		return 0;
>>   
>> -	survivability->size = MAX_SCRATCH_MMIO;
>> -
>> -	info = devm_kcalloc(xe->drm.dev, survivability->size, sizeof(*info),
>> -			    GFP_KERNEL);
>> -	if (!info)
>> -		return -ENOMEM;
>> -
>> -	survivability->info = info;
>> -
>> -	populate_survivability_info(xe);
>> +	ret = init_survivability_mode(xe);
>> +	if (ret)
>> +		return ret;
>>   
>> -	/* Only log debug information and exit if it is a critical failure */
>> +	/* Log breadcrumbs but do not enter survivability mode for Critical boot errors */
>>   	if (survivability->boot_status == CRITICAL_FAILURE) {
>>   		log_survivability_info(pdev);
> 
> I'm not much informed about the history here, but should we be logging the
> scratchs if we consider them sensitive?

For non-critical, survivability mode is enabled and a firmware flash can 
be triggered to recover. For critical, the scratch registers are dumped 
for more information about failure since there is no sysfs. It would be 
useful to admin to find more information about failure

Thanks
Riana

> 
> Raag



