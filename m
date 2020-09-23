Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D195A275004
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 06:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001326E112;
	Wed, 23 Sep 2020 04:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 450DB6E112;
 Wed, 23 Sep 2020 04:37:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eUo09pWQ2EwgGN03HZqwcPTAPo2DjqujJBLZjHReVZmwvTocAC0ZZozVmQ+U23ZlEU0KaTZpA3eG1r+fbsM4Y1xOGFz2LiMVWZQmKoLvDvPeQ0iTqStBxwwafQCTahL/LTBI3u29bF2WgV/36BkPQCodkSNXL8ciEqVFryjcXg9mOA+VQa4li404B8uVehQbSAU6ROPEbUxB1sqwK5mK9oKt0nGKp7IRd0xt6IaeDwHEb4ekYNjvi3sLq2Cm3OYs888Vi0/go2LKBCQ7QWaSEPy4Wu4iOZSxx3+x4Y5DMKNikECXbzrjfwzzSIEHf2cUTh54/2tnfZIWEpgGuEp6ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTB9nMi9d4JFXe2QjYsQLB6uMio/347gQS8+lwJFXi0=;
 b=MxKfVKcHbmIfnjOVAHaFnJWPxVLm1vsyYzwfV79QF9WVkURQk9NVt+Dz/2XWsJ/kdkoikk0kuEgDwar9R40auLTT0bS8ZDMAzZgP0tQWQ/rYcvO+mABGgH7uj0fKzEYS+3NQXAc8+Q7uxNJAMR5s/tn4f4wl7G2gnpOBKelkfKd0e9B1ds+k1Gs63mVe7SsNPfHzh8bPgnxmvZ3Yx2QVUJwgjAgPhGJ1phkLtN64SGJauhb3+YEv2pF1cpG3/0nnkUxTQZlQAYb+p665FOAxWs2NV6+QefJyFLRuZvQ5RTlT2Rfui7Kz+c7aSiwbU24CpXr60L3LcBUMx/VF0ARu/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTB9nMi9d4JFXe2QjYsQLB6uMio/347gQS8+lwJFXi0=;
 b=RLY84CMpG2xh5Stv5JXxPkMXJLKWRj667n1+8kHeMoWoSGz8A6BK4G4H4HJt9cWXv0rdvRlNexyJRQG54i8GMkc0G6HCqSfSkp561uMCxSf0C8XcZWQ8I0VB9HmKFbTUq4SxzUzOo+FN3aCLuaN+0DyRW5DaYlbR/MzxqPurQ5c=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1248.namprd12.prod.outlook.com (2603:10b6:300:12::21)
 by MWHPR12MB1840.namprd12.prod.outlook.com (2603:10b6:300:114::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Wed, 23 Sep
 2020 04:36:54 +0000
Received: from MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::b885:8b56:a460:4624]) by MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::b885:8b56:a460:4624%11]) with mapi id 15.20.3412.020; Wed, 23 Sep
 2020 04:36:54 +0000
