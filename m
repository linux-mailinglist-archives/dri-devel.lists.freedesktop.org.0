Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 549BD34143D
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 05:33:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8F06E981;
	Fri, 19 Mar 2021 04:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F218C6E981
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 04:33:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dIB5RwDNVX+n1zGGt/AM2yLwrmogaDeqb4CLcdCIP2MkXSEG7za6xuB+9mDHx3liSPw/dSc9cKm8RKc5onCFvOInL/mCdlAmx/lnSFQ23Gf3Axj1+lseZtAtcBUqwrGBPoyWI/SbR9MtpHiCtNxQGWydgbpgHcXyyeyk05J0ZaoU0Ds5eMHvGYbO9ggIMyCbCFWs0SqxMTO/7z0T6XGKo4cVSj1o+n2clU3+g1Hg71+QaZFwXb0j7lJKRYaglk2IkkQT2pS8I9Y0AWLJ9euGVUwJWoCelelLfZ03RnM/eRt+6WRXPeqxZ88F/BnrGF0A9/e4EBCNwgfVG7JSyZ0bJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A69F2N5YydrZ4FUiWBr7x2yoYlKWklsoW5L//XHtHe4=;
 b=S6GQ2BaGwFM8vuZ49GkYb+Cv9/jHpCxALywEDXr7ZOpFfJb4lnwRjm2xIuXIvcV1h/Vz+9A0KeJh5VWECORSb2yW3MztUG5q6QVp40FIwkXNobBNIYHlOqkwA25M8MbXT3tHbtviAh7Yy/axuJ4suvssO2hoWwdjsIl4iYix/NC2BIN63Q/FvuhAvSQNNqUDhtb1vk1QFSxpiuvDFvuc96Tgt+BD5X7OUJewn0+mx+i9ZChh2fWrIRhmf1FCCVBqn06/BYH1J2cnD/n2nhqOCQZrC1k2SxiG6OB7OZI6bdXL2YUnRAbXKrSKZjW1qXBezwZpgb5dC5ZoKdiO3EEGwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A69F2N5YydrZ4FUiWBr7x2yoYlKWklsoW5L//XHtHe4=;
 b=wM5h1/xWdk1Sc/H4af1xpsgu/D3g9gOr3HbCUMJ/pVlZyUAtsdyFPKXvy0PLbEY57Z2xdWUMn+4VQmndEEWaOgpJw9ygyRAuVY6Y9/P/yhjL1a+T6zJZsrjgbuP/VjVoSdfGG3/RapX/ZGP6h55VDww+Ve5AgOHWbJ7FbRsXYSE=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1248.namprd12.prod.outlook.com (2603:10b6:300:12::21)
 by MW2PR12MB2521.namprd12.prod.outlook.com (2603:10b6:907:8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 04:33:35 +0000
Received: from MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::5094:3a69:806f:8a28]) by MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::5094:3a69:806f:8a28%5]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 04:33:35 +0000
Date: Fri, 19 Mar 2021 12:32:32 +0800
From: Huang Rui <ray.huang@amd.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 3/3] drm/ttm: switch to per device LRU lock
Message-ID: <20210319043232.GC3262181@hr-amd>
References: <20210318124719.13656-1-christian.koenig@amd.com>
 <20210318124719.13656-3-christian.koenig@amd.com>
