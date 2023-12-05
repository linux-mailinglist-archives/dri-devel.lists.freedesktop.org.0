Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C26F80579D
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 15:41:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A579C10E54B;
	Tue,  5 Dec 2023 14:41:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::61f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45B710E546;
 Tue,  5 Dec 2023 14:41:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U3FO31uUQdzbhvZAh1G3aNGX58KtTZmPC+5u5plTH1jA3sBkSHeeL1O9UVsqKEkys3M0IXDkUbHwtv0H1nDpQCVL0X99khss5NM+ffdGNousKRkoeF5JdN5QNa8k0L4GCdIRjItuhRkL/FuLDLrL2u+pHQAQj30clcrZcPezu+V+5lCWqzlySBIlUhcJCAep81cbxWeiKB9ZbIlgSbCMO3KhXBG9Rd1JGmyWtLvommLMumxYhGI178sBRFHCK8x+QrHIQ2f4WjVipjL2QBFjvoAy1SYihbMsqwktTKWiZCnroJNpsAm3Yfz76N3IfZIkX1avtJAxb+3Uqsy3IJcZ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OAAz11jV4icSbUhhKsMhRtWI538gZZplUGY8x5Oj/Rg=;
 b=YETlW50eQmH8vEXwTLpgw07mwDE0Lk+JLoJQIQzORdPVMOQOfidZFjzEEOwN7V5LtwEK9L+5xgQvPer6G12CaL/Ikf5Z0O4jEm1pEWZyjr70X+XXhZXWjVr1x4WOVQPygYt96U4qQymd0VvQA1YoLMjqZvjsS7lGeQR2s+iFiK4qhmQ3xXZNjHm7kWZwSr47ICptbaddRtMR4RbPyPqU/pmmqZO+Tyb6zobf7LTOri257aH9Dmo1rSDAqqeeR9E6QGM8CMLoapPQ686dR9mR1/9EQsGxkx6PoyL5hW3Tjl/M86TIAdus/V+k6b2QtYGRteuxDMv7C8MFxgS7NpdAtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OAAz11jV4icSbUhhKsMhRtWI538gZZplUGY8x5Oj/Rg=;
 b=isv2tuYR2SY5rscGT15+PMRMavRlDvV+mWlI92GSEMo8l4AFFDPQW5TIBdQ6RlqygFwNuKMyqq7PffcEil1RLVMN2u1O3ZkQScDEXkAGmiTzzObtQQr4xiJeH5DmnrIoNRWOMZzy82gu/nDPOfXcfh/2LrVsEr1oZJvppvsxhpA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH7PR12MB6668.namprd12.prod.outlook.com (2603:10b6:510:1aa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 14:41:34 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3a35:139f:8361:ab66]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3a35:139f:8361:ab66%6]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 14:41:33 +0000
Message-ID: <f339bfd5-8748-464a-b6ca-188778ed4371@amd.com>
Date: Tue, 5 Dec 2023 09:41:29 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] drm/amdgpu: Do not include <drm/drm_plane_helper.h>
To: Thomas Zimmermann <tzimmermann@suse.de>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, daniel@ffwll.ch, airlied@gmail.com,
 suijingfeng@loongson.cn
References: <20231204090852.1650-1-tzimmermann@suse.de>
 <20231204090852.1650-3-tzimmermann@suse.de>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20231204090852.1650-3-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0502.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10c::11) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH7PR12MB6668:EE_
