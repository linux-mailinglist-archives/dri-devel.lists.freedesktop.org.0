Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D30FB343A5F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 08:13:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7769E89CBC;
	Mon, 22 Mar 2021 07:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CDB89C63
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 07:13:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DdVZHfOqEa5knI4Mi3ApcB8z61GaBpWtCXgPH3284QD6zVyLODIFJHd4vsCAAMt8U0qQaf9i1o53VjFKmrtJAQCgD1INHQenhZ0123cf2nUCv/8xt2RHGVhzCvVPK4x2iBRFpdzX2uYFf9bcXEFKy9XeRHC4ntmh/U1iKeGiTv8pvkDbgzb0/EYCGoGvluJyBjWC69xLoXEHxgrM+/tWp85BObG77eRrGxamXFMkP63DRmqGxQ/D4uOD7HLhj5MGh6w/FarWqc8Fos1tK68lXdFrjzisP7mUW5h9FqWxKn7jjomBaMaT6aXSNvdlPDzt8HMkSYbP493R5VIKIm23EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EnTuVhx8N/Ant5ul7i3v7iI/Mqoml9r4bWFcJI5vBk8=;
 b=aWKMXbHRIKKeg/IPDntie84Yac1AKNkMwdBPqTmx6+DEGekCkMv8HbniLE+1Biq06oGtJdaa0w6P7RZ4zDOHccHVuJgyQxOYf8lRh3x51UxVefd397pqhXcXrc3sWIsmAuYlPd3BEGPVnifAmH2vJkZLUQO/Vo5+Sn0+2kYcCd1xeWHuHW6gah119i7krQmVO4vwAUqCiBjIVIOm5v+z7+EJbfbYsbSU3sMvEplZVmLi/Qv4IMJ2m+CiPre2gw2P7No42HEObp9sGkU4RId5/O8LaXnOc4e32C8H/5Xhh22DGODIhHoQ6APlrrYF3d+7kfRE6D7oP4r55+ui7UDpqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EnTuVhx8N/Ant5ul7i3v7iI/Mqoml9r4bWFcJI5vBk8=;
 b=ouOy1rTPFrp4nnanfbt21TznHrBz0RSij3oeCCSIS0P5aKXTt3Xcb4Br+0IVdqIQ6SxKkarj+BLuvLUy0sgwxAQy/59DTCJRbGh2DVk9FpL/66rDRz5+tuCgS6ixrjy0V57yN9oaCso0MQUVJelnAZZ6c+kTQw0vGgZ4Vabcebw=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1248.namprd12.prod.outlook.com (2603:10b6:300:12::21)
 by MWHPR1201MB2541.namprd12.prod.outlook.com (2603:10b6:300:e5::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 07:13:31 +0000
Received: from MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::5094:3a69:806f:8a28]) by MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::5094:3a69:806f:8a28%5]) with mapi id 15.20.3955.027; Mon, 22 Mar 2021
 07:13:31 +0000
Date: Mon, 22 Mar 2021 15:13:23 +0800
From: Huang Rui <ray.huang@amd.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 3/3] drm/ttm: switch to per device LRU lock
Message-ID: <20210322071323.GA382588@hr-amd>
References: <20210318124719.13656-1-christian.koenig@amd.com>
 <20210318124719.13656-3-christian.koenig@amd.com>
 <20210319043232.GC3262181@hr-amd>
 <1d263c6d-2cd5-9821-fffa-f9625eb28931@gmail.com>
