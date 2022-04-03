Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C814F0AFF
	for <lists+dri-devel@lfdr.de>; Sun,  3 Apr 2022 17:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EAC710E5A9;
	Sun,  3 Apr 2022 15:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A3310E5A9;
 Sun,  3 Apr 2022 15:59:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S6/fSjJf3LEEl4Q6flTcdEiUjQceMC0X0m83+hvA2yhTyUXZ3rzRbfzpdB343RvGgd93kmcXiEt982lIBcHEj/qm6fWHM1Pa5WSMkgaQ6DeTYLK2qESnGDliu5JKWOdIwVeLyOH3ipXGB9wiv5ASHI/Lz1tPLU9TBiJbd9UEMRC/VHuFZ/xM1PhUgUYlczstuRA7W0gIGrF9fl+8krZuDM3B5nS7nNntMTAX4DXHqXtXadXBMM7nGrJhfq7d98fzpdEq9IeIKrsLFsAa6PxLv2NxmKZ5g238oTr1xx6/pvA36bIDMKNJ99ocfXsVWJCrgOKDc5G3T4lwfH657lBwYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G2leFqeutSb8xbljt64lq04w6YVWiV+BFJrbscPlvmk=;
 b=FdPEkf5qcuSl2d4oY6lOACpOPxZOx+voJ28PkAY5iEjqOqPXrIchNBmTkbXeNYT96zjELVzEGYr3XPRZPNjq+cVdYUpdMg8yLIHJ5WYdVkHCY4InK/voMXb9xrsnfNBgpEp/Bx5MMU1BzcFHEn5tZXXowag8LxwdwRZtnz/WfA+gQv9sv/UV00GDvoKPwFLwulnG5VJdODkhed7BHfKW2412Pw9gQgtlnY6d1lnB9uqP+YUCT+CS+VSXrZ1AXzJYxBwFl33l8zGgcKL/mvYmJh0xPNYObe7qtYYWSYF9luKaLdMhiA8DYkIp9R65VokzyPYTFG+49v7Xue8P6Am9Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G2leFqeutSb8xbljt64lq04w6YVWiV+BFJrbscPlvmk=;
 b=OPbguAJ+twLNppWH/MkdOmtHD5RdkTdsX19kgmJYOPqpJps9/60YphJzWz4RBxUhSk3v7PDAu2hreZXkcbQIp7GgYWR2+nE8PuGrxIIU1JXkXzKMAkzWsMpTzdTxZTijxS7GNWg88gbmlrK8UgQ/V57CnnTBkKi+Wk2cC48+l6Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by DM5PR12MB1276.namprd12.prod.outlook.com (2603:10b6:3:79::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Sun, 3 Apr
 2022 15:59:12 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::2c60:fd3:43ac:cfe1]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::2c60:fd3:43ac:cfe1%7]) with mapi id 15.20.5123.031; Sun, 3 Apr 2022
 15:59:12 +0000
Message-ID: <b9eb079c-3ec3-6095-92ab-5dbfab88d327@amd.com>
Date: Sun, 3 Apr 2022 17:59:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 06/23] drm/nouveau: stop using dma_resv_excl_fence
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 dri-devel@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>,
 nouveau@lists.freedesktop.org
References: <20220321135856.1331-1-christian.koenig@amd.com>
 <20220321135856.1331-6-christian.koenig@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220321135856.1331-6-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR0402CA0015.eurprd04.prod.outlook.com
 (2603:10a6:203:90::25) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c440c0a4-0339-4a61-b352-08da158ae4f2
