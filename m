Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 647FB4F803D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 15:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4650510EA3E;
	Thu,  7 Apr 2022 13:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2051.outbound.protection.outlook.com [40.107.236.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E0E10EA3E;
 Thu,  7 Apr 2022 13:13:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JFsZ5iZ5g7TtZdH0V4ET1xcHtTXW7RPtXjFw8IXUyx23SGXlbKJjxYcMA1o5v6FtHPOw+p0Rs//PTOEMb/speJS0MHJNjkCVuEyO8zArc8S7MAE2QpOupHIHj6C9R2L1vD7AVAACTDz6S7IyhI0xhPgFtQ65NI2pV+YSG//5Qwz95XhIXfEfsCyuwgjdynZ00KR76PrfoF4iRtz/uBCyHnqKdg0XvlEi5m5QRj9xeZ+WMv1aISApGN9HJXtei0aidUeRObeeqY3ramIGrzBf85ZCs64MnpXPzJIx52P+JQmhwyPk6Nk8s8RQyOi7CkgFTK+oSgIATAHLeALgUqydfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXToUkdfDm/Jl+kn1x0+tupGcvaQyprNizhasCL5QHM=;
 b=VCY1jH5VQOu2zsTu4QweGx0axemfcisea4AhaSRSw71eZmPsGoZzQtx77YSCVL7fYrEmKXvSb6Xz4RV0zKmtguWV+6+7zNr1kDqoWl0vOxU0r/9sV7XnY6MkF2HKGHbdoCm1DUHZRSQyvk0KUpNahwfb1kumoxr1EV45ulEUUpX8+iLar4MVwuezJFq4iybjo2WLzzQTMmCJdS8KSOzKzSqPon6detBcfoicDuG8RYvXLUSs6p4JjqkYEzVqfJjCjbp11S6rlQ1msPh1jLAh2nqLsiIn3ZJ+vrffNd4/aDaw1MfChQkA+ZcswEUFwkzFbKenqmU82iFey4RYwTr9xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXToUkdfDm/Jl+kn1x0+tupGcvaQyprNizhasCL5QHM=;
 b=MfiktuvjPBC8ebD0v/0hG+lyU4/qPaurSzv8SwjFUEN2HD+Zg9C4Lnup9a6WuVwvAuHE0UTO+Kk6IKN298s5/StC8qVhmWGxKhDJslsgNr+YuwoCO+h24r9YoWAOsnDGWo3BYmPdtvjqXpbvPVWOeG1FR83O3Z7GJGj9RSsbZqU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN1PR12MB2398.namprd12.prod.outlook.com (2603:10b6:802:26::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 13:13:12 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 13:13:12 +0000
Message-ID: <79648b84-e7d0-4c38-d8f1-cc569238ee7e@amd.com>
Date: Thu, 7 Apr 2022 15:13:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 02/15] dma-buf: specify usage while adding fences to
 dma_resv obj v7
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 intel-gfx@lists.freedesktop.org
References: <20220407085946.744568-1-christian.koenig@amd.com>
 <20220407085946.744568-3-christian.koenig@amd.com>
 <29677a4e-42dc-d35e-f487-f8b344678bee@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <29677a4e-42dc-d35e-f487-f8b344678bee@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM7PR02CA0017.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::27) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d8caa9f-9ca8-4e0f-2e54-08da18985ddd