Content-Disposition: inline
In-Reply-To: <1d263c6d-2cd5-9821-fffa-f9625eb28931@gmail.com>
X-Originating-IP: [58.247.170.245]
X-ClientProxiedBy: HK2PR03CA0064.apcprd03.prod.outlook.com
 (2603:1096:202:17::34) To MWHPR12MB1248.namprd12.prod.outlook.com
 (2603:10b6:300:12::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hr-amd (58.247.170.245) by
 HK2PR03CA0064.apcprd03.prod.outlook.com (2603:1096:202:17::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.15 via Frontend Transport; Mon, 22 Mar 2021 07:13:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f52a5f54-bc34-4161-d77f-08d8ed01ffab
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2541:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB25414BEA954BDBA8715CAFFDEC659@MWHPR1201MB2541.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vg/PQQiYJTW1TG5yYaGjG51pkHTnXMjvjut4iiXOkb+7Si+9Eq1YYCZR2n4o8lLEDCt1RYF9E1YuGPXPKfCRvuOyaxy9xeVRe/I2ebIXzbYtLIJWEaR54km2O4VftsUV1FMaalN63UQWlz0tZqNbPzw+RXtAIfYjPvG9jPNYRwsoG7bhwQcsvnk4nnQAGxsh11P8W16adgPsLPx+8ldPKSWavHSTX0Zg+cT+1PStimUJH5N2X6ZKnmQuted1H76q5SctpeD8jDenjbDpH7KIly76TGXfzFPb1LIa0sEpr+AEQA2bO6hVN+gHwSndQ4jGeAy71ckuVUyqbvI4IYDM1kIMeLVcm2V+AKxMFkSJ1FIW2onMr1yyLz4JSx87ouBHLtf6HAWXn/9DDeIFztNAeTHAw+kRtweOy6zkJrHTTCZ0O/Ct0EsqTUc+NK98SjKQ48bB92oaqxg5aKFlRSmQKnDNu/xIQn4mztCqKRMQLL5eqznlFnJDUCTvERsC0CEj39T28HDBolLE712bdXAD8w26MCu+S0vSlTYgGOLbWclRjiSjnBrWkDZBwTj9/IFGgycF/0o/DM3uJSWSFAopz9gcuImXR+s0pBeW0z8sKTpYbiakkL7R27E/7oqvWlaPGrL2XFWy087FbJMaqQPxcQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1248.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(16526019)(4326008)(6916009)(5660300002)(478600001)(52116002)(6666004)(33716001)(6496006)(26005)(9686003)(55016002)(38100700001)(186003)(33656002)(8676002)(66574015)(316002)(66946007)(956004)(66556008)(86362001)(66476007)(1076003)(2906002)(30864003)(54906003)(83380400001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?NPzBw2kuFdxA2GnMPw3GDHr6k0W3sqmi3y379IC2jSdmKH3o9YNSHMo0wm?=
 =?iso-8859-1?Q?hc+ECi9PKdkcIYKR7Qpud9FlMBd0lF0FbTXBMU5xPnDmrGLKL+xNF6eJXl?=
 =?iso-8859-1?Q?gmLbS/AOqGDjf/Qv0ADVmIfZ7XZcbZWeAgNWP4CfmnefxOeqwRAAltnFic?=
 =?iso-8859-1?Q?L+TkpEbiBgJ4CDgl1C9aADkcPfybYim/ZaUXXC9DglGRJYpocq9iFXv9mB?=
 =?iso-8859-1?Q?9dzF/a8v9E1XJ6/MwCvFV77wgNKNSFb39jh/cxBghqbJunhKUIm7PBMkL9?=
 =?iso-8859-1?Q?8qsoLPYuMRWPXLHuMqeiNRBeQGySbmCdDrHjvFfu3WCOs6mQ7ErAdfQFrD?=
 =?iso-8859-1?Q?9qUgsnYxsKcfRbS9K0EdeNCBeIFk/IlDy7hXx7Q6E+NzXJlmCX2l7fwQ+B?=
 =?iso-8859-1?Q?BLiKHY3TZki61zviMWbUPo/ZLrfSvOD8rRwJ3vmwVDVgRzH2X90Dr4PdMb?=
 =?iso-8859-1?Q?moCWOFo9HfI1cjBZuiwmfoHnuD8EYREie2rLxW68qWKhH9Sq7WX/edzGL2?=
 =?iso-8859-1?Q?JiNLm6MbXk3SDT0xASipglPo68o/KBDIw0s1b3KAni5q3m4n/TcT9u+hOs?=
 =?iso-8859-1?Q?c4krUYsmoi2tZQk1DkgVjnNKpGgG4xwYWXMxuEoaUPQM3SF45T7Ap2CKJL?=
 =?iso-8859-1?Q?rVinf5y73czrGDJFpc92/lIgEL22Qz4E9WcNQWPfWTfWnh3MM/pKSDEvu7?=
 =?iso-8859-1?Q?EyChQsf8wACVIq9DHyvY9a2p6LJ3TizWoGSSX5OguVw8GroalQgfygdYGR?=
 =?iso-8859-1?Q?6BRIhau7CQtblzEITTBjKDdYwnSKaPcRw8R2RFxndoev2n9+Pon3zzsSGS?=
 =?iso-8859-1?Q?tCkccYZjjT5jq4T8gaTKtnHDZ+JHxgg/cEyn9zwlBzsA0DhYO1ozc+FJ3c?=
 =?iso-8859-1?Q?P1SR9ZsmWxRE9k+oHq2GAXyQe3Z0VsBVMqYksTYGuQmfI8dbX85JSv4xcG?=
 =?iso-8859-1?Q?BCHJDNYC80d4DoUR8RmfMj9MpQQDjBV9nLGq+sPLfNA1fq1Zsn7wP7qnfF?=
 =?iso-8859-1?Q?o/61b94DQz0XzssBzMiJgCl3t201V5v5KvmrLDKKYswu1w78jNtWifJtKi?=
 =?iso-8859-1?Q?veJBIp/B8D22he4mYnzegbt1qe9ySJ67om9k1niXU5PvNUUwqu/12TeMDV?=
 =?iso-8859-1?Q?Vz47DOIWI/bLeWTqwyjh51Iz74sKnPzsDPLGlvRxDomgBqWbmpgWaBp/Ww?=
 =?iso-8859-1?Q?EsuuRga6oqktZQIXAep6hBspWKRuMfqeCaJm+PWRLNfWzoI4Wc8kOPvBpi?=
 =?iso-8859-1?Q?joO/Z4XGS+my9vvtG9rNIlpTqNxRCHQfjVaLrNZ+SkmevpYY4Z0XOvJR7z?=
 =?iso-8859-1?Q?60NHNMcT2+LiSIwtNvnExaGLahlyq6BZX6wManTDxTTZ8wq2adwLhsOg+o?=
 =?iso-8859-1?Q?lP64jmp6Cw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f52a5f54-bc34-4161-d77f-08d8ed01ffab
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 07:13:31.6855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +cnNKx6o6Rx/F02wJUVslwcnPuxVKJBK8wYis40Lm2c5r5MTrAHxaQx/5sTYYrufeQI8JbPLwlt9U2MBHJIlxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2541
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

On Fri, Mar 19, 2021 at 08:10:21PM +0800, Christian K=F6nig wrote:
> Am 19.03.21 um 05:32 schrieb Huang Rui:
> > On Thu, Mar 18, 2021 at 08:47:19PM +0800, Christian K=F6nig wrote:
> >> Instead of having a global lock.
> >>
> >> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> >> ---
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |  8 ++---
> >>   drivers/gpu/drm/qxl/qxl_release.c      |  5 +--
> >>   drivers/gpu/drm/ttm/ttm_bo.c           | 49 ++++++++++++------------=
--
> >>   drivers/gpu/drm/ttm/ttm_device.c       | 12 +++----
> >>   drivers/gpu/drm/ttm/ttm_execbuf_util.c |  8 ++---
> >>   drivers/gpu/drm/ttm/ttm_resource.c     |  9 +++--
> >>   include/drm/ttm/ttm_bo_driver.h        |  4 +--
> >>   include/drm/ttm/ttm_device.h           |  4 +--
> >>   8 files changed, 43 insertions(+), 56 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_vm.c
> >> index 9d19078246c8..ae18c0e32347 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> >> @@ -638,15 +638,15 @@ void amdgpu_vm_move_to_lru_tail(struct amdgpu_de=
vice *adev,
> >>   	struct amdgpu_vm_bo_base *bo_base;
> >>   =

> >>   	if (vm->bulk_moveable) {
> >> -		spin_lock(&ttm_glob.lru_lock);
> >> +		spin_lock(&adev->mman.bdev.lru_lock);
> > Could you please explain why do you want to instead of the global lock?
> =

> Potentially less contention.
> =

> But you are right mentioning this in the commit message is a good idea.
> =


Thanks.

Patch is Acked-by: Huang Rui <ray.huang@amd.com>

> Regards,
> Christian.
> =

> >
> > Thanks,
> > Ray
> >
> >>   		ttm_bo_bulk_move_lru_tail(&vm->lru_bulk_move);
> >> -		spin_unlock(&ttm_glob.lru_lock);
> >> +		spin_unlock(&adev->mman.bdev.lru_lock);
> >>   		return;
> >>   	}
> >>   =

> >>   	memset(&vm->lru_bulk_move, 0, sizeof(vm->lru_bulk_move));
> >>   =

> >> -	spin_lock(&ttm_glob.lru_lock);
> >> +	spin_lock(&adev->mman.bdev.lru_lock);
> >>   	list_for_each_entry(bo_base, &vm->idle, vm_status) {
> >>   		struct amdgpu_bo *bo =3D bo_base->bo;
> >>   =

> >> @@ -660,7 +660,7 @@ void amdgpu_vm_move_to_lru_tail(struct amdgpu_devi=
ce *adev,
> >>   						&bo->shadow->tbo.mem,
> >>   						&vm->lru_bulk_move);
> >>   	}
> >> -	spin_unlock(&ttm_glob.lru_lock);
> >> +	spin_unlock(&adev->mman.bdev.lru_lock);
> >>   =

> >>   	vm->bulk_moveable =3D true;
> >>   }
> >> diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/q=
xl_release.c
> >> index f5845c96d414..b19f2f00b215 100644
> >> --- a/drivers/gpu/drm/qxl/qxl_release.c
> >> +++ b/drivers/gpu/drm/qxl/qxl_release.c
> >> @@ -426,16 +426,13 @@ void qxl_release_fence_buffer_objects(struct qxl=
_release *release)
> >>   		       release->id | 0xf0000000, release->base.seqno);
> >>   	trace_dma_fence_emit(&release->base);
> >>   =

> >> -	spin_lock(&ttm_glob.lru_lock);
> >> -
> >>   	list_for_each_entry(entry, &release->bos, head) {
> >>   		bo =3D entry->bo;
> >>   =

> >>   		dma_resv_add_shared_fence(bo->base.resv, &release->base);
> >> -		ttm_bo_move_to_lru_tail(bo, &bo->mem, NULL);
> >> +		ttm_bo_move_to_lru_tail_unlocked(bo);
> >>   		dma_resv_unlock(bo->base.resv);
> >>   	}
> >> -	spin_unlock(&ttm_glob.lru_lock);
> >>   	ww_acquire_fini(&release->ticket);
> >>   }
> >>   =

> >> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo=
.c
> >> index 3673157527ff..2d2ac532987e 100644
> >> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> >> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> >> @@ -243,9 +243,9 @@ static int ttm_bo_individualize_resv(struct ttm_bu=
ffer_object *bo)
> >>   		 * reference it any more. The only tricky case is the trylock on
> >>   		 * the resv object while holding the lru_lock.
> >>   		 */
> >> -		spin_lock(&ttm_glob.lru_lock);
> >> +		spin_lock(&bo->bdev->lru_lock);
> >>   		bo->base.resv =3D &bo->base._resv;
> >> -		spin_unlock(&ttm_glob.lru_lock);
> >> +		spin_unlock(&bo->bdev->lru_lock);
> >>   	}
> >>   =

