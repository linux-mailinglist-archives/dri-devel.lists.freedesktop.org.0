Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA9DCA89D5
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 18:31:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A6B10EB74;
	Fri,  5 Dec 2025 17:31:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iMGFA2/O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FBC210EB70;
 Fri,  5 Dec 2025 17:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764955865; x=1796491865;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vHa5Xbhycs5PC2QeOur/spy6xrAacybwOXSJQ9vw+8U=;
 b=iMGFA2/Oz2SmBSVXnkRm4euclsrNps1/7OhN0+AKbWUCA3bIyHt22alP
 2UaXuBPbOvgHnFVkmE1TpvPpsK8LDz9mp13hQqYTvC1gRj/j8s3HFCD99
 7dO5D3Y99hl7ya7SR7Ll84tTTCd/A7DM/HJBVBoYzlhGCkczW8DHOl8xj
 /5ADj7mVUC3qwDtCtkO08qDTNTkoHYTwNZ0zm5eQQiOJIb2k81iXDmMbH
 X4EehcqwsbnafHPuSSBTUlk04KqcoGQf1uh+MoHBM9vl0EnCEV9MiUNSH
 QK/+g8/69CuwUmkMqhUOLkHAVTvDOnNI/1dj+4aGdu58Sj9+oPC8sVjJB Q==;
X-CSE-ConnectionGUID: 8VlCzGrOSke+7sIxPVBEZA==
X-CSE-MsgGUID: LYd+SeGGQ3ucqNC46uZVcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="70612365"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="70612365"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 09:31:04 -0800
X-CSE-ConnectionGUID: 5x3domFeQsaQUkmvRD+TxA==
X-CSE-MsgGUID: hq2BI2w0SK6yfIsHY5LFug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="194993605"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 09:31:04 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 09:31:03 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 09:31:03 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.0) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 09:31:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wsq4ZridUJZE++lRkKfvUt18oC1NcbIxLQ+NCHL6oupwunKyPfWSMTFWaIrgUbcn2MrrsSm8i6BjTi86IYR4gfXIQQqMeyHzC0i8icC4//BB/kfPo/ki+R4usaxfICerqfeoMcu7Vwiy+ew12iF/BkIxVcxMv3vT0a7gQ5TNZMXChVEcraZowVYVg/UXbhS4AAnDSfY6xmfzYFK7D3R9yEOX1GrirByQFrB4hEDjWUNiW6tU5I5ZRxdnTMOSSwZdhFCYLocdqgPLGTnmHUstXmDxUlpOHI53aD8ELCGjYo73rT4+/addHZkKeQhu/ZYHehOvUCZ9EytpEqRR05rzrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0hZ9ODAoFT3QnKqUJIUJ6jgFej2F5YZKm2p7qecDHO0=;
 b=W8JFXjxnjtGnKqjNgjDLl3Qi1JqrDicGeyRqs2lYXq4+ZhmjrZZXXskxgRIkD+suhKEQyefRPUe4lchA979Ma7JAJxisI4t4Hvc1LIUJh7KPyLtuUffX0pO8uJ3N/pf9jKkFEhFSRWCe8MLFLqcFFJgj2MLFbquo0wTq5//vEi3VXuXxQpbrNESQ2pA0bc12TcAys8Ep1cSDEw61noeihmKnH5Z9dbzS2yTwxAks8CFkf+/qKZA2JQs3B7JAZBlypRACSGo+yEN5+Cwi4NMUQFlU0yqpQZpSC8dnmdQPblj99cr8lYsAAJMZVlOfVvQublH9hmc/c1RiLJBBt/CLmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA4PR11MB9372.namprd11.prod.outlook.com (2603:10b6:208:568::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Fri, 5 Dec
 2025 17:31:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 17:31:01 +0000
Date: Fri, 5 Dec 2025 09:30:57 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: <phasta@kernel.org>, <vitaly.prosyak@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Alex
 Deucher" <alexander.deucher@amd.com>, <dakr@kernel.org>, Boris Brezillon
 <boris.brezillon@collabora.com>, Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] drm/sched: run free_job work on timeout workqueue
Message-ID: <aTMW0UCGQuE+MXLk@lstrano-desk.jf.intel.com>
References: <20251128182235.47912-1-vitaly.prosyak@amd.com>
 <cdecd1e2-de0d-466f-b98b-927b2f364f79@amd.com>
 <c56ecd19d7ddc1f1ed4e7e9e13388c647de855b1.camel@mailbox.org>
 <49de5988-ea47-4d36-ba25-8773b9e364e2@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49de5988-ea47-4d36-ba25-8773b9e364e2@amd.com>