Date: Wed, 23 Sep 2020 12:36:47 +0800
From: Huang Rui <ray.huang@amd.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 01/11] drm/ttm: add ttm_bo_pin()/ttm_bo_unpin() v2
Message-ID: <20200923043647.GA3536145@hr-amd>
References: <20200922133208.1273-1-christian.koenig@amd.com>
Content-Disposition: inline
In-Reply-To: <20200922133208.1273-1-christian.koenig@amd.com>
X-Originating-IP: [58.247.170.245]
X-ClientProxiedBy: HK2PR02CA0180.apcprd02.prod.outlook.com
 (2603:1096:201:21::16) To MWHPR12MB1248.namprd12.prod.outlook.com
 (2603:10b6:300:12::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hr-amd (58.247.170.245) by
 HK2PR02CA0180.apcprd02.prod.outlook.com (2603:1096:201:21::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.20 via Frontend Transport; Wed, 23 Sep 2020 04:36:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b6054764-5e9c-476a-23a6-08d85f7a4c4e
X-MS-TrafficTypeDiagnostic: MWHPR12MB1840:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1840FC4CBB2FE13EF35760D0EC380@MWHPR12MB1840.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uw5i8P/mtp3BI889miiHYmxls0PR59IkvEmwLbx7623D+cQrZ/VdlLeQF9R7SfdVvg3He/F8K42b8z+lpEtDMFEIDuheO8eBOLsK61wtMTTQo5gSDToWUZVyDSCPe16qXda0rtq0hXGEqEdP8K9Qj3tiV9UaRJUbt1Phwiwm9GJiyW40UIsMT2KTPBiq39OXPzKm9UPV1auhPFY0Ymc1QYYzBB1bFIsvUEUcvs+hJlqul/eZGeIMDLQL5GmCZC7HLFbeJIqeRY/7ifx8ZQX4X3qomQSqiXjDOC3I58wTt9brSCLeORsm4FRqMA6bYzdwCqVn3PKjKHCj3y7I4nR9/bo2A0NiWbmkTqBw0GTC00Nzj+xbKsGAc+JPIbJHpiRP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1248.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(346002)(39860400002)(376002)(186003)(2906002)(6496006)(956004)(4326008)(83380400001)(16526019)(86362001)(66574015)(5660300002)(52116002)(66946007)(55016002)(8676002)(1076003)(33656002)(316002)(26005)(54906003)(6666004)(66556008)(9686003)(66476007)(478600001)(8936002)(6916009)(33716001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: hlMsadVHPhPkEtrNPN5ZtFiZ0eUsAh9uJqp78JGrV2l6EldEaJ8hIY9/4QewSM7iGaWxb9OnUC9rcj3xTU7bV8RcI7z4/kKWvE4L7Z6qruU95zJlniRATT0Fc1qSkoTT2bdk2F6T038/rk7duMztNG0E0yfGENXrBaNPUPWUUfZQPyHq/e7N+BMJSdhgPFe7yJpyODj5giliK4jfSfYG3LKjJJGStaDfV7aU/61tB3IqMqj0qh9MeNOWRmEzG95bgP7YWvXukZmEvmEw3MGZuUC31VBiRnNqm4ynz3A4kYGKZeWJJs3HkYV3obefgiOyjzd2zdy/B75DsXUuuOERIA/lEjpzQUBJx/Vg3tWaCSXt2Ac2UIkim3cxlSjV+I0Q53lkLvv3QEM/75Ef3k5VJlBxNn1jE1/OFOVV8zwLZxSVBr1HBDd6SC4Fy02GMCmbFT/OjapOhTcO+SdoqKgMxP471o0RWKddhAsBQISMG1ALgxGBY64OrWD6+c9Zu2cj1B2Srce372/62AKHzHbe40eLKSQtxRZY6I2T842cOJKC6d7Qx8H5hidNsS5AcVNrqB6e8ny77DST70aZgLICSH5l+6Fkf7lArbtI2FvKGaIfhzXw3wj9YGO6dnjjqIjcmU52nDsovJBK+YUeeTSOIA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6054764-5e9c-476a-23a6-08d85f7a4c4e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2020 04:36:54.7211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJkCWpyK8qsOXUGv+yE4RHNk0e3aLCC7NfmGd+H3k5h4WSY77qhiSFBpawijPU5HUrk5/OcOMbhF0DmnUnYT4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1840
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "sroland@vmware.com" <sroland@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-graphics-maintainer@vmware.com" <linux-graphics-maintainer@vmware.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 22, 2020 at 09:31:58PM +0800, Christian K=F6nig wrote:
> As an alternative to the placement flag add a
> pin count to the ttm buffer object.
> =

> v2: add dma_resv_assert_help() calls
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>

Series look good for me as well.

Reviewed-by: Huang Rui <ray.huang@amd.com>

Only one comment:

We can modify the TOPDOWN offset as 21 since the NO_EVICT is removed.

 #define TTM_PL_FLAG_UNCACHED    (1 << 17)
 #define TTM_PL_FLAG_WC          (1 << 18)
 #define TTM_PL_FLAG_CONTIGUOUS  (1 << 19)
-#define TTM_PL_FLAG_NO_EVICT    (1 << 21)
 #define TTM_PL_FLAG_TOPDOWN     (1 << 22)

Thanks,
Ray

> ---
>  drivers/gpu/drm/ttm/ttm_bo.c      |  9 ++++++---
>  drivers/gpu/drm/ttm/ttm_bo_util.c |  2 +-
>  include/drm/ttm/ttm_bo_api.h      | 26 ++++++++++++++++++++++++++
>  3 files changed, 33 insertions(+), 4 deletions(-)
> =

> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 70b3bee27850..b82b49d43942 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -115,7 +115,7 @@ static void ttm_bo_add_mem_to_lru(struct ttm_buffer_o=
bject *bo,
>  	struct ttm_bo_device *bdev =3D bo->bdev;
>  	struct ttm_resource_manager *man;
>  =

> -	if (!list_empty(&bo->lru))
> +	if (!list_empty(&bo->lru) || bo->pin_count)
>  		return;
>  =

>  	if (mem->placement & TTM_PL_FLAG_NO_EVICT)
> @@ -165,7 +165,8 @@ void ttm_bo_move_to_lru_tail(struct ttm_buffer_object=
 *bo,
>  	ttm_bo_del_from_lru(bo);
>  	ttm_bo_add_mem_to_lru(bo, &bo->mem);
>  =

> -	if (bulk && !(bo->mem.placement & TTM_PL_FLAG_NO_EVICT)) {
> +	if (bulk && !(bo->mem.placement & TTM_PL_FLAG_NO_EVICT) &&
> +	    !bo->pin_count) {
>  		switch (bo->mem.mem_type) {
>  		case TTM_PL_TT:
>  			ttm_bo_bulk_move_set_pos(&bulk->tt[bo->priority], bo);
> @@ -544,8 +545,9 @@ static void ttm_bo_release(struct kref *kref)
>  		 * shrinkers, now that they are queued for
>  		 * destruction.
>  		 */
> -		if (bo->mem.placement & TTM_PL_FLAG_NO_EVICT) {
> +		if (bo->mem.placement & TTM_PL_FLAG_NO_EVICT || bo->pin_count) {
>  			bo->mem.placement &=3D ~TTM_PL_FLAG_NO_EVICT;
> +			bo->pin_count =3D 0;
>  			ttm_bo_del_from_lru(bo);
>  			ttm_bo_add_mem_to_lru(bo, &bo->mem);
>  		}
> @@ -1172,6 +1174,7 @@ int ttm_bo_init_reserved(struct ttm_bo_device *bdev,
>  	bo->moving =3D NULL;
>  	bo->mem.placement =3D TTM_PL_FLAG_CACHED;
>  	bo->acc_size =3D acc_size;
> +	bo->pin_count =3D 0;
>  	bo->sg =3D sg;
>  	if (resv) {
>  		bo->base.resv =3D resv;
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_=
bo_util.c
> index fb2a25f8408f..1968df9743fc 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -352,7 +352,6 @@ static int ttm_buffer_object_transfer(struct ttm_buff=
er_object *bo,
>  		return -ENOMEM;
>  =

>  	fbo->base =3D *bo;
> -	fbo->base.mem.placement |=3D TTM_PL_FLAG_NO_EVICT;
>  =

>  	ttm_bo_get(bo);
>  	fbo->bo =3D bo;
> @@ -372,6 +371,7 @@ static int ttm_buffer_object_transfer(struct ttm_buff=
er_object *bo,
>  	kref_init(&fbo->base.kref);
>  	fbo->base.destroy =3D &ttm_transfered_destroy;
>  	fbo->base.acc_size =3D 0;
> +	fbo->base.pin_count =3D 1;
>  	if (bo->type !=3D ttm_bo_type_sg)
>  		fbo->base.base.resv =3D &fbo->base.base._resv;
>  =

> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index 0f7cd21d6d74..33aca60870e2 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -157,6 +157,7 @@ struct ttm_buffer_object {
>  =

>  	struct dma_fence *moving;
>  	unsigned priority;
> +	unsigned pin_count;
>  =

>  	/**
>  	 * Special members that are protected by the reserve lock
> @@ -606,6 +607,31 @@ static inline bool ttm_bo_uses_embedded_gem_object(s=
truct ttm_buffer_object *bo)
>  	return bo->base.dev !=3D NULL;
>  }
>  =

> +/**
> + * ttm_bo_pin - Pin the buffer object.
> + * @bo: The buffer object to pin
> + *
> + * Make sure the buffer is not evicted any more during memory pressure.
> + */
> +static inline void ttm_bo_pin(struct ttm_buffer_object *bo)
> +{
> +	dma_resv_assert_held(bo->base.resv);
> +	++bo->pin_count;
> +}
> +
> +/**
> + * ttm_bo_unpin - Unpin the buffer object.
> + * @bo: The buffer object to unpin
> + *
> + * Allows the buffer object to be evicted again during memory pressure.
> + */
> +static inline void ttm_bo_unpin(struct ttm_buffer_object *bo)
> +{
> +	dma_resv_assert_held(bo->base.resv);
> +	WARN_ON_ONCE(!bo->pin_count);
> +	--bo->pin_count;
> +}
> +
>  int ttm_mem_evict_first(struct ttm_bo_device *bdev,
>  			struct ttm_resource_manager *man,
>  			const struct ttm_place *place,
> -- =

> 2.17.1
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