> >>   	return r;
> >> @@ -304,7 +304,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_o=
bject *bo,
> >>   =

> >>   		if (unlock_resv)
> >>   			dma_resv_unlock(bo->base.resv);
> >> -		spin_unlock(&ttm_glob.lru_lock);
> >> +		spin_unlock(&bo->bdev->lru_lock);
> >>   =

> >>   		lret =3D dma_resv_wait_timeout_rcu(resv, true, interruptible,
> >>   						 30 * HZ);
> >> @@ -314,7 +314,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_o=
bject *bo,
> >>   		else if (lret =3D=3D 0)
> >>   			return -EBUSY;
> >>   =

> >> -		spin_lock(&ttm_glob.lru_lock);
> >> +		spin_lock(&bo->bdev->lru_lock);
> >>   		if (unlock_resv && !dma_resv_trylock(bo->base.resv)) {
> >>   			/*
> >>   			 * We raced, and lost, someone else holds the reservation now,
> >> @@ -324,7 +324,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_o=
bject *bo,
> >>   			 * delayed destruction would succeed, so just return success
> >>   			 * here.
> >>   			 */
> >> -			spin_unlock(&ttm_glob.lru_lock);
> >> +			spin_unlock(&bo->bdev->lru_lock);
> >>   			return 0;
> >>   		}
> >>   		ret =3D 0;
> >> @@ -333,13 +333,13 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer=
_object *bo,
> >>   	if (ret || unlikely(list_empty(&bo->ddestroy))) {
> >>   		if (unlock_resv)
> >>   			dma_resv_unlock(bo->base.resv);
> >> -		spin_unlock(&ttm_glob.lru_lock);
> >> +		spin_unlock(&bo->bdev->lru_lock);
> >>   		return ret;
> >>   	}
> >>   =