X-MS-TrafficTypeDiagnostic: SN1PR12MB2398:EE_
X-Microsoft-Antispam-PRVS: <SN1PR12MB23989403BF0AFAB3B4414B7E83E69@SN1PR12MB2398.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2XCw2qY5O8Xi2PAY1+VRBRu4Daqa/znJxDGGB83fTYDHSTH4zGL6ldnFaFadoiqLmj0ghXPTMWgHRkvSXzLnDUC/VtTn7tqBM4/jwYooyd7vhR7zZv51nsZ9e6iK0PMJEeaw7Zqf4h3iG24xLOgk07s4TflgQYmRSmWJLEeJ3y0MGzW0h7bYVoXXwkFZvmOoPCKIy0CBeW7Pfb/WEuvqn9upvIC3OkZgJ2ARQsNnJjHd94Q/MQdB0UdFfWmImVty2bhl1Kl6yaknUeDwNu77MrGCQ1Ez7GtZ9eecU2hKfiCzt2iYig+DSZiuKC9vcE3GKISj1EowIRuwra2gvQC4WFN6RFZ2mvokqgxg/4ip9PzD66lEnJMVRaZdzux0I3r9yeavwt8SqWKtUhui0IthbB0VPXclIWU6BJE4N48OsLDOwOGzVfGaFL6zYFmKQhw+87SjKFx+xB9chyzAxVhehwerJsBC8jkUqdN8uBezVe9fJIn5WbuO75RnzdccBtcE1fUDur9KuGGwJ+OUgJvcHADKBZHJOcB7AKf4ZEZ73NNNX2Q6flWQeGK+ov+DGlg8uu3JU5+uABEtqrQIGPx+YANuEc89Fb0cM7ZUKSZvwDNN1qEGpBaqKQM/RJDbQ6JfNnRo3x02y7Z7NpZ3kTmw1GiRg72qpCjh1Uw1te25EKtUsUpbwXVquUbF3EH8amxjkPrXc3r5WJfqM6WJHY2Dv9gUaSSKdWXvQamhy7OdyoKqbtJNw/FUkuIKlizhb2YZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31696002)(38100700002)(86362001)(5660300002)(6486002)(36756003)(66556008)(66476007)(66574015)(316002)(8676002)(8936002)(110136005)(26005)(186003)(66946007)(2616005)(83380400001)(31686004)(508600001)(53546011)(2906002)(6666004)(6512007)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vkl6RWFSMDh1bVFMM1plZ1laajVjYnhZMDJ0MmdSbXV4K0c3d2ZZMkViV0or?=
 =?utf-8?B?cTVpdHNvNTNtSWNzV0N6RzZTS3BUT0ZvWDVYOGxXbHFCL0szai9jaEFSVkhv?=
 =?utf-8?B?SU9DR1lIQ1dHUE5JeXl4eTR0cHh6dEkvajluOFhXN3FMSTBrUTd5RTR6Z01q?=
 =?utf-8?B?Z21Ubkgzc1o5bWFqcWN0cFJoTFJTUGtyWTFmdk9QSHNwcWZ5YVlqM1VOTExZ?=
 =?utf-8?B?OGtmM2RrakxzTXJSUTQyYkcyZktYeTZ4MmQ3ZUozZkQ3dExCRnpIcTFWZm81?=
 =?utf-8?B?R21aOVhtTDYwNlFwWEhoOUw4Rnpibzh0cjNkbkEwMTlIdXo1SHBlTXVma0x5?=
 =?utf-8?B?bnBwNDcyVXMrNU5QMFNUSkh5cUN3Q0daT2czSnNKamt1SUN0UWhla29PQUhQ?=
 =?utf-8?B?NG5aU1BQRkpoOUZtNkhzeHUrVU0rOGNjTnZhQlBQaFdOdXVvVzVpNTl2cGtG?=
 =?utf-8?B?L0RvdmR3cnBsN3VOaEsyd0dzSzlxZDBCTVdVT053NElvQlN6YmVmYThLVVV5?=
 =?utf-8?B?QjZVS1N6cS91akdoVzJ4ZkxjZFgvditjbnpPZWFwNGk3Rk1LZHQ0TUVWd1Ry?=
 =?utf-8?B?UHhPWE1HV2dzcU10MEJ1aElJaTV4SGRFcld0c2hWOTFnTmtIVkFVSEZZbzhi?=
 =?utf-8?B?eEp1M0cyYmVkN0QzcWVHeEgyVW1DbmVDYXd4VUszRm1iSlhodDk1dDh3OXIx?=
 =?utf-8?B?dnZTOUFTQnF0ZGx2TVV1ZTZWbTJ2L0M1eHZGdEI0NU5HNDBqS0d0ZVhsYk9s?=
 =?utf-8?B?N1h4dHZ0OTEyL3BFQ3o1ZThsc1J2LzVXbmNuVVZvTUNpUUZtblZEZTlEY2VL?=
 =?utf-8?B?b2ZLL1dQNEdrOTVPUFNrOHoyeDRQVGpCajJENFBWNVkzWjkxNnV1TEZtaXhU?=
 =?utf-8?B?enVFN0l0QS9HZ1ZIbjQveU1GVExlNnFBRnhyU0JKVEMvalhiZDdNMGMySkpl?=
 =?utf-8?B?WWhuZ256R292MzBSM1dMTHJ3a0NpbndFUFk1YjJzU1FKNDNoSTV2dlc0MU5N?=
 =?utf-8?B?UUJCNmtDRGxYMkdidktVbXQveUo0eHl1UXpXRnpqRklTRzNtV0Z3UHo3aVli?=
 =?utf-8?B?M0g5dmVvMGRNVndhWm03Nmc0dFk4U2x5U0NUVnlpWGNMdnlQcWdLUnZWL2Rr?=
 =?utf-8?B?MVhMaXpRaHg4OW4vblpMOEo2WC9RMWVIZENySFJRRFB3N29rRDZMOWtRaW1T?=
 =?utf-8?B?RU5pZ0xmd0U5TVA2RmJtVVUzODRHL2QrZnlpMXdtdmFQS3o0bWljRjRxR0xm?=
 =?utf-8?B?SXFENTdWQnVWaDZ2dDF4LzJwTm02Wk81SGFSTjdCQXRTd2dRQURVMDhnK3hR?=
 =?utf-8?B?aER2WVZHWWVVN3FUckNNS1U3OVBzcXc1YW5wUndiWnV2Q3pOaC9CY2Rwc2Rt?=
 =?utf-8?B?Wjk0eFhmRmFDeDZ4R3ZxemJlZFhtS0FXTGcyb0ZiTGRMdDBubEtFSGE3NG5V?=
 =?utf-8?B?cnYyU3J6djFNZzlMTStwdXZOYjg2bHNXOGgrcWlLU1dNbkZHdTdRQjVneWVp?=
 =?utf-8?B?ejI1REdlNEhsQWVHS1JCc0xzeDhTOFJhaDV6T25iYlV2aXkyZm1HK3FnbUxz?=
 =?utf-8?B?Z1A5d0k5VXYySWZYNmh2MmlVZXZaeHhOTkdPVURyVjg2dHdvUkNxMWlCNjFj?=
 =?utf-8?B?d0Fvczd4Q2NydWQ2eGhRU2VTc2J4ZFpVVjVreXF0QytzVFd3Rkltc2RoeHdU?=
 =?utf-8?B?RVg1bDFQL3RDemwxT09QSks4ZGx6dzhoSVVYRk5HWWd3RjMxQTg0MEhKa3FH?=
 =?utf-8?B?UEg4cWFVb21XZldSY0VrMmdielBUYUtQQnpMb1dQVkpKSStGRU0vRUhONXBD?=
 =?utf-8?B?NFJrMzJjZUJXWnoyQmpUWEtzMnp2cHduNHAzV1E4SURzZ3ZuSnA1d0RNLzRm?=
 =?utf-8?B?ZkhBbW11QUZTMVlRclhCa0MwV0ViMFVMT0FYcXFJRG1ORC81OU4ycnMyWElt?=
 =?utf-8?B?akgzc2ROdzlhWktscmFrclpuZGhYUUJySHMrWUQ1TzNJbG5qMFVjbmMvUit4?=
 =?utf-8?B?RlFhcmhrVVVoRU0yNllweG5vc0djTlIrMTlycXlxNThabStTWFM3anBnZUU3?=
 =?utf-8?B?dkRvZlBwUnZ3YStmdCt1VkpwWkIvUTB6S29IbVJ0Tm9WRjZ4Rk5obkdMS3N0?=
 =?utf-8?B?S3k0NldoeFg5ZzM4MWRYYU52enpEd1R4aEtJaC9HUTFuTkxmbWl2TTJadmtR?=
 =?utf-8?B?T0VFMUtsSEU1Rm5WMHB2TEtGeHpVZ2ZMRWFKNFJUaWE5am1QeHJocUd6QUhx?=
 =?utf-8?B?T2E3WVZZV1JzOXFxLytDYU01SjQ3dXZReGhHYldycmNvMWhqWU85aDBDbkZK?=
 =?utf-8?B?L01tbStUR3NKY0toR0lqM1dtZWNtL3VaZSt5Zkl4QnhWelpiWi9Sdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d8caa9f-9ca8-4e0f-2e54-08da18985ddd
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 13:13:12.1624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CLsCl8AGLElQB/iyFQSXEz1KmDoODg/P9/8j78LcHHuyTlTdkf6SbFdLw0tJOwAK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2398
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

