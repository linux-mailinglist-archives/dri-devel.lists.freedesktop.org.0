Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AF96E7571
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 10:38:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5335010E883;
	Wed, 19 Apr 2023 08:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791B910E883;
 Wed, 19 Apr 2023 08:38:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCoKr9jOf2ECfAX+ml041kNXeEB0v6niu64CB1g9/61ZJ06sSJNH5VSV8UYFXN2r9o/XfBKIU8Jimv8diuhaGi4EtgCam64myDuB7HwUN8QmKPXIYDM7JJnB3mWiNpJUJEOk3VObWECdoEf/27nbq48qW26Wjz/NvU6WjW7VPQquITRVIZKy5Z8yhDiFxL9kbxGjr8q3PE4gO0NHJV6kkyFvZU9VysRKiJVtkYU/58aHjhHfA94WMd001t+fD+cNFGjhwUHVeJ9sjZjbotjS9cdX+GgGmNzgW9Mu4K1qaAFs89KIdd/Ec/ZS9kSXRS8uXNYezPBCLVVq7C/9sKs9mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMQSielGWYbG6fEUE9RFMlXGsHRTixRMPU/s7olHq3c=;
 b=Zx+Xzsb2hqBBS/Uba0HHgJMQZ4W7QmWGy2E0GhswLH9OQ9UI4ECrhhw71MJoVfploLXbYfgBa0Ox77Z6EVtOp3rZHGU/RdMtdZNBuQgZ3eTG1JSAFub+x22BdcqlwVpRTaBGOJ34CVnzy2a0L+BExwvcwnTBVh9uxWfxBWyg5UsKlCcoKhKYZ9IqJ3T/dgIhb1oH348tvXOkOw7aFxiv1PGosdJSlsF8Qxdh3OPPJeztXwUByb7Di6+Ms1F/EFImEG6QtN3OroWKqZrBrByoU9fzfXz0MXT4pDMsLv+sw+WcTd2g/8RZ0JCkqB1GgLo+qv4xYNaIrYbXZA6ZCkBelg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMQSielGWYbG6fEUE9RFMlXGsHRTixRMPU/s7olHq3c=;
 b=aFdfC1pjUKmuYNeBRFgIwj7VGfVtC5ozVnc0uktOtcSSAJ1D9s2XZ9mQktI8ZMjexLJX6AVVPih1Xw9uFycRGEI6kCG3bb87kZX/rtGAWmzBchYwvnIJh/dwV81VlSN2Q11ROH4sMfs9bRl4kTOTKvov7bsf24AVuZA4uVnp7CM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW3PR12MB4427.namprd12.prod.outlook.com (2603:10b6:303:52::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.49; Wed, 19 Apr
 2023 08:38:31 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed%3]) with mapi id 15.20.6319.020; Wed, 19 Apr 2023
 08:38:30 +0000
