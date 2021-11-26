Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFBB45E8A6
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 08:43:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3176E8CA;
	Fri, 26 Nov 2021 07:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2075.outbound.protection.outlook.com [40.107.101.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E076E8CA
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 07:43:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f/MhiHV8hB5heHPIBsw+BvB1QMoq8hL0+XSJHLP/ZNxlleXd8GKChA1CcTXU+1+yxAYO0FpAViOqEiUWRt/ZMKjc3Xf2WVEIVaNHIKPaOuQR20hS32e5xtkkCtPO9peutZ3uWBa19dhj75HfPBvrEkaZaRksj9EfU/S/hWsdP71E/xn0E1VjwJEOfFSRNuOZFjpd7ZmIp7vYmxMWUM4CxgDCbF/SeUE8NpXG8iOuN+CcD5uwlJO6r0HtQfdUkBovHVOiZaKdWvGBboB77tbvoMxcx0n3lMa45glKaYXv1hUZeEnvStjKJY03XFF8d9lMJrm+QJDavdfHVjLND8rxGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUNdGKf4/WMNYcXnb0f+WnnAASU2HOnuh9dKOXz2uJ8=;
 b=L2cD5Z1BtGeIwiMrlBaYtYrjZZjeyy6ED3p8pwokeXXDvQX4BwGyq59XVt7pn5b0R29K4AUQnpWTz6bMvtZxBO8H/I+Dk8XpIo0xsL+ljHiflTQ3apzAi1R1kA3NCd/htyxA5iDhAXyQJSaiYyVGpdlog5t4b3UoDcflLjiPJt//QAersQLBO+6Q27b9BfUmeMEoiO+yaC2jnQuVFiRq1RSjn3hvNdkkgJd62tzGJU0wniehcZdjuPs+vCOqWiExTDaS1bUatsFNIPZs374gYl5tajKSa6UKx5M7nsqMhOANYfN5X55dd61x0J78kzk+Y57ucO/Kv4GCHSILajmJJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUNdGKf4/WMNYcXnb0f+WnnAASU2HOnuh9dKOXz2uJ8=;
 b=ycwBo3WUXNsh1CigEkLRP/A8+0wVAfPiB9eOeDclykvBQj3NpI8HsvxsfJBpjTR1IIWHyF6lT/AJalXTPMlqfWiGckZtOcCoWGjgXWd9MYAJf5VhFss6GLV3C2gqYFDu+EjRNYJqhFICeAKRoOK/hT8pF4R+BdM4RLnwkt9Ecic=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB4918.namprd12.prod.outlook.com (2603:10b6:a03:1df::22)
 by BYAPR12MB3304.namprd12.prod.outlook.com (2603:10b6:a03:139::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Fri, 26 Nov
 2021 07:43:25 +0000
Received: from BY5PR12MB4918.namprd12.prod.outlook.com
 ([fe80::d519:1ea0:33a6:8193]) by BY5PR12MB4918.namprd12.prod.outlook.com
 ([fe80::d519:1ea0:33a6:8193%6]) with mapi id 15.20.4713.027; Fri, 26 Nov 2021
 07:43:25 +0000
Date: Fri, 26 Nov 2021 15:43:04 +0800
From: Huang Rui <ray.huang@amd.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 06/12] drm/ttm: add resource iterator
Message-ID: <YaCQCB7fT7HumMIe@amd.com>
References: <20211124124430.20859-1-christian.koenig@amd.com>
 <20211124124430.20859-7-christian.koenig@amd.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211124124430.20859-7-christian.koenig@amd.com>
X-ClientProxiedBy: HK0PR01CA0063.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::27) To BY5PR12MB4918.namprd12.prod.outlook.com
 (2603:10b6:a03:1df::22)
MIME-Version: 1.0
Received: from amd.com (165.204.134.251) by
 HK0PR01CA0063.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Fri, 26 Nov 2021 07:43:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 721ce7ac-ac73-4d3e-1683-08d9b0b06d69
