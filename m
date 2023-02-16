Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E1769A295
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 00:45:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AAAD10E3B6;
	Thu, 16 Feb 2023 23:45:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D660C10E3AD;
 Thu, 16 Feb 2023 23:45:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ybktf/phmoDdXTm+j8FZleU5tpOBMaLqBmQX9HsN4rOBRTPzvtmzYjtnSTgdG7pYA4N9sCOujnZkW7ry+QY+OagPHv8DsSJQ/yuIWRgMDfK8qwYySpgPsYCftAb2fSR7YnM+RO2I5J3T84hOE1IiS9ZsD31NOuvksW5MCq8UpowDLO8xtLRXq2xi1qGvKcCeJ/+s2iaA/qL8TjknKyLaT2b9NR3cHisabjh9vO4higxstVVMGbfzZLZbDHe9XX5YGUq3SzbbVuJSj/AeYzmWSi1uA57zA27G7ySFkLAgQZM0O03ZGgmJ5C1fm2wxTMB+txq9V01lKH1r7xBenkcq6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cB1f91TFvCi2ed5rPnIVNjThWPiCIfS4eqCfF+MpS80=;
 b=ZfRVjsJn/RFf77cV3Mul28QDslpqaKuPcgOxcG20lKBjP+h2bX3VGIyjaVzzhhEabT8NXjDYLPLHcaX9pGK19bS8ouOgsN68DjxZS7LvPYdsT9agAZ7EiRs4FJApOXhK9/mOtlpGdTZwrfFNSuPKCQnxVwyC98RmKPqeGzWxfp96/31+fZiNNVu1MQSrquY+/vJsONUFkWZHrhrSzHRiI075emOTn/GuKbli+3WDjw44TdFbtYGBFxjJJ3IOTm56SEs9lf6UMg1QutJJUpyXpmr0qCN/YFOsFa7AsChn3km4NNdQ50GW84GSjEeF5iNm7dAfIqE/YAuIe2NoGAqxOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cB1f91TFvCi2ed5rPnIVNjThWPiCIfS4eqCfF+MpS80=;
 b=OlaaYmoTJaImfsk23qdq9/om9Y600wHOshRJB509rLMWLIg9EG6dGbm7NkEylKXErXqcDb2N4CMy4lO8gvchWXqnYjfr2Cdm1yYOYKSwP0xFA9r8eLMYlA09Q2NDKYUWaZGrxg+jLTX6MYpYAHnWX6BuOJTuQ3ouiTBlypUvjg0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SN7PR12MB7955.namprd12.prod.outlook.com (2603:10b6:806:34d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Thu, 16 Feb
 2023 23:45:06 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::e6ea:9231:6d39:93da]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::e6ea:9231:6d39:93da%4]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 23:45:05 +0000
