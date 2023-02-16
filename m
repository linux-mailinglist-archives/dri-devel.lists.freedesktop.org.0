Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2206A69A28B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 00:45:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3867810E390;
	Thu, 16 Feb 2023 23:45:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2042.outbound.protection.outlook.com [40.107.237.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7B010E39F;
 Thu, 16 Feb 2023 23:44:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D0nivvnkLhH5cOgChzH8VOlHUSKe2tqzv/MY3340lFTOe+vr5kvjZUFpezWVD1c7iCnPDnVRuO5lehZvpZp0HA47SB09wWStreaG216sZ6zF2A7wpNvKPlsFCGkJpMucEj2+j0qg7mV1+CLL1zEnAjZETBUPwYEw1CmeRQ+jo0Mu41E/j2j6ZsqKGD83ydjO3v7oufwn39sQSzjLCiIH+CedRlowFsKyYA+V1wgSZt4dJpotdn+aWnbuiPoplmyi7HFILZg+ZGtykgj54B3YkO7Bsyc6AfXEUHnMOKk9jNoe+4diRhCIngV0gGWK06bVv1oV7gEwVnuoNFqyN3s0TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hvHIFenZv6ciciPOFc6afaGoKrLLfDSWOVkwLV0Zj4o=;
 b=E0079MVRLP1u7AFpQz/rRIIrb8x4QYe0qwIKlYwrTSFBKJ3Tt6ngKXku9ZItl7+eF2TJCH52KWAFGwviwrdm7IDDe46jwcOyR89BI2KYQO082lCvZoZNnVIMwKtmKDq2Qt3uK6M07WzT9zGFDujbYEZe1zRGENe8aMmygcU2pSBag/ki8S4BFWa1Qn0aiq89LwuWVOveL1ak23o6oQpEmNs2HRGS/yOVsDe3r28R4D7GLn8X7LjG460JoDqOzb0UQpC7vFepVw5dLPQGHZjebXRQjbfYOR5idXPMv6iGJwYifMkLlLwt/US9yapCtDWCZwr3XOEKtbkaXHipZ1RsHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvHIFenZv6ciciPOFc6afaGoKrLLfDSWOVkwLV0Zj4o=;
 b=oY59vKHeMczb7ZWDpfnYJTUory+7zaJEfV2aHyrKn6BKYT3CWybOdUUgrMJSXupYE613z5czesnyxtH2zSXuh9tK3Lr8tq1tgkXVrq44yE4EsyjMRq3gccpZdA3I67pLXTc7GCZchykwVdI3zTdu1HRDqWgG8NveYbCAGBEGh8Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SN7PR12MB7955.namprd12.prod.outlook.com (2603:10b6:806:34d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Thu, 16 Feb
 2023 23:44:57 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::e6ea:9231:6d39:93da]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::e6ea:9231:6d39:93da%4]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 23:44:57 +0000
Message-ID: <15d2e27d-1a04-8b42-3a5a-4e7705e6ecf8@amd.com>
Date: Thu, 16 Feb 2023 17:54:27 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [PATCH 06/32] drm/amdgpu: add gfx9 hw debug mode enable and
 disable calls
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
 <20230125195401.4183544-7-jonathan.kim@amd.com>
