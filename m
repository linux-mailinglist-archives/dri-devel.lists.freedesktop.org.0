Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D69E823ED40
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 14:22:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877726E093;
	Fri,  7 Aug 2020 12:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606F26E093
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 12:22:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NSQ/7ToGw2Sdtw8gPBf3th7tzAq7WYQaflTbLCDT6N+eyB2ydHuurGHjkYHJb9bLhyq9plcjxCDjeZ0CAr5CX/4rfejbo5sZ0xeKfOJ8QtF0Lgu8kC5PuFmetltuljdWoceax7ACx//1FFBtqLagi3wTH5THeKA+89ipb7wP+PsWSrz5EAhMMZ/RkdbKhUgB5i/9MnyWvSJQgYkXLkVtagXEKVs6K72gnLCSgOLlSo4cJSyK0jdfrvEtrLrjramHOUxS8wryF4GkN88Ij/nFc/OV8nuxIajdcK4o29ZOvGGOhQ27192QLo72z5LX+ANomwk2t09xxFQkBYd3EGyJWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GL/FK4+KPQANESf+R0eBpwdpbYE6frMvF893X1njNOI=;
 b=CSfKhWM85tppJtpRf/0AYf6scmqUqfaDEoJ0/raz2BnNabrA4O0C8tQMPfe4ZAUqyrhke6yq7YrOx8hkmikVvOZWOgGJx85R3oigqjdPBY5q6JkMWfnBMgH6Rh4j5tuKJaEjULLXSiNdMsMFgghQu70CIQf221C0Kth3lR3aQpgP2l8IhKYoJ6+0Ur43ZWgXbpVf7XoaCasGc2Vg9PT12YYe6JTZc4r2MUEE/Ty4sQU99n3sdb58xvPts/9/srDOs+09mGFI6GO7X8OXlk8NTiAH7oQ48krmRfMy1lNiOw32fOfzSups7kvmptAzCDuXO37fhdvp9DBnHbAqoOsJww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GL/FK4+KPQANESf+R0eBpwdpbYE6frMvF893X1njNOI=;
 b=J9I8wySGLSqoZNPnwVFYugFRQt3jLO4sJomqi769uCy00GPC1kXa4+Kc2X2uGuVdO8TBUSDTqmwvNuCO8gV0gc5QU1lnMCe/khs7ouIZKVqyaMyzeHvXN+fh8P2tbq1TQZ9bxCtFVgA3Zcc5Mxt0Rl2FS9IyOAO2fJM88SjA+nA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3770.namprd12.prod.outlook.com (2603:10b6:5:1c4::19)
 by DM6PR12MB2780.namprd12.prod.outlook.com (2603:10b6:5:4e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Fri, 7 Aug
 2020 12:22:15 +0000
Received: from DM6PR12MB3770.namprd12.prod.outlook.com
 ([fe80::71f2:c29c:a6e5:5150]) by DM6PR12MB3770.namprd12.prod.outlook.com
 ([fe80::71f2:c29c:a6e5:5150%4]) with mapi id 15.20.3239.024; Fri, 7 Aug 2020
 12:22:15 +0000
Subject: Re: [PATCH 4/4] drm/ttm/nouveau: move io_lru storage into driver.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200806233459.4057784-1-airlied@gmail.com>
 <20200806233459.4057784-5-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <2fb12d49-a9e8-2043-4c78-add89407e888@amd.com>
Date: Fri, 7 Aug 2020 14:22:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200806233459.4057784-5-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR01CA0115.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::20) To DM6PR12MB3770.namprd12.prod.outlook.com
 (2603:10b6:5:1c4::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR01CA0115.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18 via Frontend
 Transport; Fri, 7 Aug 2020 12:22:14 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cc4c2961-4deb-4e9e-e120-08d83acc84ef
X-MS-TrafficTypeDiagnostic: DM6PR12MB2780:
X-Microsoft-Antispam-PRVS: <DM6PR12MB27801677F800CDB006752CD683490@DM6PR12MB2780.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XTEnK4HlaVGh80PLY9HZ5kMyEX4sk+f9xaPrFVONYSdQULD67dkgXujIPIaLRDiGP+Tc3+73DpR9DPfNzhoE5ISaAHyQLgpvinW618pNkqfzj+KqpuEBR/tqudwoK6pXEY4l7vefIiXnYaftAGv5VwcJTILfks4baC2ktIjKEJ5Q/WqGzwDhufEcF5VdJRFsCG8lXDBw+JsjNBbpuSztMpzaeYcwHSoDFT5J2OLB6zdxbsqDLJbPs8e5GMhp6Dm5+yuot8qyCSgEXCQ56WTg4Z52SnEzJGmjAC4fhXweLPYeKM+04pgZdvqg2rJq21iAGdE03OBhehtipHKyAmPdtc/sREjC+kpEDlfDK6deeklXXyedUneGypFjDvnccQa7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3770.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(4326008)(31686004)(6486002)(316002)(2616005)(36756003)(66946007)(2906002)(83380400001)(66476007)(66556008)(31696002)(5660300002)(86362001)(8676002)(52116002)(8936002)(186003)(16526019)(478600001)(6666004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: FH/RC1sL+SC84WNHcMQ9iOyfUpKijv/id8DTaqQdxzDnLrJ4y3wP42o6DZFOJ+zCpxzDUwxsgHYSz9ZvtLXCrmIIziaHqGkOM+PlTBg59x1FNDKES5FhZVWb48xaeRdfHgSJZ8BnoxQ8OkZqRtnaPWIMT2FEGFge71a9VbaHYg4+AiUtvy1wfAR5pS2c2tAVbgRnZPytOucv7UStkCRfUz+8CaAZ/ZQTPYSAXFzWW0Z55U3KalkLan7YODepn7F5YJI/w2OHPYJ8Ei7tRxxkx3UMkHbpYA9aBX9kdgFtW05hw6i7UhN0X+vfaL1hRE9pkL8Tcq62rmN2iVEDF49PlmdI0z4m5/SAH3WWoOXMQ7Btbk72PrXBLWj7fADn8yX+uggK7trsdtVv5+qx1LJVr9W1FIOqhivBUJuZ3jq/nm0N8MlIQMh94O0H8JJcLFLv4z6hVqthPcNCOiG5PyyTWoN7X6R2xZeLp5nRcSfEDikwf+89SgJB2qJPUwTmbrobnbbAJhMtZHdp+0Fm+E/qG6EeRW4iE+LmEODz32oZImWbBSwZBngCLUWee2pZjiLpsXvsXBFlBzH+j9kEy5aQpFeSPjD3pZfRmDGpAPPe9RuLWaxdReRS9znUvFhkbEjs3Jpbo2ag5k0depig8Eg1w2pHI/AVtnGe8iiLccdbwN+QixqaIVT3OgmNNJGwiuPjp9hhO5qbYNrBf+Lztrngrw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc4c2961-4deb-4e9e-e120-08d83acc84ef
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3770.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 12:22:15.5925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eYrfOnlx+osWuimh6f/QBSY5ROGW7uJFX0UqFAxdw8LtWaSzcHTKROUc+OfbcjgO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2780
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
Cc: bskeggs@redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.08.20 um 01:34 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>
> This moves the io lru tracking into the driver allocated structure.
>
> Probably need to consider if we can move more stuff in there around the
> nouveau only io_lru functionality.

I think we can even go much further than this. The whole handling can be 
inside Nouveau, completely without the help of TTM.

I've already created a prototype of this once, but since I don't have 
NVidia hardware here to test I can't hammer out all the bugs and typos.

Give me a moment to clean that patch up and send it to you once more. If 
you have some time it should be trivial to fix the issues and make sure 
we have a clean design here.

Regards,
Christian.

> ---
>   drivers/gpu/drm/nouveau/nouveau_ttm.c | 24 +++++++++++++++++++++---
>   drivers/gpu/drm/ttm/ttm_bo.c          | 11 ++++++++---
>   drivers/gpu/drm/ttm/ttm_bo_util.c     | 24 +++++++++++++++---------
>   include/drm/ttm/ttm_bo_api.h          |  3 +++
>   include/drm/ttm/ttm_bo_driver.h       | 19 +++++++++++--------
>   5 files changed, 58 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> index 93685a376a50..86d74e590359 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> @@ -31,6 +31,16 @@
>   
>   #include <core/tegra.h>
>   
> +struct nouveau_resource_manager {
> +	struct ttm_resource_manager manager;
> +	struct ttm_resource_manager_io_lru io_lru;
> +};
> +
> +static inline struct nouveau_resource_manager *to_mgr(struct ttm_resource_manager *man)
> +{
> +	return container_of(man, struct nouveau_resource_manager, manager);
> +}
> +
>   static void
>   nouveau_manager_del(struct ttm_resource_manager *man, struct ttm_resource *reg)
>   {
> @@ -63,9 +73,15 @@ nouveau_vram_manager_new(struct ttm_resource_manager *man,
>   	return 0;
>   }
>   
> +static struct ttm_resource_manager_io_lru *nouveau_resource_io_lru(struct ttm_resource_manager *man)
> +{
> +	return &to_mgr(man)->io_lru;
> +}
> +
>   const struct ttm_resource_manager_func nouveau_vram_manager = {
>   	.get_node = nouveau_vram_manager_new,
>   	.put_node = nouveau_manager_del,
> +	.io_lru = nouveau_resource_io_lru,
>   };
>   
>   static int
> @@ -160,7 +176,8 @@ nouveau_ttm_init_vram(struct nouveau_drm *drm)
>   	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
>   		/* Some BARs do not support being ioremapped WC */
>   		const u8 type = mmu->type[drm->ttm.type_vram].type;
> -		struct ttm_resource_manager *man = kzalloc(sizeof(*man), GFP_KERNEL);
> +		struct nouveau_resource_manager *nman = kzalloc(sizeof(*nman), GFP_KERNEL);
> +		struct ttm_resource_manager *man = &nman->manager;
>   		if (!man)
>   			return -ENOMEM;
>   
> @@ -173,9 +190,9 @@ nouveau_ttm_init_vram(struct nouveau_drm *drm)
>   		}
>   
>   		man->func = &nouveau_vram_manager;
> -		man->use_io_reserve_lru = true;
>   
>   		ttm_resource_manager_init(man);
> +		ttm_resource_manager_io_lru_init(&nman->io_lru);
>   		ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_VRAM, man);
>   		ttm_resource_manager_set_used(man, true);
>   		return 0;
> @@ -193,11 +210,12 @@ nouveau_ttm_fini_vram(struct nouveau_drm *drm)
>   	struct ttm_resource_manager *man = ttm_manager_type(&drm->ttm.bdev, TTM_PL_VRAM);
>   
>   	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
> +		struct nouveau_resource_manager *nman = to_mgr(man);
>   		ttm_resource_manager_set_used(man, false);
>   		ttm_resource_manager_force_list_clean(&drm->ttm.bdev, man);
>   		ttm_resource_manager_cleanup(man);
>   		ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_VRAM, NULL);
> -		kfree(man);
> +		kfree(nman);
>   	} else
>   		ttm_range_man_fini(&drm->ttm.bdev, TTM_PL_VRAM);
>   }
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index cf8176bce4f6..1ed67842370e 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1467,14 +1467,19 @@ int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type)
>   }
>   EXPORT_SYMBOL(ttm_bo_evict_mm);
>   
> +void ttm_resource_manager_io_lru_init(struct ttm_resource_manager_io_lru *io_lru)
> +{
> +	mutex_init(&io_lru->io_reserve_mutex);
> +	INIT_LIST_HEAD(&io_lru->io_reserve_lru);
> +}
> +EXPORT_SYMBOL(ttm_resource_manager_io_lru_init);
> +
>   void ttm_resource_manager_init(struct ttm_resource_manager *man)
>   {
>   	unsigned i;
>   
> -	man->use_io_reserve_lru = false;
> -	mutex_init(&man->io_reserve_mutex);
> +
>   	spin_lock_init(&man->move_lock);
> -	INIT_LIST_HEAD(&man->io_reserve_lru);
>   
>   	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
>   		INIT_LIST_HEAD(&man->lru[i]);
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 496158acd5b9..137aab6c53ae 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -93,29 +93,33 @@ EXPORT_SYMBOL(ttm_bo_move_ttm);
>   
>   int ttm_mem_io_lock(struct ttm_resource_manager *man, bool interruptible)
>   {
> -	if (likely(!man->use_io_reserve_lru))
> +	struct ttm_resource_manager_io_lru *io_lru;
> +	if (!man->func && !man->func->io_lru)
>   		return 0;
>   
> +	io_lru = man->func->io_lru(man);
>   	if (interruptible)
> -		return mutex_lock_interruptible(&man->io_reserve_mutex);
> +		return mutex_lock_interruptible(&io_lru->io_reserve_mutex);
>   
> -	mutex_lock(&man->io_reserve_mutex);
> +	mutex_lock(&io_lru->io_reserve_mutex);
>   	return 0;
>   }
>   
>   void ttm_mem_io_unlock(struct ttm_resource_manager *man)
>   {
> -	if (likely(!man->use_io_reserve_lru))
> +	struct ttm_resource_manager_io_lru *io_lru;
> +	if (!man->func && !man->func->io_lru)
>   		return;
>   
> -	mutex_unlock(&man->io_reserve_mutex);
> +	io_lru = man->func->io_lru(man);
> +	mutex_unlock(&io_lru->io_reserve_mutex);
>   }
>   
>   static int ttm_mem_io_evict(struct ttm_resource_manager *man)
>   {
>   	struct ttm_buffer_object *bo;
> -
> -	bo = list_first_entry_or_null(&man->io_reserve_lru,
> +	struct ttm_resource_manager_io_lru *io_lru = man->func->io_lru(man);
> +	bo = list_first_entry_or_null(&io_lru->io_reserve_lru,
>   				      struct ttm_buffer_object,
>   				      io_reserve_lru);
>   	if (!bo)
> @@ -173,9 +177,11 @@ int ttm_mem_io_reserve_vm(struct ttm_buffer_object *bo)
>   	if (unlikely(ret != 0))
>   		return ret;
>   	mem->bus.io_reserved_vm = true;
> -	if (man->use_io_reserve_lru)
> +	if (man->func && man->func->io_lru) {
> +		struct ttm_resource_manager_io_lru *io_lru = man->func->io_lru(man);
>   		list_add_tail(&bo->io_reserve_lru,
> -			      &man->io_reserve_lru);
> +			      &io_lru->io_reserve_lru);
> +	}
>   	return 0;
>   }
>   
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index e4bf93482b59..fd34ca32ca66 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -56,6 +56,8 @@ struct ttm_lru_bulk_move;
>   
>   struct ttm_resource_manager;
>   
> +struct ttm_resource_manager_io_lru;
> +
>   /**
>    * struct ttm_bus_placement
>    *
> @@ -542,6 +544,7 @@ int ttm_bo_create(struct ttm_bo_device *bdev, unsigned long size,
>    */
>   void ttm_resource_manager_init(struct ttm_resource_manager *man);
>   
> +void ttm_resource_manager_io_lru_init(struct ttm_resource_manager_io_lru *io_lru);
>   /**
>    * ttm_bo_evict_mm
>    *
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
> index c719b4aa3793..d6e77f1d0183 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -46,6 +46,7 @@
>   #define TTM_MAX_BO_PRIORITY	4U
>   
>   struct ttm_resource_manager;
> +struct ttm_resource_manager_io_lru;
>   
>   struct ttm_resource_manager_func {
>   	/**
> @@ -106,6 +107,8 @@ struct ttm_resource_manager_func {
>   	 */
>   	void (*debug)(struct ttm_resource_manager *man,
>   		      struct drm_printer *printer);
> +
> +	struct ttm_resource_manager_io_lru *(*io_lru)(struct ttm_resource_manager *man);
>   };
>   
>   /**
> @@ -133,7 +136,14 @@ struct ttm_resource_manager_func {
>    * This structure is used to identify and manage memory types for a device.
>    */
>   
> +struct ttm_resource_manager_io_lru {
> +	/*
> +	 * Protected by @io_reserve_mutex:
> +	 */
>   
> +	struct list_head io_reserve_lru;
> +	struct mutex io_reserve_mutex;
> +};
>   
>   struct ttm_resource_manager {
>   	/*
> @@ -144,15 +154,8 @@ struct ttm_resource_manager {
>   	uint32_t available_caching;
>   	uint32_t default_caching;
>   	const struct ttm_resource_manager_func *func;
> -	struct mutex io_reserve_mutex;
> -	bool use_io_reserve_lru;
> -	spinlock_t move_lock;
>   
> -	/*
> -	 * Protected by @io_reserve_mutex:
> -	 */
> -
> -	struct list_head io_reserve_lru;
> +	spinlock_t move_lock;
>   
>   	/*
>   	 * Protected by the global->lru_lock.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
