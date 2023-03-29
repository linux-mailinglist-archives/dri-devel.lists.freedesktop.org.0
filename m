Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEC66CDA20
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 15:08:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2833010EAA9;
	Wed, 29 Mar 2023 13:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DED910EAA8;
 Wed, 29 Mar 2023 13:08:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=konBTwgVv+8UeEbnlvz6dN4cqGoETfmpPhLWJbGozLvjcdmRqkBdksNaRIWp1w0ZItPF8dfMNNnaDqgM1M4oJxiakuUPeENdJcmWBo2xsuncshXrF1MvIifRU4HEE0Bscpba4cjsJScWqeAVKzVLnl9+wzOM8FHDDPRTgcU7ScPWrSuI4wgAg2G8sW6aClZKrZ2P8E7zV3Ym5fL4WAugpKaJXLlXaynDiXIG532Wg8j0lKPtleTqIXxqOzAJ1zcgH+127OH8Z1CoAf5FyCMn2wk+o2VC9GixsC+jj0JuS2YhEwlk2XHaQbFfloQ4anSsg0nBZP/OC/3y352sbnuQBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rIS7pUQMEuaHDUp+59x9rFY7+HJtBfyM+FJAuWxMPlg=;
 b=aUy7W6gVpvcbLGaCUOpSWSZCF8rN3M8eOFSvNVi9wiMM6TX8xvrY6KjVUVgzVVsDXKS/G7CnTqlXV8ssrTJQGP1/8CRlet9da/bYs+eMgMrS9hleUGr9tNLZ2xvjWP/GAk24HOIcRAbnPPHBT3Q+ttOBu8lV/lRQ9dMvnnnqVBSqEraY8VMsFHCABeuL7RczKmZO2lyXUxcMBM0/OQ5we+J2BFFqG1g+7L2wJJ224C4KSt4RQO+YWjxOU0Mx9zN7t94aYH39jbp/83dy2r9y+FdJKystzwFWWT3QKuub/fXkl+E4gLYzBisXY55c65bqgwe7is2zFVeGoXCQchhKWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIS7pUQMEuaHDUp+59x9rFY7+HJtBfyM+FJAuWxMPlg=;
 b=rN6yNA+WxUmWUDlcpYqrEXlsNxbpVn4XbTVZ1KDqK2W8O3oxuQPm86YogNXhO6YIRM/TyePmLB665j1HlOZ+pK7nC2VrbR66Q6aPQoDmESK4Kzn/NX8GgQ8nHIivshaqqo3lP45qOFCcF+Pz9nYOR0NJhyzO69lzYh5gGPVEk94=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6253.namprd12.prod.outlook.com (2603:10b6:8:a6::12) by
 IA0PR12MB8328.namprd12.prod.outlook.com (2603:10b6:208:3dd::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.33; Wed, 29 Mar 2023 13:08:44 +0000
Received: from DM4PR12MB6253.namprd12.prod.outlook.com
 ([fe80::1e94:d88f:5829:627f]) by DM4PR12MB6253.namprd12.prod.outlook.com
 ([fe80::1e94:d88f:5829:627f%6]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 13:08:43 +0000
Message-ID: <9c8d928d-f322-e9aa-c811-28682ca70f04@amd.com>
Date: Wed, 29 Mar 2023 08:08:40 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH 2/2] drm/amdgpu: Remove ASPM workaround on VI and NV
Content-Language: en-US
To: Kai-Heng Feng <kai.heng.feng@canonical.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com
References: <20230329095933.1203559-1-kai.heng.feng@canonical.com>
 <20230329095933.1203559-2-kai.heng.feng@canonical.com>
From: "Gong, Richard" <richard.gong@amd.com>
In-Reply-To: <20230329095933.1203559-2-kai.heng.feng@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0328.namprd03.prod.outlook.com
 (2603:10b6:610:118::14) To DM4PR12MB6253.namprd12.prod.outlook.com
 (2603:10b6:8:a6::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6253:EE_|IA0PR12MB8328:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c6e1013-ee34-44c7-23a2-08db3056b925
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v3e8AA2e2lwVfFKcz1m9ahq4V20E4tF194M63l5t59qn809Ep7PrXsVau8BrpIIJc6JiqgbZkGDx2L69AlFXKCafQHBeUr6rjMDmbHHvya9ZTgZlOUNI3gpDmAlk7+WvBN8A2KbxrSg+4mipp9NWp4mNYlE/GRAqMz0QnbdjgCibRJs3Bux6xQAZXs2o34m8MfJsnoOa4hZ9s9v87r/KR/Jm1UR49Bt8Z8Zaw9Q5biPBTIG/JJDMbjWugmJGb+pIFCt898cDnq5m15Z86oO4YvzvFEp8nU6Ht+RGNASBI1FkjnzmEG8dqZ0NJIYxWv+128yt8EyO/K2lAC46KWvgmUqlq6mzTa/XRtvJpaPHCkGA1vImc2A3y3qqTyEpNY8c8oK9tWwyhNgSyixxYL1u1MxTBs23zVIsKuMXAvGyiP2zYwG/ZtwC01v8t/6QAa/R5pOIKeXHHVm45IjrcWG3gIIROB67ZjB5lRLWQi/LCqCswMh2SBoRDLC2xNKtGS/pmDHryK2/NHnJyfoDz3B3W8Am5voJbiQ6c3/h7sXzKoqsvbudrpNRNrmILSgTfYHpye8/sR7qlEl1wxwVNNpBe5dCyWlz6aVgrnawp9IwwazvajyzVENA8JBUmJTURt1PPld0qtrF8lvcgGx/vk5+Aw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6253.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(451199021)(478600001)(83380400001)(2906002)(38100700002)(31686004)(6486002)(2616005)(8936002)(5660300002)(54906003)(6636002)(31696002)(316002)(6506007)(6512007)(86362001)(186003)(53546011)(41300700001)(66946007)(66556008)(4326008)(8676002)(66476007)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1JKNVhWZWo5ZWJwKzR5MkpaNG5RTWdhaUtZcjBoU09iVjUzT1FXN0FIc1hW?=
 =?utf-8?B?Mnd3YnlkR3hrTml6VzFDU3pGVnNTOTBtVXBEbURSbkhKK2E1dFk4TGVrSHBQ?=
 =?utf-8?B?WEVtSWM0cmw3ZkJvU2tHOGJrZkdYTDBKU3V5TERmcGc2cCtFb2ZXeWREc3NV?=
 =?utf-8?B?dXYycE45eDl2MzlLUmRyS3hUZlZLcHBxRkNsa08xRUZUWFQvSE9GdDFsZGFY?=
 =?utf-8?B?OG5MeVhaL3h3Vy9HVGpML1BadEljYzdDRUpUTGhMc05oazdzdzVmOC9FUUtx?=
 =?utf-8?B?TkFFeGgzQjBtYVhsRTMyd1lQY2pCZ1JZc1VhWldHOGF3ZjVFZ1MvdDRQcGdi?=
 =?utf-8?B?WnFyTHRWSFAyRUFzam16ZVJqTERaVS9jdFR2VFFPTHdwcVR4aDRkRzJWNStY?=
 =?utf-8?B?RU5FZHlva3Jlb0RnVVpVZ0dmUzlqcFR2a2E1QW82VEMzRXBrNWt4Unl6RndH?=
 =?utf-8?B?WlFiQk9nNW1PVW5ZRG1RSVpZbzFqTG9ESjUxY3A3ZlEwVVlKMGlNTzgyRXM4?=
 =?utf-8?B?YUxrZktzZWdNWUc5QkY2ajNCMjZMOXRYVndmdzl5dmxCbmtUWUFuUSsrMHM0?=
 =?utf-8?B?M1IxV3p2UmxZVG94RUZDZEZ3MmU4VElYdC9BdU1FM2p0ajFaZUdtQ05URE56?=
 =?utf-8?B?VnhYQ3MvZTVLL2pUbHpUUkszcW8ycGRhdnFsd2JBVGxpUGlqUmc2dVBUZ0Yy?=
 =?utf-8?B?bzliYTQ5RXA0NzlYRWI2cEpoYTN1OTVxc29BcDlFZXJOZmZrMEpwY1o1TS83?=
 =?utf-8?B?ZDhmaURWcnVHNXdleUxpcUtjNkdJSEorNzNDOHpGQ2pMTjZaSDNPRGphZG5F?=
 =?utf-8?B?bjNzRXhRRDltQzgwNFpUNGhXNXExNmtjdkoySkdIdThFYkNHcWxQTHZVZ0Zq?=
 =?utf-8?B?KzdHdkd2M2JVdlNXd1NUS2hOQkFSTDFGQlZUZGxPbVhtNExSb0gwMGUvRDR4?=
 =?utf-8?B?YUhYdlF5bkdPZXhoeGVSaUxaV3YwQWpZTTBBejJ5RG1USWdMTDd2NDFXc0Zs?=
 =?utf-8?B?Rm1PNWFZRDNNMFByVHZJSTFuUDRodkRkTnQvV1FBV3RqVEZVVmZFUGhRcU9n?=
 =?utf-8?B?dFFQUGd3ODB6Qnd1UC92SU9LTm5GbXJtS0E5d2ttTU4rU3FuZVVnbHl6ak5h?=
 =?utf-8?B?MlpzNWZzNExaSjVwUW4xNjkvMkdJMUM4VnlEbWR2dU41alN3aGY1ZWxqdFkv?=
 =?utf-8?B?T250M2xxRUp4b3A4bW9TVjMvUk1waVc3WEN6TDRHR1k2UHRtN3MvWUdXazN6?=
 =?utf-8?B?dGs4YmEwOVJES0dRSzlLSnMya1hSc3FqdFJlRkg3RVFCdWhoVnZFR29odE1O?=
 =?utf-8?B?OXBDY0NnNXUzWGNzT0tzRzhiUkIweGZKUSsrUmJObUh3K1N4cDlIZ2tCVkhS?=
 =?utf-8?B?Q3YxUEJJRTBsV3JYSnRWT0VQaVA5bFpNb3pKT01TQ2JwZjdRY0hTaURIQzNy?=
 =?utf-8?B?TEcxUGZKK1I3T3BSNmJwc1U3T2dWZnBwR0krOXNFZ0FVSVk4SFpwVFBlV0FF?=
 =?utf-8?B?SS91eGlpWmxWUmY2czR3MHprSzZXcnJUNFJKQW44U1BjTkFmbXh3ZWtMMTJk?=
 =?utf-8?B?KzhlYjM1d0prVE52TDB5QjVpM3V2ZTNTWGRheEVlT0o5QVdIemVxNDdkL2JY?=
 =?utf-8?B?YllmaHFSQjNPRVloakNJUnRxRkRJd1VHWHM5Y1FVYUR4N2VyR1RwZFA0eHBo?=
 =?utf-8?B?eGJxdkVXeU9SbWxyU0dtNllGTW1yVkpraWhqSFpZekxGdVkvQk01OXZ5Rzg4?=
 =?utf-8?B?amJZb2d3aEg5UndyRXpvL3ZvMDJ1WUNKRkZDTnYwdW94Zzdjb0E5b1ZtNzRI?=
 =?utf-8?B?M21NK3ljc3FRczBuYjVDMlc5TndLNDZXdVdDZGd4N1VGZTdIYVFhU3JqQzRx?=
 =?utf-8?B?VXROeGtzMW05ZjJtNlEvQllydFhnZVRoUGVGbXRaa1VIb2w4ZmdJVUdOb1lK?=
 =?utf-8?B?akF0STVCd3hsNHN4R3g2MGxvVk5lMEVuaG5RbkpKNC9vWTlsWjd5Y2N2Wlhi?=
 =?utf-8?B?RFZUdm1UamhZKzJ2V2k2WEFXUDF3aEViSmFyQ3RhWXF5b094R2tSTHJDSmVJ?=
 =?utf-8?B?OVg4QjhVa0NJZWF2OWlDYmlNak5ndmVQRFZBTThKYy9FY0Z4cXBiN0k1aTFS?=
 =?utf-8?B?SCtOSHJVQU1jVzdDUDJnN2RHRllXU1NUaXJJaVJVWGN2Ulkrc1lHTThmM2VF?=
 =?utf-8?Q?BILT1T9cWo3ISf+yycVUqSS4a8kRjFcHo75BjFhTEqUD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c6e1013-ee34-44c7-23a2-08db3056b925
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6253.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 13:08:43.7315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eTpXnIX89y1HUL4wJy5XHwmIueHqUmutkaJ08QkOH7txVz/epPJsvchb/W0xJ/OQzvP+qkqOW75QgJiv0owVKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8328
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
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Jack Xiao <Jack.Xiao@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, Guchun Chen <guchun.chen@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Victor Zhao <Victor.Zhao@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Lijo Lazar <lijo.lazar@amd.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Veerabadhran Gopalakrishnan <veerabadhran.gopalakrishnan@amd.com>,
 Likun Gao <Likun.Gao@amd.com>, Evan Quan <evan.quan@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/29/2023 4:59 AM, Kai-Heng Feng wrote:
> Since the original issue is resolved by a new fix, the ASPM workaround
> can be dropped.
What is the new fix? Can you elaborate more or add the new fix commit here?
>
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  1 -
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 15 ---------------
>   drivers/gpu/drm/amd/amdgpu/nv.c            |  2 +-
>   drivers/gpu/drm/amd/amdgpu/vi.c            |  2 +-
>   4 files changed, 2 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 8cf2cc50b3de..a19a6489b117 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1248,7 +1248,6 @@ void amdgpu_device_pci_config_reset(struct amdgpu_device *adev);
>   int amdgpu_device_pci_reset(struct amdgpu_device *adev);
>   bool amdgpu_device_need_post(struct amdgpu_device *adev);
>   bool amdgpu_device_should_use_aspm(struct amdgpu_device *adev);
> -bool amdgpu_device_aspm_support_quirk(void);
>   
>   void amdgpu_cs_report_moved_bytes(struct amdgpu_device *adev, u64 num_bytes,
>   				  u64 num_vis_bytes);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index d56b7a2bafa6..0cacace2d6c2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -81,10 +81,6 @@
>   
>   #include <drm/drm_drv.h>
>   
> -#if IS_ENABLED(CONFIG_X86)
> -#include <asm/intel-family.h>
> -#endif
> -
>   MODULE_FIRMWARE("amdgpu/vega10_gpu_info.bin");
>   MODULE_FIRMWARE("amdgpu/vega12_gpu_info.bin");
>   MODULE_FIRMWARE("amdgpu/raven_gpu_info.bin");
> @@ -1377,17 +1373,6 @@ bool amdgpu_device_should_use_aspm(struct amdgpu_device *adev)
>   	return pcie_aspm_enabled(adev->pdev);
>   }
>   
> -bool amdgpu_device_aspm_support_quirk(void)
> -{
> -#if IS_ENABLED(CONFIG_X86)
> -	struct cpuinfo_x86 *c = &cpu_data(0);
> -
> -	return !(c->x86 == 6 && c->x86_model == INTEL_FAM6_ALDERLAKE);
> -#else
> -	return true;
> -#endif
> -}
> -
>   /* if we get transitioned to only one device, take VGA back */
>   /**
>    * amdgpu_device_vga_set_decode - enable/disable vga decode
> diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
> index 47420b403871..15f3c6745ea9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/nv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/nv.c
> @@ -522,7 +522,7 @@ static int nv_set_vce_clocks(struct amdgpu_device *adev, u32 evclk, u32 ecclk)
>   
>   static void nv_program_aspm(struct amdgpu_device *adev)
>   {
> -	if (!amdgpu_device_should_use_aspm(adev) || !amdgpu_device_aspm_support_quirk())
> +	if (!amdgpu_device_should_use_aspm(adev))
>   		return;
>   
>   	if (!(adev->flags & AMD_IS_APU) &&
> diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/vi.c
> index 531f173ade2d..81dcb1148a60 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
> @@ -1122,7 +1122,7 @@ static void vi_program_aspm(struct amdgpu_device *adev)
>   	bool bL1SS = false;
>   	bool bClkReqSupport = true;
>   
> -	if (!amdgpu_device_should_use_aspm(adev) || !amdgpu_device_aspm_support_quirk())
> +	if (!amdgpu_device_should_use_aspm(adev))
>   		return;
>   
>   	if (adev->flags & AMD_IS_APU ||
