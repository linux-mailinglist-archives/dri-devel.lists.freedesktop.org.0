Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC24686C60
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 18:02:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF67910E43E;
	Wed,  1 Feb 2023 17:02:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DAF10E431;
 Wed,  1 Feb 2023 17:02:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cmRU23R+M+U1mzaFjhR0IevJNX2v+eMjEevNuNLgEYoS46YBbiwEgcWVLSla4gcP/4WIGp1q306ZI1ODyH4gWGfJPng1PLIqV7kNlPyWzwb1rXx1pfUXSftNmqof00IqVKUTxYMb68FyufWdV6BWER7AO+51MAacrzc02u3ronuD/n6RdGxsVrc/q714y6xX+VlDBoHzgWI8RiCm9ie7TatJxarf+pef7pbewbTCmx++KEhBw9mn5RKkbRU+N+8NXwStv8ICskO7NvwKGk1Ambl4Rq0iwjEyGcBpCOY54FsfhwrJLc/t1l1d3e/4ruyZYHqHxMniz3FSh2W27ciHxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D45jxXzUa0CFgnc69ApuBOzPa1VotH60+OM95qT4RZw=;
 b=NCDnF5ep6fn4EjNb6uToSCMDTo6CBDthp2gKF2ogG5HDqfeEfTbaFVnCRhn0vmDjjiEB9azIC7ucD3deLDsS/xCmq+6qApXnRXV8nyWFditrxUpS0zi57v/xGmxkMrKqkyZI/I0SDVEhgT/dtP5QbnPIMV8wY36oBq+HKYjXOEmpYDwYQMzJ2nRXbJsDMKcWMhIYZYMsiAHCWwoBdF30TF1BmcT0hOpBNYoYQd+vs++6I6KVKgzxbGr81+MLxd1fekAkVIt17/r3ZPVHq1R0ZeyGyA/g9Dyo9QCCV1hmiWMUOXy+6an5aYp8Q8gt+UM3BLMmdCkiLYLWoSxhVKFQbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D45jxXzUa0CFgnc69ApuBOzPa1VotH60+OM95qT4RZw=;
 b=SmgfpbXNZ487DcyhU3EDUsBeN9tR+b5bPOahFXGqvNHDIBVMBGj16C3poNEy9HHpvbkIJzjgIA5h7JO7ujduKJPv7nSv+vTvoDrD7oJ/OcnAv6k0yei9NdJh5G+ry2oeJ+HSE4dNiqWP9s8iK1shWwnf5nxydSBnOmb7NGqG8rk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 DS0PR12MB6632.namprd12.prod.outlook.com (2603:10b6:8:d0::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.25; Wed, 1 Feb 2023 17:02:50 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::4df2:b32a:e628:c57e]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::4df2:b32a:e628:c57e%7]) with mapi id 15.20.6043.023; Wed, 1 Feb 2023
 17:02:50 +0000
Message-ID: <b5c0a547-1f43-10c5-efc6-e6ff6ed140f2@amd.com>
Date: Wed, 1 Feb 2023 12:02:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] drm/amdgpu/fence: Fix oops due to non-matching
 drm_sched init/fini
