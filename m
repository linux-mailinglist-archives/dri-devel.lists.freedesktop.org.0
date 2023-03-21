Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6A16C3CCE
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 22:37:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D21D710E365;
	Tue, 21 Mar 2023 21:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2086.outbound.protection.outlook.com [40.107.237.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F40CB10E365;
 Tue, 21 Mar 2023 21:37:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cStYYt36TCD592QCUNdmnqNsd2ZqT8/EgvprzVG0vTd2wir/5DW1NleAJDmvx6voo7oPulheMRD0Z1ggWUas9SeI3y+KPbEjVf9CKwq8E7DHTSeo3N6s//bgklVfafY0bFhxUPKA8Lf1PDHYC7uX10dXsYEAnqeRKl6OCPndVrurZXNfp64RRzBcVpCneGaigFoq70SoPf6PlaZhhlQevribR1UqJ3idE1FHhf0PjaPoyfQlGCzxsHLmied9A+ugTJZ2rikirPq03TMqivPRzveBwCV45TbrSGAYpZiW+wSgdWKHU+EuZITn4qYqU4hJFbzm9zZMJ/uf88EYzfsLVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1NpTxRdadIAtdJvjbJ3fCvlcligIDdwf+CQXhr8hZw=;
 b=hVxACid9GEB3/tt3t8sUWfmIX3inrvLq65mJ8OiMbxt4GjByxtNGQ0p4/kbl5rM12m9P6WIztxPeYLErj/IAmy0yDOP5N8XkTiP7PxoJuDiGClM/xFgEOA9Njm26Lx6nisJRIlTXmDZZuurt0gg1YkVodvd/Ae474xAHeis+75y32Jlu97+NQSOMgvndLpw7rvcrI33JFzwTCi7y2tBMKC3hSiXF3cCieZjgLgQujuUD/Q+Lbmq5PSXz1YeaUi8oQdgjDWl+/uxte0yGG7r6m9ht8qzQOQ5UONDOUuGWv8WWmvJJD5dyDUboB63oLZyc+g4T4HNmzNveOdZ8OmzuUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1NpTxRdadIAtdJvjbJ3fCvlcligIDdwf+CQXhr8hZw=;
 b=vrizC/XTLBGPSFJT4WJ/HuDM2fRaJnww8aAVj8VOKQF3w5mgh5/3BTO1BMAaTUFqXGbtJ9xDF5TeE9n0VIlvz+lRR3wJ5shXp2nw5i+bBJy7puE4P+ak1N5NrI0Ldjqjxb4NR6JvAo9yU6B/z5BCrO0GAOm4OC4oTN8e4dKJwBE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by IA0PR12MB8983.namprd12.prod.outlook.com (2603:10b6:208:490::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 21:37:05 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 21:37:05 +0000
Message-ID: <9cd65a35-062b-d104-1c0f-c9147f37e20c@amd.com>
Date: Tue, 21 Mar 2023 17:37:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 23/32] drm/amdkfd: add debug wave launch override operation
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
 <20230125195401.4183544-24-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20230125195401.4183544-24-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0050.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::19) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|IA0PR12MB8983:EE_
