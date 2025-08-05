Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B85D5B1B882
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 18:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF48510E6D4;
	Tue,  5 Aug 2025 16:28:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vZRLu1hG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E3E310E6DC;
 Tue,  5 Aug 2025 16:28:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i35/oC+Xc937Ev9FQoPkQePkDunoynT7oQUANm7kvNDMZu/QI42cgkEhXNu2P5qLII5gfaZB67fgFHw1czQsJ664wP8euioYZcSK/DHCGSN2pc03EGe9Q8xmcbDFm5RhAcRTPGl87uNHtvR3dxX91VONMLQ/ATJ4sbawPRmfU2uRQiQLg2T/PDZy0wh4UNO9JoYe+9XBxMl3XxeSZYeWCj24fwdoN8qwb4P7Zrdy8SZpQy/kZauo6tK/Lsbrk8PwHBiZ7jB92LenInvMxU0YKMkKoKlfO/a8owM7tJGBLM0Qu3OWlb6ewsS9QxCETgGuuihgf2aV6BxNTHmaOzASmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3Mz17x4EeyjmPFCwt9Fjyy0m6NrqfX5VrYdVY8MCYM=;
 b=uh8daKAfs2cv0MUT4WSTkwDNmiT1rUkv9GIC8m9x8cjP2uYQPiwo+Y9NGJFBV7GGp4hZUIb1jr/PuhdEHo4j9KSQ7DAThXYoL0m7Z87pufiipn/VVoInxnCI74FIpQZMDwodyYRKoLNDQffRVKkE4ZDmmvi3ObepL1iC7d3eZFTs9flOuyfLDSCoMVuKBkasmVxYbdrbs48MmLB0VmoKZvVuY+S4qflGexEWv4iaq7uoMOhIryNb2W1UkO1jl3y6qFlYYjKb/aBPHQ1E0uzA5hMFdipoUsV43NIYltQ5p0wKGaiV7bSeX1mh+g53YOBxiOnRbKN9hf3UP2dCQyTNVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3Mz17x4EeyjmPFCwt9Fjyy0m6NrqfX5VrYdVY8MCYM=;
 b=vZRLu1hGQcREkUH4fxaud7cNsJWmPTWKQFQbSQl+2fNYpQbNTxOp5MyLVU3Q+/FOc4qp1Hk3vaMSQCOR6DMMmZFWHtrLYTD6itTwngqPYO2l5xY1Jo7iPzQr2JumT3g+iXzZSN2FkSRvADFWrgffcadxuOsK8syi5GBSspvoM6s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com (2603:10b6:a03:3ba::23)
 by CYXPR12MB9443.namprd12.prod.outlook.com (2603:10b6:930:db::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Tue, 5 Aug
 2025 16:28:47 +0000
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::65b2:12d5:96ba:dd44]) by SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::65b2:12d5:96ba:dd44%4]) with mapi id 15.20.8989.015; Tue, 5 Aug 2025
 16:28:47 +0000