Content-Language: en-CA
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, amd-gfx@lists.freedesktop.org
References: <20230201164814.1353383-1-gpiccoli@igalia.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <20230201164814.1353383-1-gpiccoli@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0075.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::14) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|DS0PR12MB6632:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b1dc91b-0577-43a8-017b-08db0476265d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HmtGD9JN6mQ6gO/7Br5xF8y1VWG7IQzsfliKXof6Hbpzh3/1nABYHL1EKwfIRWpyRVY5wIpT/Tz7ig+LYatt94b2YZzgUVzQRcRRxZKjW5Sthty3RcoDWQnHP1ULnx5cSp5vsOiQxwSggo6tXT9M6MH/HIsHg1ELCCQA9uKKZjEbz+CqgFzEO6nUv5btcyONeEnNH82TI1BUFWJaagVVGlR4Qn+echcoNnorcPHKRAdca8iLKfmkjivD4UPclqv0S1Z4QPrMVZFF/VpLYL8FV3sWgqh1UAj+VHSDWNwPA3YrPZx/arYinkJd5Grwkj8lN4b39Vg65zh8Y23CENclG6zZL/gdbfQML7cQmTXDISwOL6LbESNk2OyRgWTO1q69DXBmxxSWgm/WoekXtId1KH+aOvAW8RASQyXLfxO3eIugO2x74qL6/VmeVQtlm9gEE3C0Ts4FaKtTDe47gVPNYnnHqYnhCo3DdN96Eo3h2Yoz38o0M9AktXazKMTGuVQNtoBMk/etStg7G+vGhKs/R/DJYeScBKA6iX6qkJL1L5cBWILpsAaiK6vzxJ5ggKlPVnA0tcydFXGRKtBkkHXB97Z4dsZcimDMSYlRGvSOr78yyDbjoeR1Vi6pcskx/yc3ty1t7u1csPYkb+B+jZXSuc97BXgIr07y+NBajtKoU8H3soGRfxNtmCIGj2wkEczI2LGBKCqve9WU3VhMmwoYqZPngLR3dJ69IBqH1gBdgE//K1IpyzWaNgUp6tLgmvuOH9zJhL0xYz7aFVj6bN9f7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(346002)(366004)(376002)(39860400002)(396003)(451199018)(31696002)(31686004)(36756003)(86362001)(44832011)(5660300002)(2906002)(38100700002)(478600001)(4326008)(8676002)(54906003)(316002)(41300700001)(66476007)(66946007)(66556008)(66574015)(8936002)(83380400001)(55236004)(186003)(53546011)(6506007)(6666004)(26005)(6512007)(6486002)(2616005)(66899018)(966005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHBtTUJzS2MzK0puNHJFYUR3MHMyVGFrRUJJZm5iSTkzNHdxNmN2QjRNOHNo?=
 =?utf-8?B?UHNZQktrTWJEYlhQTHUxTWNOYkhlTkZNVVFyUjJtcDhya2xYcWtCQzlzUG8w?=
 =?utf-8?B?MHN6MUdRRzhDb0pKeWd4dTNIK1VMKzZjd3NZRENnVHl1NDRraktjcVY0MnVD?=
 =?utf-8?B?ZFNGcGtHQlV3b1o3MnVTL3pyZjE3S3hBajFycVN3U0ZiUXFvR3hEVVRuYzJ4?=
 =?utf-8?B?U1RiU09iUWRyMHVKTXZPTWJQTFpCK0xGNXZYN0F6L3BUNmJXQmI1c1hDZGZU?=
 =?utf-8?B?eW04bWx1RVNtK3lGcS9ZSUhOZXBHMi9MbUJCa3BmcDNGUU55ZTlPNmN4T0pm?=
 =?utf-8?B?dWRUek5Ya1FOK2w0Q2dWNjhhZFptSTZtTzVTbCt5R01PREUveER1SjRLRHIx?=
 =?utf-8?B?Wll2TlN6bzlsdExyRlhod2UrRUpjek1OdDdrWXk1b3RiOXJWWTRJRFJTcDJz?=
 =?utf-8?B?N3Y0TUluWnlzaTZ1eGxVcnlaS0tCTzNOVkdKdTlhZTBmNVIzK2JGKzZGSDdJ?=
 =?utf-8?B?MmNGUGNaMThVbklkWmh3R1BsS0FEM0dxWEJVdituOElXcncvSlcrK0l3WDlV?=
 =?utf-8?B?NFhrTmt4bmFZcXhnelZ4RkZ0NXluTGlhbnpyNXJxR0RmY2xwT25JZE9rbDdz?=
 =?utf-8?B?L09KcGYzVnBCT0RIMUVkUmNQV0RjL1ZMVEg4UkRhaWpSam9hQkY1Z2VwQlB2?=
 =?utf-8?B?QTRBQ1hIVkpJNE82NTFyT0R5UEVKVXVCZWpzcXBzMVJxYWJWS3dhTVlZZUkz?=
 =?utf-8?B?ZlVUZHVPOFhScDk2bklWWkNtTkNBTFdCYThpTzc4QjFEZnFOL1VvQmd6YWxr?=
 =?utf-8?B?b3RKRUZwY3N4VDdYdkpDTnJOMnhXWkVXdGtjODk0d3BRL3E1TzhZV0RNZFI5?=
 =?utf-8?B?TTFHSVQwZTJHM3ZyV0I0ejBaSTVwMm5jQWFmVHc5dWVqVXFaVUl0b0JiRlZO?=
 =?utf-8?B?b3I5THpFWGNQMm40czdGZ0xCT1Z5d3ltckdJK0pvTnlvR1lxdnRHLys3QmdT?=
 =?utf-8?B?UDZreXAyZjBuaUxVbUVRdFRQKzBYekJDaG5zMEhodEx3TkcreFl1bHRxYjM4?=
 =?utf-8?B?Mm1WbWpvR0pBS0t6d09XQWJreTkwcjVTcVpia2VGRVBUcjhkc2p4QS9lWHhw?=
 =?utf-8?B?TEpCZVhvZVdjd0VtVmpmd1VSdTQ3YUhaWUlsdGFSZSswUVMwclRRTWdseEY2?=
 =?utf-8?B?RVhnN1JkY0RpT2FoVmVJbzRoVHRxdXhjQllKeklkMmlrQS9iazBXandGN2U3?=
 =?utf-8?B?aGVLUUtSUENQOTAxRTBHRFhyQUwyK2gxZUVRWFpFZHJ3YnFzSEg4SHZBSG8v?=
 =?utf-8?B?c1FPemdPUmE0R1N0VFZJZHNJODRrd0JzMHdYVnRIc0creTFrcUNUT3dDUjJZ?=
 =?utf-8?B?aUkvMTZvbWhvUkNjUlg4ZUtha09BRm1Rc1RHUDVJcmZ4Q0NCZFNwdlRjVGpZ?=
 =?utf-8?B?Rng2TUM4aWVSV2pFb3Z2Q0k2OFBFQlRqa0RoaUMvZDNOdEZIaXlHT3dLTkxU?=
 =?utf-8?B?TS8yZmQwVTl3bHpFNXg4R0tHbEZTQndSRjhaQkVuQUhiU0FkMkFTaXhlQ0pl?=
 =?utf-8?B?N0F4N3R1TU1wUUlaQnBpaDVxdXljVktLZHhPVHNQM0VtalUxcldUMDZNREx3?=
 =?utf-8?B?SHR4c2kzdURNUHZZZHQ0eFdKUkU4cHJmemlhcGZzNTVHWENTeVduemxOS3dZ?=
 =?utf-8?B?MXZjc1NCeWYvQzNMemhtLzRacENuYmh1WjdxNUZGUHVlSUVNeDZXVHMwMlh1?=
 =?utf-8?B?ME1zajZlWWp0TlpOa0l5WHpQVGFRamx5elg3dDZLUXpmeVN1eGJOSzc1Z3c0?=
 =?utf-8?B?V3hvNW83TWM4MVJxak8venp1SGpDSW9pa3NaeGVHOUdDamdwQkRYTkducCtZ?=
 =?utf-8?B?a0w4bmw0QWRWWm9PYUxINVpadW91YXlFdkdkNXFFdHMwL3N0dEN0MWdyUmxt?=
 =?utf-8?B?LzVMZzdIN3c4RVZhajJ4RStLcXJqeGNRZytwQk56N1RYR1VFN0Q3UmJUVWpU?=
 =?utf-8?B?cXAyN3FtS2RJMysvODh6dDloNndJYzdzVGk3QlBTbVZIWEU4Q0o2VWY2aWlo?=
 =?utf-8?B?Vkc5ZHU3RE1YUHh3TXpFbDVNRFFDcDNPMW9jc0dkSkJNcy9Ud2hBbGVhRUhq?=
 =?utf-8?Q?xS4KMVlHPPdzCb4KMR9GMyyrG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1dc91b-0577-43a8-017b-08db0476265d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 17:02:50.1369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QngHpU06sd18eqsKDMFRIiUXFXFXvOAYsrjAhYO9yvhOlmQTIqVd/FtpHGApiDNr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6632
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
Cc: kernel@gpiccoli.net, Guchun Chen <guchun.chen@amd.com>, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, Mario Limonciello <mario.limonciello@amd.com>,
 kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>

