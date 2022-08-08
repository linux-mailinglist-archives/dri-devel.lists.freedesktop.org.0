Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6C058CEB2
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 21:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 677EE10E8E8;
	Mon,  8 Aug 2022 19:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D91A10FF58;
 Mon,  8 Aug 2022 19:44:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XzKQAEzTAjqJ2DOueHflz0hami9E/n+hd5pX3QSsedW8aFKRddYPpB4I59sdp0wvJrD42K+OwiJd3UzMT0XtbZMb2vjXxICK2zwf/XRo6JLya9V/lJiApEf4q9zTo5HjF3qxPEZZNBgcUiyMxYaHXuuqXIaA+awGRhIgpdXzFA73V+K9HjxFDAigFnC5o1pXopKV2ZzzbVMe3oCMsh4+ODWLXL5Mhi/w73uqGvSq/Pz0eQ/dw7/dpEZuP/Amg8d9loxeJaY79X6Jre1Q6e1fPwF1LoUDEivSG6tPf+ZP/c+GwHSmPqTNwL2UYr8vjI5cHpUicSHdY9759pjX+qZ+6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MBhuH0jGyk9jpeT2o/SU7pVqC2oVdcU7EVIEAJB2PxU=;
 b=NR0MUoZjUVYUTcWqm+LUrkdlHfEDDAQqMkAJbOFRMDsjxtCCyrai7tvLXHidXX4eDRQAykVyMumbBqn0gaiY5jmmUHoM7rmKBpfff0Ftqc9oLa0YTOGipx9LkUdtYIB6E8Sh/1rvKeYTjBrw4jeDO+hNdLFwo0JlyhR7WhX9iqjCpxxGYe4d1ZgTzRtiiK1XSxLTc5tNUOcLfSrAJQsNO7NGCge3lNn29Kon2RElAkZHAZWUHYIpLnPOh+fFnnQeFT6Nz6Kpoay6qUdh5uO4whhe1U/K09DehSEE52EAA1v1WvLACMkH+tSUGLjGjlbOGuxDEjsF62j5xFto5auMrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBhuH0jGyk9jpeT2o/SU7pVqC2oVdcU7EVIEAJB2PxU=;
 b=MuwMOWjtbRevv89R0EttV7xunkkxZcfluBJ1GOlo+2ObJmY5L8api4B9pJK9e2N1EZaEN3OsbYa+XnkxooOQYzrKIm2AIjQc6MD4JQZCBt+FoVBM5YUL2XcfNDfSvtlWRN5VNNMkq50fir1qYY6J4nWgs1UCikKh7Uyk8LUkSYM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH0PR12MB5499.namprd12.prod.outlook.com (2603:10b6:510:d5::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 19:44:16 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 19:44:16 +0000
Message-ID: <1b917e43-a2a8-15c6-3c91-17a445f22a66@amd.com>
Date: Mon, 8 Aug 2022 21:44:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH RFC] dma-buf: To check DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT
 status on debug
Content-Language: en-US
To: Arvind Yadav <Arvind.Yadav@amd.com>, andrey.grodzovsky@amd.com,
 shashank.sharma@amd.com, amaranath.somalapuram@amd.com,
 Luben.Tuikov@amd.com, Alexander.Deucher@amd.com, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
