Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F8590A1A2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 03:11:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8264010E0EF;
	Mon, 17 Jun 2024 01:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PN/omwI+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27AF010E0EF;
 Mon, 17 Jun 2024 01:11:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K0LYj7ydn3arbwwsOEz4d+K4rrTgdFKb6tzo1tRLs8XR19OMnotc/leX2pGz4kL/oa/MF9r6REJIXYe3FUbZ6TzxUyBJyH79bd1p+a+VScjaqdxbwMuM8UdqTpcaiu18WXg4oaIR6nzkRI9sA0mD2YxRAA1uy+QUXyT1ORb4VohulGAA+r9bktJLTLMf5N0EjtRDqWAU83y1F/OUyWYw8i7jNgyBCGzrwjitCLA0lIx7RbvaQbyGClV+nLc7wJy93awRzQ8EdA0/M6dlPHI0pXRbkRwHkHWKBlBow/3G2sn1/AkiZuVvtKM7kzgzQc6edHDLwm24SlGyfUwZodOhlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MS7cfRBeblmuVxXWBdxZx7YukBwk6GvnD5nl+eNww5w=;
 b=eyQLWutfEbCeTfR1IGCJ7yPd/QJeQ1aidWEKvbyZ1c37m/2w2/MMzVzO+q24u4CUXmhWfH0tXZke2Jc7ev10eNOrRZF1IuRnrUdQa1CUZs5RCWGQivEuN5Wbg4X1nRGlb1QGEaCg48BHof8E7XQQbFMX+oWJ8pLfLTRYl02CD7sZ+ZZEy+ehfPHQ8IT0WXAUru9t8p7BB31HKWGdvhuwbxaHpw54mO3tjzvIVuH/y0pYh85m2AGGuDqPF5mI6T9L1DEInKZ1V8185CBmwVSQHjjtr88LawBzai9k3ImVIzwH5udJpPvkdeJ8euo/DgnU85mt7ky/LgYxlcUdN9COVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MS7cfRBeblmuVxXWBdxZx7YukBwk6GvnD5nl+eNww5w=;
 b=PN/omwI+8ywUmZIBlrzRQBestOLL359bX+aEQYNusgZnaiUz6TLb8FSTkwOLffZyJuP6sb5UaTuaR9mkAGu7YnkSAtaIUums0xBi+QsEWLiFJqrWwL+vZj0ZpbFQf+BkJPcYzjideJzHNPOBT48pqm2jjY7Omm4Io/+k23yMSUPUmB9v9hVHl/ru7gLUWwDZczWD7I2f4u/H3Y7aCplSBllgf0VhYfnOyQz2lQhTCpywRo4dROJrZOjMbjFPyn2iLyWgKZpw2g6UqwnTAVnlXxs5UeLoKkZrQ3nFVlhmC9zuW9eADxzYauhQAM8CYnhMx7aoba9xjvMMsobyK+S6xw==
