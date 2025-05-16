Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FF7ABA304
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 20:36:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 656E110EB6C;
	Fri, 16 May 2025 18:35:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oNwytGeX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2055.outbound.protection.outlook.com [40.107.212.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1562F10E0CD;
 Fri, 16 May 2025 18:35:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cEqGtj2baqgOIbitpdUNOU7REf7EQGsF0qlK8nuCxENP3TPpDLn3zvMU35UpPGqGCFvVcS1NzncpDu0ikUJGiunfDjqLf1P0S7ZRTUMOjww6FvVa0W7bPXYn+d67nmRtZUv1Kimfu3P2hCwpECWLTN6soML4dB+rDdILB5f7LJCmbsL9iMY3OlgUJh1er82qaOX86YoDf95dvLoABX0QcSevX/WlcBviTS4jea4sxRTLmw80EXrBgzA423tL3F70ekvkKRAr30RPuVnkj8Wk5GsdOKo00puAozWPMj78KJS3sq/9bzNQC6OfQA/6KHllIJt8UIJk0KMLRuJWs3DiKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhJZ4/q97kT3OHviyP8PprjkFJqoU37mnVHFIV009cg=;
 b=JXa6hUNZug6YdWNV2P2cbMnTS8ePCq99DVFwQWMcymGE8+IbgZFlEn8HysGXK5nZVnswrIskZcjKkjd4+e6METm6yh+zvKf8n2hJF0vUASHZdcSK3AOm+nse1x6PYUZsUaMFYleJVjAyr9dWxz2h4oOtissJSP0I6dNV1U8ScP/QX1RPbu8CCCkQDUzVrpDzPJsaJxkGBbXETezgOdEaBrYV6ph6a0IhxscCoycEl1+eCSm3MC8Uw/YkVMCulB6fkn0givIEntSPI0/Mya6qCuV8CXFbIHKdAucAY1TFD+Tmxh+nstgcjGcswDBRpzTQLQSbJy8FlcgleV2kT1pLZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhJZ4/q97kT3OHviyP8PprjkFJqoU37mnVHFIV009cg=;
 b=oNwytGeXtiWu+L9CbxIqd21iCfTHrzBofIE95LTxMbTIZkf+w6kEHQ32Vr4Bdw0XJkqYO2H10xwBbIRKtEbxH6XI/GHATjjYNcAfZuMBL+pKJj4Xwr6rGZiERr2ysT8lYIZ4w+cYlt2VBYwxK8paxMbEmJU49WNX9xQB/t4I3bk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by PH8PR12MB6891.namprd12.prod.outlook.com (2603:10b6:510:1cb::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Fri, 16 May
 2025 18:35:43 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%4]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 18:35:43 +0000
Message-ID: <c9cabe07-09cc-49a9-8311-6795695c28f6@amd.com>
Date: Fri, 16 May 2025 13:35:41 -0500
User-Agent: Mozilla Thunderbird
From: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [PATCH v3] drm/amdkfd: Change svm_range_get_info return type
To: =?UTF-8?B?0JLQsNGC0L7RgNC+0L/QuNC9INCQ0L3QtNGA0LXQuQ==?=
 <a.vatoropin@crpt.ru>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>
References: <20250402141219.372650-1-a.vatoropin@crpt.ru>
Content-Language: en-US
In-Reply-To: <20250402141219.372650-1-a.vatoropin@crpt.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR08CA0035.namprd08.prod.outlook.com
 (2603:10b6:5:80::48) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|PH8PR12MB6891:EE_
X-MS-Office365-Filtering-Correlation-Id: ec34c408-9b5c-4050-ce64-08dd94a87779
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cERKQWszd2dsM3hSeFNBQlRFcTI1dGJsdWprVmFHdjM3MVpMUTU1blVBb25u?=
 =?utf-8?B?Y0RkY3kzL0toclhSODRKR3o2MHJ2TGoxbTNDM3M5US96VVdnaEw3bmU0SEd0?=
 =?utf-8?B?anlnK2dhOXZ3a1MrVnZqNDZ4ZDVEWU0wc1RLYm1oUFVUbGRVdjBaZUNZbG1Q?=
 =?utf-8?B?QXhRTjJOQVVTc2RrYXM5S1JXNmtDcmQ5RXNYNjZUM1lQQkFyVWFveUdmcWxk?=
 =?utf-8?B?MXJKWlRlUUZ5M3NLRHA1SDhpdHR6RWN4K0tsdldYWWNnMVpWNk9lZHpYcVpM?=
 =?utf-8?B?Vi9mV3dJQzB4Rjk5MGx3LzZjd2hibkNsVUlCN1VLR1VORno5TXFTN2IzNUQx?=
 =?utf-8?B?SlY5dFdHdVhiMXlLbWhiMVJJS2lXVUxmZ1RQbWs5cmpaYm5OTldTVlZ0YUV3?=
 =?utf-8?B?alA2RmdGT05RNGJzUitxdW1DMDBEVDM2aVBtZEpxSXAxZVBFSWlMUVBqNm80?=
 =?utf-8?B?QVBoRXUxYVlGelFuOCtLdDJ6dWM0d1E1OVIxbC9vam44TFZoc3d1ZGpKSDVF?=
 =?utf-8?B?WjlBOXFXU0VQYmo4QmVnWEk0Uno1UnJpSVhnOFhNdmJmZE1RUjhBZVEyUHpo?=
 =?utf-8?B?T2oyaE5sVUo1SEloN3VZOWhhbUI3OUZRMTd1OXl3dWVrN1VxSHJnTzlXOEth?=
 =?utf-8?B?eVVSK3VNd0dzUE5rWHNuQVFza3lwS3ZLSHlxR0NIeGQxb2p2L0QwQlhYUUJ5?=
 =?utf-8?B?MjBHem1zZ1JNREs3WExnVmxnRFJpUFhPMURSZXBDQ1dndkltQnF0VVhBQmRL?=
 =?utf-8?B?VDdQWENxYmtUcFhnRFJpVlRnM1VuSGdhbTdCVVV6d2dVL1RLRHk5UmxWUTFX?=
 =?utf-8?B?UWx0c0JMdUxoWGxYUmFLSFZPRnFFUEVDdTlhaHc5MjcxOWRZY0RNeUZZeG9D?=
 =?utf-8?B?Wk9SVHhrMUo4L3VvWHNNa2ZZUlRxOUlKVklsQzdGblJzWWc1NEFNT29LTGJW?=
 =?utf-8?B?WWRsZWg2cFVhbS9vWlJLTWgyR1E2THVRYk53cnd1bEJzcEE0a3RRQlhFdzA1?=
 =?utf-8?B?SG94WDJoWUZFMkZQRS9mTXM1RGxNUXZVL1B5Mm4vTWxLdjZYZmdZYnI3ZXBq?=
 =?utf-8?B?QUErK1J2NXc4bmVnQmsyMEdKRnhEUW9oVzdpRUFHeitsK2s4cWtOejdxb2VT?=
 =?utf-8?B?dGdZTitIWUUxTHlZTFFXc25MbGkxcm5hYzRESmsvKzBFNS9WMGtrRUEwNzBo?=
 =?utf-8?B?U1BqeWhCNFUyWFQwV0h1ZTVGSHpycGEzNUg0K2hDMVh5NWk5bVhyYlliSkg2?=
 =?utf-8?B?VnR6K0RYN3JuOFEzK2c3MHgwRUZXTXJteHBRVzg3TDZjVjhTWVd4bDFxVkdI?=
 =?utf-8?B?NjFrckFmYkVTN0RZWmpEWDBiUjRraEtwY2VUdVY1U0c5dUd0T2c5WkxMS2xL?=
 =?utf-8?B?UHRwMkRWc3ZSdCtkYktGaUVmS05zeXAzVnIzWEZocUpPd0hRTnZoN1dIczNR?=
 =?utf-8?B?cWFlb1Bvd28vdnNKSGc3VXM1QjhXY0dDREl4R25XWFY0eU5HdG92Z3BVb3VP?=
 =?utf-8?B?VWlFYXREZXlyUDAvbUwrWkNhRTc1VWVqODZBdVROYVpocW5ESWJMZ1RkeG5B?=
 =?utf-8?B?S1h3VE03WVlBbmlmYTVlV25BK295azBlNTFMM1huODZNaXpPQ2JZaUV6R0lh?=
 =?utf-8?B?S1YrK3p3ZEQ5MksyQitSNVp3MlI0eVpMbWpIK3VPZFFEUXFYMnFtVVA1emN0?=
 =?utf-8?B?b0FuTkNpMTJwQ2lvVHZOWjZjcWRhQ0loSzBzVis3UEZQb3QzVEZvTXhkV3Rn?=
 =?utf-8?B?dnFKRTJkeHBXU1A2SDVZWXdNam5iYWo4TW11bGkxSzVsWWxrMVNvc3E2Yzl5?=
 =?utf-8?B?ejhLcW9IYU90TnZqeHVvSDhLYTRBcGFVcWx2OHBXcW5teWhIQ3NSVXUxcllH?=
 =?utf-8?B?QnlUellJdmxFdCtNM2lDYk9hZ2RhTnh0bUpsUHEwYjhRRTFJNUszZDZtekts?=
 =?utf-8?Q?VkK8FTCZHdk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlBrRENCaXNIVGpDb29lZUlLWVJyTWZLbWw3cDkrckpJQ0FXRFo4dzd1eGNZ?=
 =?utf-8?B?SUpVSTdIUXFWZTZiMTRVdUk5ZWFOelc1UFU0NVl5eHdCZUZ6UmhISlRxSktu?=
 =?utf-8?B?QkxDeE0wUFF4UVF1OW9tYUl6dnZuRzV4dXFkUURWS3dDNlFoVThqQkt1UUlC?=
 =?utf-8?B?cmtZck9RNzdSVjZLSWc0akdmalpsZkxJTjBzMzdITURyQlJuM3NMVzBJRHlP?=
 =?utf-8?B?RytjMThjT2V2ME85akRFMHhuMUpIaG5tM2tYemIzYkZQTlRNd28ydjBYdWg5?=
 =?utf-8?B?YnZvVUlBeVMvbzBuZ1lWc2w1d1c5d2k5S2t1YUVJMDRSbEZqNWU0d3lQU1BW?=
 =?utf-8?B?VG5wdE1DeGJialVuMUpGVlQ0NldQYktpM2ZoS1hWZ09wUFd1T1g1bFdLUlNZ?=
 =?utf-8?B?TFRKVnJ1RWk1bFZZVHo5Z2UrcmNZMGNqaFlyUlVHN2p0OTRnSWNlOEp4QzYr?=
 =?utf-8?B?UVNvM2NSdnB3UVo0MU4wWVk2Sko2akMvUDRTdzVXMFlTK3ViQ2hnTkYxYTBs?=
 =?utf-8?B?Q2hmT2I2cG1HWkdhb1puS2czcEo0V3dzNjF0d0dEc3dvdVg0dCtoQURUTlZu?=
 =?utf-8?B?WEdtSnhSTjF6UEI0SXhDOEJ3VWJHKzRmYmMyUHQ2TVFnT3RobldLSURtNmMv?=
 =?utf-8?B?RkI0YjZsK3Y4c2NPSzdUWmZVYVdjcEFTd2tRNUo0dmFEbFQxR3BDd1cyZTRC?=
 =?utf-8?B?TWZqcWFMamU3bFhVMzl5N1FXZjlSZ0ZuQmxSd1c2Nk9XUWR0dC9RNGNUaG9a?=
 =?utf-8?B?T3pHdlNPMExSNTNjVUZkTW9hTTRsNW9USDZIdXAyZUtZeklyMWxLQ1AwcFJE?=
 =?utf-8?B?c0paL29hQzVLZWFldnBDcVZiNEh3RWxDUHpLMWdyRHF0WTBiZXdRdTJJbFZw?=
 =?utf-8?B?dzM1dlQ2SUFieUY1bkFxOGI0N00yQ2RacVFkUVZQUW14UVVOUFQrTi9mdVVK?=
 =?utf-8?B?aTl0Yi94VVlyeGg1RXZuOFBPbEhHeTFpQ3hnREVHSWJHZ2lXZHhPMllRakNq?=
 =?utf-8?B?UnlsSFM5dEc2ZGhHQkhLd3NwM1pXR3BHSGNodjFvK3pGU1NoZWhLdkdjRmVH?=
 =?utf-8?B?UHB2TS96Qkpadjd0dlJpT2VNOHFzT0F2NDNuM2dZei9iQXp3ejBEZVF5RWRG?=
 =?utf-8?B?d1BFenRGOE9OeHM2SzFxeGJ2aU9KamdUbkg5ckhGc1JzOElSYlBEMk5HNXph?=
 =?utf-8?B?M0Z6cnlEYStlK3NEbmR1V1NaRS9RbVkrSnZnOTJtck9xT2FXUjBHOVJBeko0?=
 =?utf-8?B?THVXbkJOOEVDWXJDNlRBVVp0U1Z2Z1o1S0hFd2wrUVYyU0dPdGhQazNKZFJ6?=
 =?utf-8?B?dGlRQkhKOE5KcEttK25EcmxuTkJMRGtlT3dIalZnaGswWmQycjRwUG9kUXlX?=
 =?utf-8?B?S3VQWmFndnZ3cEsxZ0RaY2F4SzRmM2l6QkdoMVhCK3pRYkNvdm1Ub3JGZTkx?=
 =?utf-8?B?ZlYraGlGcTgzWlRmdm1WMlRnZ2RsUU0rYUtyRGxPTGNzNUNrd3R3dW9sMUht?=
 =?utf-8?B?aGFibVN0cjNpTkNMa3h3b1JTQmFqOTljTXBmM1JNTVVGem9YR2xBYWdQV3RO?=
 =?utf-8?B?QUhzdEF2VUtrVFIwa3BVYVB4V1dCaFUvVVdSTHd5THpEcWRXSzNHK2VtVCtm?=
 =?utf-8?B?dG45NndDdmhXbUd3Z0ZEaDFPTkl1eCtkY3FpajhvTnNEUkpsdFl6M0ZMYXR4?=
 =?utf-8?B?cVROZThBMm1pWnhsMTU0QUVpUk5tUGVaMFRhRi9WbUtob2paYkl2bEdDYjB6?=
 =?utf-8?B?K3dkQkVyQ3VraHdMVEZFK2pHN1VVOVNJdG5LUmFNZGVzbHJ5M1Ztam91Wjhy?=
 =?utf-8?B?NVpFN3Z5NWpXNU9Ib1BSMFkwR0lZOFVNVG1SNC9OWVdkMzFGRHdNM1BZSHU3?=
 =?utf-8?B?UUhPaTZuSmZnZ0dqUkZUU01aTFZLQ2d0TUFlZ3g5OXlVVUt1M3cvVm4vZHhL?=
 =?utf-8?B?Y2p0SWM4akRYR2h0WXRVOUlGTVVOUEV0bjNQeldsRDk5ZWNJQ2VHUTdleThF?=
 =?utf-8?B?bjJ5RHN2OFFHLzZBaTc1cm14QXIxQ0JMKzF6eFc3RW9oMEVNZDBhYWp3U2pU?=
 =?utf-8?B?UzN6ekpzYmdkTElRd3VTZW1qRFFpTTFOVWF1c2VqVlAvTE41aDJDam5xNGZL?=
 =?utf-8?Q?BJCVma+/QN74joAAER9M1sWjR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec34c408-9b5c-4050-ce64-08dd94a87779
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 18:35:43.8413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wGibs5vgdksLD0uwj2dPuxTKU4drDl4bA3EzQj+D3qLjVq3DC1UeXV76opbLxib+L+D9UNw8v+V6YhAM+0kwKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6891
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

On 2025-04-02 10:12, Ваторопин Андрей wrote:
> From: Andrey Vatoropin <a.vatoropin@crpt.ru>
>
> Static analysis shows that pointer "svms" cannot be NULL because it points
> to the object "struct svm_range_list". Remove the extra NULL check. It is
> meaningless and harms the readability of the code.
>
> In the function svm_range_get_info() there is no possibility of failure.
> Therefore, the caller of the function svm_range_get_info() does not need
> a return value. Change the function svm_range_get_info() return type from
> "int" to "void". 
>
> Since the function svm_range_get_info() has a return type of "void". The
> caller of the function svm_range_get_info() does not need a return value.
> Delete extra code.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Signed-off-by: Andrey Vatoropin <a.vatoropin@crpt.ru>

Sorry about the long delay. I just applied this patch to amd-staging-drm-next.

Regards,
  Felix


> ---
> v1 -> v2: also change return type of svm_range_get_info() per Felix Kuehling suggestion
> v2 -> v3: deleted extra code in the function kfd_criu_checkpoint_svm()
>
>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  4 +---
>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c     |  9 ++-------
>  drivers/gpu/drm/amd/amdkfd/kfd_svm.h     | 11 +++++------
>  3 files changed, 8 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index 1e9dd00620bf..a2149afa5803 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -2039,9 +2039,7 @@ static int criu_get_process_object_info(struct kfd_process *p,
>  
>  	num_events = kfd_get_num_events(p);
>  
> -	ret = svm_range_get_info(p, &num_svm_ranges, &svm_priv_data_size);
> -	if (ret)
> -		return ret;
> +	svm_range_get_info(p, &num_svm_ranges, &svm_priv_data_size);
>  
>  	*num_objects = num_queues + num_events + num_svm_ranges;
>  
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> index 100717a98ec1..ebdbbb620b11 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> @@ -4076,8 +4076,8 @@ int kfd_criu_restore_svm(struct kfd_process *p,
>  	return ret;
>  }
>  
> -int svm_range_get_info(struct kfd_process *p, uint32_t *num_svm_ranges,
> -		       uint64_t *svm_priv_data_size)
> +void svm_range_get_info(struct kfd_process *p, uint32_t *num_svm_ranges,
> +			uint64_t *svm_priv_data_size)
>  {
>  	uint64_t total_size, accessibility_size, common_attr_size;
>  	int nattr_common = 4, nattr_accessibility = 1;
> @@ -4089,8 +4089,6 @@ int svm_range_get_info(struct kfd_process *p, uint32_t *num_svm_ranges,
>  	*svm_priv_data_size = 0;
>  
>  	svms = &p->svms;
> -	if (!svms)
> -		return -EINVAL;
>  
>  	mutex_lock(&svms->lock);
>  	list_for_each_entry(prange, &svms->list, list) {
> @@ -4132,7 +4130,6 @@ int svm_range_get_info(struct kfd_process *p, uint32_t *num_svm_ranges,
>  
>  	pr_debug("num_svm_ranges %u total_priv_size %llu\n", *num_svm_ranges,
>  		 *svm_priv_data_size);
> -	return 0;
>  }
>  
>  int kfd_criu_checkpoint_svm(struct kfd_process *p,
> @@ -4149,8 +4146,6 @@ int kfd_criu_checkpoint_svm(struct kfd_process *p,
>  	struct mm_struct *mm;
>  
>  	svms = &p->svms;
> -	if (!svms)
> -		return -EINVAL;
>  
>  	mm = get_task_mm(p->lead_thread);
>  	if (!mm) {
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
> index 6ea23c78009c..01c7a4877904 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
> @@ -184,8 +184,8 @@ void schedule_deferred_list_work(struct svm_range_list *svms);
>  void svm_range_dma_unmap_dev(struct device *dev, dma_addr_t *dma_addr,
>  			 unsigned long offset, unsigned long npages);
>  void svm_range_dma_unmap(struct svm_range *prange);
> -int svm_range_get_info(struct kfd_process *p, uint32_t *num_svm_ranges,
> -		       uint64_t *svm_priv_data_size);
> +void svm_range_get_info(struct kfd_process *p, uint32_t *num_svm_ranges,
> +			uint64_t *svm_priv_data_size);
>  int kfd_criu_checkpoint_svm(struct kfd_process *p,
>  			    uint8_t __user *user_priv_data,
>  			    uint64_t *priv_offset);
> @@ -237,13 +237,12 @@ static inline int svm_range_schedule_evict_svm_bo(
>  	return -EINVAL;
>  }
>  
> -static inline int svm_range_get_info(struct kfd_process *p,
> -				     uint32_t *num_svm_ranges,
> -				     uint64_t *svm_priv_data_size)
> +static inline void svm_range_get_info(struct kfd_process *p,
> +				      uint32_t *num_svm_ranges,
> +				      uint64_t *svm_priv_data_size)
>  {
>  	*num_svm_ranges = 0;
>  	*svm_priv_data_size = 0;
> -	return 0;
>  }
>  
>  static inline int kfd_criu_checkpoint_svm(struct kfd_process *p,