References: <20220804121938.622630-1-Arvind.Yadav@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220804121938.622630-1-Arvind.Yadav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aeaabec3-bd69-4823-dfe5-08da79766080
X-MS-TrafficTypeDiagnostic: PH0PR12MB5499:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oeQMR/MsZ82cqVoM2EOd6BaEVMfX3WATO8pm5wYjsx9X7RxvfoPfgQbGAmegbF5nGuGfSAOsva7M6idVCbYN+8AcDentgjDxoQ8qbJZ+DMAkjNs/pnS6b6uSp1U7/kJkJydNxGyei6XdtZsKjPAkMugiGUEtwzK5lzqJ1bct+KI/8JZlSn2MV3Nqm6yNNDbq/w9ZnGC9739UZsrFj6GrXgVSEsoH3kA36xKSqCbtSyrdwO13jdgTSrzaWowjHT11tr/M+vJdTFke2fw3ujbYc9t6VuIYS08dmbw8y6HuW3dUqdfij6zpHPBwgmgj8z7HO7Ew/CkyJBz7LG1LZL+kjAsxMrTyROTIWnDTComhuOBBf7k2b51Ss2ZQTUUZWKsrefYODnuZPaiLfUs12daItxPthu38gpoDgujIZsZTqbRCA2vU/C8ISGEB5oDDxs6a6r5/gl0flfFqmyg3aKLXJ0kGvxccrTn18KnE+NB8r0h3nXhUGrcGd3kZL3KIHCb95Jmwc1FrEIqbw7CmuG53LN3J5k2Gnh+TQ2PdJ9EtNEhowAX2dRTqF5veIXNsmhMQ/3jrqy4rS3i/7YpF0AJiM6HMf+t7X2ng0GOb7nQq5lcEjZAGs8+dk/DdCgtpiCDCVsy9Vfd7g4nv7X8cRl/wheeZPvB/W5GoPe2QcY5XX1irkER/8y7dkly6qDueJiIhhyQC3gsAdwn8yIMf4BKaJzcVmvMLUJkYBX+EyDEz2Wva9AlJAiUutObWkutgEu/ncKMw9Ju46p3ginYWXkhaKGbGuHPcYWYvg7zc15D5qeIkmgcN3ReSq1gWRdt//ouldbmyj33Clmra9f41x10MM4h8YtGC9gFfPvUFH18wPnw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(396003)(39860400002)(366004)(346002)(31686004)(66556008)(66476007)(36756003)(8676002)(66946007)(6486002)(186003)(316002)(86362001)(8936002)(31696002)(478600001)(5660300002)(2906002)(83380400001)(6506007)(921005)(6512007)(41300700001)(6666004)(38100700002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjRrSHRudUx5QU9HVzFxTytjaWI5cEhYVUlZSVZVdVNEeUc0U0srTmo4VFhw?=
 =?utf-8?B?bE05NzBBTVkwZWU1bjZjditCSTNqUTNBTDJEdjlSR01IQzZyQVRwZW5JUW1T?=
 =?utf-8?B?SURWeUtzL3F0MHN2dXZvR2ZHK2RvNml5Qk5aSG9sU1FRVGM1NUt2NDFNT3hD?=
 =?utf-8?B?MWZvRGFmeldnNmtudXR0M1lkbE9VZjZMbVJuZWJpNXNiWEFXSDJmaUlISDZs?=
 =?utf-8?B?dEViOTRvVG9Fd005aXNaTnF6bDh5L2d5a3VTdjBra2hMbTM4cjJ3d1QxMzRJ?=
 =?utf-8?B?NmtBNlBJWUlJcWY4V21sTWljbS8wWDltNEQ3eEVnWHZsa3UrOGszSDFpcnVC?=
 =?utf-8?B?enFWS3FHR3hGUjEzOTZyQzlBcjZFZWdrQTRYTTFjVWoxZ1FET0NVdjk5b2pp?=
 =?utf-8?B?M0JTb241MTdnUTBVSXpVWnJ2dno5bVFjYVJCaGFiMFppcS9JZzQ3dHg3Z0Rq?=
 =?utf-8?B?VC9BSmFIUVRQclErVEc3MnpqUWowWC9BZ3VicGhWdThCZXVSa3RHYXVTeFRM?=
 =?utf-8?B?aUNoSzFJc1dzd0d5M1A1YTRBTkRxd1RxdFR6c05GWXNRNWNUQjNxeURKSFN3?=
 =?utf-8?B?WEFQQTF0WjRkYlMwYTFDWEtOci9vdkI3N3BTVnU4ZjZmQXpYMSswaDNOTC82?=
 =?utf-8?B?a3NTa2pjZUVtbkptbUJzUmR3UHJYWWN4dUFJaXFvck1kdFNwb1ZjbjNSaDZy?=
 =?utf-8?B?ZEtoZkhUeW1Nc0lKblM1ZVdjMDhPbkFaQ1R6ZUhVWGs0ZGk2SDJiVGR4Vldm?=
 =?utf-8?B?Z21HUUZTQ0l1NytQamRUekhQcWtUdUZPbFRKTUlSalh3SW5DRjE1Y3NUV016?=
 =?utf-8?B?bnV1Ni9mK1AvQUo2K0hrT0JJZHRJQUtwTjcxRWZYQUhhUHFIK2hiMWNTd3FX?=
 =?utf-8?B?S1hJOGRyRUJJMEl2WFFneHcxcWlmZ2hpMURBd0c3bTg3YXR2ZXFSbkNFYnoz?=
 =?utf-8?B?OUtxWE9sZC9Nb1M0cElUbi9GaDRtQ0tDWnNiZW9SazY5VzNlMDE4RVd4b1o0?=
 =?utf-8?B?a2txL3hnL0JvZndMSDg1ZENpVS91VllNbEpOMU96OE5WcENtVkk2c2JZSnlm?=
 =?utf-8?B?N25MVmNLT1lWTHg0UjRIczl4ZUsrajkvbG5SUHNZL1puVDBmNkVNZ0czWjEr?=
 =?utf-8?B?TnR1aXZCKy9JdEZYeklyZElTNGNpNUt3U0p0emIrQzVCVUF1RGNyTno2c25Q?=
 =?utf-8?B?RHMyWmlEMVc1RURsd2ZYaVY5Tk5YeGdKSHNEUXlzYUhkRHV6OVZwWW9MMmFX?=
 =?utf-8?B?TnRKSkoybndLV010eG5VOHJjd3FJSzhSSFpmQTZlVnFuQnlxMFptWU1vcXQ5?=
 =?utf-8?B?WStBcFBvd1lQWnVlWldKY21EbHBkNlFQcEJKcEJlTy9GUlNQdTRDdVM0K2kx?=
 =?utf-8?B?Vk80a1dXcEw0UnU1eStwOWR4V0dxSkZ2TC9QVDNQbTI1SEVxZEpaREh2VGtJ?=
 =?utf-8?B?WjVsNHVFK2VBUFMzZUMrNktzNDZHaUltT1dxZ0VrczBaUWVCZHh2K3VXRGdz?=
 =?utf-8?B?NWQ4RWpzcUtmQjgrWlF5NUlaOTQzVzA0Z2xzbWZQZ0VrV2g5ZS9vdWhxQnlm?=
 =?utf-8?B?cFdCWEtqMUVOY1ZiYmgzamcvQUhxK0RmYWFTSS9lWjVRUTF1MVpNNlpoLzU0?=
 =?utf-8?B?bnJ0SDFubWVSa2F4RHBXT3ZLaDRwbDd0YkhTeXJkTDVLTTJVSUhycDQ5TUFk?=
 =?utf-8?B?TkpJRC91OGNHaHY0ZXlmRkJ5eGdxWFdTcUVtVEwwaGtvRUZMeldjNzdXWHJG?=
 =?utf-8?B?cGdSN2VTQ096UEFta2RRM2R2dkpRT0diQUxkZ3dVV1JMZGY0QmVBY0EzdHBm?=
 =?utf-8?B?MmVwSXFHdEYvSTZTbGpManJQSjVpc1FMMUlxSXFtRFI3WGpmWDhyWDMvU0NJ?=
 =?utf-8?B?NEJvdHMxMDVUVTdsTFVJRC9va3VVN29UaS96VGZjNUd0bGdwMGp6cGtERWVx?=
 =?utf-8?B?L2FMMWdMbFU1NWJVMG1BZ0tRbHR1SWpEOXNYZUJONFhwUkd5dG5WSEtWS21M?=
 =?utf-8?B?MEU0Ym1Qd1NoZ3pmTUw5WlRXc3gwaEN0Z2ROd0NpcU9obHlKS2ladjBPNXhG?=
 =?utf-8?B?UUxkbFhVaGZPRDZlSWdFV21PclN6ZmlWNzJLMzN4RnNSTE5YZG1sSEVrU1FW?=
 =?utf-8?B?VjdHa2xnSm1WUjVCRDBvQTJUSmRVaC8rUDhSZi83QTNYNUFZSGUyVnZab09R?=
 =?utf-8?Q?egYV66YfrHZI6jH9bMOZTWA+NV9BcwffW1rpk9hX7wFS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeaabec3-bd69-4823-dfe5-08da79766080
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 19:44:16.1475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M3sHxepC5W2X3HilLbz2neTKl3drihwVuHZBz26JSbl/ncCXawDO7/fJy9qNchMo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5499
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



Am 04.08.22 um 14:19 schrieb Arvind Yadav:
> If core DMA-buf framework forgets to call dma_fence_enable_signaling()
> before calling the dma_fence_is_signaled(). To handle this scenario on
> debug kernel the DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT needs to be checked
> before checking the actual signaling status.
>
> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
> ---
>   include/linux/dma-fence.h | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 775cdc0b4f24..7c95c8d5e5f5 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -428,6 +428,10 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>   static inline bool
>   dma_fence_is_signaled(struct dma_fence *fence)
>   {
> +#ifdef CONFIG_DEBUG_FS
> +	if (test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags))
> +		return true;

The logic is just inverted. The test should be !test_bit(...) return false;

And please give that some testing as well.

Regards,
Christian.

> +#endif
>   	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>   		return true;
>   