Content-Disposition: inline
In-Reply-To: <20210318124719.13656-3-christian.koenig@amd.com>
X-Originating-IP: [58.247.170.245]
X-ClientProxiedBy: HKAPR03CA0020.apcprd03.prod.outlook.com
 (2603:1096:203:c9::7) To MWHPR12MB1248.namprd12.prod.outlook.com
 (2603:10b6:300:12::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hr-amd (58.247.170.245) by
 HKAPR03CA0020.apcprd03.prod.outlook.com (2603:1096:203:c9::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.9 via Frontend Transport; Fri, 19 Mar 2021 04:33:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 90727dad-93c2-444f-f0d6-08d8ea902862
X-MS-TrafficTypeDiagnostic: MW2PR12MB2521:
X-Microsoft-Antispam-PRVS: <MW2PR12MB2521F47C4F81280CD0AC05EFEC689@MW2PR12MB2521.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X1RyPrbLyzLHthjo2SE8Y8SYkgyPMuNndd17gJFgdWiwRgk63mMZ6RNyNmoVzYv0+4U3r8b14FSz9OXgb3hvOCRCrhJ5ExAzOLZlkF0TrS7VX2MTBoM4fYIx3tb2PDjXgQEIUf9fOExnBaE/Q6vevnljs33181bEZR/h5K9GgL2EQyTHg3wKyaLzEtRTXr8OISQOjZX4+jYOaTqEMQWLz/IF65wBWYLaX6sSgkGIXLgj1yWQgbUbbC60aOqPgEdzs5SieX2EiYZ4cBFUi0YcNGFLR26g0fZyPF59RqiubMKMLb1yyFLYQMTNVoN8uMlZCD2JHECNTb1+AC1KsDMLyZ07nLSsHsO370EVjStWTJEmuTS2BqVN63tl2X6HWLdfPR2LXHUmp8XXYdTCzlVbh1bsdW28GwkQDTyqTeRFpY8CHXfjVxc3kopAPb7nZo+T1+pfC1GDdPi21we4d3foO9d8ap5k4Hw+6XcZXtRU8F0ZqczOf7Cx2g1Cf6pgzxKVLeuvkWz0Si+e7Qb6zzWBc9pXRJESDM7gZp5BnWOAyJWWXFCshZlSBY3OC2piXFtd5EAiaD0/gh1QuSk05tp9ZQ3jzepQP+oWPcBSIWhVga/L88G8umuOpVlQBvVQiQOsuler7GNuwfsTKKDyDYBCMsAmb8D1a6PMNUzPu0sGkMU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1248.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(5660300002)(8936002)(66574015)(86362001)(52116002)(26005)(186003)(6916009)(956004)(8676002)(66476007)(30864003)(38100700001)(2906002)(55016002)(33716001)(478600001)(66556008)(54906003)(66946007)(1076003)(83380400001)(9686003)(16526019)(6496006)(33656002)(4326008)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?7lfJoxbV7nmxbHvlU5xh/70P5KZWDf8UlShpmMEqu14uilvYFb60DzooPt?=
 =?iso-8859-1?Q?qfh+sYnEW2PyBBPgvsHxLHkU2HiaeQpR4YZk0z97d1YvWSz6u43dndMzuy?=
 =?iso-8859-1?Q?kkMeBVywkiwvIA8Tyl7obmd6FbOE6qZ4+zLtLjBIpUacLZ1x71VlkJu+nZ?=
 =?iso-8859-1?Q?dFje1hh5a871ZLHo4em5PMxEx3UIZa00RBzMjMqmb45P0vM4pPmZuvdy55?=
 =?iso-8859-1?Q?5YNfT3tmVCImz2afAUIfwQn1imFHncXtSkkG1c4w0BScCyuyMUT0m+O/U3?=
 =?iso-8859-1?Q?XhCVx5lSSpyDgUzFs7qnF70RuwQHV+F//Xh3sndFJTJlrNj02fv+vcyLMf?=
 =?iso-8859-1?Q?9keyJDBlpVHREUeoYcqPS//5piBgfBJB9CQAEkIXusZ2QlR0EtoPbLdJB0?=
 =?iso-8859-1?Q?ws3xDgYgRdSa5F67O8sO3AYmcGKks3joj5Z9G06vKd9yxaTzSq5rWrMOIt?=
 =?iso-8859-1?Q?3kTIGIxUxTkfb+JMdY/qyopN39gevN81mkQZdpDa5ZmiYG3s+ElSF6fDQw?=
 =?iso-8859-1?Q?zwdwg7xWKGghWkFDxhSkQVM6Q9ouzmM1JfJGXRqeueIGUWAd2Kk4ywSqKs?=
 =?iso-8859-1?Q?VVZPYXSGXcpnlj+kb483QoCYRFWo8QEofJZn8mB0hI5pL1lz5DV+xYcPcc?=
 =?iso-8859-1?Q?gowSlBptn/tuaffIdiCPO1wl7EQ5CrcseguQoC0LGn3gSFBVW42YfTOoO/?=
 =?iso-8859-1?Q?JQZ9NlcrijJEl2MkdUZEYhLhDxtHbRvszw4zxK89wuXMLLWVuJb8FYHrQc?=
 =?iso-8859-1?Q?jG0Fd6Nd3TbM4e2YHo3+n/j0WG6J7nkDWqiPT6eWaKuG0wH4dGdgEf1urS?=
 =?iso-8859-1?Q?b9QxcsqJIyq3RtMptZ53BLQ0vVSPXp+1u4/AgMJ53DlGSmmu6ILVvHlhBR?=
 =?iso-8859-1?Q?Hca7yO/yQsY8O4jETTdMPVZZrjI+isvMTcRH77E7d8D+Zk7bDIfeta9Xap?=
 =?iso-8859-1?Q?HeObrdrOdMMEau3ff8fTFMCMpG4lmMff2jFV5dcwV0nvD1Pevj9P3qe+5G?=
 =?iso-8859-1?Q?WhWj8/AFL9WpRH5zHgTBkqnQPDpfOcqST8e1pPVeWo6r/eGAXOkQGf2aAL?=
 =?iso-8859-1?Q?Hz/ZaFKCOIapyCzKr2Py23W4RxIUcI+rGDAQGHQDymnAILncijsJnXUmZR?=
 =?iso-8859-1?Q?VagKSkzMSvFIQvamBGUNMcxXnsbcH8g1+M4psH5jYmQxhX8RUmTNyQjVVb?=
 =?iso-8859-1?Q?eS42ZkhBLPWkpe7Tf7ys8BUSj5LtTL692wN1rfzYXql+2S46qPTtFStf/V?=
 =?iso-8859-1?Q?9DWhX5y6JZI47ekC+EOeIVwORAiQoYX6xlgrNkh2Bdvu+Fy7Hf0JXoimed?=
 =?iso-8859-1?Q?RjIlWipRr8KZQkP9NB8PWDCUF9y5cnIw4ej1Y8w+Yi9CYzVaW7aYfeVwK1?=
 =?iso-8859-1?Q?m2n+cZKhoz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90727dad-93c2-444f-f0d6-08d8ea902862
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 04:33:35.0946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MWd32wLgxvBFend+Fwf0i/Q/eWT+F3xi8jiNoJGh5zkIhBJli/W/fMZlKT2idMvh6tsR0xkhxzGcph8ejeqjOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2521
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
Cc: "matthew.william.auld@gmail.com" <matthew.william.auld@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 18, 2021 at 08:47:19PM +0800, Christian K=F6nig wrote:
> Instead of having a global lock.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |  8 ++---
>  drivers/gpu/drm/qxl/qxl_release.c      |  5 +--
>  drivers/gpu/drm/ttm/ttm_bo.c           | 49 ++++++++++++--------------
>  drivers/gpu/drm/ttm/ttm_device.c       | 12 +++----
>  drivers/gpu/drm/ttm/ttm_execbuf_util.c |  8 ++---
>  drivers/gpu/drm/ttm/ttm_resource.c     |  9 +++--
>  include/drm/ttm/ttm_bo_driver.h        |  4 +--
>  include/drm/ttm/ttm_device.h           |  4 +--
>  8 files changed, 43 insertions(+), 56 deletions(-)
> =

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_vm.c
> index 9d19078246c8..ae18c0e32347 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -638,15 +638,15 @@ void amdgpu_vm_move_to_lru_tail(struct amdgpu_devic=
e *adev,
>  	struct amdgpu_vm_bo_base *bo_base;
>  =

>  	if (vm->bulk_moveable) {
> -		spin_lock(&ttm_glob.lru_lock);
> +		spin_lock(&adev->mman.bdev.lru_lock);

Could you please explain why do you want to instead of the global lock?

Thanks,
Ray

>  		ttm_bo_bulk_move_lru_tail(&vm->lru_bulk_move);
> -		spin_unlock(&ttm_glob.lru_lock);
> +		spin_unlock(&adev->mman.bdev.lru_lock);
>  		return;
>  	}
>  =

>  	memset(&vm->lru_bulk_move, 0, sizeof(vm->lru_bulk_move));
>  =

> -	spin_lock(&ttm_glob.lru_lock);
> +	spin_lock(&adev->mman.bdev.lru_lock);
>  	list_for_each_entry(bo_base, &vm->idle, vm_status) {
>  		struct amdgpu_bo *bo =3D bo_base->bo;
>  =

> @@ -660,7 +660,7 @@ void amdgpu_vm_move_to_lru_tail(struct amdgpu_device =
*adev,
>  						&bo->shadow->tbo.mem,
>  						&vm->lru_bulk_move);
>  	}
> -	spin_unlock(&ttm_glob.lru_lock);
> +	spin_unlock(&adev->mman.bdev.lru_lock);
>  =

>  	vm->bulk_moveable =3D true;
>  }
> diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_=
release.c
> index f5845c96d414..b19f2f00b215 100644
> --- a/drivers/gpu/drm/qxl/qxl_release.c
> +++ b/drivers/gpu/drm/qxl/qxl_release.c
> @@ -426,16 +426,13 @@ void qxl_release_fence_buffer_objects(struct qxl_re=
lease *release)
>  		       release->id | 0xf0000000, release->base.seqno);
>  	trace_dma_fence_emit(&release->base);
>  =

> -	spin_lock(&ttm_glob.lru_lock);
> -
>  	list_for_each_entry(entry, &release->bos, head) {
>  		bo =3D entry->bo;
>  =

>  		dma_resv_add_shared_fence(bo->base.resv, &release->base);
> -		ttm_bo_move_to_lru_tail(bo, &bo->mem, NULL);
> +		ttm_bo_move_to_lru_tail_unlocked(bo);
>  		dma_resv_unlock(bo->base.resv);
>  	}
> -	spin_unlock(&ttm_glob.lru_lock);
>  	ww_acquire_fini(&release->ticket);
>  }
>  =

> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 3673157527ff..2d2ac532987e 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -243,9 +243,9 @@ static int ttm_bo_individualize_resv(struct ttm_buffe=
r_object *bo)
>  		 * reference it any more. The only tricky case is the trylock on
>  		 * the resv object while holding the lru_lock.
>  		 */
> -		spin_lock(&ttm_glob.lru_lock);
> +		spin_lock(&bo->bdev->lru_lock);
>  		bo->base.resv =3D &bo->base._resv;
> -		spin_unlock(&ttm_glob.lru_lock);
> +		spin_unlock(&bo->bdev->lru_lock);
>  	}
>  =

>  	return r;
> @@ -304,7 +304,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_obje=
ct *bo,
>  =

>  		if (unlock_resv)
>  			dma_resv_unlock(bo->base.resv);
> -		spin_unlock(&ttm_glob.lru_lock);
> +		spin_unlock(&bo->bdev->lru_lock);
>  =

>  		lret =3D dma_resv_wait_timeout_rcu(resv, true, interruptible,
>  						 30 * HZ);
> @@ -314,7 +314,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_obje=
ct *bo,
>  		else if (lret =3D=3D 0)
>  			return -EBUSY;
>  =

> -		spin_lock(&ttm_glob.lru_lock);
> +		spin_lock(&bo->bdev->lru_lock);
>  		if (unlock_resv && !dma_resv_trylock(bo->base.resv)) {
>  			/*
>  			 * We raced, and lost, someone else holds the reservation now,
> @@ -324,7 +324,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_obje=
ct *bo,
>  			 * delayed destruction would succeed, so just return success
>  			 * here.
>  			 */
> -			spin_unlock(&ttm_glob.lru_lock);
> +			spin_unlock(&bo->bdev->lru_lock);
>  			return 0;
>  		}
>  		ret =3D 0;
> @@ -333,13 +333,13 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_ob=
ject *bo,
>  	if (ret || unlikely(list_empty(&bo->ddestroy))) {
>  		if (unlock_resv)
>  			dma_resv_unlock(bo->base.resv);
> -		spin_unlock(&ttm_glob.lru_lock);
> +		spin_unlock(&bo->bdev->lru_lock);
>  		return ret;
>  	}
>  =

