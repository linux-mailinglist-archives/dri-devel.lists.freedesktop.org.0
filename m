Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 870654E239A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 10:47:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B60610E2D8;
	Mon, 21 Mar 2022 09:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2045.outbound.protection.outlook.com [40.107.102.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F90210E2D8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 09:47:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kAUtom2yfhc0lQGyTsgZRUXLYXp2Vw5jlc0AZFRYN2Ig0mzt1xoHNaU5G3DOT1GhK/nGsnLzxwLgJbYcG0uTv/aKVnwhZVnlXy4ZS5T3SKEjbSAKPfEI/Q1TDInHqMN/EOn+lZeimbNyTcBKkZ/w5VOm/bdt/5LA9+n/CQS0046H18g9o/mIeTB+7uQt6kl4kWx3frToU4m+Z7ZcpXkZMWymfm9rztC0Dd5ASPPLMjcxvTjdqzY8qGV6rptDpmc6O0QslWDk7XikuKv8j+H5U/nha4Du3iCMbaSRlKCtKFjuRc+bPUyELX27PvIZ6ZBSG3kcgK3/XZ8hVCvGVhqtUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LBie9M5JYtvSlR/mUDQMcJPKAE3UrzyY+5cfanh3f4=;
 b=T9C4p61fOkcvimeGmhXX4rJtjSafDpXcGAVG+heepi3FziveTr83+6fL/rZTlwPQJZ7pmeorDxLjXbByKzvR7BqKWUH3SeEcpC3Dc6SMFv836/6p+qv1tcWigfTSxtP+krLx6vDXnUAMLXl1rM0y3gA2m1u3s/KSanUoSLpJt+yU37w0icueOJRL6WkD3yg3nbVQ6j73wql72VVwSsjn+x4MCb1JKp2pOE/7CwvxMYdqYLUqgYNMccHo+xtyr3TTLhW0I3JfofkfNwiTYRrBCAjouLjsx50rSwYxlNhoIlDdOUGu1BLUyBKvGkB+hdE7jdyIh2RfTQqTiXBS6w5Xrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6LBie9M5JYtvSlR/mUDQMcJPKAE3UrzyY+5cfanh3f4=;
 b=e5GlRuiHlXwPG7OnizRYxI93JiZvvCWEO/llEUy/Z5q4eu/UA5vCKLMCfw7Zcl9kduky3+HyYEEHPtmqLGyFGVDKM+Fauw9wzRpfu0DgIDuelM0EW63vQjftWYT7oPpji7DsxbKa6RNbRotVvBKgnYmA+5eB0ZL2MgraAgT5kBE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS7PR12MB5839.namprd12.prod.outlook.com (2603:10b6:8:7a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Mon, 21 Mar
 2022 09:47:46 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5081.023; Mon, 21 Mar 2022
 09:47:46 +0000
Message-ID: <427b992e-8101-ebed-2fc0-c6aff9b3246c@amd.com>
Date: Mon, 21 Mar 2022 10:47:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 5/5] drm/ttm: Fix a kernel oops due to an invalid read
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20220318174332.440068-1-zack@kde.org>
 <20220318174332.440068-6-zack@kde.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220318174332.440068-6-zack@kde.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P194CA0043.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec0ffe0a-63bf-417a-520d-08da0b1fda67
X-MS-TrafficTypeDiagnostic: DS7PR12MB5839:EE_
X-Microsoft-Antispam-PRVS: <DS7PR12MB58395596526FC0D9546C1A7B83169@DS7PR12MB5839.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IEyaa+jvf/feBv3wIhQeLqS84/xLJjTNdRglw0P0McCQEOfLfS0a6Y46KnvdD/aL9KitzdLuSnm0xd7cv5IqIoF6rkvy9ji98+1qRAnEt4gtISfIN4A3T3WkDMlu4CgSkMAE0vaumjzRkEv/s7AcVyBlysYNz5/tkO+wbbXyf9lYxd0EZiInsod0tM7ervlodGMS1+VGA4qr8jpCHyPyGiraT2QufIkMiSVW+PMf1ayT5LmQ1nJv5vWoiIIjOsQejiL3FHlJi8WLXbeDWRWSzQBaxVsWTZnMgJwXp5kStAIUviK/BGaOJl9unH3LbNLIkez5cLFGq2GTv1nmAQWBzAKyRQms/4NLe0Tl316RM4gS6833Rdnnmx6xwBTA5VmVGBNoHvWNsKBIFS4eJQOd2/xrmSzQubb8lDwxiG1f6sg6PXAoHR0l5ZQzAuZEIA6iXLl/kYk8AA0yhnUlMcF8dI9SDkQxlCayPZLtRwUqOd2scSYyMkoPa9ZiZ/A/QtMmLl2JFfQdBl0ZsEgWGCUUeu7kLXWtzA8qY4W2P2PHg679Wt+xSyPHfh4TTGTdgOqISx14/2hGrlW3VRWpqo9TDY0tXUgXyILZuRD+fZCWtN/OwnIF3PLGirWabbvkXR09HfrhKuoec8auaboP/7yepP0adBVXUqq0Y2ZcTvtl/z4tw236lGEYXvh/NjyPR5PoMbuujXl6bqdGRgpyiUfAcIRebgG8Wq8gZb15eQJ8JSQTXH+3g2AK4W3PzheSwewa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(45080400002)(83380400001)(8676002)(4326008)(66574015)(66946007)(66556008)(66476007)(508600001)(6666004)(6486002)(8936002)(2616005)(6512007)(2906002)(316002)(38100700002)(186003)(36756003)(5660300002)(6506007)(31686004)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlpNcmFZZkRYa3JjN3VoYWpwYUcrQ1hBeENoNjZPQklCMi8vRnpLTW1wY3FN?=
 =?utf-8?B?MHJOM3JIcEdNd2x0Um4wWTJmSTBYS215VjRkSjUvVmxuUCs1bWlwdDhUVGYw?=
 =?utf-8?B?blN4WFpaMFI2aENDY1VhRHg0U0tEcUF6OVJXNXpCdC9HUlBrcGE3Zk8zTjZG?=
 =?utf-8?B?Rm1rTGJDZ1hGU1h3RHRpSXdBcE5vc1BiWjZDb2dYN3NEcS95V2pDeGtDMEFz?=
 =?utf-8?B?WldGUDZ4ZzdQOW1vek82QXYrWUpxMmhBdVl4WFNGdmFJTWRFUFIzN3EzdEl6?=
 =?utf-8?B?UEc4U1hMSGFqR2dsaEp2Q01CS0NmYjNNbjJDMFdKNGFJNUEwaUZBRlFtOXdF?=
 =?utf-8?B?S1dmcng5MVRNT1kzMXhaUmRQVFVLdlplR3R5T0syT1A1VE1pQjRRa2lZVk1P?=
 =?utf-8?B?dGdzZDdkbFBCbFRZcHZFWEprOVBRa3FuTWJPTXNybGE5UXhxYmpHR2ZOOWg2?=
 =?utf-8?B?NzVHa0xaRUJnQ2J2ZjRGQ08xVm51WnlnS3Zrb1pYYTUwWGkvb1RNUjlRL2Vn?=
 =?utf-8?B?NGlqSlMxc0c1ZFVZTTdEZWlhOXp3N3R3b0lUUFdNVHRlaEdyRWFWQTV4MEh3?=
 =?utf-8?B?UjFBSHZKWHBraUJuUEZNdWhuRkpUNFh0amlpamhWVVhsaC9DNTEwanNTQzA5?=
 =?utf-8?B?aG9XRXFya1FYOG1nYWE3YWUxWTdEdStZVit6RVFVRGRGQXBCRE9nWlJmb01z?=
 =?utf-8?B?MXNMeTNlbHpFb1FMMzZQaFp5WlBJaDVmRSs1TFVtYUFMemhZSERsRUNaRzMx?=
 =?utf-8?B?Ull4d3lRdVFyNHhoa1lhbG4vWEVIMXBQaFJUMnlNaGJYby9GQUdtemsyWGd2?=
 =?utf-8?B?Z3pDREhFWFREVE5pbXJyejBxU3ErWlptWlhJdk4xbWJ3KzR6OVRFeXpKdHdx?=
 =?utf-8?B?eFJ3M2NTUmRyVzk4ZXpNeThDTklIajJ1QmdMTDEyaU9zWUNuMTBLRUtvT3VU?=
 =?utf-8?B?VGtqanUxanF6L2VjVkcwVFkreHRSK2c1aWpwK1cyMXF2WXJpT3U0NXpSTUJw?=
 =?utf-8?B?YXJTRWJaY3pUVmUxbnlyMCtDdVBTQnFIUG9BbUx2VzlTTXhLYVkzVTlZM2xW?=
 =?utf-8?B?ZWhTTXZkYXVkYVpIdEhPejByTUh0WjFXcDg1NjFIN1ZVU1pWTm00bmhUQ0tJ?=
 =?utf-8?B?eExERnlWMUxkZnFRM05EcnVnWFZ0bjJxMkN2Q2RFbGlnWUZEWkJsc2E0dk93?=
 =?utf-8?B?Wjk2aUNOa0ZDT3R2TFF1UkgvQkVOaU1obHcwVkVxNkQ2ZGFqUU0xdit1akRx?=
 =?utf-8?B?ZWNtM2ttelNuVE1NVndUSEhWWi9KVXMrSVd1N3h6VmowRUJUejBhV0FZZzNK?=
 =?utf-8?B?WVVDTEdxZnNoK1RFdWNjdW1OMUhhVFVCbHMwa1V5dnVMbmxrVEt3SXRRNGRF?=
 =?utf-8?B?SWhWRE0zenJXQVlIbnBZQjEyS3BCQ0xaa3lvWlFoYzJyMGx2RUJpTnBpbVZV?=
 =?utf-8?B?dGFXc0NhVzdONG95OElnaEtqaXhuME9IMm9oYVFrYXJoZXJuclRzUitJZHhi?=
 =?utf-8?B?MWZKd2NvT21tVlNmbVJlbWh4ZWEveStZMXU1Q1FzOVZTc1BiTy8vQVZpVkpP?=
 =?utf-8?B?aURNd0VQM05OWEdMS2dHQVBNNk9Yc0Y3NTdIdjh4STRGMW9hMDZPQy90WXFw?=
 =?utf-8?B?TTZmVkEvbVRHZkcrMmRqaXNhcXMwU045V1hqQ2dmMFRNQkVzaDdJK2V6STRM?=
 =?utf-8?B?bFN5cUl6N0VWR1VXNW1EVlFLc2hTVDBrS0NBZ29DQ0hsQTRwa3BvRGNpdTZU?=
 =?utf-8?B?QllOc1dFZXhxTlk1dFcvbDVaZDRsQjdDS3k1d1pCVU1sVXhUUDdaS0JxTU9N?=
 =?utf-8?B?OHhTUmJxaUxicUJjQWxoZnEyWXcrd1U2bE9ab0ZpaUhOYWVCQ1hqSU5hc3Vj?=
 =?utf-8?B?VTljaXdQWnloWGxJNHFpNVZGUUE3Z2NTOVFPdGp0d2g0VFNXc2I1TlJ4VE0z?=
 =?utf-8?B?MFdmLzZCcUR2Mi9vcUZmdVhZY1QzcW5DeDhjUGdNZGcvRTkwOXIzWlNVdjVk?=
 =?utf-8?B?SjFQU2EwTWIwVmN3MThiRHMwSkpoaGcrY0I5MnpGMk41MUtTQ095ZllXeGZn?=
 =?utf-8?Q?un9EPA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec0ffe0a-63bf-417a-520d-08da0b1fda67
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 09:47:46.4942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Ob7IdEGrS80fw1iSCC1iKohRSN2K7pDtcH9jztHlMFKqobXSm/OY0JQWqUEdYUm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5839
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.03.22 um 18:43 schrieb Zack Rusin:
> From: Zack Rusin <zackr@vmware.com>
>
> The res is initialized here only if there's no errors so passing it to
> ttm_resource_fini in the error paths results in a kernel oops. In the
> error paths, instead of the unitialized res, we have to use to use
> node->base on which ttm_resource_init was called.
>
> Sample affected backtrace:
> Unable to handle kernel NULL pointer dereference at virtual address 00000000000000d8
>   Mem abort info:
>     ESR = 0x96000004
>     EC = 0x25: DABT (current EL), IL = 32 bits
>     SET = 0, FnV = 0
>     EA = 0, S1PTW = 0
>     FSC = 0x04: level 0 translation fault
>   Data abort info:
>     ISV = 0, ISS = 0x00000004
>     CM = 0, WnR = 0
>   user pgtable: 4k pages, 48-bit VAs, pgdp=0000000106ac0000
>   [00000000000000d8] pgd=0000000000000000, p4d=0000000000000000
>   Internal error: Oops: 96000004 [#1] SMP
>   Modules linked in: bnep vsock_loopback vmw_vsock_virtio_transport_common
>   vsock snd_hda_codec_generic snd_hda_intel snd_intel_dspcfg snd_hda_codec
>   snd_hwdep >
>   CPU: 0 PID: 1197 Comm: gnome-shell Tainted: G    U  5.17.0-rc2-vmwgfx #2
>   Hardware name: VMware, Inc. VBSA/VBSA, BIOS VEFI 12/31/2020
>   pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>   pc : ttm_resource_fini+0x5c/0xac [ttm]
>   lr : ttm_range_man_alloc+0x128/0x1e0 [ttm]
>   sp : ffff80000d783510
>   x29: ffff80000d783510 x28: 0000000000000000 x27: ffff000086514400
>   x26: 0000000000000300 x25: ffff0000809f9e78 x24: 0000000000000000
>   x23: ffff80000d783680 x22: ffff000086514400 x21: 00000000ffffffe4
>   x20: ffff80000d7836a0 x19: ffff0000809f9e00 x18: 0000000000000000
>   x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
>   x14: 0000000000000000 x13: 0000000000000800 x12: ffff0000f2600a00
>   x11: 000000000000fc96 x10: 0000000000000000 x9 : ffff800001295c18
>   x8 : 0000000000000000 x7 : 0000000000000300 x6 : 0000000000000000
>   x5 : 0000000000000000 x4 : ffff0000f1034e20 x3 : ffff0000f1034600
>   x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000600000
>   Call trace:
>    ttm_resource_fini+0x5c/0xac [ttm]
>    ttm_range_man_alloc+0x128/0x1e0 [ttm]
>    ttm_resource_alloc+0x58/0x90 [ttm]
>    ttm_bo_mem_space+0xc8/0x3e4 [ttm]
>    ttm_bo_validate+0xb4/0x134 [ttm]
>    vmw_bo_pin_in_start_of_vram+0xbc/0x200 [vmwgfx]
>    vmw_framebuffer_pin+0xc0/0x154 [vmwgfx]
>    vmw_ldu_primary_plane_atomic_update+0x8c/0x6e0 [vmwgfx]
>    drm_atomic_helper_commit_planes+0x11c/0x2e0
>    drm_atomic_helper_commit_tail+0x60/0xb0
>    commit_tail+0x1b0/0x210
>    drm_atomic_helper_commit+0x168/0x400
>    drm_atomic_commit+0x64/0x74
>    drm_atomic_helper_set_config+0xdc/0x11c
>    drm_mode_setcrtc+0x1c4/0x780
>    drm_ioctl_kernel+0xd0/0x1a0
>    drm_ioctl+0x2c4/0x690
>    vmw_generic_ioctl+0xe0/0x174 [vmwgfx]
>    vmw_unlocked_ioctl+0x24/0x30 [vmwgfx]
>    __arm64_sys_ioctl+0xb4/0x100
>    invoke_syscall+0x78/0x100
>    el0_svc_common.constprop.0+0x54/0x184
>    do_el0_svc+0x34/0x9c
>    el0_svc+0x48/0x1b0
>    el0t_64_sync_handler+0xa4/0x130
>    el0t_64_sync+0x1a4/0x1a8
>   Code: 35000260 f9401a81 52800002 f9403a60 (f9406c23)
>   ---[ end trace 0000000000000000 ]---
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Fixes: de3688e469b0 ("drm/ttm: add ttm_resource_fini v2")
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Reviewed-by: Martin Krastev <krastevm@vmware.com>

Reviewed-by: Christian König <christian.koenig@amd.com> and pushed to 
drm-misc-next-fixes.

> ---
>   drivers/gpu/drm/ttm/ttm_range_manager.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
> index 8cd4f3fb9f79..d91666721dc6 100644
> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
> @@ -89,7 +89,7 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
>   	spin_unlock(&rman->lock);
>   
>   	if (unlikely(ret)) {
> -		ttm_resource_fini(man, *res);
> +		ttm_resource_fini(man, &node->base);
>   		kfree(node);
>   		return ret;
>   	}

