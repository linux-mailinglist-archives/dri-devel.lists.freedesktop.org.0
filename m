Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5E8A33E15
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 12:29:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1971F10EA68;
	Thu, 13 Feb 2025 11:29:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KSg8s2nS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D2810EA61;
 Thu, 13 Feb 2025 11:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739446193; x=1770982193;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=terMb86CbHXNDKdB1UQmLkaKY37PIUgW9yA8aWqMUkA=;
 b=KSg8s2nS4KjAMQH87jnNfeojN2uhFBKAdmwGvT6JBRSI5XSvqZcj+O8I
 LzDaDbwyDT2UjYtJjBOOoe6WP8hpp1efWpql9nTEXK3vD7NzOiR31nrSm
 TF8fG/g9pQ76ZAGr7ivDn/dC9m6dA33nuWMVMqgWjYBw4bgFV5BpFPhuv
 0kr1b5LphJgJSuTfUv17CKtZUdQowgaE6p4lQQ1A93tABsciLupZQgeN6
 LzCb8aYs2tI55rJFZDlpp6odFHGK0bvObw73T6ij8B/qd2v7fc/gRafLB
 pGfvq7U7vNPoOuoWLvdLDP2UOpCeXh+sbAADnc5eZUWClJa8W+7kRtTQP Q==;
