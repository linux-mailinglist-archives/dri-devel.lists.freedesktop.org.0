Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A8C3C1F8F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 08:53:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560266E982;
	Fri,  9 Jul 2021 06:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FAE6E982;
 Fri,  9 Jul 2021 06:53:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VDkqoFpRUHDwDWIH/PKXBsUkAQbM5nAUTY1E1x1SaDyuXYQLWqvd+l1D1hCkXWYn9V0OZYfqoAFzVtYE56Yakd34ZmUxile8IUymkYX3ZUEW7CeYyM+5BtWnO1HtsLfABnilhsZZdtK5sWWqEQ9jHgNFrsGGscruKEgUvvKvbMWZAi77Ye90UMNTCTuDsQ7RBCrwZVad/bgkiu66UPbQNqYNU3dWm5n87okSYcZY45fEUN6Fyfd3KCYmyvhvzDl2T7t6ErfDMKzeMsfzAGyVOBRlGVT81HOm0HHsQryO0SsryC4Q+KdxwNOsIxMcIMpXBf04xHz0i1oacb+Vqhevbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MCqJveBHj8aJeGUTMducIBuvq6+4kkTk0vNvmt1nvZ4=;
 b=fRwpADVYf+GCzF0pkec2Vr7IgY70UQ8WhTMwj8sZ+t958vbgCvvUryOo6VZB5fWHokvq0/GzJG9YQ/biyS6pJ1q8rKPmdfXh0IEQZWCk1ygmb/m1NInVPVFh7RsPcqphoczp7BmogOMx1XMiBS96e9DBFmaFgrnBqEO9CXcg0bkEXvYtEDtogYCPdO2MTgR/14cW4ZTxBAwL1A5QYNBRgbzKqH3kTiSHDLzSpeCDHWWONNUGlYYFoQgLVsdd7TiL3LDksHw6Oxa+NyYhlRr4+kU+m8gieFpjE59jgOqWA/3cgDnjh4DGM/o1KZn15KyDPeLAiKnL7P4zpDxFCf4Qtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MCqJveBHj8aJeGUTMducIBuvq6+4kkTk0vNvmt1nvZ4=;
 b=1+GmSXQWgAjS9Tf8Uu89QMSMOVciAjhqrc/BC68mKA6PKd6WiuXW4Y3RMSPp9e5zScUNseM2wro6oKUZxx4+ElDZXQzN48r3DPdRQOXwHv1TrnBFrr9viHC4qS1H7BXr2EpId4GznhdQOhgtm80Rejztjw0B4W5dorCPCKzRdcY=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2420.namprd12.prod.outlook.com (2603:10b6:207:4c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.24; Fri, 9 Jul
 2021 06:53:23 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4308.023; Fri, 9 Jul 2021
 06:53:23 +0000
Subject: Re: [PATCH v3 01/20] drm/sched: entity->rq selection cannot fail
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
 <20210708173754.3877540-2-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5588d1c3-833b-bd95-69e6-a103f2e8affa@amd.com>
Date: Fri, 9 Jul 2021 08:53:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210708173754.3877540-2-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR3P193CA0027.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::32) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:3da0:55de:64af:96f9]
 (2a02:908:1252:fb60:3da0:55de:64af:96f9) by
 PR3P193CA0027.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Fri, 9 Jul 2021 06:53:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07e94b2e-9869-4b59-5b5c-08d942a63e15