Regards,
Luben

On 2023-02-01 11:48, Guilherme G. Piccoli wrote:
> Currently amdgpu calls drm_sched_fini() from the fence driver sw fini
> routine - such function is expected to be called only after the
> respective init function - drm_sched_init() - was executed successfully.
>
> Happens that we faced a driver probe failure in the Steam Deck
> recently, and the function drm_sched_fini() was called even without
> its counter-part had been previously called, causing the following oops:
>
> amdgpu: probe of 0000:04:00.0 failed with error -110
> BUG: kernel NULL pointer dereference, address: 0000000000000090
> PGD 0 P4D 0
> Oops: 0002 [#1] PREEMPT SMP NOPTI
> CPU: 0 PID: 609 Comm: systemd-udevd Not tainted 6.2.0-rc3-gpiccoli #338
> Hardware name: Valve Jupiter/Jupiter, BIOS F7A0113 11/04/2022
> RIP: 0010:drm_sched_fini+0x84/0xa0 [gpu_sched]
> [...]
> Call Trace:
>  <TASK>
>  amdgpu_fence_driver_sw_fini+0xc8/0xd0 [amdgpu]
>  amdgpu_device_fini_sw+0x2b/0x3b0 [amdgpu]
>  amdgpu_driver_release_kms+0x16/0x30 [amdgpu]
>  devm_drm_dev_init_release+0x49/0x70
>  [...]
>
> To prevent that, check if the drm_sched was properly initialized for a
> given ring before calling its fini counter-part.
>
> Notice ideally we'd use sched.ready for that; such field is set as the latest
> thing on drm_sched_init(). But amdgpu seems to "override" the meaning of such
> field - in the above oops for example, it was a GFX ring causing the crash, and
> the sched.ready field was set to true in the ring init routine, regardless of
> the state of the DRM scheduler. Hence, we ended-up using sched.ops as per
> Christian's suggestion [0].
>
> [0] https://lore.kernel.org/amd-gfx/984ee981-2906-0eaf-ccec-9f80975cb136@amd.com/
>
> Fixes: 067f44c8b459 ("drm/amdgpu: avoid over-handle of fence driver fini in s3 test (v2)")
> Suggested-by: Christian König <christian.koenig@amd.com>
> Cc: Guchun Chen <guchun.chen@amd.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index 00444203220d..3b962cb680a6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -618,7 +618,13 @@ void amdgpu_fence_driver_sw_fini(struct amdgpu_device *adev)
>  		if (!ring || !ring->fence_drv.initialized)
>  			continue;
>  
> -		if (!ring->no_scheduler)
> +		/*
> +		 * Notice we check for sched.ops since there's some
> +		 * override on the meaning of sched.ready by amdgpu.
> +		 * The natural check would be sched.ready, which is
> +		 * set as drm_sched_init() finishes...
> +		 */
> +		if (!ring->no_scheduler && ring->sched.ops)
>  			drm_sched_fini(&ring->sched);
>  
>  		for (j = 0; j <= ring->fence_drv.num_fences_mask; ++j)

