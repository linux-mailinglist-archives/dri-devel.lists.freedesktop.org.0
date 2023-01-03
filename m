Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B92EB65BDB2
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 11:10:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 170368905A;
	Tue,  3 Jan 2023 10:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2080.outbound.protection.outlook.com [40.107.93.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F0C8905A;
 Tue,  3 Jan 2023 10:10:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oSX6VPGjDkRQXY3U3bdlUU7u+Ja95LoLF6DA6h/RSGA8dnP6WErYR2QesKOGSGoovHuHA5xB/uZCeP9LG0VdkKdhUqQIuOFU0iS12641xQ1nhSBYtFPq/vIwT+hFzwHaKi/kAVX3jYabCsG8D98jwiubzilVNcZoXTCG0O6AIqCobj0uTkeBc9niKEiW/sK+Mh9EuMXGnwMNOJjm8rRqL52d9kWVOCdkZjTCIIM+gd7rMhBAwkxmq521cDeI6tRBwqI35M8O4f4XegWeXk8nsCTn8sQ38wUT5mB9PeUYQBpGxu1WMemg4w3MrcRy8uE9/753DZqd56THxeEbKhoy6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3esy2On/CN2+fHTgCZ5joqXP5Qq1DVDPGPxOI1pMwks=;
 b=ZGAl0IiiBCkSSMcnisXeeNee/XqxSeYM7OFfKs/0cXV+xZRI9BGSDaY8/kw25MMaMue4QLkEA/UxS+yCtMZ+7sPse+/neavujFGHR+okNo1Ll4mDudaRsPrVPvxX3YU01k3aJGT/ZSMK/vsyLMk6DXGmi0+3WoN4QC9gN0AtSrsqcbmlVvK6o3qcShAk47jelKOo0mhj3MXC1D/IITHMKSsbzkxjE+pzYQCTKQ1rW/kdNk1biS45XJvJv7mQmmVIZr3La+ydaRliFRDUUK0PZpQ8qSFeOLStjVDIHx2u9R+xmGeEr31cF9wJSJUthkrlnXjowhme1AQY8ERxaPXqPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3esy2On/CN2+fHTgCZ5joqXP5Qq1DVDPGPxOI1pMwks=;
 b=J5WTtdGLsC16kYl3gZBQ4HQYwx5WVkSUyBmODqsUfnUuEoiJfdymVtO4HzfMCl4oXYP2jga4ps1qOrZQWZqS0N/SAwxm6mUkX+N7jprDYlbKWMtpAXlJgrlx3IcdC9XWsRrMu531eMWIuoBqOWgx0ZiQ/TvFvIzTSTTelEIWEf0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by DS7PR12MB6214.namprd12.prod.outlook.com (2603:10b6:8:96::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 10:10:41 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::457b:5c58:8ad2:40fa]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::457b:5c58:8ad2:40fa%6]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 10:10:41 +0000