Received: from BYAPR01CA0019.prod.exchangelabs.com (2603:10b6:a02:80::32) by
 CH0PR12MB8580.namprd12.prod.outlook.com (2603:10b6:610:192::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.29; Mon, 17 Jun 2024 01:11:19 +0000
Received: from SJ5PEPF000001EA.namprd05.prod.outlook.com
 (2603:10b6:a02:80:cafe::87) by BYAPR01CA0019.outlook.office365.com
 (2603:10b6:a02:80::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.26 via Frontend
 Transport; Mon, 17 Jun 2024 01:11:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001EA.mail.protection.outlook.com (10.167.242.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Mon, 17 Jun 2024 01:11:19 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 16 Jun
 2024 18:11:07 -0700
Received: from [172.20.75.190] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 16 Jun
 2024 18:11:06 -0700
Message-ID: <ec7d1a66-e694-43f4-b1c8-612be023561e@nvidia.com>
Date: Mon, 17 Jun 2024 11:11:04 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nouveau: rip out busy fence waits
To: Dave Airlie <airlied@gmail.com>, <dri-devel@lists.freedesktop.org>
CC: <nouveau@lists.freedesktop.org>
References: <20240417054032.3145721-1-airlied@gmail.com>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <20240417054032.3145721-1-airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EA:EE_|CH0PR12MB8580:EE_
X-MS-Office365-Filtering-Correlation-Id: 18cfb5f4-2f99-4e8a-fe71-08dc8e6a6515
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|376011|36860700010|82310400023|1800799021; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aDMwb3FxMms5bm8ybWNaRlQ0MUs1dHlKWEhOK3ZSSW8xUEJ4dE8wV3RZQTUw?=
 =?utf-8?B?ZjRqUFZuaFpOOVBmWXFkdmJ2T2htQVJsb0Q3YUVOaWJFV2ZScWFCSkh1Tmk4?=
 =?utf-8?B?SHR1bFBjNm1JUStnK3JlMzJ2MXNEbWZvNkFqTGovUk1kMVJDd21DRFNkSzZn?=
 =?utf-8?B?dE9IZjBCaHRra25LeEI2VUhGOGJ5QUR0V0dWTlByRHZFUUNCaEFIczNMWnkv?=
 =?utf-8?B?S0MzUy9tWnZFc3NMbzVFaGc1N24weTczT3ZteTh6dlphRU9KUU9sMzhpYVhS?=
 =?utf-8?B?VHVkWjJLNStWcTRGc3VNT0tMOTRJeVlCQXZGL0EzQ1hWSFlPZHR4OFVMS2NI?=
 =?utf-8?B?b2hnTlRkYUFCK09iM0NwN0JTcnpQRFhBK0ZFeEFWbE5xaTMvYlhIdW8vZkR3?=
 =?utf-8?B?enlQUGc2T2pveEp5enpFWEY4TUFUanNGRWtVbFkyY2M3OG9KWW42bjkzaVRa?=
 =?utf-8?B?d1NvL3dsMTNKZkhaT2dvS2xUdFRybXFuQWdLZkkvcGd0a0ZQZ1ZTTlhyYXcx?=
 =?utf-8?B?M2d6V1dGM09QQjF2S1lOUWhuSnJtUlRrYVczajVPZTI2SHQwZDl6QTgwMk1r?=
 =?utf-8?B?cG9udGFRNDNMTXBBelNjWldHZmVQcExOMTBhWVY4QktPRjltUUhZTENPZm1k?=
 =?utf-8?B?VWc5NTcyNGNVT1p4THpHR2h0WHFwSXB3anZmQkMzSVlnUVo4aGxib2JXYXp1?=
 =?utf-8?B?aEN3eXZRUm5RcXRzL1QwemNBcWVsdVJjT3g4Rk9UblRzcGY0UUZ4R0pQTmVl?=
 =?utf-8?B?czZic2FxMWZUSUFyZ2lyU3daRGU2bmpkZlZ0VmZkdi80WmQ0N0pZdGZsWmRC?=
 =?utf-8?B?RzJxSUpoSGhMcFFWZFJoTEtuQ1ZhTGIvTHRGd0RTcy9tS0ZZOXVvekNZY2h1?=
 =?utf-8?B?bUpqNFlLNUVlcUlveE5aR2tleTZHKzZjK294T2JhYVVkM3pvQ1o1T1A5c1V2?=
 =?utf-8?B?UVN5OGdrSEVrY1pLNkF0dFp1UnNJMEpxQ2I5UEpUZE5MWkk1YnVnR2tSM0J6?=
 =?utf-8?B?TW5ob2pUMEJFa0E2N1p0d2ZyMW44OW9YSndpRkdTc3lSNWVsd0ovYUVFem82?=
 =?utf-8?B?S25ZWjd3Ym1BT2UzNmxiai9PTTVSM2dEN0VPL2xOS1AvTnRPVEVvUXRoL3hk?=
 =?utf-8?B?YnVtT3l3ZGpzSGFQMjRPMUZLbCs3M3Qwd3dqL3JjdllNTjBmTWgyUFFTbklW?=
 =?utf-8?B?OVdvdG55TTR6cVdwcjUwUGFGS3Jqc3dKRUVkUkVaT1RJVXJrNjltZTNGNW1R?=
 =?utf-8?B?eEFzenpxMndzRlFJR3preFBWVlJqSGpwelhEL3dyT3hVZW0wSS9LZHFBU0s4?=
 =?utf-8?B?TlRqWFNDeFFVZ2t0eGs3SUs2TW83RnFlNnF6V3R0YXpZUXZZTk9HMTJPaVdP?=
 =?utf-8?B?S29XRnE0RzJPVFRYYVM2SUN1cGFmRW5VdTFzeHZNTDJ5TDBuVkhTK1dxRTJJ?=
 =?utf-8?B?M3lwVnUvTUxFOHN4ZzdxYmM5YmNXUWwwejFFbm1mM1U4cDBmZ0tjb3pQcysv?=
 =?utf-8?B?bWV1UTRURGg3a1E1WDZUS3dlQitVNHhwLzRFYWYxRlU5NGVxQXU2d1RycEpo?=
 =?utf-8?B?UWlucUgxYkZnYTY4R2lZUUFPTkF4ejRwVUxZOWpQZVE4NG5KcXlJTXNSZWFh?=
 =?utf-8?B?M2NkSGlNeUpteDE5aS80cGN4a0Ezc3BCWnBVSGF4QlE1QTl6SkhFcFViWllx?=
 =?utf-8?B?SXZObnJvRFpSRTJ5aVFEZ29STHlIUW4rdXNUOE9FbTVhenRiK2RNak9HbkZx?=
 =?utf-8?B?bDZEWWZISGhhSVVNUXdObUFQL3dQMFVzbWliUi82T0VBdStJeSsydWg1elNm?=
 =?utf-8?B?NnFtN0trWGtUMlE1Y2Z0WEZSbUoxK0RKY0E0NGwwZFRGWTZiVHdnT2wyYnVY?=
 =?utf-8?B?cUg1N0F0aFRWbmVJb1dMUCt4alBCeVUxUzVqUXgyL2pTd3c9PQ==?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230037)(376011)(36860700010)(82310400023)(1800799021); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 01:11:19.2135 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18cfb5f4-2f99-4e8a-fe71-08dc8e6a6515
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8580
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

On 17/4/24 15:40, Dave Airlie wrote:

> External email: Use caution opening links or attachments
>
>
> From: Dave Airlie <airlied@redhat.com>
>
> I'm pretty sure this optimisation is actually not a great idea,
> and is racy with other things waiting for fences.
>
> Just nuke it, there should be no need to do fence waits in a
> busy CPU loop.
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Reviewed-by: Ben Skeggs <bskeggs@nvidia.com>


> ---
>   drivers/gpu/drm/nouveau/nouveau_bo.c    |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_chan.c  |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_dmem.c  |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_fence.c | 30 +------------------------
>   drivers/gpu/drm/nouveau/nouveau_fence.h |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_gem.c   |  2 +-
>   6 files changed, 6 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 8a30f5a0525b..a4e8f625fce6 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -902,7 +902,7 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict,
>           * Without this the operation can timeout and we'll fallback to a
>           * software copy, which might take several minutes to finish.
>           */
> -       nouveau_fence_wait(fence, false, false);
> +       nouveau_fence_wait(fence, false);
>          ret = ttm_bo_move_accel_cleanup(bo, &fence->base, evict, false,
>                                          new_reg);
>          nouveau_fence_unref(&fence);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
> index 7c97b2886807..66fca95c10c7 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_chan.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
> @@ -72,7 +72,7 @@ nouveau_channel_idle(struct nouveau_channel *chan)
>
>                  ret = nouveau_fence_new(&fence, chan);
>                  if (!ret) {
> -                       ret = nouveau_fence_wait(fence, false, false);
> +                       ret = nouveau_fence_wait(fence, false);
>                          nouveau_fence_unref(&fence);
>                  }
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 12feecf71e75..033a09cd3c8f 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -128,7 +128,7 @@ static void nouveau_dmem_page_free(struct page *page)
>   static void nouveau_dmem_fence_done(struct nouveau_fence **fence)
>   {
>          if (fence) {
> -               nouveau_fence_wait(*fence, true, false);
> +               nouveau_fence_wait(*fence, false);
>                  nouveau_fence_unref(fence);
>          } else {
>                  /*
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index c3ea3cd933cd..8de941379324 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -312,39 +312,11 @@ nouveau_fence_wait_legacy(struct dma_fence *f, bool intr, long wait)
>          return timeout - t;
>   }
>
> -static int
> -nouveau_fence_wait_busy(struct nouveau_fence *fence, bool intr)
> -{
> -       int ret = 0;
> -
> -       while (!nouveau_fence_done(fence)) {
> -               if (time_after_eq(jiffies, fence->timeout)) {
> -                       ret = -EBUSY;
> -                       break;
> -               }
> -
> -               __set_current_state(intr ?
> -                                   TASK_INTERRUPTIBLE :
> -                                   TASK_UNINTERRUPTIBLE);
> -
> -               if (intr && signal_pending(current)) {
> -                       ret = -ERESTARTSYS;
> -                       break;
> -               }
> -       }
> -
> -       __set_current_state(TASK_RUNNING);
> -       return ret;
> -}
> -
>   int
> -nouveau_fence_wait(struct nouveau_fence *fence, bool lazy, bool intr)
> +nouveau_fence_wait(struct nouveau_fence *fence, bool intr)
>   {
>          long ret;
>
> -       if (!lazy)
> -               return nouveau_fence_wait_busy(fence, intr);
> -
>          ret = dma_fence_wait_timeout(&fence->base, intr, 15 * HZ);
>          if (ret < 0)
>                  return ret;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
> index bc13110bdfa4..88213014b675 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
> @@ -23,7 +23,7 @@ void nouveau_fence_unref(struct nouveau_fence **);
>
>   int  nouveau_fence_emit(struct nouveau_fence *);
>   bool nouveau_fence_done(struct nouveau_fence *);
> -int  nouveau_fence_wait(struct nouveau_fence *, bool lazy, bool intr);
> +int  nouveau_fence_wait(struct nouveau_fence *, bool intr);
>   int  nouveau_fence_sync(struct nouveau_bo *, struct nouveau_channel *, bool exclusive, bool intr);
>
>   struct nouveau_fence_chan {
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index 49c2bcbef129..f715e381da69 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -928,7 +928,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
>          }
>
>          if (sync) {
> -               if (!(ret = nouveau_fence_wait(fence, false, false))) {
> +               if (!(ret = nouveau_fence_wait(fence, false))) {
>                          if ((ret = dma_fence_get_status(&fence->base)) == 1)
>                                  ret = 0;
>                  }
> --
> 2.43.2
>
