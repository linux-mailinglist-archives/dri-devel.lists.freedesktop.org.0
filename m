Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D244C4FB298
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 06:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B022F10EB79;
	Mon, 11 Apr 2022 04:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2049.outbound.protection.outlook.com [40.107.243.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9842710EB75;
 Mon, 11 Apr 2022 04:15:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zx8QQ4UPQzauQnKb4z4MZ45M3kjmvegAcMRWq/Iqh+8ksPFPNbH4+un2PDU7sgiztWdyp/ul8Imv2U9f307czq6X6NAU9okbt8oOgDlTmxp+3Y7tia0LWekuabtmeruDpa30s0Cv524+QfUzpVF8M8BJGfLuFHJAggjB0LO+Crf2nYWedHEqpFv2IaLLROdIhcwwfyCJBTYeHVKVPb/ehyb2aMWk3AmwVaf9+YbVTSTTIiHsqDi/1hflV+s3eacrD6kOaUgrkGZSyjmwS1h2CMimDkwa11KuXf5qeq6zpbzIx7lru5DPM2jlbFogj+UIKVfEytcf9T94j5+0jtJnyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+giO4gRMLJEB4Wj14v/VEzhOukDu0NCycZQwNLHcL2Y=;
 b=c76a3tRPRw9fmykAJpoG5C6j7RgcELqyduFXtK2cJJ9HdsWA/Ly1KyV0h5tOuiLbWcSvYwhhHqvYjSFnLN3HNkKo0Hlf3fYdblTS/lnkaNEMUtFOYu1vw/IVb0vrJNOA+q9DaMPWALVzo4ZP5owsF1cTAL3XGE/k23uc79cZtqsP02wKKnkBQn9ljQOLMr06Vb7QLZccGNcqpiP45/yCeeuojaeA/ugnWrEt+DdDaPc1Ft+7AFcl5cxDOR+IF1PiWhfoo4CYf4Xo5CFA5ugHwfDU7qDM4fW00WTiQ3IOjLr2EA9wCTHFEB2EMGZJhPyn0YsNnTpimA+MI24xOJMlng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+giO4gRMLJEB4Wj14v/VEzhOukDu0NCycZQwNLHcL2Y=;
 b=0O0uhAI4DNWOB2W3dy7Gs7979CyfMce67IZnEU9i6SiD/qV8hSm04W3icz46wcN2DbylTJv3rkju/4kpuSP2rpMX+uB4kfSzMh7wvvGFijXfxJ6/tRnpQdIgWroLygr3AMSvBNURghuXjFloxJns0H5bOCfxXteLuIq+YGBLytc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by MN0PR12MB5811.namprd12.prod.outlook.com (2603:10b6:208:377::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Mon, 11 Apr
 2022 04:15:32 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::f110:5c81:79d0:a302]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::f110:5c81:79d0:a302%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 04:15:32 +0000
Message-ID: <2c1e5bf0-6952-12c3-6e6f-62cb44fe1490@amd.com>
Date: Mon, 11 Apr 2022 09:45:15 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCHv2] drm/amdgpu: disable ASPM on Intel AlderLake based
 systems