X-CSE-ConnectionGUID: WzkB/p/YQreUokTrTx8Qtw==
X-CSE-MsgGUID: 1B9KZE0tTzqWpWLBmgLIVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="40294097"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40294097"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 03:29:52 -0800
X-CSE-ConnectionGUID: /Th26USRSrK6q8LO6K1NKA==
X-CSE-MsgGUID: ph0d8RYqSB+U1IWly2HWPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117230061"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 03:29:52 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 13 Feb 2025 03:29:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Feb 2025 03:29:51 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 03:29:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UiRXw2g36KzOIflvR975eIZsgOZvF3jw7+Q7RqK2uIe+9vwHTrz+EguI1NmYJ4EXONrPcVZXArBDIM1LtE60y1/1SWuzQUichIBQPr+YROVAjpPKMLrx9TWtgBFOBkXTMl9T+yOz25MfKCm0i6C51dHnMQjzmtAUd70diwIW508dmpgQqjMf+/xmAX69cKOhrsCREIKSN3KarcI0jh1GJMIYAlb1ZdaN/hG2wqwD4+4TcvevPuIyJ1eQQiCUV/oAGmGl913AAOKXJz9UKnanC/vRPKPdfTbY4mbCMEGoSjEhOjezMsghMpXMWvel9a3RFQWCXzKbJxzvFNpV1ekTsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5bhmdVg+tGoD38lmnTZ2IhjDrRQhtTzaAOD3ps/Ko8=;
 b=artS/UNg44RTz4pNJ4rFrnhd0lhLFMmqXWDVBVG+wEBS3wv6nC5kSQHAg1IQEwRTtPwcT79VmFwhq3L5PxyNOpzOunubGmJ5z2Dke/F3KKstP3zOdcjtksIuAw3D1QlANx+bWHHSEwS16AuJ0b1hvTx4I8TctcWZMvxSTEi+6dsduJ66fcOzEaNHhfqtXPOnANlAuM6Bc4yb9+JcvG764WCU/I+ZzQkdnafYfMvQkL8jT9yO2Td5UdA5KsNION1fbfDXOPHeJ3NEJfFSCNrlBD1hnZRJ9rpfM7d84HIQ1odnP5R95BGLj4yokiBV0owv3NsU6oLEfZQK69wGLmonIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB7794.namprd11.prod.outlook.com (2603:10b6:610:125::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.23; Thu, 13 Feb
 2025 11:29:03 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 11:29:03 +0000
Message-ID: <7c9f66dc-4199-4efe-8c5f-20369d4f656e@intel.com>
Date: Thu, 13 Feb 2025 16:58:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 21/32] drm/xe: Add SVM device memory mirroring
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <apopple@nvidia.com>, <airlied@gmail.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
 <20250213021112.1228481-22-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250213021112.1228481-22-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::18) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB7794:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e0ba7de-30d8-4344-6ac6-08dd4c219e34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0NnQnpUUDVEcEc0WkVVY2Z3YjlaUXBTNjU4ZzJKQTZKNFRyTkg0bFk0RE1E?=
 =?utf-8?B?NDBLd1JVT3JHMGtJRUhpbTBqbXI2QjBhTDZUUldmUEdqaGhVajdYeVlBVnhp?=
 =?utf-8?B?K2hsTit3Um42VlZ5SC9DRGRURlF6bSsyY3h1TVY1bmd3RVM3NDV4eXNnQlJH?=
 =?utf-8?B?TjhYeU1yQklLN3hWZDlzdGlwWjI2MEZ6bjM2MjBRL2xwb1ZHRnNoZXJudVpI?=
 =?utf-8?B?anJjYkpLNnFWYjQ3WW1hbjN2QkFDSFNJNS9lYlZNL1IzOW1kbjlwRG9QZEIv?=
 =?utf-8?B?cWMwMnE3M1FtUjhWLzVlMGs5cW54d3N5SVdiNVphV1RIQzk4SUxSSVVTaWpp?=
 =?utf-8?B?eGJTQ3YyZWdCMmxYcEhUcWVEQi8xWnZEcThSNkZFU1lEcmFRUWcvNlgxYzdV?=
 =?utf-8?B?UHVPeURuK2RjNWVUTU00OUZCL3dyUkRCakpaSWRXd2JKZmNKS2k0K1BOeGgw?=
 =?utf-8?B?YlA2L3UyUm4yMXJnYlZhSlRlWHJPdzdtdDhuMGd5c2dpNkpDNDZzTTlQdWhm?=
 =?utf-8?B?aWc4YzhodS9rRVhFSHA0aDUvcjhxZjRxWjhZbk9aMTc0YWFhWnRlWU50SzVT?=
 =?utf-8?B?VCt0a1A2ZTdVaUxEQjNiNGJGQ0h2M2N2NFdiMElpQXVVQjV4WE41SjFWOEd0?=
 =?utf-8?B?WHZzZWtCWFJMOU5yTS9iQkhKd0VqZXBZZUJEVExjbWhrV0s5S0hZZG12Q2Uz?=
 =?utf-8?B?cmt2WEtMWERKNnV0VFJ4eHRlSTJER29CdzdVUVp0UW9zQkFJVFZmaXVjQTE1?=
 =?utf-8?B?Ulc0Ylo1UVBUckh2bWdPdVllRVhpbnZtb1dCQ1dTVmtZWUxxRE51QjZQUjVa?=
 =?utf-8?B?WFFQam5XQ24rNHphclFHREZXVDBLNVhnbk53OU5pdlNXekdkWkRzeE9ha0Jo?=
 =?utf-8?B?NngySG5nT2o2U0pTazVTZ2RMR2VUSFVnSWpMRFgyVjdueFF3NjZjUE1QWHBw?=
 =?utf-8?B?aTV5ZXRndWZHelMzRzh3ckkyRTRLLzlLZjA2ajFoVk5vcnp3bXlMVDJOdkly?=
 =?utf-8?B?TjlmNmtnaTh5M3loT1d5UEdOaks4YjFuYUw2NC9VTitqWUJoTWhtTnMveHRF?=
 =?utf-8?B?WlZ3OWhRNC8rcWxQQVdCMGhqbFNRei9WY0pYTDUrcC9KNlRJcjVJT3hIeXJC?=
 =?utf-8?B?Y215dHBmQ1k5aWxSYUZrSTBSUm04SU55dzdmVkU2a05ab2c4eCtzb0dndkxT?=
 =?utf-8?B?UnZzQ3htR3BrVTVrODJ3bVJEL3UycmN5NWplZCtkd1lBM0U2RWlWdHhLdHVm?=
 =?utf-8?B?QjRWN3IzYzNFSnZHSEhVQTduQ3RDNVMyWi94R2l3RTFxV0psVDR5cmo3UTNB?=
 =?utf-8?B?T096V05xZDAwZFFKM1VLdklZN2hCRklJWUkxQ1VodlB1Z0NyMDJqSWtTd2VV?=
 =?utf-8?B?ckJEUTZBM3lIbTNwMUJjQ1BMNWI0Y2t4dmxxM2pWV2tZNlFoWUVsMmRjU1hL?=
 =?utf-8?B?akJnQlY0aHNKV2lBOHhGN2ZSTzUzUVJnWFBkWlN2eDVjTXlxL0VJdnA4cFBD?=
 =?utf-8?B?aXlZOFFKcm44K2xUUGd1d0REYURSbTFvM1RneERmdUtwMnVFVVd4OVV6UUR1?=
 =?utf-8?B?SnN4dElFd1R4NGhCRElUWjl4akxQeDlTZXFiL0lRNHBzYnI1M2FyZW5jSktW?=
 =?utf-8?B?czlsSU9TZEdscExpQ3hnOFp3TWJ6WlM0MGpTL1NUN2xXc0dCOVliZjJSdEQv?=
 =?utf-8?B?bHByOGVJc2VHR3lOcU5rbW0ya3JjU3ZGTmVLV1NWczR0bnQwdDB0U0dLK3RI?=
 =?utf-8?B?NDVaeUFoSElmVTZJQ0tTaVJHOUFUTHpSZFBMcHI3bTNicXhXeU1FMG43SXQv?=
 =?utf-8?B?S0p1anNyTEI4akZuaC9QaTh6eWtUeUlrdXAxZm1IRGsyQkJOWHRGaHlEUVBL?=
 =?utf-8?Q?P2Wiz8DhBakus?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TS9YdDFnbHphcCtIazZSdHZXN21wU2QwSVNqRExMazZKdk10WVhNV0Focy9P?=
 =?utf-8?B?U3V5TVF5R3UrTEY4dWtFWDFacVdUaE5LU1IxY3RWczJlejRPc2tNTmZZL1pW?=
 =?utf-8?B?Q1dWTnV5ODVDZlF2WW9OTEtlM0l6VU1LR2ZDY1pvb2lOb2lTTFBaR25LWmFL?=
 =?utf-8?B?Mjk2eFhLckJmRDM1NVR0U3VzTkZpYlY5VksyTVlhcVFGWGFwWms4c043eEN0?=
 =?utf-8?B?dXZZNWVGdHMxZ1RSYjJ3Z0JaOVFremdFSUdBSENFeGV3RWxxdVBuZmRVNGkz?=
 =?utf-8?B?MmF5ZURseHVZOHowb3pCY2xRblM1ME1YSWtKQmYwV0JjMS9IWjU2SERmd3l3?=
 =?utf-8?B?T1FybWVvcmNPTzVnNE5wQmYvT05FeVlQeVFJaVJ1cUJPaEFPUUhYZnJoZERv?=
 =?utf-8?B?bmRHVEZXYVh3RmpTSE9DcVMrTUpMbmIzSG5ETjN4TXJzbk1tZmNsbmtpaFd3?=
 =?utf-8?B?KzdTTHl0UVVHWWlHcC9tSUtuSWFTNXViTmpJRnFXM2RvUjNpSGxBblB6UjNX?=
 =?utf-8?B?VDZ6djF1VkZBY2hGZ0RaWnpMb053QWZBbERWcnorNjdobTJKWHE3ZWNxeUY4?=
 =?utf-8?B?emIxMng0QWlFMEhXL1kwZGpxdmFBZ3hIUTVDa2JvSmFtKy9LNG44ZUQwWTM0?=
 =?utf-8?B?alFndGhYTmoyUlFpNWk2NXU2d0Fyam1neU5nbTFVWGdnMlBTNjVEcEZEN1Iw?=
 =?utf-8?B?d080b2tUam42NWhIZElsemhuT0tkZmlZcEpMZkU4b0tzajZHT1JrTG5mRCsy?=
 =?utf-8?B?QlVjWERtTFMwbklkQVBpc3VXRUZFeXVqV05uTzRpTU1xbm1LUEtNSlMzNUJE?=
 =?utf-8?B?RTllTFZwYWdLZVhURVZmT3o4NDFkdEp1SUhTc2ZnWHdldEx2MjJuRlBqTFlC?=
 =?utf-8?B?R290NWdIYWREWWFHZ3Z1N3NtZ3RVOTI4eExWM2k2Ym1rRDJ6eVVIL01wSFlC?=
 =?utf-8?B?MDhOaU1HYXFIa3Nqalo2eTJNL201cEp2eWUzaFRQYnhxUW4waUJIVHplRFI0?=
 =?utf-8?B?UkkxNDJ6NUJnMGFFQk5jQVhUMW43TkFaRGJKcHNINFNvSWl1Q2hoZWRNUEFL?=
 =?utf-8?B?aHhISEwrL051RUx6c2hnRTJqaXlCWjRLMFFUclR1WGZlMGVTclpXWFVjeUlM?=
 =?utf-8?B?NGdNaFpqTmw4K0N3WjJpb0xGY3NpVGxuV1RSWXRGZEZjRmkxelpraTFBa0VP?=
 =?utf-8?B?d3UvMEVWM1BDTUswbHAzNmRJNXllQkxlL3I4LzAza2g1cm5qVTBXbHlmZ1Av?=
 =?utf-8?B?Z2pNSzFTVXRHanhGQ2M2WFV3WUh0SVV4aXFWNVh5aVpxdXI4SXhmeko1TFN5?=
 =?utf-8?B?SDZ4Z1VBVDRiSG9IUFgxanFURnNFRnMrYzJ5RlRBMVVUbFNRNkx0Z21XbWly?=
 =?utf-8?B?WXhoMEl6ZlJmNERTQ0x0NEFQUHZkN1A0QkZVdWtmeHJ0VnphQUtRdks2Qkdz?=
 =?utf-8?B?WE9hb0xFUkhnSzdvcW42TU1vQ1ZpWUJ0eHRZa29Ta1Fmb3RSemMvTGNteExu?=
 =?utf-8?B?SFFmbTArYnJLbTdxS29xSmI4b0JjK0VOU0c2SDFkdnR0QmZCb0lidWJtS1R4?=
 =?utf-8?B?eDNhR3VtMlA5V2puZ0xGMnFUQm5GTEJnUkRRQlAwdVlZTzQ5UFR2cElTUkhD?=
 =?utf-8?B?Tzc2RVVvQUdqQXVtM3hyWFV1MWNLYkJQbUE4Qmo2QmMyZU1SREl6dnplanFp?=
 =?utf-8?B?Umk2Yk8rTnNRR2tUcGtuOWRreG1vMjU5UUVsN0JhRXJiSzBHZlQ2bGF3RFJv?=
 =?utf-8?B?TFdOWWtENEcyOEkrWHFBdTZvUWdRZkd5MWM0RWVKMmM2Z3NkS21IUDkrUkZo?=
 =?utf-8?B?UUdLWjhvZ2h0UUlpQ0hPMno2L09hZStaMW5KSDhwdVJhNTlKVGVTRXNuOTdH?=
 =?utf-8?B?Y0pWMUh1SnhKLzB0c1NhZlUycklRbE10eVB6OWhlQWk0dCtBaldjQ1pXeW52?=
 =?utf-8?B?Rmt4TkU3MTJXT2tENmU1cU9ZNmNFTDdKeEdreGltNEQ4QSswenZlV1lnSWJv?=
 =?utf-8?B?MjlhV2FyeVl6UU85RUVsaXNyeG80VjlGU1BFdk42V1A4OEowQ0YyQk1ycnpG?=
 =?utf-8?B?RVZpdDlOWDZUME8xSUEzbE9MTE9nZnMvampBVFdlVmxZS1A0NHdzVWFEOW0z?=
 =?utf-8?B?WU55TE5oZlRSUWlwWDZTa2FOc0RuRjFDZXBxUXNOcFQ1Z0JETUZzVUhxQ2pQ?=
 =?utf-8?Q?YeLNKOEwbmwilam3l061EEo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e0ba7de-30d8-4344-6ac6-08dd4c219e34
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 11:29:03.1112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZLtR/SfRNzlXnDFTAo4a6XpuDtWza0aXRELBRltUjwYSphGfp6HrYXQkIfUj4HoBNy3eqsyCJi4R7tm6Xkc35jprgz7hFILrSu1CTMi/78k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7794
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



