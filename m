Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 724E07EE8FE
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 22:54:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6705410E6F6;
	Thu, 16 Nov 2023 21:53:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFEC710E6F6;
 Thu, 16 Nov 2023 21:53:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lIr+tCE6RtK2dThKPSesi4CVSvw4V1XdwiBpl3vmJtFfYW62gpaeJ345VfxpHwNu+DReeRdYbSLu+FUMea50ljbwbSV+7GC6q2JdmLm50MCJjajo8fDode3wLqh4BAEjabvM6f14dkVXQR3q4JXhDOMrMM2GvL6X2F2/DS5K9DEWSnFxjeiasWisa6s8z4qupsv1rJFpfXDR57OcMT4WE+p+uKrwL+4yS/uIUiBHz6xac18wUO2si1dD/6HQsfUguGdqprG2YuH24JmJgcGsgyj2lgT3jTwgQNH9Vd/WBs7evpuvIV4M0wirVP4WjHLtqwXGtLdI4ISCbsplp8kMSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJHV7Z6LxRl5V1USvxkKsEn8LZDNtknCvUIYYU8K0TQ=;
 b=IY8FLgoWu1xz7gTZdtPyZpCXNBvqEIOqJ8NG3/1HR2BdH/04ioYsN+BuuQjVxARLVgEh3rZ6uoTZRWT7YaiFM0OOmHAYySzlsAgalh2VPqTamb/sMYF4dgLuwPq4mOigR7goDHJJGEX2S0uEJZBQZuVS4ck6IC+rc19EnB0Q7LxUSiH7C8hcE/nKgp70V5fjdpuGAc8Kt+7IbnhvOYggol/+MSI5nPKTcQVa3OiZ8x5f3bm3nuMdva9vIaIhN+qd+3u828LdPe3vejEwdi7dRmvaEZaMegv23s9g8PGS3eU0FuJbiwMQ5mSYBjZ2VFQaKImGHaCzFmpTnGf2leSfZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJHV7Z6LxRl5V1USvxkKsEn8LZDNtknCvUIYYU8K0TQ=;
 b=eHiZSV75we3RBiBn/wDVOozp9D1OJy7hVUG3urRK1CMuH807rvN5ZwA2KHoK/vZTvtOAv+w5VuQh8PfrnK22csvZa5bgUoamo7uGDOldCb725fADS5VITR1z6W5+Jn8UEEeHdYAAzoZa0OZTAhV0Gpm0uH/Sl7+7dsu79ZIcDsE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by LV2PR12MB5847.namprd12.prod.outlook.com (2603:10b6:408:174::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.18; Thu, 16 Nov
 2023 21:53:54 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7bfc:e32b:f362:60f3]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7bfc:e32b:f362:60f3%5]) with mapi id 15.20.7002.021; Thu, 16 Nov 2023
 21:53:53 +0000
Message-ID: <a9fb97cd-9815-4e17-b3eb-8a3569b64d2d@amd.com>
Date: Thu, 16 Nov 2023 16:53:52 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm/amdkfd: Export DMABufs from KFD using GEM handles
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20231107165814.3628510-1-Felix.Kuehling@amd.com>
 <20231107165814.3628510-4-Felix.Kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20231107165814.3628510-4-Felix.Kuehling@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0120.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:83::26) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|LV2PR12MB5847:EE_
