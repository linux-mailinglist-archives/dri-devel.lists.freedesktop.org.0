Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 999C73A267A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 10:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90AD6EC7C;
	Thu, 10 Jun 2021 08:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2070.outbound.protection.outlook.com [40.107.95.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A937D6E866;
 Thu, 10 Jun 2021 08:20:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ty1bzPNhmfQe57733ifGKe7HCKVpc0chEAobE4e1BOke14Eh4adEGH4A8gQlRCZyA1AeczyWM5L6NVTUU02yhepTscSOeIWr2h94Yfhq1piRnjPBRPKghvVKLG87s0qVpwqnRU/ZkZTrDpQwUF5YDNyCPP1f/l033oRM5fj6Nkp+dDpIYZ4nC7PRzp4CO3t9/t02cgfDi7s0B2l1lB1hzN8vL35WpLR/xlBaXRbx7JULrwPOKEQjM/M94b6ClXWcOiYnI8lA+7MDnWrSIf9Ci6VVYfnqCtd9DrFZXNq1CGZtAFBgCZEeopMnZWvEWf4pYNam5hN7H8tfBYROTber/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0A4d5ctWY1bZbzaTTd6QmrAMXn9FBSbGqiOP5U+Kbw=;
 b=ibS1YR0nh0Pk48Hq0kRTfUMOdASqYoofZTzQNvH5cTJkXedDvVBtznjxnxDIvUOUV3ASiWhjTjvRLC7+8Z6knoxtZYnBxExXIeFVh3PRkZIXJC+rKtJ5KqdXgCDIrCZfi3EYGXhPnhbB/yrtsvlV2h4snwodUrAqj3B79prEkO7brpyyOMtU9gfMyPxK89GbnEFJCeDU9AfPC0enief2t8TZuE4L8uI8rluIR3KLi3I7re+lQiiwYZY7ddhy33ILHMAg/lps68lm2RRIQTyArfPfwHniQ6RpzN44vYK26kgZKoEVsrOSsTxXDn97BtQT+Gv4DSbQzy0QPAdLqAVZbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0A4d5ctWY1bZbzaTTd6QmrAMXn9FBSbGqiOP5U+Kbw=;
 b=prfck7yr+lCd6stvR1Vd1uV3v8Fa2PHB/cH8WDmleTtl1orFELgpTpOzxTrLUb2rsdaACk12RghI6hWhgLFQ2YX7fQ/nAIVS2VrRQi6I2g0K133XpZI6uV8owpBqfxZ0v1jb9mNkxrBxBJe7C67Qyhcw4QKt5TPlUobrxGcqHNM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4913.namprd12.prod.outlook.com (2603:10b6:208:1c7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Thu, 10 Jun
 2021 08:20:52 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4219.022; Thu, 10 Jun 2021
 08:20:52 +0000
Subject: Re: [PATCH -next] drm/amdgpu: Use DIV_ROUND_UP_ULL instead of
 DIV_ROUND_UP
To: He Ying <heying24@huawei.com>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, airlied@linux.ie, daniel@ffwll.ch, airlied@redhat.com,
 bskeggs@redhat.com, matthew.auld@intel.com, Ramesh.Errabolu@amd.com,
 mchehab+huawei@kernel.org, Dennis.Li@amd.com, funfunctor@folklore1984.net
References: <20210610082005.86876-1-heying24@huawei.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5ffe00de-a7b6-3ac4-f61a-5f28b653e7b1@amd.com>
Date: Thu, 10 Jun 2021 10:20:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210610082005.86876-1-heying24@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:c285:5f9a:99f5:633e]
X-ClientProxiedBy: PR0P264CA0229.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::25) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:c285:5f9a:99f5:633e]
 (2a02:908:1252:fb60:c285:5f9a:99f5:633e) by
 PR0P264CA0229.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Thu, 10 Jun 2021 08:20:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c31637e3-1331-49ab-f06a-08d92be8a900