Message-ID: <de34e018-679d-893e-683e-5c10cbc9c5b2@amd.com>
Date: Tue, 3 Jan 2023 15:40:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v2 00/11] Recover from failure to probe GPU
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20221228163102.468-1-mario.limonciello@amd.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20221228163102.468-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::31) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4614:EE_|DS7PR12MB6214:EE_
X-MS-Office365-Filtering-Correlation-Id: fe3742e8-f67b-4f32-ae65-08daed72c49a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zTUBHuOJFE2Tc1F9qvXhjKuKTEJN49fpyHfPz9UKnhgoH5wb6Lsvnlqs92KQfr1XrIcWDexdWrep9epTvU6P0Un7U1kzG4K1aMvhuh8jDNgab/6eZ5Zcn7ZZdUCwZTN35FBYnPksUWNW45E2IUvCgT7UAN7HmxwzkLCR9b9WnD/TYm8pf1pY/9ViIuNnL9LJNKMUSvcDfpgOagwsFRE7xBtQiMxj/6/2+m5bIWgwGbdKiYDO6v/V/V9eKhvdy3QSgDNkCRvESDO6Wd7EVcWJCgYZBbOAKbjZUV46L1Ha9qrP+GuUVTcc/oUsGqTvyVGTC1xsyCJS1UTE0xTuH9/txopZU0Mb4dj6SgTko5zmMX2sCZi2h8+UIXSYGN0QZ7FBDLtsKZEBHhX1efYwFDjL9YCtw+q7I+dRiiJtwiSfpVvCFhXWa8gwRwKB4HHiyhyojGi9ZeBOwMJeRBsL+NcjZdIJomK9iAIevLvdhUzUX9t3rBLTVKqZN4k2t3ttl0u2DLJQWR19/LCG70OY2yJUzQB9cukob1bUxcD3yvHxbiaJtaGClRSMVygvcCeFk6fTVMgc2auWD+O97+oa817xdDxFwtyKpIiS7zFr45jxfxdw+YUN3BLFnRXCY5rkpR+gaMe880shpbmo+1Tz6kHn2OBoCQKjXB9LmAnLVRfjYtWGTLuEQlx0IdWifbfb/wVbDxCu9iehNLzJYGhu3YkD2/DIXqO0XhzGstjC9cx006EkG24Nowp0YYaoKmvhbm79
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(136003)(366004)(39860400002)(346002)(451199015)(6506007)(6666004)(53546011)(36756003)(110136005)(478600001)(86362001)(38100700002)(31696002)(6512007)(26005)(186003)(83380400001)(6486002)(2616005)(5660300002)(31686004)(8676002)(66476007)(4326008)(66556008)(8936002)(66946007)(41300700001)(316002)(6636002)(54906003)(2906002)(22166006)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckpyejFaZm9CTlZHZkgvMEZzVHoyOGpmbzRXNHpIcS9UZUwrZkRac2VIejVY?=
 =?utf-8?B?QzRmaFNJNUo4UWxTVWN2NFBzbURwaXJWUmV5bHFQYWJ0MEgrTU1xVDVNYit6?=
 =?utf-8?B?SUhYdjMzUG4xeUlXTW93WUt3TU9LSjJiMWc4Qk9NampSQU5OL0ZuMU9JRUVS?=
 =?utf-8?B?d0NZbkNTQnovY3plSnp2aENYTXM4WTFiOFc4dlViTHkrZ1hDRGw0V2tpd2p2?=
 =?utf-8?B?TXVTQVdsL2VPdlFPaGNnMU92c1h6NGpZaDVlOGo2OXkrZTdFRlUwck95QU5H?=
 =?utf-8?B?VW5kTWxWOHFNSEk0a1FiV2pKZnd1WjE3MmMrVGRFc0Exc3g2Y09hWm9lb2xC?=
 =?utf-8?B?eVFZcHJONnVGQW5sVXJ0RThQOVE0VG9UcHVzMHE4SmcwYzhBWFduTFZSb2gz?=
 =?utf-8?B?UDliQkhnVzJ1eWhnU295V1VTTGFtM3Q1MTA2a1ZxZG5EVUx6ZHNPNFpqQ1p0?=
 =?utf-8?B?YVkrRXYySW9LUU45eU5NbWlKRTNGTG16YjUwYWZFMmVqUkhoVXd0SnRFR2pX?=
 =?utf-8?B?UHdCN3YwZm1Pemd1N1lCRTFNcG1McDYyNVJvRGNjZU03cExHQlR2cXpNc0cv?=
 =?utf-8?B?UndSRE1qeEpIVUJFNStJcDc3UWF0ZXF4bVFBVWVsWE82SkZ4TWlWZFlTTkVV?=
 =?utf-8?B?T0UzUWFYK3AwcHUwU2NLbmFvNWw3VzhnQ0xXYWFaN0xUaHRXNVZyeHMzRk1I?=
 =?utf-8?B?NWVDcHFzaG9EZWJ6VHpjcWhGaE9iczNSOXVrSDV6b1JWU3VIWnpYbW9BNFN1?=
 =?utf-8?B?M2dSZ0REODFESnI4T2xpTXNEa0NRdEtGSDRZY1B5aEg3ajlsZVBYNVpSUTBt?=
 =?utf-8?B?UTV1UGg3ck13cE01VGQvZGFTZE9CUHVWbmhKYnFxOXIzeVBOLytNeDB0Tk1u?=
 =?utf-8?B?WklDbWdPRjM4d3VaYTJ6N1E3OU1IMkM4WkVJU0lUM2t2T2ZYN29OL01wS1pN?=
 =?utf-8?B?QmpDbGszb0dhdXBKOFlLV1dUSTZYSlBBSFVNajlMQU1naFM2dmFjejBVZVBR?=
 =?utf-8?B?Q0FVeUhpZHFyUE1DLytjelFOOUlZNEpkT0ZQTzFaOVdueGNmK0hVM1BGK1lN?=
 =?utf-8?B?UmhHbVVFWjVIY0hWcjkwWXZnQVFuNGVKTkF4alBlNVJIbG44TzREZTFLSkUv?=
 =?utf-8?B?MjB4QXVZdUFycjJYdlp3M1FGaEIvUUx6NkJmeEJFd05DcW45THpWWmxDampm?=
 =?utf-8?B?cm1WZHFCZ0tuUE9wQUk0RzIwSmV1Sm5FMm82ZlROOUJKMTVtWkVJb29Nb2Jn?=
 =?utf-8?B?Wks1QzlRaExVdlE1ditmUVp5c25IUzBMOG8rM0JnR2tnd2JJTG4wRU91QTZw?=
 =?utf-8?B?enpkamUrY2trVVhKWFQ5QndvZDZJc1dWV25WWGUwMUpXZ3c4KzRpZDh1MFFD?=
 =?utf-8?B?UE45Qllac05RakNEa1FPR2ljU2VQUHJVRnZmQUNKNHMyWS9EUTdmYWF4Z1h6?=
 =?utf-8?B?cTVVRm5ndmhpUnd6SUFPaDJtZVJiTEFRbE42ZEVPeWk4bm92YS9xQUFIYW5I?=
 =?utf-8?B?U1o5SE41VmRjcjVYN0hQanNIYnQ4RVVXYU8wQkZDeGQxY0gyZVlReEs1bE1X?=
 =?utf-8?B?bTVvK0RzVnQyaUxNTjJxNHpTbWpmdllxY3R0QlZhK2ltTXp5L2RuN2xrS0w2?=
 =?utf-8?B?ZVJ0LytobGpINWQzeEtmTHJkZFVhazlQVFFoUzlKTlU4UmtRWmZUb1JZcjln?=
 =?utf-8?B?YnVwREhIQzRrL3cyZCttNy9zM1d3bC9HSUU2OGRMaUJSUFNoZ0VITm1LYllt?=
 =?utf-8?B?VktHMGxIcFpEd0xDcW9IVWpETjZFWXhkRGIrY2ZlOUR2SGZtbVFUZEFFUGZ6?=
 =?utf-8?B?SkcxcXA5Z2V4VVc5QlIvOGFhNVFzdmRoTXJaK2VpdFVDanEvZWRSeTdDRzZt?=
 =?utf-8?B?TzUvRXp5QklNK3p2SXIwczhNOWlBRmc0YTV6WlN2RXFoZzJvWVRESWxscUpD?=
 =?utf-8?B?L0FkcStiQ1U5cTNwR0RkeFM5c01lWmhNTnNOaTRDa2s3V2hNd0FMMmJJTnBG?=
 =?utf-8?B?ajZRbVVZcno0Z2VyM0QvekdyMG9udUFGU1NZYUg3dzJMQWJMV3N5Sy9PUGsz?=
 =?utf-8?B?UXJoajI0bVF1dUZWSE9LajNxYlhXRUphcWRzKzE3U0pHdU1JV3BaNTJSNlQ4?=
 =?utf-8?Q?hrtp/EBDSxnjJqBrYkk9d+tHM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3742e8-f67b-4f32-ae65-08daed72c49a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 10:10:41.0934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: czT3iqq+7/MDy5WMWK2Uk+AM8ThUOaIUDPeiShJkHZuOMU3jn9dlaumshT5d3fSs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6214
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Carlos Soriano Sanchez <csoriano@redhat.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/28/2022 10:00 PM, Mario Limonciello wrote:
> One of the first thing that KMS drivers do during initialization is
> destroy the system firmware framebuffer by means of
> `drm_aperture_remove_conflicting_pci_framebuffers`
> 
> This means that if for any reason the GPU failed to probe the user
> will be stuck with at best a screen frozen at the last thing that
> was shown before the KMS driver continued it's probe.
> 
> The problem is most pronounced when new GPU support is introduced
> because users will need to have a recent linux-firmware snapshot
> on their system when they boot a kernel with matching support.
> 
> However the problem is further exaggerated in the case of amdgpu because
> it has migrated to "IP discovery" where amdgpu will attempt to load
> on "ALL" AMD GPUs even if the driver is missing support for IP blocks
> contained in that GPU.
> 
> IP discovery requires some probing and isn't run until after the
> framebuffer has been destroyed.
> 
> This means a situation can occur where a user purchases a new GPU not
> yet supported by a distribution and when booting the installer it will
> "freeze" even if the distribution doesn't have the matching kernel support
> for those IP blocks.
> 
> The perfect example of this is Ubuntu 22.10 and the new dGPUs just
> launched by AMD.  The installation media ships with kernel 5.19 (which
> has IP discovery) but the amdgpu support for those IP blocks landed in
> kernel 6.0. The matching linux-firmware was released after 22.10's launch.
> The screen will freeze without nomodeset. Even if a user manages to install
> and then upgrades to kernel 6.0 after install they'll still have the
> problem of missing firmware, and the same experience.
> 
> This is quite jarring for users, particularly if they don't know
> that they have to use "nomodeset" to install.
> 
> To help the situation make changes to GPU discovery:
> 1) Delay releasing the firmware framebuffer until after IP discovery has
> completed.  This will help the situation of an older kernel that doesn't
> yet support the IP blocks probing a new GPU.
> 2) Request loading all PSP, VCN, SDMA, MES and GC microcode into memory
> during IP discovery. This will help the situation of new enough kernel for
> the IP discovery phase to otherwise pass but missing microcode from
> linux-firmware.git.
> 
> Not all requested firmware will be loaded during IP discovery as some of it
> will require larger driver architecture changes. For example SMU firmware
> isn't loaded on certain products, but that's not known until later on when
> the early_init phase of the SMU load occurs.
> 
> v1->v2:
>   * Take the suggestion from v1 thread to delay the framebuffer release until
>     ip discovery is done. This patch is CC to stable to that older stable
>     kernels with IP discovery won't try to probe unknown IP.
>   * Drop changes to drm aperature.
>   * Fetch SDMA, VCN, MES, GC and PSP microcode during IP discovery.
> 