Message-ID: <0eaf1411-f438-4b1a-8c75-7b03ee23a85e@amd.com>
Date: Tue, 5 Aug 2025 12:28:44 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/amd/display: Update HW_DONE_DEADLINE property
 value on modeset
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Leo Li <sunpeng.li@amd.com>, Alex Hung <alex.hung@amd.com>,
 Uma Shankar <uma.shankar@intel.com>, Xaver Hugl <xaver.hugl@kde.org>,
 victoria@system76.com, David Turner <david.turner@raspberrypi.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250724165220.1189129-1-michel@daenzer.net>
 <20250724165220.1189129-5-michel@daenzer.net>
 <84a221e1-5675-4aca-a068-6f9408b96e40@amd.com>
 <f6c82f73-cf3c-48b1-95e4-650297306636@daenzer.net>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <f6c82f73-cf3c-48b1-95e4-650297306636@daenzer.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0415.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10b::25) To SJ0PR12MB5438.namprd12.prod.outlook.com
 (2603:10b6:a03:3ba::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5438:EE_|CYXPR12MB9443:EE_
X-MS-Office365-Filtering-Correlation-Id: a509186a-cce7-4af2-6c53-08ddd43d2751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODZtT0ZYVU9KMHNYTm5lUEVqYVMxWHdZdlMwcmYwNjVtT2lVZ2Zpb21oZjlT?=
 =?utf-8?B?WFZuSi9sKzlxZmpRcmV1Q3hnQTFIK3FPUWtnMEl4cDZIZ0lXOWMyUkpqZHBo?=
 =?utf-8?B?RWlBcDhxVTBOd3JtY3VLaUVEUnNNN1lIS1Jlb1FHTndDZHpxLzZVMlhPcUho?=
 =?utf-8?B?eFBoZEovRldYLzRkcm9jU2hDZnNuNEd1SXpiTkZtRGl0WU5wbTJ6enJiaEtH?=
 =?utf-8?B?NHJnbGFVbWxlQ0hDc0NybVhaZVBYejExemhkdVlrZEZPNlBPblNqQnNRVUlk?=
 =?utf-8?B?MEJJMVc4RzFXRnVOYVRRYU15THhUYXZCM2dEVTJKMW9CbzcyT3dLdm51Qlpm?=
 =?utf-8?B?N1paLzQ0QkJCaVNHZWR2YnIxYlpZTmtjMGpPbkdyS0gxb2dPSGl1L2U4QmlE?=
 =?utf-8?B?MWJYTEduNTgzakhrRFk4TlBHRVJIcVdGL3hHQWxSRmVWa0F2Zk15amlvaHY5?=
 =?utf-8?B?dXNUZVV3UStvSzl0eTZKVFR4LzdLUFl0bWNyQ2lFSEYyOFRxdkVBZ1JHNkdH?=
 =?utf-8?B?aGlndFRHSk1scXF6dHNITGVNRDZYblJwejE5ZHUrMUFwZldMSVZ5NmpBekZl?=
 =?utf-8?B?N3JycTl3Y3ZNTGZzb0tkZnJrY0J6M1l3eHdOdUh5cmI3TVRVeUQ1TElKVTFa?=
 =?utf-8?B?K1c3cG1UZEhBeEg1NnFNRjY4VHFwNnlTd3FyaFFFUHk1dDNCcG9Qemxab3kr?=
 =?utf-8?B?bVVKKzBiKzdqMFpTLzM3ZlBsOGNmWndDem14SWI0a3EvbHBSWW14bEdBekN5?=
 =?utf-8?B?YVc2bFV1RjlIa01rK2pQRFJMT2RlKzFQVm1SN3ltM0JoMitBM1dHVHZwaTZ1?=
 =?utf-8?B?L2t0eHR6M21pVlhzVWgzTjVqeXlTMGhKQnppZlFQd3hnSlREMm1nelFhNENW?=
 =?utf-8?B?cEhKd3Jua1NXejlsZGdndThQNmMwcStDK3ZaQkNFL0xFRGdYNzVLUFd4QURL?=
 =?utf-8?B?cUtBNmxDRlMrZ3FYYS9LMUZ6cnF5NDRCWnlLaWdvaExWNTlEYTYvdHU5cDlm?=
 =?utf-8?B?OXZKa2hJOVRjc3ZoY3h0TGwrU2NndWZTSzVwb1A1QmtmVE9PZndtS1VKSlhW?=
 =?utf-8?B?TlRHTzNINXFndStEWEJXeWpybk1yVW5uMTNTWElobzhTMVV1aTlacFkzZ0pr?=
 =?utf-8?B?S0ZNNzRtVk9lcFFFczJSM1V0VDZNV3lRN21IWDRiRTNtSTAwazYzWnlZSHRs?=
 =?utf-8?B?cXZDYTFTMlBFWDUzcmlZR1NiQktqKzVqOHJaUlRna0JtdFdwby84RnFzQk15?=
 =?utf-8?B?dThVNEFzYWc3eWpycTgwdlQ2LzU1ekhMSHhTQ3pDczJZSGVQK3JucFc1SDly?=
 =?utf-8?B?T3U2MU9NZjZCTStpaDZjYmlCSkhWckp5amNSNUdKTUJxYUZqWVd5NkczOXZm?=
 =?utf-8?B?d1VNNCtHSktQdkozNjc4V29kWXNzUlB5TmJPYUxzbnRiSUIvdnQ4SXd3TSsy?=
 =?utf-8?B?R3VKVGhyNm4yb3FxRDc2OU84MmFaYjdZZERXQm9YV1NHeUxNNVhOUW8xSFhz?=
 =?utf-8?B?OHhNTUlJZnAzNC9IUzdwWHB2bkdCeGNsdnVnOFV4NDk5Z3k0MFhXWWc3ZmRB?=
 =?utf-8?B?aFpzSXhRSWRRWDRZYzZrUnB0QWNqUjVUdWE3ZS9TQk5qUGFNcVZOUGtZcm9z?=
 =?utf-8?B?R3hvem9VVWkycHZaTnRuUUR1SjYxdUx4bGFwOXEycU1pMXk4SjRUcUxONGNV?=
 =?utf-8?B?NWJHeUI4MVN3VHVzNklLSnRVVW5IdzFacG52VjkzeEFlQ2tvanlXQlpGQ095?=
 =?utf-8?B?REQrVVN6T044cHdGZFcwa2JvV2FVbU9wQ1ZBODdpQ2p4b1RPLzlwRFQ2MmpS?=
 =?utf-8?B?aXFoZm1kRFBETkxhS1pFSXZKVjZ4SC9yNHZiM0w2QXZUSyt0cjRUVS9ndEFn?=
 =?utf-8?B?eGdnN3BaSGRlOU1oU09ob2dIdXlFdHppQkMzcWtiKzh5MmtXb1NQQmhENU5O?=
 =?utf-8?Q?9kdgE64N5dg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5438.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHZsVWIvc1E5cEVVelJ5djYzOGVQbVQvbEtGWEQzN2p6TlBJYkV4ajMyY1hz?=
 =?utf-8?B?aHkybloxK3ViYVRpWllPd2cwd0hXUTNTbGJYVWI0MmN4YUw5OVdKT0tKQTh3?=
 =?utf-8?B?TmhyNHpPN3FhNzFhVmdLcGI5VWsvcWxTUFJJN3dEcDUrMkRMOXJpd3E5Nk5R?=
 =?utf-8?B?cHFKQ2M2dmVsK3ZqZ2dGUlkyZU5pUDBQWFV1S1NraDFUTWNkOUNmMWhVS1hP?=
 =?utf-8?B?VCtlSjdJVWdUdndmbnRmY3JqTnptYVRCbXBHUmcyMS9pSlpUV2N5SmZvWkJK?=
 =?utf-8?B?Ujg4REJzNzRqUjBld2M3clFsUkRLcUZFZElCb3gzN3FJMG9RMk9JaG0vZG50?=
 =?utf-8?B?bUY1SWNiYmdZTFJremF3T1ExdVFiWjd0cUtoWFBNV0VBak96VnFTRzROSGZt?=
 =?utf-8?B?T3Q2OWRQbTAzc21aMENaSG9oUlprSGl2c3ZtN08wTmhUN1pIYjFrV21Fd05N?=
 =?utf-8?B?ZmpZcW44ZlAvTlJIQ20vWVg4QlFneDFvbStOeDVXbk9YamdibkxzSFlYWm9L?=
 =?utf-8?B?dkk0azh1cVgvUmlBelh6V21EU1RKSTNEL2ZCajlZYndxdm1wUE5yUTZDR1px?=
 =?utf-8?B?MGhDcTFBc1dmazg3cFlJdTB1d1ZVUDQ4S0NZRWZBZ0I0R3hxWUcyTTczdmJ2?=
 =?utf-8?B?RUpPaHBXM25Ga2VONWFBcnpOSWplU1YwcGQ1dGxhZ3RpOU0weVhaMERVS0NF?=
 =?utf-8?B?L0dRU3dRRERIYkNtTm91VUdpK3FNY05OU2hjZEJOdXlKNnlkdXlscUhDdGlp?=
 =?utf-8?B?NHI3aFcxbkUxWkpkVVFjMDdxM0VoY1h2M1ltZU8zVyt6RWsxd0xMZUpzaGNU?=
 =?utf-8?B?Uml3ZUh4Uk9INytxRUEyQUp4QUhuWGsrSzVyOVVoRlJIaFFkaTJwbXhyeXRa?=
 =?utf-8?B?VXV3YzZMYWZocU12L3lPaFRncy8vVGdqWWcvb3ZOaytHZHRTWTRueW1EYkFC?=
 =?utf-8?B?UHpjWWp4aGdTWEp4c0dwN2owekU4YmtQd0RCb3B5dllMaktZaExzZVUvbmRG?=
 =?utf-8?B?Y3F0Mnk1d293MEdtVThxZDNxT0ozZm5NOFdXSU1tV0MrUlF4ZTE5Z2JNRE55?=
 =?utf-8?B?cnpTUjBVWTBqMkpiL21nSTNHUHdNOE5OZmJiV0Z0cG9kcG1pK0RaOUxHb2Q0?=
 =?utf-8?B?NlIvV054dGFxdW9zcWJBL0N1NVdMUXdVQmd2UDR0bElZNlFmT0cybzlZVlRU?=
 =?utf-8?B?UGhIb1pxdmUrSXE2Mkt3QzROb2V5NEhqS1lZZHQranJxVXRtQksyVWtxQkxq?=
 =?utf-8?B?QkorVUxwM1Q5aHZabWc3WStLUHJFak5nZkRoYTJ1eXhQTUxOSHpDMTA5TzlL?=
 =?utf-8?B?T1JlbXNTZzlQRFRzdFFQY25Fcmptc2ZxOU9aTTIveStiOTZIWWFZZHlFMnAz?=
 =?utf-8?B?U3AxUXEvc0tFQlhITE9DYWdMalUvL2hMaXZ3bU5SR2ZSUUlLcXMyL1h3Y1pZ?=
 =?utf-8?B?d3k0dlZnNUd3UHlxSCtaOXpZbFNyQzRuQmlneEgrOXRQUVVGak9nZzgrWUhT?=
 =?utf-8?B?a0ZUSGx2NlFuYmcwRXZzZEdnQ1FCaDB2Nm9uZ3VsMDFwZTZXWVI0U3NiRHht?=
 =?utf-8?B?ZWk1dUovSWt5TUl2VDRDMzlvcEx5enVJZDJLUHNDTkdaMUFqaTNidXJpbzdL?=
 =?utf-8?B?U0NTVTlhVi95UlQ1TXlkaFB2WXN2NXUxYk4wSkw1MEtKQ1RPRjFUNmhnTS9R?=
 =?utf-8?B?eXpzcGwyNHM5bVdGcDlkdTFoOU5HbmwwcnZ0eE55bjdZMnFtSS96OUI1NnZx?=
 =?utf-8?B?eHMvV3hYakxuTTMwRlZ4Q2h1MFFjaTJoTDVRMG9IT3JoUW1RZElkOFVJV3Rr?=
 =?utf-8?B?em5yM0JUL2dpdE01NHJsWWNKNXNSY1IzU3VZMzBvZFBlNXA1bjE3N2QwVUJx?=
 =?utf-8?B?aEFEZm9JUE5ub1R0ODN4elNmbUFRcVFjMUE4MUpka0pOK1ZvaUxiaVZVQnlv?=
 =?utf-8?B?aGZwKy91RzlRODdManVTVVMyRXdDVDAyMDdENytTMTE5Q3Vsdmw2c3dxMFlE?=
 =?utf-8?B?ZlBMSXdReUhkZDJSZ0RxKzI5bk5mUjJMZ1M4bk9QT1BlSytNV21lYmlKeTRB?=
 =?utf-8?B?bExhc2lqaDZKRFY3emx3NEFZYUlaZ0pzZWZwV2tIMkwxdXJOOVArZ0FlNThJ?=
 =?utf-8?Q?BJLFk2lov+AvZQC6Y5AEDkQxb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a509186a-cce7-4af2-6c53-08ddd43d2751
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5438.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 16:28:47.7363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WPRsioqKZhlF06/bLWnMTXJMuMIE+dr/381KRkyFUV9vY/GerfavN6xHAXJiV7X+8+7H6zu1pygK/wTuNjuCmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9443
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



On 2025-08-04 04:20, Michel Dänzer wrote:
> On 31.07.25 22:51, Harry Wentland wrote:
>> Thanks for the series. It makes sense to me.
> I'm glad to hear it, thanks for taking a look.
>
> May I take this as R-b?

Yes, please do. :)

