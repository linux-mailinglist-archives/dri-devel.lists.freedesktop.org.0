Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD25485D626
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 11:58:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D056F10E569;
	Wed, 21 Feb 2024 10:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZVTzdEs3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB0110E569;
 Wed, 21 Feb 2024 10:58:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2ezXbU2j1laOJkj21eISL96sv60n4U21o1ZmTKxO9WsICaeFH8V94aVaxPMnsXL/p0r7Rf0uSWPPlw24biaUbsUcyTS0DtVfXs0WYAYXzYUTD83tuoXeMztujIPrQvLm4BD9fwJzA5mQ2Jzm7y3LutesoSE6j69bcuf7sTzHDQ84lGtAKyxDaz9PLR+xtnlnVykkBdbRt/msZ9Y5zueRFSa1A+u42HwLPowl0QAfEhhbqXCexVMlvxQ3VNXjrvTcc267pbUKC9taxj8d/SH+eUF5CYfbu+q0+J94FLN4+w+7PBxc52/C6/I7YuMGpCf6y5cTVPa6teBHeB224rClA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ang2y0nKPrtf4XdwpQC+H4x586FPxABKzWfWhI+Fuoc=;
 b=UmP0zFNLiNPGWlytR3XdzeHKVfmbUF4pH5LGFiiJjbtn68SN8XyEDzzNoA7JAMOHhw8vUjgoDdge3WPHoEpOOf6/U+ep72cqWcUPEtDSVb3RnTCaXQ+9N1yLtniJcTExeVMVe8bvsjl8xP/bc71UIOIgayxZebxofgBK2aJ4xaPykohu8uUdpMAeObQC5uHQuJ32bf0TCw5lL6WzkLxKJ01e+jZ0qewD4u7KO4SqallzDxYA7SYE0l4tFedcU9YIf3FqMeajFoMEah7ykNwkng14ox545JV0Y7y5W3k/wlob1KW6Y+OArZTDbX0g01i6g1G1D++KeiMFMDNCvSBRVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ang2y0nKPrtf4XdwpQC+H4x586FPxABKzWfWhI+Fuoc=;
 b=ZVTzdEs3q1mJcmCG4MHZP7dyxgkpWsylqgoWwogiSu0wiePsyo/1HlrlE3i8kVDXJhtgbK/uggeRQt6xU+CUV5p1KtS/zToP0ReBvle1zi4xQ+jLLw9f4Ru4o+Ws2bpoa+Atkg+1theCXmLdspq+ATsoJ1IHXiKPeUZwdMmsj4g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL1PR12MB5190.namprd12.prod.outlook.com (2603:10b6:208:31c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.19; Wed, 21 Feb
 2024 10:58:04 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7316.018; Wed, 21 Feb 2024
 10:58:04 +0000
Message-ID: <75a4102e-b078-4e95-a5b5-a677ad9622fd@amd.com>
Date: Wed, 21 Feb 2024 11:57:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] drm/amdgpu: Use KMEM_CACHE instead of
 kmem_cache_create
Content-Language: en-US
To: Kunwu Chan <chentao@kylinos.cn>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240221095907.172408-1-chentao@kylinos.cn>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240221095907.172408-1-chentao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM4PR05CA0007.eurprd05.prod.outlook.com (2603:10a6:205::20)
 To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL1PR12MB5190:EE_