> >>   	ttm_bo_del_from_lru(bo);
> >>   	list_del_init(&bo->ddestroy);
> >> -	spin_unlock(&ttm_glob.lru_lock);
> >> +	spin_unlock(&bo->bdev->lru_lock);
> >>   	ttm_bo_cleanup_memtype_use(bo);
> >>   =

> >>   	if (unlock_resv)
> >> @@ -356,13 +356,12 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer=
_object *bo,
> >>    */
> >>   bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all)
> >>   {
> >> -	struct ttm_global *glob =3D &ttm_glob;
> >>   	struct list_head removed;
> >>   	bool empty;
> >>   =

> >>   	INIT_LIST_HEAD(&removed);
> >>   =

> >> -	spin_lock(&glob->lru_lock);
> >> +	spin_lock(&bdev->lru_lock);
> >>   	while (!list_empty(&bdev->ddestroy)) {
> >>   		struct ttm_buffer_object *bo;
> >>   =

> >> @@ -373,24 +372,24 @@ bool ttm_bo_delayed_delete(struct ttm_device *bd=
ev, bool remove_all)
> >>   			continue;
> >>   =

> >>   		if (remove_all || bo->base.resv !=3D &bo->base._resv) {
> >> -			spin_unlock(&glob->lru_lock);
> >> +			spin_unlock(&bdev->lru_lock);
> >>   			dma_resv_lock(bo->base.resv, NULL);
> >>   =

> >> -			spin_lock(&glob->lru_lock);
> >> +			spin_lock(&bdev->lru_lock);
> >>   			ttm_bo_cleanup_refs(bo, false, !remove_all, true);
> >>   =

> >>   		} else if (dma_resv_trylock(bo->base.resv)) {
> >>   			ttm_bo_cleanup_refs(bo, false, !remove_all, true);
> >>   		} else {
> >> -			spin_unlock(&glob->lru_lock);
> >> +			spin_unlock(&bdev->lru_lock);
> >>   		}
> >>   =

> >>   		ttm_bo_put(bo);
> >> -		spin_lock(&glob->lru_lock);
> >> +		spin_lock(&bdev->lru_lock);
> >>   	}
> >>   	list_splice_tail(&removed, &bdev->ddestroy);
> >>   	empty =3D list_empty(&bdev->ddestroy);
> >> -	spin_unlock(&glob->lru_lock);
> >> +	spin_unlock(&bdev->lru_lock);
> >>   =

> >>   	return empty;
> >>   }
> >> @@ -425,7 +424,7 @@ static void ttm_bo_release(struct kref *kref)
> >>   		ttm_bo_flush_all_fences(bo);
> >>   		bo->deleted =3D true;
> >>   =

