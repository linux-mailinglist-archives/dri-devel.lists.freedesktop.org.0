Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF1D69A293
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 00:45:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B1710E3AD;
	Thu, 16 Feb 2023 23:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A43DC10E3AE;
 Thu, 16 Feb 2023 23:45:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OW2RWoTXkP1M5ZZrUuHH7AQglP3B0BqV//90xItKFIT4bul/klfHtlJm1URZXPXq6F7ris4AWtiyEEx1/slNLRdum08UeJLNvfn+aT+Ka4Opdqu7ooHwdx6MeXcOuCj13bnhVZ7Cl5IIwQRz9ULp5CuktO3hTKmcsTddTikhdRZd4ndzkp99L30k3MshV35kCQ0YF7+7NxzvBEvWL5XogE+AcOEZKkLld/4zsmfUyqm0vSLOtu/SqD/xnqWjGz4elyTfOL/uLb2ML6H0YhsT6Ec7CkuqfAWvAGSUFhJA5VhClhQ6i+RISCofPovYG5LshrlJoo9NpOVxl8q9Hk8Ylg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+EPdtRPNwHpdi3lAeEyzwe8WqVHqmp4fZj45VF5wOQ=;
 b=NgiZ99eG5Q4aPr9cOo3NtHcSbZfed0NGkhjtwW2mH4ca8Y4/HUojHKHm/g92ILf7VqdN1z8EWtYpYKuDacaHQuem/uMqw/Foe++k7kzJINcQsaVW8JYuNkIzEjSZ2l/J+QOW9pN1OXtw1+013UVwHFW2w1etGW9FLKkrYlzQRphh9syvjzL8i6qn3XEpyQIB/8E7idd6czUslFcOAJK5+shtfvQeRglkRLgVXfV2k2ZnJ7ybVLVZDDzTm4crMEeLg6safU+XbT1XP30quQkHDw5L4TbrrYqb0Y/yi6QmwCXSRW+122cEthM3V6uJq7ZF+E1eRdMDy4gGAYMdvnrhUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+EPdtRPNwHpdi3lAeEyzwe8WqVHqmp4fZj45VF5wOQ=;
 b=jGrMikqivM2nC178wAx5By/NxANVEhtvBUDLQg3j6CQapzV9lb155Ffg4sV14A70pVtp/14BPTYerzpp4Z8b7BTZbgSmn9cAzJ0nK+x/Uo4iqje5p8upJl0AgCFCwwQJNo9gV1WkF5kV2phevhZw94nViX0s7wcwCHMtoe1LL2A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SN7PR12MB7955.namprd12.prod.outlook.com (2603:10b6:806:34d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Thu, 16 Feb
 2023 23:45:03 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::e6ea:9231:6d39:93da]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::e6ea:9231:6d39:93da%4]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 23:45:03 +0000
