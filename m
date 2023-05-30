Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61401716E92
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 22:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3731510E199;
	Tue, 30 May 2023 20:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::623])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F82610E110;
 Tue, 30 May 2023 20:21:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BWHhmGGgzSDQjozJXnoNTW0tVyMrmDigaYvELZf5SDTX/8Plg7JZG1q5cGW3jhqCw4idZrDF7OVLMuA6TbYCsvKy7NWq4Mtmc9NY8w2jHxDVtYaKGobSczKWgHkcphJ0yPgGHM7ksGcEtiEyfR83xXP/Zchp6KDIkPbdZvPsHqFna1pIDatF2rDGZ8IBuuueBazS8hBYASLE8f59KOFKgQY4USx7YpbRVPv+7Q5SNMupKH+XGqExHzo3IHbGKn8KVa4EThniUx5eqINqytRnATry4F9uF+7rtjTIIO4idBcRHQMhtUyCY312dQzOxx7aZhrbfxDk+xN9LJJnPDb4Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sTh+Mum/1wo86ds4wxC9dNLR51MoZUTpyQ133SyhQZg=;
 b=HPLwYnHFzLuJjrndM/BoUfS8NZ+d+VI9FaaqM0pmXPcXSfXrhDI7qnMbf1GhVU7MIToQPw1G1Skz8Uwd61aqa9FlR1HagVGOGSaYMBgccVp6+yN62OOUROwrPvNeAb6LLMZL6BdL6Fi9zx0VxR50mTH72y3FYDLMd+dDu9zTNTsVHLyzL7kYK4O6MhY0efIU6PJj91rWt1jlqGgW8B5a4LfXKhpzXMDhJGkb8dgrZopKxK2Goy+8rFKxrgdybbvRe0CykJUuMzz8mq+i/zJfvYlXQCK2lRXmOnmo/VmQ3Dr4myZaHkBf+z/ud6hFGEuRitqk3jLGPjVpmbJm2utzrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sTh+Mum/1wo86ds4wxC9dNLR51MoZUTpyQ133SyhQZg=;
 b=Qn7K2ZlTc4S2ykKPOGyyvNexkudaFzVjp++9sCOxCmwzvY3RzknpS5fSE82uCIrUDoPWnSV1qoPVyepZSenHJ0I7Xnnn6i/hKTEZzxXZN2gRfSnXHVFxr/2+q9zZCN0QKikuO5WGmX/qMcqK4TQ8ZvMqoH9cR5dDfxkS7X0m2s0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by IA1PR12MB6529.namprd12.prod.outlook.com (2603:10b6:208:3a6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 20:21:14 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::943e:32fb:5204:a343]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::943e:32fb:5204:a343%3]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 20:21:13 +0000
Message-ID: <056583d6-049b-11b6-8918-555821620658@amd.com>
Date: Tue, 30 May 2023 16:21:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 24/33] drm/amdkfd: add debug wave launch override operation
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230525172745.702700-1-jonathan.kim@amd.com>
 <20230525172745.702700-24-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230525172745.702700-24-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0076.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::13) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|IA1PR12MB6529:EE_
