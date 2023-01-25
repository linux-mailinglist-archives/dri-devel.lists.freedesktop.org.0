Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B4C67B469
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 15:28:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEAB010E7E0;
	Wed, 25 Jan 2023 14:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2222910E7DE;
 Wed, 25 Jan 2023 14:28:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HqRSXMc8ZzWdiPYtgjzCP0iOS3fuzeH8npNCRIva3NPgHmR8bSvkAjdyGB8YMQbMa+hl+bedLGKrnq/PqnZLSxtbkWsaGj/OROamv+DpVC0RJe8X6YCqI0g+Z7GqTmsHGtHKzhlaHDFp6HDjrnByCBfm0WLAqDMIsi+efjClk0o3qCQ1lphk4B3xnaMofWwHmmKPqAa6Dh1nwmaGf43w1jBHs2iPHrir0bLOVfKy7lwP52B1ix04tWTLj4BVov+fOTNtEjgRssROnQArWOzbfLuyxsCBBySevbI2562P8if7niRIMSqj96RIuEICzs4n57QjlWvgbEOXfzEIauZlJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VCsubvEI4v0Sr7N8cPkq7PSxsuH1iM5PReW9ZJet4BY=;
 b=hvA54jNQuOGaOcNjU8skfPdZ7H2gB+27VTsWbzDd1zNykBxWX8Ja2PDwGAZvkrdDsfJa1Fd3KsrPDfPIQhxm1adBs0t0O8GmePtTDjnHBR7MTNWDPFjF3F7IugQC+GVG0FdRCIDvwMDD4R8kioQnsYKiOUsdBlhcUg8CeUHeQBNdpFmgbte3SygkyAAVWdfNKn0Rzp3CEuWcfvr/WOrYyTq0/7vbgyJyQWP7e+5nqlc9Lh+jQnvyQ838UDekfx6t97JQ7w7392fJpdM9bVUMaTN9ZqhZ8N7w/mFNl+0LTRrQaLBkvhPzMspgZo6TmWhejADDkDSMqSFL3cVqiFWAnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCsubvEI4v0Sr7N8cPkq7PSxsuH1iM5PReW9ZJet4BY=;
 b=b961noEKagB+W9dLM8rF4tA1Dt/7eT0NHH9uw5bIlqFMKJg1Zoc5RBPSC8r9S5EnVc+NEnOExa1uXAC743KW7nzDPokioeyB0E5M9iLVI1qbggMwg3OlDb3kzwiUePXZ5s7WxRER1U+X/I6I3RqcSAq3NEP3LmxX4pXs0Z5Wm1Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN9PR12MB5083.namprd12.prod.outlook.com (2603:10b6:408:134::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Wed, 25 Jan
 2023 14:28:00 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6043.017; Wed, 25 Jan 2023
 14:28:00 +0000
Message-ID: <5c19a9c7-93a4-1bda-4e41-c35dd0c9641c@amd.com>
Date: Wed, 25 Jan 2023 15:27:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 2/4] drm/amdkfd: Use cursor start instead of ttm
 resource start
Content-Language: en-US
To: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20230125142415.18546-1-Amaranath.Somalapuram@amd.com>
 <20230125142415.18546-2-Amaranath.Somalapuram@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230125142415.18546-2-Amaranath.Somalapuram@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BN9PR12MB5083:EE_
