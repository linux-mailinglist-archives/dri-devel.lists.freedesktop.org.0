Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4DCAC832C
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 22:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F56610E262;
	Thu, 29 May 2025 20:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JiXY5kz0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2047.outbound.protection.outlook.com [40.107.236.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B709F10E1F4;
 Thu, 29 May 2025 20:24:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mcoBe6PUbbXUvDILWdAvCCXSK477pJ9WsDQbEy90ZCmGbtTT3IZwhx9AijcNDEwnT7o0rpBJ4bcW8WowljKZZFYZcfQSBEWmL+ed8sPqy0SqHR/b4wIgjbgaEDT3QwwWe/dSXwGWrYqNXqfFO6xd8hVGdjvfkOkv1jIu0rgqnelEgPjumQXzZ1szEvhkXgY0GAotrdyB2L9bUxgfDTBZN7GX9wjNyKEnHCVmIVar4HvPeTLrgk8nZRSJ9shXHEjRfC4xJ6Z4VfsYbFpcItb3wvig0HihViw/OJS0wtXOrrex3ZXj1gwZyfnXHA3CTxJ1z2I3cysRsksU7RiT3+ER5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4U/nk3qlIKjj0wFkoS/TYHpslkjBsuER/ddK4/HQEc=;
 b=eevrOy3OqyPf6ioD7KqBPkXrIpzdYIP9HiOYeTutNzjX2MJKIPebv5/U1ViAtvJcHIXGHWygFk/+Y/ddnk/Z5loR8ls2Oq56lSkGyO3zWO67I3uQksivmI5wVU/vuAmsnu10K0Xgmhny8xLK1ALbpV4Zsoq5GCIVwoRoxBCNccPs1PbToYhmdHi6VS7PP4zl0P/zEss5ijzWXKpdnGetvn9CACRWSVOfRGtUSSAgK7xbl4F06OBAXeOrIMv/rbcDZKlfvzJK5Dy2xPJN4nF0gfLYveWHPgUgL7sTHls7/DHABwpJivOuLkwnft7aDZkOrDacM1YEdLlPvV4hzJ/OsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4U/nk3qlIKjj0wFkoS/TYHpslkjBsuER/ddK4/HQEc=;
 b=JiXY5kz0rrLkQ/bAYvB3hzvg3Ou2TTTn9lQNX+tamPmmIr7whV/aeFHjAK/1WOenFMMvFE9XUadnhWIQiN93e5o8QnKych9t7fJf3xmEHuHxo4GylG1/DxXlEtVPbqgMDjMgq9N6JIsSf4zTDEakQYgghNr/4/h1I8rzHogENrI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by PH8PR12MB6865.namprd12.prod.outlook.com (2603:10b6:510:1c8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Thu, 29 May
 2025 20:24:01 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%6]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 20:24:01 +0000
Message-ID: <dec6b213-5c55-426c-8003-2bbccfebcf75@amd.com>
Date: Thu, 29 May 2025 16:23:57 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND] drm/amdkfd: enable kfd on RISCV systems
To: liu.xuemei1@zte.com.cn
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250529102511926m1vYHloavTKK17e5_ZdsX@zte.com.cn>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20250529102511926m1vYHloavTKK17e5_ZdsX@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY5P221CA0107.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:930:9::34) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|PH8PR12MB6865:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ef4f542-3aa9-4a76-7e2d-08dd9eeebf76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0F5TWRsc0pkUkF5YVFGRVBwcUJWdTNPRFlndjRLK2dYNU54cGF3Q2lNV0Np?=
 =?utf-8?B?bW5ZaUNKRjlGTnJVQVVIek93Z1F5WkNDOW1QV2t3RUhXbURET0QzYWRiYXNT?=
 =?utf-8?B?bkJEM3cxNWVWaEV5QTlKY2svWGRMTTNiMnkxZDY1RGRTZG5uMjJzRjExUGU1?=
 =?utf-8?B?amhTSmcyaEZlTTlaQ2k3UEJjQk51TEdYNlk3YVpiR1RWM3FDMnFXdTNreFgv?=
 =?utf-8?B?bllOeVZsVjQ1a1JRaGs4M0loeHVBRzdyNjl0aGhmaEVYWjh3bE1nbHVTMUZm?=
 =?utf-8?B?enZtM2FUbFNUYUxFbFhnQTEvOU5HY3RubXVzSFZrd2p3L0ZsNUdUZVkySHBo?=
 =?utf-8?B?SHp5T0hsNFd1VVptUlF6Zi90VnE3NVZPbzAzYXNmZUdFakhEL1g2bmNwcndr?=
 =?utf-8?B?eHhjQ09RaVB3OFdsSHdFZWJJcS8wZnZFaGNTWEJ5SWU1OGxma1FJQmhiR3NK?=
 =?utf-8?B?STNYOURINkpDbTZFMEVKRmh2VHI2YkYwL3d1N0ZLUm8vNnFkWUxGc2dkT0tS?=
 =?utf-8?B?UjUxS0VvV0VGTnlmUk5YcG9EYUpORVNtdGYwS3dMc2wxdlZNc2pMSnp1aHZs?=
 =?utf-8?B?dnp6ZVlvTEJWdmo2TmxjMUp1K0JoLzZxaUVTV1Rnb0ticUQrS1VQb1RreFJ5?=
 =?utf-8?B?eFVrWnFGc0tYWEpnTm5Va0tGQWkyOGszd0RQc0l4NjlPd2ZleGZPcng1Ri8v?=
 =?utf-8?B?RnVMWmdnVkY2WkpRNDhxUkVmOFd3WS9McjcrYnFDQmRFZkxGMXZTWitUdkUr?=
 =?utf-8?B?bUpPbWh5MDJNVVVBbGx6ajdpM0pzUzU5Wit1QUkzQzAzeU01SWlSbWIzSjVj?=
 =?utf-8?B?WVZUQzBEcFdTWTdZbEtqNlErTFhTSUQ4WWdNYjJxdmN5THZiZDhBaWIwSitY?=
 =?utf-8?B?ZVBaajdvNktxMmt1aW43Qk5RR1ZQSzdiSWdjcDhMMVVEa2ZJRER4dFRuS3JW?=
 =?utf-8?B?cnRqTCtjU3BtUUxzbFhEcnRhc3l1cCtQVHUzUGZaRG5PZVA1MFFUMEZvN05y?=
 =?utf-8?B?Z3p3ZTFtelRtOGp0bUlWMWc5d0J1Y1RLd3o1NHA4c3F3L05Qc2NQY3ExS1lU?=
 =?utf-8?B?UjA5cVcxYk8yVEIxWlIxaDV1cnlqQVB2c3dGV1ZUVHVkY2FCVG5ScFE5dTlJ?=
 =?utf-8?B?T0dmeHZXbGRoZUh3aXAvRkxMdWFqRlo5NkZZSG9aZDg5eHZpU1cxMExGSVJ3?=
 =?utf-8?B?bUV5Vm5NQndaSGNwUmY2YXdsbXpmV09CZG1uQnlXbHdRLzA3SmtER2hTaTha?=
 =?utf-8?B?TmIrVTBtV0F2VXBmMU9HZWpVcFM1YjVQMFBLb0FzejdkbHh1MWM3ZFJUUEIz?=
 =?utf-8?B?L1NVTVBrUkI3RE9aZXlzOVFZdVIvZDRpQUFiaEZtR0tIMHE5eUwvSFpHekJE?=
 =?utf-8?B?NkFiV1VwZlZIZk1YRHVIMVFSV1VlS29wNUZ5NmMxcGg0elZyYmRtODd2NFFz?=
 =?utf-8?B?OXRYWUNsNTFtWk5kaTVucGNGTzRSK1R2S1l0SFBJOE4vRlhNTjFMR2FKc1N5?=
 =?utf-8?B?RzE5T3Ira3Z2ZHdPbEt6a3ltMzVIUUZQYVFsWTJROExONkV4Ynh1OGFGa2dy?=
 =?utf-8?B?RU1nTS9aRUZ6SXpFMDFmU1dFOHREQmJ1aUN0NFBEbHJXUERCVkZoK2NCK29Z?=
 =?utf-8?B?VmVRcGltRU50N3NDclZJeW4yQVlydW9uUUUzRHloN0dMMWlBQ1U2TkdjbklC?=
 =?utf-8?B?eDRWUWV1YnVER3RwUmRzYUszUkdGSk5MaXZGY2szbytUUnJNTjZiNEZIY3hJ?=
 =?utf-8?B?VzJNdlo4dEhlc001OHlOclRrN3FldXhOaHV3RUlzUU80azZRRGFiWjF3Tk1s?=
 =?utf-8?B?WUhPbmx3a2dZcklvL1BLSlo5cFQ3V1E1OGdUcmxFdldJUlBhUG40SWhtOEtK?=
 =?utf-8?B?U1ZaNU80OG1qclJzS3JNSVBQNTJKYXdDWUZGZkxZRzU5WFZOTzBtMkJZdmZw?=
 =?utf-8?Q?nfUSx0PtMBo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2pXYlloNzdRSHBaTmc0T3o5K2Z4MmhKS0c2b1JpUzlSUzJWZkxBbFRSRG13?=
 =?utf-8?B?NWU3YnNJaUd1eW5hcW03dlZTcDVKMUVySzliR3hJdHpEeTJ6cWRGUVNyRmZl?=
 =?utf-8?B?TldYUklFNDlGNVlWR0huUFhNWjVNdVpONjNPcU9OYXp3WWRqamVEQWFUZzMr?=
 =?utf-8?B?YmFjcktvaGc3a3MzY3dnWWJiYS9Qa3hKeExuZndVanRPSmorNjY0SHNGcWRT?=
 =?utf-8?B?YTUvK2hSSlF2clc4Y0tNVyt0UGJ4VFF3bkY2N0VtZlJvTVBYb1Y4cDRDeG1M?=
 =?utf-8?B?S3FOSGhCUUtBSEc1MThoQXRxZWZ2Qkw5THQrWVVVMkoxc0gxeHBzUHlTeFdp?=
 =?utf-8?B?UlpiNWRTUUQvSHhJL2MvVktrRFZWMGtCVnF2TU5Gbm1pQ2x3eW9xWk9Hb2hW?=
 =?utf-8?B?aG4wSzJ3d0p5cmcrSVFsVmpFU3M3ZDRkSUdSbm5NQ1pMWlpiZnBPVGMyT2p0?=
 =?utf-8?B?dVRhU05wNnhMZjhDUWE5Y3hEVzhLZUc1dy9pcURUTHA5Mlc5M3pPR2YxdjZV?=
 =?utf-8?B?SGxOU1hGYzBIM1lxTVJDSWdwK0Z6M1MvRXBEMmNEdnZJN2xXSmFrdVhsc3NP?=
 =?utf-8?B?TGhQQ3JsZGhaSE9zT1ZWeGxvN2lPcXN4ZWczMHI2Q3pJUTBtcEFKSkozK3JJ?=
 =?utf-8?B?aHhMYkc4ZURKQS9Ia3pVRTBHZkw2VVRlZ2F4WTdpTXRiL0NoU3lPck1JTWdH?=
 =?utf-8?B?Mlc1U1E1Wm5nN05lTlRiV2JJclVsaHdvVVZVU1VyaWI3ZU42dnRrdUlZYWlQ?=
 =?utf-8?B?aHFWTWdQYlNHSEN5NmVBUFlkWmZVOEgybHFFa1lwZ1dmQVJxekpGZUhqa3Fn?=
 =?utf-8?B?NkxjdXZYWDhPTnE4YVo0UDB0MGp3K081V3gybU5FQnh2dllqbEE1NXRYUlFH?=
 =?utf-8?B?aVdJbDRqQkpUM1pzSmoyT3NwdWVLTHZ6MWJCWklyRTdUTlBvSDhjZFlNMmNq?=
 =?utf-8?B?OEZWUkZvL2dsWFdQQ1UyRnB5azRTSFFBYmxPTXZxc3NVMFlHSEtJZ0wvbzY0?=
 =?utf-8?B?eXJIclEwMUVia3BITVJpb3dsaXdEc1NCUU5aOFY3L1MwcGgvbnBzN1dEVitK?=
 =?utf-8?B?ZkY1aDRLeFpuSDNJRDJTREE3OGFFUjA5OUpiYjFGWnVxazlBbG9sa2dXanBT?=
 =?utf-8?B?ZjFIanljNERFNS8xWFJFb1pFMHJGUnFkb0lWNGpGMjV3UGg5bnhTWDdXSGpi?=
 =?utf-8?B?dlNZTVNCVmp2TFdpMjF4eERmZjN3VDJwSVU2TGJJRTZrcmFsTXhPWVpFWlRK?=
 =?utf-8?B?MmFVZmljUWRweXBBbytVVWQ4bW9jbThnZkdaeTR2a2dEWDF2dkpmcDBaVHBO?=
 =?utf-8?B?dXF5VjFML1FvcHpxZHJXQklJU0NQN2JFSFFXbEhJcm1EZmtzd1FlWlJvbFJ1?=
 =?utf-8?B?MUZHNTRpQzdVaXlJY1Z2Z3NiZHF1eE5USkhoT213RlJUMVZ1WWVLRkZ5YXNm?=
 =?utf-8?B?NElnd0F3WHBiT2I4T1NUQXIzcGZLVldwNVNFQnZPUkZSUEV6TXBJRDZZd2Fx?=
 =?utf-8?B?WG1aWmFjM2EwUzRMbHF4bFQwUE9uaGhQcmJIZmF2N3l6dnBUSTArRWFnMEpu?=
 =?utf-8?B?Y2pkZFFJT2tlVi9zek1tSGNVajNkQzMrbmV0eXk2QlRTZkxybHYvWGhnQTdr?=
 =?utf-8?B?Z0UyU2lobXltYml4K3lERTVoWTFPTzdBSGlyUjNuQlNBMkJtTERWWEhSeDg3?=
 =?utf-8?B?WXZWZU5ZVE9QaFpLVHVHZDhBQ0U1WWs3cG82SWdCeE5hNWhiSTNjY3lLQlRq?=
 =?utf-8?B?NjJoVVdJRFh2bFkxODZGMWNtWkRxL1E0ZDA5bGgzS2hJYkxnTVN2T2RzUTdE?=
 =?utf-8?B?clRqZllqYW92VWIrMTNRZ0NQeVNRNUMzNzUyYnRJcHA1NTdmRktEcjFLbEFw?=
 =?utf-8?B?S0UxSEVTbnJpSzBNYTNxRWFoeWVvdzNHSFdZSlpFMWVOcmVQM0dtOTkvRkta?=
 =?utf-8?B?dC9wKzhubXdLeWVjZVdWNGZaNzJKazRqWjNWZVpnMXYzemtTbzlnSVdVUXFt?=
 =?utf-8?B?Y1dGdlVOVHhiVm5oZHhKMWpteWdac2xCSGxnNmkvdTF2NVFXcG9tdy9mbitQ?=
 =?utf-8?B?aUZGdE1ITkhPQXFnR2xLUnVQcElBaVM0eTVhSk5lREdIcnIyN1IycldoRTVh?=
 =?utf-8?Q?Y8aDpTVJmlH/w2YySpbFA8xRh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef4f542-3aa9-4a76-7e2d-08dd9eeebf76
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 20:24:01.1619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3gdZ5+Cr6hrPYsEAnCJrBNGyiO3oPECWGldxnvHjhhwEqVlk620BFFJ8LtTPocLiC4BvXxqLwluUG2m9lRHWZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6865
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

Sorry for the delay. I merged the patch to amd-staging-drm-next.

Regards,
  Felix

On 2025-05-28 22:25, liu.xuemei1@zte.com.cn wrote:
> From: Xuemei Liu <liu.xuemei1@zte.com.cn>
>
> KFD has been confirmed that can run on RISCV systems. It's necessary to
> support CONFIG_HSA_AMD on RISCV.
>
> Signed-off-by: Xuemei Liu <liu.xuemei1@zte.com.cn>
> ---
> drivers/gpu/drm/amd/amdkfd/Kconfig | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/Kconfig b/drivers/gpu/drm/amd/amdkfd/Kconfig
> index d3c3d3ab7225..62e88e5362e9 100644
> --- a/drivers/gpu/drm/amd/amdkfd/Kconfig
> +++ b/drivers/gpu/drm/amd/amdkfd/Kconfig
> @@ -5,7 +5,7 @@
>
> config HSA_AMD
> bool "HSA kernel driver for AMD GPU devices"
> - depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64)
> + depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64 || (RISCV && 64BIT))
> select HMM_MIRROR
> select MMU_NOTIFIER
> select DRM_AMDGPU_USERPTR
> --
> 2.25.1
