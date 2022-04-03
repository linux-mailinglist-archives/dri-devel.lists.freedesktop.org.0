Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7A44F0A83
	for <lists+dri-devel@lfdr.de>; Sun,  3 Apr 2022 17:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D8D10E91E;
	Sun,  3 Apr 2022 15:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2064.outbound.protection.outlook.com [40.107.100.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4F310E91E
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Apr 2022 15:05:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AIBZwDzka8AZr3m/7chkV3JZYblsfTHzTnexFgWeJDOGRMmjKZCaLMociYcix6IlPiff0a4XLmPwVaHue13uoyiZbXVd6wE8tU85Gyf9HHOu0/PRAVXJdnvrxAxmDmO5aCE+rQet0iLgVdLcFmm5sERNgF7Yk3NJFZBJ4jbM7bgGi38bzH5VYkEv8Ix/nL3uEOOLG1iAR6Ba7NbG6S9mzFqJO2nhwdp4BYRZC5AIffSLr2TBIRe2iJip4Niu3RsOnCegBsYDAIC8zTZsR0xjfCMDdXKRsrNJpOqhQGdCMlHTGyMByJTglQpxBevzL8GaWVXFmAxzg4l/IxwAiecuFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/VMvSeij9hYWiiADNTHr19YYUqZEdL5d052zq9hS0Q=;
 b=B8pGCy0rnZAy/BuWDZKkcnXAqcb5ayDIShwMjyoJG2lJtBvtxjzQkVfcmCDqMl2kxbhkI0Fy43aEiX1Pv2gWBtqjZJ708VJ2sNaXCBNg2aS07L4HGxcBEmsw8o6EBrSsn8narH6NhhfgHFvclznTuWE+1Uw+CIo5zz4ICMaJg3JvHStgYCzYpmQxoD7SsQo09YW162sWjDAX0e4WZ7n5nh+NKNFFg8i4fZ+ijhE3YOz7/DhIseXcKN4FHl0MC8ykJ26qGGTUWaqnxnfX2xpsU3tCcK2wLiYkjwyoTGkmHkJPABGk9nEjwCLKAmRWU5iSQSeP3AamgdUTY/zf95RMOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/VMvSeij9hYWiiADNTHr19YYUqZEdL5d052zq9hS0Q=;
 b=OWVzaUWEDSBk2umTXt56UsBRGEFY2a1gbs6iNrHuaZj8MbGPqDK1UgGlSLaDYmK6xBEXGgk646bcpwcYdlhX57s6d/fVDd3pJtzSXE0hJ8v/Q6pZTxv5vbtHCeo3a62VuyZU2Ao8dgkrLxe2GvNKge+Z1oYdIONp7/lD3tePrpE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM5PR12MB1340.namprd12.prod.outlook.com (2603:10b6:3:76::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Sun, 3 Apr
 2022 15:05:39 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5123.031; Sun, 3 Apr 2022
 15:05:36 +0000
Message-ID: <4ca00dee-86b2-56b0-423a-76ef28260385@amd.com>
Date: Sun, 3 Apr 2022 17:05:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH next v2] dma-buf/sync-file: do not allow zero size
 allocation
Content-Language: en-US
To: Pavel Skripkin <paskripkin@gmail.com>, sumit.semwal@linaro.org,
 gustavo@padovan.org, daniel.vetter@ffwll.ch
References: <2d1f9ba9-ea2a-e41c-eae6-0ba348cdf202@gmail.com>
 <20220401213114.11956-1-paskripkin@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220401213114.11956-1-paskripkin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0011.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::32) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 197eb604-0bb2-4712-50d7-08da158367c7