X-MS-Office365-Filtering-Correlation-Id: e36da7ea-1ef7-4ddd-ece2-08db2a546a80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h1AcULWvVuVmBaS2YteDiWa8mcdpm8ZIE+pP3y+XX1f3+AmAIcF6osx2+Q4Sba733a2VBFs5ymy9XfkWvNddw82HQpB7jJmj9S/rTo+Ev2a6kvYQ/w2zKR/qP11ulaFpwKfgh3fHsIBUqBTuZ3/l99mj/tqQXbBIefQ1Y/RJXG84UtyUby/bN9PKK8vBjo88G1kOLXhPPG1yYcKXSp9ah/CBVkFOiMLvzTqeSsOXN7MGaBwy7YjEQL7Iod1uBCRdklhVivEghWeBpOTr4uK6bOh1Tv8st/IAQk6OKSgpoX89sjZInhkM2wOJbI3xDnJzWCj9UIEcgSatYhBS9NgugcjwOow4X+s3+Hp7P437y6ZLuMSu8mMzNr9ellGrqnMebA7iP5t6COlduUXfb3L+m46eBorH3ePmOZnuVp2GTKD41icl0hC66bpYhv3Bk04X6hcvVrwwW/dCrc5oBHabOacmMWe6GbCgGOX1ZX54eipwSWFy/g+388JP5yhd20YqCuXtm3r6a5hazsKP6BkqQZ9hg3fbYUg6cb7UGJ4cLfZl9blU3Pyv5gTxFxLGV9e/Q5Z4CeTfXHr01As+cYe4mlMixmp/lVhh00XoV/+JLgBgibRD0qZWqZK3QkvbTrsoIshT910nujp3fPWxzKLEE4rege9RSCXGpolCANMKI9JYPeSOG65Piu/L8PxvjZK3o12yGivIMRhzOkFRnnj2/iG+ywCDihdfkkB7Z344X+Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(346002)(39860400002)(366004)(136003)(451199018)(6506007)(31686004)(66476007)(66556008)(478600001)(450100002)(66946007)(5660300002)(8936002)(8676002)(30864003)(41300700001)(44832011)(36756003)(86362001)(31696002)(316002)(53546011)(36916002)(6486002)(6512007)(186003)(26005)(2616005)(2906002)(83380400001)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTdIdXVuMXVZdSs3ZUprTWFFSFJGU0VOeURHV3cydmplVnFRdXhSWmdCU0sw?=
 =?utf-8?B?OE5pa1hXenRPQjdKaW1kYkFzNm9OQm81ZVNxbDdYSTA1S0RoU09KRCtSVHVG?=
 =?utf-8?B?bG9Cb1B0QkdWamtaU2M5ZGFlR0x1Q3Fqa2ZqeURqaU9TZ2J0bUIxTFVmbnk0?=
 =?utf-8?B?QU9SeS9wMnNZL0lNUjRnWUdZK2xpWUhGWjN0VHp6NzgwOTdlcmlUVk4zVkUr?=
 =?utf-8?B?UXlheWd6SDRMQkhkcVVsODFXQ3IvV3RiK0VIVTZiM05RWDRDc1NORWxJWXpk?=
 =?utf-8?B?T0I5WEVNTTlQL0Y2ajZqdWs4cFdtb05KZ3ZSSWlPUHhzUGVvU3FyaTBwNDVn?=
 =?utf-8?B?akVWK3VCTmRzSEZSVXF2MWFvNGdIY3JBbVRWWE56eVUzOFBOeUtOY0tMd1F0?=
 =?utf-8?B?S1l5UW43Wm9TckxmUFdPelNSWGNzMFY4bHdWLzZKVngvTklJK2diVjBsVDRS?=
 =?utf-8?B?NGVmcEoycWRHbmFHS24zWFJuZEVuTXA3WnVtbm0vUGFDZTdVTzFCNWd3RXdV?=
 =?utf-8?B?d3l3UkFUYzVmRU1DSmF2Rk11YjE0Qm93L2U5ZitEMGdEMEJzYUwrR2JKcFlv?=
 =?utf-8?B?WkxFTmZWVVBNZ3FQaExsM0FPMGh3WGJLbUpzVys0K1JVb2wzY2M0dy9SOTlL?=
 =?utf-8?B?cDB5elRPWGhBQnRyQjN1MVArdzNnSmRWc2tTQTlyLyt4MlJxcE4wN01ndXAv?=
 =?utf-8?B?ZVlqOHU3OWdiMnhDWjhMeElZVjk3NmJid0JScEJYcndSVVp2YmlhUHVKWVE2?=
 =?utf-8?B?Lys5dUxCcm5aYllVRnE2U05mdklmeHI4bGFKK2FjbDZqQlplYlpzdDFQK054?=
 =?utf-8?B?cUtkT0JONm1yRW1Gd2x4ZUtPditqNmJMQ0lRTWIwTDI2THZTNU1ZYnN2OU15?=
 =?utf-8?B?dE43cVJWbytQekMvU1RmZmJxUk13RTBxaFJ0M0JCQ3RIbWZJbXhoZEJtLytq?=
 =?utf-8?B?dXpGbllzOVBsaHdleUppVjQxYjVPWTRicUc5c3hxeTc4VHc0RHlZcU5VU3N4?=
 =?utf-8?B?cGU1VlhFN2Zsby9DR2xDdzR5MjNaV3ZQQ1c3OGNHcTNsQVp4d3RtQTB2NFBK?=
 =?utf-8?B?akdNendvQlhoREp2N25udmdUVEhCdEVTZTJoUjhuQVRYYlMxNDU0VDNSaTQz?=
 =?utf-8?B?ZVM3c3NvdU5IS3BMdnQ5LzYzYmRkR3lSQ3lLY1Q5U21tM1FVaFBtS3BaaGd6?=
 =?utf-8?B?L0JWaWlBTno3YUdwQTNveGNpdnRWWHorVDdIL2ZNTGJHa1I1ZW15YXV1RUQ2?=
 =?utf-8?B?Y0k1QldXZDlHcjk0dHFXL0IxbUFOdElZOWtScElHQVltS2duL01PbUFRUmlW?=
 =?utf-8?B?UmhIclh6M1NFRlNxUGNxRGdCOFM0Z3dCNm5WQ3Y1RXlyUUdJaWxUWGVReWVv?=
 =?utf-8?B?WTdBUXZXTXIraGZFS0p4aG1qZ2VOWi9TdUcrMjlQdGpQWUJ5T3R2aVcwczNN?=
 =?utf-8?B?eCtkSitYb0J3aVJMbHBKZ2czMEVpNmJpSndUZVd4NGlKZVRseXNrVXdOT2Zv?=
 =?utf-8?B?YjNzd0lobmpvMkM4amlRUnRZWk14bExWZDI2RWNReXBFbC9zQjhVYlRmYW1P?=
 =?utf-8?B?ZDFoME9kMGxXdlN6enN5aitQYktrVktTNnlyUUx4amUza3FtRC9tbDJzT3BU?=
 =?utf-8?B?Qm1IREkvMGJBWVhvQ3J5VXpLN09jZHRocGFmMGIydGlSMVR1Zk5jdEc5UlZJ?=
 =?utf-8?B?QWFrNU10ZXZUZUxhSzlQTTRFTDRob2hvTDBMaXlXRVRCUURYT3ZJeG02d1hn?=
 =?utf-8?B?VjJwSGFnRXhSajlSMzczVmpXM3oyR2htWjMvbVFaWTY3VkFpOVVubzBTVFY1?=
 =?utf-8?B?Wm0xZG5tcjYwN2puVnZpSUdUbjBJendaNzk1cVBhdFZZNWtnb3pKekszQjZZ?=
 =?utf-8?B?cEZvb1ZmNnNwK2xaUnFCSTVQaTZnRndTUG05VEkyMjhnbStPbmZLQmVFd1Nm?=
 =?utf-8?B?WXZzSVcwRVlPVWhQZ0tVaWQvVmdRMGR6WVU2STRLS2l3Qm9ZRUZHaERGM2Iz?=
 =?utf-8?B?UXAxYXdyZUtDM0RnQmJKYjNzcHRWanJOS0w1ZTRlRkxaSk1TVU9lcHdRcFgv?=
 =?utf-8?B?aWJsRmJJYmQzK0k5eUtwaXN3Wmdhd24xZ21yS09oYWd5aFNYY2JISnZqdU9t?=
 =?utf-8?Q?hWnzX8GlTmbJbVpx6DD9fEb9b?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e36da7ea-1ef7-4ddd-ece2-08db2a546a80
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 21:37:05.7072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eq+y/6MrMRfaBJssmlu0hH9hmpuPCWOBYrTzCys0e1mkPm3hzih6lZy4D4yZ9iLNfwDBpT6R6uGhu+gtZNZQ5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8983
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