Message-ID: <5eae1b0d-a917-fc28-16ba-29bff612caac@amd.com>
Date: Wed, 19 Apr 2023 10:38:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH V2 2/2] drm/amdgpu: Fix integer overflow in amdgpu_cs_pass1
Content-Language: en-US
To: hackyzh002 <hackyzh002@gmail.com>, alexander.deucher@amd.com
References: <20230419082705.4110-1-hackyzh002@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230419082705.4110-1-hackyzh002@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW3PR12MB4427:EE_
X-MS-Office365-Filtering-Correlation-Id: 4af3334f-7afd-47e8-aba2-08db40b1743d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: obqFg6GI3vahOYG62PfdDlTJ98PFXu2LgNdaxXpr+gghZ8ie8iXYEAQDX1jZOl7l5znmEx8vUZe63Z5Le8tmV/uJHwkGJx2G6cSZkVuqr199Vz6f///hfXlbNGFGpFJiSKoikV25gqeJG8Wcx5C/vB8tmO0bawGBqmO4oyfCapcpEWLTXeVYwG+9iDwpxYnI6ftzu43F6M9EDMPcQ65XLnjpqZoo0KMZSLwIZEHrPQSr4m0zhdA3KjjzxamOG8xBu9e0UdnxnUhVA0FG0dn9A2c6ti06hnGtUcex4PXnOp8yZZbs56Sa7Gn0G22I1YdYSt0ZHx0WjD8f/HCGpOS8gBRSlm+wsxdFuiltAtUzHwGx0LOX+rhVFMWG5sRhUQf7ra24YafqT0X2aMs10NZqWLMuVP9+TAeTWAAK8oCRP1+/8K5aACItvMOWwRIkGZyqVfjgv9p6F7DtrO/m0cu39YtNc72f0rUKXnpsy2P1i1EepeeMrURWHIJWVSgeSBP/rq98pwGHDRjmffLyYWKPqOC8fc6AzmhHqzp7/A7qzGX38pN57fe9Yp662zgzsp7AIxXz/P65jaxw4O3TH75ehu+PNdnIuU9U7PYii3l06HM66MSu+DP9KWm7h4lgunWFvewvRnQGXR+DPNXx2NjJ6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(366004)(136003)(396003)(376002)(451199021)(31686004)(36756003)(5660300002)(38100700002)(2906002)(8936002)(86362001)(31696002)(66556008)(4326008)(66946007)(66476007)(41300700001)(8676002)(6486002)(83380400001)(6506007)(478600001)(316002)(6512007)(6666004)(186003)(6636002)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXFXN1Z3VXZYZHIwN2c2RlpIVGtuNnVDeHNMMGdZZkJJQWpuM2pWN0NJeVRM?=
 =?utf-8?B?cWFFNENJTFpkTkhBZG9zMWVkQ2R5RFc1dnlLSTBjTkVWQ0NxZkFsN3E4UDB1?=
 =?utf-8?B?Tmx6WlZkYW0rU1RKbzkzYTBhVmdLSGdZSnJ4TTRybzcrRThhdzZSMnovNWRu?=
 =?utf-8?B?SFhSUkl6QzZUc3hsaTdCOWFhenZhZ3NuNE1CbmVodXVFajYzUDhNQzVKNWxL?=
 =?utf-8?B?bVh4d1lQTnAyNDJqSjQ5SzdtMXRESXJaTU1ZZW5nSzhWbEF0cHdEc0lzNit5?=
 =?utf-8?B?ZU5IWUdxQStUNHJoeWxvQzJNZ1dobUFFUG01Y2NVZFRvbzB6VWJuYkIycTQ2?=
 =?utf-8?B?YVh3MTJVNXhLOVo1TWpoTi9LTGV6dkl3a3FvVmN6aUpsRjlUNWY3V3c2aUQw?=
 =?utf-8?B?V0hVUFVxMDFNWkhmcFhGVlJ1UXc3SWEzMmVlblNXNW10amRoai9GWCt0Q1Zn?=
 =?utf-8?B?ZDF1cjh0QUsveEVoYXBlMDlxZEU5dFZzWnh4aTBVeWVjbXJnekh1OEw5dHhD?=
 =?utf-8?B?T2toZG0xZWh4dGhLWE5nV2hPOXkrLzVhRHYxNnV5d0FhRTNkSlNPQWk0bVJ3?=
 =?utf-8?B?WmJtQzY0VzU0c2M3QTUwejFvOCtrOVRJVTA5aWYycXFrenFqWkFCVHVzNG9v?=
 =?utf-8?B?b0YrVHVxdnBXN0FtMi83dVVrSmJRVDhuY0YvVlU0VmdhZ2VnMmxnZUxsc0dX?=
 =?utf-8?B?NEFIKy84UzBnQUcwa3VhMzNqR2hhN0VEOVcxcmxrR1lkMTRXa3RFM29pRFhl?=
 =?utf-8?B?bzRnMURxU0tHQ1R2VktZc3IzcS9rMFNPMzY2SnJYWkIyTmVpOUhzMUZEODhP?=
 =?utf-8?B?SXNjVUZpT0tSUWg2UTc1RjdGQ1pVaS9jMDZXcUMzamJrY0orYmtWZDlNUjRr?=
 =?utf-8?B?M3Y3c2JZeVltc2E3eFZGMHpENENFUzJWaHlpQkpWVGNWNklFSHpwUjdIbkN5?=
 =?utf-8?B?eGdDVWVjNFVoVStqVGxqU3pqKzVMcW0xV0tCMjZKd3V0RnVzbVQ3SWZDOXRq?=
 =?utf-8?B?c0VvNnJnY2V2Y3VYQ2RjZFZxUjhzY0NGTGdEbXVlcDVGS2lHK2w5SlcrbEtw?=
 =?utf-8?B?T2NPdEkzTDJMd04yYm05amZWbHpUOEpxeEZwSk13QVFYNzAzR2U4Z21kMlJP?=
 =?utf-8?B?TDc2dUFEbXAyT0N5Qlk2NEhJckxpRTVzZDg1MDhEdlBodEl3TUgzMTNOTzYy?=
 =?utf-8?B?OUhKTnd1SWFnMHpGQ25OY3hyNWVNSjhzK08vMWFjcmJvS1Z2OGdpM29LREhS?=
 =?utf-8?B?Z0xFUzROc29zRDRPKzRwZ0w5dmc5VDg1TWxHNkYreVB6Vlc4dEFzUHBFMm1V?=
 =?utf-8?B?d3BjYjN0VVdXazFNNlFaWkZxaEQ5SGNUUUd0ZDd6clZlUmE4ejZtRjVuU0pL?=
 =?utf-8?B?N200WWpBcDJ5aEl0UU1nNzlvWHg2OERKWDh5ZHA0V2hJSkdVcjR4LytpQWxS?=
 =?utf-8?B?cVViVmlRZGhIKzNpeFIrZWU0M0xGRFFVano0UU4yVVBhZGVZeUtadUU2R3lX?=
 =?utf-8?B?aGpobVlzeTg3MkFibTM5MjhycmpOLzR4MFZqckoyaUhZMERwQ2dLV1lKUlVl?=
 =?utf-8?B?aGtQa2tFSVFuNDcvYkNKWjA3b1I0eVpYNmVjMVhvL1BHYUtsQzRaOEwxT3l1?=
 =?utf-8?B?Z0p5bVFKcnlUVXllSVBUWm44VnNweGJWSGxoa2w5THVZUFNJYjI5NHNIcmNl?=
 =?utf-8?B?UVhrbEgyTzhlakk4UFVkdU5BQ2R4U3U0bnBOV0xkWWhkOFZZY2NVSFNkR05a?=
 =?utf-8?B?WmlwS0crMlpweEp3cjdHNWdPVHdyZldTV0xZdzdhS2FrQWtIQ1lmTWtwa3Jr?=
 =?utf-8?B?UmRpU0MvN1FoWGIvMjNvL0hLT0hLd0U3RDVyaUk4R1RPcW1wbFVueHlTZlhv?=
 =?utf-8?B?dWsyRHhnQmo4a1E2K0tCdHlXT1A4b253ZHF0OXUvL29ZRjlkWnJRNEtLdSsx?=
 =?utf-8?B?WXNrVEhFTDEra29WS2owVitob1dOaXRRcGpqWmVNRU9lRDZiaGlKUnVtM0ZH?=
 =?utf-8?B?V25PaWtUWmZvUFg2eGpzMzBwSG1nYWx2QkVMcTVBMFVTeHhOUmRaN1gxMXZk?=
 =?utf-8?B?WkZYbXNITUovZTdGd0d4azQ3ZnNuS3FSaUFlTmp2NUNaU2Jpd2kyUm1nWGxK?=
 =?utf-8?B?eUNYd2pqSE5JVC9MakloYVZyaUhhV3o0cXJ4ZG5WSVBoejlDQTZTTzd1RkNQ?=
 =?utf-8?Q?Ca3sU4G2FPQ3Yc5rR7d2Hw52AyjLAy7bQEVXm3+DWMg6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4af3334f-7afd-47e8-aba2-08db40b1743d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 08:38:30.9065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rv6Lmk51nwVmaJIyYwkPWICKKnAhCzdP9YiilO299FrRqfXamc9BLxJeI7Msdst6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4427
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
Cc: Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.04.23 um 10:27 schrieb hackyzh002:
> The type of size is unsigned int, if size is 0x40000000, there will
> be an integer overflow, size will be zero after size *= sizeof(uint32_t),
> will cause uninitialized memory to be referenced later.
>
> Signed-off-by: hackyzh002 <hackyzh002@gmail.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 08eced097..c17b3af85 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -192,7 +192,7 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
>   	uint64_t *chunk_array_user;
>   	uint64_t *chunk_array;
>   	uint32_t uf_offset = 0;
> -	unsigned int size;
> +	size_t size;
>   	int ret;
>   	int i;
>   
> @@ -235,7 +235,7 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
>   		size = p->chunks[i].length_dw;
>   		cdata = u64_to_user_ptr(user_chunk.chunk_data);
>   
> -		p->chunks[i].kdata = kvmalloc_array(size, sizeof(uint32_t),
> +		p->chunks[i].kdata = kvcalloc(size, sizeof(uint32_t),

Again, please drop that part of the patch. This is superfluous.

Regards,
Christian.

>   						    GFP_KERNEL);
>   		if (p->chunks[i].kdata == NULL) {
>   			ret = -ENOMEM;

