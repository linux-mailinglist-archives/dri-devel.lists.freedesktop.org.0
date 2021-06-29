Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B873B7589
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 17:32:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F526E8B9;
	Tue, 29 Jun 2021 15:32:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8756E826;
 Tue, 29 Jun 2021 15:32:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E0zdxW0OKR9orAK9IH5LTB17O7miQP0UaL/V7yxzx8JpDRVif4uvZwyMjYvRp6RRMaqQEaoX+BDDZywfRs+EQ7F0PI73MFkmil9l8Jes6oEf8ChZhmYERjQSkIcTZh9w7L12O98fdlaj2lQUSwhtJwTlWrdWYUjvoIa3IMK8wZGefxo7zqvMfMjauTlSJTWVjnY/uYX0mLuxbkbeSQFVczldxXdD2+T2gdlyZh3P38Ws6rKwwnPRvvop/VVwDPpZ1GJRLKDsJ+YQU6Wr35Xqq5BhogRtLb/gBy5UWEwwSJXCuhgt002gujHFkQdd7P89vJRZIi+qZGOSczNzEDr25Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LK/aZ42Tpf0I3e+QQi12WBMMVFER9yC0EJ/ediP0Wkw=;
 b=GpB8diZEBlDb9LWAK0CYsrBnD0XC0qLl10CoNBbeqIIFCk0mzlz9K6dbbUW1FrfaOsN/SVd1T96K21i50+ahMMJ6U9fFLTVdwkT1E5ZV6GRyCsA7mrHR1w/Vwy25kBR/TT6oWcV2kLH12mhI2R58eWVaOeedtD+JfVzMyAyRlSqVKiGuH6wWObqa87AfwdoRENygV5Crp336FLBT+/q6i9bLGuwkvJohaB5u/LGEXGxi+S1qj0562seyqimSH8UtKRDG6aPJXfUf9qouyYvRiorNWz7cDjhisLCg0VFLOGXxF3hq73OpLAix57z1mDOJTOnv5S6i4zCzA/rnJc/VqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LK/aZ42Tpf0I3e+QQi12WBMMVFER9yC0EJ/ediP0Wkw=;
 b=Pb222Y1NxxIDCUUvMzmnmCYRhTd7ACGKcJKFRljEQT7G//DTsvhlF+5/qEoqKsECw7tNkkskAl64caNprycwd0q5r7CY0CxRByCHxu9MRhOFKLoEUSjyjOmC4koDmvcCkAVLzafrTGilVCUCiTV/wFLn8pr/a97SJN1OwGRQvZ4=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM4PR12MB5151.namprd12.prod.outlook.com (2603:10b6:5:392::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Tue, 29 Jun
 2021 15:32:11 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::901b:72bb:a15:2a68]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::901b:72bb:a15:2a68%4]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 15:32:11 +0000
Subject: Re: [PATCH] drm/aperture: Pass DRM driver structure instead of driver
 name
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@redhat.com
References: <20210629135833.22679-1-tzimmermann@suse.de>
From: "Das, Nirmoy" <nirmoy.das@amd.com>
Message-ID: <4bc73641-b980-58ae-3783-ee023f81389a@amd.com>
Date: Tue, 29 Jun 2021 17:32:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210629135833.22679-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2003:c5:8f27:5d00:9499:a270:2927:4d86]
X-ClientProxiedBy: PR3P189CA0040.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::15) To DM4PR12MB5136.namprd12.prod.outlook.com
 (2603:10b6:5:393::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2003:c5:8f27:5d00:9499:a270:2927:4d86]
 (2003:c5:8f27:5d00:9499:a270:2927:4d86) by
 PR3P189CA0040.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Tue, 29 Jun 2021 15:32:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c7d0a95-8e62-4447-1b8d-08d93b130ff1