>  	ttm_bo_del_from_lru(bo);
>  	list_del_init(&bo->ddestroy);
> -	spin_unlock(&ttm_glob.lru_lock);
> +	spin_unlock(&bo->bdev->lru_lock);
>  	ttm_bo_cleanup_memtype_use(bo);
>  =

>  	if (unlock_resv)
> @@ -356,13 +356,12 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_ob=
ject *bo,
>   */
>  bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all)
>  {
> -	struct ttm_global *glob =3D &ttm_glob;
>  	struct list_head removed;
>  	bool empty;
>  =

>  	INIT_LIST_HEAD(&removed);
>  =

> -	spin_lock(&glob->lru_lock);
> +	spin_lock(&bdev->lru_lock);
>  	while (!list_empty(&bdev->ddestroy)) {
>  		struct ttm_buffer_object *bo;
>  =

> @@ -373,24 +372,24 @@ bool ttm_bo_delayed_delete(struct ttm_device *bdev,=
 bool remove_all)
>  			continue;
>  =

>  		if (remove_all || bo->base.resv !=3D &bo->base._resv) {
> -			spin_unlock(&glob->lru_lock);
> +			spin_unlock(&bdev->lru_lock);
>  			dma_resv_lock(bo->base.resv, NULL);
>  =

> -			spin_lock(&glob->lru_lock);
> +			spin_lock(&bdev->lru_lock);
>  			ttm_bo_cleanup_refs(bo, false, !remove_all, true);
>  =

>  		} else if (dma_resv_trylock(bo->base.resv)) {
>  			ttm_bo_cleanup_refs(bo, false, !remove_all, true);
>  		} else {
> -			spin_unlock(&glob->lru_lock);
> +			spin_unlock(&bdev->lru_lock);
>  		}
>  =

>  		ttm_bo_put(bo);
> -		spin_lock(&glob->lru_lock);
> +		spin_lock(&bdev->lru_lock);
>  	}
>  	list_splice_tail(&removed, &bdev->ddestroy);
>  	empty =3D list_empty(&bdev->ddestroy);
> -	spin_unlock(&glob->lru_lock);
> +	spin_unlock(&bdev->lru_lock);
>  =

>  	return empty;
>  }
> @@ -425,7 +424,7 @@ static void ttm_bo_release(struct kref *kref)
>  		ttm_bo_flush_all_fences(bo);
>  		bo->deleted =3D true;
>  =

