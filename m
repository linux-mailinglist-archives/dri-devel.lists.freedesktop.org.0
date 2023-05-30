Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB3F716D77
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 21:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5CCD10E410;
	Tue, 30 May 2023 19:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::615])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15AE410E410;
 Tue, 30 May 2023 19:23:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W8A1QAL0RFWRe/MDca+HyUDXR+ZXnRNetBvYxL/An7wA2BDThoRttdEhlEhYsu+mPK40MAxyhm4FRJRyDOmJPzKgJJW5qNymAG45wq4VDqC9SKpbL/E6xCCK80lQ4142OfcWe0TatQxzQMChKFB8ASVum0DlHcOgakW0uClpyumqB5UAJK4EBQ/m0FMfTkacwUcZOOt/dLGx2F4co9hB+ySdOiw3/n9NboFpCvcEb6gjWl75/hLobuwULLoZcBCQRPEgH2LPzLxbiH6kJWmJFwWqO3cLn1sMkxKJFdEoGGz2P4m7t79wetUCZcpibE8ccsxBRD14pO+TZox9weI3Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nyc65FWG7f2WNtp+Yx2cS7WofZorcUfa6svw5mYDEh8=;
 b=Yok/uKQ+cC717ugGFiNwVRGQycWh/r7UvXX+smZUO/AJGiz56blByNG0XC3qaNO9GNBfSAw6aU3iCoc2k6U7NAsuP8bX4qCMPJ2cp9jBRyBkWAfoLwD2UkHv23hFb11+c4yxfYUkXafQoFZ5JMiniVdxxsiBrmM1NrVbCoKwKyyH+pHGe5nQ/tYc4rQWBLkjnaC7P0bOczb30dLl6Qepox1HR7aaaZfF+hOeZEDBLxOo5n+UY/u8V9yXPUy5oXrq+10lLS0WyRBx/LnezJvtOeVILNOph8dfCo5m/yusWV70s5/Hq7hgHpwpOO2UKaksi7g00KfjJJhrzQbtP9MzKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nyc65FWG7f2WNtp+Yx2cS7WofZorcUfa6svw5mYDEh8=;
 b=q8IVsvuNZEFJAgGiizo2xLsPdfSUhNsMoO/BStN7MYJxDqGfosXpX3AQ3/Ah0pD8J+nUa9wxmDIW9/eXSqCZ9lJM3yR/eZIFOgoh3vBYYgAJjvCWgTheIPUJL5s723pFoATLI5fY02Z80AN+8vIYJ55TxBwFWVSgM8ecCn4NlIs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SN7PR12MB8602.namprd12.prod.outlook.com (2603:10b6:806:26d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 19:23:16 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::943e:32fb:5204:a343]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::943e:32fb:5204:a343%3]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 19:23:16 +0000
