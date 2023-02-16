Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF76069A28C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 00:45:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D1210E3AA;
	Thu, 16 Feb 2023 23:45:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2079.outbound.protection.outlook.com [40.107.237.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1023810E1A2;
 Thu, 16 Feb 2023 23:44:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OfiB+G1e1Mx9gRl84/nnbOVipPw/Z8ltWpSrCdDkWvtvtGnak+KNhcJYDK2xiAZgJzow6Y4nYRiG9YeZNWjBFI349rYVv2GNxgkGFpbo+TKpAX2w3XZHiBpWmH4TmJmZuAzfSzEY2GBCjqU74Hc+xQ0upm9qnP4vEnIalP7nm/47ZSQLB5YkMZPuSd0KEy9TkmxU+LEg5276wIWFsb7eynD83cJD3nioRiQIJWqP8tucBod45c2FSsCE/rs/HPvOAy4S/lKDTqJmz2N/vkjbkumcfaTxWn3XbOr16jN9oAUQKa7qVKl/pU2t0XGhn6X50xXSWsSpRJroMleMOHNYWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vvyZxWY2fBvL/LnJJeNHidQ1qdFI3oqGpY7SFsMJBPE=;
 b=MoZIHfp978iXrGUGJMMVKlCSzgDia5WOM4QQMFWwTsWRlTNMqLke50HMRrRsizUgP5wLCBH8wBXaoRa0nrM48opt0oJlaaj4z798NbgMl3ZIzsi6iDz1R+AuHA1tpFsbCSAMT0KVaP0KPs2Z8RaiwJhyp3mpUAmay2L7YPHZ1tySjU6FZVUi+TChonUws3lRAnvhmjiYgOQyz2g8w0zm5/iK4TeqJPsToD2GmfyTcD9Wwo3ewiVzcEg2a4Keh6QwpNPQgnFt4m75XSooUXln/Jh63k2qtm1JP3zeXd6KxnNoZdWYJbwH2cUkOJhVA5KYb7f13QQroWi6SZ+uH1vZgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vvyZxWY2fBvL/LnJJeNHidQ1qdFI3oqGpY7SFsMJBPE=;
 b=WiwB2fS6tu7DgyT+e5RmdweWPctfTO3uMhsB/m+K+Y0qvekEQckOUm8y9xmgqYKmk8vNUwOHD2qSVp5hngftF/Iy4O0Uqb6sXSzjRCdYYd8dwS/+ne0sQufvBAwPL1JMb15vQSkQVeTKSE9JMPJals7MlpUZs62KKqVi6Rf0NF0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SN7PR12MB7955.namprd12.prod.outlook.com (2603:10b6:806:34d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Thu, 16 Feb
 2023 23:44:55 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::e6ea:9231:6d39:93da]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::e6ea:9231:6d39:93da%4]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 23:44:55 +0000