> -		spin_lock(&ttm_glob.lru_lock);
> +		spin_lock(&bo->bdev->lru_lock);
>  =

>  		/*
>  		 * Make pinned bos immediately available to
> @@ -442,17 +441,17 @@ static void ttm_bo_release(struct kref *kref)
>  =

>  		kref_init(&bo->kref);
>  		list_add_tail(&bo->ddestroy, &bdev->ddestroy);
> -		spin_unlock(&ttm_glob.lru_lock);
> +		spin_unlock(&bo->bdev->lru_lock);
>  =

>  		schedule_delayed_work(&bdev->wq,
>  				      ((HZ / 100) < 1) ? 1 : HZ / 100);
>  		return;
>  	}
>  =

> -	spin_lock(&ttm_glob.lru_lock);
> +	spin_lock(&bo->bdev->lru_lock);
>  	ttm_bo_del_from_lru(bo);
>  	list_del(&bo->ddestroy);
> -	spin_unlock(&ttm_glob.lru_lock);
> +	spin_unlock(&bo->bdev->lru_lock);
>  =

>  	ttm_bo_cleanup_memtype_use(bo);
>  	dma_resv_unlock(bo->base.resv);
> @@ -626,7 +625,7 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>  	unsigned i;
>  	int ret;
>  =

> -	spin_lock(&ttm_glob.lru_lock);
> +	spin_lock(&bo->bdev->lru_lock);
>  	for (i =3D 0; i < TTM_MAX_BO_PRIORITY; ++i) {
>  		list_for_each_entry(bo, &man->lru[i], lru) {
>  			bool busy;
> @@ -663,7 +662,7 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>  	if (!bo) {
>  		if (busy_bo && !ttm_bo_get_unless_zero(busy_bo))
>  			busy_bo =3D NULL;
> -		spin_unlock(&ttm_glob.lru_lock);
> +		spin_unlock(&bo->bdev->lru_lock);
>  		ret =3D ttm_mem_evict_wait_busy(busy_bo, ctx, ticket);
>  		if (busy_bo)
>  			ttm_bo_put(busy_bo);
> @@ -677,7 +676,7 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>  		return ret;
>  	}
>  =

> -	spin_unlock(&ttm_glob.lru_lock);
> +	spin_unlock(&bo->bdev->lru_lock);
>  =

>  	ret =3D ttm_bo_evict(bo, ctx);
>  	if (locked)
> @@ -777,10 +776,9 @@ static int ttm_bo_mem_placement(struct ttm_buffer_ob=
ject *bo,
>  	mem->mem_type =3D place->mem_type;
>  	mem->placement =3D place->flags;
>  =

> -	spin_lock(&ttm_glob.lru_lock);
> +	spin_lock(&bo->bdev->lru_lock);
>  	ttm_bo_move_to_lru_tail(bo, mem, NULL);
> -	spin_unlock(&ttm_glob.lru_lock);
> -
> +	spin_unlock(&bo->bdev->lru_lock);
>  	return 0;
>  }
>  =

> @@ -1167,7 +1165,6 @@ EXPORT_SYMBOL(ttm_bo_wait);
>  int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ct=
x *ctx,
>  		   gfp_t gfp_flags)
>  {
> -	struct ttm_global *glob =3D &ttm_glob;
>  	bool locked;
>  	int ret;
>  =

> @@ -1188,7 +1185,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, st=
ruct ttm_operation_ctx *ctx,
>  =

>  	ttm_bo_del_from_lru(bo);
>  	/* TODO: Cleanup the locking */
> -	spin_unlock(&glob->lru_lock);
> +	spin_unlock(&bo->bdev->lru_lock);
>  =

