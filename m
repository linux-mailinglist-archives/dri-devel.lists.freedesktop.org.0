Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB2058D95F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 15:29:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509B4D6202;
	Tue,  9 Aug 2022 13:28:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D712D6055;
 Tue,  9 Aug 2022 13:28:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dg3DY6lGnDG2Dvqb47DCq3PkMG8HyWQCVqohvY1iJ7i2yrS0KmZKTl9e0Yb3E1BSycs99KRv8ZDs3KeuofRXZ06PjIbvke/oBNbyOxA6xvlSa4Whq/bfkm6975kE+4nRhMwEXwc1hKuy6XB1jvYMe6OTH4maX0kvKFv+I2pO/0e7mG971I9XKUnIarV2NcuSg7kSTJEr9VPBvabKAef6cGAQmM8+y1LO2KA8kcnnGMd01R1p2WiiQA3oKXHgipiBOnNX7Y7Eyzhmk890SacdTQxgGu1Rdk0V6o6J3513CHne4w1bsfrVm6j1JugSAspz0ItCy/y/CrYBsChTp50xOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMr6BGvPgfJk77GXwl1rvLZBUkIB0pxwZI1N0jf4HVM=;
 b=RQlOGyZjVOHfTY5ozBWGX1vb1GchdXbu0hjFw+yiOSPsXSJ8z1FcxH3OxDxNAlKBHXXA80wtssQk19IOjv+1wTGJ9yupUdm54UcoPtiOPrg+QTQNRUv0j607GdjR4vAIGrJ7UwVxDZIqSSN5TW7Wfvvu9O9QOoGxzktC1rwQlP3OQ5pMgzMwiEe0H1s3wKFdfT2pqKnprsgQtmNlJJg4vnkqkK3KSdrlQO3JKZSpTrXtdxMZCCp6ev2T9dmm9lhYb16WlgsJwQdX9x8X3owEAzs998aiooJIoOvBUy9aostPv+WFxdh/56oHr54urFfBC2mOsqMiyr+rD79vcXT0xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMr6BGvPgfJk77GXwl1rvLZBUkIB0pxwZI1N0jf4HVM=;
 b=hab+nvgq9a9ZdtD5dKFJ3ZENZJ9c91GGHlMIAt3AaeSK439teEWAsro2VKZdllGNL+gsmhYP4CwHiExoCbxvZlAPrXSQQebj0fDolUUCgmi9RAmFOgvN6MzYMo/L+cOeiqCAvey87MVqBpGels/q9NeI2vVNnDZgYq+d3A7+jYA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4141.namprd12.prod.outlook.com (2603:10b6:208:1d5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 13:28:14 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 13:28:14 +0000
Message-ID: <7cf898fd-f3fe-061d-19ec-68d74627bd7d@amd.com>
Date: Tue, 9 Aug 2022 15:28:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drivers:gpu:drm:amd:amdgpu:amdgpu_cs.c:fix a potential
 use-after-free
Content-Language: en-US
To: Wentao_Liang <Wentao_Liang_g@163.com>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com
References: <20220728121237.9201-1-Wentao_Liang_g@163.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220728121237.9201-1-Wentao_Liang_g@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70b5a1d8-4a1f-40ca-fa47-08da7a0b02f0
X-MS-TrafficTypeDiagnostic: MN2PR12MB4141:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EZ7z0KmmXkeXZlD8NdMCapinQ4NbjF8HS8nWb3PyxMdYzk0r7HxFxtkxCYtI0fZsKurC5Tj3ck7MuuRWFTa9JrLJzvu2zP6O0TItAzdO7jMW0y8XL3GtPWvQuB40QgPJNNGvI8+w+rwoMQ3Br0t9lQOFcJdXMe87Y/BlzeHoTeZ4Os+yjtM9KxMU8DaIy0ByWkfvKUy0wP86VzKg8ri7CDsMVbDfoUaegrJhaLOhh3GHOLjVcxaeZckhUlDsv1FGBHcVejg3NWBe3JZcNRY5IlQn0Mj1BFlfo8/tRJiUoIWqZEGn9XTf2b5LgShBU0V4bu2yw1u85ZaIP/s9T3oAGHc8obtNkReb80JsHq0llEAHkWXNkc3I7O7P+EftIBOQpjCE/SeTtI4JEno9QTkC0Z8xPLnFe3OkPNMpU4rHr33nu4hHSlTdkfKSJuEonuJWKdbWBbsQ702K7c4iwk32zTZycgmNm1nCUf+jJ+ivkcmsNafR14nWuZrmB7mxqtdCzgAXLHve3Ywo6TWi7ooqtcwv62fc/2OovIYtNifFRyk4nD9Zod9I/YDPD3r6ENuqWygC9uh7Qa50eed2W6Rgp2gnsEVdSWoZQKn1YRb/3lpiWrXnxCEw9r34pNAjCAPrfAhKk7044UXjxXX6I1ybENjivfvvI+40OshJn6Wd1f+AqfwUr70C0QuR6zSSX19bWEpyzM3QGBxuFo0zh1gsv8z6CByjKk4yFGVP1Pi/o7ORLheHOoykq1LZZuAR17xrfmS9yycQlZU/Bo7lm4g5gMgLfvSAdMcDUpRXT3rOiJ/A0d3BAI827ZNcvbu8zGdsAvLkCCA7tPIjcOXotEK6tw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(31686004)(186003)(86362001)(6506007)(2616005)(83380400001)(26005)(36756003)(6666004)(31696002)(66574015)(6512007)(5660300002)(316002)(6486002)(6636002)(478600001)(41300700001)(8676002)(66476007)(66556008)(66946007)(38100700002)(8936002)(4326008)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkpOQjF4eTRHaVRzV2lVd2NIelpoakpkUVdUdmViY0R5T0l4Uk1VWVVNYk5q?=
 =?utf-8?B?NUpaNDBQTm14M2h0VGpRLzJYWW9QTjNYQys2TjhEKzZsREhEaWdYQ3BKTFVI?=
 =?utf-8?B?dmxraTJhMW9KbXQ3d09NU1F1NCtOU2J0ekNpZHJ5TFJBSExhUEM3V29aTXhx?=
 =?utf-8?B?WmdSMTN6b2RQR24zeXJSY3JUd3p4aTJIR2U5YkVEblhNUHdCWGoyUzRNN2Jw?=
 =?utf-8?B?VXV6MWY3WmxibzBLTDJmRTVpa0ZYbjRpd3kycENtOExwNWwwTHZrTXovMFNM?=
 =?utf-8?B?V0YrZHo3NkVpTHRZZHlJZngvOGZiVmgyT0pzRGE1aVNZSHgrUStXLzVNTjlB?=
 =?utf-8?B?WGc2L1gxYjBjNk10cnhBWXU2QnBRMUk2a1ZJMHFRdFZWQ3d4anc1cTNrVWk1?=
 =?utf-8?B?RXBwZThmZzMyQ1RUdjIxZDM2UFRTVkRWb1h0Tnc4VU1zOTdzbzdWQkd6Y1Nh?=
 =?utf-8?B?dnlGekNSTFpBdGVmZUFKUHUzQ25Cemp3a3NrZkpacGdHTnV2ODA2emcyUjNF?=
 =?utf-8?B?RUxhYWQ4Ump0NVl0TnNhY2FiekdtWUswRTdMZzJqM08wbm0yOW5CaU9XZTVq?=
 =?utf-8?B?RXNWcm1NbHJWOC9sa1gySENRN0U3dkJHcDJLVXUwMkFZY2NIRExPQ3VBRHo4?=
 =?utf-8?B?K2hjenF5b2g1ZEljZ2FjT2VmbnlZMFBEQjloa29uSnJ1cFNTeFl5TndjVE0z?=
 =?utf-8?B?VkFrRFlGZGhQand1allkZHZsWTVSN1pyL0VCazAxWEo3cHJ1aEorWjRVRVJ1?=
 =?utf-8?B?Wng0VGlxWS9RS0JVcUluWjZPYnQrQk42M0xPcWErMytZV0JTUDdpZ3dMZnRm?=
 =?utf-8?B?WUVQemphUzVqZDlKWU4zVVdpTlRYbXIrWWJSM2RxTjFsUGVER3UxdGN1Wlpk?=
 =?utf-8?B?UEZOM1BVTk1Bd09OcTJDZlllb0gzb0VUaVA2Qk43b0dWRDYvTVhucC9pN1lC?=
 =?utf-8?B?Qk5nZ1FPdjd1dGdFbjlxVldFUUpzQjEyeGFYa0dHdTRmVjV0UjYyK0lsZ1M4?=
 =?utf-8?B?ZXp2eCtmMXpRTHpDcDBGU2ZGMzFXYVFwNW5nbGZadlNnNnI2ZDlxckthZXVu?=
 =?utf-8?B?R3dISGw5K2ZZaVZUYWNxZjVTanF2QlZFK3RmaGpaTnBTKzBtb05GWEFxZzZP?=
 =?utf-8?B?bXpTUEpyb01zTnRCazR4V0pjcUpCOUVua1BWZGpFRnhSTkxkMWxMVkVmWmtI?=
 =?utf-8?B?cGRaRnkzRXpzWDkvWlQ2cmRrVThTVzhSVnVFUmJVYmZnZmRPTHZ5SFRKa3VJ?=
 =?utf-8?B?VGVOZWZpMUZOKzQrblovODZYbG9SOVJMR2t4ZEZFRndWMWpxY2pJSzlkZytP?=
 =?utf-8?B?NFN0OHhFanV2bHR5ditDaU55eGpWaG4zRXlhOGp6TDBlYmRCbGxTaDJYR1B4?=
 =?utf-8?B?eHNiaTFheS9lbXBFVHlwK0RjbXMxaUg4VEdpakVmdzVkMlhJRUt1eTUvVlNr?=
 =?utf-8?B?UHdzeWVhWnpBbGtLa1cveWxMMWVCY2dxVjlCUkVaazg4cFBJZm84RnJRMjZH?=
 =?utf-8?B?Z2wxdmRKcHBjSithZWNSNDFhZDZ3NnBWSklpa2paK3JpSUs1TFZhZmQxZTd3?=
 =?utf-8?B?UU9mbVhwSTJadmEwM0I0aVJ1M003WU80NDYvbk5OVXFRKzlScm9RRXdiSlVh?=
 =?utf-8?B?U3pkcWw5SzRSc2d2L3U2cGt3RnMzMEdUYTBnNWlFeUZRTkxNWXh5bmtBaUVV?=
 =?utf-8?B?VFhVT3QvZTNoY1JIZ0dDM1RBeHIyTnd2dXJGd0dpb3FWMFNNMnRzTHlnS0lR?=
 =?utf-8?B?bFg2K0RtdjVQWUJrYXd5M2JCbTdncGJTKy9KaXVsbFBUdzk4Q0hKd0NLZzFq?=
 =?utf-8?B?MXdheDdnNTdvQWtybzZ5UzVtTUVYMHN2VWlwNFJaZm9FMFFLV1hlTjFNRy9i?=
 =?utf-8?B?WGVLb0lNeEVjSTZxQnNzSCt0S1IyRUc0aFZ1WkdicEsybFZid2VodHJwNmhn?=
 =?utf-8?B?VjErRVJZWnFvKzM2TWxrM1pOS1RYS3BJajFjbFlGZndCeWZ4a0pUaHpYdUlL?=
 =?utf-8?B?ZU1IdnBOdXdlbDFmL1FVVUd3c1VRYmRsZHh0WmdhaFZHZkdOWGxQZlZqK0dZ?=
 =?utf-8?B?eDQvSUVIRVJqdXJjUUdkcWkwWExoNzU3NDVxTnBCK3NwbGRWRkJJN3g2OEl1?=
 =?utf-8?Q?TI1fBZN1nz7ezhDFUXsow5WI8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70b5a1d8-4a1f-40ca-fa47-08da7a0b02f0
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 13:28:14.1266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UyMe0otblRCdCqceXNGz6IRVHFZUIJbew9eJymKOzTwTtBkDYTGTyYXB7Dvf6xkK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4141
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 28.07.22 um 14:12 schrieb Wentao_Liang:
> in line 1535, "dma_fence_put(fence);" drop the reference to fence and may
> cause fence to be released. However, fence is used subsequently in line
> 1542 "fence->error". This may result in an use-after-free bug.
>
> It can be fixed by recording fence->error in a variable before dropping
> the reference to fence and referencing it after dropping.
>
> The bug has been confirmed by Christian König on 2021-08-16. Now, I
> resend this patch with my real name. I hope the patch can be updated
> in a near future.

The subject line should be something like "drm/amdgpu: fix potential use 
after free".

>
> Signed-off-by: Wentao_Liang <Wentao_Liang_g@163.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index b28af04b0c3e..1d675a5838f2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -1518,7 +1518,7 @@ static int amdgpu_cs_wait_all_fences(struct amdgpu_device *adev,
>   				     struct drm_amdgpu_fence *fences)
>   {
>   	uint32_t fence_count = wait->in.fence_count;
> -	unsigned int i;
> +	unsigned int i, error;

>   	long r = 1;
>   
>   	for (i = 0; i < fence_count; i++) {
> @@ -1533,14 +1533,15 @@ static int amdgpu_cs_wait_all_fences(struct amdgpu_device *adev,
>   
>   		r = dma_fence_wait_timeout(fence, true, timeout);
>   		dma_fence_put(fence);
> +		error = fence->error;

That's still the wrong order, you need to get the fence error before 
dropping the reference.

Christian.

>   		if (r < 0)
>   			return r;
>   
>   		if (r == 0)
>   			break;
>   
> -		if (fence->error)
> -			return fence->error;
> +		if (error)
> +			return error;
>   	}
>   
>   	memset(wait, 0, sizeof(*wait));