Message-ID: <c5b8c6dc-141b-ab72-e8e8-3818001ab61a@amd.com>
Date: Thu, 16 Feb 2023 18:14:40 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 09/32] drm/amdgpu: add gfx9.4.2 hw debug mode enable and
 disable calls
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
 <20230125195401.4183544-10-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230125195401.4183544-10-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0198.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ad::22) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SN7PR12MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: 10ced4e6-f781-4a52-28f6-08db1077d49c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q0K/3ToqnNa7by2fjUJ99zWlXFC9Rux76s8l3nhoM3JKPaDdzkfMtmSfGKsmO115766zE4982kmPEL8vRjUdm8Cdq+Jr6aOb/VdvLAhm9DJuEuMq739/rwQ+zDEd0VwCplwRAfOPoUraS4v67cW9fVcEYOTy6o9FxknrP/QNjWUPPKt992eu8gbq+c5Zhen3cFu5AKlyrb2j89hbF0U18NpkbWi4EX0df8wwxOowLgHXiXBjzheIcz2UHJXA5svCk8hZ9E7RGWEunCjsSo1hHLGiPX0zYg9GHsXq6xrWr1/oWl0EOaZ2CwG2+sypr1St1Dx2ElV0XtV2FKrSNycGL9gX1/idfniGghlrAyJpvFU07/7X/c74+JLjqWgbtZ7P1BbalYwiG7S7kxXgFmj3VNNAJPIauPlGeIJv7bEF7U6pxQe19PpiTEqFeL2sDcq9UJ8ssvbi62KrIJPPtodqdnxPAmQ+0d4F8F+BXFiYfX6//8Mxayza0QanjkEdQ4Ycdg48L0tdcHZRAsoQl6+nfmFYVkrTGyL46XlWDErf56Hb8zKpEYhef1Pxjnmsn8Y1RIZQRMmWUbwJZUYOrxUTim8jVd7YfQY/m0QS3D7tw1XZD6RPVT71hLsP/cncEqq/1dVfW+Fi8zo6BhjjUzZzPNQ4TVLLrAl/XW24PAR8sIJDPUQzjfEJ56Ojomeeamfo6l78mlvDTPMA7U/gIOiA4nq+V6bsqlmKZA6m5IEmNco=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(451199018)(31686004)(8936002)(2906002)(41300700001)(36756003)(31696002)(5660300002)(44832011)(86362001)(83380400001)(38100700002)(8676002)(478600001)(6486002)(450100002)(26005)(6512007)(186003)(66946007)(66556008)(316002)(66476007)(53546011)(6506007)(2616005)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjlJT0FYeDFFanYzOVlBeEM0bm1SSWRXNUhaMTkrcVVrMlhRWUlvMlMzYkNs?=
 =?utf-8?B?cDNtL09CT1RHaWVoQUpEKzdNUEMwN0h4Tk9qdFd5MkFxeExnL0RHRmhBUXk0?=
 =?utf-8?B?dll1SHZCN3J2aTg3SytaU2gvWnNsRTNoOUN3YzRUSzN1RlVueVVPZk81MVoy?=
 =?utf-8?B?VVppWGhJbUY3U212cHM2R0JoeDl1cVFKcHhITk9kOVVtQVA4QVJPQXI3ekx0?=
 =?utf-8?B?aTZsd2toeGVEOFh2LzlBZDkwbnJpTFE3Q3E2WWcyMXFoRU1JR2RXUHpsNEZV?=
 =?utf-8?B?YUJFVEpCVWswVzFQUEtKeTJON2xzZGZDVHZXYUpuSWhOOWNZSUs5NDhrVnVR?=
 =?utf-8?B?bE5FSG9YQ1BNd2lBQmFMbVRYQWx3dEd2RlNaTUdYQ2JaSUdJc3J2TEJVUWdw?=
 =?utf-8?B?ekpZaGxXU2x0ZmZ5Mk1VNnhRenU0TG1kSElzVy91eEdhR3JWRUdjYXdQQ1NG?=
 =?utf-8?B?YVRQemcxMGRkSmZWTEc2ZmRJOXloWnFINi9UR2swK0VVczRoakNrYUxYTlJr?=
 =?utf-8?B?ZlAxamZIZXZmeHdoTzdFallCR0tRVGE3ZGxBY2Q3UXl3SHdnZGhiM2NuU05O?=
 =?utf-8?B?VXNxOGV6VmNHcUNFZXNqUFVnSEY2WktLZ1ZRSUsvSktPbHd4TTdGbE1Uc2g0?=
 =?utf-8?B?Z2pXWVZtYkx6aEc3K3R2aHdNL1VlVGhwOEFUQjFPekEyWERvQm1KZGg5K05W?=
 =?utf-8?B?UWI1SHUxb3pzN3U1MUdqRnZJSzJZM1JPMU1RVG1KVGovUS9wdjk0V2wvZjJh?=
 =?utf-8?B?NDM2bUtYbkgzT0ZlbHBQUTYzSFlQWEhjMU92QThZNERUMjVib3grbFhhbGJL?=
 =?utf-8?B?WFpORm0wcDRlWTV6dFJjTUcrZzAxNmtZNlM2Z2RJMjZpSEY2cFdHMlVPbFJP?=
 =?utf-8?B?MVVKc0JacWptL0pOZTc2VEFFYzFtOTI3eXdqaktrdDJZaUI0SWdVOWkzRVZI?=
 =?utf-8?B?U2ZHbUZ6UHBDM0Q0TlJGdmN1dktldVVyZVoraFdqaVM4cWs4WG5GWlhkdVVY?=
 =?utf-8?B?ZzdGNnU1R2NNN09wNDNveTgxYmg2VkM1WXMwdlhtRVNLeHJGT3pvaVE1NTdH?=
 =?utf-8?B?VTFDVUhLNGlFQmhkay9VRDQzSjdHM0NDSzcxTWlNOVRkRDQxK3JoWWh6RFFq?=
 =?utf-8?B?M2xHVjZxME1xYjFkRGhYa1JyV3pMNDNQbXhEdzRFYWZheEpLdlJPa3RTTXhD?=
 =?utf-8?B?dkNHSDFMYWh3V1YrdFdydFl3dk01cG9Nc0dxWnVwSEFqbFJMaU1GOHVFa2dY?=
 =?utf-8?B?UDV4R2FjVnd5RHNlOGptbUZvSVZsbXZFTjlqSjlYdk5PNTBRK1pvK0dqbEJX?=
 =?utf-8?B?QVBkMm5VMU54OHA0dFRWbXo5RGNPRzRCY05Kb1JKb2hoQkhTUitFUjhTb0Fn?=
 =?utf-8?B?VG9tc1dSdm41djJCVnhsMVBBaytLNjNvRzJPRDhQVnAxaW1WcGdTZW1rUkFU?=
 =?utf-8?B?eTQySFkwcEl0ZWp1VVZMamd1SDJyUFJHNjNsUytwRk1nVmY1cDhHWDBMcG5a?=
 =?utf-8?B?YVM2US8xQlEyQjVvTXdkeXQwUkR1MmtQVEczdFFqYmtWNjFjSHJtMDVSbG1D?=
 =?utf-8?B?aVRyU2FrYk0vWWh1L00rTXFjNnhSM3p0dU5GdllkUlBiK0p5S1lvWHVCODhq?=
 =?utf-8?B?Q1BsMzVHakt6N2I0R1NqVTFHNUFjQUFURXVKZlVuRTNsd1dwaDVMcFQ1NEdq?=
 =?utf-8?B?cWt3VHNpODVtNStVQXNjY0gzNUVhKzVuRW5hNW9mSFlDUFNIejBtT2x6OFoy?=
 =?utf-8?B?NjkzTHBnZ3NqNi9ab25nMUNhNDdEcGVnWDZrd3VtT2d6VnZJSHpjNzBVSUNS?=
 =?utf-8?B?ckFUblBTV21KNUJqMzd6ZGpyZXZLdmd5ajhGeWVmV2VzMEpPOGRPb3JFM2hw?=
 =?utf-8?B?RnkrUmhpOEFqNnJoZDZlWVZ5U1g0SVIyVTJsbmVEL01WRGNEWVFWV1dRR2Zx?=
 =?utf-8?B?ZWNHenVESEMvWExsbWE5OGZtdFo1VFRtOThxN3VUUE9YN1VoSzZURzZMWUxV?=
 =?utf-8?B?d2gzazdGU1NiNDdIREVERVhiKzREWVlFYnc0Nk9IVHRZZDBzZ2RPd2VxMW1N?=
 =?utf-8?B?RTBhTXNJamhwdk03a2lwYzhOZTJOUUlqTWFzd0ZMKzJPbnhVbXJBQ3ozY09E?=
 =?utf-8?Q?c12PJuiwIoZIWvi01cSESoTHG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10ced4e6-f781-4a52-28f6-08db1077d49c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 23:45:05.8932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MHwU55tLt+23WFlBD6Ei7APYOSGqo5uRHpq6OfLcQfSbdZ4fRelIk8GEo8TS7yyVwT7V1OqaU7GDcMpj/cgyjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7955
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
> GFX9.4.2 now supports per-VMID debug mode controls registers
> (SPI_GDBG_PER_VMID_CNTL).
>
> Because the KFD lets the HWS handle PASID-VMID mapping, the KFD will
> forward all debug mode setting register writes to the HWS scheduler
> using a new MAP_PROCESS API, so instead of writing to registers, return
> the required register values that the HWS needs to write on debug enable
> and disable.
>
> v2: add commentary on unused restore_dbg_registers for debug enable.
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
> ---
>   .../drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c  | 43 ++++++++++++++++++-
>   1 file changed, 41 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
> index 4485bb29bec9..89868f9927ae 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
> @@ -23,6 +23,44 @@
>   #include "amdgpu_amdkfd.h"
>   #include "amdgpu_amdkfd_arcturus.h"
>   #include "amdgpu_amdkfd_gfx_v9.h"
> +#include "gc/gc_9_4_2_offset.h"
> +#include "gc/gc_9_4_2_sh_mask.h"
> +
> +/**

Use /* here.


> + * Returns TRAP_EN, EXCP_EN and EXCP_REPLACE.
> + *
> + * restore_dbg_reisters is ignored here but is a general interface requirement

Typo: registers


> + * for devices that support GFXOFF and where the RLC save/restore list
> + * does not support hw registers for debugging i.e. the driver has to manually
> + * initialize the debug mode registers after it has disabled GFX off during the
> + * debug session.
> + */
> +static uint32_t kgd_aldebaran_enable_debug_trap(struct amdgpu_device *adev,
> +					    bool restore_dbg_registers,
> +					    uint32_t vmid)
> +{
> +	uint32_t data = 0;
> +
> +	data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, TRAP_EN, 1);
> +	data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, EXCP_EN, 0);
> +	data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, EXCP_REPLACE, 0);
> +
> +	return data;
> +}
> +
> +/* returns TRAP_EN, EXCP_EN and EXCP_REPLACE. */
> +static uint32_t kgd_aldebaran_disable_debug_trap(struct amdgpu_device *adev,
> +						bool keep_trap_enabled,
> +						uint32_t vmid)
> +{
> +	uint32_t data = 0;
> +
> +	data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, TRAP_EN, keep_trap_enabled);
> +	data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, EXCP_EN, 0);
> +	data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, EXCP_REPLACE, 0);
> +
> +	return data;
> +}
>   
>   const struct kfd2kgd_calls aldebaran_kfd2kgd = {
>   	.program_sh_mem_settings = kgd_gfx_v9_program_sh_mem_settings,
> @@ -41,6 +79,7 @@ const struct kfd2kgd_calls aldebaran_kfd2kgd = {
>   	.get_atc_vmid_pasid_mapping_info =
>   				kgd_gfx_v9_get_atc_vmid_pasid_mapping_info,
>   	.set_vm_context_page_table_base = kgd_gfx_v9_set_vm_context_page_table_base,
> -	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,

I think you're removing get_cu_occupancy accidentally here?

With those issues fixed, the patch is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> -	.program_trap_handler_settings = kgd_gfx_v9_program_trap_handler_settings
> +	.enable_debug_trap = kgd_aldebaran_enable_debug_trap,
> +	.disable_debug_trap = kgd_aldebaran_disable_debug_trap,
> +	.program_trap_handler_settings = kgd_gfx_v9_program_trap_handler_settings,
>   };