Message-ID: <3b25bccd-3525-c61a-5764-f27bd3c5d186@amd.com>
Date: Thu, 16 Feb 2023 17:39:25 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 05/32] drm/amdgpu: setup hw debug registers on driver
 initialization
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
 <20230125195401.4183544-6-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230125195401.4183544-6-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXPR0101CA0009.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::22) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SN7PR12MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: 6358292a-3361-4962-e5b7-08db1077ce60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dxl7a3UpkkfSaDYmGiDaQ35dEHe7DU8L5Bg/tvWux+ahzAt0ritPnFF0SBerLrKaxEEvizUNH7U4C2JfW9kqqs+X44MEs+qSWT/NwzGS51zOlTywuzIT5utpTd6dXshhe3jWFJU4W8HSVoKP64RYyWeX6h5W9GKRg5bvHIjgwKUKGnZY+ybIPXHsDM/XJzu11cPRYNhRdvH77rvlBpRuH2171SJTlFTOM3+6VLzZ9685lK3WdYYbrOFUk5ZBg2/9y61oS50wUBzvVuB5Qu6uJPX6TcCjdMf4W9yjexwTzDv69Zpv3lGJ9muLx+/JbH2eJTulNMbkrk0tocXxDZj0MyO8NbX3spVuf6SmzrMaVbW8cL9jwi0fv+nayyFvG8bYOG1cvA7t3Jub7bNhq2BoyPer4EvAkEkCqIDk1dlNLJmiIVQicNCBmfluJ9flKGOObEWfde77nMxNo/pY0pvE0hbZXeBGVDObKlrIgsVKIQHdinCtbN6UFnD8WGMpzoKF7UySOWKSAFrHvoUntvZQ9sBeQQ3NJVPzxCA+WMOvnV/k+Utv47vyHok7KIt9dmqAxInkFOiNxUNGNgNsb09OLS8T0KtHBVgZvwua8Wnnnwp7HCsWEL8A4DdoHmcnXW5HMoADFRxgf/X3h9A2uij4izzLr/yB4dEIcvapFpIYYlhyeczYcxsRnmSZ+MW9gA0NWURR21mXahrcQAtCjcuKu0RLxmcKR4QJIic30ie+K9o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(451199018)(31686004)(8936002)(2906002)(41300700001)(36756003)(30864003)(31696002)(5660300002)(44832011)(86362001)(83380400001)(38100700002)(8676002)(478600001)(6486002)(450100002)(26005)(6512007)(186003)(66946007)(66556008)(316002)(66476007)(53546011)(6506007)(2616005)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDlLZkZXQmkvUmhtM2YvVEtnK3JCL21PNDdoV1Q4dm5mMmd4TkVUUnBuTUZY?=
 =?utf-8?B?M0hlUmJDV3FlVS8wL3pvSHVBZ1diU1pkR0tJWlRRVWlUamhYWkU4MEJ3UmRn?=
 =?utf-8?B?M0lYM0JTVnF1eXQ4bG5mLytyOEdMOGtYSWM4UVcyaTlBVGFaanBVNkFuOVBM?=
 =?utf-8?B?cng0UnFQbDVFcXp3bER0V3ZvNFFzRXhmeEFHQzZ1TzJ4K1JKdlBRU2JoY2Nw?=
 =?utf-8?B?MExNUlVBOVdPaitoc29MUjd2ekVkS3FST09ydUxCL2owenRQV2srTVZhZFVM?=
 =?utf-8?B?K3IzMXB4VHc0cVlva245cEtRdzZITjlLYjN4QXNvZ3VMS1o0WU05SmpBUTBx?=
 =?utf-8?B?V3N4QU5MWkV2c1k1RFNDRXhZb3dpaG11N2JSMGJlUVNVV2ZYTXIxcXp6Y2Ri?=
 =?utf-8?B?eDBqTUJXVzhHZU8zV2N5clpIVkt2Qk5aQWhmNWlxbHNLeml6WEMwbW5nL1hv?=
 =?utf-8?B?bDZ0MUMxODlWb1RncnBhMDI2MW8rT1hMQ3ltM2JTVlBkenRYVFJycUN4N2hz?=
 =?utf-8?B?QVFHTFA2VytGRWtvUDhpTTJZSkRNOS95TXVxREN2RExkNW9GaHZUcXRYMExZ?=
 =?utf-8?B?RnZMUjZTdlppUTR0UGRjb3pWc1R0c3QxNlB2bURERlhmWDZOVkI4L1g3bENu?=
 =?utf-8?B?dUpCWXBKMWx4SWVRMFZDcW5tam5jbGNuU1A0WEhvVzUyUnA2R1JIT0E2Kzdt?=
 =?utf-8?B?Y2pmd09HWkE4Y21JUFh6RDEvVzJ0d3JXNXVwYkd2OWFLUDZ1TDNhK2xpM0Z0?=
 =?utf-8?B?ZklvY0NMV0p1K2xLYVhVdmc1cHJxRnJGUW1KamdwOGFOYUNtbldEUkhYbGh3?=
 =?utf-8?B?dENKVHF5cUFjbVVFVURuRk1PRXNhaVMwRzYxNXFpU3dPNUtKL3NFOXM2MmZH?=
 =?utf-8?B?bzBrRytwOU9JeUJUQmo3WWozdWZaaUhSbGNyaEcrNXpuL2RMMTY5NWo5SjBk?=
 =?utf-8?B?bkQ1Y0pvNHRwR3ZsbGo2Ujhkak9tUE4raHZGWENlWksxQkt3OG0zMTJDa1NM?=
 =?utf-8?B?OGFmRG9GNGNJZ3JSenVyZ0V6TkJ6Y0tpT01DYjlWNUh6d3o5azNUcDhhZmMv?=
 =?utf-8?B?U203bjhGOEJicW1NbkdsVkdOTVdJdzRvMUlVckpjNWExL2Z2YkVTSGorb0Zm?=
 =?utf-8?B?ckdmK1dpREF1VlRDWTlTbGs4Vjh0VGxNdVcvcW8ybC9VT2I5NTJUMHlPbWJ4?=
 =?utf-8?B?VmdsLzAySFg0T0E3a0tDaU9iRzZheUJKd2VDTkNFalBYQmhwejhlR2ZoNVpJ?=
 =?utf-8?B?YUwxWVB0bisrWG4xOVVDVlRYbXpxbTNHdkFEbC9Ic2RQYXdKanFsc28zNWJp?=
 =?utf-8?B?VjdRa2grWkhheml2OGJxcXdzQldtbDZodGgrNi9aemY0bGRaZWNPdDdLSXFZ?=
 =?utf-8?B?L2pjNFI0amZyNU9YNWtCUVd6cUVVQ1N2WDRZQjhFY3ZkcHp5KzNNOUpiZkJX?=
 =?utf-8?B?K2UwT3VRUEFDbUpMVG9OK3NQV1oyeWJxY01mOXpUSWhXT1RQaG1LVnY2S1g4?=
 =?utf-8?B?MmFEM2U1UnY5RS9SK1lpSXhRWEFsaDkvdXA1SGFub0FuUXBKVnNuZTNDdHpj?=
 =?utf-8?B?YUE5Z0tVcHY3T2dFMDNMbHRlcWlZbGZBc1MyYkQxSnFHNngwSEFSN3RaL0VS?=
 =?utf-8?B?SlkwU3hrYU5SdVk3c0R5S2pBMm1OcWZsOUNRa042bUVyZ2VSUTh4ZWxpRWlz?=
 =?utf-8?B?bXExNUtnSEVpdW9manhCdEU4MHFVRnBPV3ZMTWhWZ3FOdGcvZUkyRU1Wclpz?=
 =?utf-8?B?K2JJS2ZvR0hXVEhaS3lMeVZoUy9rdkJOaFg4SkV3VXFMbVdPVlBNNThRdnVG?=
 =?utf-8?B?NXhSVHRFZHJqY3BDeTdLbjJEZ0oyc21UZWw5QzZtMTNxMlVYc1BPU2NFbkMr?=
 =?utf-8?B?VVNvV05DbnpCSmhXRjRpQzRybVR4ajl3Vmd2UHlZSnpsQ3dSeWlrS2pNaGtJ?=
 =?utf-8?B?VmxndjdrSVFKd2Uzcm8vaVcrOHhrZ2RydmpHeTBpOFN0QjM0TTBBYkZMMyt0?=
 =?utf-8?B?UkxIbmZPOGZWajhRQlFQS2NuT2ZOWk8xbk5BNzNXQStSYThWK3lKYmU1UmRo?=
 =?utf-8?B?d2hjZ3FOaXgzbWFkVEZyTHEzUjBsckZ6Znc3bnZCc0VRdW4ydWRnbmFZZVVj?=
 =?utf-8?Q?E1pe8/X8FnXuRZzGSoIRctqhl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6358292a-3361-4962-e5b7-08db1077ce60
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 23:44:55.4696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YS/zYXC3Z1qObVvvNBffqhfUrJaIEo4KI4ZrKaYsW8EuD/ICcXIhYpPGIT69lankliR1SwTBipWEikparFLLew==
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
> Add missing debug trap registers references and initialize all debug
> registers on boot by clearing the hardware exception overrides and the
> wave allocation ID index.
>
> The debugger requires that TTMPs 6 & 7 save the dispatch ID to map
> waves onto dispatch during compute context inspection.
> In order to correctly set this up, set the special reserved CP bit by
> default whenever the MQD is initailized.
>
> v2: leave TRAP_EN set for multi-process debugging as per process disable
> will be taken care of in later patches.
> fixup typo in description.
> enable ttmp setup for dispatch boundary in mqd init for gfx11.
> add trap on wave start and end registers for gfx11.
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c        | 26 +++++++
>   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c        |  1 +
>   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c         | 30 ++++++++
>   .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c  |  5 ++
>   .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c  |  5 ++
>   .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c   |  5 ++
>   .../include/asic_reg/gc/gc_10_1_0_offset.h    | 14 ++++
>   .../include/asic_reg/gc/gc_10_1_0_sh_mask.h   | 69 +++++++++++++++++++
>   .../include/asic_reg/gc/gc_10_3_0_offset.h    | 10 +++
>   .../include/asic_reg/gc/gc_10_3_0_sh_mask.h   |  4 ++
>   .../include/asic_reg/gc/gc_11_0_0_sh_mask.h   |  4 ++
>   11 files changed, 173 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> index 6983acc456b2..a5faf23805b5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> @@ -4823,6 +4823,29 @@ static u32 gfx_v10_0_init_pa_sc_tile_steering_override(struct amdgpu_device *ade
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
> @@ -4854,6 +4877,9 @@ static void gfx_v10_0_init_compute_vmid(struct amdgpu_device *adev)
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
> index c621b2ad7ba3..3ca7a31fb770 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
> @@ -1572,6 +1572,7 @@ static void gfx_v11_0_init_compute_vmid(struct amdgpu_device *adev)
>   		/* Enable trap for each kfd vmid. */
>   		data = RREG32_SOC15(GC, 0, regSPI_GDBG_PER_VMID_CNTL);
>   		data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, TRAP_EN, 1);
> +		WREG32_SOC15(GC, 0, regSPI_GDBG_PER_VMID_CNTL, data);
>   	}
>   	soc21_grbm_select(adev, 0, 0, 0, 0);
>   	mutex_unlock(&adev->srbm_mutex);
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> index 8ad5c03506f2..222fe87161b7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> @@ -2289,6 +2289,29 @@ static void gfx_v9_0_setup_rb(struct amdgpu_device *adev)
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
> @@ -4565,6 +4588,13 @@ static int gfx_v9_0_late_init(void *handle)
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
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
> index d3e2b6a599a4..cb484ace17de 100644
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
> index 4f6390f3236e..ac7c8fc83c94 100644
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
>   	if (q->format == KFD_QUEUE_FORMAT_AQL) {
>   		m->cp_hqd_aql_control =
>   			1 << CP_HQD_AQL_CONTROL__CONTROL0__SHIFT;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
> index 0778e587a2d6..86f1cf090246 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
> @@ -164,6 +164,11 @@ static void init_mqd(struct mqd_manager *mm, void **mqd,
>   			1 << CP_HQD_QUANTUM__QUANTUM_SCALE__SHIFT |
>   			1 << CP_HQD_QUANTUM__QUANTUM_DURATION__SHIFT;
>   
> +	/* Set cp_hqd_hq_scheduler0 bit 14 to 1 to have the CP set up the
> +	 * DISPATCH_PTR.  This is required for the kfd debugger
> +	 */
> +	m->cp_hqd_hq_status0 = 1 << 14;
> +
>   	if (q->format == KFD_QUEUE_FORMAT_AQL) {
>   		m->cp_hqd_aql_control =
>   			1 << CP_HQD_AQL_CONTROL__CONTROL0__SHIFT;
> diff --git a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_offset.h b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_offset.h
> index 18d34bbceebe..7d384f86bd67 100644
> --- a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_offset.h
> +++ b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_offset.h
> @@ -5190,6 +5190,20 @@
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
> index 4127896ffcdf..08772ba845b0 100644
> --- a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_sh_mask.h
> +++ b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_sh_mask.h
> @@ -19646,6 +19646,75 @@
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
> index 3973110f149c..d09f1a06f4bf 100644
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
> @@ -4849,10 +4851,18 @@
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
> index d4e8ff22ecb8..fc85aee010fe 100644
> --- a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_sh_mask.h
> +++ b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_sh_mask.h
> @@ -47853,6 +47853,10 @@
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