X-MS-Office365-Filtering-Correlation-Id: 38683b25-8f86-4cee-111f-08dbf5a046e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1+l3/4EA5Cmrz5nM7A+kO1iFMcrJFUQttedOUiPa/p1kf139kNI8D4U0PBIT/cVpZSQsZhW6hnAKtvgSexepVSlpN86tGrORsbMKgtUqD+GgxoqbKGYvkIXlAyvlmO+dnnuWVeHQA/HRBlsEyW5En9qLrpy3aQVehKTPvuCwGNeWsV47ClQ4onxjo1D6EQzUOFsWOXUfTEm3pCYhKCcpb2aZWtB/YF65LTDmN4W3GVj/rttglEGcHbD7KeTkTkDbFvQTCcjpLNCg7OS0n22mosfQLXXohmXFKVPXBb1EdvEVdaFINFvBh9Xs4uFwYZJvLF/9UAhYMoawN0/bP6ICfsxEWht3eAcp3muv84+MIvH0u2QeitS13N//mkl0Kv4HCCcToJQiTEFYMcJqhYxav0yo+a3Qn0OnoOUd5uoAfb93/zuvhdHGzz7S+ISFN6hGYn6tV95WzdfOIBFvDfFdm7OVThAk5CEJpx2iUNE4UpCKm4imxJKJlIFHoyxIUGBsCvnNJgjFPmuUiV3KdEa/Xfx37Sb1gonI2tARfLTc57Lr+MAy50gVclMBlQdvys0tYw0Kt4f/JhihlGSES/dDeCkwrnMvdarbQCLQxVg6EsKeLpx42jP2qEuS2XTuwEo6VyEHzphrw7GP0P5klpFJ9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(376002)(136003)(346002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(2906002)(86362001)(5660300002)(4744005)(7416002)(83380400001)(31686004)(38100700002)(31696002)(53546011)(36756003)(6506007)(44832011)(6512007)(2616005)(6666004)(26005)(8676002)(8936002)(4326008)(41300700001)(478600001)(6486002)(66946007)(316002)(66476007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVpSdnpyMzBuVHBhcGpHV1BPVnM0MEhSMktMNWowOVVxQ05KVlczOEVJRndm?=
 =?utf-8?B?czRDVnFYMU4zeTBhdWxRNW5XcVFzRHdCKy9vVmkxYXlFOEw1eUtWMTdIdjdi?=
 =?utf-8?B?Y0dxQlpScXhCL0hocU1HcUhmRXFTaWVCZmZVbEdNa3NGNFpmTXhITldvb2Jj?=
 =?utf-8?B?WEJZa1JVdUdjMXdQQWhySk10UUJFditwb3FyT0JPVWVIbHE3QnFyTW12eDJm?=
 =?utf-8?B?S0RPZjdYUWJlSmVuZUhWUnc0bEEzd2VmM3J4c2NsZGlOdkZzWTJiMWVvYXhC?=
 =?utf-8?B?WWs2c2pDelVrZEFnZ2lmTUVnYjIyNGZ5eDdweERSRkJpMWlHSDhMSUZ0VmZo?=
 =?utf-8?B?Y2hOZkZ5N1RQVFlsWlkwTGgzaGdFTG5wZ1lFbENpRTdkM29lZ1dzWTA0cm1L?=
 =?utf-8?B?ZTZ1dWcwbmNaZHVNV3hVYm9ZQnI3bm1tSUZncGdDVmhzR1hva2R4M3JROUgv?=
 =?utf-8?B?YWtDZW5XYjdOSzJmc1puUVFJb1lKc3ViM3N5d2w4MmhBQXd2VzNEQm94cGEw?=
 =?utf-8?B?Wlg2TkRxaGI5NTFVM3RPL0I1ck5YQmM4NlZ3akdMQXJNTjFHdVZTS1hJVmtL?=
 =?utf-8?B?cnRuOFBrMHphNTkxcW81VkswdU1PSkdZKzRJMHB2N29NT0VrK3c5TWxINVU5?=
 =?utf-8?B?MnBIU1VNZHJYaTQ0eUJ6MDNDMXFpV2VlbnB4akF6RHJiSjYxQzVMODM5a3lt?=
 =?utf-8?B?cXA2KzVybnJrVDlTQ1hoUmFzQzhUS0FYSnpKM1h6ZitQWnNlKy9yQ3dvOW9P?=
 =?utf-8?B?eE9rdDNGVzYxUU4xemF4cEl5dExoUXd4VncrOEZvS3dxQmp4NWRVYXZGWFJr?=
 =?utf-8?B?aUxqeUhrWnhYWWRrcmV3VEF1Z1ZPOWhFODQ4UC9yR1RmNHNZN21USUNleVps?=
 =?utf-8?B?Q2NBMzdDeFdvVlh6a0dlcGkzdzhhd21sZUoyeXI5OGpGZUQzOEM0UDdRSjhU?=
 =?utf-8?B?c016b0piMEFWdmdTS2VsbnAwZGt2cnlQRzRBQnAxOXF6R2NUMkU3aTZ5eWFl?=
 =?utf-8?B?dUI0aUEzN1FiOFZRYnlYenQwZmx1OHBZM1VSa2l6SnUvNVJWZDNJcVhCVTdw?=
 =?utf-8?B?OVVhSVBwSXNjVWc4U1NzR1N3M0ZZUzZDVWZTWGpOL1AyV2xpZXAvWUJuNU4r?=
 =?utf-8?B?RXZGdjNwcVMvUVlsNE1DeGgvV2dLak9FK2pSTDRQNE1ib0ZIaTJBQWhqNDYx?=
 =?utf-8?B?Z3BYMFJEMzdYQnMyMzM5M1pib3hUeVlpMnRzdzBORGJ0QUFHQ3NNSUNSY2o3?=
 =?utf-8?B?Z3ZLaWVkWWs0MnJjNmE4U0FNa3kra3NuMHhTS0JneVF2TmQ3OU9aL091T29F?=
 =?utf-8?B?MWNVMHlPeFhyeEpJWWJGc0h5dDRKV0JsdEI3WTFSSG4rQmNBcFZTVDU0MXRx?=
 =?utf-8?B?a1dIMnI3dG4xNGpXeHNBQXFMTzkyQ1BUUElzWDNnV3Z1T3NmaGFQSGxlYWRV?=
 =?utf-8?B?TlRtZGhhZHR4NGpZUy9aU2c4OGVmZW9ZQmlrWGkvMytTQVV2dXpUNWQ2cW96?=
 =?utf-8?B?WGhTNjdUSnBBQnNuSmpBSk9KSTVaaGNmMWUzWkYrNTd4NlB3bk5Md2ErNWdv?=
 =?utf-8?B?T21zS3NhQ0dITVl2M0NUQlZ0c1VyNFNzS0N1ODVJQVAvS3hyamJCQ3VEaWtk?=
 =?utf-8?B?aTVDRFcveGQxTVZwbGpKQnA5Mjh1OFFuR0xHTmZaaUFXUXJaUm5sc3crVEpw?=
 =?utf-8?B?MkJzSG5GZk1OZFlDNkdFUGVsbHA4Q3lqVzROWTJRWEJIWFdkNUVnRzh1MzNV?=
 =?utf-8?B?bFBVYzRIbVpNQWZhUFVnL3JNeGdjejdZdU8wWHlsU0Q5Y3Vtc1pGV0xYeHlm?=
 =?utf-8?B?RGN0QWVaeWwya29Nc21KTjJMSnpNSmx1KythK1FSS1RlMFdKbm02S2hBSmNq?=
 =?utf-8?B?SDRsZGlvbXlmMHQxU3NxOGNNdGg4WXJhR21PNUV3enV5dm55dTlXaCtGRTZy?=
 =?utf-8?B?Vk85WXNTS2NhZDZuK2w2ZGFNbnN5VkF6TjBYdTBadnh0SjQ2c0tRS0pyRmd5?=
 =?utf-8?B?YTJBVFc1b2Nxb0ErUXQ3NHE4NFBqYTNpRGlaM1Y1TCtwT3VDQlQrRlp1NEpw?=
 =?utf-8?B?VURibGNES3NVMUxESU5Xa2t4UjhocWwyekl6ZGFTKzlJekRhMXQrZTY2SXB2?=
 =?utf-8?Q?QvmKz6xUoIhgLs3w3/BOJWGC8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38683b25-8f86-4cee-111f-08dbf5a046e8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 14:41:33.8218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BjhDrvueMtyd1zf0awyeFBepoHRQ5yclkRUF6uSVmpvG5H1Ffhjlad4Sp5WkfiRCrgKoDOUTkduJzW76MERpXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6668
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
Cc: javierm@redhat.com, amd-gfx@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-12-04 04:07, Thomas Zimmermann wrote:
> Remove unnecessary include statements for <drm/drm_plane_helper.h>.
> The file contains helpers for non-atomic code and should not be
> required by most drivers. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index aa43f1761acd3..b8c3a9b104a41 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -92,7 +92,6 @@
>  #include <drm/drm_vblank.h>
>  #include <drm/drm_audio_component.h>
>  #include <drm/drm_gem_atomic_helper.h>
> -#include <drm/drm_plane_helper.h>
>  
>  #include <acpi/video.h>
>  