Am 07.04.22 um 15:08 schrieb Javier Martinez Canillas:
> Hello Christian,
>
> On 4/7/22 10:59, Christian König wrote:
>> Instead of distingting between shared and exclusive fences specify
>> the fence usage while adding fences.
>>
>> Rework all drivers to use this interface instead and deprecate the old one.
>>
> This patch broke compilation for the vc4 DRM driver.

My apologies for that. I've tried really hard to catch all cases, but 
looks like I missed some.

> I've this patch locally
> which seems to work but I don't know enough about the fence API to know if
> is correct.
>
> If you think is the proper fix then I can post it as a patch.

Yes, that patch looks absolutely correct to me.

Feel free to add an Reviewed-by: Christian König 
<christian.koenig@amd.com> and CC me so that I can push it to 
drm-misc-next ASAP.

Thanks,
Christian.

>
>  From 3e96db4827ef69b38927476659cbb4469a0246e6 Mon Sep 17 00:00:00 2001
> From: Javier Martinez Canillas <javierm@redhat.com>
> Date: Thu, 7 Apr 2022 14:54:07 +0200
> Subject: [PATCH] drm/vc4: Use newer fence API to fix build error
>
> The commit 73511edf8b19 ("dma-buf: specify usage while adding fences to
> dma_resv obj v7") ported all the DRM drivers to use the newer fence API
> that specifies the usage with the enum dma_resv_usage rather than doing
> an explicit shared / exclusive distinction.
>
> But the commit didn't do it properly in two callers of the vc4 driver,
> leading to build errors.
>
> Fixes: 73511edf8b19 ("dma-buf: specify usage while adding fences to dma_resv obj v7")
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>   drivers/gpu/drm/vc4/vc4_gem.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
> index 38550317e025..9eaf304fc20d 100644
> --- a/drivers/gpu/drm/vc4/vc4_gem.c
> +++ b/drivers/gpu/drm/vc4/vc4_gem.c
> @@ -546,7 +546,8 @@ vc4_update_bo_seqnos(struct vc4_exec_info *exec, uint64_t seqno)
>   		bo = to_vc4_bo(&exec->bo[i]->base);
>   		bo->seqno = seqno;
>   
> -		dma_resv_add_fence(bo->base.base.resv, exec->fence);
> +		dma_resv_add_fence(bo->base.base.resv, exec->fence,
> +				   DMA_RESV_USAGE_READ);
>   	}
>   
>   	list_for_each_entry(bo, &exec->unref_list, unref_head) {
> @@ -557,7 +558,8 @@ vc4_update_bo_seqnos(struct vc4_exec_info *exec, uint64_t seqno)
>   		bo = to_vc4_bo(&exec->rcl_write_bo[i]->base);
>   		bo->write_seqno = seqno;
>   
> -		dma_resv_add_excl_fence(bo->base.base.resv, exec->fence);
> +		dma_resv_add_fence(bo->base.base.resv, exec->fence,
> +				   DMA_RESV_USAGE_WRITE);
>   	}
>   }
>   