X-ClientProxiedBy: MW4PR04CA0371.namprd04.prod.outlook.com
 (2603:10b6:303:81::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA4PR11MB9372:EE_
X-MS-Office365-Filtering-Correlation-Id: e5080b43-7c3f-4b2e-577a-08de34240eff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGYrbTJMNVYxRUpIbTE2Rzh5SDRkbXB3TW83dnp5VnVpWUd6a2hQRmRrdG10?=
 =?utf-8?B?V0hXeURqeFFsdDdyRE1EUmNOSnBVUks2dkIyQzRXVkdRV2lSZDFacTI1bG9D?=
 =?utf-8?B?QytyYzdobDFGb2JaaldnZ0NLUWpWUThlVFM2eFBVR2g0YlcwYUJaeXQvYU5D?=
 =?utf-8?B?UE8xZDczeCtKb0dwL3ZEQ0JOSVNZUTNzUERvZUpmUHhmQ1BjWURPVkdJU0xx?=
 =?utf-8?B?RWtWcVhxYUtUZ1hvbSs0dGFLcng0QW45elJ4clBoSVpNSkhNd1IrcTZUdXlw?=
 =?utf-8?B?MU56RnBzZUVRWENVWllUTkRZTVZXZktNb1dPREkxbmZNazNUamhuTWMxOHQ2?=
 =?utf-8?B?NktoS0t2dEp4U1M2S21RL2FodDJPNkRmM1V3dUM3MHNaaWNxQ1RQZm9LeHZw?=
 =?utf-8?B?U25mUlQ5QU1tN3doQ3NMWmtZeFJXL3dqTlBYZ1JvRVI3WTIwWHg5M0hPTURR?=
 =?utf-8?B?cnZLZTZjR3lkMFJ3K0JxV0ZXai9ORmowVW84WTVpQm81bk1XbWpaV2RCd0hC?=
 =?utf-8?B?cmFWeXpEcWZuaEhuVW9GQkRtaUJyMjlGRS9ZcXB3SnNQMTdqMVpuSURZZmxR?=
 =?utf-8?B?eW53YXg3VTNCbFJnN1VLbVpoUll2NG5NU1B2Vm5KVHFXMkFOL3Vtb3V6bUVW?=
 =?utf-8?B?SHVyQlhqQkNCNm5MVGpPbWNjL3RzM2MrN2Q3UHFvbHZxcFNxMDlsb0RwazM2?=
 =?utf-8?B?ajM2ZjdrSmR1RDVtcUJVRXhBL2lzUFhkTlQxM21kZ3FoZ0N4cExXV0FKenJE?=
 =?utf-8?B?T2lGZWlQbmkvYkdzUlBlZWhoRFMrM1FJNjBqSU01SXR6T1hsZHh6WloxN1FY?=
 =?utf-8?B?ZUE5RjNSYmNYUVp4cEk4U1NNMXVvcGhkUmhDSnlWZzcrZEwyL0JmUk54OXN2?=
 =?utf-8?B?NUgrZXhFL21rbTNuOG5yWWI5S3NFemN1S01GVnJDV2dhdlJFQ2tiekNQYkty?=
 =?utf-8?B?L2FxVWtFMEFlSkVBY1oybEVhV1p0MnVqYUZzeGtVYndrSUZqMytLY3YyRXpJ?=
 =?utf-8?B?cElqcUtKeW9pRExVRXBOWktJbkFWYTFYTWhNaEVLaGh1VUVjdEdWOFRHdXJI?=
 =?utf-8?B?b1VqUWhMRmc0SUVHVndqNUdHcUFuNWRabEYrRmovNmdNVzl1b3ZvSm9rMm5Y?=
 =?utf-8?B?Z2R5elR1d2t5dTN1OWNmZWJVZ00zSGJHd2w2b2tvM3J6RnlvZUpSekRUdWVa?=
 =?utf-8?B?bUhVdEtZdTdiRklvWTFJZVJyTmtRbjlMK2ZPMUxLWE12azdRdWhIVWdySHNC?=
 =?utf-8?B?bzhTMUd3MEV3QzVXK2dVcUFNNkJGSk1SSVppWlY4ZkNQM2Z6NDBRTnNJMmVn?=
 =?utf-8?B?OVZSL2gzaXlRWnQ5MzJ1WXNmaU1NR0RRNUZVbmNYTGpJMXV2cERYbzNIQ1hS?=
 =?utf-8?B?bjBOK2NjUWhUTEJWcWZnZ0tac1djTm5NK1h3dkcyRkoreXdwbWI0MVpUREtE?=
 =?utf-8?B?cjFQQ1ZOWW50NVVSV2M0d3JDUHpCNmNtY1llVzFTVmlydjJmK0cyUU1nM3hz?=
 =?utf-8?B?Y1lPclh6MlJ5SENKOFJiMFlsMExvMVJjNkhXaVNJb3RBQ1hlN1o3QmFkc0Fi?=
 =?utf-8?B?NFgxbWpQYWxLaHlkTnE5VjhhMWRuSEs1N29qdjZiNlo1Sm50Vml4aU1ibk5W?=
 =?utf-8?B?VDAvTlE1WXRNKzR6QnhreFJvV2l5VUFwVEo5ZEh0emoyNjQvZjlYS1Nlb0JZ?=
 =?utf-8?B?bEpBRjNOajVKZEh0LzdJQVBndlRJSXhuY3gxWDJwSzc1c2wwRDdDVkpHNktm?=
 =?utf-8?B?dldqNlNXaDNXSkxxWElNSnhuSUlRNktzREswTi83SmMzVlJRdFYybWt6NHBQ?=
 =?utf-8?B?WVFudlhPSjFoRWRFWk5MWHBJcmlldVVwQVRMSzZSeGYzZjBsWEE4Y1ZobGM5?=
 =?utf-8?B?NU1mUlk3RTlBVCttLzIzaHVHQ3lqMEFvVUpLQXJDSUlld0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0RaRnBSQlByNGNZZUQ4cGI4SEdpRGNWY3F5Z2VEWHBQVkowQ2Y3MUNPOHpC?=
 =?utf-8?B?eVYvRklsWm94TmcxTUlGSS9UV3ZqM1BYK2VkSnVicUx0U0Vla2dQeXlHV3c5?=
 =?utf-8?B?UStQK1dJZ3ZRVUQ5N2l5c1pDSFRyNFRKNlhKMnIwWXpab09Iam4rUC9XaUx3?=
 =?utf-8?B?RWNxL2hNeVY5bElUWStYSVZPVkl3bnhESDdlcTV6aU45Ulp6a21yR2pGMFhW?=
 =?utf-8?B?OGdUK3NMQ250OGJaT2VjU0pJb2ppWmllbVhBWjJZWENiT21odWJDbmZiZHFz?=
 =?utf-8?B?VEdzNXdCTUF0ejJzc3JqblBETGxxNll3YTk1cHRrWWJCUWhEeVpvdDdCbnZG?=
 =?utf-8?B?NndZbTlka3lzUkdBUUNmV0ZpVFpOeU9pWi95UWFWTkc3OXFFWm9HWmExMll4?=
 =?utf-8?B?bStXby9Md25iQTV6cWVyam9XbHFwR0hsdzUyK1Buem1GdG9XeEhTSkZYaEU1?=
 =?utf-8?B?WFlBOXlPNjh4czhQWms2QWUzNHB1NmhBb1JMYVp0WUxyMmI0Z3VwQVpmYVgv?=
 =?utf-8?B?TktrMXVWUXQzcDl5bjZ4V25EMWxEUDJMcnpoM0pOR2lFWmlnRjdmKy9ybTlj?=
 =?utf-8?B?ZnB6UXpFYitUczlsaXB1cmI5bmFJK0RmS1Z1OFp3clNBYnQrVTNmWlA2VW1B?=
 =?utf-8?B?NTBGOUdMNzhHd2ZKM09adXQzQURrdzhmWTI0NDZ0SE9rNjBzWlFheFlrMXBT?=
 =?utf-8?B?QlRuazg3cmc4Wk01Q0hXNEc3SmVQcXpOdVl6Szk5L1RZZzZaZEwwTGpzMjRI?=
 =?utf-8?B?RWltTnBzQUcwekc3RlMvbzgvRFlnOWdBZ1A4YVdjS0ZKSS9kMnJ5Y1VSY09L?=
 =?utf-8?B?YnZxWnBaVEhSYXNMNkFiemVkL1VKZnBpRkRSYXNjdnBUeG1zWlI1Y0NQL2Ez?=
 =?utf-8?B?QXNrRGxZTy9CRXI5VldzWWI0ajRCNnFJUzJ4ZllRNDR3YUd4TzNwblhmNitt?=
 =?utf-8?B?bVVqTkcvZTF6MGxaT2tXSXRqTkYrdlNEQ0JqZk5vUlU4aFN0NXd4UW1kOWtK?=
 =?utf-8?B?bGY2VkhNekEvdVpGUGZvQU5EeEZnTUh2aElFSGlJK05Td3E0RWZTK04xaFIr?=
 =?utf-8?B?TWw5VU9YMUJGeFdzZjZwNzFvellENVRuTFZHKzBDUU42MmJRWmZTSll6aHB5?=
 =?utf-8?B?TlUwS0lDWXNGQVVXV3FPTWpTZkszZm5iMjRLSnQwU1FKRmVmOGpxTTVrTzFo?=
 =?utf-8?B?d2lTNERFd1lEZllaTE5Yck01Nkc0djVobmFwakVCMDlkUWZ5eHlKakJ6eGo4?=
 =?utf-8?B?WGE5YjNRblFvUDltRHZwOFJuNTN2WVNsWG5CSjNXVVJRbng3WGtZdzhLLzR4?=
 =?utf-8?B?RmxjYlMyY2FVSENzc0lycEpXaGVPTFNVdUpZWE5LVW5TeTY4N1pKM1JvWXZY?=
 =?utf-8?B?RXN1OUxTU3dmcU43UHU3OERGVmpJcS9uUkoxM2RhMWlKOEU2WDhWd2FPVFg3?=
 =?utf-8?B?aldlVmhqYWV0KzRBYlE5WVZLMUY2YjNsVldiM0ZoYVYzUUE4Yjd5TlJOek5T?=
 =?utf-8?B?YWxCKzhoWHdyOGlGVmdVUDNTU0ZzU1VnenJNanczQ01RQUlEa3hFU0g3R1Fi?=
 =?utf-8?B?QUJicmtTcHFwV0xZTHo4L2haNUR4NnUxQXgyRWQ5b2RQWFBYQUIxR2Vod09H?=
 =?utf-8?B?WSt3cTczVlBxcVFnbnpGT3dtVkk2NlZMa3VlUlVRSXJTOWF2QzRQVlQyYU1y?=
 =?utf-8?B?ZHhvUXd1OXpZbWdkMEphUkVyR3N0S3JKaC94RE5YckpPUklqeGJuMXI5YmRI?=
 =?utf-8?B?TGxpcnN0MlNScHdBMVVzWnN5VnZ2RHZ0SXNKSjlBWk1HZk5WbDhXRmZFd1lh?=
 =?utf-8?B?VmQ3Q2pqZlZaendNMUQvUndKblhXck1YVXdpaGN6MnJZTEoxTjRtaGRqWVpu?=
 =?utf-8?B?am1INWxiMWpBSS93WUtGZGdPRzl2VkJLVEZXRUhyZy9kcTdtY1hLZk5rRXNZ?=
 =?utf-8?B?VzN4Z3IzK3ora2NQUXFYbE9FV0JvVVJaTENYRllZaE9HVUgyNXg3NHlFTEw5?=
 =?utf-8?B?ZVRxdGdkREtYS0ttYUM2QWFlalc1Z3ArcVdmTit4MTdZV2dBNFA0OTUyelJk?=
 =?utf-8?B?MHVCeDZVT3JXU2Z4TElBWGRHaGJxZXNwQjVyM3lpcnNNOUZrQmczS1NoM0dx?=
 =?utf-8?B?RElCZ2cyNjIvNmdnWlRqS2pSbGd6eUx2Q0lDbUwxeHZtVldEQllRVkpyakpl?=
 =?utf-8?B?Y0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5080b43-7c3f-4b2e-577a-08de34240eff
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 17:31:00.9986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GrlpqJr0aedmjA/UyjpO+89tZsjrSTjFyIbfqyCU8LVwW1Pq0vfwMWq4+Nupx5bBr7xky1A+xFvrqOkB19T9ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9372
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

On Fri, Dec 05, 2025 at 11:18:21AM +0100, Christian König wrote:
> On 12/1/25 10:04, Philipp Stanner wrote:
> > +Cc Matthew, Danilo, who are also drm/sched maintainers
> > 
> > The get_maintainer script provides you with a list of maintainers.
> > 
> > On Mon, 2025-12-01 at 09:38 +0100, Christian König wrote:
> >> On 11/28/25 19:22, vitaly.prosyak@amd.com wrote:
> >>> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> >>>
> >>> Currently drm_sched runs run_job and free_job on the per-scheduler
> >>> ordered submit workqueue, while timeouts (drm_sched_job_timedout())
> >>> run on sched->timeout_wq (e.g. amdgpu reset_domain->wq).
> >>>
> >>> For drivers like amdgpu the reset path entered from timeout_wq may
> >>> still access the guilty job while free_job, running on submit_wq,
> >>> frees it. This allows a use-after-free when recovery continues to
> >>> touch job fields after drm_sched_free_job_work() has called
> >>> ops->free_job().
> >>>
> >>> Queue work_free_job on sched->timeout_wq instead of submit_wq, both
> >>> from __drm_sched_run_free_queue() and drm_sched_wqueue_start(), so		
> >>> timeout/reset and free_job are always serialized on the same
> >>> workqueue.
> >>>
> >>> Behavior changes:
> >>>
> >>> - work_run_job stays on sched->submit_wq (ordered).
> >>> - work_free_job moves to sched->timeout_wq (timeout/reset queue).
> >>> - Submission and freeing may now run in parallel on different
> >>>   workqueues, but all shared state is already protected by
> >>>   job_list_lock and atomics.
> >>>
> >>> Pros:
> >>> - Eliminates reset vs free_job race (no freeing while reset still
> >>>   uses the job).
> > 
> > It eliminates such a race *in amdgpu*. Other drivers might not have
> > that problem. I think Intel/Xe is refcounting jobs? Matthew?
> > 

We schedule device resets on the same work queue as the job timeout
queue, as well as operations like VF migrations, since conceptually they
are quite similar to device resets. In both cases, we have the
capability to stop all schedulers on the device and prevent any future
schedules from being created while these processes are ongoing.

Putting it all together: when either of these device-wide operations is
running, we know that no job timeouts will occur and no scheduler
operations (e.g., run_job, free_job, etc.) will race. I suggest that all
other drivers requiring device-wide operations follow this approach, as
it seems to work quite well. In other words, even if free_job is moved
to the timeout work queue, I’m fairly certain you would still schedule
device-wide operations on the timeout work queue and still stop all
schedulers before any device operation touches scheduler or queue state.

Therefore, I don’t believe Xe actually has a problem here.

> >>> - Matches the logical model: timeout selects guilty job and recovery,
> >>>   including freeing, is handled on one queue.
> >>>
> >>> Cons / considerations:
> >>> - For users that don’t provide timeout_wq, free_job moves from the
> >>>   per-sched ordered queue to system_wq, which slightly changes

s/system_wq/system_percpu_wq

Ok, the system_percpu_wq doesn't actually for timeout_wq as that work
queue is reclaim unsafe. We probably should just remove that fallback in
the scheduler.

> >>>   scheduling behaviour but keeps correctness.
> >>
> >> We should probably avoid that and use a single ordered wq for submit, timeout, free when the driver doesn't provide one.

Ah, yes agree. I typed the same thing above before reading this.

> > 
> > AFAICS this fix doesn't fix anything for certain at all, because you
> > just don't know what kind of workqueue the other drivers have passed
> > for timeout_wq.
> > 
> >>
> >> We should potentially also add a warning/error when the driver supplied wq isn't ordered.
> >>
> >> Apart from that the change looks sane to me and avoid all the hacky workarounds around job lifetime.

A step further: the work queue also needs to be reclaim-safe. I started
a series [1] to enforce this policy but inevitably got distracted by
other priorities. Eventually, I’ll revive it—or if someone else wants to
take it on, feel free.

[1] https://patchwork.freedesktop.org/series/156284/

> > 
> > I'm not convinced that this is the right path forward.
> > 
> > The fundamental issue here is the gross design problem within drm/sched
> > that drivers *create* jobs, but the scheduler *frees* them at an
> > unpredictable point in time.
> 
> Yeah, can't agree more!
> 

The scheduler doesn’t free jobs; it simply drops a reference count.
free_job should be renamed, in my opinion, to reflect this. Once that
misnomer is fixed, the design actually makes sense. The scheduler holds
a reference to the job until its fence signals and until it is removed
from internal tracking. Transferring ownership via reference counting is
actually quite common and well understood. The scheduler takes ownership
of a ref when the job is pushed to the scheduler.

> > This entire fix idea seems to circle around the concept of relying yet
> > again on the scheduler's internal behavior (i.e., when it schedules the
> > call to free_job()).
> > 
> > I think we discussed that at XDC, but how I see it if drivers have
> > strange job life time requirements where a job shall outlive
> > drm_sched's free_job() call, they must solve that with a proper
> > synchronization mechanism.
> 
> Well that is not correct as far as I can see.
> 
> The problem here is rather that the scheduler gives the job as parameter to the timedout_job() callback, but doesn't guarantee that ->free_job() callback isn't called while timedout_job() runs.
>
> This should be prevented by removing the job in question from the pending list (see drm_sched_job_timedout), but for some reason that doesn't seem to work correctly.
> 

