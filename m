Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A91BB2D2BB9
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 14:16:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7116E161;
	Tue,  8 Dec 2020 13:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2044.outbound.protection.outlook.com [40.107.236.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464A56E0CF
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 13:16:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X9x8y1MUtWC1LCXXrOXRDntgxW3wWsaRaahDG1KHsy/KAQbQZfa/ppkNs4cJG2UZ394xmAiK+DdZu3xd8p97KF+ti2/EAn1le//CSoEFa8s4U5w8GlJNsgh4E34l8julejxhXjwDVI5dnczrgDTVV+J9BIpkBX3zE6T9aOOWbmnjOfgguEMjI5P6leK3BJ1mLSNTOFUrjcUn+e6YGLzPUrN0QZGylIaMMbMSGKmmldEAeTrmRUUZtH35+TbP031qOHHMIYwMKLdtHiIUXspxPXa3ab9YjdkFwvfzyaqDb5ouv6I8EeHolFxXCBOmEZDnEcV1tq3d+Moe2cS79T+sfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTY4MMmYN2gPArQ97klt5aSXAk5Covu4ESVGwYAYh8g=;
 b=YhZP1QSMOWIRJwA9PxEkXaCWOcNAI2cFn7C4JzJ+esAUiQeZi1U2XzqZAB9/j85uSLjlxvCIrGJeYBLVEEb0xNCFcs3z/8mFyYct10lRl3Ordmub5h+Z1vo0um+dgHI5zGU5i/pkwC0Rs7TQmGPt2ITLvlzmOYLhQhNGi5AOaLK9Mia5X4IhlcQJoVE/4tRDqp6m3smsvUzjdNbyx4cJNV+mXwDCOGTk0fTBVW7rQJmP+LzNqWsI9anfWzGLH9KGR1cxso7+sa21ywf9NariVMWeVJ/9/sNO8poSwXXTJezFmm1Bmf/LJ+kJIKRbr4+X1G5B1Xe4pDj2ZUqInXe3yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTY4MMmYN2gPArQ97klt5aSXAk5Covu4ESVGwYAYh8g=;
 b=BTRiXW/C6a3HJkxTmWnU8r0yuslguo6ilwgtB7q/LJ4WmhbrSSFCk5bj9eDAbY7LXUl5mGnV7hXMDZaP9trf9hP3Q1SeAgFCjTyqfogmlK6VU/3QnJwgy/HR/OvaaIcbPWYm/rjDv1EtXVKBD1pVZWb/0rjtUjjrb//yrDp48AI=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1248.namprd12.prod.outlook.com (2603:10b6:300:12::21)
 by MW3PR12MB4364.namprd12.prod.outlook.com (2603:10b6:303:5c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.20; Tue, 8 Dec
 2020 13:16:13 +0000
Received: from MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::4590:261a:f3b1:a1a2]) by MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::4590:261a:f3b1:a1a2%9]) with mapi id 15.20.3654.012; Tue, 8 Dec 2020
 13:16:13 +0000