Content-Language: en-US
In-Reply-To: <20230125195401.4183544-7-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0234.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::10) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SN7PR12MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: 53d5483f-e66b-4fc0-5dee-08db1077cfb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7eI4WRHsbQQqui4DA36sq3WfrUzVCQW3ekAtRcgZkIozz2qP12vjVtRyeZxhaSqYrnCDs4EBdxkW5jCy5ar9VJ9hs4TbjcvpubMC+mWqsl3mLrK9Y1zp6c7DKrc4cUS27h9HU2F8DVG+ZXaZbd4UY/R+WEkmT2CowGCaXRq2qmvLGpVJkpfI3/pRvbPVlLwvpT+YqOh9kwpH8B1I7pf/CeSweudsCwDVWBsvUqQmevrz9TB8Qoz/KoonJ4ZPIDovO6sgvJZq5yT3Gu0LU9cohD15soiy1NzbCBgV3GhQkHvFoqgmpYgIism9ZkRw54ekORowhPA3SBUBx2UDKIfVTx//xEkTdEGKJrt5vgEzmWXSb5actkW7mKtMsu8b3JpB5USIr5e9NMwmxeG9syIw8CxSiu+URB33Y6TNX2DOZ7euY7ikHdj71o4Ob1Xap5lSyBuM6URF3f84mT53kSdwGBJHCM7c7JuA19JSjXmNJKKjzG7d84QAGmT6ENe99txAdE+OmMQy7QL9lGHf90LPeOTXe9z3n1VD+1gbDTjptdy2zZtO/0k2q3mjmJQPYj4i30paL6u8w+zlzReJrhrFidhI0euhAA6A18I5IX8JKGgAoJjD4/aYArMdDXhoXVoIwn3cpcXcJUwI2oPcxytgIi0Ur9L3F4yem4Q2KPeKusOSVKtP1KIkACO8T2f9n/ymfV+/NoOLW1aDuQrTNixHCtAgChD19AN7QkKnSRSDfVk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(451199018)(31686004)(8936002)(2906002)(41300700001)(36756003)(31696002)(5660300002)(44832011)(86362001)(83380400001)(38100700002)(8676002)(478600001)(6486002)(450100002)(26005)(6512007)(186003)(66946007)(66556008)(316002)(66476007)(53546011)(6506007)(2616005)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L01vbzFhWStDYy9WQnh0MnQwdzBlWmlUZFJiYmFHQVhMZ3VTem5GYjZ6bThM?=
 =?utf-8?B?S2Rva2REWFZTOXVOQkhaZEpwOWtNRGNvZ1FvaWdjU1VsQnlmTDdYQ3pCc1l6?=
 =?utf-8?B?SXM1eHIyZDJEdDZuVFdUNmpvQitRYzR6NnFEaEx3TFo3THd1YnBISVNyUWJy?=
 =?utf-8?B?SUZDQnBiV0ZkSmpoMjdWYnZmelowZmYwNDZXbDZoTEsrN0d4T0I3OUZaOXJP?=
 =?utf-8?B?a0ZBN3BFd3VIazl3NEVyK2ptVGxHUVJiQjRKTzhOLzR2MWtmanZncm8yME9F?=
 =?utf-8?B?alM5YzgvL2VFc3dDUnlZd0V5b21aRWdlc2pnUEdLajFwaExIcm52TnZvTE5r?=
 =?utf-8?B?b1V5clBXT20wODFqekRheVF2ME9teCs1Y0FZSUU2bXhHL3pqYmpCTm1LS09i?=
 =?utf-8?B?OWxGUU1LSU52OUtiUHVqbUFERUdkRm1jcXltamdOakIyb21UK1FmQm1CeTMw?=
 =?utf-8?B?cWZ1WUNvcHhqSHJjQzBLK2J2dkZtUEZ1YVJuZko0Y0NhVlRLanFBM0NKbHA5?=
 =?utf-8?B?NU5kdkhpVjJLTWd0UXhLVGVEa0JnUXdQTFA1Vnh2TEFaRmcwWHgvTmVka2Vp?=
 =?utf-8?B?cDQzbW9TM3ZXNWxkc2dCeEx2Y2VQamdWWHU5dElMVjFjV0ZxMURrbDczWEcw?=
 =?utf-8?B?ZnlPTW5FZUgzTEp4Z1hNWDdoSkhHdC8reVF5a0VyMTVPYjZIcU05eXFoKzFF?=
 =?utf-8?B?VmtKVHJDclRMd3hIVFY0TFBvd0NpQUpiOHVOU0FrWklsQ2hJZjlOaFZuZzFM?=
 =?utf-8?B?bXkySURRQzVxSnhKZVJKS0twVjUyc1NwYkkxWFYycDA0UmRKNDR1RUVtRjdR?=
 =?utf-8?B?NHBpYkMwYk5aVmRKbi8zUWdJZWQ2R09VRVRybm03MnhtSDJldmxxaUREMlg0?=
 =?utf-8?B?VVBuNWFGMkhjY2tuS1dGcjhPbmNLV2tZTDZoRjE0Wkh6SVBmcEkyZW9BakpB?=
 =?utf-8?B?VEdzUEFNbjZMK2lEZGtuMHp4M3JvY2J2c1gzT29GQTlwWktPRmttSmpDL0xW?=
 =?utf-8?B?V01vVGRNRk56czZYc295VVdwTy9Ec2pBenkwbHllVk15bHJ0VWltOURIZ3pJ?=
 =?utf-8?B?dk85L3FvSjh4SkVtQzU1K0NXbjB5WVZKNEwrdURmZ3h3alNJZ3JrbmlSNlU4?=
 =?utf-8?B?SXBmQjllUnhOWnFvK3JORndldmNyU3g4TDc3T0pBaFl2R0VoTFkzR2Q0MVJk?=
 =?utf-8?B?eGo0TmUwUGJDYkVBUEYvd1BkSHFkVU9GbC9Kb3AxLzlvOTFoTmtwVWd0c2M0?=
 =?utf-8?B?QW5TcHNNOE9XUTBLQmVRWXplaGFPNXpMVWdZbG8ra2VWV3dSS3piKzdOOGtr?=
 =?utf-8?B?bTZIYVk3RUdxTXp4OVg2dkUzeU5EN1pKc2dnWTNPY1B2QXRidjg1V1N3Z25D?=
 =?utf-8?B?M2tSNWc5T0V3b1BJZnMzaDgwcVRuYSswTUU4Q1VPa2ZqZ1JqQzVuZ0l5WjRW?=
 =?utf-8?B?UllaZnVwZE5kMEhuOUFscHMxR21IRWM0WHlRcWVtNkdaWnZIbVRZckpab2Z6?=
 =?utf-8?B?a2Fwb1ZsQ0xwMVJxbEdDVnJHM1E4cU5ZWXNtYjhmeDE1Yml3anlHS2RsQklF?=
 =?utf-8?B?WTZmWjlBZ2YyN0JVR0pocFBCcFg5Nzk2cEhxdDF6UytzWUJJQmhFbnQ4OUhW?=
 =?utf-8?B?YndSa3NxMSttc0xVL1VEODJoOEpUb29wOUJsaXlUVDRDWTlvaHlQL0x1dmpN?=
 =?utf-8?B?QlRVZW5NMEZVRVZIV1RzbWRYRURnRGtXaHAweDBMM1NINEV3U21hanh2N1Zk?=
 =?utf-8?B?SGZwd1p3anlVc01IUGIyRWtGTVZUVDExWTBmY0h1a280b2F0bzJaRmJHaUFa?=
 =?utf-8?B?TDE2SGlQMkRna1pFZ0FqeE9qYmJKODY4QnRlbWNVNVRSdVpwTnA5R0JNWW5T?=
 =?utf-8?B?V1N0RnRjZk9WZXo3WktuSHQzRWxuK0FuVmoxTG5IRW5wSXlJaEVsVk90TGdL?=
 =?utf-8?B?UEJWWkoyM1I2aENNdHE0VlJpRlRwajNGMFZ3ZnY4NzdSU3hmVnpjRnNmTFND?=
 =?utf-8?B?YWp3UFZXdS8xUGtrTTRGZVFENE9IRlVUNm82NURxaWw0L0FHMTRqNlB5SnZr?=
 =?utf-8?B?aHJwTUZnZllJVlJ5RjRWLzIvUFNFNVh5QzhMM1Z2c2doVkZDM2xtMzdYc2Z1?=
 =?utf-8?Q?9SVU9JORntbjs2bscRc45d9Qs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53d5483f-e66b-4fc0-5dee-08db1077cfb1
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 23:44:57.6748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9p9LExHGh9kKJ8ONZC6GBz1d6U3pG+Hw8xHVivJ36Y6gkWeztCL8NA3VM2KN0SIALCPKTag9HkjmiV4c4inKSQ==
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
> Implement the per-device calls to enable or disable HW debug mode for
> GFX9 prior to GFX9.4.1.
>
> GFX9.4.1 and onward will require their own enable/disable sequence as
> follow on patches.
>
> When hardware debug mode setting is requested, waves will inherit
> these settings in the Shader Processor Input's (SPI) Sequencer Global
> Block (SQG). This means that the KGD must drain all waves from the SPI
> into SQG (approximately 96 SPI clock cycles) prior to debug mode setting
> to ensure that the order of operations that the debugger expects with
> regards to debug mode setting transaction requests and wave inheritence
> of that mode is upheld.
>
> Also ensure that exception overrides are reset to their original state
> prior to debug enable or disable.
>
> v2: remove unnecessary static srbm lock renaming.
> add comments to explain ignored arguments for debug trap enable and
> disable.
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
> ---
> .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c | 93 +++++++++++++++++++
> .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h | 9 ++
> drivers/gpu/drm/amd/amdkfd/kfd_debug.h | 3 +
> 3 files changed, 105 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c 
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> index e92b93557c13..94a9fd9bd984 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> @@ -646,6 +646,97 @@ int kgd_gfx_v9_wave_control_execute(struct 
> amdgpu_device *adev,
> return 0;
> }
> +/*
> + * GFX9 helper for wave launch stall requirements on debug trap setting.
> + *
> + * vmid:
> + * Target VMID to stall/unstall.
> + *
> + * stall:
> + * 0-unstall wave launch (enable), 1-stall wave launch (disable).
> + * After wavefront launch has been stalled, allocated waves must 
> drain from
> + * SPI in order for debug trap settings to take effect on those waves.
> + * This is roughly a ~96 clock cycle wait on SPI where a read on
> + * SPI_GDBG_WAVE_CNTL translates to ~32 clock cycles.
> + * KGD_GFX_V9_WAVE_LAUNCH_SPI_DRAIN_LATENCY indicates the number of 
> reads required.
> + *
> + * NOTE: We can afford to clear the entire STALL_VMID field on unstall
> + * because GFX9.4.1 cannot support multi-process debugging due to trap
> + * configuration and masking being limited to global scope. Always assume
> + * single process conditions.
> +
> + */
> +#define KGD_GFX_V9_WAVE_LAUNCH_SPI_DRAIN_LATENCY 3
> +void kgd_gfx_v9_set_wave_launch_stall(struct amdgpu_device *adev,
> + uint32_t vmid,
> + bool stall)
> +{
> + int i;
> + uint32_t data = RREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL));
> +
> + if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 1))
> + data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL, STALL_VMID,
> + stall ? 1 << vmid : 0);
> + else
> + data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL, STALL_RA,
> + stall ? 1 : 0);
> +
> + WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL), data);
> +
> + if (!stall)
> + return;
> +
> + for (i = 0; i < KGD_GFX_V9_WAVE_LAUNCH_SPI_DRAIN_LATENCY; i++)
> + RREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL));
> +}
> +
> +/**

This was flagged by the kernel test robot. Should just be /* because 
it's not a formal doc comment.


> + * restore_dbg_reisters is ignored here but is a general interface 
> requirement

Typo: reisters -> registers


> + * for devices that support GFXOFF and where the RLC save/restore list
> + * does not support hw registers for debugging i.e. the driver has to 
> manually
> + * initialize the debug mode registers after it has disabled GFX off 
> during the
> + * debug session.
> + */
> +uint32_t kgd_gfx_v9_enable_debug_trap(struct amdgpu_device *adev,
> + bool restore_dbg_registers,
> + uint32_t vmid)
> +{
> + mutex_lock(&adev->grbm_idx_mutex);
> +
> + kgd_gfx_v9_set_wave_launch_stall(adev, vmid, true);
> +
> + WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), 0);
> +
> + kgd_gfx_v9_set_wave_launch_stall(adev, vmid, false);
> +
> + mutex_unlock(&adev->grbm_idx_mutex);
> +
> + return 0;
> +}
> +
> +/**

Same as above. With those fixed, the patch is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> + * keep_trap_enabled is ignored here but is a general interface 
> requirement
> + * for devices that support multi-process debugging where the performance
> + * overhead from trap temporary setup needs to be bypassed when the debug
> + * session has ended.
> + */
> +uint32_t kgd_gfx_v9_disable_debug_trap(struct amdgpu_device *adev,
> + bool keep_trap_enabled,
> + uint32_t vmid)
> +{
> + mutex_lock(&adev->grbm_idx_mutex);
> +
> + kgd_gfx_v9_set_wave_launch_stall(adev, vmid, true);
> +
> + WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), 0);
> +
> + kgd_gfx_v9_set_wave_launch_stall(adev, vmid, false);
> +
> + mutex_unlock(&adev->grbm_idx_mutex);
> +
> + return 0;
> +}
> +
> void kgd_gfx_v9_set_vm_context_page_table_base(struct amdgpu_device *adev,
> uint32_t vmid, uint64_t page_table_base)
> {
> @@ -871,6 +962,8 @@ const struct kfd2kgd_calls gfx_v9_kfd2kgd = {
> .get_atc_vmid_pasid_mapping_info =
> kgd_gfx_v9_get_atc_vmid_pasid_mapping_info,
> .set_vm_context_page_table_base = 
> kgd_gfx_v9_set_vm_context_page_table_base,
> + .enable_debug_trap = kgd_gfx_v9_enable_debug_trap,
> + .disable_debug_trap = kgd_gfx_v9_disable_debug_trap,
> .get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
> .program_trap_handler_settings = kgd_gfx_v9_program_trap_handler_settings,
> };
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h 
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
> index c7ed3bc9053c..d39256162616 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
> @@ -58,3 +58,12 @@ void kgd_gfx_v9_get_cu_occupancy(struct 
> amdgpu_device *adev, int pasid,
> int *pasid_wave_cnt, int *max_waves_per_cu);
> void kgd_gfx_v9_program_trap_handler_settings(struct amdgpu_device *adev,
> uint32_t vmid, uint64_t tba_addr, uint64_t tma_addr);
> +void kgd_gfx_v9_set_wave_launch_stall(struct amdgpu_device *adev,
> + uint32_t vmid,
> + bool stall);
> +uint32_t kgd_gfx_v9_enable_debug_trap(struct amdgpu_device *adev,
> + bool restore_dbg_registers,
> + uint32_t vmid);
> +uint32_t kgd_gfx_v9_disable_debug_trap(struct amdgpu_device *adev,
> + bool keep_trap_enabled,
> + uint32_t vmid);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h 
> b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> index b2217eb1399c..8aa7a3ad4e97 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> @@ -25,6 +25,9 @@
> #include "kfd_priv.h"
> +void kgd_gfx_v9_set_wave_launch_stall(struct amdgpu_device *adev,
> + uint32_t vmid,
> + bool stall);
> int kfd_dbg_trap_disable(struct kfd_process *target);
> int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
> void __user *runtime_info,