X-MS-TrafficTypeDiagnostic: DM5PR12MB1276:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1276489BDFE96791AD99A34383E29@DM5PR12MB1276.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bJXfJ4edCuAd3plj8zo9+weL62NKKEzwd+U45YNE0+9FnloPvLEpcjiCyvtujPYDvxthkAL1tPWfLC13aGoaG4Z54qCbsZ3TG2+lpz7NWaAk/KDEmm5mVR4dfe6wr4/xowr11uXdpCVinEY6g+BI/N5EWv9DcRdGEoyqWjcrMZz34IOq7z4FGhKDqrDhWk7p5muqDosth+azyTD8nW27c0J/uS7oo9pAZxcjq6BdLz0wxUBz9LMaC8yxPam65pevq1u3MpCLKaYC/le1mXQ6LrPsr2Ys18Z18+vDk2wxoSEiMXNiCgtJOmIziw3CrjaSkeQRkaUrsaxTmuIgHI3dr2ied8LVBHENLFjCkzx5pOvo0eUahiikv/RszSKWGftwIys0NAKgfkrRLNaAhA09AWE1YTc820fCvdYP/1FUXBJRfm5oBUNygqwq/o4vANh7uIiHbfOaJaFb5bML+6D1eAt7SoP5UGpffA+i974RrN5aQUMvhkLiYD03HFpRqI7JJFvwU6EHrbqcc/0x1HBUuo+9pCzeN5wgOJf1EK7JBp+663be7iKU0Wmix7YUsPl76Yu+mafA2MvssVAucVMt0wwBlTTq29+vr4zCXwCxFqYHqqMH47fEamurAry6vAxRSFbCeUpcVWahkBBRPuS1xPawKiu3sqUGEGcJ9V1s58uwze+qdq6/onqRVq4tmjj0p6cTO5COVgT5Y+nW/m0U2074OeV3tZlIy+fZZ4EzpNcmdIymTKYQvE7ZpxPgPiWd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(6512007)(66946007)(8676002)(66476007)(8936002)(66556008)(4326008)(86362001)(2616005)(31696002)(2906002)(186003)(5660300002)(66574015)(110136005)(6666004)(36756003)(6486002)(31686004)(508600001)(316002)(38100700002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZG5TRHJVUW4rUnVOc0FxcnlqZStYRnlFcFd4dGcyQXoySnQrZ0pzRlpwNlRU?=
 =?utf-8?B?ZDAwUkZiMlFOMS8vTGpDV0QweituSVZZdy92aVVMek9URS9lRC9vRUd2TGk5?=
 =?utf-8?B?bzBtL2hOYWRVWDhHNVo1RG14ejZPa1U1bW9XVlhETDY1N0dQNFA3cm0wc0pU?=
 =?utf-8?B?TlZJU3VRMWUxTUxQY09CK1pKRzZsWGlWblNjNXoyT3ozUWsxaHNrb1BKQ1BT?=
 =?utf-8?B?T2tnbCtvV2tGek9ZaUUycFFSaHIvSm12Rit4bW1MUnZad1JyR1BxUmp4Tnhr?=
 =?utf-8?B?TzhaWCt4TWd1amxPc2dLT3dHY0JFWjJrU3I1U1FsS3VQRGNTNmFDTnVobzZi?=
 =?utf-8?B?NDFFcDVUL3FoWjFkK0FrT2RjM01XWFc5azcyRmFTek54VW43eURaNnFwbml5?=
 =?utf-8?B?QnFQR0pZWXp2REZOMmtNRUROOU93VjMzZlhFRFEvMWRObmVaemFncHM0MS83?=
 =?utf-8?B?NEI5eDJ2UFNON3cxR0R3WGhLM2tlM3ptRm9ITXJSSEgybmFydzkweG4ya2ox?=
 =?utf-8?B?NTRQYU93b1FvcFBLZlZtN1ZHUjlaNGFpR1dyeWdGbXFyaG1NTlV1NVcrMzg2?=
 =?utf-8?B?UUdNbXB0VDlpZm4vcFdSYzRnWkFEd2QyeWI5SGpjckIyZktMMzdDaG95dE5M?=
 =?utf-8?B?UnUxQzVjVkh0L2dKL25aNXZwWDBjalRNdkF3SVlmZ0t3QzZmR2dURDRGcHhi?=
 =?utf-8?B?enNIMnNGN0JlQVprbTJ0RUl3T2Q2Q3VFVHd3ZFl2OTROaWJ6dzRCeVdiM3lq?=
 =?utf-8?B?bjdjVnVveUo5QVJpTFlhWEQrTGE5ZXJ4STY2bTN5aUxWQXlzeUVWajRqSklu?=
 =?utf-8?B?bkpOUnBUV2twNWZNYXJyMTNzZlhsQkQ2RTlROFF2ZW91SEpLUGh3Q1I0Z2I5?=
 =?utf-8?B?NkdEWTkxSEtnelRJS29vQlRPVXFGRVRrYXlXQkE1SnREVldEYk0xV0JHZmhv?=
 =?utf-8?B?aUVzU3dwbmlVblg0M2FkMGVQU2Q0R3BYUURIUjgxdEhiOTR0N1hjNE9GVG03?=
 =?utf-8?B?enZ3VkZBdHp1R1JSWnluZ2pLTmRCcXEzSDdpUy9vZTEzMGVpOEdQZDZKbGt4?=
 =?utf-8?B?RW10dXArUU8xbTBsNFpMN3l6MlJmc2txaWp4YzJKYUZzZnpCSnh3V2ppYk1K?=
 =?utf-8?B?dGg1ZHoxYWc3cC9kbkw3eTVNaTczVXN6Z1hRcDJiMUk0ME1WU3NOOVNkRHAx?=
 =?utf-8?B?YzNQWXpVVThReDFyaGVvd0hEZkordUdpdW04blV3ZnpXaWNjRFdsai91eEJR?=
 =?utf-8?B?a2JqMy9Qem54TGNUcEhjbzdtS0RNN2xwTldmWlNqbEJFMFN5TDdrbVJlNllI?=
 =?utf-8?B?L0s3VTlPb2J1aGoxSWN3ZzE4V0hLcUd3ZVlPWGgrM0lpMXJjNHpFcWVkZ2xO?=
 =?utf-8?B?YUUySzRlcVU3dkRCUERlektzQXROd2FOZHhTVm4ya09GWm43dllRWXY1ZkVN?=
 =?utf-8?B?RnloMGhCSVN4QlJsbmlFMzNVb0M2WjFEMllJMFgva3lIcGQ3SGZFRmpxbDFW?=
 =?utf-8?B?dGxQZDNLSHJ6VndBM1FpL0RDUGgzb29MQ1Q2VFVMNkFoM0tPWXU1cG1tRUNX?=
 =?utf-8?B?ajdMdGFFNEk5WHMvdGdhVUt3bWVXSHBud3M1bVlqeFRYOXNYbHdFZU5Dd290?=
 =?utf-8?B?V3F0cTltUTZJREdidWczOStLWFlHR0w1cDc3ZDNpdldtNzVyWGJDS0Q4Q0tI?=
 =?utf-8?B?M2VCN2xvemExVkJmTEJQWVNKVGFmMGxGVkliUWRtc0Q5SFp0VHc4eEVwcStN?=
 =?utf-8?B?OGJHcFBPWlppQjVRdlZyTldzNnNtdkltS1BOYVZ1OXdlaWx4NFpsdy9VUG5J?=
 =?utf-8?B?ODluOUdvV1NVSFlzcjBIRlNmTlBmcFBvaHRTWHZiK1V3UmF2Q21NNGY5RW1r?=
 =?utf-8?B?VkozRnE4bmtVVE9PdENsNmljWHE4N0UzTTBJTElRSjU2V3ZrZnV6NlY5V2p0?=
 =?utf-8?B?bTJTNFdsQk9aOFlsNVdXSE14bXNWWDU3dHdFeTlsOW5jem1DbWUxb0JycFdM?=
 =?utf-8?B?aktKOXlsVFlpQXlvUXpXd09iVDh4TzUzQTRxL0pMUUxJRUFQQU5aRk9Rb29C?=
 =?utf-8?B?Y2p2bFhBcUNQdXdTdUVXQmNyNE00WFJOZUZ2Y0NZNjlwWTZENUwvaFNtcGww?=
 =?utf-8?B?MDcyMW00ajFJamYwWkg1ZTVBOE94Tk5YTjB2aHByOU9UM3hVYkx1TFpPZGNr?=
 =?utf-8?B?VmFpM2ZWUFdpa1FhTmdRVTFsZjJON2ZHa2JNNmV1c1VPODlZRUNlUXJTS3Zv?=
 =?utf-8?B?dFI4RU12MUp6YlhIQkFqVU94ZllEeVYwc1ZvVXdta3lZVlA5enZVUU1ob3lt?=
 =?utf-8?B?MHZjZ09ITXdidU0yd0M2aXJaU3RqQ0lrNGlPeURqTzFpVXlwSmxoSlBmUnV6?=
 =?utf-8?Q?GuFRPaKErGnUmms5g/JNqWRlFZgFkkMwusu5hXv6SOvUo?=
X-MS-Exchange-AntiSpam-MessageData-1: aWvhP0ZRlb2Qnw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c440c0a4-0339-4a61-b352-08da158ae4f2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2022 15:59:12.5564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sigDnFbHE0FxzHPvwvRQzbAxFh3qE8l/qw8O7+fBT6yZwy0LGMpd+ISlutz8Xnl+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1276
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
Cc: daniel.vetter@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just a gentle ping to the nouveau guys.

Any more comments on this? Otherwise I'm pushing that with Daniels rb.

Thanks,
Christian.

Am 21.03.22 um 14:58 schrieb Christian König:
> Instead use the new dma_resv_get_singleton function.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: nouveau@lists.freedesktop.org
> ---
>   drivers/gpu/drm/nouveau/nouveau_bo.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index fa73fe57f97b..74f8652d2bd3 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -959,7 +959,14 @@ nouveau_bo_vm_cleanup(struct ttm_buffer_object *bo,
>   {
>   	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
>   	struct drm_device *dev = drm->dev;
> -	struct dma_fence *fence = dma_resv_excl_fence(bo->base.resv);
> +	struct dma_fence *fence;
> +	int ret;
> +
> +	/* TODO: This is actually a memory management dependency */
> +	ret = dma_resv_get_singleton(bo->base.resv, false, &fence);
> +	if (ret)
> +		dma_resv_wait_timeout(bo->base.resv, false, false,
> +				      MAX_SCHEDULE_TIMEOUT);
>   
>   	nv10_bo_put_tile_region(dev, *old_tile, fence);
>   	*old_tile = new_tile;