X-MS-Office365-Filtering-Correlation-Id: 4544f4b1-654d-44ae-51fb-08dafee05c14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8YGrvBs92RAzxZ/N9jZAzdd91BFBQRFnpJj2OuMiUYbgDkD1CICdwLLyoPxxMsFcSQP/kFWzAHaUEByQLuGHla89LcnCM6wC28BMT1b6JoGdF8hdCKZd94f7YN+YozyZfLsEGqlNwmLvBQFMQtLoGdIcuAowgMMh8iy93Anq2Z7dewW+Uu2X2f+sLz2eguK+NSVTm71Fl6TuMmT6YFLUfx3x5nYC/DNgpkvDEtT12FxHgRGB+BYtDSzCli7YI6Dn0oHVCB4lvw5wTll2Qf1PhpTR12KB/38HZ5IrPbSEQZQeufscIjClNykIle/fJAKfgg+MfR/l+Y+CK63Rm7YricNN2+S38/uMBtYbrrYs1P5hSYHfhROCnbam7UKp7GNojFcPnAVFrcM5PkGy1hMDxpWi/cx1ISHLAluXzUwgXaoMjapPXJEyVGBbxWFMhd1ORC3Uo6c4ATiXVdhNSE97/h5XJj7r5+uzaSRMH6fmx+GusOeFUlfyH54jXAY98vwYlGzTVkf8tmnTFsOHuXSrKTxUMthm5SGysrY5V6GUhQMs33fKAGRLYa8Fu9/YuApVzKruQgYvtc9666VCXXpulYCAPj0ntsr4fExgsleMu98BJ/wRQRKfTpL/bsnHGu4hdQFK3/mpY403gFX+o23OcAN/1h8xRunHP2w0un3l4LVAqiEe+Nxhs4M3oMzIAKKqRHlKB/2cV724FlwQixnch1xb1ndzlfy4F7eQNEiMrTs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(376002)(136003)(366004)(396003)(346002)(451199018)(36756003)(2616005)(41300700001)(8936002)(66574015)(38100700002)(2906002)(5660300002)(83380400001)(6506007)(6486002)(86362001)(186003)(6512007)(478600001)(6666004)(31686004)(31696002)(450100002)(66946007)(66556008)(66476007)(8676002)(4326008)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QS94aWdzSjJPdURTUmUvUjFYS3dEMnhpTGdxS3VaU3pJb05rMVVUdnAzY0dX?=
 =?utf-8?B?aTZidEdLWDRCNDAwZTZrMm15MlV3TDU3ekViLzkra1djc1JzQzRBcy82b2Yw?=
 =?utf-8?B?UC83cW4rQVcyVS9NSXB4MVgxR1FHYWVnSGQvNEZNODNGQXFBSG8rMEZJTkY3?=
 =?utf-8?B?dXNpditKMDhuQUozV1Uyc3FUd0hyakpoS1lZOHNJWGtYUGhYNnVrZXo4WmNY?=
 =?utf-8?B?L0ZJVHIxeTJ1a3F0RnkzM2RqLzUydGdDWDgzSWUydEVQUytDYkpqNDdUQUxE?=
 =?utf-8?B?VFdRQ1MxcWg5UWcwdDVQTFBQS3VJNVI1bFhqaDJTRDhIL0Z5WkZHdVRHT2c4?=
 =?utf-8?B?OGdTdllLbWo3MDdXZnd3QjJWSStNdGQ2aThoSFpjOXdKaHVDb2dWRGdSVElr?=
 =?utf-8?B?Mi91SUdpRk8ydmdQeG56WGJLSFpvaUNYaEoyeGxqTHRoYTk3dDF5S0wvTDRy?=
 =?utf-8?B?RG5ub2JPcm5jQlJkUnhFVEQvV05RR0lFZTZSTXVRNURWZjZxYkcxd0FRcnRy?=
 =?utf-8?B?S3JHZnJpL3N1Q2U4UVhwRDNqY1FnbGxFekJzS3l3ckNQOWhFWm40MTRvaHhu?=
 =?utf-8?B?QkFVaFRJdFgwTUpQVUh3MlgxRFo1MVRmMWQwcjZtRmRqUVk1TlExeWwrdmUy?=
 =?utf-8?B?ZDNrSUlGZjJpSmN5ckpuRzJoaVV0dkpBb240Smx4Z3NDbFlsZmJYTVRIQjF3?=
 =?utf-8?B?ZUZ6RCtva0FFanNKWjZzZ2YyZzlzKzlySkp5QjhqenE1VjF4clV2U0lWbHY3?=
 =?utf-8?B?czVTdnA5dXNZelBBcFUzSElxSFRYR3lad2szSnZWbUx5eEtiTDhwNEgzbkNS?=
 =?utf-8?B?YXdhc0dNT1lZRWZQMWN4TFlRbkUzZ0dGTzR1bjR5VDBzellvbElNZ2VPVFR6?=
 =?utf-8?B?SUY2WnhkRXcydU51L0NEMWE1K0JNOGNNaS91enhJYllOZCtKRE1zT1hTQ0wy?=
 =?utf-8?B?Y1F3bHNpcjBzT2tKZHVRNlF2SEcrQU1mb3kxb3QyNnBnRER2bGM5aXhRa0NZ?=
 =?utf-8?B?d1B2eXJjbUNYTzdVZnFBVm0rWGh5UEtsVmZoNFptNXlTazNyK0k0QjJNRE1D?=
 =?utf-8?B?dzd2RHVKRXl3T2FmRm4xY3RMRWFVT3ZXejFxWEJXVmVjRlE4V3RVZndMLyt2?=
 =?utf-8?B?VE5UeUhtUlkxL2hLVmU0MUFzaURJUWdrODY3RkNCVHZ1NmpFYk5OTUtFTFor?=
 =?utf-8?B?VWxJeEJBby9rRDRqKzhKall0SEd6VmZDak5QTExuYzlZTkY4RHk0eVp6UDR4?=
 =?utf-8?B?eUVvUHRTdk1adHFjaU9yVlc5UFY5ODltd1VubDh3ZGtzSnpBUy9VLzFCWlBw?=
 =?utf-8?B?aHpUQjRhSGNaZGRtRXFMeTRtbzNNRkVobXNXYnV2dzlYc1FFcENkQmRvNkdX?=
 =?utf-8?B?SHRyUllHRDRxUnB6N1VkVkVWQnRpUGdRUmFqZ3ZKZXZYa25sbGxnUDJKcmEv?=
 =?utf-8?B?TDc5RnNYbzJPeVdYMUNzQVFTYmphdnFyNlBYdFRRT1dlY0VvYStVRm9HcGY1?=
 =?utf-8?B?YUpmYzIxaXhnK0ZCeXliTUE3djBEaGNFMUJnY2M2M054Z1pwcnlXdUltK1Fi?=
 =?utf-8?B?M01NSVl5L1UwSnJWZ1UvY1d5eTFOV3FtOWdUZ0k5VkdaSE5vODI2Y2Q2UTZv?=
 =?utf-8?B?TmhWSXdldlJ4cW8vQnFkTEE2ODFydFlmT29jT0pBYm9JVDM5WnZRV0wvcC9o?=
 =?utf-8?B?dG5hMHFEeUxPeDRHK0p6Ym4vR1N0MTlDVGk0alFKa1NIZG1UcHRCdXRIa2Ns?=
 =?utf-8?B?clFXb2RXZEpZSHZVaXJiVGNMdlphSHJ3QXVuanZqN0RENGZqSjdrTTVZSFZ4?=
 =?utf-8?B?SFZkcFptcjRST05qUFlnZ05RNGVpVzUwTzlOQXMrSHdQVVJRMldiTURqUDVB?=
 =?utf-8?B?TFk0d1FVbXJ3ZlZkQ3FoMmcvQWZkQzlYWjJWWWNUV2htRGlyQk4ybVp2YkZu?=
 =?utf-8?B?NnlpSnhpUzd0OEFHVUJITlBzTW1NU0lEaVRTMWpmNklucjFRVmlLY1VxVytj?=
 =?utf-8?B?M1Y5Z3FqMDNzT0tqUEt6c2RMYmVrL3RMRERXbXlNMFd3RzdRSkExOVF2VFJx?=
 =?utf-8?B?QjZucm0zZ2J0N3NmUVRSdG1iSFA3UXFIYzhsV2FwOUw5eHBhc3pKUEFNcmcy?=
 =?utf-8?B?WXVkMmpUTVdnQUlMWHQ4QVdQb01xd0VYQ1liSTRhUXVIYlllb2FZMkZweUp1?=
 =?utf-8?Q?yk8iCtVNqLT7BGHaDyxP7v2qPU8cg5CjfnC94psNygc3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4544f4b1-654d-44ae-51fb-08dafee05c14
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 14:27:59.9967 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qUN+TJ7BbGedD62ah00Aa+a/VZWkG2yFk6n5yZmpBSDnYrg4RNXbG8wSL4G5Ek0I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5083
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
Cc: alexander.deucher@amd.com, arunpravin.paneerselvam@amd.com,
 arvind.yadav@amd.com, shashank.sharma@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.01.23 um 15:24 schrieb Somalapuram Amaranath:
> cleanup PAGE_SHIFT operation and replacing
> ttm_resource resource->start with cursor start
> using amdgpu_res_first API.
> v1 -> v2: reorder patch sequence
> v2 -> v3: addressing review comment v2
>
> Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index c06ada0844ba..9114393d2ee6 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -200,8 +200,12 @@ static int add_queue_mes(struct device_queue_manager *dqm, struct queue *q,
>   	queue_input.wptr_addr = (uint64_t)q->properties.write_ptr;
>   
>   	if (q->wptr_bo) {
> +		struct amdgpu_res_cursor cursor;
> +
>   		wptr_addr_off = (uint64_t)q->properties.write_ptr & (PAGE_SIZE - 1);
> -		queue_input.wptr_mc_addr = ((uint64_t)q->wptr_bo->tbo.resource->start << PAGE_SHIFT) + wptr_addr_off;
> +		amdgpu_res_first(q->wptr_bo->tbo.resource, 0,
> +				 q->wptr_bo->tbo.resource->size, &cursor);
> +		queue_input.wptr_mc_addr = cursor.start + wptr_addr_off;
>   	}
>   
>   	queue_input.is_kfd_process = 1;