Message-ID: <51aca1f2-ee48-7388-fde6-8833df114efb@amd.com>
Date: Thu, 16 Feb 2023 18:11:31 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 08/32] drm/amdgpu: add gfx10 hw debug mode enable and
 disable calls
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
 <20230125195401.4183544-9-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230125195401.4183544-9-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0228.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::28) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SN7PR12MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: 5db11cc4-6fad-4308-eab5-08db1077d331
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aJH+APftCAfyWhyegaiJymAq6qn97bjfGQ1/6LlHD7DnaxdFtZXIAd1mRrF70RBiYY49ehAuU1ZMeK/IYIvT8mjOKElwIzgzsCuAxRWKMm3inxb+5iELpHGsMNYWjiarzzBgtDCpcDM+dkkb2c142BI5qc73CP4N25Vv606GHK0QHtQ6IWT08ytZEMAxBuDzIK2mJfx159YrtYpRUPmhi8KCt6HPmhisFaQ+GLZe3bdViyD7VqqEutHOXg2kWydhkyWahd3rF+igAqA5vfBDUKdlQCmoNWhrUqBMdSwxeoN51nJojL2HFL/6gKH5j37O6zt4u1ej2RNKYaAGHfMTOI+B/J/JElBVjRwQWrtkibdV/yjlG1yNOWTD+Q96SQIhEvz0vo9QWqG5WVnRn4YxjMCJFK+t/P9aAy5lOR1N8/xf2gvdcE2Rv9VaZbmoKXbw9Ge3nwj88sAP8DPQ+n+YnqxmUwZImQ3xdRWKPwrLUocign8QwCllcgZmclbk2/bLs7Qb7aIZhbTZftDB59+v5ewC3SoiO2I+Lvby0fnQlGPzsv/68SI0kh1ryMuSl81q8QrHPgf+ODYo85hH0Wcl2P/ZU904X8GNs7IlsmuNUWIWTLFsZejUKLvDwEWUNEx5rDRCeLMeM/4O5kb1r6P4YKwAxxWKBSwvXoHvA3z/o9KfMEy+Wpa9QjDaQw4+FJt7sKCEfzDdkEjn3vtMPzgQwU2/b3h+49RuJxKeamAbAEQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(451199018)(66899018)(31686004)(8936002)(2906002)(41300700001)(36756003)(30864003)(31696002)(5660300002)(44832011)(86362001)(83380400001)(38100700002)(8676002)(478600001)(6486002)(450100002)(26005)(6512007)(186003)(66946007)(66556008)(316002)(66476007)(53546011)(6506007)(2616005)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yit0dUk2R2svaHF4ZGxSV2QvdnlyQTlyODVsL3dIUWJ0VGVETzhBQktrRzhl?=
 =?utf-8?B?TjNWcVBwVFU1R3JqcWVFb25sMUtCQ1RnVnJicnVyOSszY09WbC9EbnFvbUhw?=
 =?utf-8?B?anI0bmpaa1NpdU5kemNTNTEwdmdvYjhrNk5ScWpnMFhlOEk5YURoeDZ4MGNk?=
 =?utf-8?B?ckxmeEdMdCtXL3ROMU9jVmxqQUh2QkFFd2o2bXRrUDlyRWs1TmorZjhtOVNC?=
 =?utf-8?B?RHZaVjZDMHIyUjgvM0JYNVU5S0k4WS9lOE5TVEtSNTFMOVBsUllpRXBLWlRh?=
 =?utf-8?B?bjIvUGk4dGo3d1Y1emVCU0xpbG9YMGx1ZmUyc01Ec1g2Q3JKTE5iYVhSeWw3?=
 =?utf-8?B?cEF5bGJEbGxlL0ttbjRaUkgwazNYRExPcnJpcHhIT0lpZ016dlo4a0EvMkk1?=
 =?utf-8?B?Zzd1bG9RNFYxTTU2WjhnT0g0MmQwaDRHNkcxOFdvUENROVJxRTRjMGFoY2NM?=
 =?utf-8?B?R2laTC9qK0M3Z0pucUo0WUQ0eHNVZFRITFM0UEtKNThxQnk5MjBLcVdabklN?=
 =?utf-8?B?aUEvMUJqL2tRQSs1SWwyQ0l2bzdoRUt0VDJadVpSSXhRd3pUL3plQ0FtRHBz?=
 =?utf-8?B?aVBuZnN1T1c3bzliMGlEQUxiYWdHZm1xUlBLSk5VQkE0dFN3OWcvcUpkeFUy?=
 =?utf-8?B?d29QUU1hVW1CRTdlaUxSWkY2cWpHSG1XQU53QjlWdUVVYmR1RERkdHdibmZv?=
 =?utf-8?B?S3JOTXJuS1p3aEd1RitMenVibVJtYmJsd28wc21vRXBsalArYVB6blJuVm1u?=
 =?utf-8?B?VWdaTEZ3VDY0Q2p3N25pekNUUnlnbTRyZFJ6Wjc1dzdwWEw2WnNkeEkrVDRs?=
 =?utf-8?B?bmRsUnVxUk5KSXY0Y3lzRFBMekFJUWlGNlNUbmYyL3hobHNIWEtNczhnUFRM?=
 =?utf-8?B?dm1JY3lsL3Jrc1hBSzArbWpxa01VVTBWMGRzNXMyZjBGaEh3OWFtcnVDR3Fu?=
 =?utf-8?B?WUQzK01zT3IydzVXaGxBRUc4NGlOVGZSVW9CdGd6SncyL0YvS0dVZGNOK1VP?=
 =?utf-8?B?REJhaEVNNnFnUVZDNVBKZVJQOG9NKzU1TUVLaFU0WjRYMVFUcUNqcW5ydElZ?=
 =?utf-8?B?aXBXZHNLN0tsL29RbXNzdzBydG52aTVNSENTdkVwK0hhb2U3OUJVb2tGR2pz?=
 =?utf-8?B?ZnB2QytnWlpJK1BsbTU5V1J6WThBbmRVaENVaUM1WWl3TlZYT2Y2ZG1YWFo3?=
 =?utf-8?B?VmRmenV4VktEaG5aV09TNVRBZVJ5b1N4cnlMTEROVUxvdEtKR01rWXdpWkZZ?=
 =?utf-8?B?ZkhDL3VOL2VrTUhQcE1qMmVleGd4ZUVnNS9IeEtuWVRsOXZKNUpOSE5GaDJJ?=
 =?utf-8?B?SWlxNHU5YjJNa24xZzEycVZpbHFKOUFpRFVaUWRLdHdCSlN3NzJ4RUpUK0Rl?=
 =?utf-8?B?K3NTV0ZDMDlGSFp4VkFyOWNVOXVRWjFoSm8zckZodFEyTFhiM0VqSXVMOEMv?=
 =?utf-8?B?OCtWekxIWlRnQXVhQlpDWFBHZlhma1lHTStMTmVpTjdVSmhlMzRWWGxSWkFI?=
 =?utf-8?B?MlpPNko2Tlk4WkN6MzV6NUNGNjMyMXUza0FIZ2dsNEFqQmxQMkZjdFdxNTdj?=
 =?utf-8?B?SlhTNk5wKzJqYmtRemJ4N1FPaUEzaXplZjNQREV6MzVDNzFBNXg3RWdyd2lz?=
 =?utf-8?B?dXdmRUhvNmNOSUpDZmNEbngvd2IrVjhYVnczL3grTzNKV242bmpUK29aamdz?=
 =?utf-8?B?RVpiYXU3WTlVNUk4V3NPWnZEd1BWMWV6R3k0eFVoalE0c3kvQldWV09sTzZj?=
 =?utf-8?B?WkdyV3l0a1FUZEhWdE5PaXB2eW15M3BYcy9JcThFWGkrUHlUTXRlTUJuWFpY?=
 =?utf-8?B?ZnoxNzdZQkI1cmF1azdlTDNTd21wdVk5b25relpGM2dxdk9qV0xla05la0ds?=
 =?utf-8?B?NFlYVVlicStOTUhMbUM2cU1KV0tLRU9wdHJueFRmaUpGaGYxSWozYitxb29p?=
 =?utf-8?B?VVlqampiOTlEUXMvc2dnN20xdFgvS0YxQlliL0dIRmM3L2k2OFBNcXV6dWdM?=
 =?utf-8?B?bUt6dXJ1VXBQcFczUzNnSjd2QXpEOVg2UnBSeEhYQ1gzMTBIckovTnp6Q04y?=
 =?utf-8?B?Rm5FY2RGWnd5NmwxRTVaYlZZNmtKK3F5NVRWVDdjcmRLSmxEZDdLd2N6aDZN?=
 =?utf-8?Q?s2Y2nTzHBmpJcdJxdNvONmlTe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db11cc4-6fad-4308-eab5-08db1077d331
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 23:45:03.5642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /PLLj8I5yiTlpP0JatLNl4uVBJa2S5ygSt9TZuLgIZZj90Sp8heJcytRux+84kyoEQf3c6jMfPgGgDJmjqaZdw==
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
> Similar to GFX9 debug devices, set the hardware debug mode by draining
> the SPI appropriately prior the mode setting request.
>
> Because GFX10 has waves allocated by the work group boundaray and each