X-MS-Office365-Filtering-Correlation-Id: 735a8431-f8c5-423b-360b-08dbe6ee868a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w7pEX6zd/dchmkD+KJFYzTV6PnFvpUxrAUVaZ1tgCOoM5Cje15rLWNtt5YfMmTNViyyhx88nmudfONDc8OOXJwH69J5/Fuj0tat3Uh5NFVLGo5a156zjJdzYlXodyVZ9b90aQvLr5SOa8w4sPsWr9rzZkLhVwUJMzY4IdG5kgKQ0az9vtLh0Qe4Sg1V/bzloTIcx7kOLkkYI+4qlX/+sEBSEP/KnjZwcrFFa8UDlkzeMTAIyrInJUmLuh1F32zLppj2x/WWonKEqlVv5AKFJOpFaEuLe2MPN9pL0l8BEALcNIHhUJNes0ADmuc3t66O1G+B2AAahZCvdlye9EnjXOVX15duuEHdnM5N8S0mQqvGr0MOM5nKuZWnlNt5iovlzRgslOE817mbcMm3mWWZD0LXHdoj3RwWUPsft6ztKgDd9OTh2TCeRIyhOrDYZ4nFzRkqSY3bdsyEJD0U+PIuWafTKpEWCDSnarNrgq/luAtFjCNI0ok3ot6mTXhOWJraDH3oeWD09oevWPQSN7foKFX4jolHMMJ7glgCKfloM/O09kyOEEW2l4f6/MAEDKkJWLX9qd967EkoQRGv3s+g4vBlDWNejNLcwjKeDjWoHGJqUw100Q10s8Ky5g2E3mhxvK9uKQgLL1awus9t1qwUZsA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(396003)(39860400002)(346002)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(6506007)(4326008)(2616005)(316002)(31696002)(5660300002)(38100700002)(53546011)(36916002)(83380400001)(86362001)(6486002)(31686004)(2906002)(6512007)(26005)(66556008)(66946007)(110136005)(8676002)(66476007)(478600001)(44832011)(8936002)(36756003)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGU2RTJLTXB0OXh4T1dybmRBY0dQT3RQQldENHdkOG9kTWtUaTVuRTlKTHZR?=
 =?utf-8?B?RS9sVE9jVFZuUnJkL3lUMG9Oc2pvNDV3dEMyaUV1NnZJdzdIRjNLNHJPdEdH?=
 =?utf-8?B?ZzZuQS9ZSFV0ZFczY09iOE1xWVlUMTNtcndxb0lwWEV1UVJGeHpKcnI2ajRI?=
 =?utf-8?B?dlI1eWxYUTRqdFFqeFlmdk5JQVF2UDJXeUtZU00yL01YNVFPckptVmdMelNy?=
 =?utf-8?B?V09wek9tOE11QlJrL0cvRTZxNGxsU1lTMzcwN1RXcS9oQUhrRHpZWUlhTUJF?=
 =?utf-8?B?Yk9Gdmx4MlhzTEpnVm5yY2ZacmdrOXRpMmJMMmdzUFJFS01helI4MlBjSmV0?=
 =?utf-8?B?dTNNN0FoK0xmNEZzS0Y2Zll6cEEvenZOU3I0aUJNTWd0OERMMlRPckUyQWRG?=
 =?utf-8?B?QW1VNkwwT3YvOHp5d2FxMnBSTWtsZFVXYW10Y2ZMdUlKMlJjcnZiYmd1V0lE?=
 =?utf-8?B?V1RWZGhYSnNKMGpSd211VnlyZitHdjdyK01KY0xzcFc1K2FvRWR0dmxEejlH?=
 =?utf-8?B?aVZxeUplYm5CdkhaNkg1dDg1NWcwUkdCRmlRMWNzTEVuaVJJdG01SmIrNFpw?=
 =?utf-8?B?czhGcG04UFVuOUtwT3dTVjF0WVJLSGJNZGdhQjg5a3dJT0QzcHE1enlaeStt?=
 =?utf-8?B?RkNpKzFuRlFycHgxYWxCT3NmM1g5d3Z3WE1ieGtmTHN2QTYwVFc3M3V5dTcr?=
 =?utf-8?B?eFVMSllrZ1RUQXpRV2orTmRQUlpCaUNYZFd1bzR1Syt5Z3FpWlA3WjBwWVVZ?=
 =?utf-8?B?RktZOE1QVGswNHRxc01uNWwvSHo4d3F6NEVYWTFQdzNNdXo1Q1pIMWVHNWx0?=
 =?utf-8?B?MXFYbFdVWmVEOENsc1REWUFtcGlhWnpnRWZOclJ0U2JwUW1nN1M0dTlIVDN6?=
 =?utf-8?B?VEdHaWlaZ29FV2JWSHFadGhSTFFFYUQ4QlVNRStUdCsxeWxhRXZ1a3BvTU9n?=
 =?utf-8?B?NTFsd244QlVUMjExalM4VHJPTFB5MHptc0JMYkxBa2Y5eGJTclp5em5LbzJM?=
 =?utf-8?B?RThIL2F1cHRmSUxRZGJ0bjZzRzZvamJhVHRROVBtNk1maVEvSVFjSVlUWXNj?=
 =?utf-8?B?bWNhVEV5UmtDZUNzL1NPUzUwM2c4WXI1K29UUXZvVzIzdVpFMHVWZ1lUVUx6?=
 =?utf-8?B?RzlXa1ExN1lEMUFoM3RhdklkOCtReTA3TDQzQnRJektQYktSUzlkQ0RMZVdo?=
 =?utf-8?B?UHg2K012QS9wamQ0QndnUlhoc2hvNjNCYW5HaVREUE0vcWxrdmlhclJGOE1x?=
 =?utf-8?B?UFlUSHNHQktVN0RpS2RDVFFFeWNQTVU3ai8vUEh5WDBhY2ZPdmlOL21oQ2U2?=
 =?utf-8?B?bG1pRnByQ2M2UG9KRzlRSUt2ZHBiNnFnRjhMZmVlb0xNQ3JpNGljU3dSSy9M?=
 =?utf-8?B?RUVjVndzdU5OY29WYmpuaURUcWswdnVjTStGdjlQV1FJQk1YU3FkdHBoSFNm?=
 =?utf-8?B?am9jaDMvSWVQbjNoT2V4ei9MNVVSS2dPb2lKb2NEbytIT0lDLzI1TmhhYWp6?=
 =?utf-8?B?QWFLK1VBemJXUDhFWENBTzg5WWlYM0NSS3lQbHk3bjFYdnpad1R4OUFaTzFM?=
 =?utf-8?B?bkNBU2x6TmNpMWkzby9BZml4R2VydHh2cy9UY1NOd0RQUExSd29qTThVQjZX?=
 =?utf-8?B?UWtRUkhrUTBObnhoMDk0ZEg3QUVKN0J6Q29hL3IrNlg4d0lXNWg2QVZIbTQx?=
 =?utf-8?B?a044YWxrWVh4bjFibjdtSlMyUWZYSk9jSWR1RVl0akxRTEtiZWlUaGZmdFlP?=
 =?utf-8?B?QlV0TzNqT2MyNXRWRE1GWC9NTHRPdHltZTBtR3ZBMFZDMTl2dThXUVBIZTdk?=
 =?utf-8?B?NngxS1QvaitmNGZvTG9DUk9JUEEwNm1mUVY5bm9nUTFMd1FKc3BxL0plQmZi?=
 =?utf-8?B?NXljSjhZQjYwcUxvaVV6azBSdjN1dWg4MFE3WWhldURVWS9UaVB5OFZ3R2Zy?=
 =?utf-8?B?blhjRUppYnM5Rll6aW1SRmRITkxIdnJQaVBUV2NvckhldTc2TFJFRHZReEc5?=
 =?utf-8?B?ZFNQdi9qVytqM2dJbXkzY3pJeWJPWGo2YXByeVN1bjBnaVM4aHI5QTJ0MzNN?=
 =?utf-8?B?ak8xL1JxaDArNVVDZjhjNmdWc0x1NjhydEFZOVZUL1ZMTGJRU0pSVEY4cGo1?=
 =?utf-8?Q?erINw2KjHRs5yZt55H6YG0Grx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 735a8431-f8c5-423b-360b-08dbe6ee868a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 21:53:53.8610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E4aVfkL7ennUYK/LYnioykO7fXQ6A9sr8tDEcZMjG4JL7GmzoOzN55mI3/Z5Cxnxu16b6Ie9HyhJw2W51FxUoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5847
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
Cc: xiaogang.chen@amd.com, ramesh.errabolu@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023-11-07 11:58, Felix Kuehling wrote:
> Create GEM handles for exporting DMABufs using GEM-Prime APIs. The GEM
> handles are created in a drm_client_dev context to avoid exposing them
> in user mode contexts through a DMABuf import.
This patch (and the next one) won't apply upstream because Thomas 
Zimmerman just made drm_gem_prime_fd_to_handle and 
drm_gem_prime_handle_to_fd private because nobody was using them. 
(drm/prime: Unexport helpers for fd/handle conversion)