> >> -		spin_lock(&ttm_glob.lru_lock);
> >> +		spin_lock(&bo->bdev->lru_lock);
> >>   =

> >>   		/*
> >>   		 * Make pinned bos immediately available to
> >> @@ -442,17 +441,17 @@ static void ttm_bo_release(struct kref *kref)
> >>   =

> >>   		kref_init(&bo->kref);
> >>   		list_add_tail(&bo->ddestroy, &bdev->ddestroy);
> >> -		spin_unlock(&ttm_glob.lru_lock);
> >> +		spin_unlock(&bo->bdev->lru_lock);
> >>   =

> >>   		schedule_delayed_work(&bdev->wq,
> >>   				      ((HZ / 100) < 1) ? 1 : HZ / 100);
> >>   		return;
> >>   	}
> >>   =

> >> -	spin_lock(&ttm_glob.lru_lock);
> >> +	spin_lock(&bo->bdev->lru_lock);
> >>   	ttm_bo_del_from_lru(bo);
> >>   	list_del(&bo->ddestroy);
> >> -	spin_unlock(&ttm_glob.lru_lock);
> >> +	spin_unlock(&bo->bdev->lru_lock);
> >>   =

> >>   	ttm_bo_cleanup_memtype_use(bo);
> >>   	dma_resv_unlock(bo->base.resv);
> >> @@ -626,7 +625,7 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
> >>   	unsigned i;
> >>   	int ret;
> >>   =

> >> -	spin_lock(&ttm_glob.lru_lock);
> >> +	spin_lock(&bo->bdev->lru_lock);
> >>   	for (i =3D 0; i < TTM_MAX_BO_PRIORITY; ++i) {
> >>   		list_for_each_entry(bo, &man->lru[i], lru) {
> >>   			bool busy;
> >> @@ -663,7 +662,7 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
> >>   	if (!bo) {
> >>   		if (busy_bo && !ttm_bo_get_unless_zero(busy_bo))
> >>   			busy_bo =3D NULL;
> >> -		spin_unlock(&ttm_glob.lru_lock);
> >> +		spin_unlock(&bo->bdev->lru_lock);
> >>   		ret =3D ttm_mem_evict_wait_busy(busy_bo, ctx, ticket);
> >>   		if (busy_bo)
> >>   			ttm_bo_put(busy_bo);
> >> @@ -677,7 +676,7 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
> >>   		return ret;
> >>   	}
> >>   =

> >> -	spin_unlock(&ttm_glob.lru_lock);
> >> +	spin_unlock(&bo->bdev->lru_lock);
> >>   =

> >>   	ret =3D ttm_bo_evict(bo, ctx);
> >>   	if (locked)
> >> @@ -777,10 +776,9 @@ static int ttm_bo_mem_placement(struct ttm_buffer=
_object *bo,
> >>   	mem->mem_type =3D place->mem_type;
> >>   	mem->placement =3D place->flags;
> >>   =

> >> -	spin_lock(&ttm_glob.lru_lock);
> >> +	spin_lock(&bo->bdev->lru_lock);
> >>   	ttm_bo_move_to_lru_tail(bo, mem, NULL);
> >> -	spin_unlock(&ttm_glob.lru_lock);
> >> -
> >> +	spin_unlock(&bo->bdev->lru_lock);
> >>   	return 0;
> >>   }
> >>   =

> >> @@ -1167,7 +1165,6 @@ EXPORT_SYMBOL(ttm_bo_wait);
> >>   int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operatio=
n_ctx *ctx,
> >>   		   gfp_t gfp_flags)
> >>   {
> >> -	struct ttm_global *glob =3D &ttm_glob;
> >>   	bool locked;
> >>   	int ret;
> >>   =

> >> @@ -1188,7 +1185,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo,=
 struct ttm_operation_ctx *ctx,
> >>   =

> >>   	ttm_bo_del_from_lru(bo);
> >>   	/* TODO: Cleanup the locking */
> >> -	spin_unlock(&glob->lru_lock);
> >> +	spin_unlock(&bo->bdev->lru_lock);
> >>   =