X-MS-Office365-Filtering-Correlation-Id: 685522e1-dead-49e5-8942-08dc32cbfa53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eHFe4aXVTwtdSdNbuU+JLfJeF5OtroxqfSCPaSqnALAxfFqe0KOjZ/saTSR0+TTM5JRF7+ix8DsrDVqVE6hrWBEJpIMPvfSa0SbgVr2nNZ6OSiuAUZy97c/LIsp4nEdcc5u9WoJF6nGQeIFm7+VZ1TuoibHjHQbyClRqy5mZKJ33Y6uYH19AFrIoPXsBdAFVoHZNCRQ9HBcCcF6AlJWylULpx9SZyUI91G5viVUJAy+J6/jYfIjukKlruuyCK2vtOvQyS404GFLVybJ7imiw1BFILxdltrqrZ8vPDcKd0q6xq0+YLAAEENukPqq5/kJGw+YZvpopbPCRov+4V/pZs3Q/SCaLAwtbjjd5xqk9RX2XcovZUOOWJw1A2s21pfqO+LCRC5AoiV774Coqg+ScIebYN/ZyMXnIlTleFGMOBeCRarVVitIe1bLtl3FZMN2rpw2xErbenGvRh4XWDi9cFbC+4xd7E5pq8ZQgN/bSnDdkogtKY4OFhOFw31Auu/m2jHDSGnsFhylcnvmwALjGbj+D0XyvrXaR56gEcHyp/bY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkdSbFB0Y2QvT2twZ3IvbHVVRmk0ai9Md0lKWWxZeTdhWXp2bG1wRFdXL1pV?=
 =?utf-8?B?SktHeHVDeFNnbzcxSGpKWU1VVFlpNnhkOEE0L1ZBZ0s4NW1IdG1ySng5QWRy?=
 =?utf-8?B?bzdlQldMdG52WThaK3poamppUGhYd1gzOUtITFRuSGtYQkFzK2tqNm45NDBR?=
 =?utf-8?B?T0c4dHl4Q0JGRXBVNll3MkFhYzRCZDFiS3BhLytSM0VMakVRM0Z4RDIyMUJN?=
 =?utf-8?B?UGNlWC9XV3lpSVN0ZldyY1l0d29ES3VRV2FyWlJtOVNXSHJXczNSdFdvWGYv?=
 =?utf-8?B?Qkk0T2pMNy9EMFNxVFF6RTdvMGJ4a0wyOFVzamJVY2tJM1RscXVQQ1lla2FM?=
 =?utf-8?B?WTJvZ2FxVmRicDlaQlFJazdKUFg4MWw2U1NzYVhKUHBWTFhNeVlFOGRHM3d6?=
 =?utf-8?B?KzJ3U3ZaVlFiZFBuT1VqSk1XbEJvRGtmT1FGY2RMNHJ2dHk5SndwM21ISDJP?=
 =?utf-8?B?L0dWWlppdnl6U2Y4UEhrRUxTaDJjNk13eHIrS2VJRTV6VGx5ZmRDSUNrS1N3?=
 =?utf-8?B?WGEwYWFScEE0OUJVSUd0eHp6VWpwdit2SlFWeXE3SVF0S1ZtdnErWXBVeUdT?=
 =?utf-8?B?bTRHVXlraGxxN0tGSHZwdHJiWEIySWhGMjB4ZWVaeVA2WStIeGdlcnN5WGZC?=
 =?utf-8?B?Y2dYK3VnQm9TUGwyMWRpTlU4SEZQVWozMS9HMFlkQXBwN24zN1B6MGdUaWdX?=
 =?utf-8?B?cTlUUVF0Y2E2aGpMTENHUzNoOE5PcGdPbHBqNklFdDhkbUcxcjk1T0s2cW1B?=
 =?utf-8?B?YUFmbG1BWU1NKytUUHQ2MEhCSDQwY1cvZGszOW16V1hocVAyM2VKcnlmQVZy?=
 =?utf-8?B?VGptOWxQTHhxQ1Nkb2xYY0lSWDcwV1MyODlYSU9Sd3BOWi9vamdjU2QwRWoz?=
 =?utf-8?B?bEpWRU1KUWRwTDdZNFBKQnRhbnlqYnhqYjBhZlJLWXNEZVRDaVpUYVFJeFhs?=
 =?utf-8?B?KzJ0VGxhZm5KVEdsZlpRZC9ZYlQzRk9sRGtEd0orbFRoeGtvbU02K2dTYmJY?=
 =?utf-8?B?Y0JrZjdXemZRZk9kWmZDY0M4NVM4SHJQcEtYOUhOUUxKMnZUeHZjejFqSHZN?=
 =?utf-8?B?NlcxcklEMDVyS3h6T0JOSkI2MHZuNS9vNndNM1k1cXhDWUg0YzlVVE92WjZG?=
 =?utf-8?B?OXlvZXI3SWYzNjRCNklKWWZuMHV5YXFzQ3dPS1VYYTJJUTN5b3dNY2dsZ1gx?=
 =?utf-8?B?TUxvcjdtWURwRU9iTVZUOVpIQTdhVy9uZ3pDdzliZjV3U2tocElXbkdoM2Uv?=
 =?utf-8?B?UFo2Y2VMREFLL0RNV1ArTHpDaVpFbUdHYTZ5bUo3WlltY3hTVG5xM1Zjb2ln?=
 =?utf-8?B?RVBVSlZzTnZVNWFYdkRMeDU2VkRIYmN1VVNqOHViMVZuSk1KTVFRZ2djSHUr?=
 =?utf-8?B?OHh6TnRoWmZUT2JOcENWdm84ckoxd2REaCs2d2Q5cCtuZFZoRzBGTTVrbk5O?=
 =?utf-8?B?UmNLaUZpcU9nVkJzOExncUJaTHZuSktOdDdHV1N1ZFhhL3gwbU1scVk2YVlY?=
 =?utf-8?B?bWFIblpNMGFybFJiR0ZDaUZON0FPUnFPbzdka2ZUNlhxWXdqTG51SmxpckJB?=
 =?utf-8?B?WE5WYlVMMExWUkVNL1ZLRkVYRi9nRG1uaGVObFRYU0JPMnhuUmRyN0JyZW9U?=
 =?utf-8?B?T2NPSkc1SnhzWUZQOFplMDdKZEhWSkd4Y3hYMzhuUlpYcWZkemswT09FTmlh?=
 =?utf-8?B?NHErZjN6N3FXR1p1V0lET1VOUXlKUFkxMTBudHJpM3lQN0dkLzhkQ2tSM1Jv?=
 =?utf-8?B?NVVKUzlwOUo2YzIzMm5LMXFFbWIvcEJZc2lVSVV4bHVMV01iNnU3Mmk5ZVNP?=
 =?utf-8?B?ckoxN2hzSi9kNUJYUVg2RW5Cei9KM2pqVnFVTmdSVHpaQWowWWg1OW1ldjBu?=
 =?utf-8?B?SVZ0TVBxYStHN29vcklwR0diUnlQMDdNdkhSaWJhdWY1ZDhhVFJOa1lTd21K?=
 =?utf-8?B?UHBsaGJscDFmU3I2SmpKZ1daUkNUbWtsU3VJWWMzMlpYMUUyMVZ3UDBPWG1V?=
 =?utf-8?B?MUhqdHM3bG1ZdklYakQ2am5mTTFLb0JyYk9qUU9BOG9FdWNHQm9aYUpad25w?=
 =?utf-8?B?UG5ERElqa1dQM3lENzlWNTlxV1hjVGJTUHdKRkwvek1hSllmSm4yR0ZqY3V1?=
 =?utf-8?Q?OmrJEhruOrA5D8vKOwgq1T6Gr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 685522e1-dead-49e5-8942-08dc32cbfa53
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 10:58:04.1530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b2mJ8KhSsvGYcTN8dz5jxY6aQRN/PH/YcEdSO+GTcKaxfgFtm74u6O7P36hbCdhB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5190
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

Am 21.02.24 um 10:59 schrieb Kunwu Chan:
> For where the cache name and the structure name match.
> Use the new KMEM_CACHE() macro instead of direct kmem_cache_create
> to simplify the creation of SLAB caches.

Reviewed-by: Christian König <christian.koenig@amd.com> for the entire 
series.

>
> Kunwu Chan (3):
>    drm/amdgpu: Simplify the allocation of fence slab caches
>    drm/amdgpu: Simplify the allocation of mux_chunk slab caches
>    drm/amdgpu: Simplify the allocation of sync slab caches
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c    | 4 +---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c | 4 +---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c     | 4 +---
>   3 files changed, 3 insertions(+), 9 deletions(-)
>

