Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0704A7F965
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 11:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F01510E628;
	Tue,  8 Apr 2025 09:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="32zrT4sf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A68F10E627;
 Tue,  8 Apr 2025 09:27:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZHJpRvOGOYoel8Jdx4tidIhqPIhVoo66ZrHKkFJSlMnPjNZRludAqalnMTdt5O9dIOl+oWpLS2wMSsvnpSR2+nFORa4/nE7A0kX9/df1pi2iHtsG5q5fQ/KcoOwLXLoNS9Egv08xfZENDk4C0lqw6sku1gVbq/cy5tToECDIyF4BJbmLmF5rirveMfpMuSR+x02J1KmaK6QHp/7fAhDfK/xC/RnyJw4Ii4M76RZWruDcOw4fhqkggy9SN07BTtUGgwILRwRankTcPMFJT8obgnJtDnMdThpNGrpks0i2hFLiWD76p/jTZ9gleMDTQWH2WlSKpMY//2JwcbW8s7jGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMZA2RH2zyn1FszF7weKYIno790A9BoqrdzdOrTh9OM=;
 b=DrBoVwQBHUZECJcv1cDTgKgAWHp+eEioxB8OmGeSuoG1VfxLCSFFFyBCvI+t2G7bvLsoY9Pbl+Is5YRoatsaQSf7Mz73uQ1kaQaPmnwZSKpVf+G/NxHcMj+EFoESLVHhCTQhpgMR9PYWBn9ak4ZQ07yrIxDdxR4VP/XELOOG8/bzvSiIBdFlLLoNltERo2Gjn9AWK+e1FBo3NzP22gKgJI1zR+uUxphJjgLsrx75xpUx8yfyLusKgDKqCs7B6Ftrud+UMu1apwYR1hlBC5ZLJ4ODkxXiThFmFQNzYFgbv0ob5QzCaj1Ytlav9K7HLurmV6XZ8YhJQAg+jebplnq4tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMZA2RH2zyn1FszF7weKYIno790A9BoqrdzdOrTh9OM=;
 b=32zrT4sfQYirz79V8fNnO8Cpla7LEY1nuaC6+3rcMIOVORipXT5ystmWBziAiScH2N40xreCVhfwuFSWC5P/8c30aZcbeRPphUBydH6S5U8K4Cz1ZOC36pGaDJdl9Efcu/P8Kpg4TwWxvXHbl+L1FnI+eazd5BIsctoLPqeDtuI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV8PR12MB9357.namprd12.prod.outlook.com (2603:10b6:408:1ff::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.20; Tue, 8 Apr
 2025 09:27:04 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8583.045; Tue, 8 Apr 2025
 09:27:04 +0000
Message-ID: <e6ccef21-3ca5-4b5a-b18a-3ba45859569c@amd.com>
Date: Tue, 8 Apr 2025 11:26:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: check a user-provided number of BOs in list
To: Denis Arefev <arefev@swemel.ru>, Alex Deucher <alexander.deucher@amd.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Chunming Zhou <david1.zhou@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, stable@vger.kernel.org
References: <20250408091755.10074-1-arefev@swemel.ru>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250408091755.10074-1-arefev@swemel.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0254.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV8PR12MB9357:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e5d6478-dcab-4f0d-ca59-08dd767f8645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eS9PZVBkblFWQ0YzWFV0QWZsM09Oci9PNFdCU004czF6dllqRXdoT2I5dUxP?=
 =?utf-8?B?RHpoY2ozbnI4ZXJjWXdQN0YyaFd2MmxWQkYyZ3ZDTUFJeHZNQ1NrbE5hTVFB?=
 =?utf-8?B?cHJrWFk2VHhMVEN0aTQzYXFPclRYQSs1bG1ESVoxaVFEVzFwemQxVWErdGI1?=
 =?utf-8?B?blF5SEZweEdwaGlVM29CbjAzRzcwcEVFQW5kWjB4eEJTSjlqMld3dUMyM2x5?=
 =?utf-8?B?a1Z5ajUxaUZkVS9qVXdGZ3RLSVdaUjhUYXVudzhZcmdmaFBFVG1aSEovVXJ6?=
 =?utf-8?B?QXIzcExjQUo1NitLSzgyWHJCYWNYaEZPU1hubzZDbzB1T2dCMWl1Um9SdC92?=
 =?utf-8?B?dTMzc0UzVGpBbVNCSXo4V0cvRzR1NG11OENMTnNLaVJ5NS9OZU5EVkk3dVo0?=
 =?utf-8?B?cmVUWUg2elA3TmJlWTFBUUdtdXhUNldrQnYrNmpRTE4vbGNBWndtb1pNeUxF?=
 =?utf-8?B?K094N0N0SHB0eVV4QjIveURPOURWbWdJVndSZk50R3NkcXMvaU5sSTYzUDda?=
 =?utf-8?B?SnJDVTRxZ3dTZ2ZJMHFFL2JjdXd5K3JqUWNhbHI1WnBkdjBpaTFiekN5a3c1?=
 =?utf-8?B?VWFRcjc0RUt0Ry9iWVdObHdDcGY5T0dRSUFBM2pZWGxEdUN2NkhoclNXZThR?=
 =?utf-8?B?WlRoSXlXRkpIY1kvZ2QyeHVNbkxzTVpRdHppWm9TTEprSklOSFVqOG8va1M3?=
 =?utf-8?B?b2k0ZnNyRlR4VzNQaG1ZMGY3YzczaHhTSmlXL2N0VS95WGVaL1pvK3FvWHhD?=
 =?utf-8?B?elU5eVJ1ZTVnNDR0bzB4UEVHcUVIYXJJNTNUYW1aZ200ZEdWdU83WHR3MGtk?=
 =?utf-8?B?eDU4L1huSml4VEROZnF3Wmg0VCtvT1NPT2h2NFVCcFN0bFk5RWdFZGJibzhE?=
 =?utf-8?B?TmV0eVpQTnRlNVBJekVCc0dMaTJRdVltcTh2K21XOTRUdXpuNmpwOTVhd3RS?=
 =?utf-8?B?cUNWUWM5THp6UVRYZjBKSXBBUUVRR1phYmZzR0E3bXFlN0cwbElaaGgvdGVK?=
 =?utf-8?B?M2pLMTNEbDhWSm82b1I2aStYL0RLSDA3bkN0MFlQa1NzUVZqc3VkS1BiWjB3?=
 =?utf-8?B?aHRiVWRvT21hRW5HR3YxVHRJRS9EUFRsYTdiVXFPOUE5NXovcHJlTld5Wndv?=
 =?utf-8?B?cGpHbXdjcE5ETkJBKzR2UmJaY3BzbTJoR0tjb09EWUN2TnZKcEJIb3FIaFRz?=
 =?utf-8?B?cFN2ZkJhbVV0cmZYODk4SnpRTG1ucTdSbzZuQmJSamM2a3l0RHY2R1k4Z2tU?=
 =?utf-8?B?SEUrM1lHSFB4R0QvNnRid0VhUVM5dndjRndtYnlWYUZJS2Z6NXZLb3FUQkk1?=
 =?utf-8?B?c2VVSzRHVWw3cjBJNm5Ec3hwSmRmWDBmUHZSRFQyNkQxN2cxMURPbVRPOGl2?=
 =?utf-8?B?cGFXeUVtVFFJaThnOWVmYW4wbE51anJXbm5hTjF6ZE5oSTB2ZDNmalROSzRC?=
 =?utf-8?B?SENyWEQ1NE1peFFELzFCTUZFN0M0TCs5OHBSYi8xanpWN1NqOTFyVGxhZHpi?=
 =?utf-8?B?WEQyZUhpTkxrVk9MTlZwRWgzcnUycHpKNnphcmNUb2IzNFNXMGc4MFlJbmF4?=
 =?utf-8?B?ZkhIRWFyUExEMlRpM1JlNnJPdmswc2U0YUdCSEZBbCtWNVlLS0FmcjltVmFy?=
 =?utf-8?B?WmZROHlwUFpsWmhEQlBYeVhWZzZXaE5PaTlkcXVnVmRrZGZkRURDNHNrZnRw?=
 =?utf-8?B?b1dEeGo4TE4ycklSU21Yc0NsaGpBSW5lWU1rRCtBMEdiRzZ6ZGg2em9UZkRz?=
 =?utf-8?B?dUp6ck1MQUJnNnplc245Y2RlQXZrelJzMU1lVWJLK3NkZ3A3SmhnY2NickVH?=
 =?utf-8?B?b0pSa0pUb1l1YVBXSmdEeTB0UWRVb2tKeEF6YmEwMitHT2JKZkxRcENjQXk5?=
 =?utf-8?Q?SKIILBqFof9lu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zk90N05HTmg0V2MxRG9QZ1pZalRwVG9OUHpLMnR3TTRLcXJlNlRJaFhoVEVv?=
 =?utf-8?B?Vkk1NlFhMG82OUFjME5PdFFEZDBlMXpMaUxFclFkV2xWRTJrMEtQZjRXTWp2?=
 =?utf-8?B?VmhGT1JoSWJVVzRPWlRpV2dwZnZSV3MwOTlWN2RURTR1a0JQWjU4YVFtMlJT?=
 =?utf-8?B?TTRxT0JTam9LV1BCMnFtYkRZSWYvVlhDZFk1eDFIcXpyNDVDZ0c3cFRJM1lh?=
 =?utf-8?B?aDc2R1Y2aCs1TjRUZ2Z1czZON0NZbDA5Q1BSNDQwaEhreThLMTBEVVBnSFk1?=
 =?utf-8?B?ZUczdXUycTJhQkM5QThvejFmWkYyNU83YUl4V3U4c2VwMjhITEpBa2dTdm81?=
 =?utf-8?B?eXMvU2g2bkpBNU1NZm5nekxXUmRXNHhRRUFFQmtSZXpISjkxeFB4ZWRqYzR6?=
 =?utf-8?B?VVhmNkJjWEovQzZsVEs2N1V2SGVEQUtzRGk2SGI4R2k4dGxkdXFneVdiQzYz?=
 =?utf-8?B?N1JQWGI4TVBOSkNiVjA3eTR6MW51bDJ6cnN0ZFNkeTE1blhxNXo4T1FTZWwy?=
 =?utf-8?B?dzlVWm5JeGlIWDUzN04zMHByTjhtQWpzWldzNXBNM3FhY2ZhQUorbFFFMmsy?=
 =?utf-8?B?OFp4SG84MDlpdHZFN0U3cmpzN3JVT05Kc0J5d2VPa1ROY25hRm44eDZrZElT?=
 =?utf-8?B?N3QwZXBYcTJIUzI0NEVSdEhHdkJFWDJOZ2l4Zi9sREt1ZkpDbmJXYjR6cG1Q?=
 =?utf-8?B?STYwejIzVGw1NHhjYkUxRFQvdU9SYWNJTjV2aFhuWDdxR0NWTTFNSEx0cnhz?=
 =?utf-8?B?VEhJejFXNERUaUYzYm9NNTFNSUZyUnVMZmRjbytWN0tuSk9wSFErd0lLbXFz?=
 =?utf-8?B?TGRtMXBHcG5nL1hwNUV4eFBsMEdEVjB1SjZ2NG95UE4xcHpNRUhXUmxBYnYx?=
 =?utf-8?B?ZHFNd3pTejlsL094SGpXcGxsYUtkM1IyelNISnowcTJqdlhvdGpxVkI1b1pQ?=
 =?utf-8?B?T25UTnFXTjJWUHUvR011Q09qY1BLc1pSUGhGeU1ySmYwbHZjT2l1RzdBcUUv?=
 =?utf-8?B?SWkxbTYzRndzMzl5NVQyeWtaWG53RnZjNWVwSlZPRmxhZWkrUXMrNlQyQVNX?=
 =?utf-8?B?bncwTDhzMTNTbzFRZFczMkdQWUVaSTZHaFYzU01wbGNZV3d1cWxmYXk5cmli?=
 =?utf-8?B?NEtGWE1MVGZGbXNrUnhmcS9qUVR4NzRDVktrWnBJOHZpUlZQWVVKVGE5aS9p?=
 =?utf-8?B?M3hVSDhQSUtmN0RJUXRKMVdST0JGZVJnYWRlREoyalREalpYY0h2SnZqd0Vr?=
 =?utf-8?B?TGx5Nm9tTTNSV1J0TG9jQ0NlZkpuYjhWVFNLbFZjWENTVzE3Z0pWODVWQmxB?=
 =?utf-8?B?VHJXK1AyQzkrc3kvaTJLTGxKTlRmUkVGUHRyUC9VSFcxY1lHNjRSTy9PVTQ3?=
 =?utf-8?B?QnJYa3VoS2JNRjBheU9tZ05tNUNSeTczZjlMTGFaYVc3SUxzNUZKK29FVU5Y?=
 =?utf-8?B?RmR4aXJPMVBrL0FWQ3YyVWdqeWg0cWp6UVg1S1gxR1RpeEsyS0JRYy9iQzVq?=
 =?utf-8?B?cE5zK0pjU25MRnJpcTNTMWhDUTdqUUFBQlJXQUZLdUZuTzZkMUc3ZmVkaVVC?=
 =?utf-8?B?N2tEQ2RrSE44cG50M0czVnF1OStIcGpFWS9oMFA5LzlIQ0MzWFl2MDhBY3U1?=
 =?utf-8?B?RHJVYUZTNWZqYUFIdThJTGxJQ0xjbTUxUTlGSTNzSzRMRVNWSXFCaitLclJu?=
 =?utf-8?B?bTg0eHIxYXowTGpZWlUyZWh4WWY4STZ1bEcycy9NMjJLUHF0L2RGcEg0ZURE?=
 =?utf-8?B?STB6OWM0TzhUdWVQVS9pVzF2Q3ZReUZNejNuL2U0VHZHZ0UyMnNkSlJtaDJw?=
 =?utf-8?B?ZkxXdnlrMmNZajNpNFVtMTBFblFDVHFmdnY4Y21SWjd0T3QxR1lldWdxZ2FJ?=
 =?utf-8?B?MVpKYjhkejZVVmtoVFZISTBVYVk1bFJzZ25oR0RUT01zak9ML0R0dmFRVWJX?=
 =?utf-8?B?ZHBzb09RRlZaLy9nNkdUZXFDWmVPYXdvRHhkUW1BS3B4d0JCTWhhSmJQTUky?=
 =?utf-8?B?bVhpajNKcTFEUzFCaW1KOG5HVG9ORC9nVHYxUGlSSWdaUXVkVmpOUmtTMG5n?=
 =?utf-8?B?USt4dE1XamxqWEVoMVpyOU4xbkE5RmNaT0x0WnVqOEVRcGd2WGp2Ny9iMDVs?=
 =?utf-8?Q?0T8Q=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e5d6478-dcab-4f0d-ca59-08dd767f8645
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 09:27:04.5024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kSHS48IClUnRHiVDhUHtZWgnHpb7k7cR+lb+I72dJMOfBPnVVrl8lbS/w5u4n5ea
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9357
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

Am 08.04.25 um 11:17 schrieb Denis Arefev:
> The user can set any value to the variable ‘bo_number’, via the ioctl
> command DRM_IOCTL_AMDGPU_BO_LIST. This will affect the arithmetic
> expression ‘in->bo_number * in->bo_info_size’, which is prone to
> overflow. Add a valid value check.

As far as I can see that is already checked by kvmalloc_array().

So adding this additional check manually is completely superfluous.

Regards,
Christian.

>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: 964d0fbf6301 ("drm/amdgpu: Allow to create BO lists in CS ioctl v3")
> Cc: stable@vger.kernel.org
> Signed-off-by: Denis Arefev <arefev@swemel.ru>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> index 702f6610d024..dd30d2426ff7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> @@ -189,6 +189,9 @@ int amdgpu_bo_create_list_entry_array(struct drm_amdgpu_bo_list_in *in,
>  	struct drm_amdgpu_bo_list_entry *info;
>  	int r;
>  
> +	if (!in->bo_number || in->bo_number > UINT_MAX / info_size)
> +		return -EINVAL;
> +
>  	info = kvmalloc_array(in->bo_number, info_size, GFP_KERNEL);
>  	if (!info)
>  		return -ENOMEM;