Are you sure this is happening? It doesn’t seem possible, nor have I
observed it.

What actually looks like a problem is that in drm_sched_job_timedout,
free_job can be called. Look at [2]—if you’re using free_guilty (Xe
isn’t, but [2] was Xe trying to do the same thing), this is actually
unsafe. The free_guilty code should likely be removed as that definitely
can explode under the right conditions.

[2] git format-patch -1 ea2f6a77d0c40

> > The first question would be: what does amdgpu need the job for after
> > free_job() ran? What do you even need a job for still after there was a
> > timeout?
> 
> No, we just need the job structure alive as long as the timedout_job() callback is running.
>

Yes, I agree.

> > And if you really still need its contents, can't you memcpy() the job
> > or something?
> > 
> > Assuming that it really needs it and that that cannot easily be solved,
> > I suppose the obvious answer for differing memory life times is
> > refcounting. So amdgpu could just let drm_sched drop its reference in
> > free_job(), and from then onward it's amdgpu's problem.
> > 
> > I hope Matthew can educate us on how Xe does it.
> 
> We discussed this on XDC and it was Matthew who brought up that this can be solved by running timeout and free worker on the same single threaded wq.
> 

No, see my explainations above. This is not my suggestion.

> > 
> > AFAIK Nouveau doesn't have that problem, because on timeout we just
> > terminate the channel.
> > 
> > Would also be interesting to hear whether other driver folks have the
> > problem of free_job() being racy.
> 
> I think that this is still a general problem with the drm scheduler and not driver specific at all.
> 