> >>   	/*
> >>   	 * Move to system cached
> >> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/tt=
m_device.c
> >> index 2096a0fd9c35..85f6975d9872 100644
> >> --- a/drivers/gpu/drm/ttm/ttm_device.c
> >> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> >> @@ -81,7 +81,6 @@ static int ttm_global_init(void)
> >>   	ttm_pool_mgr_init(num_pages * 50 / 100);
> >>   	ttm_tt_mgr_init();
> >>   =

> >> -	spin_lock_init(&glob->lru_lock);
> >>   	glob->dummy_read_page =3D alloc_page(__GFP_ZERO | GFP_DMA32);
> >>   =

> >>   	if (unlikely(glob->dummy_read_page =3D=3D NULL)) {
> >> @@ -125,13 +124,12 @@ EXPORT_SYMBOL(ttm_global_swapout);
> >>   long ttm_device_swapout(struct ttm_device *bdev, struct ttm_operatio=
n_ctx *ctx,
> >>   			gfp_t gfp_flags)
> >>   {
> >> -	struct ttm_global *glob =3D &ttm_glob;
> >>   	struct ttm_resource_manager *man;
> >>   	struct ttm_buffer_object *bo;
> >>   	unsigned i, j;
> >>   	int ret;
> >>   =

> >> -	spin_lock(&glob->lru_lock);
> >> +	spin_lock(&bdev->lru_lock);
> >>   	for (i =3D TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
> >>   		man =3D ttm_manager_type(bdev, i);
> >>   		if (!man || !man->use_tt)
> >> @@ -156,7 +154,7 @@ long ttm_device_swapout(struct ttm_device *bdev, s=
truct ttm_operation_ctx *ctx,
> >>   			}
> >>   		}
> >>   	}
> >> -	spin_unlock(&glob->lru_lock);
> >> +	spin_unlock(&bdev->lru_lock);
> >>   	return 0;
> >>   }
> >>   EXPORT_SYMBOL(ttm_device_swapout);
> >> @@ -223,6 +221,7 @@ int ttm_device_init(struct ttm_device *bdev, struc=
t ttm_device_funcs *funcs,
> >>   =

> >>   	bdev->vma_manager =3D vma_manager;
> >>   	INIT_DELAYED_WORK(&bdev->wq, ttm_device_delayed_workqueue);
> >> +	spin_lock_init(&bdev->lru_lock);
> >>   	INIT_LIST_HEAD(&bdev->ddestroy);
> >>   	bdev->dev_mapping =3D mapping;
> >>   	mutex_lock(&ttm_global_mutex);
> >> @@ -235,7 +234,6 @@ EXPORT_SYMBOL(ttm_device_init);
> >>   =

> >>   void ttm_device_fini(struct ttm_device *bdev)
> >>   {
> >> -	struct ttm_global *glob =3D &ttm_glob;
> >>   	struct ttm_resource_manager *man;
> >>   	unsigned i;
> >>   =

> >> @@ -252,11 +250,11 @@ void ttm_device_fini(struct ttm_device *bdev)
> >>   	if (ttm_bo_delayed_delete(bdev, true))
> >>   		pr_debug("Delayed destroy list was clean\n");
> >>   =

> >> -	spin_lock(&glob->lru_lock);
> >> +	spin_lock(&bdev->lru_lock);
> >>   	for (i =3D 0; i < TTM_MAX_BO_PRIORITY; ++i)
> >>   		if (list_empty(&man->lru[0]))
> >>   			pr_debug("Swap list %d was clean\n", i);
> >> -	spin_unlock(&glob->lru_lock);
> >> +	spin_unlock(&bdev->lru_lock);
> >>   =

> >>   	ttm_pool_fini(&bdev->pool);
> >>   	ttm_global_release();
> >> diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/=
ttm/ttm_execbuf_util.c
> >> index 690ab97d52b7..071c48d672c6 100644
> >> --- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> >> +++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> >> @@ -51,14 +51,12 @@ void ttm_eu_backoff_reservation(struct ww_acquire_=
ctx *ticket,
> >>   	if (list_empty(list))
> >>   		return;
> >>   =

> >> -	spin_lock(&ttm_glob.lru_lock);
> >>   	list_for_each_entry(entry, list, head) {
> >>   		struct ttm_buffer_object *bo =3D entry->bo;
> >>   =

> >> -		ttm_bo_move_to_lru_tail(bo, &bo->mem, NULL);
> >> +		ttm_bo_move_to_lru_tail_unlocked(bo);
> >>   		dma_resv_unlock(bo->base.resv);
> >>   	}
> >> -	spin_unlock(&ttm_glob.lru_lock);
> >>   =

> >>   	if (ticket)
> >>   		ww_acquire_fini(ticket);
> >> @@ -154,7 +152,6 @@ void ttm_eu_fence_buffer_objects(struct ww_acquire=
_ctx *ticket,
> >>   	if (list_empty(list))
> >>   		return;
> >>   =

> >> -	spin_lock(&ttm_glob.lru_lock);
> >>   	list_for_each_entry(entry, list, head) {
> >>   		struct ttm_buffer_object *bo =3D entry->bo;
> >>   =

> >> @@ -162,10 +159,9 @@ void ttm_eu_fence_buffer_objects(struct ww_acquir=
e_ctx *ticket,
> >>   			dma_resv_add_shared_fence(bo->base.resv, fence);
> >>   		else
> >>   			dma_resv_add_excl_fence(bo->base.resv, fence);
> >> -		ttm_bo_move_to_lru_tail(bo, &bo->mem, NULL);
> >> +		ttm_bo_move_to_lru_tail_unlocked(bo);
> >>   		dma_resv_unlock(bo->base.resv);
> >>   	}
> >> -	spin_unlock(&ttm_glob.lru_lock);
> >>   	if (ticket)
> >>   		ww_acquire_fini(ticket);
> >>   }
> >> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/=
ttm_resource.c
> >> index ed1672a9f332..04f2eef653ab 100644
> >> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> >> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> >> @@ -91,7 +91,6 @@ int ttm_resource_manager_evict_all(struct ttm_device=
 *bdev,
> >>   		.no_wait_gpu =3D false,
> >>   		.force_alloc =3D true
> >>   	};
> >> -	struct ttm_global *glob =3D &ttm_glob;
> >>   	struct dma_fence *fence;
> >>   	int ret;
> >>   	unsigned i;
> >> @@ -100,18 +99,18 @@ int ttm_resource_manager_evict_all(struct ttm_dev=
ice *bdev,
> >>   	 * Can't use standard list traversal since we're unlocking.
> >>   	 */
> >>   =