Message-ID: <a0766c29-23b6-c1f8-0790-8ce62b269597@amd.com>
Date: Tue, 30 May 2023 15:23:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 05/33] drm/amdgpu: setup hw debug registers on driver
 initialization
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230525172745.702700-1-jonathan.kim@amd.com>
 <20230525172745.702700-5-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230525172745.702700-5-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0207.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ad::11) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SN7PR12MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: 34ffab9e-8b82-4eee-560a-08db6143517c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nTaC6R52d8ImzSrWiTbMfxrxD5LCMAAR/RVYDB+ZOL7Xwf3/aQjadvTNcaed5v+fWZ9Rb0fjnaFwnVV7b8lrwgi7Fmyrv2GHsXGvOQcIQ3skkhQ3vffRLTUSZv1oAoYNvSkfGoJHZ1404ocxj+bojh01MMwUPg6gzL+jDXTYhIn0xpJuxMtO82c7GH9YruMb0I0gMw7AtA2WkpZvTK19AVhtb5zeXB+Oi42i48C2JESWCvHG+j+Dwm4jgGJPK6jV1oDy4aaE23ztyYuR+fP+JhTiwfqas0yZd/YNFXy+I8QJC8CzGPPylm2hlSwi/3itEEYBI+ObACKDGdLkBGPoOUMwInY1rzN48N08lJRtTXB0gOQmZUQxYdaHtzMBRmKZ4UBefm8kyjPBS32NMC1FdBaZxY1Mwak9aGd1nBknsnxtcjzvPKLzDNXP/E4iFO3I1J3a/skj9S/xlEDL6t9Y/uzhOC+p5qTFCJMcdnmb1wI+chEeVVjaydaCGIhqNS8vl6YeIisZ2MRa5tpTDJCrudCAsHsjguHUX++/+QmuhGwt1rnWNCMhz10ESO5FM58S++6cpwgdHqWoeGQS2zN+e0CH6pX/bTp50GbH9hWr8o3I+zuC67pTnNhP5X0eDXYn7C37d3XUNmzKn9v3BCHkaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(136003)(366004)(39860400002)(346002)(451199021)(478600001)(8936002)(8676002)(44832011)(5660300002)(36756003)(30864003)(86362001)(31696002)(2906002)(66476007)(66556008)(66946007)(4326008)(450100002)(316002)(38100700002)(41300700001)(26005)(83380400001)(6506007)(6512007)(31686004)(186003)(2616005)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXRQSTJ4WUtGa0gwUUtpRHFaWDN5MlNYcGY0YzBoejhVMDF6MGR1WDluMjFZ?=
 =?utf-8?B?Sk5yWmVLNWRDbDYxcEIxUktqRk94WjBiL1QxU1A4d3F2WDAwb2tPZXRLNGpE?=
 =?utf-8?B?eFlJOENudDBBcEYyMmtRMHhGM3orMUpBRVEvbVN0Y0U5aW1Xa1NDWDdxZFQ1?=
 =?utf-8?B?WTJkQzA3OHFYVkRhaERCRjJ5UG5sSFdOOUxmZW5FSjlEdFZEU0JMWFZOSzZT?=
 =?utf-8?B?QUc1Snk4SVRYNHltbEkrUVdEdTVINjRaUU84OGk3K1ExVFFtdjAyeXBXMmVh?=
 =?utf-8?B?ekhXb3puNHYrWERGeXlQcHVKLzUwZDByQkErSXNBdVdxNkhxTndYTENyWEZ1?=
 =?utf-8?B?RnAvbDRkbGNDYUVZUjE2bkJ0ZHZBRGJxc2hrSVcwa3dXQmprelVDSGZKUFFC?=
 =?utf-8?B?ZURRZG1XY3JhUTZCMmMzczlkYXAwQTdhYTBjN2lFMGJKN1hEcG0rNlRNSUJY?=
 =?utf-8?B?VTFPTjA4ajExK2doUm1wNUhIclYxTWgwZDNXemNnaVJrczJwM3M0SmVhdXpX?=
 =?utf-8?B?ZTZyaGFOL0lBcEtHV3JMNkxFOUhYMGM1NHdkRG11aDBYYm9DRlF6S21WT0xV?=
 =?utf-8?B?czB0YkluNnp3dFN4Sm53WlM5TXU5bUJLWDU2T2JsRXNUWmV4TThza3ZoK3Q0?=
 =?utf-8?B?MVBOeU1zZWsvM25Xb2gvQ0h5b0JLbk1xTHZFdFp6c0FNRW9Yb2VGUWRZVnk5?=
 =?utf-8?B?bGkrai9xMEdBc1h1a01pM0pOd2xoREZLbnJ3aWpXc1FjS29OMDVYZDlXS2xR?=
 =?utf-8?B?eElCdEdaTlREdnNYd2pYd0o0NWhya3Nqbjg5ZGJGTmtNbCtNMytCUTlRR3Ji?=
 =?utf-8?B?ZytmSUdValh3ZG5YbklTSVgxZ3BKWlVtKzkzaHc3Rk82UWVqVHNhTjVZTk44?=
 =?utf-8?B?OENGNkI4Uk5rWllab3R0ZU1uY0lEUVBrQVJmblVhMmdIc203Y2JSaWZ4Nmds?=
 =?utf-8?B?c0g0TXI4OVBPeVhLNWtIajRNVjkrT01LaDZ3RmtnZUhHSnorcW1KY0tKUldu?=
 =?utf-8?B?NFJpc0lKM3dJOFcyTmFPVDJFZWJnSUdRL2dpK2pJQXJOeWJkcFZVeUxKelZ1?=
 =?utf-8?B?dld4akFiL3Z6SU42YmZZQndTaTNHY2V6R3lyWVpMWFNmSkRwUzZvMTdCM1Rt?=
 =?utf-8?B?WDFPbWYyc0VQdFgvMW9ETndPQzlPUDR6QkhoeXh3ZnVINjRZSjd0bnFPYWlt?=
 =?utf-8?B?enh3VGlNZmUzd05kMnYzVkRDRjZ3cm1YeHA4bDhaYXRlUHQ1QysvQytCMlBK?=
 =?utf-8?B?eTg2bWVWSEtqaks3NDRJWWh4SG4zdW1tZGw2bjQ4TktWaUhUaTNnUHVadThl?=
 =?utf-8?B?Z05SZ0E1elJWbUxiR3Axc25XOSs0N0NlSXB6NHM2M3ZwR0psMjJQdWJIeUYx?=
 =?utf-8?B?N2QzQk5jS29oYnBoUEV5STV4M2ZpaVNpSUFQTzNTU21ydm11b3RrZHdIdjRk?=
 =?utf-8?B?Z0U0dWVuempqOXVVMDhyT3RCNWU2TnNwNFVJbEpObEUwYmFLaXpWUGM0cy9r?=
 =?utf-8?B?R0FaSjRBWTQyUEx4K0s1OE1sUEtQMWtZR1hZWk9aSWUzd3I1d1MzejZGRSsy?=
 =?utf-8?B?eVgzNTlQSWtpSWdsNUNuNERVbHlXT3MvaEpYeUVrUmxiZXV6QmxmY1cwN0t6?=
 =?utf-8?B?NnpnTk1IaENVdlE0L25Cc0gyeG13VEhmRjBnc3VWc2xXa1VKMFpYQm1hNWRs?=
 =?utf-8?B?WG44Y1VHZktlajBJSVcxN2lrMkVpR0xja2FVNnJYZ0orM2U0bmhrTTdqVVhV?=
 =?utf-8?B?WUFUZDlhdnB1cmtSZWUxNUhIWkphZHhFSnpPc2t5OHEyYndXaXlvemdIblFI?=
 =?utf-8?B?bWFyR21GZm10Q1JNblgxQTlQZWFwNnZYTmZ5Rm5zMDk3UVMvSkR0aWpCakND?=
 =?utf-8?B?bFV6VVRrZENORlcyL2FQdVVGeW00VU93SGxpSlFEQ01ucjRtRzhjbndsUDR4?=
 =?utf-8?B?YTY1Y3RNTWd4RENINGRLWjJjR25DcEdmM0tzQWFUbkJtanhJcFVHZGIxaDBE?=
 =?utf-8?B?QU5EbXVIUDNUL1ZLM25yRDNrN3Brc2xXaGEyOGFoaW9jV1FtSVowNUtDaGd4?=
 =?utf-8?B?KzJzd0pTL1hlZFFvQVdkSTdmUzBBOTZzS210WjNOYzkyZzU1ZkdSRHpRQXBa?=
 =?utf-8?Q?DsGWcJ1Dv4q/9y0IVZ3bDJSyl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ffab9e-8b82-4eee-560a-08db6143517c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 19:23:16.2034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DvsY3OxepHTYkNNOdVF8Azi4KPbuu/BoJjIJoHEUOaokrq3IP3BgVBMfTL9whkyWnA9HS3CVUjHmvFt+mluOyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8602
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
> Add missing debug trap registers references and initialize all debug
> registers on boot by clearing the hardware exception overrides and the
> wave allocation ID index.
>
> The debugger requires that TTMPs 6 & 7 save the dispatch ID to map
> waves onto dispatch during compute context inspection.
> In order to correctly set this up, set the special reserved CP bit by
> default whenever the MQD is initailized.
>
> v2: add missing 0-init of SPI_GDBG_TRAP_DATA0/1
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c        | 26 +++++++
>   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c        |  1 +
>   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c         | 30 ++++++++
>   drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c       |  3 +
>   .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c  |  5 ++
>   .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c  |  5 ++
>   .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c   |  5 ++
>   .../include/asic_reg/gc/gc_10_1_0_offset.h    | 14 ++++
>   .../include/asic_reg/gc/gc_10_1_0_sh_mask.h   | 69 +++++++++++++++++++
>   .../include/asic_reg/gc/gc_10_3_0_offset.h    | 10 +++
>   .../include/asic_reg/gc/gc_10_3_0_sh_mask.h   |  4 ++
>   .../include/asic_reg/gc/gc_11_0_0_sh_mask.h   |  4 ++
>   12 files changed, 176 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> index f7ad883a70fa..be984f8c71c7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> @@ -4825,6 +4825,29 @@ static u32 gfx_v10_0_init_pa_sc_tile_steering_override(struct amdgpu_device *ade
>   
>   #define DEFAULT_SH_MEM_BASES	(0x6000)
>   
> +static void gfx_v10_0_debug_trap_config_init(struct amdgpu_device *adev,
> +				uint32_t first_vmid,
> +				uint32_t last_vmid)
> +{
> +	uint32_t data;
> +	uint32_t trap_config_vmid_mask = 0;
> +	int i;
> +
> +	/* Calculate trap config vmid mask */
> +	for (i = first_vmid; i < last_vmid; i++)
> +		trap_config_vmid_mask |= (1 << i);
> +
> +	data = REG_SET_FIELD(0, SPI_GDBG_TRAP_CONFIG,
> +			VMID_SEL, trap_config_vmid_mask);
> +	data = REG_SET_FIELD(data, SPI_GDBG_TRAP_CONFIG,
> +			TRAP_EN, 1);
> +	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_CONFIG), data);
> +	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), 0);
> +
> +	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_DATA0), 0);
> +	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_DATA1), 0);
> +}
> +
>   static void gfx_v10_0_init_compute_vmid(struct amdgpu_device *adev)
>   {
>   	int i;
> @@ -4856,6 +4879,9 @@ static void gfx_v10_0_init_compute_vmid(struct amdgpu_device *adev)
>   		WREG32_SOC15_OFFSET(GC, 0, mmGDS_GWS_VMID0, i, 0);
>   		WREG32_SOC15_OFFSET(GC, 0, mmGDS_OA_VMID0, i, 0);
>   	}
> +
> +	gfx_v10_0_debug_trap_config_init(adev, adev->vm_manager.first_kfd_vmid,
> +					AMDGPU_NUM_VMID);
>   }
>   
>   static void gfx_v10_0_init_gds_vmid(struct amdgpu_device *adev)
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
> index da21bf868080..690e121d9dda 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
> @@ -1638,6 +1638,7 @@ static void gfx_v11_0_init_compute_vmid(struct amdgpu_device *adev)
>   		/* Enable trap for each kfd vmid. */
>   		data = RREG32_SOC15(GC, 0, regSPI_GDBG_PER_VMID_CNTL);
>   		data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, TRAP_EN, 1);
> +		WREG32_SOC15(GC, 0, regSPI_GDBG_PER_VMID_CNTL, data);
>   	}
>   	soc21_grbm_select(adev, 0, 0, 0, 0);
>   	mutex_unlock(&adev->srbm_mutex);
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> index 0189e50bd89f..7f17e0061027 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> @@ -2303,6 +2303,29 @@ static void gfx_v9_0_setup_rb(struct amdgpu_device *adev)
>   	adev->gfx.config.num_rbs = hweight32(active_rbs);
>   }
>   
> +static void gfx_v9_0_debug_trap_config_init(struct amdgpu_device *adev,
> +				uint32_t first_vmid,
> +				uint32_t last_vmid)
> +{
> +	uint32_t data;
> +	uint32_t trap_config_vmid_mask = 0;
> +	int i;
> +
> +	/* Calculate trap config vmid mask */
> +	for (i = first_vmid; i < last_vmid; i++)
> +		trap_config_vmid_mask |= (1 << i);
> +
> +	data = REG_SET_FIELD(0, SPI_GDBG_TRAP_CONFIG,
> +			VMID_SEL, trap_config_vmid_mask);
> +	data = REG_SET_FIELD(data, SPI_GDBG_TRAP_CONFIG,
> +			TRAP_EN, 1);
> +	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_CONFIG), data);
> +	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), 0);
> +
> +	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_DATA0), 0);
> +	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_DATA1), 0);
> +}
> +
>   #define DEFAULT_SH_MEM_BASES	(0x6000)
>   static void gfx_v9_0_init_compute_vmid(struct amdgpu_device *adev)
>   {
> @@ -4602,6 +4625,13 @@ static int gfx_v9_0_late_init(void *handle)
>   	if (r)
>   		return r;
>   
> +	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 2))
> +		gfx_v9_4_2_debug_trap_config_init(adev,
> +			adev->vm_manager.first_kfd_vmid, AMDGPU_NUM_VMID);
> +	else
> +		gfx_v9_0_debug_trap_config_init(adev,
> +			adev->vm_manager.first_kfd_vmid, AMDGPU_NUM_VMID);
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c
> index 2cc3a7cb1f54..63f6843a069e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c
> @@ -771,6 +771,9 @@ void gfx_v9_4_2_debug_trap_config_init(struct amdgpu_device *adev,
>   
>   	soc15_grbm_select(adev, 0, 0, 0, 0, 0);
>   	mutex_unlock(&adev->srbm_mutex);
> +
> +	WREG32(SOC15_REG_OFFSET(GC, 0, regSPI_GDBG_TRAP_DATA0), 0);
> +	WREG32(SOC15_REG_OFFSET(GC, 0, regSPI_GDBG_TRAP_DATA1), 0);
>   }
>   
>   void gfx_v9_4_2_set_power_brake_sequence(struct amdgpu_device *adev)
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
> index 772c09b5821b..eaaa4f4ddaaa 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
> @@ -117,6 +117,11 @@ static void init_mqd(struct mqd_manager *mm, void **mqd,
>   			1 << CP_HQD_QUANTUM__QUANTUM_SCALE__SHIFT |
>   			1 << CP_HQD_QUANTUM__QUANTUM_DURATION__SHIFT;
>   
> +	/* Set cp_hqd_hq_scheduler0 bit 14 to 1 to have the CP set up the
> +	 * DISPATCH_PTR.  This is required for the kfd debugger
> +	 */
> +	m->cp_hqd_hq_scheduler0 = 1 << 14;
> +
>   	if (q->format == KFD_QUEUE_FORMAT_AQL) {
>   		m->cp_hqd_aql_control =
>   			1 << CP_HQD_AQL_CONTROL__CONTROL0__SHIFT;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
> index 632344b95d90..3a48bbc589fe 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
> @@ -143,6 +143,11 @@ static void init_mqd(struct mqd_manager *mm, void **mqd,
>   			1 << CP_HQD_QUANTUM__QUANTUM_SCALE__SHIFT |
>   			1 << CP_HQD_QUANTUM__QUANTUM_DURATION__SHIFT;
>   
> +	/* Set cp_hqd_hq_scheduler0 bit 14 to 1 to have the CP set up the
> +	 * DISPATCH_PTR.  This is required for the kfd debugger
> +	 */
> +	m->cp_hqd_hq_status0 = 1 << 14;
> +
>   	/*
>   	 * GFX11 RS64 CPFW version >= 509 supports PCIe atomics support
>   	 * acknowledgment.
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
> index 226132ec3714..b7c95158d4a0 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
> @@ -182,6 +182,11 @@ static void init_mqd(struct mqd_manager *mm, void **mqd,
>   			1 << CP_HQD_QUANTUM__QUANTUM_SCALE__SHIFT |
>   			1 << CP_HQD_QUANTUM__QUANTUM_DURATION__SHIFT;
>   
> +	/* Set cp_hqd_hq_scheduler0 bit 14 to 1 to have the CP set up the
> +	 * DISPATCH_PTR.  This is required for the kfd debugger
> +	 */
> +	m->cp_hqd_hq_status0 = 1 << 14;
> +
>   	if (q->format == KFD_QUEUE_FORMAT_AQL)
>   		m->cp_hqd_aql_control =
>   			1 << CP_HQD_AQL_CONTROL__CONTROL0__SHIFT;
> diff --git a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_offset.h b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_offset.h
> index 79c41004c0b6..4908044f7409 100644
> --- a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_offset.h
> +++ b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_offset.h
> @@ -5194,6 +5194,20 @@
>   #define mmSPI_WCL_PIPE_PERCENT_CS6_BASE_IDX                                                            0
>   #define mmSPI_WCL_PIPE_PERCENT_CS7                                                                     0x1f70
>   #define mmSPI_WCL_PIPE_PERCENT_CS7_BASE_IDX                                                            0
> +#define mmSPI_GDBG_WAVE_CNTL                                                                           0x1f71
> +#define mmSPI_GDBG_WAVE_CNTL_BASE_IDX                                                                  0
> +#define mmSPI_GDBG_TRAP_CONFIG                                                                         0x1f72
> +#define mmSPI_GDBG_TRAP_CONFIG_BASE_IDX                                                                0
> +#define mmSPI_GDBG_TRAP_MASK                                                                           0x1f73
> +#define mmSPI_GDBG_TRAP_MASK_BASE_IDX                                                                  0
> +#define mmSPI_GDBG_WAVE_CNTL2                                                                          0x1f74
> +#define mmSPI_GDBG_WAVE_CNTL2_BASE_IDX                                                                 0
> +#define mmSPI_GDBG_WAVE_CNTL3                                                                          0x1f75
> +#define mmSPI_GDBG_WAVE_CNTL3_BASE_IDX                                                                 0
> +#define mmSPI_GDBG_TRAP_DATA0                                                                          0x1f78
> +#define mmSPI_GDBG_TRAP_DATA0_BASE_IDX                                                                 0
> +#define mmSPI_GDBG_TRAP_DATA1                                                                          0x1f79
> +#define mmSPI_GDBG_TRAP_DATA1_BASE_IDX                                                                 0
>   #define mmSPI_COMPUTE_QUEUE_RESET                                                                      0x1f7b
>   #define mmSPI_COMPUTE_QUEUE_RESET_BASE_IDX                                                             0
>   #define mmSPI_RESOURCE_RESERVE_CU_0                                                                    0x1f7c
> diff --git a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_sh_mask.h b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_sh_mask.h
> index 52043e143067..9b7d219e7954 100644
> --- a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_sh_mask.h
> +++ b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_sh_mask.h
> @@ -19700,6 +19700,75 @@
>   //SPI_WCL_PIPE_PERCENT_CS7
>   #define SPI_WCL_PIPE_PERCENT_CS7__VALUE__SHIFT                                                                0x0
>   #define SPI_WCL_PIPE_PERCENT_CS7__VALUE_MASK                                                                  0x7FL
> +//SPI_GDBG_WAVE_CNTL
> +#define SPI_GDBG_WAVE_CNTL__STALL_RA__SHIFT                                                                   0x0
> +#define SPI_GDBG_WAVE_CNTL__STALL_VMID__SHIFT                                                                 0x1
> +#define SPI_GDBG_WAVE_CNTL__STALL_RA_MASK                                                                     0x00000001L
> +#define SPI_GDBG_WAVE_CNTL__STALL_VMID_MASK                                                                   0x0001FFFEL
> +//SPI_GDBG_TRAP_CONFIG
> +#define SPI_GDBG_TRAP_CONFIG__ME_SEL__SHIFT                                                                   0x0
> +#define SPI_GDBG_TRAP_CONFIG__PIPE_SEL__SHIFT                                                                 0x2
> +#define SPI_GDBG_TRAP_CONFIG__QUEUE_SEL__SHIFT                                                                0x4
> +#define SPI_GDBG_TRAP_CONFIG__ME_MATCH__SHIFT                                                                 0x7
> +#define SPI_GDBG_TRAP_CONFIG__PIPE_MATCH__SHIFT                                                               0x8
> +#define SPI_GDBG_TRAP_CONFIG__QUEUE_MATCH__SHIFT                                                              0x9
> +#define SPI_GDBG_TRAP_CONFIG__TRAP_EN__SHIFT                                                                  0xf
> +#define SPI_GDBG_TRAP_CONFIG__VMID_SEL__SHIFT                                                                 0x10
> +#define SPI_GDBG_TRAP_CONFIG__ME_SEL_MASK                                                                     0x00000003L
> +#define SPI_GDBG_TRAP_CONFIG__PIPE_SEL_MASK                                                                   0x0000000CL
> +#define SPI_GDBG_TRAP_CONFIG__QUEUE_SEL_MASK                                                                  0x00000070L
> +#define SPI_GDBG_TRAP_CONFIG__ME_MATCH_MASK                                                                   0x00000080L
> +#define SPI_GDBG_TRAP_CONFIG__PIPE_MATCH_MASK                                                                 0x00000100L
> +#define SPI_GDBG_TRAP_CONFIG__QUEUE_MATCH_MASK                                                                0x00000200L
> +#define SPI_GDBG_TRAP_CONFIG__TRAP_EN_MASK                                                                    0x00008000L
> +#define SPI_GDBG_TRAP_CONFIG__VMID_SEL_MASK                                                                   0xFFFF0000L
> +//SPI_GDBG_TRAP_MASK
> +#define SPI_GDBG_TRAP_MASK__EXCP_EN__SHIFT                                                                    0x0
> +#define SPI_GDBG_TRAP_MASK__REPLACE__SHIFT                                                                    0x9
> +#define SPI_GDBG_TRAP_MASK__EXCP_EN_MASK                                                                      0x01FFL
> +#define SPI_GDBG_TRAP_MASK__REPLACE_MASK                                                                      0x0200L
> +//SPI_GDBG_WAVE_CNTL2
> +#define SPI_GDBG_WAVE_CNTL2__VMID_MASK__SHIFT                                                                 0x0
> +#define SPI_GDBG_WAVE_CNTL2__MODE__SHIFT                                                                      0x10
> +#define SPI_GDBG_WAVE_CNTL2__VMID_MASK_MASK                                                                   0x0000FFFFL
> +#define SPI_GDBG_WAVE_CNTL2__MODE_MASK                                                                        0x00030000L
> +//SPI_GDBG_WAVE_CNTL3
> +#define SPI_GDBG_WAVE_CNTL3__STALL_PS__SHIFT                                                                  0x0
> +#define SPI_GDBG_WAVE_CNTL3__STALL_VS__SHIFT                                                                  0x1
> +#define SPI_GDBG_WAVE_CNTL3__STALL_GS__SHIFT                                                                  0x2
> +#define SPI_GDBG_WAVE_CNTL3__STALL_HS__SHIFT                                                                  0x3
> +#define SPI_GDBG_WAVE_CNTL3__STALL_CSG__SHIFT                                                                 0x4
> +#define SPI_GDBG_WAVE_CNTL3__STALL_CS0__SHIFT                                                                 0x5
> +#define SPI_GDBG_WAVE_CNTL3__STALL_CS1__SHIFT                                                                 0x6
> +#define SPI_GDBG_WAVE_CNTL3__STALL_CS2__SHIFT                                                                 0x7
> +#define SPI_GDBG_WAVE_CNTL3__STALL_CS3__SHIFT                                                                 0x8
> +#define SPI_GDBG_WAVE_CNTL3__STALL_CS4__SHIFT                                                                 0x9
> +#define SPI_GDBG_WAVE_CNTL3__STALL_CS5__SHIFT                                                                 0xa
> +#define SPI_GDBG_WAVE_CNTL3__STALL_CS6__SHIFT                                                                 0xb
> +#define SPI_GDBG_WAVE_CNTL3__STALL_CS7__SHIFT                                                                 0xc
> +#define SPI_GDBG_WAVE_CNTL3__STALL_DURATION__SHIFT                                                            0xd
> +#define SPI_GDBG_WAVE_CNTL3__STALL_MULT__SHIFT                                                                0x1c
> +#define SPI_GDBG_WAVE_CNTL3__STALL_PS_MASK                                                                    0x00000001L
> +#define SPI_GDBG_WAVE_CNTL3__STALL_VS_MASK                                                                    0x00000002L
> +#define SPI_GDBG_WAVE_CNTL3__STALL_GS_MASK                                                                    0x00000004L
> +#define SPI_GDBG_WAVE_CNTL3__STALL_HS_MASK                                                                    0x00000008L
> +#define SPI_GDBG_WAVE_CNTL3__STALL_CSG_MASK                                                                   0x00000010L
> +#define SPI_GDBG_WAVE_CNTL3__STALL_CS0_MASK                                                                   0x00000020L
> +#define SPI_GDBG_WAVE_CNTL3__STALL_CS1_MASK                                                                   0x00000040L
> +#define SPI_GDBG_WAVE_CNTL3__STALL_CS2_MASK                                                                   0x00000080L
> +#define SPI_GDBG_WAVE_CNTL3__STALL_CS3_MASK                                                                   0x00000100L
> +#define SPI_GDBG_WAVE_CNTL3__STALL_CS4_MASK                                                                   0x00000200L
> +#define SPI_GDBG_WAVE_CNTL3__STALL_CS5_MASK                                                                   0x00000400L
> +#define SPI_GDBG_WAVE_CNTL3__STALL_CS6_MASK                                                                   0x00000800L
> +#define SPI_GDBG_WAVE_CNTL3__STALL_CS7_MASK                                                                   0x00001000L
> +#define SPI_GDBG_WAVE_CNTL3__STALL_DURATION_MASK                                                              0x0FFFE000L
> +#define SPI_GDBG_WAVE_CNTL3__STALL_MULT_MASK                                                                  0x10000000L
> +//SPI_GDBG_TRAP_DATA0
> +#define SPI_GDBG_TRAP_DATA0__DATA__SHIFT                                                                      0x0
> +#define SPI_GDBG_TRAP_DATA0__DATA_MASK                                                                        0xFFFFFFFFL
> +//SPI_GDBG_TRAP_DATA1
> +#define SPI_GDBG_TRAP_DATA1__DATA__SHIFT                                                                      0x0
> +#define SPI_GDBG_TRAP_DATA1__DATA_MASK                                                                        0xFFFFFFFFL
>   //SPI_COMPUTE_QUEUE_RESET
>   #define SPI_COMPUTE_QUEUE_RESET__RESET__SHIFT                                                                 0x0
>   #define SPI_COMPUTE_QUEUE_RESET__RESET_MASK                                                                   0x01L
> diff --git a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_offset.h b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_offset.h
> index a734abaa91a5..5e15ac14b63c 100644
> --- a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_offset.h
> +++ b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_offset.h
> @@ -26,6 +26,8 @@
>   #define mmSQ_DEBUG_STS_GLOBAL_BASE_IDX                                                                 0
>   #define mmSQ_DEBUG_STS_GLOBAL2                                                                         0x10B0
>   #define mmSQ_DEBUG_STS_GLOBAL2_BASE_IDX                                                                0
> +#define mmSQ_DEBUG                                                                                     0x10B1
> +#define mmSQ_DEBUG_BASE_IDX                                                                            0
>   
>   // addressBlock: gc_sdma0_sdma0dec
>   // base address: 0x4980
> @@ -4853,10 +4855,18 @@
>   #define mmSPI_WCL_PIPE_PERCENT_CS3_BASE_IDX                                                            0
>   #define mmSPI_GDBG_WAVE_CNTL                                                                           0x1f71
>   #define mmSPI_GDBG_WAVE_CNTL_BASE_IDX                                                                  0
> +#define mmSPI_GDBG_TRAP_CONFIG                                                                         0x1f72
> +#define mmSPI_GDBG_TRAP_CONFIG_BASE_IDX                                                                0
>   #define mmSPI_GDBG_TRAP_MASK                                                                           0x1f73
>   #define mmSPI_GDBG_TRAP_MASK_BASE_IDX                                                                  0
>   #define mmSPI_GDBG_WAVE_CNTL2                                                                          0x1f74
>   #define mmSPI_GDBG_WAVE_CNTL2_BASE_IDX                                                                 0
> +#define mmSPI_GDBG_WAVE_CNTL3                                                                          0x1f75
> +#define mmSPI_GDBG_WAVE_CNTL3_BASE_IDX                                                                 0
> +#define mmSPI_GDBG_TRAP_DATA0                                                                          0x1f78
> +#define mmSPI_GDBG_TRAP_DATA0_BASE_IDX                                                                 0
> +#define mmSPI_GDBG_TRAP_DATA1                                                                          0x1f79
> +#define mmSPI_GDBG_TRAP_DATA1_BASE_IDX                                                                 0
>   #define mmSPI_COMPUTE_QUEUE_RESET                                                                      0x1f7b
>   #define mmSPI_COMPUTE_QUEUE_RESET_BASE_IDX                                                             0
>   #define mmSPI_RESOURCE_RESERVE_CU_0                                                                    0x1f7c
> diff --git a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_sh_mask.h b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_sh_mask.h
> index d7a17bae2584..e4ecd6c2d20e 100644
> --- a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_sh_mask.h
> +++ b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_sh_mask.h
> @@ -47907,6 +47907,10 @@
>   
>   
>   // addressBlock: sqind
> +//SQ_DEBUG
> +#define SQ_DEBUG__SINGLE_MEMOP_MASK 0x00000001L
> +#define SQ_DEBUG__SINGLE_MEMOP__SHIFT 0x00000000
> +
>   //SQ_DEBUG_STS_GLOBAL
>   #define SQ_DEBUG_STS_GLOBAL2__FIFO_LEVEL_GFX0_MASK 0x000000ffL
>   #define SQ_DEBUG_STS_GLOBAL2__FIFO_LEVEL_GFX0__SHIFT 0x00000000
> diff --git a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_11_0_0_sh_mask.h b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_11_0_0_sh_mask.h
> index 4f08f90856fc..3088a4a13cb5 100644
> --- a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_11_0_0_sh_mask.h
> +++ b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_11_0_0_sh_mask.h
> @@ -17216,11 +17216,15 @@
>   #define SPI_GDBG_PER_VMID_CNTL__TRAP_EN__SHIFT                                                                0x3
>   #define SPI_GDBG_PER_VMID_CNTL__EXCP_EN__SHIFT                                                                0x4
>   #define SPI_GDBG_PER_VMID_CNTL__EXCP_REPLACE__SHIFT                                                           0xd
> +#define SPI_GDBG_PER_VMID_CNTL__TRAP_ON_START__SHIFT                                                          0xe
> +#define SPI_GDBG_PER_VMID_CNTL__TRAP_ON_END__SHIFT                                                            0xf
>   #define SPI_GDBG_PER_VMID_CNTL__STALL_VMID_MASK                                                               0x00000001L
>   #define SPI_GDBG_PER_VMID_CNTL__LAUNCH_MODE_MASK                                                              0x00000006L
>   #define SPI_GDBG_PER_VMID_CNTL__TRAP_EN_MASK                                                                  0x00000008L
>   #define SPI_GDBG_PER_VMID_CNTL__EXCP_EN_MASK                                                                  0x00001FF0L
>   #define SPI_GDBG_PER_VMID_CNTL__EXCP_REPLACE_MASK                                                             0x00002000L
> +#define SPI_GDBG_PER_VMID_CNTL__TRAP_ON_START_MASK                                                            0x00004000L
> +#define SPI_GDBG_PER_VMID_CNTL__TRAP_ON_END_MASK                                                              0x00008000L
>   //SPI_COMPUTE_QUEUE_RESET
>   #define SPI_COMPUTE_QUEUE_RESET__RESET__SHIFT                                                                 0x0
>   #define SPI_COMPUTE_QUEUE_RESET__RESET_MASK                                                                   0x01L
