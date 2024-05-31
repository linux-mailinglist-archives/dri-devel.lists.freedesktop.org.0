Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B55618D59FF
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 07:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3372410E468;
	Fri, 31 May 2024 05:48:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jXSg29iS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0690210E0BE;
 Fri, 31 May 2024 05:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717134532; x=1748670532;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QM7dctlM/xo0SYXAp1eMo72QwFi4T9ue9toe9LOPEGw=;
 b=jXSg29iSZQcKCRUrQtLHh3HFmti90v2fyGasynLCGQHBmWb20JOva/11
 FAjNzpXeX7EuE/w/88cFL14woIre+o+n6XLOnnzahu+WGqmLiMGvjjMrs
 Gz50NhsI/zk4K3ARS8CwvvFVNjbkBt9XLJCuaCNRnSzCX9wD5jev7jN9y
 J4kZxLQoYPpm2ZIgg9usHnGc28ijt9BJnFQ7V12DJ2kBUJpA7gF1SMto4
 BWpcP327Hafg9Z6/3w3JlQGitQJXScF688nZAWfUCya3Bi3aAyOlxc2xd
 TtIEDyvPi7ztkzUlmrc9OmDee1eaZDeGNqlEPYSEJtKgOXoopXqQpbfnb A==;
X-CSE-ConnectionGUID: SDpXbXT9TQCNLFy1EzgtcA==
X-CSE-MsgGUID: 2zzUKk7JQCqkk7XyVVm+lQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="17508896"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="17508896"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 22:48:47 -0700
X-CSE-ConnectionGUID: GeTTfB2FTPGRiXm0gwJ10w==
X-CSE-MsgGUID: tqBrItQrRAOOrX1PeQckew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="36161171"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 May 2024 22:48:46 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 22:48:45 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 22:48:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 30 May 2024 22:48:45 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 30 May 2024 22:48:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ARqfH/L/48JkVr8SH/EMMPuRGiSMrDk5PdcvFVJ5aoja6IFFXUOLkLtIHwQ1jkmNRRR5Xsc08kjKZubPfuUqvN+iZJEvgHazVdWJgULO85BAvK45oqiuc7PRR7Gjn0NtmMb0veIftzhMkH9rgv/IMubR7crKwRaAsxppG1HqXUxPJmKBycdXNtaOB7HeFH11KpMZjcroH6lR9GYlDX0A/sHcn9SJCjNK/dp7gVKI0rwQpVbjLmxoRNAl9/CX3ooGvZkBqihQN7R+Wgbpybd+ESS3Njn/pMWHG/BuRGz4Ql1Y/b/zfcJmsT2Ib4Hlewbe3FeEn7jdNnsJ5QJDFUYV/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4uLNYi1I8fZCpGgJjZXjCxEBvaoLLbWjVgsCLtnmXf4=;
 b=ACXak9a8CG+Aa5NkEhb3iRU80vRJOVO1wboTmf2XrDHrQujQACt+/5PZz0FZ0LAKDW0cy832xZWwg5wUpXU1FE2VYvWnXhWYyP9Iw01T7DZd/+hb+sGZYDqbQvPTC96Bi9NvDTbweDtKeULkYO5FNMmbGeYMkS+t3pev6jwKZiSTaE9zIn/WOMV/cMneNQlE+V0q5jD4aIdny6xLBqWSFH1kFi4NSeRix3g72lZdKcdh9CE5NDpTVNX601YOO71wv7OMCGqOuB4hr8Smr6Cp1Z4DUChF5NOwrxqyoiWirJGP8t3KCxwsYIw4OuPUUIOfN9f7FefBeml2DSUc0wCUiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CH3PR11MB7321.namprd11.prod.outlook.com (2603:10b6:610:150::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19; Fri, 31 May
 2024 05:48:43 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%6]) with mapi id 15.20.7633.021; Fri, 31 May 2024
 05:48:42 +0000