X-MS-TrafficTypeDiagnostic: BL0PR12MB2420:
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2420C064FE064EF5D66984D583189@BL0PR12MB2420.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hdFHA944mkXEQ/nK06w+wNqFiyErQW6WbOTb/hP091fRyc9Giwmx6VwuMcnwUdHFZ1Jxe85kRHQqmNWizEvtlQVWXbFEbcj2V++90J+RxldEKGEsOAnQ9VlcB8sGlDDlAwdg5SO3alA3It0ae8YRoQIpuWVBhhutOP0pS1OfLM4nJdkeSIy6KXqMPZK61ngOtAmbibYeXSm13l5emJSh+boII95HXoNd853S6woXYnUsf2bYqycl57GU8NDQl/v4jpGL+9tEyveXUooWOz/Qjm8DiySrVl8FlO/IIxKSpw+PJvbVEwDc5EqkkmcVJRBOfZk1sMOjsF/lvHmXx0sSL5r1wKQVTkZtRh1GaOS2EB0O71Sit5H2myMEIB4QXQ5eIdb5HI4btk5wcUIr5tGw/GF/458zXeKwSuWp2K6QFzFp0hIloC69zfOqxWPFOOHHkE5c+m2yzoYKwivoNtf29v2gwwk4b1F0Xkg2v/7vZTXuENFAgnYUR6gFwQ3fzKtvCiW4c7IcwzAWCeFYrEtCdLHO2I+NQMsrGp4jysYdNXEsCFxew5+giPrhqzJK68h7IjmEmgRHjO0+SdjCiKPXzj81azshC3Ch9ywAeeAJ6+LoeLdW/fCQjQQ2gA2vnwu4j/W8Gv3f+7ue/DfWIu4vd1bjm8DM7KQiHANmgHaObumOlqOo6ybdcn7bkhhxVhyP+jM+bdiVy/kph/rscbUXlQK9XeCB9WGPPICBxu1zY7I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(136003)(366004)(396003)(2616005)(6486002)(4326008)(31686004)(5660300002)(66556008)(8676002)(83380400001)(478600001)(2906002)(8936002)(36756003)(316002)(54906003)(38100700002)(31696002)(66574015)(186003)(6666004)(86362001)(66476007)(110136005)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVdnc2NuajNJSFVNWDdaVUxZejBuVkg4NzBRZnFkblQ0M3dMZ0hVOWR3ZzZH?=
 =?utf-8?B?ZzlHd1NvdHptbGlmMDlqbVAybkIra3VJYWNVb0hXa0M5K0NMVmJXcmJCZTAr?=
 =?utf-8?B?enBXU1pnaWhELzBKUjNxZEtFZ2JvM3ZNdEVrMXZpQmt0UFBEeTZ3ci9UQjNL?=
 =?utf-8?B?ZkpBRkpmaEFIZkQwRmRadC84cWZPT0Zhc3VydE1FSUdicEpkM2piOHhPaE41?=
 =?utf-8?B?WUVDRHRBNlYwRmhBMVhyVjl0b1I0ZEwvaGptY25LUFlqbFR6RGFXQmtCUzY1?=
 =?utf-8?B?elRSVnZXbkZ3UHFNa1JCeXRPVFBydS9VWlk4OElaSER2VVF2Tld3V3NQRkpi?=
 =?utf-8?B?aHdDZ012Z2FDK1ZwaFo3QWpVdVMrVFhoaVFKdVdWQWo0TlpyUHFrN2lSanhl?=
 =?utf-8?B?QXJEd0dmM3h1SXdPYWFUUVJWcnVBY1ZYZzNHU3BnaGgySDF3TUlxWU5tWm9S?=
 =?utf-8?B?aGhSR1k1bzJhSWhOaHE0dnBsUXo0OTduenBUeERDaDB6emx6cE13RTkzUXha?=
 =?utf-8?B?T2xEVjFPUFc3ZGQvUlZmZEYrN0JsVkMrZUFFeUFNc3d2YnhGdWc4TzI3bURD?=
 =?utf-8?B?T20wdklZQTJuUEVJV0huNmFFWGFtQWsvTkdyZ1I2aHZkZFZMUEZlNG5rWEpq?=
 =?utf-8?B?K2R3NVZ5VjNmQjlDYnBXRUdEbFJTcmpRRC8wOFRTUzE5QlNua05mZjZGUlZv?=
 =?utf-8?B?ZXIxNTk2VkJYck5PSi9BYk5vMitnWHlRVXZYdC8zUE0zUFlwSGExb2dNcTJV?=
 =?utf-8?B?RnFjVGlWWTlqNTk4U3JTN0xld213eTJjb1NRQTRZVDl4K21EYjI1cHozc1Rt?=
 =?utf-8?B?WGQ1MmIwTXF0ZEJSSUJhWEhvN05sV3ZaN2MvbHNKbXFZckxQcWY0K1BTRmZE?=
 =?utf-8?B?bFU5TjF2L2dEOVVJcGtQbTBLRlFUUGJBR3Rqei9NNkUxVEx5S3VQRWlla3hL?=
 =?utf-8?B?b3hDYS9WZmY5ejBFbXF0WitteUpKbEE4QldSdHBiVlhDSk1udTdSbzdnSjNv?=
 =?utf-8?B?MFRuVTVRWTU2a2U0OEloblZUaHhqMFZDTUh3LzJRai9DSHY1MUhKLzhiNDFG?=
 =?utf-8?B?aitSL1gxWW9oOVV0M3NIQUU5cGtFR25HOFdVYmZvZmg5ZU5KQVlkR2JlWUZF?=
 =?utf-8?B?dlJwckVjbmV6dEdpQ1NoSWcxM05MS2pUOUY5ajZqSCtuL2dVdER2V3ZwaEc5?=
 =?utf-8?B?Q1E5RUg1aElydHBBTkhnMTZHQkx3Ulg5eU5KUGwyZ04xV0RxbEN5djFCb051?=
 =?utf-8?B?ZWpHaDJzUmZXbkRtVHNSd0NTM0FOMXdjZnZ6dTVoWEZmaE9Eak1EaE9DdzUz?=
 =?utf-8?B?eXZjNzhuaTVKdjY1VVZlSDRtYUtrTE5nVDBMODFVdXZvN09sYUhjaE5pakd3?=
 =?utf-8?B?Zk5wTUhaTGZ6MDVBRXFpRXE3aXY3YWxHS2NIMU0rMm8xMEFpaHVWaUJoR09S?=
 =?utf-8?B?OTFGSm5LQ0ViOXE4RDlLSnRhQnB5Y1lOSnh4TmxwZ2prakNMNVRrUnFZdDlH?=
 =?utf-8?B?U0g0RXhHRUF0MTNXNXV1cHpmeUdpc3hUVEM3VXJ1Ym9Vdi92VnM3UFlqQ0Vn?=
 =?utf-8?B?SUErckh5RmhvZE1vZWtueUJsSzVkOStYZ1VjTmVpdkpCL2Y2RkJtbGFqY2ZP?=
 =?utf-8?B?VERjOExxZVFTeDVoeFFpY0RFUHV1eWU5SVZZb2pjK2gxc0lPRTMydVN4VW1C?=
 =?utf-8?B?M01NOHZXeWM3WVd6STdwOXRvbFNKQXV2T2Y4akdYNXpOaGdCVGE0L29mNVNZ?=
 =?utf-8?B?Z2Z1a0dNOUJHWDNKRktUTVAvNVhkcmVxUGkraFF6bWljdzhDNHlpTUZ0ZG4w?=
 =?utf-8?B?N21NUUVnT1hrRHU2bGtaaCtsRW5ZS0xRWGhZanU2eW9wNm9wS2Zxd0NUUlZT?=
 =?utf-8?Q?wQiEIvdRSmbs9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e94b2e-9869-4b59-5b5c-08d942a63e15
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 06:53:22.8564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rQAG036auN1rTj4y7ASMzCMUnYgkZy4acTAWyjYHvbQ9BoPQn7R6z/FpNjmwKDnR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2420
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
Cc: Jack Zhang <Jack.Zhang1@amd.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.07.21 um 19:37 schrieb Daniel Vetter:
> If it does, someone managed to set up a sched_entity without
> schedulers, which is just a driver bug.