>  	/*
>  	 * Move to system cached
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_d=
evice.c
> index 2096a0fd9c35..85f6975d9872 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -81,7 +81,6 @@ static int ttm_global_init(void)
>  	ttm_pool_mgr_init(num_pages * 50 / 100);
>  	ttm_tt_mgr_init();
>  =

> -	spin_lock_init(&glob->lru_lock);
>  	glob->dummy_read_page =3D alloc_page(__GFP_ZERO | GFP_DMA32);
>  =

>  	if (unlikely(glob->dummy_read_page =3D=3D NULL)) {
> @@ -125,13 +124,12 @@ EXPORT_SYMBOL(ttm_global_swapout);
>  long ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ct=
x *ctx,
>  			gfp_t gfp_flags)
>  {
> -	struct ttm_global *glob =3D &ttm_glob;
>  	struct ttm_resource_manager *man;
>  	struct ttm_buffer_object *bo;
>  	unsigned i, j;
>  	int ret;
>  =

> -	spin_lock(&glob->lru_lock);
> +	spin_lock(&bdev->lru_lock);
>  	for (i =3D TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
>  		man =3D ttm_manager_type(bdev, i);
>  		if (!man || !man->use_tt)
> @@ -156,7 +154,7 @@ long ttm_device_swapout(struct ttm_device *bdev, stru=
ct ttm_operation_ctx *ctx,
>  			}
>  		}
>  	}
> -	spin_unlock(&glob->lru_lock);
> +	spin_unlock(&bdev->lru_lock);
>  	return 0;
>  }
>  EXPORT_SYMBOL(ttm_device_swapout);
> @@ -223,6 +221,7 @@ int ttm_device_init(struct ttm_device *bdev, struct t=
tm_device_funcs *funcs,
>  =

>  	bdev->vma_manager =3D vma_manager;
>  	INIT_DELAYED_WORK(&bdev->wq, ttm_device_delayed_workqueue);
> +	spin_lock_init(&bdev->lru_lock);
>  	INIT_LIST_HEAD(&bdev->ddestroy);
>  	bdev->dev_mapping =3D mapping;
>  	mutex_lock(&ttm_global_mutex);
> @@ -235,7 +234,6 @@ EXPORT_SYMBOL(ttm_device_init);
>  =

>  void ttm_device_fini(struct ttm_device *bdev)
>  {
> -	struct ttm_global *glob =3D &ttm_glob;
>  	struct ttm_resource_manager *man;
>  	unsigned i;
>  =

> @@ -252,11 +250,11 @@ void ttm_device_fini(struct ttm_device *bdev)
>  	if (ttm_bo_delayed_delete(bdev, true))
>  		pr_debug("Delayed destroy list was clean\n");
>  =

> -	spin_lock(&glob->lru_lock);
> +	spin_lock(&bdev->lru_lock);
>  	for (i =3D 0; i < TTM_MAX_BO_PRIORITY; ++i)
>  		if (list_empty(&man->lru[0]))
>  			pr_debug("Swap list %d was clean\n", i);
> -	spin_unlock(&glob->lru_lock);
> +	spin_unlock(&bdev->lru_lock);
>  =

>  	ttm_pool_fini(&bdev->pool);
>  	ttm_global_release();
> diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/ttm=
/ttm_execbuf_util.c
> index 690ab97d52b7..071c48d672c6 100644
> --- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> @@ -51,14 +51,12 @@ void ttm_eu_backoff_reservation(struct ww_acquire_ctx=
 *ticket,
>  	if (list_empty(list))
>  		return;
>  =

> -	spin_lock(&ttm_glob.lru_lock);
>  	list_for_each_entry(entry, list, head) {
>  		struct ttm_buffer_object *bo =3D entry->bo;
>  =

> -		ttm_bo_move_to_lru_tail(bo, &bo->mem, NULL);
> +		ttm_bo_move_to_lru_tail_unlocked(bo);
>  		dma_resv_unlock(bo->base.resv);
>  	}
> -	spin_unlock(&ttm_glob.lru_lock);
>  =

>  	if (ticket)
>  		ww_acquire_fini(ticket);
> @@ -154,7 +152,6 @@ void ttm_eu_fence_buffer_objects(struct ww_acquire_ct=
x *ticket,
>  	if (list_empty(list))
>  		return;
>  =

> -	spin_lock(&ttm_glob.lru_lock);
>  	list_for_each_entry(entry, list, head) {
>  		struct ttm_buffer_object *bo =3D entry->bo;
>  =

> @@ -162,10 +159,9 @@ void ttm_eu_fence_buffer_objects(struct ww_acquire_c=
tx *ticket,
>  			dma_resv_add_shared_fence(bo->base.resv, fence);
>  		else
>  			dma_resv_add_excl_fence(bo->base.resv, fence);
> -		ttm_bo_move_to_lru_tail(bo, &bo->mem, NULL);
> +		ttm_bo_move_to_lru_tail_unlocked(bo);
>  		dma_resv_unlock(bo->base.resv);
>  	}
> -	spin_unlock(&ttm_glob.lru_lock);
>  	if (ticket)
>  		ww_acquire_fini(ticket);
>  }
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm=
_resource.c
> index ed1672a9f332..04f2eef653ab 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -91,7 +91,6 @@ int ttm_resource_manager_evict_all(struct ttm_device *b=
dev,
>  		.no_wait_gpu =3D false,
>  		.force_alloc =3D true
>  	};
> -	struct ttm_global *glob =3D &ttm_glob;
>  	struct dma_fence *fence;
>  	int ret;
>  	unsigned i;
> @@ -100,18 +99,18 @@ int ttm_resource_manager_evict_all(struct ttm_device=
 *bdev,
>  	 * Can't use standard list traversal since we're unlocking.
>  	 */
>  =