X-MS-TrafficTypeDiagnostic: DM4PR12MB5151:
X-Microsoft-Antispam-PRVS: <DM4PR12MB5151A833B5BA645368C236328B029@DM4PR12MB5151.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pZM5VRwoc51CvjRyEwKRMAHsJPON9+zt6Kg0Hl96cOAfoXk86uwGsX20KYqnAg6OrNBRER8gv+32LM+Fu/1HGxMX6/y7NzUIjkGR9ilpZWIbVxVsIVzC9nfMxCMPzkJR/LVbUCOD6dXiSO+cbUPrTvHpffRRXY1t9lakZwhJPQilxwMrIJHRdYerQhou1lw28DwhafZuu2SLPAkRzmhtMZU6T+2mqkZOu20FdRkKIF/1cJU4Ml+Nfc7UTUd/rGgasABqk3/nNOILTjOyfzqPh5xMDp7zMqkLPQVvaZfTT2U/CF4Noxz+Emi3ebOZx08LA1dIF0B0VH5VTmZoLvJV9ctiruK42ilLr+X2opzTgwQzqvof52nShIIgom0iAfAa1uQGKXuu/HhFlSwqHPN2h2pJcHYgdhVNYQnb4CQ12GXOzgaRdUZsyVTRpo0/GXnElSaUE/Qa2lDtwIbfCUoyz0pC6mxhD7S7YedeSO9RByUqb4UdolnoeFNF4SHFzSkNoTh4C4j+HYkH+By0Vnrjt6APi434PKvrbZKV8/BQNKiWYgSY0LN2kWaNgJCk8718OTFIPYNAFJtiRo/VPVSRPkTi3JeiRVmc5HcVBOx2rTUMFi2PJvMYZDBgL8vLqXrFssz8pzgvhn7rX86dMpQtwun8EQtfiaLOJHqsiW8N/WjDTKQXFh9tl3thNrXv+ggnULCuLf4JveZ6PAF/Ehn5aESAij8S+5OM1GAb/mLocv3hNcjHOcBIsZ3ttx8VO3gi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(136003)(366004)(346002)(186003)(83380400001)(16526019)(8676002)(2616005)(30864003)(36756003)(38100700002)(7416002)(6486002)(8936002)(316002)(52116002)(31696002)(6666004)(86362001)(53546011)(66556008)(478600001)(5660300002)(66946007)(31686004)(4326008)(66476007)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTJlL1hSK1BpSWF1QW00cDMyM09LQ2p5VjUxbU9lOVBab3hiOWZjSWhHSFBP?=
 =?utf-8?B?RXhhTThnMWhpd250ZHBkeVhoWE5HM2NzNC91eDJzT0ZrSTVPUWdGR3gxOHJS?=
 =?utf-8?B?aFd5dS9pWURxN0kvWXM5S1RUMGlsQWxMOHBSM3g4eGozUWR1T2o0WDJyT0d6?=
 =?utf-8?B?YW00MFZadm1yeFBZeFBkZW8zeVhjQTlYamkwRWVDTjNJNXRCbUNSWjJmSDhC?=
 =?utf-8?B?ODB3V2YwSk8vVHZabXAveEtNMDRNbEZXNEtjaWtLWUFTRFlsaHF5SUpkanVn?=
 =?utf-8?B?clUzQU9DU1FwdU1NTStDK3RZWlgrOTliZ1BUeG9sbzlFVTk5TUVYMzVuejNP?=
 =?utf-8?B?MnV0RTV3YmEzRWZzTWxRdktROVBrNnM2Q2haNHYyWW5sVlFNY0xVbFc3ZjdF?=
 =?utf-8?B?YTRwY3poZ2Q1NDJXaGhpQ2RoMEZEc0ZFWkhiWVE5bHlUdlFIYW1BdC81Y1kx?=
 =?utf-8?B?UGQ2V3c1K0U1NVNvajZFWDVCMkV6T3VHUEdVNk1TYmJZNHpOMkVpRnpKaEhs?=
 =?utf-8?B?QWNaVFlhbEgzMjFXaGRKV0w1c3N4eEZqZXJLNUhzWHNyN2o2TWxEOEFiazUx?=
 =?utf-8?B?Uk9UZk5FMWZGR3ZGSVNocHMwbFNVRG03Vk41YU9SQ0ZlZ0FTelRPWVlpQUxw?=
 =?utf-8?B?amRodmVpSjZqNDJFVXN4T0IvbWRHR0JxT0xEQ0lGOGhPQUVPUTI1Mzk1bVY5?=
 =?utf-8?B?dGova1F2eGxkVkY4aEJFSVBPTlNCRG0zQ1RHdEFsaXMxNFJ4djFoVU90clZL?=
 =?utf-8?B?T0JxMUNvandFQW0rYzEzd25BaWxBbUdEdFNQQmc2bUpXR3kxYk05ZWkvcWlt?=
 =?utf-8?B?U0NneWhnZElZRXAwS3poV1JDUGtvVytCU3FwNHpDYWsrbmkwUEF4aDByNXZM?=
 =?utf-8?B?aHVvQjlYd3R4d2VSSXVJK0VsclVYWUU5SDB1eit2MVlTRVU4TUlCVDlRMFNH?=
 =?utf-8?B?ZnBxNHBSNkFpMEFJby9ESnVEMkt5d0o5ZkwzUDAxSWwvNGJGSi9UYVhWY2F5?=
 =?utf-8?B?VXo5aGhQQjVZd21xcW1jWEpTOS80VGNLaTJRVjd5S3BTd0FGdVU0aFVMVEF1?=
 =?utf-8?B?ZWJPS2hiaVpTbVpyT1J1N2RjbGVPaVhJQkQ1akRiemxXL0lEdjMxY2pyQS9v?=
 =?utf-8?B?ZHhVNVVhTFVYNFJSWDZPUFBlQS9vZ1BmVnFHVGFSUVFNUm1vTTF4WXFkeCtH?=
 =?utf-8?B?R0x3WVd0MDJRVEc5UlZhSVhWeVhxOVg5MzZQUTYwaVBZUWM3UmxwblFnUWVU?=
 =?utf-8?B?cURaZEdvRGZoZ3NxK1M2eTFtRW5ReEQ2VUd0cjd1dGlOZjZ0S1RmT2R5Y2dp?=
 =?utf-8?B?aHZodHhXSnl3OXp0UjFWbjJ6VGsvQm45M3lVTy9mSkExWHhOTmdLaEVmZnd5?=
 =?utf-8?B?RUx5L1pXT0lxelJuZ2g1eFk5aVBYYkZRaWU4OGhHekdWQ1dzWTFtUTdaVUlN?=
 =?utf-8?B?ekxJNmtqcThoOC9JQ3YyTkhuR0NSK3JEQ2VyRnJ3TmNlNjdYOFMwdmM2ZjFJ?=
 =?utf-8?B?dTRHZHBoQU53MnE5UytzVFlJc2JPWkNOSjdxU0NNS29VVDhFd001RkdPVEky?=
 =?utf-8?B?ZFRpS3orZ0VTRXAvdG5TNVJUYzRWOHVoMHVkU1o0TFoveDNkNTVmWEs5RFBv?=
 =?utf-8?B?VEJUOTVoejJudFVKTnNFT1lUd01IS0JxaE0wYXl2Z1pHMTdYd3l2cGJTZ3FQ?=
 =?utf-8?B?T1A4RlZLMkRlNmc2QmNWQTZud1NoRDZQMlhnSXRqaFFONkVTTjF4bTlNVjBK?=
 =?utf-8?B?NElRVTI0Y3dpUWNmVmkzb2RCazQzdG96U2c2ZUFyajhhOXNjOElVTVcvU1R4?=
 =?utf-8?B?bmlJLzJsUy8vYkpwVEJNMUJLeWpPbnN1V0UyMlgyWVZwSlRJcXp5SFVmNGc1?=
 =?utf-8?Q?M8Pa//oNeQMRY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c7d0a95-8e62-4447-1b8d-08d93b130ff1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 15:32:11.0390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yNgDPGThOWqicUU3ejDwjnZCEQuwYkRPTPSUfKKAZrMxDCPWzdndxyEBzx38E8YGD4ONfFepSuEu0uy683vZew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5151
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
Cc: linux-hyperv@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-rockchip@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-tegra@vger.kernel.org, spice-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, freedreno@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LGTM