What is the gain here in just checking if firmware files are available? 
It can fail anywhere during sw_init and it's the same situation.

Restricting IP FWs to IP specific files looks better to me than 
centralizing and creating interdependencies.

Thanks,
Lijo

> Mario Limonciello (11):
>    drm/amd: Delay removal of the firmware framebuffer
>    drm/amd: Add a legacy mapping to "amdgpu_ucode_ip_version_decode"
>    drm/amd: Convert SMUv11 microcode init to use
>      `amdgpu_ucode_ip_version_decode`
>    drm/amd: Convert SMU v13 to use `amdgpu_ucode_ip_version_decode`
>    drm/amd: Request SDMA microcode during IP discovery
>    drm/amd: Request VCN microcode during IP discovery
>    drm/amd: Request MES microcode during IP discovery
>    drm/amd: Request GFX9 microcode during IP discovery
>    drm/amd: Request GFX10 microcode during IP discovery
>    drm/amd: Request GFX11 microcode during IP discovery
>    drm/amd: Request PSP microcode during IP discovery
> 
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   8 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 590 +++++++++++++++++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |   6 -
>   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c       |   2 -
>   drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c      |   9 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h      |   2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c     | 208 ++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c       |  85 +--
>   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c        | 180 +-----
>   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c        |  64 +-
>   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c         | 143 +----
>   drivers/gpu/drm/amd/amdgpu/mes_v10_1.c        |  28 -
>   drivers/gpu/drm/amd/amdgpu/mes_v11_0.c        |  25 +-
>   drivers/gpu/drm/amd/amdgpu/psp_v10_0.c        | 106 +---
>   drivers/gpu/drm/amd/amdgpu/psp_v11_0.c        | 165 +----
>   drivers/gpu/drm/amd/amdgpu/psp_v12_0.c        | 102 +--
>   drivers/gpu/drm/amd/amdgpu/psp_v13_0.c        |  82 ---
>   drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c      |  36 --
>   drivers/gpu/drm/amd/amdgpu/psp_v3_1.c         |  36 --
>   drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c        |  61 +-
>   drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c        |  42 +-
>   drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c        |  65 +-
>   drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c        |  30 +-
>   .../gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c    |  35 +-
>   .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c    |  12 +-
>   25 files changed, 919 insertions(+), 1203 deletions(-)
> 
> 
> base-commit: de9a71e391a92841582ca3008e7b127a0b8ccf41