X-MS-Office365-Filtering-Correlation-Id: 33bfcb25-9704-4531-d8f2-08db614b6a23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nQqWuuRwWn1sNgHrmd7SakxvYwJu9ZyajDMYa1bOc08uhuZcKxe6AR3Sr2ZkI/0YrXiArFn8+8Lrze29Dio+/+hh3nO77g4al3tThl36lzqnT6k7Zw8YyFnxO+HDMPHw6vZAxoEGFPc852ZImU6V428ub6el35LtpKI/SFcFW6JIOYh+EkgaUmOksKx7TObxfGPKqhj/ZcisEZNnmt3/tAspdP3y5N63z8Bk+j5CWXupUghbVfRi34NaF39phKasaflpMvCQvHbo/u1fYhEKeTEybz2H1m7c6FFfadJeN0Dc9oHcKFhAENgBXvm2UyTnWKpT/8c6y/bOrORq8GEyKigNg900hHF1pXCvX5hR7V9pL33OYd4EhOVQe6N+bzTDQ7nmiAINl/TxeJZPMkheDXF7lDoKXpExuwvs6xll4Idfsu+zz0+JqoKBiQo5s/M5J9Z4c5QJn3LPQ6xgkeKCZUXC/1iS9m5djOPU5y8DwNv8a736FNikP/1HDir+l0AU7VroEgt8sXNQ4FhiLs/VIwRDKPKRJTwZxX5rOqEXiXzfQSUmJWR3YfJ7IJyxDkqrkYGXoIgThGQjqJW8KKhwCtwBtg6FoBAIsxpdkFyaqTnFV6UdTS21wvAmRsA5lsO9P3WFrnKzXSgjUBDgC5kwow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(366004)(39860400002)(346002)(396003)(376002)(451199021)(26005)(38100700002)(41300700001)(6486002)(186003)(83380400001)(6506007)(31686004)(6512007)(2616005)(478600001)(66556008)(4326008)(66946007)(316002)(450100002)(5660300002)(66476007)(8676002)(8936002)(44832011)(86362001)(31696002)(2906002)(30864003)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dk53TXF0TDI0WTdSNFRVYzF5RmZ1R20xemlpUjJvUEdPYnZ2SWM2RVFhdHRO?=
 =?utf-8?B?UlpMazdXTGd2d0xtcndIVkVrSE9ETHNhcUsyL0p2SEdXeEFPRkFEMitGRWJE?=
 =?utf-8?B?eHlFdWt6aGxOMC9QRFQ2RE9iOEw2NURCOG1oVGZoZ0ZSUGZjandMZ2srczg4?=
 =?utf-8?B?Ly9QU1JBeFdqTmVCekduSzc4Q1h3dDZCSjhFaitZK29HQVZUWUNQSUFPMG9p?=
 =?utf-8?B?SXlCRHpISnBFRkd2Nm9HKzFQSndwUzNOQXFZa2tIdTZuckNLVEJZNitDblBX?=
 =?utf-8?B?cVh4L3c2bi9LUmtmQWgrYWoxeElTMWtNNHZlUitId2NzaC8wbWdRRmxDUVhx?=
 =?utf-8?B?ZTI4QmFhSUM1a0xDMFFKL0hibGFGaHRnV25UTWU5TFFJRDRCYXBMR04raXVq?=
 =?utf-8?B?T2l0RG9mb3ZpMVVuU2ZqSVFHV0piLy9reUhQSVFOMzRVZ0NBRGZUS3VMdW9t?=
 =?utf-8?B?bDJ5Q1h2UU53cS9tWTJzeGhFOGovOEhQSDNRWXpyVXk2UEdNNld6L09Ub0ZI?=
 =?utf-8?B?RkFySVE5bnY1SjQrWDhtWWJtS0M3Z2hkSEt3MEk5ZlF2MWRORnBXeHpxTHo5?=
 =?utf-8?B?OGo1cjN6eE0wbmZEc3Z3bUlDRUVqUk5NUjhsaE9WQWp3TS8xbWh3UUYvM3h4?=
 =?utf-8?B?QjcwSThSTlM2S09KMDlBNC9ZQ201bGtvbzljcVZueU9NRXRCeUZKcUZxYVVO?=
 =?utf-8?B?dU1qUXZWaHhxQkRoYkQrTjNickw5MjdPUjFVdUp5WXlRWDVZYzJwMkZqVFBS?=
 =?utf-8?B?Vmc5MDRDT0NUZThUOWduZUJwQ3dMOEQyaTFhYzZobFR2UlFveG44UFU3VjlY?=
 =?utf-8?B?aUxqUXcxdXRWTEpaQlpLVnNiejNQTEp6b3ZhTXAvK1R4VkRvemZyNFZXdlpE?=
 =?utf-8?B?RW4vMDNTTUdlYVU4SWJQL25sa1JuTjhuVkRmKzVuV0MyN3FXUDhWN3B0K21J?=
 =?utf-8?B?dFVnMVIwcWhWU1dldUhUcGt2Z3pTTlhVem8rZ3F2MFNmOEdqZ04yeHdXV015?=
 =?utf-8?B?c0tDRS9qTFdncUMxWlBZZWNzTTg5M3dYVTVieVVwYWhuQnhTa3ZydndSd1Mv?=
 =?utf-8?B?aTNBMGJVaFByN1hwMGwwYktUZm0rRmZwK2FNKzZsTityeGMzMkE5Sy9CRVhV?=
 =?utf-8?B?Y0U3UExtbyt4NmRzUm4wZThBcUYyRnJ1Q2J0ektDZ3Y4Zy95TE5WNytvUVZx?=
 =?utf-8?B?azZYTmQyS01wR1NRbURLTGp2OE1QLzdnWjRqckJDUW4zWTV4Vm1US0QwR2Rt?=
 =?utf-8?B?V1ovSnZldS9JTzNwOTJyUHhyR1JDNkNycEpubGp5Qk9sanc3TFhrTy80bmVI?=
 =?utf-8?B?QU9RM0NxU21NamhxUEY2eXE3MmE2alpnLzZOeEJESkRJSEFjeWYvdkpiamhq?=
 =?utf-8?B?SmtSS0hNSUZRNHBDK0t3dVl3ZW1ZT2ZSa2cwVVJ2a3h3ZjE0Mk9KbFNGMnpL?=
 =?utf-8?B?bCtsV1NXV3ZwbHBDV0M0anlwaXJsRk54blNwY3NSaThJa0FDRERaN2kvOVZM?=
 =?utf-8?B?UkFmNlVZMU5icUJFTXNmRDRSVi9GM3BlQ0hLdC9SYUxvcnpmYmRqcWhDSU5j?=
 =?utf-8?B?aHgrdlNpZURtaXFkYUhWYWQwSWNLNWQxU21xK3pLMEhHOW8xdjdaRm15OC95?=
 =?utf-8?B?VUs0aTlsd1JReTZrdFEzS0ZnaWlNbFFZam1UYlkxYmhGSjZIdkFUTEw1ZXRS?=
 =?utf-8?B?bWU1Q3Z5UFJzOFpxb0FhMnI0RVpzekY5WlNWVlZ6VWZ0U0UrcWhKQWZzRnBE?=
 =?utf-8?B?MWFwM0pIdGpidGFLc0lrSXdWZ2E5aU43UEpVeUloeUtsN09SVFdzWktraEtV?=
 =?utf-8?B?NjFjRjBETmExVkNsMlZWdHBxeVUrYnJab3JobE55Q3VjTDllNStwNEtPOEtE?=
 =?utf-8?B?ckt0VkYvUGptYWNlT2pyMVN0SGxKSVNidUpIVDhxVEJvQXRsM3NyVWF5dG1H?=
 =?utf-8?B?Q1Y4ZHl4eUZ4T1ViSGVCV1JmUXdXaWdhZ2ZjL25WUk5LdEJaMkVjSmx6Zzdk?=
 =?utf-8?B?VTJkZHE2Y3ZSWm5YUWtZd0drUnZVZXZlK0RpUkcyTExaU2t5VDJKcUsyemR4?=
 =?utf-8?B?QXMxUXFqVGQ5WXV2Wjk2emhNMXo0MmgwU3V6NFBMZzNwRGFUSEF6S2pBNEdK?=
 =?utf-8?Q?JKhG0kucSSyrGrR8JtsJKs4XF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33bfcb25-9704-4531-d8f2-08db614b6a23
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 20:21:13.7987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3J9J+q1PFlUB6MjeLH/CWbHKmm+QQ0WSePCP4RtrpsHmZiWOKQoQVfHXKlnWpdhZUm8oHa3qbB/Kayh4PdwZaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6529
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
Cc: Jinhuieric.Huang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2023-05-25 um 13:27 schrieb Jonathan Kim:
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
> v2: fixup with new kfd_node struct reference for mes check
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   .../drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c  | 47 ++++++++++
>   .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |  2 +
>   .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c    | 55 ++++++++++++
>   .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h    | 10 +++
>   .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c  |  5 +-
>   .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c    | 87 ++++++++++++++++++-
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c | 55 ++++++++++++
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h | 10 +++
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  7 ++
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.c        | 69 +++++++++++++++
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.h        |  6 ++
>   11 files changed, 351 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
> index b811a0985050..d7881bbd828d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
> @@ -25,6 +25,7 @@
>   #include "amdgpu_amdkfd_gfx_v9.h"
>   #include "gc/gc_9_4_2_offset.h"
>   #include "gc/gc_9_4_2_sh_mask.h"
> +#include <uapi/linux/kfd_ioctl.h>
>   
>   /*
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
> @@ -82,6 +127,8 @@ const struct kfd2kgd_calls aldebaran_kfd2kgd = {
>   	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
>   	.enable_debug_trap = kgd_aldebaran_enable_debug_trap,
>   	.disable_debug_trap = kgd_aldebaran_disable_debug_trap,
> +	.validate_trap_override_request = kgd_aldebaran_validate_trap_override_request,
> +	.set_wave_launch_trap_override = kgd_aldebaran_set_wave_launch_trap_override,
>   	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
>   	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
>   	.program_trap_handler_settings = kgd_gfx_v9_program_trap_handler_settings,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> index a62bd0068515..ec2587664001 100644
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
> index 98006c7021dd..7ea0362dcab3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> @@ -32,6 +32,7 @@
>   #include "v10_structs.h"
>   #include "nv.h"
>   #include "nvd.h"
> +#include <uapi/linux/kfd_ioctl.h>
>   
>   enum hqd_dequeue_request_type {
>   	NO_ACTION = 0,
> @@ -803,6 +804,58 @@ uint32_t kgd_gfx_v10_disable_debug_trap(struct amdgpu_device *adev,
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
> @@ -889,6 +942,8 @@ const struct kfd2kgd_calls gfx_v10_kfd2kgd = {
>   	.set_vm_context_page_table_base = set_vm_context_page_table_base,
>   	.enable_debug_trap = kgd_gfx_v10_enable_debug_trap,
>   	.disable_debug_trap = kgd_gfx_v10_disable_debug_trap,
> +	.validate_trap_override_request = kgd_gfx_v10_validate_trap_override_request,
> +	.set_wave_launch_trap_override = kgd_gfx_v10_set_wave_launch_trap_override,
>   	.get_iq_wait_times = kgd_gfx_v10_get_iq_wait_times,
>   	.build_grace_period_packet_info = kgd_gfx_v10_build_grace_period_packet_info,
>   	.program_trap_handler_settings = program_trap_handler_settings,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
> index 1e993a213646..57339fa12807 100644
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
> index 387bdf4823c9..7120927fed15 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
> @@ -675,5 +675,8 @@ const struct kfd2kgd_calls gfx_v10_3_kfd2kgd = {
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
> index cc954cf248ca..ae0c4707919f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
> @@ -30,6 +30,7 @@
>   #include "soc15d.h"
>   #include "v11_structs.h"
>   #include "soc21.h"
> +#include <uapi/linux/kfd_ioctl.h>
>   
>   enum hqd_dequeue_request_type {
>   	NO_ACTION = 0,
> @@ -643,6 +644,88 @@ static uint32_t kgd_gfx_v11_disable_debug_trap(struct amdgpu_device *adev,
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
> @@ -660,5 +743,7 @@ const struct kfd2kgd_calls gfx_v11_kfd2kgd = {
>   	.get_atc_vmid_pasid_mapping_info = NULL,
>   	.set_vm_context_page_table_base = set_vm_context_page_table_base_v11,
>   	.enable_debug_trap = kgd_gfx_v11_enable_debug_trap,
> -	.disable_debug_trap = kgd_gfx_v11_disable_debug_trap
> +	.disable_debug_trap = kgd_gfx_v11_disable_debug_trap,
> +	.validate_trap_override_request = kgd_gfx_v11_validate_trap_override_request,
> +	.set_wave_launch_trap_override = kgd_gfx_v11_set_wave_launch_trap_override
>   };
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> index 4a155d11b8c8..705669c26a1a 100644
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
> @@ -739,6 +740,58 @@ uint32_t kgd_gfx_v9_disable_debug_trap(struct amdgpu_device *adev,
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
> @@ -1008,6 +1061,8 @@ const struct kfd2kgd_calls gfx_v9_kfd2kgd = {
>   	.set_vm_context_page_table_base = kgd_gfx_v9_set_vm_context_page_table_base,
>   	.enable_debug_trap = kgd_gfx_v9_enable_debug_trap,
>   	.disable_debug_trap = kgd_gfx_v9_disable_debug_trap,
> +	.validate_trap_override_request = kgd_gfx_v9_validate_trap_override_request,
> +	.set_wave_launch_trap_override = kgd_gfx_v9_set_wave_launch_trap_override,
>   	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
>   	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
>   	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
> index fed5b7f18b1a..76812ddd35b1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
> @@ -71,6 +71,16 @@ uint32_t kgd_gfx_v9_enable_debug_trap(struct amdgpu_device *adev,
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
> index 80d354eade35..e78103097162 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -2984,6 +2984,13 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
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
> index 48a4e3cc2234..733390fb2459 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> @@ -522,6 +522,75 @@ int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
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
> +		if (!pdd->dev->kfd->shared_resources.enable_mes)
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
> index 6c1054a08872..c9245221aa76 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> @@ -42,6 +42,12 @@ int kfd_dbg_trap_disable(struct kfd_process *target);
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