> -	spin_lock(&glob->lru_lock);
> +	spin_lock(&bdev->lru_lock);
>  	for (i =3D 0; i < TTM_MAX_BO_PRIORITY; ++i) {
>  		while (!list_empty(&man->lru[i])) {
> -			spin_unlock(&glob->lru_lock);
> +			spin_unlock(&bdev->lru_lock);
>  			ret =3D ttm_mem_evict_first(bdev, man, NULL, &ctx,
>  						  NULL);
>  			if (ret)
>  				return ret;
> -			spin_lock(&glob->lru_lock);
> +			spin_lock(&bdev->lru_lock);
>  		}
>  	}
> -	spin_unlock(&glob->lru_lock);
> +	spin_unlock(&bdev->lru_lock);
>  =

>  	spin_lock(&man->move_lock);
>  	fence =3D dma_fence_get(man->move);
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_dri=
ver.h
> index d007feef7676..dbccac957f8f 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -180,9 +180,9 @@ static inline int ttm_bo_reserve_slowpath(struct ttm_=
buffer_object *bo,
>  static inline void
>  ttm_bo_move_to_lru_tail_unlocked(struct ttm_buffer_object *bo)
>  {
> -	spin_lock(&ttm_glob.lru_lock);
> +	spin_lock(&bo->bdev->lru_lock);
>  	ttm_bo_move_to_lru_tail(bo, &bo->mem, NULL);
> -	spin_unlock(&ttm_glob.lru_lock);
> +	spin_unlock(&bo->bdev->lru_lock);
>  }
>  =

>  static inline void ttm_bo_assign_mem(struct ttm_buffer_object *bo,
> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
> index cda6efb4c34b..bae56d29e8ff 100644
> --- a/include/drm/ttm/ttm_device.h
> +++ b/include/drm/ttm/ttm_device.h
> @@ -56,7 +56,6 @@ extern struct ttm_global {
>  	 */
>  =

>  	struct page *dummy_read_page;
> -	spinlock_t lru_lock;
>  =

>  	/**
>  	 * Protected by ttm_global_mutex.
> @@ -277,8 +276,9 @@ struct ttm_device {
>  	struct ttm_pool pool;
>  =

>  	/*
> -	 * Protected by the global:lru lock.
> +	 * Protection for the per manager LRU and ddestroy lists.
>  	 */
> +	spinlock_t lru_lock;
>  	struct list_head ddestroy;
>  =

>  	/*
> -- =

> 2.25.1
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