Harry

>
>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> index 0b8ac9edc070..e78249b55345 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> @@ -10021,6 +10021,21 @@ static void dm_set_writeback(struct amdgpu_display_manager *dm,
>>>  	drm_writeback_queue_job(wb_conn, new_con_state);
>>>  }
>>>  
>>> +static void
>>> +update_hw_done_deadline(struct dm_crtc_state *dm_new_crtc_state)
>>> +{
>>> +	struct dc_stream_state *stream = dm_new_crtc_state->stream;
>>> +	struct dc_crtc_timing *timing = &stream->timing;
>>> +	struct drm_crtc *crtc = dm_new_crtc_state->base.crtc;
>>> +	uint32_t deadline_lines, deadline_us;
>>> +
>>> +	/* XXX: My guess, AMD display team to the rescue! */
>>> +	deadline_lines = timing->v_total - timing->v_addressable - timing->v_front_porch;
>> This works on DCE. On DCN we'll need to take the offset into account.
>> This diff on top of your changesshould do it, but it's not tested.
>> The dc_stream changes probably fit in their own patch.
> Thanks, I'll incorporate it.
>
>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 629fd21a611f..314074527216 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -10082,11 +10082,19 @@ update_hw_done_deadline(struct dm_crtc_state *dm_new_crtc_state)
>>         struct dc_crtc_timing *timing = &stream->timing;
>>         struct drm_crtc *crtc = dm_new_crtc_state->base.crtc;
>>         uint32_t deadline_lines, deadline_us;
>> +       int vupdate_offset = dc_stream_get_vupdate_offset_from_vsync(stream);
>> +
>> +       /* note:
>> +        * vupdate_offset is non-existant on DCE and function will return 0
>> +        * vupdate_offset could be positive or negative on DCN
>> +        * vupdate_offset depends on timing and HW bandwidth requirements
>> +        */
>> +       deadline_lines = timing->v_total - timing->v_addressable -
>> +                        timing->v_front_porch - vupdate_offset;
> Hmm, if it depends on bandwidth, we'll need to recalculate it for all CRTCs after a modeset for any of them, right?
>
>