X-MS-TrafficTypeDiagnostic: DM5PR12MB1340:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB134088964BD6B6253F6267DD83E29@DM5PR12MB1340.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gN3sQo+AOO+lTEoLmIdvH/QZj+wHT0F3lLfWrJBOB5pyGE83V/SaRK5A68xY7KQFFNsVSNsVgRSg87f8rWl3kV4CYzehWb0dbeB/iR5D62EJS0eo8Ku4dfTKA4+wdOkOemMUtbtrbn+Gy55PJjlULLm0z+Os/kFoDmJDOgtJuZ+0Z5vqGrYWRCPUbhEyOJg/9GUZ/1UYle2Pjcj+U0XyCHO65ZzpFE+gGCY+C7skfath/nk22b60hAo7mQ5cGZVt13ZGjwSWaOnnGeY42YESQk5IstrJHErWUGubvYyiUB4nyQc0eGWZltGtdgF1uXxqxsB93FbBkwr90f6q90gqTbWVlwD1HoNYq1KGc/1+BZSZoe74hgtn6h7MbQMHlTc12GiYZiFW7sYD2eiN4pxLBZraAe7xip8qvkMSvE9+4bEO0II+IityMdepsE2YOzgZJHU9HUS8Vhrw5S2gw5biMz6pPo/K9vAVCQpBqqwsPUzpGDl3xSVgw2/Uz5unMWd0Jn49b6M8QKUvcJZzO7exCfTH0YVJ2aNYU16JtlFyp5ey563espP8Vfq9ETTqT0iONjxc40p66Y6l8gXuW9I9HooHNmw+tvVg964VqX8jPgRSywIefur5fVyNEYdxi+CSm9IetFYof/zTlwx3aOaF6DPKk5RHdkCsAM1+N3kN5dnhSHyoX9qXAkRg/JAq0UyJABkQ7G9uZLNd+p42hgA+AZ+d7LQQ+3Ngr0u2T2bpby8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(6506007)(6666004)(31696002)(8936002)(6512007)(2906002)(38100700002)(508600001)(86362001)(316002)(83380400001)(31686004)(186003)(66946007)(4326008)(8676002)(6486002)(36756003)(66476007)(66556008)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1Bzcm1RQ0luTmYrcU5mNDNhbnZkRXRlRmdDS044NWNIVnRWVGNnRzJhcHJq?=
 =?utf-8?B?UDhBaUFVZDhicXI4ak5HVDRIMk9wd3NpUStqTlppblJKTVBlL1Qya1RDTmtq?=
 =?utf-8?B?TmVaaitJOHFZNlZXN1RZUUlkVnZXc1BwcHlLR1dmVlhCY0RzbHgzRnQwNXVS?=
 =?utf-8?B?aXNmdjRrakZQRndzYVFvbEFGRGdDYnVxRmdVWXBuUytEZkxvbDlTMmsrWVpq?=
 =?utf-8?B?ZWN3K0FpZE1CSEplNGpHK2V4QVBvSHg4QzRHTjFxWGRpMXpMNFNqUXFUbzRj?=
 =?utf-8?B?M1RnamlmMWdhK0FtMk0zd3dCUndNVkFOQlFrRXVUOGJrcUlrbDFJN29YTkFR?=
 =?utf-8?B?Q0dzUy9NMzVLT091RXg5RjNxd0IyTWgyMU1ucjdDazdXSEFVTU85dndMdm1i?=
 =?utf-8?B?bGkxTW9xa3VNRHRJN2hNTWdzZDA4TGtJQm5nSW94VzdmNytLS3BzMWhFdVlu?=
 =?utf-8?B?NkVQOGZhOTNvbFNmcU5IdTVxK1FhTTByL0NBYzJBZkQveDREZUpIY3hackMw?=
 =?utf-8?B?ZGRMV0tZOWNibFpoUG55Z1Z0TVUzM1JBYm45aEw4WWNod1pSc1B3REpXRHpC?=
 =?utf-8?B?NTBrU1NzUjlkWjQ0Unc2RDFoTUNsY1M5bWswTFgxdDdTdENSMzZGelJ2MUEv?=
 =?utf-8?B?QjhNclI3c2tMaldrY3NNU3NwbmNlZ1A5QVMwYWhJSEJlY0lNbmtmTXg3bndy?=
 =?utf-8?B?cU92M0VwcFVrVklqV3ZGcHlwZFdSOWx1cDI4R1ZZWFlubW5BWkNTTTFxdUtr?=
 =?utf-8?B?S3ozSHBLb0JwNEJOZEMvMmxVRHc3SER4enpwSzdVTEFHRURoUGtvVFJHeEps?=
 =?utf-8?B?djZUajdJU3ZZOUdtN2p1STZzUHdHZENrY0dwTWlqYm1tcEpjVjlhTUpRYXNu?=
 =?utf-8?B?UUpXSVdSWHVtRHkraE5GY3VsdmhGMkZIZVF3SHJ2NTBBUG1IT2JmRWwzTVox?=
 =?utf-8?B?SC9uT2hJakd1c2JpeEI3dzZBQ0QvVFNSekxCSWNhMDA0WTZjaHdBb0w5STNv?=
 =?utf-8?B?QytqdVEwYjZ5NHdaUHZSRjgrZWQrdU4xV093YVVJZjRhOW1SakVqcUtsRFhD?=
 =?utf-8?B?QXdjVU1nRlc4NFNkRExaY2lRVTJvaW5wY0llWU9ZTGVoU1g5ZEV4YVN0Uk5V?=
 =?utf-8?B?Rk42UTg4TEtKM0hVeUNzUFpBYmZMUC9BdlVtMVVxazFOQzhsZnBGdHdXa3pm?=
 =?utf-8?B?cmpyd01XcXpIeTNhSGxROXZnMkFxQVozOGF1bFEzQTNFczFNWGhQQ1pxQjAw?=
 =?utf-8?B?dEFzSGdxWURQR0VHOVJ0eHhtVXh0dlF4L1AvY1k2RWN4YmpuRURXYndNNldl?=
 =?utf-8?B?RUliNXNCRUk0VHJLQ1BHcDZoYmFlSVdRMks2RGNXaFVpRTFLSnFkNjA1bmlz?=
 =?utf-8?B?Qk4xNkxYWDQvSHpDRk9ubE9zSWw4T3p5dG9yZEl5aDlwMVdMM3N5REk4TnQw?=
 =?utf-8?B?RU8wVnAvU3NSTUVCU3VxNjhOL0dCZ2JJTFc3REltK1hqbkdRanFDLy9OVXdh?=
 =?utf-8?B?VTl3Q2k2Rm0reEpiVzM3T0ZFSmYzMzJGK1ZvU0FrajFPU0QxVDZ3TWdzdXF4?=
 =?utf-8?B?UGw5M0ZIUllpOHFrbkhWTWRvVStSZCtqaWFONThEOTNxeVlaQUpEb2NRMDl4?=
 =?utf-8?B?bjJRYlNwMk02N3JPOUJYK1VlbElTVG5ZRGtvaWUyWVFDSVN1NmVYN0cyKzBY?=
 =?utf-8?B?TXFkUjRWazJnMmZod2pML2VhbFJFekc1WnNnUUNzZG4wNThSL0ZGUllnZUpT?=
 =?utf-8?B?dFVncXozUEZ1MERoZGxJVis1b0Z2aWZ5WkVzQ1h6YzRwbDR4QTZNVkMxRWl1?=
 =?utf-8?B?dXVWMXRBVXJLWS9XN1RnaE50NUM4QlVHQjFyQXl4YkRSZlZLVGtLdWhVa3Ax?=
 =?utf-8?B?R2N5QXlXVHIzYmg5UWpDRnEvMUlLbnJJb3hHN3M1cHduZWEvYUZJL2FxN3gv?=
 =?utf-8?B?dnBUVVZsV0hBNFJ2MVcrTXdBaEh3djNPYitucTRKdW5NdE9yV25MUW5pWjNM?=
 =?utf-8?B?aWNSSVVwVWo2TFp0V2JGQU84YkdwV2JobzFDLzdScVgvSGJRVmRsSWZtMjBZ?=
 =?utf-8?B?YkxZS1hCMUE2VXpxRGFNSmp0T0NwVE81UitIeSt2b1U3QnJXM0ZLcGEzS0JB?=
 =?utf-8?B?MUJOZVBFdm83ajNSWEtaMGZDWlhJS0dndDJhZEpkc0JLUHdPbXZHQTF1Z1Zk?=
 =?utf-8?B?NEk4L2VOMkpicHU3Sms2US81NmVJWmpXWDBYN0pTdXJCNHpWcVUvV3phMjNO?=
 =?utf-8?B?SVpQVkVMSGtKVHpBN2V3blViNDhZWm13WnpVSENFeVV2dGhqMnpMbWdwT3RY?=
 =?utf-8?B?VHVhaEEvRWVaNklTb2lGOHc3eTdUTGRQWWo2Z3p0bEFzZDRsNzJWNjN1Qkd2?=
 =?utf-8?Q?FqSFabkKn1uDfffonHVn99RT3Y7M2yyCTVw2jSOLkxbiG?=
