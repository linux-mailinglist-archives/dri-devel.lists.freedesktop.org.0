Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A475720091
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 13:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB2410E66A;
	Fri,  2 Jun 2023 11:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::60d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE8E10E669;
 Fri,  2 Jun 2023 11:43:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sk5GH9QFaeQhwtPE6kGpsRuEgKxcfzuUSwKq0DLQzWTCSqYSPjPVaTNGUh06JBKDjs0yZ5ZhvkCv+KXlZLinbBC3ubqDmkWxKgX+zyxDaF4EXV2JunycIpeosj796RgRX60XpPAe3nAKByQawAzwlDnTSARdlXqkzrngRFTO3DBPujPmYL7wc7LZCLkwCG+NJpQPL5Ax8jNlWpHGw5L3K1XH5oRLzt4NWrmDT4ZC7WXoeVMrNAmER7pgaYBOiIJeDX1ia+qA2GFl9ioPKnyTJWbKmTiaxzsoixEV4u9CxtMgcmUmC8pNDYS8uJxhrfMrnqsV6SSrp53oOPi6ZdTwDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kC/LOxtxh9V9fdOG3rLeJhkntW3iN/b1C8xx1WdUXmg=;
 b=awTWX4FqRaMRUz4Kh4Xr2kbH+gKetE7WyHjEj3c7G46bneDykrvxViTxgA6AKxV1V6mcaq903ttLZkkx8id0rAfcirCpFOs+M3Hv3kaXXUkdAB2qyVefYzjd/c1TBe14BvRD3exkcVV1kfw1X9Qx/uj8QysCsL4zP5cIWsuvQnVbAf4h3AiozmEavlgBhy+Snhn5aVbZdhGpvMJPeEgtF/tcMaEs8mw/gki+EMUIIPISCs/oEgSZf5qL73nvxPC//pT21iWAnGLRovudRiaH/bpHv5beVFnumL4g8zcsT04Q4RQWXsvj2Rt/HRj5p5FdS3N3Ng9i78SlbDh6K+N1NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kC/LOxtxh9V9fdOG3rLeJhkntW3iN/b1C8xx1WdUXmg=;
 b=Ao1xvDdW1VmoQEQWApvmiPL/VqKOpl9Fq/yk7wLbaB0qCNfaEdRFMfV2DFvFVSmURZ8DmVEECQ+PaVywEbbtO75IlfktFE9NNTV6JM/LZaNHT6TG+6+9E9AM214w2T+zzO3kEPpFdlsjv0UfEoxgkCnK/ULEEJrM81FjbpWQksw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA0PR12MB8716.namprd12.prod.outlook.com (2603:10b6:208:485::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.26; Fri, 2 Jun
 2023 11:43:47 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::907f:26e2:673a:2ad2]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::907f:26e2:673a:2ad2%6]) with mapi id 15.20.6455.024; Fri, 2 Jun 2023
 11:43:47 +0000