Is it OK to export those APIs again? Or is there a better way for 
drivers to export/import DMABufs without using the GEM ioctls?

Regards,
   Felix


>
> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    | 11 +++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  5 +++
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 33 +++++++++++++++----
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  4 +--
>   4 files changed, 44 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> index 6ab17330a6ed..b0a67f16540a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> @@ -142,6 +142,7 @@ void amdgpu_amdkfd_device_init(struct amdgpu_device *adev)
>   {
>   	int i;
>   	int last_valid_bit;
> +	int ret;
>   
>   	amdgpu_amdkfd_gpuvm_init_mem_limits();
>   
> @@ -160,6 +161,12 @@ void amdgpu_amdkfd_device_init(struct amdgpu_device *adev)
>   			.enable_mes = adev->enable_mes,
>   		};
>   
> +		ret = drm_client_init(&adev->ddev, &adev->kfd.client, "kfd", NULL);
> +		if (ret) {
> +			dev_err(adev->dev, "Failed to init DRM client: %d\n", ret);
> +			return;
> +		}
> +
>   		/* this is going to have a few of the MSBs set that we need to
>   		 * clear
>   		 */
> @@ -198,6 +205,10 @@ void amdgpu_amdkfd_device_init(struct amdgpu_device *adev)
>   
>   		adev->kfd.init_complete = kgd2kfd_device_init(adev->kfd.dev,
>   							&gpu_resources);
> +		if (adev->kfd.init_complete)
> +			drm_client_register(&adev->kfd.client);
> +		else
> +			drm_client_release(&adev->kfd.client);
>   
>   		amdgpu_amdkfd_total_mem_size += adev->gmc.real_vram_size;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> index 68d534a89942..4caf8cece028 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> @@ -32,6 +32,7 @@
>   #include <linux/mmu_notifier.h>
>   #include <linux/memremap.h>
>   #include <kgd_kfd_interface.h>
> +#include <drm/drm_client.h>
>   #include <drm/ttm/ttm_execbuf_util.h>
>   #include "amdgpu_sync.h"
>   #include "amdgpu_vm.h"
> @@ -84,6 +85,7 @@ struct kgd_mem {
>   
>   	struct amdgpu_sync sync;
>   
> +	uint32_t gem_handle;
>   	bool aql_queue;
>   	bool is_imported;
>   };
> @@ -106,6 +108,9 @@ struct amdgpu_kfd_dev {
>   
>   	/* HMM page migration MEMORY_DEVICE_PRIVATE mapping */
>   	struct dev_pagemap pgmap;
> +
> +	/* Client for KFD BO GEM handle allocations */
> +	struct drm_client_dev client;
>   };
>   
>   enum kgd_engine_type {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 0c1cb6048259..4bb8b5fd7598 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -25,6 +25,7 @@
>   #include <linux/pagemap.h>
>   #include <linux/sched/mm.h>
>   #include <linux/sched/task.h>
> +#include <linux/fdtable.h>
>   #include <drm/ttm/ttm_tt.h>
>   
>   #include "amdgpu_object.h"
> @@ -804,13 +805,22 @@ kfd_mem_dmaunmap_attachment(struct kgd_mem *mem,
>   static int kfd_mem_export_dmabuf(struct kgd_mem *mem)
>   {
>   	if (!mem->dmabuf) {
> -		struct dma_buf *ret = amdgpu_gem_prime_export(
> -			&mem->bo->tbo.base,
> +		struct amdgpu_device *bo_adev;
> +		struct dma_buf *dmabuf;
> +		int r, fd;
> +
> +		bo_adev = amdgpu_ttm_adev(mem->bo->tbo.bdev);
> +		r = drm_gem_prime_handle_to_fd(&bo_adev->ddev, bo_adev->kfd.client.file,
> +					       mem->gem_handle,
>   			mem->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE ?
> -				DRM_RDWR : 0);
> -		if (IS_ERR(ret))
> -			return PTR_ERR(ret);
> -		mem->dmabuf = ret;
> +					       DRM_RDWR : 0, &fd);
> +		if (r)
> +			return r;
> +		dmabuf = dma_buf_get(fd);
> +		close_fd(fd);
> +		if (WARN_ON_ONCE(IS_ERR(dmabuf)))
> +			return PTR_ERR(dmabuf);
> +		mem->dmabuf = dmabuf;
>   	}
>   
>   	return 0;
> @@ -1826,6 +1836,9 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
>   		pr_debug("Failed to allow vma node access. ret %d\n", ret);
>   		goto err_node_allow;
>   	}
> +	ret = drm_gem_handle_create(adev->kfd.client.file, gobj, &(*mem)->gem_handle);
> +	if (ret)
> +		goto err_gem_handle_create;
>   	bo = gem_to_amdgpu_bo(gobj);
>   	if (bo_type == ttm_bo_type_sg) {
>   		bo->tbo.sg = sg;
> @@ -1877,6 +1890,8 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
>   err_pin_bo:
>   err_validate_bo:
>   	remove_kgd_mem_from_kfd_bo_list(*mem, avm->process_info);
> +	drm_gem_handle_delete(adev->kfd.client.file, (*mem)->gem_handle);
> +err_gem_handle_create:
>   	drm_vma_node_revoke(&gobj->vma_node, drm_priv);
>   err_node_allow:
>   	/* Don't unreserve system mem limit twice */
> @@ -1991,8 +2006,12 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
>   
>   	/* Free the BO*/
>   	drm_vma_node_revoke(&mem->bo->tbo.base.vma_node, drm_priv);
> -	if (mem->dmabuf)
> +	if (!mem->is_imported)
> +		drm_gem_handle_delete(adev->kfd.client.file, mem->gem_handle);
> +	if (mem->dmabuf) {
>   		dma_buf_put(mem->dmabuf);
> +		mem->dmabuf = NULL;
> +	}
>   	mutex_destroy(&mem->lock);
>   
>   	/* If this releases the last reference, it will end up calling
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index 06988cf1db51..4417a9863cd0 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -1855,8 +1855,8 @@ static uint32_t get_process_num_bos(struct kfd_process *p)
>   	return num_of_bos;
>   }
>   
> -static int criu_get_prime_handle(struct kgd_mem *mem, int flags,
> -				      u32 *shared_fd)
> +static int criu_get_prime_handle(struct kgd_mem *mem,
> +				 int flags, u32 *shared_fd)
>   {
>   	struct dma_buf *dmabuf;
>   	int ret;