> >> -	spin_lock(&glob->lru_lock);
> >> +	spin_lock(&bdev->lru_lock);
> >>   	for (i =3D 0; i < TTM_MAX_BO_PRIORITY; ++i) {
> >>   		while (!list_empty(&man->lru[i])) {
> >> -			spin_unlock(&glob->lru_lock);
> >> +			spin_unlock(&bdev->lru_lock);
> >>   			ret =3D ttm_mem_evict_first(bdev, man, NULL, &ctx,
> >>   						  NULL);
> >>   			if (ret)
> >>   				return ret;
> >> -			spin_lock(&glob->lru_lock);
> >> +			spin_lock(&bdev->lru_lock);
> >>   		}
> >>   	}
> >> -	spin_unlock(&glob->lru_lock);
> >> +	spin_unlock(&bdev->lru_lock);
> >>   =

> >>   	spin_lock(&man->move_lock);
> >>   	fence =3D dma_fence_get(man->move);
> >> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_=
driver.h
> >> index d007feef7676..dbccac957f8f 100644
> >> --- a/include/drm/ttm/ttm_bo_driver.h
> >> +++ b/include/drm/ttm/ttm_bo_driver.h
> >> @@ -180,9 +180,9 @@ static inline int ttm_bo_reserve_slowpath(struct t=
tm_buffer_object *bo,
> >>   static inline void
> >>   ttm_bo_move_to_lru_tail_unlocked(struct ttm_buffer_object *bo)
> >>   {
> >> -	spin_lock(&ttm_glob.lru_lock);
> >> +	spin_lock(&bo->bdev->lru_lock);
> >>   	ttm_bo_move_to_lru_tail(bo, &bo->mem, NULL);
> >> -	spin_unlock(&ttm_glob.lru_lock);
> >> +	spin_unlock(&bo->bdev->lru_lock);
> >>   }
> >>   =

> >>   static inline void ttm_bo_assign_mem(struct ttm_buffer_object *bo,
> >> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device=
.h
> >> index cda6efb4c34b..bae56d29e8ff 100644
> >> --- a/include/drm/ttm/ttm_device.h
> >> +++ b/include/drm/ttm/ttm_device.h
> >> @@ -56,7 +56,6 @@ extern struct ttm_global {
> >>   	 */
> >>   =

> >>   	struct page *dummy_read_page;
> >> -	spinlock_t lru_lock;
> >>   =

> >>   	/**
> >>   	 * Protected by ttm_global_mutex.
> >> @@ -277,8 +276,9 @@ struct ttm_device {
> >>   	struct ttm_pool pool;
> >>   =

> >>   	/*
> >> -	 * Protected by the global:lru lock.
> >> +	 * Protection for the per manager LRU and ddestroy lists.
> >>   	 */
> >> +	spinlock_t lru_lock;
> >>   	struct list_head ddestroy;
> >>   =

> >>   	/*
> >> -- =

> >> 2.25.1
> >>
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
