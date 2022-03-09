Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 107EB4D3C03
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 22:23:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9CF10E459;
	Wed,  9 Mar 2022 21:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F1210E459;
 Wed,  9 Mar 2022 21:23:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ofroAwClAg4mW2hW0MecwjkEqNlEJMGh35zZ3Y+ZG6h+O7R3Ku9PUT6XS4OpdiWWypXslh7JKGCC6MQOLOODXs6xAL/p1E1JJQyV8ncYmWE006Ap7wXBwNx8iV3J1xIFcvl1n4hHACUkp2exc14jzBkVzUfoYBDnFEwDaWmffi4rhMkbyEJwbSqgF7gMI0VPsF32oMWj5wn/QReqs8CF8DsVb3ociVwFlMwfv7UdVcBiWjYQdPjXekxwO1GEg0bGz6roAVYUfkbBCL7QgKHG1bdqdz8erIo2h9fonN1+V9fT7o4E2QX3fnXoI4aNXXRFMcOuE/IANSDd6HuSO1DOpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XDrh/9vc1SnT/iwrx0Udb7kSp434mItsxQa93yGGl+o=;
 b=IRxrlcF7ySPahGaBova2d7WK7+ccHLaBDiuhphgHnMeN1tw/d5ZAA8bbgTWkUFoHLvnp5QRLkBMUULgS6LMs+iRZl2pqvNmrXyyK9jl0JLqfNkcyj87VJgFqoX1tC+pkf1ZDhcGzagW6aeJJtJgNP7a6WYcSqgV52B1p0R799+UiOi0BH/cCxaCcsl8KknJGKBGPUFMqodxpkPGRFZEgw8KcPsnK2d3VeuRR8GoR/IYnhb2Oq+sBHAkUAGalh4z6WJHq6jrJHSqPNcZRyjeqxEEdGMZQ3JKasO4950VeFDOtUpH27fb4emmZtzcdTXM9YvbN39S2kFKAlnehflbvJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDrh/9vc1SnT/iwrx0Udb7kSp434mItsxQa93yGGl+o=;
 b=tTzxguTeq3ypYOTE3uo5lnE+vHVq+EzpFVCl/VF0GqlHEHOlEG7zYB5ChxkLRK9/pnZuEzRmV8tijuSlcJ/ID6VDL+xJqp9U+jX6FMRve8YI8P7GaueU89nuL0Y998p0bZqRKW+ORPd+pBJbaovOuDszVTOErHkSm1oDs2KM3Bw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BYAPR12MB3447.namprd12.prod.outlook.com (2603:10b6:a03:a9::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Wed, 9 Mar
 2022 21:23:07 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::b030:b1ba:4eb2:7fb7]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::b030:b1ba:4eb2:7fb7%6]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 21:23:07 +0000
Message-ID: <3e6eb8ab-57f9-8118-4d80-0db0b51e7786@amd.com>
Date: Wed, 9 Mar 2022 16:23:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] fixup! drm/amdkfd: CRIU export dmabuf handles for GTT BOs
Content-Language: en-US
To: David Yat Sin <david.yatsin@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20220309212031.3063-1-david.yatsin@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20220309212031.3063-1-david.yatsin@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0099.namprd03.prod.outlook.com
 (2603:10b6:610:cd::14) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95d414da-e9a8-4790-de7c-08da02130102