X-MS-TrafficTypeDiagnostic: BYAPR12MB3304:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3304D1451D9D4B326C845618EC639@BYAPR12MB3304.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jYDBLX8cpO/DQIMpldXyXFT61vh9FuKdSREOcW00Mux3RlXUGrkw6YzUdtZW268iC2CS63Q0It7uCG7RIjfufGORZXctRiscOz/YQJddSQjXCOvrCryZZx7g8bylovpl1UtcHfpRJCz7dkCk6zQMBkey4NtKJQA6SNIJbwsfnQaBVXg/hLfZQfK4DPU1ooqm5xSG1wXv1uQrBCak0OYu/w3y+xaoiFg/NgyvHV90KC5Y36Qu5R17r+hKPhQQqvPJj24jGcRwgJPfdxm/nW2PHx/EmKnnETZFfE9CIMbn9dHus7QNZURejuuK7FfR+s9/3HHa9/GGGJRXr4PKj8gm2/EPja5NFLVcSukxTJ3Dcx9H4CbhWVtpT+Rw2aHPehgjZRNnMDqysNS4bszHpdIZLJ61MzgP3TINWnznL062HNXkfwuJfF5tiYpMIg/iWAuie75XzQhD/bG7rCkIeDch9gDBTrVrQEBWfZ0it5pVsBaSNMBFrRrKeYMXcHBevBfAe/OkX/7hsL2NUAJtSAtOnh7Qq5gNzq2P5DSpegZN5bzEDraNUiM62kcLuEn7dOSxXGYe03HbvU8pye0OtcWxCO3tmKojvsLyhFqamcxmmT7V5WUOgQtQqbgqp+Hf9L9Ad3UmEtTUid/6NqoGO39ivQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4918.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66574015)(5660300002)(7696005)(36756003)(2906002)(8676002)(316002)(66946007)(66476007)(186003)(26005)(38100700002)(508600001)(2616005)(956004)(6916009)(4326008)(66556008)(55016003)(8886007)(83380400001)(6666004)(54906003)(8936002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4UdshiOeVJaVUD124GAltes2vS56OCO2ODVb55gWyr4nlUXrQnhhDvxdoO?=
 =?iso-8859-1?Q?MCMkJIs8FGjcB+hcVNi+HvWs6RripLvzNB3TtMHT853oLLBSrKtQkROYX/?=
 =?iso-8859-1?Q?6po3mAEljAf3Wc+oUfGrzBOAQR7tDxRT0mT6FkSfhz/nQutv5WxvN9Ptmc?=
 =?iso-8859-1?Q?xHIVcEEKMF0wyuGOfmZ6e2DNlgNowy3x9ur1rKaUSvf2PoNuZH2J7fqe1b?=
 =?iso-8859-1?Q?ODfDaPFj5IPs9tNqoXYxO4KYRD627ujoheg0dtPZWYWrzEpQHA1A5IbUNu?=
 =?iso-8859-1?Q?g+xzArYzLRcADAiLRdHGvaig576dCsD9eYsHhJh10oCHCZOykxjakZwuDL?=
 =?iso-8859-1?Q?6o3eGc2yJ+07+4+NrWlyz7UIiCaFuAVLiGrK0EgyLxAk2dSc91mkDzapym?=
 =?iso-8859-1?Q?HKY45ekb/+6CPxMrwt22aty1Fz6R+2fW43OL0Wo2x8XBoYPr6acHcKkO+k?=
 =?iso-8859-1?Q?QwOuBKLhAbDruDvfs3zuoqVW+BlywDMz34B4zrXY0/+rn5LSOm06pmY2kG?=
 =?iso-8859-1?Q?0kH3PH4bEyNzcuOIvgKITWWKi+2a8aBm0rJVuSN9+CMhkx728R0ieXf/Se?=
 =?iso-8859-1?Q?pQF6A+IhMb2pprZHG087CIcWUwv5rSmNF/Q6BWng5gQMtyKn4D2awwVgU9?=
 =?iso-8859-1?Q?2i5HdPfiFZZmYJkI4VOjhfCAhnarMHz8eTPj8iEoM5VKWGNioGvk9cmHY1?=
 =?iso-8859-1?Q?73vX1O0JVOJJKiTw2LFG6hKyK8eH+8Jtx80XtO1KFtnb6pDQZ+/YwnHVtP?=
 =?iso-8859-1?Q?o46ncJuanENfAeK2BFAerUnwSSnigOQ/W2fatcsi8VqZ24FQqlWycNyu/f?=
 =?iso-8859-1?Q?4ZtwfiqMZdf/Si30v+ym1qr+0OpRppwuwkOD6SBi3ldoU5XtWMadU4WchB?=
 =?iso-8859-1?Q?kxrh2bRhDzF9TxtmL43itpp1qPH63+NCqdFlFAZxyDQlcklLtrF21a+V0F?=
 =?iso-8859-1?Q?+2rk/YbbrN3GMwFEiElAT7ZLasUpDKnQXLgg3Aiq8HyD0MAuuboE0zgyLa?=
 =?iso-8859-1?Q?j6xx/+8xMM8IeoDhHXd/dpjShIfOEYEYMFy0bgHhw+5puIwrRMkJAWh6kB?=
 =?iso-8859-1?Q?KqpZQ/WSBzwPXrMTWbJ3enkeAMSq+Enfzbcnlx0BYmBy+QfB9ETZ9Xvlzr?=
 =?iso-8859-1?Q?qDRywcf+xvyOZpziQYswJzfe51e1Cv6wbA6tNam4cTbEL2Vcmp84xA07P8?=
 =?iso-8859-1?Q?XNFvf7IsIsMbmlDYoELESmuOT4dbyceldYX26cdOJXhWK/Vwvbuogq8klt?=
 =?iso-8859-1?Q?RcCqbOszLzXaPJwJEPoxObljIIp4PBeg21/rNFLs4/x2Yr7WkLa64Q5Ddb?=
 =?iso-8859-1?Q?kf4wwNJuzmC+Oc1bbqVZ9hNFXS/U05EHESDDbYOFFi8WiqWIaleVNDqlVQ?=
 =?iso-8859-1?Q?y+fTInXAKHCIZZ3hHx/eHxKrQVUqQVfzw1n0THNR6C1fNtCh6hrvVAuk/s?=
 =?iso-8859-1?Q?plMaUyHccez+H+CwSS27zn3vAuZqHlUrKVxHMw2CI5xvStMr9sNk9Nr5Pc?=
 =?iso-8859-1?Q?Z0vAaLn3TEZt4S0YJdRpePcF1XQGI7NIFFBo0UMwKgkKFMrFVUVVXL2dfb?=
 =?iso-8859-1?Q?vU3Fz0N9drBc/xF7+ouzruBp2uMtvu13AHYj+R9hhn0s15bXmyB5Y66Olh?=
 =?iso-8859-1?Q?G/LaTGbJWNcQBhWRamP+zSCHGnd/B2rOg7vWaU577C7oiG/j0UE+7nPuqU?=
 =?iso-8859-1?Q?FhwEzBqYcxlsooKJ140=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 721ce7ac-ac73-4d3e-1683-08d9b0b06d69
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4918.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 07:43:24.8919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DHzGNVm1y8pN0HAx3LSM7J8Uwl4ilgBL6+yyRAUftzxMW6qFRIJn3VVengIv5xVbYt9vr3MooXaCg3ueuuj3ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3304
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
Cc: "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 24, 2021 at 08:44:24PM +0800, Christian König wrote:
> Instead of duplicating that at different places add an iterator over all
> the resources in a resource manager.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Huang Rui <ray.huang@amd.com>

> ---
>  drivers/gpu/drm/ttm/ttm_bo.c       | 41 +++++++++++----------------
>  drivers/gpu/drm/ttm/ttm_device.c   | 26 ++++++++---------
>  drivers/gpu/drm/ttm/ttm_resource.c | 45 ++++++++++++++++++++++++++++++
>  include/drm/ttm/ttm_resource.h     | 23 +++++++++++++++
>  4 files changed, 95 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 5bf5a9442856..dd8b9a99c180 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -580,38 +580,29 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>  			struct ww_acquire_ctx *ticket)
>  {
>  	struct ttm_buffer_object *bo = NULL, *busy_bo = NULL;
> +	struct ttm_resource_cursor cursor;
>  	struct ttm_resource *res;
>  	bool locked = false;
> -	unsigned i;
>  	int ret;
>  
>  	spin_lock(&bdev->lru_lock);
> -	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
> -		list_for_each_entry(res, &man->lru[i], lru) {
> -			bool busy;
> -
> -			bo = res->bo;
> -			if (!ttm_bo_evict_swapout_allowable(bo, ctx, place,
> -							    &locked, &busy)) {
> -				if (busy && !busy_bo && ticket !=
> -				    dma_resv_locking_ctx(bo->base.resv))
> -					busy_bo = bo;
> -				continue;
> -			}
> -
> -			if (!ttm_bo_get_unless_zero(bo)) {
> -				if (locked)
> -					dma_resv_unlock(bo->base.resv);
> -				continue;
> -			}
> -			break;
> +	ttm_resource_manager_for_each_res(man, &cursor, res) {
> +		bool busy;
> +
> +		if (!ttm_bo_evict_swapout_allowable(res->bo, ctx, place,
> +						    &locked, &busy)) {
> +			if (busy && !busy_bo && ticket !=
> +			    dma_resv_locking_ctx(bo->base.resv))
> +				busy_bo = res->bo;
> +			continue;
>  		}
>  
> -		/* If the inner loop terminated early, we have our candidate */
> -		if (&res->lru != &man->lru[i])
> -			break;
> -
> -		bo = NULL;
> +		if (!ttm_bo_get_unless_zero(res->bo)) {
> +			if (locked)
> +				dma_resv_unlock(res->bo->base.resv);
> +			continue;
> +		}
> +		bo = res->bo;
>  	}
>  
>  	if (!bo) {
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index ba35887147ba..a0562ab386f5 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -142,10 +142,10 @@ EXPORT_SYMBOL(ttm_global_swapout);
>  int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>  		       gfp_t gfp_flags)
>  {
> +	struct ttm_resource_cursor cursor;
>  	struct ttm_resource_manager *man;
> -	struct ttm_buffer_object *bo;
>  	struct ttm_resource *res;
> -	unsigned i, j;
> +	unsigned i;
>  	int ret;
>  
>  	spin_lock(&bdev->lru_lock);
> @@ -154,20 +154,16 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>  		if (!man || !man->use_tt)
>  			continue;
>  
> -		for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
> -			list_for_each_entry(res, &man->lru[j], lru) {
> -				uint32_t num_pages;
> -
> -				bo = res->bo;
> -				num_pages = PFN_UP(bo->base.size);
> +		ttm_resource_manager_for_each_res(man, &cursor, res) {
> +			struct ttm_buffer_object *bo = res->bo;
> +			uint32_t num_pages = PFN_UP(bo->base.size);
>  
> -				ret = ttm_bo_swapout(bo, ctx, gfp_flags);
> -				/* ttm_bo_swapout has dropped the lru_lock */
> -				if (!ret)
> -					return num_pages;
> -				if (ret != -EBUSY)
> -					return ret;
> -			}
> +			ret = ttm_bo_swapout(bo, ctx, gfp_flags);
> +			/* ttm_bo_swapout has dropped the lru_lock */
> +			if (!ret)
> +				return num_pages;
> +			if (ret != -EBUSY)
> +				return ret;
>  		}
>  	}
>  	spin_unlock(&bdev->lru_lock);
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 450e665c357b..9e68d36a1546 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -354,6 +354,51 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
>  }
>  EXPORT_SYMBOL(ttm_resource_manager_debug);
>  
> +/**
> + * ttm_resource_manager_first
> + *
> + * @man: resource manager to iterate over
> + * @cursor: cursor to record the position
> + *
> + * Returns the first resource from the resource manager.
> + */
> +struct ttm_resource *
> +ttm_resource_manager_first(struct ttm_resource_manager *man,
> +			   struct ttm_resource_cursor *cursor)
> +{
> +	struct ttm_resource *res;
> +
> +	for (cursor->priority = 0; cursor->priority < TTM_MAX_BO_PRIORITY;
> +	     ++cursor->priority)
> +		list_for_each_entry(res, &man->lru[cursor->priority], lru)
> +			return res;
> +
> +	return NULL;
> +}
> +
> +/**
> + * ttm_resource_manager_next
> + *
> + * @man: resource manager to iterate over
> + * @cursor: cursor to record the position
> + *
> + * Returns the next resource from the resource manager.
> + */
> +struct ttm_resource *
> +ttm_resource_manager_next(struct ttm_resource_manager *man,
> +			  struct ttm_resource_cursor *cursor,
> +			  struct ttm_resource *res)
> +{
> +	list_for_each_entry_continue(res, &man->lru[cursor->priority], lru)
> +		return res;
> +
> +	for (; cursor->priority < TTM_MAX_BO_PRIORITY; ++cursor->priority)
> +		list_for_each_entry(res, &man->lru[cursor->priority], lru)
> +			return res;
> +
> +	return NULL;
> +}
> +
>  static void ttm_kmap_iter_iomap_map_local(struct ttm_kmap_iter *iter,
>  					  struct dma_buf_map *dmap,
>  					  pgoff_t i)
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index a54d52517a30..13da5e337350 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -183,6 +183,17 @@ struct ttm_resource {
>  	struct list_head lru;
>  };
>  
> +/**
> + * struct ttm_resource_cursor
> + *
> + * @priority: the current priority
> + *
> + * Cursor to iterate over the resources in a manager.
> + */
> +struct ttm_resource_cursor {
> +	unsigned int priority;
> +};
> +
>  /**
>   * struct ttm_lru_bulk_move_pos
>   *
> @@ -339,6 +350,18 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
>  void ttm_resource_manager_debug(struct ttm_resource_manager *man,
>  				struct drm_printer *p);
>  
> +struct ttm_resource *
> +ttm_resource_manager_first(struct ttm_resource_manager *man,
> +			   struct ttm_resource_cursor *cursor);
> +struct ttm_resource *
> +ttm_resource_manager_next(struct ttm_resource_manager *man,
> +			  struct ttm_resource_cursor *cursor,
> +			  struct ttm_resource *res);
> +
> +#define ttm_resource_manager_for_each_res(man, cursor, res)		\
> +	for (res = ttm_resource_manager_first(man, cursor); res;	\
> +	     res = ttm_resource_manager_next(man, cursor, res))
> +
>  struct ttm_kmap_iter *
>  ttm_kmap_iter_iomap_init(struct ttm_kmap_iter_iomap *iter_io,
>  			 struct io_mapping *iomap,
> -- 
> 2.25.1
> 