On 13-02-2025 07:41, Matthew Brost wrote:
> Add SVM device memory mirroring which enables device pages for
> migration. Enabled via CONFIG_XE_DEVMEM_MIRROR Kconfig. Kconfig option
> defaults to enabled. If not enabled, SVM will work sans migration and
> KMD memory footprint will be less.
> 
> v3:
>   - Add CONFIG_XE_DEVMEM_MIRROR
> v4:
>   - Fix Kconfig (Himal)
>   - Use %pe to print errors (Thomas)
>   - Fix alignment issue (Checkpatch)
> v5:
>   - s/xe_mem_region/xe_vram_region (Rebase)
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/Kconfig           |  9 ++++
>   drivers/gpu/drm/xe/xe_device_types.h |  8 ++++
>   drivers/gpu/drm/xe/xe_svm.c          | 62 +++++++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_svm.h          |  3 ++
>   drivers/gpu/drm/xe/xe_tile.c         |  5 +++
>   5 files changed, 85 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 60b922f75001..4bc03d6f6720 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -74,6 +74,15 @@ config DRM_XE_DP_TUNNEL
>   
>   	  If in doubt say "Y".
>   
> +config DRM_XE_DEVMEM_MIRROR
> +	bool "Enable device memory mirror"
> +	depends on DRM_XE
> +	select GET_FREE_REGION
> +	default y
> +	help
> +	  Disable this option only if you want to compile out without device
> +	  memory mirror. Will reduce KMD memory footprint when disabled.
> +
>   config DRM_XE_FORCE_PROBE
>   	string "Force probe xe for selected Intel hardware IDs"
>   	depends on DRM_XE
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 6a41f608a7a1..00873d80b10d 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -106,6 +106,14 @@ struct xe_vram_region {
>   	resource_size_t actual_physical_size;
>   	/** @mapping: pointer to VRAM mappable space */
>   	void __iomem *mapping;
> +	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
> +	struct dev_pagemap pagemap;
> +	/**
> +	 * @hpa_base: base host physical address
> +	 *
> +	 * This is generated when remap device memory as ZONE_DEVICE
> +	 */
> +	resource_size_t hpa_base;
>   	/** @ttm: VRAM TTM manager */
>   	struct xe_ttm_vram_mgr ttm;
>   };
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 7b1076c184e3..b1947c75c249 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -29,6 +29,11 @@ static unsigned long xe_svm_range_end(struct xe_svm_range *range)
>   	return drm_gpusvm_range_end(&range->base);
>   }
>   
> +static void *xe_svm_devm_owner(struct xe_device *xe)
> +{
> +	return xe;
> +}
> +
>   static struct drm_gpusvm_range *
>   xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
>   {
> @@ -317,8 +322,8 @@ int xe_svm_init(struct xe_vm *vm)
>   		  xe_svm_garbage_collector_work_func);
>   
>   	err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe->drm,
> -			      current->mm, NULL, 0, vm->size,
> -			      SZ_512M, &gpusvm_ops, fault_chunk_sizes,
> +			      current->mm, xe_svm_devm_owner(vm->xe), 0,
> +			      vm->size, SZ_512M, &gpusvm_ops, fault_chunk_sizes,
>   			      ARRAY_SIZE(fault_chunk_sizes));
>   	if (err)
>   		return err;
> @@ -453,3 +458,56 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
>   {
>   	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
>   }
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> +/**
> + * xe_devm_add: Remap and provide memmap backing for device memory
> + * @tile: tile that the memory region belongs to
> + * @vr: vram memory region to remap
> + *
> + * This remap device memory to host physical address space and create
> + * struct page to back device memory
> + *
> + * Return: 0 on success standard error code otherwise
> + */
> +int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
> +{
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct device *dev = &to_pci_dev(xe->drm.dev)->dev;
> +	struct resource *res;
> +	void *addr;
> +	int ret;
> +
> +	res = devm_request_free_mem_region(dev, &iomem_resource,
> +					   vr->usable_size);
> +	if (IS_ERR(res)) {
> +		ret = PTR_ERR(res);
> +		return ret;
> +	}
> +
> +	vr->pagemap.type = MEMORY_DEVICE_PRIVATE;
> +	vr->pagemap.range.start = res->start;
> +	vr->pagemap.range.end = res->end;
> +	vr->pagemap.nr_range = 1;
> +	vr->pagemap.ops = drm_gpusvm_pagemap_ops_get();
> +	vr->pagemap.owner = xe_svm_devm_owner(xe);
> +	addr = devm_memremap_pages(dev, &vr->pagemap);
> +	if (IS_ERR(addr)) {
> +		devm_release_mem_region(dev, res->start, resource_size(res));
> +		ret = PTR_ERR(addr);
> +		drm_err(&xe->drm, "Failed to remap tile %d memory, errno %pe\n",
> +			tile->id, ERR_PTR(ret));
> +		return ret;
> +	}
> +	vr->hpa_base = res->start;
> +
> +	drm_info(&xe->drm, "Added tile %d memory [%llx-%llx] to devm, remapped to %pr\n",
> +		 tile->id, vr->io_start, vr->io_start + vr->usable_size, res);
> +	return 0;
> +}
> +#else
> +int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
> +{
> +	return 0;
> +}
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 50d47024d2db..0fa525d34987 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -11,6 +11,7 @@
>   
>   #define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
>   
> +struct xe_vram_region;
>   struct xe_tile;
>   struct xe_vm;
>   struct xe_vma;
> @@ -36,6 +37,8 @@ struct xe_svm_range {
>   	u8 tile_invalidated;
>   };
>   
> +int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr);
> +
>   int xe_svm_init(struct xe_vm *vm);
>   
>   void xe_svm_fini(struct xe_vm *vm);
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index d9a7a04ff652..51cda137cfbc 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -13,6 +13,7 @@
>   #include "xe_migrate.h"
>   #include "xe_pcode.h"
>   #include "xe_sa.h"
> +#include "xe_svm.h"
>   #include "xe_tile.h"
>   #include "xe_tile_sysfs.h"
>   #include "xe_ttm_vram_mgr.h"
> @@ -160,6 +161,7 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
>    */
>   int xe_tile_init_noalloc(struct xe_tile *tile)
>   {
> +	struct xe_device *xe = tile_to_xe(tile);
>   	int err;
>   
>   	err = tile_ttm_mgr_init(tile);
> @@ -168,6 +170,9 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
>   
>   	xe_wa_apply_tile_workarounds(tile);
>   
> +	if (xe->info.has_usm && IS_DGFX(xe))
> +		xe_devm_add(tile, &tile->mem.vram);
> +

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   	err = xe_tile_sysfs_init(tile);
>   
>   	return 0;