Date: Tue, 8 Dec 2020 21:16:07 +0800
From: Huang Rui <ray.huang@amd.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/ttm: cleanup BO size handling
Message-ID: <20201208131607.GE661395@hr-amd>
References: <20201207163300.183853-1-christian.koenig@amd.com>
Content-Disposition: inline
In-Reply-To: <20201207163300.183853-1-christian.koenig@amd.com>
X-Originating-IP: [58.247.170.245]
X-ClientProxiedBy: HK2PR0401CA0012.apcprd04.prod.outlook.com
 (2603:1096:202:2::22) To MWHPR12MB1248.namprd12.prod.outlook.com
 (2603:10b6:300:12::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hr-amd (58.247.170.245) by
 HK2PR0401CA0012.apcprd04.prod.outlook.com (2603:1096:202:2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Tue, 8 Dec 2020 13:16:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b0fe8a06-3823-4837-de8f-08d89b7b6fc4
X-MS-TrafficTypeDiagnostic: MW3PR12MB4364:
X-Microsoft-Antispam-PRVS: <MW3PR12MB4364E46B162FED272EE6EFE0ECCD0@MW3PR12MB4364.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fr1WrwQ6TDaudL/s/Qo8ThA3XGB1d1Hq+7eerQi584HsL3ggqpyU6frU5wx6n86wKVLRgcyWkg0uOcIK/M9NC/8Ebq3NGcepjcMhBHg+A9FclLoChEb6o8f9RlWM0RMy1zE5zo5jQ25huV7Prwva3LoncnliPFDL5hMYpsg9EBoIP/PDAvis/l9O62Teu3fy5dZHMYYxBbt80E4GovHdXv9xyagWuTT7rwDfh0lVLhswVusQFoTwdzk89SA0Y1Ml0qqdBvftR7Y2E2kOPZtEkclnWDE0ZNdCZYqy5VX58XgU3R+hkLreQMKE+slp7r1RcOZMkx3yrrC15mUNspStWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1248.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(55016002)(8676002)(33656002)(83380400001)(956004)(5660300002)(52116002)(8936002)(4326008)(86362001)(2906002)(6666004)(33716001)(9686003)(6496006)(54906003)(26005)(1076003)(66556008)(66574015)(186003)(16526019)(316002)(6916009)(30864003)(478600001)(66476007)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?H+DCuJa14i2s9kN+DGpb0lZSYfzA3BfpjCLfdyEqcal73Qtn5h2Yh9RWwd?=
 =?iso-8859-1?Q?zxUVcD4Lk4W7AK+qnTzRWKM+zdBe/B3zI62qT1JTe6xtwyESxetjKH5FMp?=
 =?iso-8859-1?Q?PNe5EF/fAoUB8L9pySuWDYUVQU7rSQ3ZyNMd2K/KH3/nchyoJoPyqUCOJp?=
 =?iso-8859-1?Q?6lx5Wn7FbxmpsmIXJX00e8JdW8J/6VO48X82HfXbMY+Csqjj//2PL+lbFi?=
 =?iso-8859-1?Q?DkwQtp1Y6q2q6J88jdS3Ck9pH5JAA42fTWb0jt0nRo5otnUrj31Ixx8rpm?=
 =?iso-8859-1?Q?pbvxnueJL8N3c53WCi7UiKXgtURywa1g553+jryq8UCPu5RFnPDXxqYW24?=
 =?iso-8859-1?Q?jDA9JrS8Jyan4bQZN+y/g2Hc9GztLhssc2Ntfw/qcTNl8yKnj3IkCPlweb?=
 =?iso-8859-1?Q?Zm5ZsH2lRTLnHFFW1k9iqsR1ORVMhGy4PyeIlpT9CS0ftO3XJP1ATgZP4P?=
 =?iso-8859-1?Q?hddeoKYFGUSkdMn/WCeqnS3Lt6TezZcXJp+1L/BkJZFUkrcs95ZPG06VWc?=
 =?iso-8859-1?Q?pIYWQ8defAyIQ65CRIpBOYjKmermscHsfMOAJ6AawI98BZKCwUaUAnERaG?=
 =?iso-8859-1?Q?Rn4GBiuXwpeFEio+52hLKuEgGuNQ5VcLk/8+IGLebwv8tv4r3jyNjnHVmI?=
 =?iso-8859-1?Q?JUjjz0ndTJeL0uXyb9VnRJ2li/LD6FBuSSqJuwXZ68s96N9CYL9ySmobxe?=
 =?iso-8859-1?Q?d0/tflbdG0AUMoKUOYMstPJndO/PKG4g4On0BLkXfRUpZAgHCdEWfpntD3?=
 =?iso-8859-1?Q?Q7cfv8eBsUJniIW2+qQfLSkLF7G2PU8kTtO0DoONi0a8lNGd6uzt+SD+Ku?=
 =?iso-8859-1?Q?Nf993jb5Smfg3uceyh12LRr9gmv+ZtafUbCeQUiE31M8SLkDeYxnZvG2sF?=
 =?iso-8859-1?Q?TKOwyfDaQfxjVmd/J4iqnrU10nj9yB1kGM3eWQWbL4RE7Jrir1cl6bpmaW?=
 =?iso-8859-1?Q?AzMr77K3uJQyQZc09gr35kOB/mXlDdN0HluL4Xdd6uO7CAEMo75JW9yZKZ?=
 =?iso-8859-1?Q?SysnmH3KpoXRTqHpxByO7zRwo7A6wT+FLPiWtD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 13:16:13.0011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: b0fe8a06-3823-4837-de8f-08d89b7b6fc4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2mqn4EFP/0OdQWEsfmOOgBf+YrmFao/SeNKEe9JNEjcN2J9orDr4YxzMITu646yFxQn8LxMAJnG3VcNInn0RQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4364
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 08, 2020 at 12:33:00AM +0800, Christian K=F6nig wrote:
> Based on an idea from Dave, but cleaned up a bit.
> =

> We had multiple fields for essentially the same thing.
> =

> Now bo->size is the original size of the BO in arbitrary
> units, usually bytes.
> =

> bo->mem.num_pages is the size in number of pages in the
> resource domain of bo->mem.mem_type.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>

Reviewed-by: Huang Rui <ray.huang@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c   |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c       |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |  4 +--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h     |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  6 ++--
>  drivers/gpu/drm/amd/amdgpu/mes_v10_1.c        |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_bo.c          | 10 +++---
>  drivers/gpu/drm/nouveau/nouveau_display.c     |  8 ++---
>  drivers/gpu/drm/nouveau/nouveau_prime.c       |  4 +--
>  drivers/gpu/drm/nouveau/nv17_fence.c          |  2 +-
>  drivers/gpu/drm/nouveau/nv50_fence.c          |  2 +-
>  drivers/gpu/drm/qxl/qxl_object.h              |  2 +-
>  drivers/gpu/drm/radeon/radeon_cs.c            |  3 +-
>  drivers/gpu/drm/radeon/radeon_object.c        | 13 ++++----
>  drivers/gpu/drm/radeon/radeon_object.h        |  4 +--
>  drivers/gpu/drm/radeon/radeon_prime.c         |  4 +--
>  drivers/gpu/drm/radeon/radeon_trace.h         |  2 +-
>  drivers/gpu/drm/radeon/radeon_ttm.c           |  2 +-
>  drivers/gpu/drm/ttm/ttm_bo.c                  | 33 ++++++-------------
>  drivers/gpu/drm/ttm/ttm_bo_util.c             | 11 +++----
>  drivers/gpu/drm/ttm/ttm_bo_vm.c               |  6 ++--
>  drivers/gpu/drm/ttm/ttm_tt.c                  |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_blit.c          |  4 +--
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c            |  6 ++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c       |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c       |  4 +--
>  drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c |  5 ++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c    |  8 ++---
>  drivers/gpu/drm/vmwgfx/vmwgfx_resource.c      |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_shader.c        |  3 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c          |  4 +--
>  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c       |  7 ++--
>  include/drm/ttm/ttm_bo_api.h                  |  6 ++--
>  include/drm/ttm/ttm_resource.h                |  1 -
>  36 files changed, 82 insertions(+), 100 deletions(-)
> =

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_dma_buf.c
> index e5919efca870..c4c93f19d273 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -269,7 +269,7 @@ static struct sg_table *amdgpu_dma_buf_map(struct dma=
_buf_attachment *attach,
>  	case TTM_PL_TT:
>  		sgt =3D drm_prime_pages_to_sg(obj->dev,
>  					    bo->tbo.ttm->pages,
> -					    bo->tbo.num_pages);
> +					    bo->tbo.ttm->num_pages);
>  		if (IS_ERR(sgt))
>  			return sgt;
>  =

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gmc.c
> index 056cb87d09ea..52bcd1b5582f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> @@ -121,7 +121,7 @@ uint64_t amdgpu_gmc_agp_addr(struct ttm_buffer_object=
 *bo)
>  {
>  	struct amdgpu_device *adev =3D amdgpu_ttm_adev(bo->bdev);
>  =

> -	if (bo->num_pages !=3D 1 || bo->ttm->caching =3D=3D ttm_cached)
> +	if (bo->ttm->num_pages !=3D 1 || bo->ttm->caching =3D=3D ttm_cached)
>  		return AMDGPU_BO_INVALID_OFFSET;
>  =

>  	if (bo->ttm->dma_address[0] + PAGE_SIZE >=3D adev->gmc.agp_size)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_object.c
> index c6c9723d3d8a..381ecc4788d5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -787,7 +787,7 @@ int amdgpu_bo_kmap(struct amdgpu_bo *bo, void **ptr)
>  	if (r < 0)
>  		return r;
>  =

> -	r =3D ttm_bo_kmap(&bo->tbo, 0, bo->tbo.num_pages, &bo->kmap);
> +	r =3D ttm_bo_kmap(&bo->tbo, 0, bo->tbo.mem.num_pages, &bo->kmap);
>  	if (r)
>  		return r;
>  =

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_object.h
> index ed47cbac4f75..176ed3615151 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> @@ -174,12 +174,12 @@ static inline void amdgpu_bo_unreserve(struct amdgp=
u_bo *bo)
>  =

>  static inline unsigned long amdgpu_bo_size(struct amdgpu_bo *bo)
>  {
> -	return bo->tbo.num_pages << PAGE_SHIFT;
> +	return bo->tbo.size;
>  }
>  =

>  static inline unsigned amdgpu_bo_ngpu_pages(struct amdgpu_bo *bo)
>  {
> -	return (bo->tbo.num_pages << PAGE_SHIFT) / AMDGPU_GPU_PAGE_SIZE;
> +	return bo->tbo.size / AMDGPU_GPU_PAGE_SIZE;
>  }
>  =

>  static inline unsigned amdgpu_bo_gpu_page_alignment(struct amdgpu_bo *bo)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_trace.h
> index ee9480d14cbc..20715ddbb746 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> @@ -127,7 +127,7 @@ TRACE_EVENT(amdgpu_bo_create,
>  =

>  	    TP_fast_assign(
>  			   __entry->bo =3D bo;
> -			   __entry->pages =3D bo->tbo.num_pages;
> +			   __entry->pages =3D bo->tbo.mem.num_pages;
>  			   __entry->type =3D bo->tbo.mem.mem_type;
>  			   __entry->prefer =3D bo->preferred_domains;
>  			   __entry->allow =3D bo->allowed_domains;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.c
> index ec93d4fdabbd..dfb4122b4ff3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -636,7 +636,7 @@ static int amdgpu_bo_move(struct ttm_buffer_object *b=
o, bool evict,
>  =

>  out:
>  	/* update statistics */
> -	atomic64_add((u64)bo->num_pages << PAGE_SHIFT, &adev->num_bytes_moved);
> +	atomic64_add(bo->size, &adev->num_bytes_moved);
>  	amdgpu_bo_move_notify(bo, evict, new_mem);
>  	return 0;
>  }
> @@ -2131,7 +2131,7 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>  			return r;
>  	}
>  =

> -	num_pages =3D bo->tbo.num_pages;
> +	num_pages =3D bo->tbo.mem.num_pages;
>  	mm_node =3D bo->tbo.mem.mm_node;
>  	num_loops =3D 0;
>  	while (num_pages) {
> @@ -2161,7 +2161,7 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>  		}
>  	}
>  =

> -	num_pages =3D bo->tbo.num_pages;
> +	num_pages =3D bo->tbo.mem.num_pages;
>  	mm_node =3D bo->tbo.mem.mm_node;
>  =

>  	while (num_pages) {
> diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c b/drivers/gpu/drm/amd=
/amdgpu/mes_v10_1.c
> index 985e454463e1..9c59f3b229fa 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
> @@ -554,7 +554,7 @@ static int mes_v10_1_allocate_eop_buf(struct amdgpu_d=
evice *adev)
>  		return r;
>  	}
>  =

> -	memset(eop, 0, adev->mes.eop_gpu_obj->tbo.mem.size);
> +	memset(eop, 0, adev->mes.eop_gpu_obj->tbo.size);
>  =

>  	amdgpu_bo_kunmap(adev->mes.eop_gpu_obj);
>  	amdgpu_bo_unreserve(adev->mes.eop_gpu_obj);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouve=
au/nouveau_bo.c
> index bc542ac4c4b6..f8c51291e9c4 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -473,10 +473,10 @@ nouveau_bo_pin(struct nouveau_bo *nvbo, uint32_t do=
main, bool contig)
>  =

>  	switch (bo->mem.mem_type) {
>  	case TTM_PL_VRAM:
> -		drm->gem.vram_available -=3D bo->mem.size;
> +		drm->gem.vram_available -=3D bo->size;
>  		break;
>  	case TTM_PL_TT:
> -		drm->gem.gart_available -=3D bo->mem.size;
> +		drm->gem.gart_available -=3D bo->size;
>  		break;
>  	default:
>  		break;
> @@ -504,10 +504,10 @@ nouveau_bo_unpin(struct nouveau_bo *nvbo)
>  	if (!nvbo->bo.pin_count) {
>  		switch (bo->mem.mem_type) {
>  		case TTM_PL_VRAM:
> -			drm->gem.vram_available +=3D bo->mem.size;
> +			drm->gem.vram_available +=3D bo->size;
>  			break;
>  		case TTM_PL_TT:
> -			drm->gem.gart_available +=3D bo->mem.size;
> +			drm->gem.gart_available +=3D bo->size;
>  			break;
>  		default:
>  			break;
> @@ -913,7 +913,7 @@ nouveau_bo_vm_bind(struct ttm_buffer_object *bo, stru=
ct ttm_resource *new_reg,
>  		return 0;
>  =

>  	if (drm->client.device.info.family >=3D NV_DEVICE_INFO_V0_CELSIUS) {
> -		*new_tile =3D nv10_bo_set_tiling(dev, offset, new_reg->size,
> +		*new_tile =3D nv10_bo_set_tiling(dev, offset, bo->size,
>  					       nvbo->mode, nvbo->zeta);
>  	}
>  =

> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/=
nouveau/nouveau_display.c
> index bceb48a2dfca..0f7804839b5f 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -286,11 +286,11 @@ nouveau_check_bl_size(struct nouveau_drm *drm, stru=
ct nouveau_bo *nvbo,
>  =

>  	bl_size =3D bw * bh * (1 << tile_mode) * gob_size;
>  =

> -	DRM_DEBUG_KMS("offset=3D%u stride=3D%u h=3D%u tile_mode=3D0x%02x bw=3D%=
u bh=3D%u gob_size=3D%u bl_size=3D%llu size=3D%lu\n",
> +	DRM_DEBUG_KMS("offset=3D%u stride=3D%u h=3D%u tile_mode=3D0x%02x bw=3D%=
u bh=3D%u gob_size=3D%u bl_size=3D%llu size=3D%Lu\n",
>  		      offset, stride, h, tile_mode, bw, bh, gob_size, bl_size,
> -		      nvbo->bo.mem.size);
> +		      nvbo->bo.size);
>  =

> -	if (bl_size + offset > nvbo->bo.mem.size)
> +	if (bl_size + offset > nvbo->bo.size)
>  		return -ERANGE;
>  =

>  	return 0;
> @@ -363,7 +363,7 @@ nouveau_framebuffer_new(struct drm_device *dev,
>  		} else {
>  			uint32_t size =3D mode_cmd->pitches[i] * height;
>  =

> -			if (size + mode_cmd->offsets[i] > nvbo->bo.mem.size)
> +			if (size + mode_cmd->offsets[i] > nvbo->bo.size)
>  				return -ERANGE;
>  		}
>  	}
> diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/no=
uveau/nouveau_prime.c
> index 2f16b5249283..347488685f74 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_prime.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
> @@ -30,9 +30,9 @@
>  struct sg_table *nouveau_gem_prime_get_sg_table(struct drm_gem_object *o=
bj)
>  {
>  	struct nouveau_bo *nvbo =3D nouveau_gem_object(obj);
> -	int npages =3D nvbo->bo.num_pages;
>  =

> -	return drm_prime_pages_to_sg(obj->dev, nvbo->bo.ttm->pages, npages);
> +	return drm_prime_pages_to_sg(obj->dev, nvbo->bo.ttm->pages,
> +				     nvbo->bo.ttm->num_pages);
>  }
>  =

>  struct drm_gem_object *nouveau_gem_prime_import_sg_table(struct drm_devi=
ce *dev,
> diff --git a/drivers/gpu/drm/nouveau/nv17_fence.c b/drivers/gpu/drm/nouve=
au/nv17_fence.c
> index 1253fdec712d..bf3247d627b1 100644
> --- a/drivers/gpu/drm/nouveau/nv17_fence.c
> +++ b/drivers/gpu/drm/nouveau/nv17_fence.c
> @@ -80,7 +80,7 @@ nv17_fence_context_new(struct nouveau_channel *chan)
>  	struct nv10_fence_chan *fctx;
>  	struct ttm_resource *reg =3D &priv->bo->bo.mem;
>  	u32 start =3D reg->start * PAGE_SIZE;
> -	u32 limit =3D start + reg->size - 1;
> +	u32 limit =3D start + priv->bo->bo.size - 1;
>  	int ret =3D 0;
>  =

>  	fctx =3D chan->fence =3D kzalloc(sizeof(*fctx), GFP_KERNEL);
> diff --git a/drivers/gpu/drm/nouveau/nv50_fence.c b/drivers/gpu/drm/nouve=
au/nv50_fence.c
> index 447238e3cbe7..1c89702fbba5 100644
> --- a/drivers/gpu/drm/nouveau/nv50_fence.c
> +++ b/drivers/gpu/drm/nouveau/nv50_fence.c
> @@ -39,7 +39,7 @@ nv50_fence_context_new(struct nouveau_channel *chan)
>  	struct nv10_fence_chan *fctx;
>  	struct ttm_resource *reg =3D &priv->bo->bo.mem;
>  	u32 start =3D reg->start * PAGE_SIZE;
> -	u32 limit =3D start + reg->size - 1;
> +	u32 limit =3D start + priv->bo->bo.size - 1;
>  	int ret;
>  =

>  	fctx =3D chan->fence =3D kzalloc(sizeof(*fctx), GFP_KERNEL);
> diff --git a/drivers/gpu/drm/qxl/qxl_object.h b/drivers/gpu/drm/qxl/qxl_o=
bject.h
> index ebf24c9d2bf2..be4d95ed8298 100644
> --- a/drivers/gpu/drm/qxl/qxl_object.h
> +++ b/drivers/gpu/drm/qxl/qxl_object.h
> @@ -50,7 +50,7 @@ static inline void qxl_bo_unreserve(struct qxl_bo *bo)
>  =

>  static inline unsigned long qxl_bo_size(struct qxl_bo *bo)
>  {
> -	return bo->tbo.num_pages << PAGE_SHIFT;
> +	return bo->tbo.size;
>  }
>  =

>  static inline u64 qxl_bo_mmap_offset(struct qxl_bo *bo)
> diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/=
radeon_cs.c
> index 21ce2f9502c0..4f35c32957be 100644
> --- a/drivers/gpu/drm/radeon/radeon_cs.c
> +++ b/drivers/gpu/drm/radeon/radeon_cs.c
> @@ -401,7 +401,8 @@ static int cmp_size_smaller_first(void *priv, struct =
list_head *a,
>  	struct radeon_bo_list *lb =3D list_entry(b, struct radeon_bo_list, tv.h=
ead);
>  =

>  	/* Sort A before B if A is smaller. */
> -	return (int)la->robj->tbo.num_pages - (int)lb->robj->tbo.num_pages;
> +	return (int)la->robj->tbo.mem.num_pages -
> +		(int)lb->robj->tbo.mem.num_pages;
>  }
>  =

>  /**
> diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/rad=
eon/radeon_object.c
> index ab81e35cb060..785292fc8cff 100644
> --- a/drivers/gpu/drm/radeon/radeon_object.c
> +++ b/drivers/gpu/drm/radeon/radeon_object.c
> @@ -54,20 +54,19 @@ static void radeon_update_memory_usage(struct radeon_=
bo *bo,
>  				       unsigned mem_type, int sign)
>  {
>  	struct radeon_device *rdev =3D bo->rdev;
> -	u64 size =3D (u64)bo->tbo.num_pages << PAGE_SHIFT;
>  =

>  	switch (mem_type) {
>  	case TTM_PL_TT:
>  		if (sign > 0)
> -			atomic64_add(size, &rdev->gtt_usage);
> +			atomic64_add(bo->tbo.size, &rdev->gtt_usage);
>  		else
> -			atomic64_sub(size, &rdev->gtt_usage);
> +			atomic64_sub(bo->tbo.size, &rdev->gtt_usage);
>  		break;
>  	case TTM_PL_VRAM:
>  		if (sign > 0)
> -			atomic64_add(size, &rdev->vram_usage);
> +			atomic64_add(bo->tbo.size, &rdev->vram_usage);
>  		else
> -			atomic64_sub(size, &rdev->vram_usage);
> +			atomic64_sub(bo->tbo.size, &rdev->vram_usage);
>  		break;
>  	}
>  }
> @@ -256,7 +255,7 @@ int radeon_bo_kmap(struct radeon_bo *bo, void **ptr)
>  		}
>  		return 0;
>  	}
> -	r =3D ttm_bo_kmap(&bo->tbo, 0, bo->tbo.num_pages, &bo->kmap);
> +	r =3D ttm_bo_kmap(&bo->tbo, 0, bo->tbo.mem.num_pages, &bo->kmap);
>  	if (r) {
>  		return r;
>  	}
> @@ -610,7 +609,7 @@ int radeon_bo_get_surface_reg(struct radeon_bo *bo)
>  out:
>  	radeon_set_surface_reg(rdev, i, bo->tiling_flags, bo->pitch,
>  			       bo->tbo.mem.start << PAGE_SHIFT,
> -			       bo->tbo.num_pages << PAGE_SHIFT);
> +			       bo->tbo.size);
>  	return 0;
>  }
>  =

> diff --git a/drivers/gpu/drm/radeon/radeon_object.h b/drivers/gpu/drm/rad=
eon/radeon_object.h
> index d606e9a935e3..63821d2d2c07 100644
> --- a/drivers/gpu/drm/radeon/radeon_object.h
> +++ b/drivers/gpu/drm/radeon/radeon_object.h
> @@ -109,12 +109,12 @@ static inline u64 radeon_bo_gpu_offset(struct radeo=
n_bo *bo)
>  =

>  static inline unsigned long radeon_bo_size(struct radeon_bo *bo)
>  {
> -	return bo->tbo.num_pages << PAGE_SHIFT;
> +	return bo->tbo.size;
>  }
>  =

>  static inline unsigned radeon_bo_ngpu_pages(struct radeon_bo *bo)
>  {
> -	return (bo->tbo.num_pages << PAGE_SHIFT) / RADEON_GPU_PAGE_SIZE;
> +	return bo->tbo.size / RADEON_GPU_PAGE_SIZE;
>  }
>  =

>  static inline unsigned radeon_bo_gpu_page_alignment(struct radeon_bo *bo)
> diff --git a/drivers/gpu/drm/radeon/radeon_prime.c b/drivers/gpu/drm/rade=
on/radeon_prime.c
> index 088d39a51c0d..0a09dbaba289 100644
> --- a/drivers/gpu/drm/radeon/radeon_prime.c
> +++ b/drivers/gpu/drm/radeon/radeon_prime.c
> @@ -34,9 +34,9 @@
>  struct sg_table *radeon_gem_prime_get_sg_table(struct drm_gem_object *ob=
j)
>  {
>  	struct radeon_bo *bo =3D gem_to_radeon_bo(obj);
> -	int npages =3D bo->tbo.num_pages;
>  =

> -	return drm_prime_pages_to_sg(obj->dev, bo->tbo.ttm->pages, npages);
> +	return drm_prime_pages_to_sg(obj->dev, bo->tbo.ttm->pages,
> +				     bo->tbo.ttm->num_pages);
>  }
>  =

>  struct drm_gem_object *radeon_gem_prime_import_sg_table(struct drm_devic=
e *dev,
> diff --git a/drivers/gpu/drm/radeon/radeon_trace.h b/drivers/gpu/drm/rade=
on/radeon_trace.h
> index c93f3ab3c4e3..1729cb9a95c5 100644
> --- a/drivers/gpu/drm/radeon/radeon_trace.h
> +++ b/drivers/gpu/drm/radeon/radeon_trace.h
> @@ -22,7 +22,7 @@ TRACE_EVENT(radeon_bo_create,
>  =

>  	    TP_fast_assign(
>  			   __entry->bo =3D bo;
> -			   __entry->pages =3D bo->tbo.num_pages;
> +			   __entry->pages =3D bo->tbo.mem.num_pages;
>  			   ),
>  	    TP_printk("bo=3D%p, pages=3D%u", __entry->bo, __entry->pages)
>  );
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon=
/radeon_ttm.c
> index a3432c6343ba..51ad5eccd844 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -274,7 +274,7 @@ static int radeon_bo_move(struct ttm_buffer_object *b=
o, bool evict,
>  =

>  out:
>  	/* update statistics */
> -	atomic64_add((u64)bo->num_pages << PAGE_SHIFT, &rdev->num_bytes_moved);
> +	atomic64_add(bo->size, &rdev->num_bytes_moved);
>  	radeon_bo_move_notify(bo, evict, new_mem);
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 02cc5d247c0d..1cb326056e92 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -72,9 +72,9 @@ static void ttm_bo_mem_space_debug(struct ttm_buffer_ob=
ject *bo,
>  	struct ttm_resource_manager *man;
>  	int i, mem_type;
>  =

> -	drm_printf(&p, "No space for %p (%lu pages, %luK, %luM)\n",
> -		   bo, bo->mem.num_pages, bo->mem.size >> 10,
> -		   bo->mem.size >> 20);
> +	drm_printf(&p, "No space for %p (%lu pages, %LuK, %LuM)\n",
> +		   bo, bo->mem.num_pages, bo->size >> 10,
> +		   bo->size >> 20);
>  	for (i =3D 0; i < placement->num_placement; i++) {
>  		mem_type =3D placement->placement[i].mem_type;
>  		drm_printf(&p, "  placement[%d]=3D0x%08X (%d)\n",
> @@ -268,7 +268,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_o=
bject *bo,
>  		goto out_err;
>  	}
>  =

> -	ctx->bytes_moved +=3D bo->num_pages << PAGE_SHIFT;
> +	ctx->bytes_moved +=3D bo->size;
>  	return 0;
>  =

>  out_err:
> @@ -985,8 +985,7 @@ static int ttm_bo_move_buffer(struct ttm_buffer_objec=
t *bo,
>  =

>  	memset(&hop, 0, sizeof(hop));
>  =

> -	mem.num_pages =3D bo->num_pages;
> -	mem.size =3D mem.num_pages << PAGE_SHIFT;
> +	mem.num_pages =3D PAGE_ALIGN(bo->size) >> PAGE_SHIFT;
>  	mem.page_alignment =3D bo->mem.page_alignment;
>  	mem.bus.offset =3D 0;
>  	mem.bus.addr =3D NULL;
> @@ -1102,7 +1101,7 @@ EXPORT_SYMBOL(ttm_bo_validate);
>  =

>  int ttm_bo_init_reserved(struct ttm_bo_device *bdev,
>  			 struct ttm_buffer_object *bo,
> -			 unsigned long size,
> +			 uint64_t size,
>  			 enum ttm_bo_type type,
>  			 struct ttm_placement *placement,
>  			 uint32_t page_alignment,
> @@ -1113,9 +1112,8 @@ int ttm_bo_init_reserved(struct ttm_bo_device *bdev,
>  			 void (*destroy) (struct ttm_buffer_object *))
>  {
>  	struct ttm_mem_global *mem_glob =3D &ttm_mem_glob;
> -	int ret =3D 0;
> -	unsigned long num_pages;
>  	bool locked;
> +	int ret =3D 0;
>  =

>  	ret =3D ttm_mem_global_alloc(mem_glob, acc_size, ctx);
>  	if (ret) {
> @@ -1127,16 +1125,6 @@ int ttm_bo_init_reserved(struct ttm_bo_device *bde=
v,
>  		return -ENOMEM;
>  	}
>  =

> -	num_pages =3D (size + PAGE_SIZE - 1) >> PAGE_SHIFT;
> -	if (num_pages =3D=3D 0) {
> -		pr_err("Illegal buffer object size\n");
> -		if (destroy)
> -			(*destroy)(bo);
> -		else
> -			kfree(bo);
> -		ttm_mem_global_free(mem_glob, acc_size);
> -		return -EINVAL;
> -	}
>  	bo->destroy =3D destroy ? destroy : ttm_bo_default_destroy;
>  =

>  	kref_init(&bo->kref);
> @@ -1145,10 +1133,9 @@ int ttm_bo_init_reserved(struct ttm_bo_device *bde=
v,
>  	INIT_LIST_HEAD(&bo->swap);
>  	bo->bdev =3D bdev;
>  	bo->type =3D type;
> -	bo->num_pages =3D num_pages;
> -	bo->mem.size =3D num_pages << PAGE_SHIFT;
> +	bo->size =3D size;
>  	bo->mem.mem_type =3D TTM_PL_SYSTEM;
> -	bo->mem.num_pages =3D bo->num_pages;
> +	bo->mem.num_pages =3D PAGE_ALIGN(size) >> PAGE_SHIFT;
>  	bo->mem.mm_node =3D NULL;
>  	bo->mem.page_alignment =3D page_alignment;
>  	bo->mem.bus.offset =3D 0;
> @@ -1210,7 +1197,7 @@ EXPORT_SYMBOL(ttm_bo_init_reserved);
>  =

>  int ttm_bo_init(struct ttm_bo_device *bdev,
>  		struct ttm_buffer_object *bo,
> -		unsigned long size,
> +		uint64_t size,
>  		enum ttm_bo_type type,
>  		struct ttm_placement *placement,
>  		uint32_t page_alignment,
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_=
bo_util.c
> index 5bbc1339d28e..6758e5115ae5 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -431,9 +431,9 @@ int ttm_bo_kmap(struct ttm_buffer_object *bo,
>  =

>  	map->virtual =3D NULL;
>  	map->bo =3D bo;
> -	if (num_pages > bo->num_pages)
> +	if (num_pages > bo->mem.num_pages)
>  		return -EINVAL;
> -	if (start_page > bo->num_pages)
> +	if ((start_page + num_pages) > bo->mem.num_pages)
>  		return -EINVAL;
>  =

>  	ret =3D ttm_mem_io_reserve(bo->bdev, &bo->mem);
> @@ -485,14 +485,13 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struc=
t dma_buf_map *map)
>  =

>  	if (mem->bus.is_iomem) {
>  		void __iomem *vaddr_iomem;
> -		size_t size =3D bo->num_pages << PAGE_SHIFT;
>  =

>  		if (mem->bus.addr)
>  			vaddr_iomem =3D (void __iomem *)mem->bus.addr;
>  		else if (mem->bus.caching =3D=3D ttm_write_combined)
> -			vaddr_iomem =3D ioremap_wc(mem->bus.offset, size);
> +			vaddr_iomem =3D ioremap_wc(mem->bus.offset, bo->size);
>  		else
> -			vaddr_iomem =3D ioremap(mem->bus.offset, size);
> +			vaddr_iomem =3D ioremap(mem->bus.offset, bo->size);
>  =

>  		if (!vaddr_iomem)
>  			return -ENOMEM;
> @@ -517,7 +516,7 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct =
dma_buf_map *map)
>  		 * or to make the buffer object look contiguous.
>  		 */
>  		prot =3D ttm_io_prot(bo, mem, PAGE_KERNEL);
> -		vaddr =3D vmap(ttm->pages, bo->num_pages, 0, prot);
> +		vaddr =3D vmap(ttm->pages, ttm->num_pages, 0, prot);
>  		if (!vaddr)
>  			return -ENOMEM;
>  =

> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo=
_vm.c
> index 144a4940b6b6..6dc96cf66744 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -198,7 +198,7 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct vm_fau=
lt *vmf,
>  =

>  	/* Fault should not cross bo boundary. */
>  	page_offset &=3D ~(fault_page_size - 1);
> -	if (page_offset + fault_page_size > bo->num_pages)
> +	if (page_offset + fault_page_size > bo->mem.num_pages)
>  		goto out_fallback;
>  =

>  	if (bo->mem.bus.is_iomem)
> @@ -306,7 +306,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *=
vmf,
>  	page_last =3D vma_pages(vma) + vma->vm_pgoff -
>  		drm_vma_node_start(&bo->base.vma_node);
>  =

> -	if (unlikely(page_offset >=3D bo->num_pages))
> +	if (unlikely(page_offset >=3D bo->mem.num_pages))
>  		return VM_FAULT_SIGBUS;
>  =

>  	prot =3D ttm_io_prot(bo, &bo->mem, prot);
> @@ -469,7 +469,7 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsi=
gned long addr,
>  		 << PAGE_SHIFT);
>  	int ret;
>  =

> -	if (len < 1 || (offset + len) >> PAGE_SHIFT > bo->num_pages)
> +	if (len < 1 || (offset + len) >> PAGE_SHIFT > bo->mem.num_pages)
>  		return -EIO;
>  =

>  	ret =3D ttm_bo_reserve(bo, true, false, NULL);
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 77ba784425dd..c5c973fa0736 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -129,7 +129,7 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
>  			       uint32_t page_flags,
>  			       enum ttm_caching caching)
>  {
> -	ttm->num_pages =3D bo->num_pages;
> +	ttm->num_pages =3D PAGE_ALIGN(bo->size) >> PAGE_SHIFT;
>  	ttm->caching =3D ttm_cached;
>  	ttm->page_flags =3D page_flags;
>  	ttm->dma_address =3D NULL;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c b/drivers/gpu/drm/vmwgf=
x/vmwgfx_blit.c
> index f21881e087db..9f2779ddcf08 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> @@ -482,8 +482,8 @@ int vmw_bo_cpu_blit(struct ttm_buffer_object *dst,
>  	d.src_addr =3D NULL;
>  	d.dst_pages =3D dst->ttm->pages;
>  	d.src_pages =3D src->ttm->pages;
> -	d.dst_num_pages =3D dst->num_pages;
> -	d.src_num_pages =3D src->num_pages;
> +	d.dst_num_pages =3D dst->mem.num_pages;
> +	d.src_num_pages =3D src->mem.num_pages;
>  	d.dst_prot =3D ttm_io_prot(dst, &dst->mem, PAGE_KERNEL);
>  	d.src_prot =3D ttm_io_prot(src, &src->mem, PAGE_KERNEL);
>  	d.diff =3D diff;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/=
vmwgfx_bo.c
> index 263d76ae43f0..63dbc44eebe0 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> @@ -223,7 +223,7 @@ int vmw_bo_pin_in_start_of_vram(struct vmw_private *d=
ev_priv,
>  	uint32_t new_flags;
>  =

>  	place =3D vmw_vram_placement.placement[0];
> -	place.lpfn =3D bo->num_pages;
> +	place.lpfn =3D bo->mem.num_pages;
>  	placement.num_placement =3D 1;
>  	placement.placement =3D &place;
>  	placement.num_busy_placement =3D 1;
> @@ -244,7 +244,7 @@ int vmw_bo_pin_in_start_of_vram(struct vmw_private *d=
ev_priv,
>  	 * that situation.
>  	 */
>  	if (bo->mem.mem_type =3D=3D TTM_PL_VRAM &&
> -	    bo->mem.start < bo->num_pages &&
> +	    bo->mem.start < bo->mem.num_pages &&
>  	    bo->mem.start > 0 &&
>  	    buf->base.pin_count =3D=3D 0) {
>  		ctx.interruptible =3D false;
> @@ -391,7 +391,7 @@ void *vmw_bo_map_and_cache(struct vmw_buffer_object *=
vbo)
>  	if (virtual)
>  		return virtual;
>  =

> -	ret =3D ttm_bo_kmap(bo, 0, bo->num_pages, &vbo->map);
> +	ret =3D ttm_bo_kmap(bo, 0, bo->mem.num_pages, &vbo->map);
>  	if (ret)
>  		DRM_ERROR("Buffer object map failed: %d.\n", ret);
>  =

> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c b/drivers/gpu/drm/vm=
wgfx/vmwgfx_cotable.c
> index 984d8884357d..a077e420d2ff 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
> @@ -430,7 +430,7 @@ static int vmw_cotable_resize(struct vmw_resource *re=
s, size_t new_size)
>  	 * Do a page by page copy of COTables. This eliminates slow vmap()s.
>  	 * This should really be a TTM utility.
>  	 */
> -	for (i =3D 0; i < old_bo->num_pages; ++i) {
> +	for (i =3D 0; i < old_bo->mem.num_pages; ++i) {
>  		bool dummy;
>  =

>  		ret =3D ttm_bo_kmap(old_bo, i, 1, &old_map);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vm=
wgfx/vmwgfx_execbuf.c
> index e67e2e8f6e6f..72bd6d941d24 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> @@ -1042,7 +1042,7 @@ static int vmw_query_bo_switch_prepare(struct vmw_p=
rivate *dev_priv,
>  =

>  	if (unlikely(new_query_bo !=3D sw_context->cur_query_bo)) {
>  =

> -		if (unlikely(new_query_bo->base.num_pages > 4)) {
> +		if (unlikely(new_query_bo->base.mem.num_pages > 4)) {
>  			VMW_DEBUG_USER("Query buffer too large.\n");
>  			return -EINVAL;
>  		}
> @@ -1541,7 +1541,7 @@ static int vmw_cmd_dma(struct vmw_private *dev_priv,
>  		return ret;
>  =

>  	/* Make sure DMA doesn't cross BO boundaries. */
> -	bo_size =3D vmw_bo->base.num_pages * PAGE_SIZE;
> +	bo_size =3D vmw_bo->base.size;
>  	if (unlikely(cmd->body.guest.ptr.offset > bo_size)) {
>  		VMW_DEBUG_USER("Invalid DMA offset.\n");
>  		return -EINVAL;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/=
drm/vmwgfx/vmwgfx_gmrid_manager.c
> index 8fe26e32f920..1774960d1b89 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> @@ -64,20 +64,19 @@ static int vmw_gmrid_man_get_node(struct ttm_resource=
_manager *man,
>  	spin_lock(&gman->lock);
>  =

>  	if (gman->max_gmr_pages > 0) {
> -		gman->used_gmr_pages +=3D bo->num_pages;
> +		gman->used_gmr_pages +=3D mem->num_pages;
>  		if (unlikely(gman->used_gmr_pages > gman->max_gmr_pages))
>  			goto nospace;
>  	}
>  =

>  	mem->mm_node =3D gman;
>  	mem->start =3D id;
> -	mem->num_pages =3D bo->num_pages;
>  =

>  	spin_unlock(&gman->lock);
>  	return 0;
>  =

>  nospace:
> -	gman->used_gmr_pages -=3D bo->num_pages;
> +	gman->used_gmr_pages -=3D mem->num_pages;
>  	spin_unlock(&gman->lock);
>  	ida_free(&gman->gmr_ida, id);
>  	return -ENOSPC;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_kms.c
> index bc67f2b930e1..347aff6201f6 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -1220,7 +1220,7 @@ static int vmw_kms_new_framebuffer_bo(struct vmw_pr=
ivate *dev_priv,
>  	int ret;
>  =

>  	requested_size =3D mode_cmd->height * mode_cmd->pitches[0];
> -	if (unlikely(requested_size > bo->base.num_pages * PAGE_SIZE)) {
> +	if (unlikely(requested_size > bo->base.size)) {
>  		DRM_ERROR("Screen buffer object size is too small "
>  			  "for requested mode.\n");
>  		return -EINVAL;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c b/drivers/gpu/drm=
/vmwgfx/vmwgfx_page_dirty.c
> index 0b76b3d17d4c..0a900afc66ff 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
> @@ -232,7 +232,7 @@ void vmw_bo_dirty_unmap(struct vmw_buffer_object *vbo,
>  int vmw_bo_dirty_add(struct vmw_buffer_object *vbo)
>  {
>  	struct vmw_bo_dirty *dirty =3D vbo->dirty;
> -	pgoff_t num_pages =3D vbo->base.num_pages;
> +	pgoff_t num_pages =3D vbo->base.mem.num_pages;
>  	size_t size, acc_size;
>  	int ret;
>  	static struct ttm_operation_ctx ctx =3D {
> @@ -413,7 +413,7 @@ vm_fault_t vmw_bo_vm_mkwrite(struct vm_fault *vmf)
>  		return ret;
>  =

>  	page_offset =3D vmf->pgoff - drm_vma_node_start(&bo->base.vma_node);
> -	if (unlikely(page_offset >=3D bo->num_pages)) {
> +	if (unlikely(page_offset >=3D bo->mem.num_pages)) {
>  		ret =3D VM_FAULT_SIGBUS;
>  		goto out_unlock;
>  	}
> @@ -456,7 +456,7 @@ vm_fault_t vmw_bo_vm_fault(struct vm_fault *vmf)
>  =

>  		page_offset =3D vmf->pgoff -
>  			drm_vma_node_start(&bo->base.vma_node);
> -		if (page_offset >=3D bo->num_pages ||
> +		if (page_offset >=3D bo->mem.num_pages ||
>  		    vmw_resources_clean(vbo, page_offset,
>  					page_offset + PAGE_SIZE,
>  					&allowed_prefault)) {
> @@ -531,7 +531,7 @@ vm_fault_t vmw_bo_vm_huge_fault(struct vm_fault *vmf,
>  =

>  		page_offset =3D vmf->pgoff -
>  			drm_vma_node_start(&bo->base.vma_node);
> -		if (page_offset >=3D bo->num_pages ||
> +		if (page_offset >=3D bo->mem.num_pages ||
>  		    vmw_resources_clean(vbo, page_offset,
>  					page_offset + PAGE_SIZE,
>  					&allowed_prefault)) {
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/v=
mwgfx/vmwgfx_resource.c
> index 00b535831a7a..84ed8376cd81 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> @@ -360,7 +360,7 @@ static int vmw_resource_buf_alloc(struct vmw_resource=
 *res,
>  	int ret;
>  =

>  	if (likely(res->backup)) {
> -		BUG_ON(res->backup->base.num_pages * PAGE_SIZE < size);
> +		BUG_ON(res->backup->base.size < size);
>  		return 0;
>  	}
>  =

> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c b/drivers/gpu/drm/vmw=
gfx/vmwgfx_shader.c
> index f328aa5839a2..c7220a770bc5 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
> @@ -856,8 +856,7 @@ static int vmw_shader_define(struct drm_device *dev, =
struct drm_file *file_priv,
>  			return ret;
>  		}
>  =

> -		if ((u64)buffer->base.num_pages * PAGE_SIZE <
> -		    (u64)size + (u64)offset) {
> +		if ((u64)buffer->base.size < (u64)size + (u64)offset) {
>  			VMW_DEBUG_USER("Illegal buffer- or shader size.\n");
>  			ret =3D -EINVAL;
>  			goto out_bad_arg;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgf=
x/vmwgfx_stdu.c
> index 5b04ec047ef3..362a127b24bb 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> @@ -512,7 +512,7 @@ static void vmw_stdu_bo_fifo_commit(struct vmw_kms_di=
rty *dirty)
>  	cmd->body.host.mipmap =3D 0;
>  	cmd->body.transfer =3D ddirty->transfer;
>  	suffix->suffixSize =3D sizeof(*suffix);
> -	suffix->maximumOffset =3D ddirty->buf->base.num_pages * PAGE_SIZE;
> +	suffix->maximumOffset =3D ddirty->buf->base.size;
>  =

>  	if (ddirty->transfer =3D=3D SVGA3D_WRITE_HOST_VRAM) {
>  		blit_size +=3D sizeof(struct vmw_stdu_update);
> @@ -1238,7 +1238,7 @@ static uint32_t vmw_stdu_bo_populate_update(struct =
vmw_du_update_plane  *update,
>  	vfbbo =3D container_of(update->vfb, typeof(*vfbbo), base);
>  =

>  	suffix->suffixSize =3D sizeof(*suffix);
> -	suffix->maximumOffset =3D vfbbo->buffer->base.num_pages * PAGE_SIZE;
> +	suffix->maximumOffset =3D vfbbo->buffer->base.size;
>  =

>  	vmw_stdu_populate_update(&suffix[1], stdu->base.unit, bb->x1, bb->x2,
>  				 bb->y1, bb->y2);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vm=
wgfx/vmwgfx_surface.c
> index 3914bfee0533..6a02bad8416b 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> @@ -1550,8 +1550,7 @@ vmw_gb_surface_define_internal(struct drm_device *d=
ev,
>  					 &res->backup,
>  					 &user_srf->backup_base);
>  		if (ret =3D=3D 0) {
> -			if (res->backup->base.num_pages * PAGE_SIZE <
> -			    res->backup_size) {
> +			if (res->backup->base.size < res->backup_size) {
>  				VMW_DEBUG_USER("Surface backup buffer too small.\n");
>  				vmw_bo_unreference(&res->backup);
>  				ret =3D -EINVAL;
> @@ -1614,7 +1613,7 @@ vmw_gb_surface_define_internal(struct drm_device *d=
ev,
>  	if (res->backup) {
>  		rep->buffer_map_handle =3D
>  			drm_vma_node_offset_addr(&res->backup->base.base.vma_node);
> -		rep->buffer_size =3D res->backup->base.num_pages * PAGE_SIZE;
> +		rep->buffer_size =3D res->backup->base.size;
>  		rep->buffer_handle =3D backup_handle;
>  	} else {
>  		rep->buffer_map_handle =3D 0;
> @@ -1692,7 +1691,7 @@ vmw_gb_surface_reference_internal(struct drm_device=
 *dev,
>  	rep->crep.buffer_handle =3D backup_handle;
>  	rep->crep.buffer_map_handle =3D
>  		drm_vma_node_offset_addr(&srf->res.backup->base.base.vma_node);
> -	rep->crep.buffer_size =3D srf->res.backup->base.num_pages * PAGE_SIZE;
> +	rep->crep.buffer_size =3D srf->res.backup->base.size;
>  =

>  	rep->creq.version =3D drm_vmw_gb_surface_v1;
>  	rep->creq.svga3d_flags_upper_32_bits =3D
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index 79b9367e0ffd..03675ce7ab3c 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -125,7 +125,7 @@ struct ttm_buffer_object {
>  	struct ttm_bo_device *bdev;
>  	enum ttm_bo_type type;
>  	void (*destroy) (struct ttm_buffer_object *);
> -	unsigned long num_pages;
> +	uint64_t size;
>  	size_t acc_size;
>  =

>  	/**
> @@ -397,7 +397,7 @@ size_t ttm_bo_dma_acc_size(struct ttm_bo_device *bdev,
>  =

>  int ttm_bo_init_reserved(struct ttm_bo_device *bdev,
>  			 struct ttm_buffer_object *bo,
> -			 unsigned long size,
> +			 uint64_t size,
>  			 enum ttm_bo_type type,
>  			 struct ttm_placement *placement,
>  			 uint32_t page_alignment,
> @@ -445,7 +445,7 @@ int ttm_bo_init_reserved(struct ttm_bo_device *bdev,
>   * -ERESTARTSYS: Interrupted by signal while sleeping waiting for resour=
ces.
>   */
>  int ttm_bo_init(struct ttm_bo_device *bdev, struct ttm_buffer_object *bo,
> -		unsigned long size, enum ttm_bo_type type,
> +		uint64_t size, enum ttm_bo_type type,
>  		struct ttm_placement *placement,
>  		uint32_t page_alignment, bool interrubtible, size_t acc_size,
>  		struct sg_table *sg, struct dma_resv *resv,
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resourc=
e.h
> index f48a70d39ac5..ad6da99770e9 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -171,7 +171,6 @@ struct ttm_bus_placement {
>  struct ttm_resource {
>  	void *mm_node;
>  	unsigned long start;
> -	unsigned long size;
>  	unsigned long num_pages;
>  	uint32_t page_alignment;
>  	uint32_t mem_type;
> -- =

> 2.25.1
> =

> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
