Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 886DD602F07
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 16:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A935310E8DC;
	Tue, 18 Oct 2022 14:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2064.outbound.protection.outlook.com [40.107.96.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EDF410E8DC
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 14:58:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XrjJvmG8Z2Mg08yRlhkMbCRMEGttL+PQ3uUUd7DVI5cDyglxhctq2hkj8fnbq+L0WLSvaxkP0Ot7WubY1VwTvLV3xKthV0DcQKVpmgcPnPMiDlTaWI8UPczWLE/zt7c59mXgSRGL1QxCQGUTbKaETqgSNdAGTIxMT5nMmct7bCDK4W3TwXzRn3iUbAN2vw2ZNPsLPc547RxeJ2eT2ZiQYly9o0yG5cKSfEGzDxdR/bWmquHuXJZAIvVflb3hQo90nM/6uU7qcu24QlPUjBNDMwZ8E6sfO4xkU4T3FDpXLrMPUVrwO8g6nVsc67Jmsa1tp2s0uqBds6CribQNoja0dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qHuQ4i9NmH6mm6vd3GxmI89ceJXlRDQi04PLadC3t5c=;
 b=e43LpJwkHRyV/MrIhve0WmGV7U67bs41UJTpD9hEoNG33AAo1kuxLohAe/roNT6CjHulcjl1roFmGjxw3TDQK1oUCI3Ddzu/Y1s405p61a398lM/KGErdNohxHalJgNwTryFzmFy79p+tP07OChq+1oUyjEEkY0o9RRDXOgOCS1GEauODUN0yEA/43r3qNpYXcEOvrhBwhJpHBgy6D0Z490PAJJY/3LmQMl+FCN/GnOwEvk/w1lpzZVApC3bPwDGEJHueIrzTeR+7HWVUAF9YI5JlkDb92vhuU6YJs9lxervCLooQp/d1MmwM3kbXNqF8MsVaLzJmCXUJm7VpWpeLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHuQ4i9NmH6mm6vd3GxmI89ceJXlRDQi04PLadC3t5c=;
 b=j2+hyiT9UolwQttqNRegjhesUJSM8xrmQ9Z40a/pfnwAgOligxF+mZlhJQw87SyDXRQlghIaS9Q/3M9O3gz35KioOFmSzKqlUY9OAYCH2rEcaG9VK3Ka1nNxQoCRgeGuolN/fz4Qp3ZzTHhww6NpWef2s6lmKbsbYCB0hkbW45w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS0PR12MB7512.namprd12.prod.outlook.com (2603:10b6:8:13a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Tue, 18 Oct
 2022 14:58:51 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644%6]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 14:58:51 +0000
Message-ID: <d7306d12-57cf-b66f-90e6-8ede589de762@amd.com>
Date: Tue, 18 Oct 2022 16:58:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm: Remove drm_mode_config::fb_base
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20221018131754.351957-1-zack@kde.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221018131754.351957-1-zack@kde.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P193CA0142.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::47) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS0PR12MB7512:EE_
X-MS-Office365-Filtering-Correlation-Id: 2739427d-a446-43cf-db10-08dab11944d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 195fAL/pYief3adToc87IdRMan4y0t2QDNh5Z+05vKObVH2APm7AyHUyCOOkstX0MmhVkxKRGKLV6Y3raqdWrjT/xKKrEyCb+0f0nSDulXWYZ9eLcAgo9tifPRDOhMuBpRkvI+p+a5KsjMjB0aMmintLX6k6BJCskSgdotxTD1Z86NcY1Uu+LPRXnV07a0K+GSylBbGlTwiVuAmPWwxbsPv2SR3qQuj9HeAh6ezz4ZgXR9tzs6ajqslhhA8J92fzU004KSanQkeNI1ozFdt37bRamIp1Z7Ek+dQZ3DQl2uo/J2+jH0Rv9YdoA/429q80FDXoP3uPNQ0u5QZllYFgZT0vhG6RP5g5sPCKfRtyY3CTsERe1h4uWLf2aI8MyJgROALLwFWpWN9sMU1l5YEZhz6jXCDq3zO70S5HclikGYnuP0Xyk+2LShrMedVdBHfKW2+vPMGmS3b7IR6dGLuYvbupvQHSbRU6IZN+S8/GsB4kqZSpgRS5ZrpP9pyxKv3qsxYrnJ9w5/0KbBqxQY7ssdLsHIi7pO5Aim336Tvp7k+uFcprZmogwSK3gNX+E+F5ZjlqQBlTzyUP/u2/sMSSaSjDVVWDRDWAhfVVRK6yphdx1jYfXXNh35OWK+OwkL3oNy0rxAIXi8IUJXk2CHoIP4EyB1WB2xGKgEZ8GrXnDqGnihAShrsdawnSERSEx29hklWWerMvMVgN7ZUn1A+3VDHStCzOhdLhnExDMoC0no4SjezOjsOxkNmbCON+smMT1OCiHJ9fVLJF2XcvKTqjf4pDaWj29umWTRYobF2HcdE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199015)(36756003)(31686004)(2616005)(31696002)(86362001)(2906002)(30864003)(7406005)(7416002)(5660300002)(54906003)(38100700002)(66574015)(186003)(6486002)(83380400001)(66476007)(6506007)(316002)(478600001)(6512007)(66946007)(66556008)(8936002)(41300700001)(4326008)(6666004)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekVKTEltQWU2V3NxYytYdDFjUG5Tdk9mc1djUUwvbmYyTzA2QmFZMDZDMHEw?=
 =?utf-8?B?YkdKeFJpcHkxaWozcWJkVjkzaDV6RzhtbkRhNVdFUndEMmdpL0FkRUR5NUxH?=
 =?utf-8?B?L01wajZCNGxabzk0MkRjblFIRHF1bDlzcjArcXFGNHVaWUZYU2hxcjB6MVBa?=
 =?utf-8?B?VllBUkRDeGE0NXFpRWV1SFBUZzV5REpNK0pxZXIzUElyTjFpbGhMQkxaTWhi?=
 =?utf-8?B?QWZGYXBadE1Za3ljeS8xakZNYU54dkhZd0lsT3RXVmd0ZndpUUJISkkvMzBY?=
 =?utf-8?B?TVgwb1AvTVdxRTQzcUFTS1lQcjFrbzB6cE42NkNwQkpMM0IrMEdKUm1iOG9m?=
 =?utf-8?B?aFY2SmVrUEttRHIzenZnd2JsMGJRNVVwdllPQTgzUndmaU1Jb1Q3aDNtZGx1?=
 =?utf-8?B?bjUwVWUxdUxyUTF5RUxpczR1UDMweFZFMnlSRW9pbmREdkRkNWs1d1p4V2ta?=
 =?utf-8?B?NUJTUnhITUcxY3JrbkM0NGxuNEZxQ2hwSzByQmhIVHpuNDdkZnUrRmM2V3Q2?=
 =?utf-8?B?UnA5QnFSMHU1V1djQjdQcSs4QUE4bzhTbFhPUE5tR3hKVXNrZnpyQURFYlBj?=
 =?utf-8?B?aVR4d0RFN1NmY25FRVMzT1haeWthUGx1SXYycHp0M2gyY1djZWk3TFhXcjE4?=
 =?utf-8?B?cEJWd2IwVmthNWY2N0YxTkpMM0JYUkdKNUp0cGFOdE5jUjJXM0NUMVpUOXlj?=
 =?utf-8?B?SW8vcjc5SmVWSE9BQlU3VGVVWGU3bzcwTWp3QzRDeFhHOWs1ck4zNkhmMGV2?=
 =?utf-8?B?dGNocUdTR3MyM2RpWmxVemwwUFNJM0RXZ0k0bjNKamUydkY2Z0JZZmVnZUta?=
 =?utf-8?B?SzlUaG5UK2s3YjVFQXNJL3E4Y3JBRlNjenB5Qk9qY1BiWm1MZzQvUHM4VC9l?=
 =?utf-8?B?YThnSTlKTURuMFM3ZThaTlBXTHVyMTVRdFhWbTM2czZZbnJ4ZVlReDN3YUs3?=
 =?utf-8?B?a0xWVnNURDdyYy9WN3VXK0NEbGFKdEZ1WmNZOW51UzQ1QURTdmtWSzlHazUw?=
 =?utf-8?B?cUxnQTBNUmE1azdxODJ3ZitDanNJVXdTeEgwdFoybEVqN1Bib1MwZlNneGVW?=
 =?utf-8?B?VCt3ZWlBUUZzaUwzdW5TS0xXL0JhSm5CWm9jRHVSaWpXR1dXdWJQMDlKckRY?=
 =?utf-8?B?Y1p1U0lhaVpsMmluTmhzb3pxUTBPYXlrOG42VHI5WjNpMUFEY0RjYml6U3VB?=
 =?utf-8?B?MksvQTZvRG5QNDNkaCtLYkx6VUxTVjhDcndsbjB5OFQ1cmtxUmhWVUZFKzZX?=
 =?utf-8?B?UVZYNENaQUhaN1BhYWZJVVJmTUlhS0xyVTNMVmVlY096UW9HK1pjZW1Uelor?=
 =?utf-8?B?RnYwNUovOXNRRktObjdBcDlCTW9yOW9udXRVaXNWVmlndXhNem1TUXpET2lr?=
 =?utf-8?B?bGhreTQvdXVUdk41Mjg0OEZ6RmR5M2NqRHpYdXpMSElHeTVrSllxdU9iWUdv?=
 =?utf-8?B?TVZGQkU5YjQvbHVMenRScERPNUpNYmROMzFsWmRtNVNDanNHTFlyU2dxZzlR?=
 =?utf-8?B?WHEvQ2xIenFtUEJvcHk0QzBrK04wWlVvOGJKTUdpV1pXWjZaZjhMSUxVU1ox?=
 =?utf-8?B?WSsvb2phMDNpL09FbUFiUDVqN2RvZEV4WWkwenN6bFNMZ3hSMy9jR1h3ZzBj?=
 =?utf-8?B?TDlXZDF1K1VkOWVrV2lzRFp5MGIxSFNsZGdxcm11a29VNi9kcGpjR3ZzMUUy?=
 =?utf-8?B?NCsvZmNRSmh4N1dNQWorMlViak8rWUFDQjVvb0drY2pWcW5vazFKVmFZZ05u?=
 =?utf-8?B?cnhXcXRhQXA2Q3U3cDFaMW9XeXhjWTc1Y28rU1lHZmRIdXhwNnhoTG4vTmNj?=
 =?utf-8?B?ci9ocDlJb0M1Mkt0dGNJMTU3ajJ3M0tCbHVZRHJxUUI3Zm1tWE1ZbjludENE?=
 =?utf-8?B?WFJJL0lPNTlTcnJRNlJUZm91VndoUXJDdzRIc2c4Mm1nRnhlUDZ5aXFFYkNr?=
 =?utf-8?B?MHV1TkxPcmZxNHNidTZNMlVtRnVTZ3lTdUpqUGdwemRVZ3NNdFVsNXIxL2lh?=
 =?utf-8?B?azA4aFVLUXp6dWVqdDV3SG1PTzNJZjkvUWE3WndQaEprZWVwVDc2VFErUm9M?=
 =?utf-8?B?OTU4Q0RTd0svSU82bEV5OExwOHZickFIckF5ZHZaRTN3Q3RGL20zSnlpMzBw?=
 =?utf-8?B?MVBocnUxY2U0enlGb2QwTHE2UUtQaG5OeWJnTURFUGpvWHVUZ2VkbDN3cWsz?=
 =?utf-8?Q?iqBWNBwzSzNnOQtMFeriVNvirRCO6uEWz9p2MR40Uv7a?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2739427d-a446-43cf-db10-08dab11944d6
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 14:58:51.5764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8AmnK4tL2/1ZLruMpbiQ87S3KvtFBbhnCgIQ27Ywfd2p3XKEvgb8Uq6LogoKpj0J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7512
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
Cc: Karol Herbst <kherbst@redhat.com>, Xinliang Liu <xinliang.liu@linaro.org>,
 Lijo Lazar <lijo.lazar@amd.com>, Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 Thierry Reding <thierry.reding@gmail.com>, John Stultz <jstultz@google.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Flora Cui <flora.cui@amd.com>, Tomohito Esaki <etom@igel.co.jp>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Guchun Chen <guchun.chen@amd.com>, Bernard Zhao <bernard@vivo.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Leo Li <sunpeng.li@amd.com>,
 Chen Feng <puck.chen@hisilicon.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Alex Deucher <alexander.deucher@amd.com>, Leslie Shi <Yuliang.Shi@amd.com>,
 Evan Quan <evan.quan@amd.com>, Sean Paul <sean@poorly.run>,
 Tomi Valkeinen <tomba@kernel.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Roman Li <roman.li@amd.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Tian Tao <tiantao6@hisilicon.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.10.22 um 15:17 schrieb Zack Rusin:
> From: Zack Rusin <zackr@vmware.com>
>
> The fb_base in struct drm_mode_config has been unused for a long time.
> Some drivers set it and some don't leading to a very confusing state
> where the variable can't be relied upon, because there's no indication
> as to which driver sets it and which doesn't.
>
> The only usage of fb_base is internal to two drivers so instead of trying
> to force it into all the drivers to get it into a coherent state
> completely remove it.
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>

Since that address is completely driver specific to begin with it 
doesn't make to much sense to keep it int a common structure anyway.

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c          | 2 --
>   drivers/gpu/drm/amd/amdgpu/dce_v10_0.c            | 2 --
>   drivers/gpu/drm/amd/amdgpu/dce_v11_0.c            | 2 --
>   drivers/gpu/drm/amd/amdgpu/dce_v6_0.c             | 1 -
>   drivers/gpu/drm/amd/amdgpu/dce_v8_0.c             | 2 --
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 --
>   drivers/gpu/drm/ast/ast_mode.c                    | 1 -
>   drivers/gpu/drm/gma500/framebuffer.c              | 6 +++---
>   drivers/gpu/drm/gma500/psb_drv.h                  | 1 +
>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   | 1 -
>   drivers/gpu/drm/mgag200/mgag200_mode.c            | 1 -
>   drivers/gpu/drm/msm/msm_fbdev.c                   | 2 --
>   drivers/gpu/drm/nouveau/nouveau_display.c         | 1 -
>   drivers/gpu/drm/nouveau/nv04_fbcon.c              | 6 ++++--
>   drivers/gpu/drm/omapdrm/omap_fbdev.c              | 2 --
>   drivers/gpu/drm/qxl/qxl_display.c                 | 2 --
>   drivers/gpu/drm/radeon/radeon_display.c           | 2 --
>   drivers/gpu/drm/radeon/radeon_fb.c                | 1 -
>   drivers/gpu/drm/tegra/fb.c                        | 1 -
>   drivers/gpu/drm/tiny/bochs.c                      | 1 -
>   include/drm/drm_mode_config.h                     | 2 --
>   21 files changed, 8 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> index f4b5301ea2a0..09dec2561adf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> @@ -498,8 +498,6 @@ static int amdgpu_vkms_sw_init(void *handle)
>   	adev_to_drm(adev)->mode_config.preferred_depth = 24;
>   	adev_to_drm(adev)->mode_config.prefer_shadow = 1;
>   
> -	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
> -
>   	r = amdgpu_display_modeset_create_props(adev);
>   	if (r)
>   		return r;
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> index 288fce7dc0ed..05051d5d2ec3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> @@ -2800,8 +2800,6 @@ static int dce_v10_0_sw_init(void *handle)
>   
>   	adev_to_drm(adev)->mode_config.fb_modifiers_not_supported = true;
>   
> -	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
> -
>   	r = amdgpu_display_modeset_create_props(adev);
>   	if (r)
>   		return r;
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> index cbe5250b31cb..c928bc9eb202 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> @@ -2918,8 +2918,6 @@ static int dce_v11_0_sw_init(void *handle)
>   
>   	adev_to_drm(adev)->mode_config.fb_modifiers_not_supported = true;
>   
> -	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
> -
>   	r = amdgpu_display_modeset_create_props(adev);
>   	if (r)
>   		return r;
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> index b1c44fab074f..62315fd5a05f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> @@ -2675,7 +2675,6 @@ static int dce_v6_0_sw_init(void *handle)
>   	adev_to_drm(adev)->mode_config.preferred_depth = 24;
>   	adev_to_drm(adev)->mode_config.prefer_shadow = 1;
>   	adev_to_drm(adev)->mode_config.fb_modifiers_not_supported = true;
> -	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
>   
>   	r = amdgpu_display_modeset_create_props(adev);
>   	if (r)
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> index a22b45c92792..87d5e4c21cb3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> @@ -2701,8 +2701,6 @@ static int dce_v8_0_sw_init(void *handle)
>   
>   	adev_to_drm(adev)->mode_config.fb_modifiers_not_supported = true;
>   
> -	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
> -
>   	r = amdgpu_display_modeset_create_props(adev);
>   	if (r)
>   		return r;
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index c053cb79cd06..0db2a88cd4d7 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3816,8 +3816,6 @@ static int amdgpu_dm_mode_config_init(struct amdgpu_device *adev)
>   	/* indicates support for immediate flip */
>   	adev_to_drm(adev)->mode_config.async_page_flip = true;
>   
> -	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
> -
>   	state = kzalloc(sizeof(*state), GFP_KERNEL);
>   	if (!state)
>   		return -ENOMEM;
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 4355754d69b5..1a01208d53d9 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1778,7 +1778,6 @@ int ast_mode_config_init(struct ast_private *ast)
>   	dev->mode_config.min_width = 0;
>   	dev->mode_config.min_height = 0;
>   	dev->mode_config.preferred_depth = 24;
> -	dev->mode_config.fb_base = pci_resource_start(pdev, 0);
>   
>   	if (ast->chip == AST2100 ||
>   	    ast->chip == AST2200 ||
> diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
> index aa3ecf771fd3..5f502a0048ab 100644
> --- a/drivers/gpu/drm/gma500/framebuffer.c
> +++ b/drivers/gpu/drm/gma500/framebuffer.c
> @@ -286,7 +286,7 @@ static int psbfb_create(struct drm_fb_helper *fb_helper,
>   
>   	info->fbops = &psbfb_unaccel_ops;
>   
> -	info->fix.smem_start = dev->mode_config.fb_base;
> +	info->fix.smem_start = dev_priv->fb_base;
>   	info->fix.smem_len = size;
>   	info->fix.ywrapstep = 0;
>   	info->fix.ypanstep = 0;
> @@ -296,7 +296,7 @@ static int psbfb_create(struct drm_fb_helper *fb_helper,
>   	info->screen_size = size;
>   
>   	if (dev_priv->gtt.stolen_size) {
> -		info->apertures->ranges[0].base = dev->mode_config.fb_base;
> +		info->apertures->ranges[0].base = dev_priv->fb_base;
>   		info->apertures->ranges[0].size = dev_priv->gtt.stolen_size;
>   	}
>   
> @@ -527,7 +527,7 @@ void psb_modeset_init(struct drm_device *dev)
>   
>   	/* set memory base */
>   	/* Oaktrail and Poulsbo should use BAR 2*/
> -	pci_read_config_dword(pdev, PSB_BSM, (u32 *)&(dev->mode_config.fb_base));
> +	pci_read_config_dword(pdev, PSB_BSM, (u32 *)&(dev_priv->fb_base));
>   
>   	/* num pipes is 2 for PSB but 1 for Mrst */
>   	for (i = 0; i < dev_priv->num_pipe; i++)
> diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
> index ae544b69fc47..a5df6d2f2cab 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.h
> +++ b/drivers/gpu/drm/gma500/psb_drv.h
> @@ -523,6 +523,7 @@ struct drm_psb_private {
>   	uint32_t blc_adj2;
>   
>   	struct drm_fb_helper *fb_helper;
> +	resource_size_t fb_base;
>   
>   	bool dsr_enable;
>   	u32 dsr_fb_update;
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index fe4269c5aa0a..2293038755c5 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -105,7 +105,6 @@ static int hibmc_kms_init(struct hibmc_drm_private *priv)
>   	dev->mode_config.max_width = 1920;
>   	dev->mode_config.max_height = 1200;
>   
> -	dev->mode_config.fb_base = priv->fb_base;
>   	dev->mode_config.preferred_depth = 32;
>   	dev->mode_config.prefer_shadow = 1;
>   
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index 758629da95d9..0a5aaf78172a 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -824,7 +824,6 @@ int mgag200_mode_config_init(struct mga_device *mdev, resource_size_t vram_avail
>   	dev->mode_config.max_width = MGAG200_MAX_FB_WIDTH;
>   	dev->mode_config.max_height = MGAG200_MAX_FB_HEIGHT;
>   	dev->mode_config.preferred_depth = 24;
> -	dev->mode_config.fb_base = mdev->vram_res->start;
>   	dev->mode_config.funcs = &mgag200_mode_config_funcs;
>   	dev->mode_config.helper_private = &mgag200_mode_config_helper_funcs;
>   
> diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
> index 46168eccfac4..b373e3000320 100644
> --- a/drivers/gpu/drm/msm/msm_fbdev.c
> +++ b/drivers/gpu/drm/msm/msm_fbdev.c
> @@ -109,8 +109,6 @@ static int msm_fbdev_create(struct drm_fb_helper *helper,
>   
>   	drm_fb_helper_fill_info(fbi, helper, sizes);
>   
> -	dev->mode_config.fb_base = paddr;
> -
>   	fbi->screen_base = msm_gem_get_vaddr(bo);
>   	if (IS_ERR(fbi->screen_base)) {
>   		ret = PTR_ERR(fbi->screen_base);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> index a2f5df568ca5..928fdfa8e8e5 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -672,7 +672,6 @@ nouveau_display_create(struct drm_device *dev)
>   	drm_mode_create_dvi_i_properties(dev);
>   
>   	dev->mode_config.funcs = &nouveau_mode_config_funcs;
> -	dev->mode_config.fb_base = device->func->resource_addr(device, 1);
>   
>   	dev->mode_config.min_width = 0;
>   	dev->mode_config.min_height = 0;
> diff --git a/drivers/gpu/drm/nouveau/nv04_fbcon.c b/drivers/gpu/drm/nouveau/nv04_fbcon.c
> index 92f3fb6765ab..c30b8dacd86b 100644
> --- a/drivers/gpu/drm/nouveau/nv04_fbcon.c
> +++ b/drivers/gpu/drm/nouveau/nv04_fbcon.c
> @@ -137,6 +137,8 @@ nv04_fbcon_accel_init(struct fb_info *info)
>   	struct nouveau_channel *chan = drm->channel;
>   	struct nvif_device *device = &drm->client.device;
>   	struct nvif_push *push = chan->chan.push;
> +	struct nvkm_device *nvkm_device = nvxx_device(&drm->client.device);
> +	resource_size_t fb_base = nvkm_device->func->resource_addr(nvkm_device, 1);
>   	int surface_fmt, pattern_fmt, rect_fmt;
>   	int ret;
>   
> @@ -210,8 +212,8 @@ nv04_fbcon_accel_init(struct fb_info *info)
>   			       0x0188, chan->vram.handle);
>   	PUSH_NVSQ(push, NV042, 0x0300, surface_fmt,
>   			       0x0304, info->fix.line_length | (info->fix.line_length << 16),
> -			       0x0308, info->fix.smem_start - dev->mode_config.fb_base,
> -			       0x030c, info->fix.smem_start - dev->mode_config.fb_base);
> +			       0x0308, info->fix.smem_start - fb_base,
> +			       0x030c, info->fix.smem_start - fb_base);
>   
>   	PUSH_NVSQ(push, NV043, 0x0000, nfbdev->rop.handle);
>   	PUSH_NVSQ(push, NV043, 0x0300, 0x55);
> diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> index 40706c5aad7b..ed67dd25794c 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> @@ -177,8 +177,6 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
>   
>   	drm_fb_helper_fill_info(fbi, helper, sizes);
>   
> -	dev->mode_config.fb_base = dma_addr;
> -
>   	fbi->screen_buffer = omap_gem_vaddr(fbdev->bo);
>   	fbi->screen_size = fbdev->bo->size;
>   	fbi->fix.smem_start = dma_addr;
> diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
> index a152a7c6db21..6492a70e3c39 100644
> --- a/drivers/gpu/drm/qxl/qxl_display.c
> +++ b/drivers/gpu/drm/qxl/qxl_display.c
> @@ -1261,8 +1261,6 @@ int qxl_modeset_init(struct qxl_device *qdev)
>   	qdev->ddev.mode_config.max_width = 8192;
>   	qdev->ddev.mode_config.max_height = 8192;
>   
> -	qdev->ddev.mode_config.fb_base = qdev->vram_base;
> -
>   	drm_mode_create_suggested_offset_properties(&qdev->ddev);
>   	qxl_mode_create_hotplug_mode_update_property(qdev);
>   
> diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
> index ca5598ae8bfc..9bed1a6cb163 100644
> --- a/drivers/gpu/drm/radeon/radeon_display.c
> +++ b/drivers/gpu/drm/radeon/radeon_display.c
> @@ -1604,8 +1604,6 @@ int radeon_modeset_init(struct radeon_device *rdev)
>   
>   	rdev->ddev->mode_config.fb_modifiers_not_supported = true;
>   
> -	rdev->ddev->mode_config.fb_base = rdev->mc.aper_base;
> -
>   	ret = radeon_modeset_create_props(rdev);
>   	if (ret) {
>   		return ret;
> diff --git a/drivers/gpu/drm/radeon/radeon_fb.c b/drivers/gpu/drm/radeon/radeon_fb.c
> index 6ccea51d4072..df33e3a87c92 100644
> --- a/drivers/gpu/drm/radeon/radeon_fb.c
> +++ b/drivers/gpu/drm/radeon/radeon_fb.c
> @@ -276,7 +276,6 @@ static int radeonfb_create(struct drm_fb_helper *helper,
>   	drm_fb_helper_fill_info(info, &rfbdev->helper, sizes);
>   
>   	/* setup aperture base/size for vesafb takeover */
> -	info->apertures->ranges[0].base = rdev->ddev->mode_config.fb_base;
>   	info->apertures->ranges[0].size = rdev->mc.aper_size;
>   
>   	/* Use default scratch pixmap (info->pixmap.flags = FB_PIXMAP_SYSTEM) */
> diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
> index 9291209154a7..bce71c0ccc9e 100644
> --- a/drivers/gpu/drm/tegra/fb.c
> +++ b/drivers/gpu/drm/tegra/fb.c
> @@ -280,7 +280,6 @@ static int tegra_fbdev_probe(struct drm_fb_helper *helper,
>   		}
>   	}
>   
> -	drm->mode_config.fb_base = (resource_size_t)bo->iova;
>   	info->screen_base = (void __iomem *)bo->vaddr + offset;
>   	info->screen_size = size;
>   	info->fix.smem_start = (unsigned long)(bo->iova + offset);
> diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
> index a51262289aef..04682f831544 100644
> --- a/drivers/gpu/drm/tiny/bochs.c
> +++ b/drivers/gpu/drm/tiny/bochs.c
> @@ -543,7 +543,6 @@ static int bochs_kms_init(struct bochs_device *bochs)
>   	bochs->dev->mode_config.max_width = 8192;
>   	bochs->dev->mode_config.max_height = 8192;
>   
> -	bochs->dev->mode_config.fb_base = bochs->fb_base;
>   	bochs->dev->mode_config.preferred_depth = 24;
>   	bochs->dev->mode_config.prefer_shadow = 0;
>   	bochs->dev->mode_config.prefer_shadow_fbdev = 1;
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 6b5e01295348..5362702fffe1 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -345,7 +345,6 @@ struct drm_mode_config_funcs {
>    * @max_width: maximum fb pixel width on this device
>    * @max_height: maximum fb pixel height on this device
>    * @funcs: core driver provided mode setting functions
> - * @fb_base: base address of the framebuffer
>    * @poll_enabled: track polling support for this device
>    * @poll_running: track polling status for this device
>    * @delayed_event: track delayed poll uevent deliver for this device
> @@ -542,7 +541,6 @@ struct drm_mode_config {
>   	int min_width, min_height;
>   	int max_width, max_height;
>   	const struct drm_mode_config_funcs *funcs;
> -	resource_size_t fb_base;
>   
>   	/* output poll support */
>   	bool poll_enabled;