Typo: boundary?


> SE's SPI instances do not communicate, the SPI drain time is much longer.
> This long drain time will be fixed for GFX11 onwards.
>
> Also remove a bunch of deprecated misplaced references for GFX10.3.
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
> ---
>   .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c    |  95 +++++++++++
>   .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h    |  28 ++++
>   .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c  | 147 +-----------------
>   3 files changed, 126 insertions(+), 144 deletions(-)
>   create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> index 9378fc79e9ea..c09b45de02d0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> @@ -708,6 +708,99 @@ static void set_vm_context_page_table_base(struct amdgpu_device *adev,
>   	adev->gfxhub.funcs->setup_vm_pt_regs(adev, vmid, page_table_base);
>   }
>   
> +/*
> + * GFX10 helper for wave launch stall requirements on debug trap setting.
> + *
> + * vmid:
> + *   Target VMID to stall/unstall.
> + *
> + * stall:
> + *   0-unstall wave launch (enable), 1-stall wave launch (disable).
> + *   After wavefront launch has been stalled, allocated waves must drain from
> + *   SPI in order for debug trap settings to take effect on those waves.
> + *   This is roughly a ~3500 clock cycle wait on SPI where a read on
> + *   SPI_GDBG_WAVE_CNTL translates to ~32 clock cycles.
> + *   KGD_GFX_V10_WAVE_LAUNCH_SPI_DRAIN_LATENCY indicates the number of reads required.
> + *
> + *   NOTE: We can afford to clear the entire STALL_VMID field on unstall
> + *   because current GFX10 chips cannot support multi-process debugging due to
> + *   trap configuration and masking being limited to global scope.  Always
> + *   assume single process conditions.
> + *
> + */
> +
> +#define KGD_GFX_V10_WAVE_LAUNCH_SPI_DRAIN_LATENCY	110
> +static void kgd_gfx_v10_set_wave_launch_stall(struct amdgpu_device *adev, uint32_t vmid, bool stall)
> +{
> +	uint32_t data = RREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL));
> +	int i;
> +
> +	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL, STALL_VMID,
> +							stall ? 1 << vmid : 0);
> +
> +	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL), data);
> +
> +	if (!stall)
> +		return;
> +
> +	for (i = 0; i < KGD_GFX_V10_WAVE_LAUNCH_SPI_DRAIN_LATENCY; i++)
> +		RREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL));
> +}
> +
> +uint32_t kgd_gfx_v10_enable_debug_trap(struct amdgpu_device *adev,

The kernel test robot flagged a missing prototype or this function. You 
probably need to #include amdgpu_amdkfd_gfx_v10.h to fix this.


> +				bool restore_dbg_registers,
> +				uint32_t vmid)
> +{
> +
> +	mutex_lock(&adev->grbm_idx_mutex);
> +
> +	kgd_gfx_v10_set_wave_launch_stall(adev, vmid, true);
> +
> +	/* assume gfx off is disabled for the debug session if rlc restore not supported. */
> +	if (restore_dbg_registers) {
> +		uint32_t data = 0;
> +
> +		data = REG_SET_FIELD(data, SPI_GDBG_TRAP_CONFIG,
> +				VMID_SEL, 1 << vmid);
> +		data = REG_SET_FIELD(data, SPI_GDBG_TRAP_CONFIG,
> +				TRAP_EN, 1);
> +		WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_CONFIG), data);
> +		WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_DATA0), 0);
> +		WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_DATA1), 0);
> +
> +		kgd_gfx_v10_set_wave_launch_stall(adev, vmid, false);
> +
> +		mutex_unlock(&adev->grbm_idx_mutex);
> +
> +		return 0;
> +	}
> +
> +	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), 0);
> +
> +	kgd_gfx_v10_set_wave_launch_stall(adev, vmid, false);
> +
> +	mutex_unlock(&adev->grbm_idx_mutex);
> +
> +	return 0;
> +}
> +
> +uint32_t kgd_gfx_v10_disable_debug_trap(struct amdgpu_device *adev,

Same as above.

With that fixed, the patch is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> +					bool keep_trap_enabled,
> +					uint32_t vmid)
> +{
> +	mutex_lock(&adev->grbm_idx_mutex);
> +
> +	kgd_gfx_v10_set_wave_launch_stall(adev, vmid, true);
> +
> +	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), 0);
> +
> +	kgd_gfx_v10_set_wave_launch_stall(adev, vmid, false);
> +
> +	mutex_unlock(&adev->grbm_idx_mutex);
> +
> +	return 0;
> +}
> +
>   static void program_trap_handler_settings(struct amdgpu_device *adev,
>   		uint32_t vmid, uint64_t tba_addr, uint64_t tma_addr)
>   {
> @@ -750,5 +843,7 @@ const struct kfd2kgd_calls gfx_v10_kfd2kgd = {
>   	.get_atc_vmid_pasid_mapping_info =
>   			get_atc_vmid_pasid_mapping_info,
>   	.set_vm_context_page_table_base = set_vm_context_page_table_base,
> +	.enable_debug_trap = kgd_gfx_v10_enable_debug_trap,
> +	.disable_debug_trap = kgd_gfx_v10_disable_debug_trap,
>   	.program_trap_handler_settings = program_trap_handler_settings,
>   };
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
> new file mode 100644
> index 000000000000..370d6c312981
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
> @@ -0,0 +1,28 @@
> +/*
> + * Copyright 2022 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +uint32_t kgd_gfx_v10_enable_debug_trap(struct amdgpu_device *adev,
> +				      bool restore_dbg_registers,
> +				      uint32_t vmid);
> +uint32_t kgd_gfx_v10_disable_debug_trap(struct amdgpu_device *adev,
> +					bool keep_trap_enabled,
> +					uint32_t vmid);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
> index ba21ec6b35e0..73e3b9ae1fb0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
> @@ -22,6 +22,7 @@
>   #include <linux/mmu_context.h>
>   #include "amdgpu.h"
>   #include "amdgpu_amdkfd.h"
> +#include "amdgpu_amdkfd_gfx_v10.h"
>   #include "gc/gc_10_3_0_offset.h"
>   #include "gc/gc_10_3_0_sh_mask.h"
>   #include "oss/osssys_5_0_0_offset.h"
> @@ -652,142 +653,6 @@ static void program_trap_handler_settings_v10_3(struct amdgpu_device *adev,
>   	unlock_srbm(adev);
>   }
>   
> -#if 0
> -uint32_t enable_debug_trap_v10_3(struct amdgpu_device *adev,
> -				uint32_t trap_debug_wave_launch_mode,
> -				uint32_t vmid)
> -{
> -	uint32_t data = 0;
> -	uint32_t orig_wave_cntl_value;
> -	uint32_t orig_stall_vmid;
> -
> -	mutex_lock(&adev->grbm_idx_mutex);
> -
> -	orig_wave_cntl_value = RREG32(SOC15_REG_OFFSET(GC,
> -				0,
> -				mmSPI_GDBG_WAVE_CNTL));
> -	orig_stall_vmid = REG_GET_FIELD(orig_wave_cntl_value,
> -			SPI_GDBG_WAVE_CNTL,
> -			STALL_VMID);
> -
> -	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL, STALL_RA, 1);
> -	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL), data);
> -
> -	data = 0;
> -	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), data);
> -
> -	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL), orig_stall_vmid);
> -
> -	mutex_unlock(&adev->grbm_idx_mutex);
> -
> -	return 0;
> -}
> -
> -uint32_t disable_debug_trap_v10_3(struct amdgpu_device *adev)
> -{
> -	mutex_lock(&adev->grbm_idx_mutex);
> -
> -	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), 0);
> -
> -	mutex_unlock(&adev->grbm_idx_mutex);
> -
> -	return 0;
> -}
> -
> -uint32_t set_wave_launch_trap_override_v10_3(struct amdgpu_device *adev,
> -						uint32_t trap_override,
> -						uint32_t trap_mask)
> -{
> -	uint32_t data = 0;
> -
> -	mutex_lock(&adev->grbm_idx_mutex);
> -
> -	data = RREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL));
> -	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL, STALL_RA, 1);
> -	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL), data);
> -
> -	data = 0;
> -	data = REG_SET_FIELD(data, SPI_GDBG_TRAP_MASK,
> -			EXCP_EN, trap_mask);
> -	data = REG_SET_FIELD(data, SPI_GDBG_TRAP_MASK,
> -			REPLACE, trap_override);
> -	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), data);
> -
> -	data = RREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL));
> -	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL, STALL_RA, 0);
> -	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL), data);
> -
> -	mutex_unlock(&adev->grbm_idx_mutex);
> -
> -	return 0;
> -}
> -
> -uint32_t set_wave_launch_mode_v10_3(struct amdgpu_device *adev,
> -					uint8_t wave_launch_mode,
> -					uint32_t vmid)
> -{
> -	uint32_t data = 0;
> -	bool is_stall_mode;
> -	bool is_mode_set;
> -
> -	is_stall_mode = (wave_launch_mode == 4);
> -	is_mode_set = (wave_launch_mode != 0 && wave_launch_mode != 4);
> -
> -	mutex_lock(&adev->grbm_idx_mutex);
> -
> -	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL2,
> -			VMID_MASK, is_mode_set ? 1 << vmid : 0);
> -	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL2,
> -			MODE, is_mode_set ? wave_launch_mode : 0);
> -	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL2), data);
> -
> -	data = RREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL));
> -	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL,
> -			STALL_VMID, is_stall_mode ? 1 << vmid : 0);
> -	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL,
> -			STALL_RA, is_stall_mode ? 1 : 0);
> -	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL), data);
> -
> -	mutex_unlock(&adev->grbm_idx_mutex);
> -
> -	return 0;
> -}
> -
> -/* kgd_get_iq_wait_times: Returns the mmCP_IQ_WAIT_TIME1/2 values
> - * The values read are:
> - *	ib_offload_wait_time     -- Wait Count for Indirect Buffer Offloads.
> - *	atomic_offload_wait_time -- Wait Count for L2 and GDS Atomics Offloads.
> - *	wrm_offload_wait_time    -- Wait Count for WAIT_REG_MEM Offloads.
> - *	gws_wait_time            -- Wait Count for Global Wave Syncs.
> - *	que_sleep_wait_time      -- Wait Count for Dequeue Retry.
> - *	sch_wave_wait_time       -- Wait Count for Scheduling Wave Message.
> - *	sem_rearm_wait_time      -- Wait Count for Semaphore re-arm.
> - *	deq_retry_wait_time      -- Wait Count for Global Wave Syncs.
> - */
> -void get_iq_wait_times_v10_3(struct amdgpu_device *adev,
> -					uint32_t *wait_times)
> -
> -{
> -	*wait_times = RREG32(SOC15_REG_OFFSET(GC, 0, mmCP_IQ_WAIT_TIME2));
> -}
> -
> -void build_grace_period_packet_info_v10_3(struct amdgpu_device *adev,
> -						uint32_t wait_times,
> -						uint32_t grace_period,
> -						uint32_t *reg_offset,
> -						uint32_t *reg_data)
> -{
> -	*reg_data = wait_times;
> -
> -	*reg_data = REG_SET_FIELD(*reg_data,
> -			CP_IQ_WAIT_TIME2,
> -			SCH_WAVE,
> -			grace_period);
> -
> -	*reg_offset = mmCP_IQ_WAIT_TIME2;
> -}
> -#endif
> -
>   const struct kfd2kgd_calls gfx_v10_3_kfd2kgd = {
>   	.program_sh_mem_settings = program_sh_mem_settings_v10_3,
>   	.set_pasid_vmid_mapping = set_pasid_vmid_mapping_v10_3,
> @@ -805,12 +670,6 @@ const struct kfd2kgd_calls gfx_v10_3_kfd2kgd = {
>   	.get_atc_vmid_pasid_mapping_info = get_atc_vmid_pasid_mapping_info_v10_3,
>   	.set_vm_context_page_table_base = set_vm_context_page_table_base_v10_3,
>   	.program_trap_handler_settings = program_trap_handler_settings_v10_3,
> -#if 0
> -	.enable_debug_trap = enable_debug_trap_v10_3,
> -	.disable_debug_trap = disable_debug_trap_v10_3,
> -	.set_wave_launch_trap_override = set_wave_launch_trap_override_v10_3,
> -	.set_wave_launch_mode = set_wave_launch_mode_v10_3,
> -	.get_iq_wait_times = get_iq_wait_times_v10_3,
> -	.build_grace_period_packet_info = build_grace_period_packet_info_v10_3,
> -#endif
> +	.enable_debug_trap = kgd_gfx_v10_enable_debug_trap,
> +	.disable_debug_trap = kgd_gfx_v10_disable_debug_trap
>   };