Content-Language: en-US
To: Richard Gong <richard.gong@amd.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, xinhui.pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
References: <20220408190502.4103670-1-richard.gong@amd.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20220408190502.4103670-1-richard.gong@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0125.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::10) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35dad2c4-66b2-4642-3d5e-08da1b71eb32
X-MS-TrafficTypeDiagnostic: MN0PR12MB5811:EE_
X-Microsoft-Antispam-PRVS: <MN0PR12MB581179156EDE1BB2CBD5931F97EA9@MN0PR12MB5811.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BFmqqslGVmaJj/IihHt78sfB+Ja59DjPUZx/w94fU7KKo2OZjqQ2CoR5I2qauNFv1uPyq4L0WBTCzcuUUeVLO4KLbPG2OZJT2v9jcRS6ougewK7qQ7k6C3cNtpyay1EbGyM57aySBp+AVjDsjVZ1++RA05Xs79QOHQBoqvRJWkDAJCcSveyHMSZwcdpsOTQaYNO42W/y5gvmxeJdYDzsYkrtXOWOay3M6RGNFRp0dnNNvFAIKV4MfN21s7wIZK568ibhqNi8J3oCvwhVVmdUDY0SFPT7ZQ8Tkx9LFMr3X2epT6hSSGXepHIm6UjneTpTvelFz4EkPautfgTPKCRHrXlMwBz2XkdVh4itJJ18H0nYCdx56KlSdGKKMuxq55QfDyGEjXCm+hYgPJVesy81hJphQCqIBJ40evAKQWgMP4I5jP3yfgJDFUDVkgeJKhBHzxlqSuJLiUgz44Jj3osUsBHcecuOsJy+1uj8mpMaoNS4kUYHx2+zlvOkZXgS55RhCuRTDm6q3F7be58qBad4HjH5/BLxB91Erq509lweGTv0DVC9ZY6za/SnqCHAhhI7v/wsajAntMizyYSSHUDB4EP34gTMSEdG0QfQ0pcvAIWe6mAicfnoWqIvDpVCF5bXL6ofwDGVbQTO4i3NG1ZayiX9Jn/tyCWWmEga3ircGxTS0f4dtOUxpN/XoEMBk5Mh9CXRdauZkFqD+L001sMKlRz0YkKFGgtT/hxPEs2ypTk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31686004)(2616005)(38100700002)(966005)(5660300002)(66476007)(4326008)(6486002)(86362001)(8676002)(66556008)(6512007)(36756003)(31696002)(2906002)(66946007)(508600001)(83380400001)(26005)(6506007)(186003)(316002)(8936002)(53546011)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0RhczIxMnc4alFZbTVoTlR3REZjVmFmYlpsYlJrV0QvZEdTdk9mUEMyakIz?=
 =?utf-8?B?QnZCdy9zdHZqWS8rWXNMQ3EwVkJpSWhBN0JLelpUL3FHdGxsaDU4QjhPb1I4?=
 =?utf-8?B?RHJBTWtUWUpZb2hnbUFBWS9aZFNoemVvOHB0UGJwOXVpYXhETHNNV1hKajha?=
 =?utf-8?B?Nnc0N3BYWlg1NzFraFhsZlhReWViRGc2a2FwMjdVYVFvWmw5elZrd21UQk9a?=
 =?utf-8?B?cWJwa1JUN0pmQm5SaTZRQWhoYmJmSG4rbHM4MTdaUlhiU1l0dTBmTFd6Qmdk?=
 =?utf-8?B?T1M5WjVDYUdQRWw1Y0tNNHdYZEtxbktXY0tTUUdpcTNpSFdFZGdtTE0vOE5Z?=
 =?utf-8?B?bkZENkgyZkpNbmthV2d6YU5ueUZMK1lLeXZYUkRuQnN0NG9mczFRaE9XTnp1?=
 =?utf-8?B?NmpoWGJxQkNVRitBakxpb1p0VDNLeENSQm80Z3dua3VZUnVaZWt3ZDV6NlJv?=
 =?utf-8?B?THFOMXVQbHJ0SzFxaXdxOUNhdlVPdU5TYjdpSS9pNWJwN013R2FFRncybFps?=
 =?utf-8?B?K2M5dVlUb01yZjFRekgzVCtvdG9EN1c4U21BNE91SUgrZEJIUE8vOUdRWDBS?=
 =?utf-8?B?L2FsMFMxYmU1cGVzeWtlc0QzcGduWGV3ZzcwQkYzWE12S0ZGeXMwb1h1am55?=
 =?utf-8?B?WWNMbTFkRjJXd2RqejJta3dJQW44RU1GeEZLa3B6OVBuRUR0b3J0Nkt4Snps?=
 =?utf-8?B?dUpWSElyd3EweG9tL0xId1BkRDF1OXhjdUpXRVlHeGY3dG8wTE9KQzdhQ3Qx?=
 =?utf-8?B?WDNDTUJtY3kxdXcwV09lSjFVQmNRaWlYb25PcmVUTjJHUVdJcjRlUDVwckN0?=
 =?utf-8?B?Rjd3Q2xHK2xwditiRzZDWUlPTFZyL0FsWUJncGxOWTdNQXVxcDJEYU43KzZT?=
 =?utf-8?B?NTdhVnZkZ2lnR2V0RlRFZldBVVY3K0RPWkxmU3FmMmV1ekZJc2tRUnFmbkUz?=
 =?utf-8?B?UjJSK0FyOVFHeklkNXNRQ2dKTmdFWE5LY2lKYy8reUttUEN4djNSVmlPQ09n?=
 =?utf-8?B?SjQzZzBNV0ltVCs3VHdoM1FjNGZpUEx5NUdRYWx1WUpYSFU0dGNNUWNzQncr?=
 =?utf-8?B?eGJqYjFpY1kvWVVDMmVXY0pwdlAyVklyRXlZd3BydzZLcEJIZDZsVVRXT2RN?=
 =?utf-8?B?dXdQZW8vUWJ0VlJuQTVnVTFXZnMzcFA5Rk0rT2N5VDN6ZHNHbWNFdndqb21D?=
 =?utf-8?B?bzRXQVZ6Vk9ZbVhwUVFwN1g3L1k5RzhEN1UyeU15ayt1UHhJa1JmR1JWVCt5?=
 =?utf-8?B?TFVmYlYzdTRObW9EamlmRldBbURvQzl1NTcwWkFuQnRLUHFuOG4rWVhyWmVT?=
 =?utf-8?B?UlhpTk4zTTB1dHh1MkVWWlRsclFPeklVRFU4VkJNOTdlemVMMWRVb3VyMEdq?=
 =?utf-8?B?YVVNaTIzQU93UjB2aU5nM2NTMUU1L0tuOXp5ZEZ3d1RDbDlRSnBTazdlZlY2?=
 =?utf-8?B?eU5FSmFoRnppeEdMdkRseDllQy9MMGcyMk9walJhbnJ6TUdWV1g1RU13V0R4?=
 =?utf-8?B?RjVDc3BZcVZZUzRGZXRHOVNpbUF3YWNlOGJnUVQwUnpXQ1d2U2g0Y3JrLzE3?=
 =?utf-8?B?UHhDMmR5RkVUN2s1SUpBdFJCbmNFVkpSZGFnbmR5b1FyOVRETUFObTY5WUNn?=
 =?utf-8?B?MW10SHEwcXZWa0NpTG9YR3YwWjZzSy9waWk3VVhhczFFOXhEN3o0cWxGSFNZ?=
 =?utf-8?B?amxFZ0c2WDJjN3BPMGJWblRRaW92bUU0VnVxTmxCMC9LNEc4cEVBVGJsdFlV?=
 =?utf-8?B?ODNzOW9pWHhKMVlQRzZRZnVsUjhmWVZWV05INmZ2ajdlM0w1Z3VETWZqN0t3?=
 =?utf-8?B?WldWcmg2SnB5VHN1MVQ0bFhWaHJzVEI2OVY2SlFaWjRtS294czg4UnRIMWtw?=
 =?utf-8?B?T3dmZ2JVY0tDd2c2UHByallVdmw2b3J4RFNOZHc4R3dkck9KdHNLTE9Fbloy?=
 =?utf-8?B?TXZNby9Xbk1iYTFaeS9BK3o4QTA3V3hHL3hTVUg5aWlrbXdWemQwK0IvUFhK?=
 =?utf-8?B?Qmh5b3V0d2FkODVpVDJtRTlGWWltWUh1eVd3L2RJWVhmMll3ZkVKV2t4WENk?=
 =?utf-8?B?UE03ME5HK1QzUHZzelNvaWMvOGhtTmhTVG1veDYyMzlMOGVTN29ORXNRS09s?=
 =?utf-8?B?Qy9wRGFjZVA0aWV4VFlxWUFNcHVpa0E2NXpPNEFsOHVpVzVTN0pLazVhc0Ur?=
 =?utf-8?B?R3ZlSWk3d1J4SWFQdk9Celo4WG9LU01Eb1FEdFVyN3pHalNESG5qQXd5eUxI?=
 =?utf-8?B?eFI3ajJINVBjZGVVcU1YMjdYMkVTb0FSZGZGTXZKWEY2alpTWGRTMEZaRkdU?=
 =?utf-8?B?WE9xc0szVU1DTVl3UVJDR29nZFdqR2pJcjBCNnNYWWVzUWJxZWlUZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35dad2c4-66b2-4642-3d5e-08da1b71eb32
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 04:15:32.0976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x9o+DCehmGl9b6oktlmpXxOS0qhmeTAtbQjexqX05Pdqy1FsnhhbiiGni9fE6Tgl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5811
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
Cc: amd-gfx@lists.freedesktop.org, mario.limonciello@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/9/2022 12:35 AM, Richard Gong wrote:
> Active State Power Management (ASPM) feature is enabled since kernel 5.14.
> There are some AMD GFX cards (such as WX3200 and RX640) that cannot be
> used with Intel AlderLake based systems to enable ASPM. Using these GFX
> cards as video/display output, Intel Alder Lake based systems will hang
> during suspend/resume.
> 
> Add extra check to disable ASPM on Intel AlderLake based systems.
> 
> Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1885
> Signed-off-by: Richard Gong <richard.gong@amd.com>
> ---
> v2: correct commit description
>      move the check from chip family to problematic platform
> ---
>   drivers/gpu/drm/amd/amdgpu/vi.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/vi.c
> index 039b90cdc3bc..8b4eaf54b23e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
> @@ -81,6 +81,10 @@
>   #include "mxgpu_vi.h"
>   #include "amdgpu_dm.h"
>   
> +#if IS_ENABLED(CONFIG_X86_64)
> +#include <asm/intel-family.h>
> +#endif
> +
>   #define ixPCIE_LC_L1_PM_SUBSTATE	0x100100C6
>   #define PCIE_LC_L1_PM_SUBSTATE__LC_L1_SUBSTATES_OVERRIDE_EN_MASK	0x00000001L
>   #define PCIE_LC_L1_PM_SUBSTATE__LC_PCI_PM_L1_2_OVERRIDE_MASK	0x00000002L
> @@ -1134,13 +1138,24 @@ static void vi_enable_aspm(struct amdgpu_device *adev)
>   		WREG32_PCIE(ixPCIE_LC_CNTL, data);
>   }
>   
> +static bool intel_core_apsm_chk(void)

If this is only for Dell systems, use DMI_SYS_VENDOR/DMI_PRODUCT_NAME to 
identify the platform information from SMBIOS.

Better to rename to aspm_support_quirk_check() or similar, and return 
false on is_alderlake() or is_dell_xyz();

Thanks,
Lijo

> +{
> +#if IS_ENABLED(CONFIG_X86_64)
> +	struct cpuinfo_x86 *c = &cpu_data(0);
> +
> +	return (c->x86 == 6 && c->x86_model == INTEL_FAM6_ALDERLAKE);
> +#else
> +	return false;
> +#endif
> +}
> +
>   static void vi_program_aspm(struct amdgpu_device *adev)
>   {
>   	u32 data, data1, orig;
>   	bool bL1SS = false;
>   	bool bClkReqSupport = true;
>   
> -	if (!amdgpu_device_should_use_aspm(adev))
> +	if (!amdgpu_device_should_use_aspm(adev) || intel_core_apsm_chk())
>   		return;
>   
>   	if (adev->flags & AMD_IS_APU ||
> 