Acked-by: Nirmoy Das <nirmoy.das@amd.com>

On 6/29/2021 3:58 PM, Thomas Zimmermann wrote:
> Print the name of the DRM driver when taking over fbdev devices. Makes
> the output to dmesg more consistent. Note that the driver name is only
> used for printing a string to the kernel log. No UAPI is affected by this
> change.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  2 +-
>   drivers/gpu/drm/armada/armada_drv.c           |  2 +-
>   drivers/gpu/drm/ast/ast_drv.c                 |  2 +-
>   drivers/gpu/drm/bochs/bochs_drv.c             |  2 +-
>   drivers/gpu/drm/drm_aperture.c                | 19 ++++++++++++-------
>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  2 +-
>   drivers/gpu/drm/hyperv/hyperv_drm_drv.c       |  4 ++--
>   drivers/gpu/drm/i915/i915_drv.c               |  2 +-
>   drivers/gpu/drm/meson/meson_drv.c             |  2 +-
>   drivers/gpu/drm/mgag200/mgag200_drv.c         |  2 +-
>   drivers/gpu/drm/msm/msm_fbdev.c               |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_drm.c         |  2 +-
>   drivers/gpu/drm/qxl/qxl_drv.c                 |  2 +-
>   drivers/gpu/drm/radeon/radeon_drv.c           |  2 +-
>   drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  2 +-
>   drivers/gpu/drm/sun4i/sun4i_drv.c             |  2 +-
>   drivers/gpu/drm/tegra/drm.c                   |  2 +-
>   drivers/gpu/drm/tiny/cirrus.c                 |  2 +-
>   drivers/gpu/drm/vboxvideo/vbox_drv.c          |  2 +-
>   drivers/gpu/drm/vc4/vc4_drv.c                 |  2 +-
>   drivers/gpu/drm/virtio/virtgpu_drv.c          |  2 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  2 +-
>   include/drm/drm_aperture.h                    | 14 +++++++++-----
>   23 files changed, 43 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 6f30c525caac..accf9c1b967a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -1278,7 +1278,7 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>   #endif
>   
>   	/* Get rid of things like offb */
> -	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "amdgpudrmfb");
> +	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &amdgpu_kms_driver);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
> index dab0a1f0983b..31925ae3ab72 100644
> --- a/drivers/gpu/drm/armada/armada_drv.c
> +++ b/drivers/gpu/drm/armada/armada_drv.c
> @@ -95,7 +95,7 @@ static int armada_drm_bind(struct device *dev)
>   	}
>   
>   	/* Remove early framebuffers */
> -	ret = drm_aperture_remove_framebuffers(false, "armada-drm-fb");
> +	ret = drm_aperture_remove_framebuffers(false, &armada_drm_driver);
>   	if (ret) {
>   		dev_err(dev, "[" DRM_NAME ":%s] can't kick out simple-fb: %d\n",
>   			__func__, ret);
> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
> index 5aa452b4efe6..86d5cd7b6318 100644
> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -100,7 +100,7 @@ static int ast_remove_conflicting_framebuffers(struct pci_dev *pdev)
>   	primary = pdev->resource[PCI_ROM_RESOURCE].flags & IORESOURCE_ROM_SHADOW;
>   #endif
>   
> -	return drm_aperture_remove_conflicting_framebuffers(base, size, primary, "astdrmfb");
> +	return drm_aperture_remove_conflicting_framebuffers(base, size, primary, &ast_driver);
>   }
>   
>   static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> diff --git a/drivers/gpu/drm/bochs/bochs_drv.c b/drivers/gpu/drm/bochs/bochs_drv.c
> index c828cadbabff..0d232b44ecd7 100644
> --- a/drivers/gpu/drm/bochs/bochs_drv.c
> +++ b/drivers/gpu/drm/bochs/bochs_drv.c
> @@ -110,7 +110,7 @@ static int bochs_pci_probe(struct pci_dev *pdev,
>   		return -ENOMEM;
>   	}
>   
> -	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "bochsdrmfb");
> +	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &bochs_driver);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/drm_aperture.c b/drivers/gpu/drm/drm_aperture.c
> index 9335d9d6cf9a..9ac39cf11694 100644
> --- a/drivers/gpu/drm/drm_aperture.c
> +++ b/drivers/gpu/drm/drm_aperture.c
> @@ -33,6 +33,10 @@
>    *
>    * .. code-block:: c
>    *
> + *	static const struct drm_driver example_driver = {
> + *		...
> + *	};
> + *
>    *	static int remove_conflicting_framebuffers(struct pci_dev *pdev)
>    *	{
>    *		bool primary = false;
> @@ -46,7 +50,7 @@
>    *	#endif
>    *
>    *		return drm_aperture_remove_conflicting_framebuffers(base, size, primary,
> - *		                                                    "example driver");
> + *		                                                    &example_driver);
>    *	}
>    *
>    *	static int probe(struct pci_dev *pdev)
> @@ -274,7 +278,7 @@ static void drm_aperture_detach_drivers(resource_size_t base, resource_size_t si
>    * @base: the aperture's base address in physical memory
>    * @size: aperture size in bytes
>    * @primary: also kick vga16fb if present
> - * @name: requesting driver name
> + * @req_driver: requesting DRM driver
>    *
>    * This function removes graphics device drivers which use memory range described by
>    * @base and @size.
> @@ -283,7 +287,7 @@ static void drm_aperture_detach_drivers(resource_size_t base, resource_size_t si
>    * 0 on success, or a negative errno code otherwise
>    */
>   int drm_aperture_remove_conflicting_framebuffers(resource_size_t base, resource_size_t size,
> -						 bool primary, const char *name)
> +						 bool primary, const struct drm_driver *req_driver)
>   {
>   #if IS_REACHABLE(CONFIG_FB)
>   	struct apertures_struct *a;
> @@ -296,7 +300,7 @@ int drm_aperture_remove_conflicting_framebuffers(resource_size_t base, resource_
>   	a->ranges[0].base = base;
>   	a->ranges[0].size = size;
>   
> -	ret = remove_conflicting_framebuffers(a, name, primary);
> +	ret = remove_conflicting_framebuffers(a, req_driver->name, primary);
>   	kfree(a);
>   
>   	if (ret)
> @@ -312,7 +316,7 @@ EXPORT_SYMBOL(drm_aperture_remove_conflicting_framebuffers);
>   /**
>    * drm_aperture_remove_conflicting_pci_framebuffers - remove existing framebuffers for PCI devices
>    * @pdev: PCI device
> - * @name: requesting driver name
> + * @req_driver: requesting DRM driver
>    *
>    * This function removes graphics device drivers using memory range configured
>    * for any of @pdev's memory bars. The function assumes that PCI device with
> @@ -321,7 +325,8 @@ EXPORT_SYMBOL(drm_aperture_remove_conflicting_framebuffers);
>    * Returns:
>    * 0 on success, or a negative errno code otherwise
>    */
> -int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pdev, const char *name)
> +int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
> +						     const struct drm_driver *req_driver)
>   {
>   	resource_size_t base, size;
>   	int bar, ret = 0;
> @@ -339,7 +344,7 @@ int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pdev, const
>   	 * otherwise the vga fbdev driver falls over.
>   	 */
>   #if IS_REACHABLE(CONFIG_FB)
> -	ret = remove_conflicting_pci_framebuffers(pdev, name);
> +	ret = remove_conflicting_pci_framebuffers(pdev, req_driver->name);
>   #endif
>   	if (ret == 0)
>   		ret = vga_remove_vgacon(pdev);
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index f4bc5386574a..6f0297b854f2 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -314,7 +314,7 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
>   	struct drm_device *dev;
>   	int ret;
>   
> -	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "hibmcdrmfb");
> +	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &hibmc_driver);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> index eb06c92c4bfd..cd818a629183 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> @@ -82,7 +82,7 @@ static int hyperv_setup_gen1(struct hyperv_drm_device *hv)
>   		return -ENODEV;
>   	}
>   
> -	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "hypervdrmfb");
> +	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &hyperv_driver);
>   	if (ret) {
>   		drm_err(dev, "Not able to remove boot fb\n");
>   		return ret;
> @@ -127,7 +127,7 @@ static int hyperv_setup_gen2(struct hyperv_drm_device *hv,
>   	drm_aperture_remove_conflicting_framebuffers(screen_info.lfb_base,
>   						     screen_info.lfb_size,
>   						     false,
> -						     "hypervdrmfb");
> +						     &hyperv_driver);
>   
>   	hv->fb_size = (unsigned long)hv->mmio_megabytes * 1024 * 1024;
>   
> diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
> index 850b499c71c8..62327c15f457 100644
> --- a/drivers/gpu/drm/i915/i915_drv.c
> +++ b/drivers/gpu/drm/i915/i915_drv.c
> @@ -562,7 +562,7 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
>   	if (ret)
>   		goto err_perf;
>   
> -	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "inteldrmfb");
> +	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, dev_priv->drm.driver);
>   	if (ret)
>   		goto err_ggtt;
>   
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index a7388bf7c838..3d0ccc7eef1b 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -285,7 +285,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>   	 * Remove early framebuffers (ie. simplefb). The framebuffer can be
>   	 * located anywhere in RAM
>   	 */
> -	ret = drm_aperture_remove_framebuffers(false, "meson-drm-fb");
> +	ret = drm_aperture_remove_framebuffers(false, &meson_driver);
>   	if (ret)
>   		goto free_drm;
>   
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
> index a701d9563257..36d1bfb3213f 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
> @@ -342,7 +342,7 @@ mgag200_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   	struct drm_device *dev;
>   	int ret;
>   
> -	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "mgag200drmfb");
> +	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &mgag200_driver);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
> index 227404077e39..67fae60f2fa5 100644
> --- a/drivers/gpu/drm/msm/msm_fbdev.c
> +++ b/drivers/gpu/drm/msm/msm_fbdev.c
> @@ -169,7 +169,7 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
>   	}
>   
>   	/* the fw fb could be anywhere in memory */
> -	ret = drm_aperture_remove_framebuffers(false, "msm");
> +	ret = drm_aperture_remove_framebuffers(false, dev->driver);
>   	if (ret)
>   		goto fini;
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index a616cf4573b8..df8a2d92f473 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -738,7 +738,7 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
>   	nvkm_device_del(&device);
>   
>   	/* Remove conflicting drivers (vesafb, efifb etc). */
> -	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "nouveaufb");
> +	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &driver_pci);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
> index 854e6c5a563f..31f4c86ceb99 100644
> --- a/drivers/gpu/drm/qxl/qxl_drv.c
> +++ b/drivers/gpu/drm/qxl/qxl_drv.c
> @@ -95,7 +95,7 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   	if (ret)
>   		return ret;
>   
> -	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "qxl");
> +	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &qxl_driver);
>   	if (ret)
>   		goto disable_pci;
>   
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
> index 8cd135fa6dcd..82ee8244c9b3 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.c
> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> @@ -330,7 +330,7 @@ static int radeon_pci_probe(struct pci_dev *pdev,
>   		return -EPROBE_DEFER;
>   
>   	/* Get rid of things like offb */
> -	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "radeondrmfb");
> +	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &kms_driver);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> index b730b8d5d949..17a189bb6bbc 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> @@ -116,7 +116,7 @@ static int rockchip_drm_bind(struct device *dev)
>   	int ret;
>   
>   	/* Remove existing drivers that may own the framebuffer memory. */
> -	ret = drm_aperture_remove_framebuffers(false, "rockchip-drm-fb");
> +	ret = drm_aperture_remove_framebuffers(false, &rockchip_drm_driver);
>   	if (ret) {
>   		DRM_DEV_ERROR(dev,
>   			      "Failed to remove existing framebuffers - %d.\n",
> diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
> index af335f58bdfc..6bc1c8d6d43b 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
> @@ -100,7 +100,7 @@ static int sun4i_drv_bind(struct device *dev)
>   	drm->irq_enabled = true;
>   
>   	/* Remove early framebuffers (ie. simplefb) */
> -	ret = drm_aperture_remove_framebuffers(false, "sun4i-drm-fb");
> +	ret = drm_aperture_remove_framebuffers(false, &sun4i_drv_driver);
>   	if (ret)
>   		goto cleanup_mode_config;
>   
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index f96c237b2242..2c8fc14bba1f 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -1204,7 +1204,7 @@ static int host1x_drm_probe(struct host1x_device *dev)
>   
>   	drm_mode_config_reset(drm);
>   
> -	err = drm_aperture_remove_framebuffers(false, "tegradrmfb");
> +	err = drm_aperture_remove_framebuffers(false, &tegra_drm_driver);
>   	if (err < 0)
>   		goto hub;
>   
> diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
> index 42611dacde88..a8b476a59c0d 100644
> --- a/drivers/gpu/drm/tiny/cirrus.c
> +++ b/drivers/gpu/drm/tiny/cirrus.c
> @@ -550,7 +550,7 @@ static int cirrus_pci_probe(struct pci_dev *pdev,
>   	struct cirrus_device *cirrus;
>   	int ret;
>   
> -	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "cirrusdrmfb");
> +	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &cirrus_driver);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> index 6d4b32da9866..879a2445cc44 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> @@ -43,7 +43,7 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   	if (!vbox_check_supported(VBE_DISPI_ID_HGSMI))
>   		return -ENODEV;
>   
> -	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "vboxvideodrmfb");
> +	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &driver);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
> index 8a60fb8ad370..73335feb712f 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -265,7 +265,7 @@ static int vc4_drm_bind(struct device *dev)
>   	if (ret)
>   		goto unbind_all;
>   
> -	ret = drm_aperture_remove_framebuffers(false, "vc4drmfb");
> +	ret = drm_aperture_remove_framebuffers(false, &vc4_drm_driver);
>   	if (ret)
>   		goto unbind_all;
>   
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
> index ca77edbc5ea0..ed85a7863256 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -57,7 +57,7 @@ static int virtio_gpu_pci_quirk(struct drm_device *dev, struct virtio_device *vd
>   		 vga ? "virtio-vga" : "virtio-gpu-pci",
>   		 pname);
>   	if (vga) {
> -		ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "virtiodrmfb");
> +		ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &driver);
>   		if (ret)
>   			return ret;
>   	}
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index 086dc75e7b42..40864ce19ae1 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -1574,7 +1574,7 @@ static int vmw_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   	struct vmw_private *vmw;
>   	int ret;
>   
> -	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "svgadrmfb");
> +	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &driver);
>   	if (ret)
>   		return ret;
>   
> diff --git a/include/drm/drm_aperture.h b/include/drm/drm_aperture.h
> index 6c148078780c..7096703c3949 100644
> --- a/include/drm/drm_aperture.h
> +++ b/include/drm/drm_aperture.h
> @@ -6,20 +6,22 @@
>   #include <linux/types.h>
>   
>   struct drm_device;
> +struct drm_driver;
>   struct pci_dev;
>   
>   int devm_aperture_acquire_from_firmware(struct drm_device *dev, resource_size_t base,
>   					resource_size_t size);
>   
>   int drm_aperture_remove_conflicting_framebuffers(resource_size_t base, resource_size_t size,
> -						 bool primary, const char *name);
> +						 bool primary, const struct drm_driver *req_driver);
>   
> -int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pdev, const char *name);
> +int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
> +						     const struct drm_driver *req_driver);
>   
>   /**
>    * drm_aperture_remove_framebuffers - remove all existing framebuffers
>    * @primary: also kick vga16fb if present
> - * @name: requesting driver name
> + * @req_driver: requesting DRM driver
>    *
>    * This function removes all graphics device drivers. Use this function on systems
>    * that can have their framebuffer located anywhere in memory.
> @@ -27,9 +29,11 @@ int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pdev, const
>    * Returns:
>    * 0 on success, or a negative errno code otherwise
>    */
> -static inline int drm_aperture_remove_framebuffers(bool primary, const char *name)
> +static inline int
> +drm_aperture_remove_framebuffers(bool primary, const struct drm_driver *req_driver)
>   {
> -	return drm_aperture_remove_conflicting_framebuffers(0, (resource_size_t)-1, primary, name);
> +	return drm_aperture_remove_conflicting_framebuffers(0, (resource_size_t)-1, primary,
> +							    req_driver);
>   }
>   
>   #endif
