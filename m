Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0513F6AB166
	for <lists+dri-devel@lfdr.de>; Sun,  5 Mar 2023 17:40:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0AD910E300;
	Sun,  5 Mar 2023 16:40:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D1E10E2FF;
 Sun,  5 Mar 2023 16:40:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZrCcnYdHQ6fHWoSPWpcfF4QRHFyszjP8V1EU3LCQpX5pB05PvNi4Sr4xP1P0S3SihK+5Se91VK3al33OkXBnn7JgleWHjgl6JadjRF0QCvpBOSHKDwi/Bg+1A1ttBsh03Y63z40abBnNs3TOH2uf1+loE5leqgpTZmoF2hETtGXDy8RdfW8XyLtJOZ0RN1mZ0FNF2asZLPDHxo1ePrnrqvsN2wHM6G8fWHZ83QWQfPHrtpyFb+XVBvWQI7sqn16JGGKp5jhAqEmWWl36/zGwT+Bez+jn4RNRk3BvKbitbmgQ8E61N5Hsd+GiFwNivHqeWn7TpfQXr5RM3eyIGScVkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5m58MgK+1uSeLVT3JwfVkhgAo+f2sP2gsxksyjHKlgE=;
 b=XQ6yyAIDx+YjWUcG6irJBddxeG6d4QLmrHE/M/vPoozm0plaanhusFD7oa5KDBEOHKiTt4X/nMYygcj584LkFVwdboMjTjumhqrTdaWRbsh37qqXwYzdB7mJ+Jbaxepk56FtZmFzd7IZhzqB3hBJRlOizRd9tvNPG3iWXD1OLSEuKnZWNTVA/5ORUvd+ZuuuhC0MYfBlehm9ZZCO6Kh4jkx7BQsCyoj+SMNb7fBdL3lJ2uD/6OTvORwbrYXZBOAdM/ucbEBBZ+I1xgCzUGxWAPD8GcZq/bU/H3xetxU5YYUEuBLpsrfPLKjHofQQjztQhg3svt8PcFeKInq09EFUAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5m58MgK+1uSeLVT3JwfVkhgAo+f2sP2gsxksyjHKlgE=;
 b=bfpTsFJJ1BeJaDc+r7r2/zwpAsOeGsb4gQuawdfLeCeEmc57pA9lL3tLCwNVIQoB1iRVPx2CIcUf12jsWzUA6AbY1Sg7mvtgAzMX9qmv+gqYdJbbTno3Q62Ha/DsMDIi8za27Zew6SWvX9MYEaEbybaTAidGb7CKaNIRcUC2WqE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL1PR12MB5288.namprd12.prod.outlook.com (2603:10b6:208:314::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.27; Sun, 5 Mar
 2023 16:40:29 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6156.026; Sun, 5 Mar 2023
 16:40:29 +0000
Message-ID: <8554af4a-5592-2102-7c8c-21f4dec3aff2@amd.com>
Date: Sun, 5 Mar 2023 17:40:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/amdgpu: Use uncached ioremap() for LoongArch
Content-Language: en-US
To: Huacai Chen <chenhuacai@loongson.cn>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@linux.ie>
References: <20230305052137.4030323-1-chenhuacai@loongson.cn>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230305052137.4030323-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BL1PR12MB5288:EE_
X-MS-Office365-Filtering-Correlation-Id: c16e8ab4-3885-4865-b6f9-08db1d985462
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jDlTI7t06Nk5nfNBnZJFf8yPLsBExnwTocvxd+yH4X8Qg3uO5Iu6PRsydzaGZ10Oey6GKNTh7/TRPhCEHANolKXNY2L9hxVhbWbiFBPmnRdlkPcSSZw9bH0u4tG9LAZgHCnqVNvGkk6h59o9eJ9Go9ON1w6L6Osa15DExkX7hHfOPGCaFYC95kcZrt8QSIG06gMsrrKrH4bGpwGnhZHvo//Iz77lBMr6vS45VtWQellSoBrAnM8VNyHeuO+L2vjbFNnNzE/mc7eVJjunlKt7/zahpru1n4HPKa+GFdxFFkjT+AWdSVEM4iT/O7SJ6FbfspcNE1XfdH/P8/w8CAGp1C3t6/YVrfF2t1aAcsBMx/yCBha8iNkiwfxHcSQAl7T7m2bu0uMJd4JjZlYgsv5R2W6Y6QTWmcfF5soPR9NqUKO2dAddVQx3rosgTgR7Sgmfl3/EpL+5Ayuxz8deZ992cuFW8igxAQKB8MbRMiD2p/N0rAkU7sISOSZF5/XWmi79TNqiF1aAPhfZ+pD9T6P44OALkVb0ve9lQSx0zrfShCcr9c2/PVuaexIzZNwdL/m4FazO6C6lWdG5wnsjx/tTLarnKmdfZuT/sOV4uMCErJvy8birt7g2h9+k2UmZnnx2Wpgq51ZaN1ZKlO+bt1/wA75bqjbF6CIrl84e3wwjuhc65CXePwZY1AW/IL2NGQ6NGsCO8OuHXGiiG3UgGP9f/xRdO12FFvndntvX6QKYhlo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(39860400002)(396003)(136003)(346002)(366004)(451199018)(38100700002)(6486002)(5660300002)(2906002)(31686004)(6512007)(6506007)(186003)(2616005)(6666004)(31696002)(478600001)(4326008)(8676002)(66556008)(66946007)(66476007)(86362001)(36756003)(41300700001)(8936002)(316002)(83380400001)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZS9ydWlaYVZzcFhlNjI3YVFpNHVBQm8wOUNuK1ZseVdyNHI1U0srUWJER1pQ?=
 =?utf-8?B?Ty9od0NRLzZWY0NNR2xENUZqUjE0N0xjNktxTjlrb1Q5NytSUVg5VWF2TlpR?=
 =?utf-8?B?T1hPWEJGaEpxaS9EQW82Q2cyZUgveU1jRHZMb2RhdnkzT0sxK2FiOUtkRjFT?=
 =?utf-8?B?NU00VERwVzVreitsd0VZdENhRHNtc3N6Z1hiaTZlcmtEWjk0elFzWXdJTTJF?=
 =?utf-8?B?Q1pWNktrYjRmZ25QbzUzYS9IZW9JMEZabDdwRTVBVzl4UmlQSE9iekordHpk?=
 =?utf-8?B?UlRTMmsxajB2T2wvYm5UT1JWcm1lREZHN1RyZitMUWxHcm90VW15c013SjlJ?=
 =?utf-8?B?Y3pqVHVtVklYMUkweWtHQVZ1UU41WEJaTHFlbTNoOEhnMmFia1ZCY1ZONzg5?=
 =?utf-8?B?Q2llSGJpYjN3ZGg3T05TSmNCOHJQcUxtSlpwNVROcStsM3drQVVXQTlRVDZy?=
 =?utf-8?B?cWpIcHl2UmEwdlo5elNvcmRiNUNuVkwrZXF6U3VaOVJGQXhlKy9mdVpJM2l6?=
 =?utf-8?B?bUVJUmhTOXJjenV4VDM3dWdteitRK1B0ak96TG5wamFaQXEyWVBqMEFHd0Yw?=
 =?utf-8?B?RDB1bG93d09pR1RIR0RNNDNxNS81YUlYWkR3Z2FVRFVqN2R1aTFMTUlDWEdr?=
 =?utf-8?B?dHNFaXpKVFk2SHZrVTFMVkNoSFE4RjB6NSt3Ry9YMm9MbzBlcWpwK1g1VHBY?=
 =?utf-8?B?cWhGNHk3S3IwVDl0QUZRZE4vbnB6ZzYyRVJXb0FRNVJDUDdGb3ZGVmdWRFpT?=
 =?utf-8?B?OXdvZVlHSlBRVmlVek84Q1RyR2FBS0tHTGFhZFpmdnp1ckdoQ3hiSGswSFZB?=
 =?utf-8?B?elFUOUlvY1NIVzhSR0ZrRERYZXJCTk5jMzZ4REJvYkFpZmFBZGxkbEFRS1FI?=
 =?utf-8?B?RXkrUmQ3RHlOTmxQVDQ1ellJOTRWM0REZFN6MCtVN1c2SnErSVcvcXdOYWZu?=
 =?utf-8?B?K1UrUkh1d0sxYVhhRTY1ditMdjJxdTFxV1ZPOE10Nys1TEMxUDhEdytsNlda?=
 =?utf-8?B?QStUT1NsZklIT1IxbzdMdUhGS05PRnROenUvbjU5WUhpaVF3aStHR2xyQTRY?=
 =?utf-8?B?emNTem9tWkNKUmRsc2FSWml3UTEzbVVuaGw1Mjdub01QVkhpWmNhMFFoTXNJ?=
 =?utf-8?B?TnUwM1oxczRtZ3F5ckN2bEFoT0NtSFdzQ2dnZzRXeHVrNUkvQnRhRWNSTmlB?=
 =?utf-8?B?U0tYSzgxS2VNZGZVOUNuemNPZHR4Ky9kOW51WDRyME44NVgzcUxvSVpPYnVp?=
 =?utf-8?B?aGZZNWtkK0VJMnF1bm9NYUVjVEphSWd2c3lWdnJhWXNwR2hjVTB2ZGlJVmdM?=
 =?utf-8?B?SUhJK2FLZ0VIMGF5cmpPKzdobVNFVlFicDE1dFk4d1A1VURuZUtuNjBaUXlo?=
 =?utf-8?B?OUxrSGRCcmNoWmZyVlBGMkRzYWVZckN4U0xyb1VoU3RTSk85eTFTS3V4bWxD?=
 =?utf-8?B?YzFwWmttZnJLZUc3SVIrUDluUk5la290YTQrbWt6cURvVUtjQ2gvY2FVQURG?=
 =?utf-8?B?RXkvRUtqeVozYTR3MXJhZGx5NUwzL2lIL0hxUjF6TVlFcTVvcXIrbDR5UG5s?=
 =?utf-8?B?RHl3TEJmeWhCTDVDRUJ1emlhODViY2FVUXl6MnQ5RWUzWHdnNXRzeHNTbXky?=
 =?utf-8?B?dWF3azB3TWRCVWVoVHc2Qy81ME53UWU4UkNZV250eVJkL0t1c2JmTDNZRlBw?=
 =?utf-8?B?OXlDeFR1bzhpTjJSZUszVFRSTGpHVzh5b0crTE9YK1JVdllXaHk0byt5VWdz?=
 =?utf-8?B?Q3A4VklOVVlWUGo5b09rcHY2NlhpeW1GV2lJVDd2dGtPMjY5cHBnTzMrb2Q4?=
 =?utf-8?B?Skg0YjFYN2l5Zy80TVJLNldTTjVZU1ZrWUdyYUhvZnBxaWVRUnd0akh4MWlh?=
 =?utf-8?B?RU9STUFYSHBWazRpZEJrYlZKV1BObHk3NTZ1T2Z4M1VNTlcyWmFxRnEzamxz?=
 =?utf-8?B?SFpYRi9ObHJwaktGL05LZlhFWEgvMEFwUkV3WlQ3YTJXM0tCam9pUk1Ua2Ex?=
 =?utf-8?B?c0VtWEdtekJGaXBOZE5FK09mcDhJWW9sbjJyZUtYR2tiQTRsbzNkSmNyUWdk?=
 =?utf-8?B?TUNndE9pd0JBZGhERlcyQW9kUU43eFBISSt2NHdJaGptRGg0VmpYSUJZNUZo?=
 =?utf-8?B?UXpuTmlxbndDVmpnS2tuWEkreUxkMHA1ZzlHUGRkVVQwYlhZV2JnakQ3MWcy?=
 =?utf-8?Q?CXgaFboDSYR2eLdIHO7Q3vUnUuiVFYqWtt1NXaOcZDSZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c16e8ab4-3885-4865-b6f9-08db1d985462
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2023 16:40:29.3703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /tQzu+qFtZA0jyFuOQPHgSaG8ofumADEA6b/DL0hL8HmSWJ6dsdb2t6De82xWE2z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5288
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
Cc: Xuefeng Li <lixuefeng@loongson.cn>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.03.23 um 06:21 schrieb Huacai Chen:
> LoongArch maintains cache coherency in hardware, but its WUC attribute
> (Weak-ordered UnCached, which is similar to WC) is out of the scope of
> cache coherency machanism. This means WUC can only used for write-only
> memory regions. So use uncached ioremap() for LoongArch in the amdgpu
> driver.

Well NAK. This is leaking platform dependencies into the driver code.

When you have a limitation that ioremap_wc() can't guarantee read/write 
ordering then that's pretty clearly a platform bug and you would need to 
apply this workaround to all drivers using ioremap_wc() which isn't 
really feasible.

The x86 cache dependencies is because the GPU can also be part of the 
CPU in which case PCIe is not used to access the aperture base.

Regards,
Christian.

>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index c5ef7f7bdc15..c6888a58819a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1750,8 +1750,13 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
>   
>   	else
>   #endif
> +#ifdef CONFIG_LOONGARCH
> +		adev->mman.aper_base_kaddr = ioremap(adev->gmc.aper_base,
> +				adev->gmc.visible_vram_size);
> +#else
>   		adev->mman.aper_base_kaddr = ioremap_wc(adev->gmc.aper_base,
>   				adev->gmc.visible_vram_size);
> +#endif
>   #endif
>   
>   	/*