Message-ID: <f418d54c-b99e-4cc4-a6a6-02e95435b40a@intel.com>
Date: Fri, 31 May 2024 11:18:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 7/8] drm/i915/display: Compute Adaptive sync SDP params
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <jani.nikula@intel.com>
References: <20240530060408.67027-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240530060408.67027-8-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240530060408.67027-8-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::8) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CH3PR11MB7321:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e249f3e-c98c-462b-f588-08dc8135545a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnd3NUg3RFQraWlhQktxdWFUYURvTTJoNkhEenlpUHY5dW9OaFVUQlNsaStC?=
 =?utf-8?B?U0w2M0FIZ09MaW9paDkzdDBzSmlUOUw1eWdGNk5tYjVha0tLSi9NOXR1cHVV?=
 =?utf-8?B?MEM0RFhTN0p5dkJRd2E0K2ZxTjhnVmFRNzM0QjU0STdMcWVCUWNsYmNUOGF4?=
 =?utf-8?B?MkpROFFmVVNFbzRPNTBJRndwYjlQeHV4VUNUMmtoOHhzVlBRQ0hLR2pWMEFM?=
 =?utf-8?B?OVVzN0UydzRTMFM1UEdCV240bFJ3Q3VqbVVBdE5xa2VnRTYzZWJETjRpdUNw?=
 =?utf-8?B?NHNyT0hQUEJOYXpNWENkQ3pLbnJDU1RrdU5kd0lIenV5TW16RytNT1Bsc2xJ?=
 =?utf-8?B?M01LYWFQc09XeFJFbWlBRUg3YmwwWm00NlYxbXhvTzkzOHRENDAvNXo2Q1Jm?=
 =?utf-8?B?SHlYR1laZ1RMdERzM2o3N1hVN1h4QVZ3S1ArR1BZMk95Y01yNFlhVkYvbWFG?=
 =?utf-8?B?dnFzMitxVEhnbFRRd1c0SjJxK2x1b0NlbElhdDgyTUp2L3NNLzMyTnZiS3V4?=
 =?utf-8?B?c25lSUtSQXFjaEIwbGdkRFhuK043ZFZJSGxIV0drWVZBSE9TR3RlZk9WOXRa?=
 =?utf-8?B?YzJXcVp2UEo0b2VWTzV5SHk5aHROc21ndWJnYnJ2VzN0Q2wxWUpQN2VYTUk1?=
 =?utf-8?B?SGpZdTZnMU9xeDY1Mm9va2tBTUt1YTZyTFZDcWt3V1dMQ2p5enQ5SEFzQ0t5?=
 =?utf-8?B?NG04d2JMRVNQL0tyT3BjcUhrczNFQ3dhSXA0bkpWK3RYa1hUV3E3OHhKbnNw?=
 =?utf-8?B?dnpSN21QdTJYM0RFR0hZbjN0K1Z0cTFGZjdJZTQxQWxPc0NIWndmUHQrcENs?=
 =?utf-8?B?VmxISWFISHBKR1ZpOWxYNnR2TURmZmk5SFdTV01GSjVWdE1qa0F6cFJTY2RC?=
 =?utf-8?B?bVMrM3plZURqVm1wUlpObldORVk2N2pla0VEeWhoTE11UjVJdE5MY3NhT3FQ?=
 =?utf-8?B?MnY0WEo2UTR4STlqQWFnbytWdWxpSmkwNnRzUXFMY01Ta3UwSXF1cU5KTHBN?=
 =?utf-8?B?SSt4dWxpSTVsUzlHM2tSZEU3OEpndFEzN3JTYldmU0pYdjRUYWtka3A1NDZh?=
 =?utf-8?B?Z0pMZnordUcyTEJMckVLY2kxSHZHZXBRM0J1aTVkMUovaFZLakdMU0RKYW92?=
 =?utf-8?B?MG5rcnR4SEVnb1o5WTJ3UHRYSHorVGlnU3dSOGdHSWs1c0NRYlV0Wk5ENFBV?=
 =?utf-8?B?bFVZenBBSkEvT1dCaWZuUW1ZZHg5TTZ4RngwSEx2RVhOT1Y3MGN4QWg0cjJy?=
 =?utf-8?B?ckdHaUZNeDIvbE1tWjJOaS9kYzEzcWF0bnlxY1AwejRXUTloeDRLY3JZUUZ4?=
 =?utf-8?B?emxQVmpQTjBGL0wyQWZMSmN5amJOR3NkT1hPSTBydVZKVzVvQm9PZHBVb1Z0?=
 =?utf-8?B?V2UrclRNZ2VKeU9sTUNjdE9aelBNNDNzbnNPWkRIZWRPdGhSeFdJa0ludElV?=
 =?utf-8?B?YmZ6TURkUjAzYmVYeFZPajZpamdqbXFaT01IRlFQeE91aXJPVldTTzV1ZWNO?=
 =?utf-8?B?VXlMRHNHNzkrOUd5Rm9ZN0tGK2JTS20zaG50SkdZRjF6a2lsNFVOUDlrMGRJ?=
 =?utf-8?B?SEx4d21QM1FBR2VRNWE3TWJPQ0p6WUFkNEpWNCtsYjBBaHpBOEJtaGNKNDZt?=
 =?utf-8?B?TjhDdktzZFN1Zm9tc3hveEUwNS9wdG1uNzJYUUdPY2FPY20wRnptaFcyN1gw?=
 =?utf-8?B?ekMwU0E5RkZhWkFTRDNKK3RucmpSQzd0K0kvNlNvNFBlMEdHa1d1QnJBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVdqVURsbjJ5Ny9KUHFwdWRMKzRxWm56M0JYRk96TmFQRlVPUlRIZ3gxZ0ZC?=
 =?utf-8?B?M0k5bWdiZDJMZHBVeVRDMmlacHZnMUY3R0Q2Tm94bTdsSlB6ZWlrdzhjcjFy?=
 =?utf-8?B?L0wyYkxEUmFXUlN5TGtKV1RUK2tMQ3UyanpkUHVJbXN0WlljSElWVTRBYndP?=
 =?utf-8?B?NWh3OUdYSEtwc1A2aVZKdmpaOWFmczlQalhXeXJhZGZ5RndOVEZmOWxjYW00?=
 =?utf-8?B?VXpWV0cxeTNxNHJSKzE4MUtPYmNndXBsVThFWWdNTVJpRkovbXR1bHV1Z3px?=
 =?utf-8?B?aXNqMmpCVzBNVTErSE8xNzNTeGQ5TXlIU3A5YWlYVHEwS1Y3dzRFbFR4NW1M?=
 =?utf-8?B?YnZVUEM1TFZ6SEdBN3lSK2ZWcUtCVjQvbjhRTzV3cnkxMzZrN3V2L2pFUTNH?=
 =?utf-8?B?K3U2bDdzUUNST0svSjZhYlJTNjUxaFBFZloySnlMcndZdEJzNS9KampSTzMv?=
 =?utf-8?B?Q082T242YUFHOU11NXlVblFacmo1NUhJaHhIdmlXQ240TnpMME82bjRLRVZh?=
 =?utf-8?B?dmNhRFZPeG91akdGQVJhMVdtaklOYW1mSmtEK2UwbDFCQVNqY2djZTIyNVZM?=
 =?utf-8?B?MG9kQ3BXeGZqeEFxRlBLb294THNOK09vbFp2YlkvVVJCNkdIUG8zV1ZzaVE0?=
 =?utf-8?B?KzVYU2lNei9KZnp3VUNSZCs4WlBFS2hSWDh1ZVY3b1JNTmlKcHhudGE2VTJl?=
 =?utf-8?B?MkNOQkJiRUx2bmlMcldWd255anExODlLalBiMDNQdEFlM1RBSjBWOEEwQi8z?=
 =?utf-8?B?UDlOMzhOVVZyWVVRYTRMSFNTMVRhSHhNWXpGWG1KK1ZFdk80NDRGVkdDY2NK?=
 =?utf-8?B?ZVlqYXd5NjQ1MlZXZjEzbk9YWStHbyttNVhna3pNWVNyMzZienB4SEZ1bXU5?=
 =?utf-8?B?ODVKaGtJS3lhMGVXM3ZjRkZ0c2VzKzZEaWg4S2xJNnp0em9SUEsreXNaL1JK?=
 =?utf-8?B?UjQxblE2WklpeUhBczVqN2lFQjNRSU5EOWFqQ25taUZIbGxsSDkzc2VtdzI1?=
 =?utf-8?B?MkZUSzJUT2xQY01Ud1lmZk1PL0VWVFFlUWM2UlFlc2NNcTZvMG9iVEgzQms2?=
 =?utf-8?B?RElGV1cwdGpsejRacnVtYk9wWmZJRDJvd2l0dEZMaGF3TVBpL3lYRjRFZ01X?=
 =?utf-8?B?UGZ1SmxtdWxWaXF0VlAvN1BwdndjazkyY2lQWWg0VHh2UUxMMy9wQzFXejlG?=
 =?utf-8?B?M1FlNGdhcjh1aFh5Mi9tT21RVXdodDBRalVjekdUbjN1SjNVNXBvOGxkdW9Y?=
 =?utf-8?B?V0dTYVR3dDl3Y2wrYWlEL0pFT2lWQW9samxSRjlCTnBoUy9HVnZOT0hvVE5X?=
 =?utf-8?B?cUU4c2xYZzFpUlk0Z3JWa1J1WUd0ekNsY3ZLSUJaVm9FcnRieHhFd3BTNWUr?=
 =?utf-8?B?disvL0dLandBOU9ZeGxxSXB4aE94QVZNZFhaUFNlVHNSZ2JXMlJabWowOTg5?=
 =?utf-8?B?YnRBU2szNjkwVHVVMVhCaTF0NW9RVGkrYmYvbXJ5VnVLdzMwZzMwYVdmcFRI?=
 =?utf-8?B?cjRCNFJKemZaa2s4K3h1aklDS1FRV1AyZnhCVlYxZ3I2RFc4OVZLMEVVTUh0?=
 =?utf-8?B?ZU5KRU5SRm9SdXdSdE96MDQ1amxCUnk1Y3dPWDE1aTBDamFzN0lRZEtBMmtj?=
 =?utf-8?B?NUJFKytPb0hiOU4wYWhvMkY5TkRGdUU4Mm9hanhTNU4rODRabkQxRGV6Tmkr?=
 =?utf-8?B?RHNVWWxaY2ZCSXRpRGxzanVhSzErMVVNMllpb3NEZUR6LzVmUEx4S0IyVmVO?=
 =?utf-8?B?bE5za1NBZjVMeGZzUGRwS2tReXY1a0VXcmptTWV2ank5QnFnZlZKb1V2YWtw?=
 =?utf-8?B?QVRXQ1drWTBPNkFHWmpQQlZRa0tkM0srSnNEcDEzRGdOck1rRFc1VVRYcU9u?=
 =?utf-8?B?UndQdnlMYnNEN3N5bjdqU21wYld1ZHhJRk13d0QxQTc4NENsaHpTeDMvTnJM?=
 =?utf-8?B?Rmhld29VTGpqUFlERlZqYlBMRCtLRjU1RmdkQVg3dmZFTVhqK1hWcVNmZk92?=
 =?utf-8?B?aXg0YzZWT1VuUmJCb1ZUNWYwUGZoQitneUVJelMreFRXM2xZUXQzQUxYZWJv?=
 =?utf-8?B?T2U5VFJrekFpdnNjMU9MV3VZSXJHdHZMcGRnRGRSTldKTnhCZ0hSckoxVTFG?=
 =?utf-8?B?QUpwc2hwTDVZZTArMU9VSUJhQ3NlWU5kT0JPY0tpUG1tZ0VmOFd0UDlaUHRY?=
 =?utf-8?B?MkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e249f3e-c98c-462b-f588-08dc8135545a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 05:48:42.9214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QBCDzqnK4u5DRAVtdNxXpr2bA1hV0qRMa9BHS5qy59CPMymQrqJOgtQ7kpo29un/EqhGMt/vUuEq8otucoCXnCEbbO21Q8ge7nfmLF/DaZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7321
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