Message-ID: <0e55585d-d6d7-b9ac-aed5-8df56895e209@amd.com>
Date: Fri, 2 Jun 2023 13:43:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3] amdgpu: validate offset_in_bo of drm_amdgpu_gem_va
Content-Language: en-US
To: Chia-I Wu <olvaffe@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230601224419.2392422-1-olvaffe@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230601224419.2392422-1-olvaffe@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|IA0PR12MB8716:EE_
X-MS-Office365-Filtering-Correlation-Id: bf1429fa-77b1-4ffc-63e5-08db635ea05f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /Vi7uKDpgbKfkxNk95eUAkUkaFsAAPbS20DlLEvCSNZ7ApCGbep14KwxucpCbQjrCIqnK/PNU0p230yLcnBnmGns8Wj8nBRDt1Oyl3xsDMrX70nDK43szH+PKA0O9l0aGQP6ELaxg5BBZAbsYddBUlcgcwpZZbo7KXVzyidZfpceJN7HeFrMi85AVY9tia1ThCfKPE8bgcVaoLldbbTEinnUGwfhj705noOCeO7r284Jdt6JaFV83nU3kUiFjUJEP92TpodSSNjrdeqQs3vpaFkv40ayKErBTfkEjB/LtdtouIyMh7BH3zQHTZ6ityLs4IXYPSf6hV9T8xYm0PulJXFzR4iAo2VwrVHZOjI2kH7qyjii3ONDCrM4Lt8cWPTT6AnikYbTN0XIL8LP7eZcAuekH3OuY0Pr2+J98Y7ZlJ18KiVmls9JYoZzQvmFH/OtEy2LkQPA+NXjvqlRH6upt/nJXGuFDEevF7zlgaonONeZeG9zqlLr00VWXHRK87YfQOJ60kIY3L8vkdUsdILGs29dmrxMf8+UacxJtX6FiZl3Kg+lP8zykutIOS8tv4I7JWNI3VKRcP3BvzCIrlrNqb3RgoPNIIN9ip85bEtiKr3R8A0XFmjh0ojhYjBcElM1+3Id/FNlvLuF5jGG3sCWbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(396003)(366004)(39860400002)(136003)(451199021)(6512007)(6506007)(66476007)(86362001)(31686004)(186003)(31696002)(66946007)(66556008)(4326008)(15650500001)(2616005)(5660300002)(8936002)(8676002)(66574015)(478600001)(83380400001)(2906002)(6486002)(38100700002)(316002)(54906003)(41300700001)(6666004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlZkSzFITkRMS21LYndxZ3Y0Z2hrN2t1Z29POHFtdzZXdE1XQ0o3cG1Gbk4w?=
 =?utf-8?B?cytVL2JZZUNUVXlLWHBrQ3JEa1A3V2tDQ0VobTNCK0VzNDBvY1hLYnB3QjFq?=
 =?utf-8?B?anRWRmU3WnhHWmdXaU1MbmM1NXBpZEVnNTg3b2RHbHdFZk1wbjlzeStHQ3R6?=
 =?utf-8?B?c3JDdlgrZGt1Sm9JZWlJY2hjK3EwWWNJUnNjOHVVQlZKVW5PeEQwaURDM1F3?=
 =?utf-8?B?YXcrejB5V3VhUzRUSmhBQWFVaXB3N2NLVTZMeG1iTUtkQTM3Mkdjd1hvcGJn?=
 =?utf-8?B?YTJYbEFVMTFjOFg5TlBEV1VEeHZSRC9HS3dZcE9PbzFQWFpSc3JIcmYxdWtj?=
 =?utf-8?B?Y0FLOUl4cWxnQTVJbmIycnIyeGVXbHNHM3orMk1kTUR2eE8xVUVIeW84QW1P?=
 =?utf-8?B?SHdUeDAzTGN3eW9hM3ZiUU4vVzZFckxJVU1IazR3NDdQbHVFeEFVWGhMY2VL?=
 =?utf-8?B?ME9kUmdRcU9HWmx0czRwdGo4V2RJckhpK3hHQ0VBNy8wRnFINlZENkRBUXdF?=
 =?utf-8?B?QnZVUWZvelptdGs0bXZhUHRCWXlmaG4vekJEcDNSVkk3SDgvV0VKdFVvenF4?=
 =?utf-8?B?Mnl5R0IwT3BUaGw0MUJqWDBCTUdPanNwTWcySFdaTDdrMzhGRFNJdWlvWDFR?=
 =?utf-8?B?Q3J4c21pUm53U3c3NG10OHlEblhNZlZYL2tVMWJHR1NReVNEeFlQd2hackpa?=
 =?utf-8?B?U1pHRE9EcFJOQkpReUhucm8wWUE2NVhkR2tkQ1RiZHZEb0hIaUppbzk3U25u?=
 =?utf-8?B?ZzUvZGduajBSbGJocmVIVXMrS3lFRE9KSk9ONWlqSGZqaDVSY1o2ZGZnejVz?=
 =?utf-8?B?ZlpRNFprM0pPcktFNVZjSWJrYlp6MkI1KzNGWHhIS1MrR0dkaUFPRmd3NFlR?=
 =?utf-8?B?eXRwdzFEZVU2TnBXZFNZOWJ5RUE2cVJKZnE3dDlpZzExWU9oNG51UURLa0pP?=
 =?utf-8?B?eDJiSVJlWkw2ekxFRFZsdjlXTVBRdHA5YkZudnhaUDRLOGQ4RmRUVCtQbzI4?=
 =?utf-8?B?ZTFzL2JWZTB4K1VYVHNvcGMzUmlVODFtZ1lIR1RXS0pjZFNsWWVUNjhEWEZT?=
 =?utf-8?B?VytJV2lvN28wazBDOGFFTzB3Wlg2dXFxckxOZlJQOXF0YmFpeFJTaHo2YU5m?=
 =?utf-8?B?a2Iwc1phWW5aTUVJMEMyT2dJTW9TWDRvT2ZNNU9leG9mcXEraXV0WllyK09Z?=
 =?utf-8?B?SVQ0WHZCTHRVLzZ0SFpEYy9BSGg3SFNBMzh2U3RWV0c0aWpUV3l3dFM4RExx?=
 =?utf-8?B?NEhjS2dSSC9zSGd5OGRjRStFRTlIT3dva3MzV0E5NVB4QzB4dUpFZnZqeDhJ?=
 =?utf-8?B?WXFIOEkvclJ5NTNvYW51ZmtTeHpVU2FObG1NRTA3dTQzb3YwdDVOWi9lQ1hk?=
 =?utf-8?B?UEtpMlBaMWhLOG96WDJXOG9ndVF0VWJYbDB6WXBneGY5NHl4ZkpwVG1FaWc2?=
 =?utf-8?B?dUJkL3Z2em5pYW56cktvTFIwVld0UHMySHNWbUltSHN5Q0czTXY4Y3pBcnNH?=
 =?utf-8?B?SmNDbTRXNmdYUGN4Vzd4ZE80ZkJLOUNyNll6ZlJYd3pwdTVwRVlyMmx1SDRS?=
 =?utf-8?B?NFJjSkZ0TTVZT1cxbERaS1REVk5yRFZOUE5sTnNGWmhKYjR1Rm9EZmxvUzNI?=
 =?utf-8?B?ZS9wYyswTXFxSTgzM1phVmkxM2M0a0dpdURiU0Zhb0plLzhvVDNsSFEyd3Zh?=
 =?utf-8?B?TUhzNzRjS3BKWWwyR3FaTXBtVzVSKzBoQnZHWXJmTHlNVEpPNWYzSldrS1Bh?=
 =?utf-8?B?V3BxNXNIaEY4M1p5dWRyZ05hb3ZDakoxelNNUVlBQ0huZlFGTGxoSmYzcWhU?=
 =?utf-8?B?VVRHc092Ry9hUForTmorZkVyZHdhMUVFLzdYZkRIRjBwK2tjano5Tmoxd0RO?=
 =?utf-8?B?RnJIVUloK0QveHZxek5uTnpuamZ0RmJhZkUwZGg5T1pkYTJOS2NiaXNUUmpD?=
 =?utf-8?B?UXdHdGRwZVFHVURzcVBpRlFjTE1yOUhQTGt4STNjUDdzVVVPU0xPcTJBOEhw?=
 =?utf-8?B?c1lGMmlFdHJ0YU9MNHJOYlNOOXp6dkM3N1RrSU9ycCt4MHJHZ3M5bHdSWkpp?=
 =?utf-8?B?ZDVNQUNBVlVnTzdtZ0VYdkc3V3F2ZEU5Z0ZDbk85OFduUUlmYVFFanBtVWJr?=
 =?utf-8?B?ZVJ0TURZb3ZrMlpKS2xTL1hJNnpCbVNTdGk3QzZQcW9SUHgwTThBR0dwVFhm?=
 =?utf-8?Q?b4Os9kXqA8VIp9VT69ZPYPe4WGGegH/lyEXwLETKWwJ7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf1429fa-77b1-4ffc-63e5-08db635ea05f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 11:43:47.4184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V+kmvz2YylqPCEC3ShhMkRYdTXWzLM831Kjf3OylkGHUyg+21zmxCGkLOOCnFe4g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8716
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
Cc: Philip Yang <Philip.Yang@amd.com>, Jammy Zhou <Jammy.Zhou@amd.com>,
 Mukul Joshi <mukul.joshi@amd.com>, Lang Yu <Lang.Yu@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Danijel Slivka <danijel.slivka@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 02.06.23 um 00:44 schrieb Chia-I Wu:
> This is motivated by OOB access in amdgpu_vm_update_range when
> offset_in_bo+map_size overflows.
>
> v2: keep the validations in amdgpu_vm_bo_map
> v3: add the validations to amdgpu_vm_bo_map/amdgpu_vm_bo_replace_map
>      rather than to amdgpu_gem_va_ioctl
>
> Fixes: 9f7eb5367d00 ("drm/amdgpu: actually use the VM map parameters")
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 22f9a65ca0fc7..76d57bc7ac620 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -1434,14 +1434,14 @@ int amdgpu_vm_bo_map(struct amdgpu_device *adev,
>   	uint64_t eaddr;
>   
>   	/* validate the parameters */
> -	if (saddr & ~PAGE_MASK || offset & ~PAGE_MASK ||
> -	    size == 0 || size & ~PAGE_MASK)
> +	if (saddr & ~PAGE_MASK || offset & ~PAGE_MASK || size & ~PAGE_MASK)
> +		return -EINVAL;
> +	if (saddr + size <= saddr || offset + size <= offset)
>   		return -EINVAL;
>   
>   	/* make sure object fit at this offset */
>   	eaddr = saddr + size - 1;
> -	if (saddr >= eaddr ||
> -	    (bo && offset + size > amdgpu_bo_size(bo)) ||
> +	if ((bo && offset + size > amdgpu_bo_size(bo)) ||
>   	    (eaddr >= adev->vm_manager.max_pfn << AMDGPU_GPU_PAGE_SHIFT))
>   		return -EINVAL;
>   
> @@ -1500,14 +1500,14 @@ int amdgpu_vm_bo_replace_map(struct amdgpu_device *adev,
>   	int r;
>   
>   	/* validate the parameters */
> -	if (saddr & ~PAGE_MASK || offset & ~PAGE_MASK ||
> -	    size == 0 || size & ~PAGE_MASK)
> +	if (saddr & ~PAGE_MASK || offset & ~PAGE_MASK || size & ~PAGE_MASK)
> +		return -EINVAL;
> +	if (saddr + size <= saddr || offset + size <= offset)
>   		return -EINVAL;
>   
>   	/* make sure object fit at this offset */
>   	eaddr = saddr + size - 1;
> -	if (saddr >= eaddr ||
> -	    (bo && offset + size > amdgpu_bo_size(bo)) ||
> +	if ((bo && offset + size > amdgpu_bo_size(bo)) ||
>   	    (eaddr >= adev->vm_manager.max_pfn << AMDGPU_GPU_PAGE_SHIFT))
>   		return -EINVAL;
>   

