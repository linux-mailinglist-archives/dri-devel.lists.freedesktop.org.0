Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAED7830168
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 09:40:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F38C10E62E;
	Wed, 17 Jan 2024 08:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5A010E635
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 08:39:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJFZmthOUwSsqcmX9uAmdNXGIrR0ECXslCQNfjvmsV/UmnaIDzq8t4UuoZ9qDleYi/l4J7ouhU9pLY+RjNtHLw19LBTKg+C9h7PPz8ZCinkaTtGjC2K745L29TtEBLOgk0iZr+JTi5UeBRYIxEMNs5XTEH+SpYwnX82KweBmA+aNN5b640dtgsGfk+tkWHvhQGMcf1jnmjxwxGxl/kPOOEbHS13GmZmZ9a7ZIozwQxtkPy4dYf3tu5f3Gck1x8Rw63/AyBzSBWoNs1I+s3bnrLipin/wZtwWujRmgCy38MeWLeoHfSO6PqtQ4jBKQLLQKkxUD19lwtRDHBY7mM5OgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tOHrud/p04aBBnM12wpW/qDxk72i938avLGujyHOyvU=;
 b=huIRiIit/hKc61Z6Dhq6FcHoIJpykK1BGV3okpmxLssRHB5HxzpVnt64O86F7WAh+w4z8GZPY/wF8z4HdrWeg7CpNHE1D9lcxxDqqOccyrEXpJRxetAIn6H5zypLO0q0hcWGUx97HZXt3sxI0qzXGO/cEF5at30/DH8mcDuNvShrbzB/DbiRZ/E3HdOFV2S8uJsLvvRwGIxCOGathDPLEivkOOroRIS6OrvJHc36Nn/EQc1H0rdUPdpvripL3QmMb0E8tpFUMm0oZHnYs1EEKdo8SPSErL1yBwg53CFL/6DRjSk7mH5Qkn3mqWJfj3aAoC0dGaBNy/VMc8uHv8VBww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tOHrud/p04aBBnM12wpW/qDxk72i938avLGujyHOyvU=;
 b=zWBWcJy/EcGTn+EDFHyTG0tpd97RM1fBbRX6FLWCY4SI5OgaodL9JOB0AOzDNdXxgSAkKbN9ATWMBoHMLPBQrWWwFgIBhOce6Hvl6xseH5H/UU2Lq9bxHaMqSyGTjWlUl2rlfz/HCexgz06pHRX41ZTr5a+nrIOK35hyhCsk5kA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN6PR12MB8472.namprd12.prod.outlook.com (2603:10b6:208:46c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Wed, 17 Jan
 2024 08:39:52 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7159.020; Wed, 17 Jan 2024
 08:39:52 +0000
Message-ID: <ea56ce2f-c86a-4a87-ba37-19079713cc2d@amd.com>
Date: Wed, 17 Jan 2024 09:39:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/ttm: allocate dummy_read_page without DMA32 on
 fail
Content-Language: en-US
To: Yangyu Chen <cyy@cyyself.name>, dri-devel@lists.freedesktop.org
References: <tencent_53C5DA6E8E55B80731AE21328D037C908208@qq.com>
 <tencent_8637383EE0A2C7CC870036AAF01909B26A0A@qq.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <tencent_8637383EE0A2C7CC870036AAF01909B26A0A@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0241.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN6PR12MB8472:EE_
X-MS-Office365-Filtering-Correlation-Id: 40f98b9c-a1ba-4bb5-18bb-08dc1737dfa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d74Os38+a0U8crBUkGV/q8JsEloKaQVjd+auQ+kV75KQC2+VfoXuIhDu8D+k4Pz77zT1t6058aaDrJGotdKZYJRgmhvooz2sbS2mNdK1AqzQ2V2r/li2vrS7C9e37xuOidoR92zV2MJFgWlSAMf8klhs8R69szhbkiaFys3Pij9f6OtVNJJc2hUt2JMnMN257tG35LQ/GdkNdMudFg5l/2eN33rA0e8wp5BSu1yVDI5NaRGEXZhJZ26MYahjpWk06RXOoU5xHa4vn9zviPh/9lphXI5G3rD0Be4qGZHxk82FGtMDx2ACFOt5KMjEgU3OWNiBLAxQ/+yDTXEC+qZXc0/LC799XgDAmkWl8oKruayoGfUrdVZTGBuUiAYoTV63AYtfEkjcdzO4YVFqf+3ff3ja6OojqcCuDAX+k0eqCmXvDXPGl7d1zbnmPoPEk0AdwptCE+rKtzCuwVclqfYUqmGfexTFx0QXbrbkhiQhq823RriSrr7+UCicSHP/mlZ0XM38tTRCKRZb3acrwIdzdW7BoByM0F4P7e+lOf8cgdeG7SW0kSY8lDy/pkp2Y+STxxeN3ZonNS8EgeToYe4v/vtEuaANB9w73wUeXLNnCpIESrv2w9jJ93DpUtII9HT9RG/Y0uL8CT5wJiswsvZS/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(39860400002)(346002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(4326008)(66556008)(66946007)(66476007)(31696002)(5660300002)(7416002)(316002)(86362001)(8936002)(8676002)(54906003)(6486002)(36756003)(2906002)(41300700001)(6512007)(38100700002)(83380400001)(2616005)(26005)(6666004)(478600001)(6506007)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjkvUFN4NkhHVlNmZmEra1Jzb2ZVS0FxWjhBeXM3UHR5MTFxYmRiRFBYTU42?=
 =?utf-8?B?SU9lWUJMb01xR0hGRUVQS2cxSDZjNHZNWVFvRDI4bHBSUVpxM2JwQjVjK2t0?=
 =?utf-8?B?a3dUSUZDVXZoRkx2ZkQwTS9reFV2L0RCY0FHejRDRlh4bFlSclN1MEoyUE1N?=
 =?utf-8?B?ZHpHZDNuN283czYxdGR5eFZwa0QxbWZIZFdVWVRVVTVmQ1cvRUdjOFJBNjRn?=
 =?utf-8?B?R1N0U1FLL2N4WnE0a040cWY3a2Q5aEQwM1Q5b3I3akxXcDZQNEFGUjFYRlQ4?=
 =?utf-8?B?QXh4cFhvQ3Q1QW53SUUybmFlek1RNk9BTzR0QmZ5dkVWa3ozNTFPUFpINEp6?=
 =?utf-8?B?NVZrYWR2VFp2Y01DVld2WW1NaEM0Qm9UL2RxdHBzRzA5TzFYQUdyTFNvNjdB?=
 =?utf-8?B?anhCMGx1dFlhcVVzRUtDQ0ZaKy9JTWpyUHZuQ3BkTFZLbkpEK3lra2NnRS9o?=
 =?utf-8?B?U3Vidk9wV0JLNWloT3RXYXJXcTR0c0o4UnZEOGJiT0IycGJjUmdFbVVOcFZk?=
 =?utf-8?B?SDRZekdQWmU0Y2dOamFtK3RWUDBOQ2VtY2hyRzEzLy9QNlFYVW9SUW5QcTI3?=
 =?utf-8?B?TThobW5jMUk3Wm03ZytWTmpQbVhGOEhyRmI2U3piTzliR21YRHZ4WkM3ai94?=
 =?utf-8?B?V0UxdS9ReUx1dHBkTit6c3JIZVA4eTBOZVFMd2d4K2tLRjZiUEh3eDFFckNv?=
 =?utf-8?B?SHlucC80dFB2YSsxTjJDaUVQWjdEU3kxcXdvV09OeFMrUGQ1UEYyVHQvZ2VQ?=
 =?utf-8?B?blNTOEg2RjZESlR5MEdaUnBQbjhHODJZMlJhTFVFZTJwVlp5RWJ2ZENGV05P?=
 =?utf-8?B?M1hBczlTaDh4WlptNEZCSWxKZ3djLzUwODJkMStiZmFWVVRBZXZJNHVHRUht?=
 =?utf-8?B?UUtXM1hRbndYdHptZitkN3kyNnFmSmlvWTNSczZqbktjSEpQRHA3WmdFUjFh?=
 =?utf-8?B?QnA2NjR6bFdJZkI2MkVKcS9PSWVQYWVvdUtRYWt0Z3VaU0wxcVVHZVVMaVl0?=
 =?utf-8?B?a0FkR25yUENUNHc5bUd6ODQ0Tm4wUy8zQjF2NThaenhORlhRbVBCNkh0VGR5?=
 =?utf-8?B?TThDZEgrSFdnT0VYRmw4T2pTS0JCZDVYU2R4TTd2QWVQbjRwUGZJWDJQWGlI?=
 =?utf-8?B?ZHZBWldFSEdJV1FWblMyUWxMWWRMKy8wbjQzcCt6cVFWb3JpdDg3MkJRWWVy?=
 =?utf-8?B?WUlFSWoxNFdMTDFJNUtOK21sOFJLK3VqeW10SU5Jc2ZkeFhlU3JiaG5wZi9B?=
 =?utf-8?B?UDBlaFJ5YlJmWEpxdHVOTTRzM2ZjZWoxMHM4ZUxKdG9ORTR6MTZCbmM0ZDlE?=
 =?utf-8?B?N0k5VEFWUnl1NlhrdUdCUzJlNVVHQW9paDYzcHBPVkJmSHdzcUdia1FESFJh?=
 =?utf-8?B?MHdEbkRoQ2pNRm5SU0IwUTJqRThVUjlFckhZQkoxR0FLcGxodjlxeWlXNzVk?=
 =?utf-8?B?ejlSWFdLWmlMcUY3OWJFUjJQZ0FaYW5TOVIwbHd1QzBmZ0JoVm16MEQ2emJC?=
 =?utf-8?B?OW4zZU1SNXVpbnpMclhsM2JiRU1qUHpDaVE0RmVDODdIWmFJdzI3blI4ZFA3?=
 =?utf-8?B?SDFoZ2JENytRKzZQTzFFdVdVSHg1TVBXZVQwNDF5Mnovb2NnUkFKM3E1amx5?=
 =?utf-8?B?MldHNlNxc2ZjTStqWGtqQnBEREllNGY1MVJOSlVQR1BLYnIxdEtaaWZ6Y3Nt?=
 =?utf-8?B?ZmcyWjJiWEVwRVU1d0xrM1F4UXdQTzM5MDZrT2x0SkttdUxaRFo4L2lEWXRh?=
 =?utf-8?B?VW9rYmxpempkbVlmSmg4Zk9jaWs2alljSVM3Wk1LOUFweFkzU3RaWDA5TU1y?=
 =?utf-8?B?ZktUSklJd0JHQnpIdVNPTUJhaGtGVDRwU0xyWG5yUCtYL1V4a2crS0ZDdFZZ?=
 =?utf-8?B?ZFN4eGFkY1dQRU0yMytaVnhCR2FCUEd6UDUzdEJyaWV3YnNIMFB1SFNXcURV?=
 =?utf-8?B?N3hsRi83cUg2cUYvVk1wS2ZCYUlrMkp3QWgxSWpsM3RRamI5NUhNeEhoaWsy?=
 =?utf-8?B?L2dSbGg2NEYrNTVVaGlvZUFkSFFyN0dIbmdUMVJwbE52MVVIMmJDTmdTbEZl?=
 =?utf-8?B?OXViaVh2S2dmWkpVemdBWWtsdjc4am9sbjFYTFQxMXJTRi9yZ2pNbzgrN3ZP?=
 =?utf-8?Q?ZDJIaS5XqzcAQz50dbe6aDrmM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40f98b9c-a1ba-4bb5-18bb-08dc1737dfa9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 08:39:52.4211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B3b+UhpbYvzDnBfNVvPo1USSlaAHVAYoh6vQ/v4I4i/Q/tFd/tklDCIhrJLjcFD+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8472
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
Cc: Daniel Vetter <daniel@ffwll.ch>, Jiuyang Liu <liu@jiuyang.me>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Huang Rui <ray.huang@amd.com>, Icenowy Zheng <uwu@icenowy.me>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Yichuan Gao <i@gycis.me>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.01.24 um 19:50 schrieb Yangyu Chen:
> Some platforms may not have any memory in ZONE_DMA32 and use IOMMU to allow
> 32-bit-DMA-only device to work. Forcing GFP_DMA32 on dummy_read_page will
> fail on such platforms. Retry after fail will get this works on such
> platforms.
>
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>

Reviewed and pushed to drm-misc-fixes. That patch should show up in the 
next rc and stable kernels next week or so.

Thanks,
Christian.


> ---
>   drivers/gpu/drm/ttm/ttm_device.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index d48b39132b32..c9fa8561f71f 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -95,11 +95,17 @@ static int ttm_global_init(void)
>   	ttm_pool_mgr_init(num_pages);
>   	ttm_tt_mgr_init(num_pages, num_dma32);
>   
> -	glob->dummy_read_page = alloc_page(__GFP_ZERO | GFP_DMA32);
> +	glob->dummy_read_page = alloc_page(__GFP_ZERO | GFP_DMA32 |
> +					   __GFP_NOWARN);
>   
> +	/* Retry without GFP_DMA32 for platforms DMA32 is not available */
>   	if (unlikely(glob->dummy_read_page == NULL)) {
> -		ret = -ENOMEM;
> -		goto out;
> +		glob->dummy_read_page = alloc_page(__GFP_ZERO);
> +		if (unlikely(glob->dummy_read_page == NULL)) {
> +			ret = -ENOMEM;
> +			goto out;
> +		}
> +		pr_warn("Using GFP_DMA32 fallback for dummy_read_page\n");
>   	}
>   
>   	INIT_LIST_HEAD(&glob->device_list);