Maybe the free_guilty is likely a scheduler problem but I'm not seeing
an issue aside from that.

Matt

> Regards,
> Christian.
> 
> > 
> > +Cc Boris, Lucas.
> > 
> > 
> > P.
> > 
> > 
> >>
> >> But removing those workarounds is should probably be a second step.
> >>
> >> Regards,
> >> Christian.
> >>
> >>>
> >>> Cc: Philipp Stanner <phasta@mailbox.org>
> >>> Cc: Alex Deucher <alexander.deucher@amd.com>
> >>> Cc: Christian König <christian.koenig@amd.com>
> >>> Suggested-by: Mathew from Intel during XDC
> >>> Suggested-by: Christian König <christian.koenig@amd.com>
> >>> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> >>> ---
> >>>  drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
> >>>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> >>> index 81ad40d9582b..1243200d475e 100644
> >>> --- a/drivers/gpu/drm/scheduler/sched_main.c
> >>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> >>> @@ -355,7 +355,7 @@ static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
> >>>  static void __drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
> >>>  {
> >>>  	if (!READ_ONCE(sched->pause_submit))
> >>> -		queue_work(sched->submit_wq, &sched->work_free_job);
> >>> +		queue_work(sched->timeout_wq, &sched->work_free_job);
> >>>  }
> >>>  
> >>>  /**
> >>> @@ -1493,6 +1493,6 @@ void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched)
> >>>  {
> >>>  	WRITE_ONCE(sched->pause_submit, false);
> >>>  	queue_work(sched->submit_wq, &sched->work_run_job);
> >>> -	queue_work(sched->submit_wq, &sched->work_free_job);
> >>> +	queue_work(sched->timeout_wq, &sched->work_free_job);
> >>>  }
> >>>  EXPORT_SYMBOL(drm_sched_wqueue_start);
> >>
> > 
> 