On 2023-01-25 14:53, Jonathan Kim wrote:
> This operation allows the debugger to override the enabled HW
> exceptions on the device.
>
> On debug devices that only support the debugging of a single process,
> the HW exceptions are global and set through the SPI_GDBG_TRAP_MASK
> register.
> Because they are global, only address watch exceptions are allowed to
> be enabled.  In other words, the debugger must preserve all non-address
> watch exception states in normal mode operation by barring a full
> replacement override or a non-address watch override request.
>
> For multi-process debugging, all HW exception overrides are per-VMID so
> all exceptions can be overridden or fully replaced.
>
> In order for the debugger to know what is permissible, returned the
> supported override mask back to the debugger along with the previously
> enable overrides.
>
> v3: v2 was reviewed but requesting re-review for GFX11 added supported.
>
> v2: switch unsupported override mode return from EPERM to EINVAL to
> support unique EPERM on PTRACE failure.
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
> ---
>   .../drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c  | 47 ++++++++++
>   .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |  2 +
>   .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c    | 55 ++++++++++++
>   .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h    | 10 +++
>   .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c  |  5 +-
>   .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c    | 86 ++++++++++++++++++-
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c | 55 ++++++++++++
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h | 10 +++
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  7 ++
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.c        | 69 +++++++++++++++
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.h        |  6 ++
>   11 files changed, 350 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
> index a64a53f9efe6..84a9d9391ea4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
> @@ -25,6 +25,7 @@
>   #include "amdgpu_amdkfd_gfx_v9.h"
>   #include "gc/gc_9_4_2_offset.h"
>   #include "gc/gc_9_4_2_sh_mask.h"
> +#include <uapi/linux/kfd_ioctl.h>
>   
>   /**
>    * Returns TRAP_EN, EXCP_EN and EXCP_REPLACE.
> @@ -62,6 +63,50 @@ static uint32_t kgd_aldebaran_disable_debug_trap(struct amdgpu_device *adev,
>   	return data;
>   }
>   
> +static int kgd_aldebaran_validate_trap_override_request(struct amdgpu_device *adev,
> +							uint32_t trap_override,
> +							uint32_t *trap_mask_supported)
> +{
> +	*trap_mask_supported &= KFD_DBG_TRAP_MASK_FP_INVALID |
> +				KFD_DBG_TRAP_MASK_FP_INPUT_DENORMAL |
> +				KFD_DBG_TRAP_MASK_FP_DIVIDE_BY_ZERO |
> +				KFD_DBG_TRAP_MASK_FP_OVERFLOW |
> +				KFD_DBG_TRAP_MASK_FP_UNDERFLOW |
> +				KFD_DBG_TRAP_MASK_FP_INEXACT |
> +				KFD_DBG_TRAP_MASK_INT_DIVIDE_BY_ZERO |
> +				KFD_DBG_TRAP_MASK_DBG_ADDRESS_WATCH |
> +				KFD_DBG_TRAP_MASK_DBG_MEMORY_VIOLATION;
> +
> +	if (trap_override != KFD_DBG_TRAP_OVERRIDE_OR &&
> +			trap_override != KFD_DBG_TRAP_OVERRIDE_REPLACE)
> +		return -EPERM;
> +
> +	return 0;
> +}
> +
> +/* returns TRAP_EN, EXCP_EN and EXCP_RPLACE. */
> +static uint32_t kgd_aldebaran_set_wave_launch_trap_override(struct amdgpu_device *adev,
> +					uint32_t vmid,
> +					uint32_t trap_override,
> +					uint32_t trap_mask_bits,
> +					uint32_t trap_mask_request,
> +					uint32_t *trap_mask_prev,
> +					uint32_t kfd_dbg_trap_cntl_prev)
> +
> +{
> +	uint32_t data = 0;
> +
> +	*trap_mask_prev = REG_GET_FIELD(kfd_dbg_trap_cntl_prev, SPI_GDBG_PER_VMID_CNTL, EXCP_EN);
> +	trap_mask_bits = (trap_mask_bits & trap_mask_request) |
> +		(*trap_mask_prev & ~trap_mask_request);
> +
> +	data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, TRAP_EN, 1);
> +	data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, EXCP_EN, trap_mask_bits);
> +	data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, EXCP_REPLACE, trap_override);
> +
> +	return data;
> +}
> +
>   const struct kfd2kgd_calls aldebaran_kfd2kgd = {
>   	.program_sh_mem_settings = kgd_gfx_v9_program_sh_mem_settings,
>   	.set_pasid_vmid_mapping = kgd_gfx_v9_set_pasid_vmid_mapping,
> @@ -81,6 +126,8 @@ const struct kfd2kgd_calls aldebaran_kfd2kgd = {
>   	.set_vm_context_page_table_base = kgd_gfx_v9_set_vm_context_page_table_base,
>   	.enable_debug_trap = kgd_aldebaran_enable_debug_trap,
>   	.disable_debug_trap = kgd_aldebaran_disable_debug_trap,
> +	.validate_trap_override_request = kgd_aldebaran_validate_trap_override_request,
> +	.set_wave_launch_trap_override = kgd_aldebaran_set_wave_launch_trap_override,
>   	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
>   	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
>   	.program_trap_handler_settings = kgd_gfx_v9_program_trap_handler_settings,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> index ef8befc31fc6..0405725e95e3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> @@ -410,6 +410,8 @@ const struct kfd2kgd_calls arcturus_kfd2kgd = {
>   				kgd_gfx_v9_set_vm_context_page_table_base,
>   	.enable_debug_trap = kgd_arcturus_enable_debug_trap,
>   	.disable_debug_trap = kgd_arcturus_disable_debug_trap,
> +	.validate_trap_override_request = kgd_gfx_v9_validate_trap_override_request,
> +	.set_wave_launch_trap_override = kgd_gfx_v9_set_wave_launch_trap_override,
>   	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
>   	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
>   	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> index 2491402afd58..32a6e5fbeacd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> @@ -31,6 +31,7 @@
>   #include "v10_structs.h"
>   #include "nv.h"
>   #include "nvd.h"
> +#include <uapi/linux/kfd_ioctl.h>
>   
>   enum hqd_dequeue_request_type {
>   	NO_ACTION = 0,
> @@ -801,6 +802,58 @@ uint32_t kgd_gfx_v10_disable_debug_trap(struct amdgpu_device *adev,
>   	return 0;
>   }
>   
> +int kgd_gfx_v10_validate_trap_override_request(struct amdgpu_device *adev,
> +					      uint32_t trap_override,
> +					      uint32_t *trap_mask_supported)
> +{
> +	*trap_mask_supported &= KFD_DBG_TRAP_MASK_DBG_ADDRESS_WATCH;
> +
> +	/* The SPI_GDBG_TRAP_MASK register is global and affects all
> +	 * processes. Only allow OR-ing the address-watch bit, since
> +	 * this only affects processes under the debugger. Other bits
> +	 * should stay 0 to avoid the debugger interfering with other
> +	 * processes.
> +	 */
> +	if (trap_override != KFD_DBG_TRAP_OVERRIDE_OR)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +uint32_t kgd_gfx_v10_set_wave_launch_trap_override(struct amdgpu_device *adev,
> +					      uint32_t vmid,
> +					      uint32_t trap_override,
> +					      uint32_t trap_mask_bits,
> +					      uint32_t trap_mask_request,
> +					      uint32_t *trap_mask_prev,
> +					      uint32_t kfd_dbg_trap_cntl_prev)
> +{
> +	uint32_t data, wave_cntl_prev;
> +
> +	mutex_lock(&adev->grbm_idx_mutex);
> +
> +	wave_cntl_prev = RREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL));
> +
> +	kgd_gfx_v10_set_wave_launch_stall(adev, vmid, true);
> +
> +	data = RREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK));
> +	*trap_mask_prev = REG_GET_FIELD(data, SPI_GDBG_TRAP_MASK, EXCP_EN);
> +
> +	trap_mask_bits = (trap_mask_bits & trap_mask_request) |
> +		(*trap_mask_prev & ~trap_mask_request);
> +
> +	data = REG_SET_FIELD(data, SPI_GDBG_TRAP_MASK, EXCP_EN, trap_mask_bits);
> +	data = REG_SET_FIELD(data, SPI_GDBG_TRAP_MASK, REPLACE, trap_override);
> +	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), data);
> +
> +	/* We need to preserve wave launch mode stall settings. */
> +	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL), wave_cntl_prev);
> +
> +	mutex_unlock(&adev->grbm_idx_mutex);
> +
> +	return 0;
> +}
> +
>   /* kgd_gfx_v10_get_iq_wait_times: Returns the mmCP_IQ_WAIT_TIME1/2 values
>    * The values read are:
>    *     ib_offload_wait_time     -- Wait Count for Indirect Buffer Offloads.
> @@ -886,6 +939,8 @@ const struct kfd2kgd_calls gfx_v10_kfd2kgd = {
>   	.set_vm_context_page_table_base = set_vm_context_page_table_base,
>   	.enable_debug_trap = kgd_gfx_v10_enable_debug_trap,
>   	.disable_debug_trap = kgd_gfx_v10_disable_debug_trap,
> +	.validate_trap_override_request = kgd_gfx_v10_validate_trap_override_request,
> +	.set_wave_launch_trap_override = kgd_gfx_v10_set_wave_launch_trap_override,
>   	.get_iq_wait_times = kgd_gfx_v10_get_iq_wait_times,
>   	.build_grace_period_packet_info = kgd_gfx_v10_build_grace_period_packet_info,
>   	.program_trap_handler_settings = program_trap_handler_settings,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
> index 0abc1e805180..85c929fc2926 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
> @@ -26,6 +26,16 @@ uint32_t kgd_gfx_v10_enable_debug_trap(struct amdgpu_device *adev,
>   uint32_t kgd_gfx_v10_disable_debug_trap(struct amdgpu_device *adev,
>   					bool keep_trap_enabled,
>   					uint32_t vmid);
> +int kgd_gfx_v10_validate_trap_override_request(struct amdgpu_device *adev,
> +					     uint32_t trap_override,
> +					     uint32_t *trap_mask_supported);
> +uint32_t kgd_gfx_v10_set_wave_launch_trap_override(struct amdgpu_device *adev,
> +					     uint32_t vmid,
> +					     uint32_t trap_override,
> +					     uint32_t trap_mask_bits,
> +					     uint32_t trap_mask_request,
> +					     uint32_t *trap_mask_prev,
> +					     uint32_t kfd_dbg_trap_cntl_prev);
>   void kgd_gfx_v10_get_iq_wait_times(struct amdgpu_device *adev, uint32_t *wait_times);
>   void kgd_gfx_v10_build_grace_period_packet_info(struct amdgpu_device *adev,
>   					       uint32_t wait_times,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
> index c57f2a6b6e23..ae3ead207df4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
> @@ -673,5 +673,8 @@ const struct kfd2kgd_calls gfx_v10_3_kfd2kgd = {
>   	.get_iq_wait_times = kgd_gfx_v10_get_iq_wait_times,
>   	.build_grace_period_packet_info = kgd_gfx_v10_build_grace_period_packet_info,
>   	.enable_debug_trap = kgd_gfx_v10_enable_debug_trap,
> -	.disable_debug_trap = kgd_gfx_v10_disable_debug_trap
> +	.disable_debug_trap = kgd_gfx_v10_disable_debug_trap,
> +	.validate_trap_override_request = kgd_gfx_v10_validate_trap_override_request,
> +	.set_wave_launch_trap_override = kgd_gfx_v10_set_wave_launch_trap_override
> +
>   };
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
> index 34aeff692eba..3fb81e6e9422 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
> @@ -643,6 +643,88 @@ static uint32_t kgd_gfx_v11_disable_debug_trap(struct amdgpu_device *adev,
>   	return data;
>   }
>   
> +static int kgd_gfx_v11_validate_trap_override_request(struct amdgpu_device *adev,
> +							uint32_t trap_override,
> +							uint32_t *trap_mask_supported)
> +{
> +	*trap_mask_supported &= KFD_DBG_TRAP_MASK_FP_INVALID |
> +				KFD_DBG_TRAP_MASK_FP_INPUT_DENORMAL |
> +				KFD_DBG_TRAP_MASK_FP_DIVIDE_BY_ZERO |
> +				KFD_DBG_TRAP_MASK_FP_OVERFLOW |
> +				KFD_DBG_TRAP_MASK_FP_UNDERFLOW |
> +				KFD_DBG_TRAP_MASK_FP_INEXACT |
> +				KFD_DBG_TRAP_MASK_INT_DIVIDE_BY_ZERO |
> +				KFD_DBG_TRAP_MASK_DBG_ADDRESS_WATCH |
> +				KFD_DBG_TRAP_MASK_DBG_MEMORY_VIOLATION;
> +
> +	if (adev->ip_versions[GC_HWIP][0] >= IP_VERSION(11, 0, 4))
> +		*trap_mask_supported |= KFD_DBG_TRAP_MASK_TRAP_ON_WAVE_START |
> +					KFD_DBG_TRAP_MASK_TRAP_ON_WAVE_END;
> +
> +	if (trap_override != KFD_DBG_TRAP_OVERRIDE_OR &&
> +			trap_override != KFD_DBG_TRAP_OVERRIDE_REPLACE)
> +		return -EPERM;
> +
> +	return 0;
> +}
> +
> +static uint32_t trap_mask_map_sw_to_hw(uint32_t mask)
> +{
> +	uint32_t trap_on_start = (mask & KFD_DBG_TRAP_MASK_TRAP_ON_WAVE_START) ? 1 : 0;
> +	uint32_t trap_on_end = (mask & KFD_DBG_TRAP_MASK_TRAP_ON_WAVE_END) ? 1 : 0;
> +	uint32_t excp_en = mask & (KFD_DBG_TRAP_MASK_FP_INVALID |
> +			KFD_DBG_TRAP_MASK_FP_INPUT_DENORMAL |
> +			KFD_DBG_TRAP_MASK_FP_DIVIDE_BY_ZERO |
> +			KFD_DBG_TRAP_MASK_FP_OVERFLOW |
> +			KFD_DBG_TRAP_MASK_FP_UNDERFLOW |
> +			KFD_DBG_TRAP_MASK_FP_INEXACT |
> +			KFD_DBG_TRAP_MASK_INT_DIVIDE_BY_ZERO |
> +			KFD_DBG_TRAP_MASK_DBG_ADDRESS_WATCH |
> +			KFD_DBG_TRAP_MASK_DBG_MEMORY_VIOLATION);
> +	uint32_t ret;
> +
> +	ret = REG_SET_FIELD(0, SPI_GDBG_PER_VMID_CNTL, EXCP_EN, excp_en);
> +	ret = REG_SET_FIELD(ret, SPI_GDBG_PER_VMID_CNTL, TRAP_ON_START, trap_on_start);
> +	ret = REG_SET_FIELD(ret, SPI_GDBG_PER_VMID_CNTL, TRAP_ON_END, trap_on_end);
> +
> +	return ret;
> +}
> +
> +static uint32_t trap_mask_map_hw_to_sw(uint32_t mask)
> +{
> +	uint32_t ret = REG_GET_FIELD(mask, SPI_GDBG_PER_VMID_CNTL, EXCP_EN);
> +
> +	if (REG_GET_FIELD(mask, SPI_GDBG_PER_VMID_CNTL, TRAP_ON_START))
> +		ret |= KFD_DBG_TRAP_MASK_TRAP_ON_WAVE_START;
> +
> +	if (REG_GET_FIELD(mask, SPI_GDBG_PER_VMID_CNTL, TRAP_ON_END))
> +		ret |= KFD_DBG_TRAP_MASK_TRAP_ON_WAVE_END;
> +
> +	return ret;
> +}
> +
> +/* Returns TRAP_EN, EXCP_EN and EXCP_REPLACE. */
> +static uint32_t kgd_gfx_v11_set_wave_launch_trap_override(struct amdgpu_device *adev,
> +					uint32_t vmid,
> +					uint32_t trap_override,
> +					uint32_t trap_mask_bits,
> +					uint32_t trap_mask_request,
> +					uint32_t *trap_mask_prev,
> +					uint32_t kfd_dbg_trap_cntl_prev)
> +{
> +	uint32_t data = 0;
> +
> +	*trap_mask_prev = trap_mask_map_hw_to_sw(kfd_dbg_trap_cntl_prev);
> +
> +	data = (trap_mask_bits & trap_mask_request) | (*trap_mask_prev & ~trap_mask_request);
> +	data = trap_mask_map_sw_to_hw(data);
> +
> +	data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, TRAP_EN, 1);
> +	data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, EXCP_REPLACE, trap_override);
> +
> +	return data;
> +}
> +
>   const struct kfd2kgd_calls gfx_v11_kfd2kgd = {
>   	.program_sh_mem_settings = program_sh_mem_settings_v11,
>   	.set_pasid_vmid_mapping = set_pasid_vmid_mapping_v11,
> @@ -660,5 +742,7 @@ const struct kfd2kgd_calls gfx_v11_kfd2kgd = {
>   	.get_atc_vmid_pasid_mapping_info = NULL,
>   	.set_vm_context_page_table_base = set_vm_context_page_table_base_v11,
>   	.enable_debug_trap = kgd_gfx_v11_enable_debug_trap,
> -	.disable_debug_trap = kgd_gfx_v11_disable_debug_trap
> +	.disable_debug_trap = kgd_gfx_v11_disable_debug_trap,
> +	.validate_trap_override_request = kgd_gfx_v11_validate_trap_override_request,
> +	.set_wave_launch_trap_override = kgd_gfx_v11_set_wave_launch_trap_override
>   };
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> index 4a8bd266d3f6..81643385512a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> @@ -38,6 +38,7 @@
>   #include "soc15d.h"
>   #include "gfx_v9_0.h"
>   #include "amdgpu_amdkfd_gfx_v9.h"
> +#include <uapi/linux/kfd_ioctl.h>
>   
>   enum hqd_dequeue_request_type {
>   	NO_ACTION = 0,
> @@ -737,6 +738,58 @@ uint32_t kgd_gfx_v9_disable_debug_trap(struct amdgpu_device *adev,
>   	return 0;
>   }
>   
> +int kgd_gfx_v9_validate_trap_override_request(struct amdgpu_device *adev,
> +					uint32_t trap_override,
> +					uint32_t *trap_mask_supported)
> +{
> +	*trap_mask_supported &= KFD_DBG_TRAP_MASK_DBG_ADDRESS_WATCH;
> +
> +	/* The SPI_GDBG_TRAP_MASK register is global and affects all
> +	 * processes. Only allow OR-ing the address-watch bit, since
> +	 * this only affects processes under the debugger. Other bits
> +	 * should stay 0 to avoid the debugger interfering with other
> +	 * processes.
> +	 */
> +	if (trap_override != KFD_DBG_TRAP_OVERRIDE_OR)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +uint32_t kgd_gfx_v9_set_wave_launch_trap_override(struct amdgpu_device *adev,
> +					     uint32_t vmid,
> +					     uint32_t trap_override,
> +					     uint32_t trap_mask_bits,
> +					     uint32_t trap_mask_request,
> +					     uint32_t *trap_mask_prev,
> +					     uint32_t kfd_dbg_cntl_prev)
> +{
> +	uint32_t data, wave_cntl_prev;
> +
> +	mutex_lock(&adev->grbm_idx_mutex);
> +
> +	wave_cntl_prev = RREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL));
> +
> +	kgd_gfx_v9_set_wave_launch_stall(adev, vmid, true);
> +
> +	data = RREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK));
> +	*trap_mask_prev = REG_GET_FIELD(data, SPI_GDBG_TRAP_MASK, EXCP_EN);
> +
> +	trap_mask_bits = (trap_mask_bits & trap_mask_request) |
> +		(*trap_mask_prev & ~trap_mask_request);
> +
> +	data = REG_SET_FIELD(data, SPI_GDBG_TRAP_MASK, EXCP_EN, trap_mask_bits);
> +	data = REG_SET_FIELD(data, SPI_GDBG_TRAP_MASK, REPLACE, trap_override);
> +	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), data);
> +
> +	/* We need to preserve wave launch mode stall settings. */
> +	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL), wave_cntl_prev);
> +
> +	mutex_unlock(&adev->grbm_idx_mutex);
> +
> +	return 0;
> +}
> +
>   /* kgd_gfx_v9_get_iq_wait_times: Returns the mmCP_IQ_WAIT_TIME1/2 values
>    * The values read are:
>    *     ib_offload_wait_time     -- Wait Count for Indirect Buffer Offloads.
> @@ -1005,6 +1058,8 @@ const struct kfd2kgd_calls gfx_v9_kfd2kgd = {
>   	.set_vm_context_page_table_base = kgd_gfx_v9_set_vm_context_page_table_base,
>   	.enable_debug_trap = kgd_gfx_v9_enable_debug_trap,
>   	.disable_debug_trap = kgd_gfx_v9_disable_debug_trap,
> +	.validate_trap_override_request = kgd_gfx_v9_validate_trap_override_request,
> +	.set_wave_launch_trap_override = kgd_gfx_v9_set_wave_launch_trap_override,
>   	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
>   	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
>   	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
> index c0866497cb5c..47cff392b434 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
> @@ -64,6 +64,16 @@ uint32_t kgd_gfx_v9_enable_debug_trap(struct amdgpu_device *adev,
>   uint32_t kgd_gfx_v9_disable_debug_trap(struct amdgpu_device *adev,
>   					bool keep_trap_enabled,
>   					uint32_t vmid);
> +int kgd_gfx_v9_validate_trap_override_request(struct amdgpu_device *adev,
> +					     uint32_t trap_override,
> +					     uint32_t *trap_mask_supported);
> +uint32_t kgd_gfx_v9_set_wave_launch_trap_override(struct amdgpu_device *adev,
> +					     uint32_t vmid,
> +					     uint32_t trap_override,
> +					     uint32_t trap_mask_bits,
> +					     uint32_t trap_mask_request,
> +					     uint32_t *trap_mask_prev,
> +					     uint32_t kfd_dbg_trap_cntl_prev);
>   void kgd_gfx_v9_get_iq_wait_times(struct amdgpu_device *adev, uint32_t *wait_times);
>   void kgd_gfx_v9_build_grace_period_packet_info(struct amdgpu_device *adev,
>   					       uint32_t wait_times,
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index 9b87ba351eff..28b9db5806f4 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -2896,6 +2896,13 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
>   				args->set_exceptions_enabled.exception_mask);
>   		break;
>   	case KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_OVERRIDE:
> +		r = kfd_dbg_trap_set_wave_launch_override(target,
> +				args->launch_override.override_mode,
> +				args->launch_override.enable_mask,
> +				args->launch_override.support_request_mask,
> +				&args->launch_override.enable_mask,
> +				&args->launch_override.support_request_mask);
> +		break;
>   	case KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_MODE:
>   	case KFD_IOC_DBG_TRAP_SUSPEND_QUEUES:
>   	case KFD_IOC_DBG_TRAP_RESUME_QUEUES:
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> index 3ea53aaa776b..a9b52f114ac6 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> @@ -530,6 +530,75 @@ int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
>   	return r;
>   }
>   
> +static int kfd_dbg_validate_trap_override_request(struct kfd_process *p,
> +						uint32_t trap_override,
> +						uint32_t trap_mask_request,
> +						uint32_t *trap_mask_supported)
> +{
> +	int i = 0;
> +
> +	*trap_mask_supported = 0xffffffff;
> +
> +	for (i = 0; i < p->n_pdds; i++) {
> +		struct kfd_process_device *pdd = p->pdds[i];
> +		int err = pdd->dev->kfd2kgd->validate_trap_override_request(
> +								pdd->dev->adev,
> +								trap_override,
> +								trap_mask_supported);
> +
> +		if (err)
> +			return err;
> +	}
> +
> +	if (trap_mask_request & ~*trap_mask_supported)
> +		return -EACCES;
> +
> +	return 0;
> +}
> +
> +int kfd_dbg_trap_set_wave_launch_override(struct kfd_process *target,
> +					uint32_t trap_override,
> +					uint32_t trap_mask_bits,
> +					uint32_t trap_mask_request,
> +					uint32_t *trap_mask_prev,
> +					uint32_t *trap_mask_supported)
> +{
> +	int r = 0, i;
> +
> +	r = kfd_dbg_validate_trap_override_request(target,
> +						trap_override,
> +						trap_mask_request,
> +						trap_mask_supported);
> +
> +	if (r)
> +		return r;
> +
> +	for (i = 0; i < target->n_pdds; i++) {
> +		struct kfd_process_device *pdd = target->pdds[i];
> +
> +		amdgpu_gfx_off_ctrl(pdd->dev->adev, false);

I think the gfxoff stuff is not needed on HW that supports multi-process 
debugging because these functions don't touch HW registers in that case. 
I think the gfxoff stuff should be done in the HW-specific functions 
only if needed. Maybe that comment applies to more patches than just 
this one. It's an improvement we could do in a follow up to make sure 
we're not missing any cases.

The patch is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> +		pdd->spi_dbg_override = pdd->dev->kfd2kgd->set_wave_launch_trap_override(
> +				pdd->dev->adev,
> +				pdd->dev->vm_info.last_vmid_kfd,
> +				trap_override,
> +				trap_mask_bits,
> +				trap_mask_request,
> +				trap_mask_prev,
> +				pdd->spi_dbg_override);
> +		amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
> +
> +		if (!pdd->dev->shared_resources.enable_mes)
> +			r = debug_refresh_runlist(pdd->dev->dqm);
> +		else
> +			r = kfd_dbg_set_mes_debug_mode(pdd);
> +
> +		if (r)
> +			break;
> +	}
> +
> +	return r;
> +}
> +
>   void kfd_dbg_set_enabled_debug_exception_mask(struct kfd_process *target,
>   					uint64_t exception_set_mask)
>   {
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> index 81557579ab04..864eb01f8973 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> @@ -45,6 +45,12 @@ int kfd_dbg_trap_disable(struct kfd_process *target);
>   int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
>   			void __user *runtime_info,
>   			uint32_t *runtime_info_size);
> +int kfd_dbg_trap_set_wave_launch_override(struct kfd_process *target,
> +					uint32_t trap_override,
> +					uint32_t trap_mask_bits,
> +					uint32_t trap_mask_request,
> +					uint32_t *trap_mask_prev,
> +					uint32_t *trap_mask_supported);
>   
>   int kfd_dbg_send_exception_to_runtime(struct kfd_process *p,
>   					unsigned int dev_id,