X-MS-TrafficTypeDiagnostic: BYAPR12MB3447:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB34473B41520A9A2CD26D16B4920A9@BYAPR12MB3447.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EucZ3399XOMG5MYYdKzKWGahdBS7k7RfQ1nGKBII7mawSDYxnKjzcecSwhZnUHpN4Qc/egMgRst2m1skWpVepHlVoEbnkmKCVoaKL6mKFZa2FvCiuyvGmh4N9XLhcbavpOKs4WE3RCFpiPUcNfVFrKzCufKcAcw3fDCjB9/oL30+ZUKcxFcghKdIv9JRNPgvaTd4ZhAsAymzkqC2/xCYb3cHioCCmN40mi5BVAp/gkgkFYz8qTHreDGLufsd9WVsU7OslirrZLqXRI8ZfE/K6gjmzC0f2/9+eS6NyxeJ9HKD618gAaK3Lvmcn1AvaZBAI1w2j5SGYwzhO+9pdnkbqhN6o14hPSk2X5u9n+pweIQ+7Q/338A1AwQuT0i7rGaqAerrEejI6/ZFSMI9xl+aJmVj6h58q8vS9bQuycyOVoVeWTGtrw2gAcopSCBXYG/z3Oh3Fk+YYjEqU1eg/kf53aSwd8iz78xS5xaXxlWjFhq+i8HN1dWzLpl0kOo+f4wMj2g6NKxL4+yCgOdIXE7PrtG7+DFSmDOgMtkag9PN92frMDmvNzf4huAB1uCmKUPM5YB0FRkHdYGwqA8Ylw4ri8cVZcspdeVCvRiUuqSCmb4STgcIHtE79xfjqtRkc20wc6LuxTulTzvtg74eXTMVaaEPBeU3YWOd0zFEc+wHSwBU+DGuss/3fbBwiqK0tr/ekJVt8yaImj0pr9M2EEAguy7nLUY1mOdE7JQSB8lTD5PcTCHxCwDqVGU1BMU0Kkc0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(508600001)(31696002)(6486002)(36756003)(2616005)(26005)(186003)(6512007)(6506007)(53546011)(36916002)(31686004)(2906002)(5660300002)(4326008)(86362001)(66556008)(66476007)(8936002)(44832011)(66946007)(38100700002)(8676002)(450100002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ykt1aUVLZGp3RFd5bVdZNkZNT2M1aXpSQTFZQndNWkJ5RVFMTnNBeElKZ2Fr?=
 =?utf-8?B?LzRnc2t5bkRuQzhVZlpDQTcrQ0RZVWlaNTJMcHkrK2RFTW80ekpjMVpvdkRL?=
 =?utf-8?B?Y1FuT2l2eW1oTFhkY2gvZDVmOHIyV0xBSmtNNlUvSXZDNTYxNDJ2bVBpbEJr?=
 =?utf-8?B?bU5CajdHRUdoWjgwRXZEV2dOV0MrK2Zta2JkTFpSRFVuYkhxbEdWekh0dU8w?=
 =?utf-8?B?b3JweFpGNDE2R0QrUHBGZVZ5TW4rVEZ2RFN6WGpkdWd0bStHb2VhVUdpejlj?=
 =?utf-8?B?ejdZWExHQ25LNkp4dkppS0xWbFRGYlBOZ0tTZFBYYU5SbGxoQ0Yzd09HNGFj?=
 =?utf-8?B?ZTUxQzBwU3MvYWcxczIwcXRxT204MG9TTWVOT3VwVm16NXNlckhSK1ZtVk1h?=
 =?utf-8?B?bjgzSGFSQ1hKV3lqSFE2cHFPbXJvMWQzeGlJeGMxaDBJUmQ5TTNRbnAzaDNV?=
 =?utf-8?B?YTRjL0NzYkhTejNwdEtSNHA3NjdxN05PSk5seFdKNXE3Q0xqQmZ6ekgyWEpC?=
 =?utf-8?B?bEt2cFdSTWVSSXVsUE9STFM4ZWp1bVlMaFE3QjhmSzk0aUhJc0xOcmpGS0h6?=
 =?utf-8?B?dXdrVkpMSWI0d3NhVG5GSURTRHRkL3o2dnRjNUZJZndqVGk0Z1BOU1g0SmQ3?=
 =?utf-8?B?OWxiOENjUERWaFJDbVJReWF3YUpHdDYvMmJUWm9wT1l0dmV2ako5ei9IU2JE?=
 =?utf-8?B?OThSVGJFRnhsckFLOTdmYVZja0lOa2s2TkJVSERPMjkwZEF3eHc0Tm4zSHRM?=
 =?utf-8?B?NVhKSWJvZHA2bExXVGxxUmtwaXVFbTRFLzN2K3lMV2NsUjlMcWVPdTE4Y0NI?=
 =?utf-8?B?WTdLUlJ5SzVxK2txRXJEbkY0UGk5dTZVVjVnK2RWdUR2ZXByRnQ4a09wVnFS?=
 =?utf-8?B?QWhzMTd6eit4Y2tvdElnTnNFekRBdzVRRFhWNkxFMlh3TUNiU04yU0ptRUVu?=
 =?utf-8?B?ckYvNnkwWXRvMjZzRy83eEVMWEhQL2ZWbEM2WFhJd0grVDE5QVpGMExwNnRJ?=
 =?utf-8?B?L3N3SXNsTUxtUU9BMG95VmpoRC9CUHkwdkxaNTkwTngrdEdQdmEvWVIxSDRx?=
 =?utf-8?B?REh5NTkyWkNPdmMxTmxzVzB6VUZ0ZVFhZ0FjaWdaZDZJRmpZdDMvNDFjNGto?=
 =?utf-8?B?NlJJajFORFhtME00amw1czFra3hGRFpyZUJKWXRJSWcrR0RGYlM2bUhPMlZx?=
 =?utf-8?B?T2VFTm5kS0lqNjEvUUVzQnpCZGJiNTRhVnB5UGE1YWdubXkwbWd1aG1LZi9G?=
 =?utf-8?B?WklEaHVXdHNoayt5ZzJUN2hNZnU3UHpWZUJsenppc0NaRktqRVVnMThheEVj?=
 =?utf-8?B?SWlwQndBWVlKZ014RHFSazJIbWlvUkhTN05JaXpsbHFTT0w4aThkU3pPTDdu?=
 =?utf-8?B?YUFQV3dsTlRLdzR1WSt4SFVqVjZ2RWZRMUZlYldsa3puVXI5YW5BQmVJbUNk?=
 =?utf-8?B?L1Uxdk1PLy9XeS9nZ1Bqd21MQ2QxK0FVaHE3VHB5MjdidWRjMEhuYnVUMndj?=
 =?utf-8?B?bXh4aEFoUE0wSjcybHl1RSttWndGU0pFNFJzOU9RUEhKSlU3Q0lDWWRkNUdR?=
 =?utf-8?B?dDVzNWhYa2xqYnE1VHpHMnFZai80VnNTY0xpSVp2VEtKbW81eWE2L3lwY0dl?=
 =?utf-8?B?L0tyOHR2U0VkU3gyRDZISjhMUTFKRVQxUndJTnM2bWhpcXA0eDk5MmN2R25l?=
 =?utf-8?B?U2Z5LzB5YnJsK2tGQlVyRzhTbXc1LzFvNEM2b0NZa2VSNnNQd2h2ZjR1TTBm?=
 =?utf-8?B?RFRWRjR6Nytqcjd0cFpWN1BnZ1dhT2ZRZ0I0NzRrTmhPMGpwN1RVeWROeVNt?=
 =?utf-8?B?d3d2aCtCM2pFeWVFOTVLQ3VuRmlZcTd1YmMvcnh4S1JsQVdUeTJiYXdBaElu?=
 =?utf-8?B?M292VzgwREltbGtXWlZBTFk4by9GaE1FeXFmK09IcmRCQjNrWjYxaXI4aDUr?=
 =?utf-8?B?b2VuTG5zRld4VGVvS0NxK2ZZbU5PQVk3d2Y5ZFJ1anhUZXMvYUQvMGU3R0Q3?=
 =?utf-8?B?a2hDeG5na3pPdnVzNDRkTFoxZGJlc1lzZkV5TFNoWnAyajIvOHhGTlRBOEQx?=
 =?utf-8?B?QzR0UjdVVjA5dE5PYUc0TDdrWXI0ZkZXR0YyUVJjeXNOMTJXdUZCT2xRclE4?=
 =?utf-8?B?and6ZDZBd21wZGd5N1QwVVB3d09kL2dCeFFUcnJxSk5BcnlMSVl6eXVyY2FZ?=
 =?utf-8?Q?JFNa5z57Vw27rRYrWHnMl3Q=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d414da-e9a8-4790-de7c-08da02130102
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 21:23:07.2520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3FaPwCqOSfJGr79STHiVO67vAs8oeVZVxwvC94tKd8Bs1rXxBfQjN3lIxJc+ivYwmvbCya1Bqfkzzn0mj6yueQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3447
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
Cc: alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-03-09 16:20, David Yat Sin wrote:
> Signed-off-by: David Yat Sin <david.yatsin@amd.com>

Please add the commit description back. And let's wait for Alex to 
confirm that the fixup-method is OK. With that fixed, the patch is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 6 ++++++
>   include/uapi/linux/kfd_ioctl.h           | 2 ++
>   2 files changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index e1e2362841f8..607f65ab39ac 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -1767,7 +1767,10 @@ static int criu_checkpoint_bos(struct kfd_process *p,
>   						&bo_bucket->dmabuf_fd);
>   				if (ret)
>   					goto exit;
> +			} else {
> +				bo_bucket->dmabuf_fd = KFD_INVALID_FD;
>   			}
> +
>   			if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL)
>   				bo_bucket->offset = KFD_MMAP_TYPE_DOORBELL |
>   					KFD_MMAP_GPU_ID(pdd->dev->id);
> @@ -2219,7 +2222,10 @@ static int criu_restore_bo(struct kfd_process *p,
>   					    &bo_bucket->dmabuf_fd);
>   		if (ret)
>   			return ret;
> +	} else {
> +		bo_bucket->dmabuf_fd = KFD_INVALID_FD;
>   	}
> +
>   	return 0;
>   }
>   
> diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
> index eb9ff85f8556..42975e940758 100644
> --- a/include/uapi/linux/kfd_ioctl.h
> +++ b/include/uapi/linux/kfd_ioctl.h
> @@ -196,6 +196,8 @@ struct kfd_ioctl_dbg_wave_control_args {
>   	__u32 buf_size_in_bytes;	/*including gpu_id and buf_size */
>   };
>   
> +#define KFD_INVALID_FD     0xffffffff
> +
>   /* Matching HSA_EVENTTYPE */
>   #define KFD_IOC_EVENT_SIGNAL			0
>   #define KFD_IOC_EVENT_NODECHANGE		1