NAK, it is perfectly valid for rq selection to fail.

See drm_sched_pick_best():

                 if (!sched->ready) {
                         DRM_WARN("scheduler %s is not ready, skipping",
                                  sched->name);
                         continue;
                 }

This can happen when a device reset fails for some engine.

Regards,
Christian.

>
> We BUG_ON() here because in the next patch drm_sched_job_init() will
> be split up, with drm_sched_job_arm() never failing. And that's the
> part where the rq selection will end up in.
>
> Note that if having an empty sched_list set on an entity is indeed a
> valid use-case, we can keep that check in job_init even after the split
> into job_init/arm.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Jack Zhang <Jack.Zhang1@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 2 +-
>   drivers/gpu/drm/scheduler/sched_main.c   | 3 +--
>   2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 79554aa4dbb1..6fc116ee7302 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -45,7 +45,7 @@
>    * @guilty: atomic_t set to 1 when a job on this queue
>    *          is found to be guilty causing a timeout
>    *
> - * Note: the sched_list should have at least one element to schedule
> + * Note: the sched_list must have at least one element to schedule
>    *       the entity
>    *
>    * Returns 0 on success or a negative error code on failure.
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 33c414d55fab..01dd47154181 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -586,8 +586,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>   	struct drm_gpu_scheduler *sched;
>   
>   	drm_sched_entity_select_rq(entity);
> -	if (!entity->rq)
> -		return -ENOENT;
> +	BUG_ON(!entity->rq);
>   
>   	sched = entity->rq->sched;
>   