X-MS-TrafficTypeDiagnostic: BL0PR12MB4913:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB491322D83EE52363D3026AAE83359@BL0PR12MB4913.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:214;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dvEPTcE6KlWk1bTaIXi7StsgjFY0Fbc7rpg/zyvtDZd6weOeO8olEiAK+LXxH2+dbvvfkcB8BLAmNyTTI3+78pDI2A7C8dyEznt9UlPLtA80QxuwRYrIAO3ErGyZwDbI4balP5Khjo2EtGXL6jfwmb/GP/Nj53aeA6LQrrd+eUYxdO2/CNC8ivkXYMElIJvfZytjKeHGQ38uIdRTbztmSrocv24zdhe0ntS9aBBsprhdsQeH2snlP0wv6t749sod7pkssZMvzodLUM02FpiliVeZCGjdWj5E9dW8SlMQYFknxHGAmUHXLZrxhb+Kp8toqWqsJw+hXJRuMdqgaQFe3P9ulM889QFJWEOoM+pgy+zVy/gEeDsSEZkMKEVTv+YNt1o1pUTi7eb7ID9WfCNmwH9/a4L8dkc8zMpwd9OtReC8eVmK94Bq3UEtF0xN2yzsdNvIKy5NmdjrAGjH07eCbNm8MnuGfwODZxlYejz5Otvt6YXbyvR0irBmgr/nGDEQk4AQD39+e6hnAj2BdOv/24UvQMqCQDA0nNTT2PXWoRS0OSOlFml7e5LxT1OkUlzNCq/LE1r5L3TUrsKgHosuWQKnvtp2sKgqs+cJJvVtLWgvIGtIin6ZPpEizF6JVWhdIy78VeDFEaYjAGn4gMpYYffyKqP9sEVi+hyrAG4MbdmV4Z5EK/J2HdJONbHeDuV7ftvAriUj9CAxrQ2wLGkLTw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(8936002)(66476007)(66946007)(66556008)(8676002)(86362001)(921005)(186003)(2906002)(31696002)(38100700002)(16526019)(6486002)(316002)(6666004)(31686004)(2616005)(83380400001)(4326008)(36756003)(7416002)(5660300002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUhnNzYzNnNsdHZtZ3hUbFJabnBmN3NjdEdDMHJIUGxsLzNkS3NZdXFRQ3Yv?=
 =?utf-8?B?MEpVNSs5WHdJZEtuU2JkbGlUVHp5TnNERTRJU05wN2NGWWw5alIrbkNrTjlx?=
 =?utf-8?B?MjQ3TGJudHM1N0h0VnhFOGd3cy9tVDFQc2pJUDNVZ3F2bjJEWVpONjRhMmJ3?=
 =?utf-8?B?QkJtQStVK010U282eHp2SlZvcU1WRHgxZXE1eGdOUDBJOVdGN21mVnNKZHBq?=
 =?utf-8?B?MU9zNHl6aXBoVlhHWm9pOVVENXhzb1c1cElZa0xWWUhDaDIwY2puZ0lmM2NE?=
 =?utf-8?B?RU5xTE1sWHZMTUNvTUV0cmdUeHBpN2JodStQU1JIZ0FtRlJNeXRnclBEcTda?=
 =?utf-8?B?bzNTYnhwSjdiTkJaNmlFVmE4b2Yvc2VBRjBod3VnQnRTbHNsVDFGYXN0YWsx?=
 =?utf-8?B?YjkwQ0sxTmYvMTBCOHdidmJPMSsrdVk3VFFEOHVxTFNuUGJ6NVR1NGQwYmlL?=
 =?utf-8?B?N2hNbFJQWnZZdTRta1FPUjZWTVF3RzFxaTFnM1Q1ZHpNMzhhbXc1NnB1RFdo?=
 =?utf-8?B?ZnhPME5td0dlZ0dkQzBzWCtBMlRGM2tLOGJSdzRvcVJIRXFVTmQxb1gxSnVG?=
 =?utf-8?B?d1FwSGZQUDdpWmQrTG5WSksxbzk2eDdWL244dFVVOVp3cE50a0M4emo4TEJx?=
 =?utf-8?B?ODZ1ejFQeDhDYkhUTHhyM2QwM3FzbndjQTJ6cS9BTnNCWktPYnUzbFN5V01W?=
 =?utf-8?B?Snl3dHREVnRkRGtPeTVES3NlSTVldEpjVkJvdkNqYllXM1J5VEhpM2tzeVZw?=
 =?utf-8?B?RnoxVXB4UDdXWWdOR0txcUsvU0x6blRRR3NWUExCNlYrZGk4WFZUWWZla0Fz?=
 =?utf-8?B?cmNiSlphQjFObVd1T1ZJVzdzNVlTeGFnQWNuZEJyaUlUbFR3aFc4MkJKS3lB?=
 =?utf-8?B?REVaOXJVelROWFB2NG1xSTMyc0NERzVtQzd6YmRBODhVREc0aFIvYmRpSzYx?=
 =?utf-8?B?MHAyZXZjMXBrcXoyNU5yQWJMTmsvZlRYK0xRejArU2hpVlN4b3VQSEFhMjNC?=
 =?utf-8?B?N2Q2MFUvSWh1TW8rRGF3bjVsQk5tT2NncGViTHFQYnZpcFk3RlQwQXord1My?=
 =?utf-8?B?b0NSU1JDbTNrejBZSTJaQU1lYStzYWdMWFBGSTJTaUEvdjRJOU1reTh3aDln?=
 =?utf-8?B?RlM4dzN0RHY0NkhpMUVRWm00bFFjUUZ6ZERjY09kUFladFozQm5PL3ZRTSto?=
 =?utf-8?B?YXI4TGZxL2wrbnZyUjNaVkdJVVpwNkJyemNwWUdTb2dDRHZFZmdPNVZ3R1hp?=
 =?utf-8?B?R3B3b2owNExRc08yK3J1Zzh1Y2p4MU5NTUlza2s4bTJJWFBMckI3SEpFMHVN?=
 =?utf-8?B?NUpNODBVcWtGMWphVGxOTXRWbzRVa2dibFgzV3NXRExxMDRuamNjRU5KTUI4?=
 =?utf-8?B?Qmt5VTRpQ3FmTW51dUg0eXI2YlBYcDRiUExHT3JUazIyQ3pKclVMSENVVVVx?=
 =?utf-8?B?dm11QmxqWnNtdjlmZXo2bTRObkpnQmo1WmVoeHIvNktad3JlK0x1QUwxRGxp?=
 =?utf-8?B?VmtyWDlsdmxxZEhNbWFaLytWTDFXZ2xnamdackJHaW1RZzZvRU0zS3UxV1Fm?=
 =?utf-8?B?K1kxRHRsaGg2NG56TzdYYkNWbnEzVEo5TzA3bi9Ddlh2alB0RWwrcUJxTFMy?=
 =?utf-8?B?c3E1MWJVdmpRR054bVBVcTFYaTdaUTU1T3N3UThGSmR4Sm1ZZE5jYmc1TW1Z?=
 =?utf-8?B?NkhQR1ZyNWFFUlBBN1NxK1lYLy9SL1EyM1U4Y3hvZzRZREk5WFZjZWJ4LzE0?=
 =?utf-8?B?alRKV0RzVHI0b2ZJc0VrclNhdC9KeVdWakVCS3lpSW1HMi9uc1RqY0pBQmhl?=
 =?utf-8?B?Z1lxUXE5K2JIdzNnSUxuY1VsN05IRk80aDQ5TDZBZ1prUm50bzJxMitZV29O?=
 =?utf-8?Q?It5MpIzbzfgTD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c31637e3-1331-49ab-f06a-08d92be8a900
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 08:20:51.9652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SHVJcJXiT+L+mT0xVxSsrYpHElnMgyI56N/jTXZ1WswPRE8zEsQT8W5I1OzgXknu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4913
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 10.06.21 um 10:20 schrieb He Ying:
> When compiling the kernel for MIPS with CONFIG_DRM_AMDGPU = y, errors are
> encountered as follows:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.o: In function `amdgpu_vram_mgr_new':
> amdgpu_vram_mgr.c:(.text+0x740): undefined reference to `__udivdi3'
>
> Making a 64 bit division by a/b (a is uint64_t) is not supported by default
> in linux kernel space. Instead, using do_div is OK for this situation. For
> this problem, using DIV_ROUND_UP_ULL instead of DIV_ROUND_UP is better.

Already fixed by this patch in drm-next:

commit 691cf8cd7a531dbfcc29d09a23c509a86fd9b24f
Author: Dave Airlie <airlied@redhat.com>
Date:   Thu Jun 10 12:59:00 2021 +1000

     drm/amdgpu: use correct rounding macro for 64-bit

     This fixes 32-bit arm build due to lack of 64-bit divides.

Regards,
Christian.

>
> Fixes: 6a7f76e70fac ("drm/amdgpu: add VRAM manager v2")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: He Ying <heying24@huawei.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index 9a6df02477ce..436ec246a7da 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -407,7 +407,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   #endif
>   		pages_per_node = max_t(uint32_t, pages_per_node,
>   				       tbo->page_alignment);
> -		num_nodes = DIV_ROUND_UP(PFN_UP(mem_bytes), pages_per_node);
> +		num_nodes = DIV_ROUND_UP_ULL(PFN_UP(mem_bytes), pages_per_node);
>   	}
>   
>   	node = kvmalloc(struct_size(node, mm_nodes, num_nodes),