X-MS-Exchange-AntiSpam-MessageData-1: kgXcSlhZPHI0LQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 197eb604-0bb2-4712-50d7-08da158367c7
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2022 15:05:35.6267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3QkQKY2nyWvG2OI03JCKRAKTsaSopBUWkUPA0F3wFEEW8nXoJ2+7g4Q3W5hwmr8B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1340
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
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.04.22 um 23:31 schrieb Pavel Skripkin:
> num_fences is user-controlled value and it can be equal to 0. Code
> should not pass 0 to kcalloc(), since it will cause kcalloc() to return
> ZERO_PTR. ZERO_PTR will pass `!fences` check and kernel will panic
> because of dereferencing ZERO_PTR in add_fence()
>
> Fix it by validating num_fences and bail out early if it is equal to 0

Well there are multiple issues with this patch. First of all as I wrote 
before it shouldn't be possible that num_fences is zero.

We could still just add this as a precaution, but then bailing out is 
the wrong thing to do here. Instead we should then make sure to allocate 
at least one slot for a fence in the array.

But I think the cleanest would just be to not add a fence into the array 
in the first place when num_fences is zero.

Regards,
Christian.

>
> Fixes: 519f490db07e ("dma-buf/sync-file: fix warning about fence containers")
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> ---
>
> Changes since v1:
> 	- Dropped already merged part
> 	- Removed syzkaller's tag
>
> ---
>   drivers/dma-buf/sync_file.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> index b8dea4ec123b..024f22193e0c 100644
> --- a/drivers/dma-buf/sync_file.c
> +++ b/drivers/dma-buf/sync_file.c
> @@ -212,7 +212,7 @@ static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
>   	dma_fence_unwrap_for_each(b_fence, &b_iter, b->fence)
>   		++num_fences;
>   
> -	if (num_fences > INT_MAX)
> +	if (num_fences > INT_MAX || !num_fences)
>   		goto err_free_sync_file;
>   
>   	fences = kcalloc(num_fences, sizeof(*fences), GFP_KERNEL);