On 5/30/2024 11:34 AM, Mitul Golani wrote:
> Compute params for Adaptive Sync SDP when Fixed Average Vtotal
> mode is enabled.
>
> --v2:
> Since vrr.enable is set in case of cmrr also, handle accordingly(Ankit).
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_dp.c | 17 +++++++++++++----
>   1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 95cf586f3bed..7007a509363a 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2627,7 +2627,7 @@ static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
>   	const struct drm_display_mode *adjusted_mode =
>   		&crtc_state->hw.adjusted_mode;
>   
> -	if (!crtc_state->vrr.enable ||
> +	if (!(crtc_state->vrr.enable || crtc_state->cmrr.enable) ||

This is not required, vrr.enable is set even when cmrr.enable is set.


>   	    !intel_dp_as_sdp_supported(intel_dp))
>   		return;
>   
> @@ -2636,11 +2636,20 @@ static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
>   	/* Currently only DP_AS_SDP_AVT_FIXED_VTOTAL mode supported */
>   	as_sdp->sdp_type = DP_SDP_ADAPTIVE_SYNC;
>   	as_sdp->length = 0x9;
> -	as_sdp->mode = DP_AS_SDP_AVT_FIXED_VTOTAL;
> -	as_sdp->vtotal = adjusted_mode->vtotal;
> -	as_sdp->target_rr = 0;
>   	as_sdp->duration_incr_ms = 0;
>   	as_sdp->duration_incr_ms = 0;
> +
> +	if (crtc_state->vrr.enable) {

I think there is a typo here, it should be crtc_state->cmrr.enable


Regards,

Ankit

> +		as_sdp->mode = DP_AS_SDP_FAVT_TRR_REACHED;
> +		as_sdp->vtotal = adjusted_mode->vtotal;
> +		as_sdp->target_rr = DIV_ROUND_UP(adjusted_mode->clock * 1000,
> +						 adjusted_mode->htotal * adjusted_mode->vtotal);
> +		as_sdp->target_rr_divider = true;
> +	} else{
> +		as_sdp->mode = DP_AS_SDP_AVT_FIXED_VTOTAL;
> +		as_sdp->vtotal = adjusted_mode->vtotal;
> +		as_sdp->target_rr = 0;
> +	}
>   }
>   
>   static void intel_dp_compute_vsc_sdp(struct intel_dp *intel_dp,
