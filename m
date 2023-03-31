Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C74136D29DF
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 23:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5360610F30E;
	Fri, 31 Mar 2023 21:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79AF10E237;
 Fri, 31 Mar 2023 21:13:53 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-17aa62d0a4aso24542979fac.4; 
 Fri, 31 Mar 2023 14:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680297233;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uye+k/aXPz8CoYAbk4kJpVn7VzK4SSKRz7XjPay2Tx8=;
 b=i2A52kIwgu/IsJeEd0fhDyNYB0bMURs4pE0LCb2MZC/xlpPNvcQKCo3igln+ujjFgj
 OQ8BGPeyTmaPw9u+HpgOtjWajxrIavjTWwr7YKXcszBwRA2hP2PpHIzz4xJ2AssQi5k7
 dRfahBR2fWFVNUMR/MX8SqSQTs48QKw02JWPanGo98c8QxoCPs6yU9qvFBkjq9Ekt/81
 BSPHqMEn3YnEiEUyGBBGGwSHveNr+eAnJLQ2N3jXJZHBS4KzB+aANHfkrzFJmh+OlsWq
 85RzR1Nc2wPTC6iqB1hXR01Tk6vvu4GwlEO0GuivlJSk1l1PdDrgDlsYiOIvo36F5/q3
 BXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680297233;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uye+k/aXPz8CoYAbk4kJpVn7VzK4SSKRz7XjPay2Tx8=;
 b=xXwS2VzW+G1Q3qL3r1ezxfzo2CXCSu+6ery+u1jWMVB0/d2l94vvKe+l3pm9QYpRBe
 Ypp9mkeJBpQWLrvud3WuSmup7VH1DZRYZ6ABH6ObfmbHJAzyCPa8N8bOdwcSsclXOxuQ
 GluqilR0ymrMZ7A6HLjmknz9wNcW0aOaN0NWrwUR01htPXoUooX0QiyZADBwMup4X22w
 O6Lb0B51uufwbHdElk840NR12s4SoJg6clzlr5U7sitrG3syGvyZarzn7eAy/xpSBKra
 kMcBaEV+HV0bp/SMobgnJ6H2LwgsrwYvi3YXXKS0ktFg1Bc91M8tQ8Io/ehydIabimRH
 Gvog==
X-Gm-Message-State: AAQBX9eFYttLYb19PpGOLWsZ2c2cOCbMCDcrEe70stDi43ryE5M+MqBT
 gW2HRS4XJatoJ9mNN55XC8jN9mV4YR7Wv5XLMUxP39X4
X-Google-Smtp-Source: AKy350bVjoT9F7xh65tK7zy2O+0Vb3MfXqzUvobk+WrArtzGD/JygqMd+uGc9WQuQsiYShN1U5pnmEFa3hpHhQV9clA=
X-Received: by 2002:a05:6871:4910:b0:177:b992:fee7 with SMTP id
 tw16-20020a056871491000b00177b992fee7mr7474472oab.3.1680297233071; Fri, 31
 Mar 2023 14:13:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230330195043.1136322-1-alexander.deucher@amd.com>
 <aeb5c27e-121d-f666-249c-898e98d5ec2f@gmail.com>
 <CADnq5_MSAWnK18rbST28iJKTDM2Tr58wL7ak2CGoeJ845HTOqg@mail.gmail.com>
 <dd4944ef-ef9b-4070-8012-543a78bb9e58@amd.com>
In-Reply-To: <dd4944ef-ef9b-4070-8012-543a78bb9e58@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 31 Mar 2023 17:13:42 -0400
Message-ID: <CADnq5_Own3UvYg3oH7dFuMRqi6qO+e+=ZxKJeRi=-kXu+L0hGg@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: add NUMA node id to the pool
To: Felix Kuehling <felix.kuehling@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Graham Sider <graham.sider@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 31, 2023 at 4:02=E2=80=AFPM Felix Kuehling <felix.kuehling@amd.=
com> wrote:
>
> There is a subsequent patch where amdgpu directly calls ttm_pool_init to
> create pools per NUMA node. That will depend on the updated function
> signature.

Then we probably want to take this through amdgpu then.

Alex

>
> Regards,
>    Felix
>
>
> On 2023-03-31 15:17, Alex Deucher wrote:
> > On Fri, Mar 31, 2023 at 2:54=E2=80=AFAM Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> >> Should I push this to drm-misc-next or do we take it through
> >> amd-staging-drm-next?
> > I think either way is fine.  We can carry it internally as needed for
> > testing if you want to commit it to drm-misc-next.  I don't think
> > there are any direct code dependencies, but you or Rajneesh can
> > correct me if I'm wrong.
> >
> > Alex
> >
> >> Christian.
> >>
> >> Am 30.03.23 um 21:50 schrieb Alex Deucher:
> >>> From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
> >>>
> >>> This allows backing ttm_tt structure with pages from different NUMA
> >>> pools.
> >>>
> >>> Tested-by: Graham Sider <graham.sider@amd.com>
> >>> Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
> >>> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
> >>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> >>> ---
> >>>    drivers/gpu/drm/ttm/ttm_device.c |  2 +-
> >>>    drivers/gpu/drm/ttm/ttm_pool.c   | 13 ++++++++-----
> >>>    include/drm/ttm/ttm_pool.h       |  4 +++-
> >>>    3 files changed, 12 insertions(+), 7 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/t=
tm_device.c
> >>> index e7147e304637..4a8164a5320f 100644
> >>> --- a/drivers/gpu/drm/ttm/ttm_device.c
> >>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> >>> @@ -218,7 +218,7 @@ int ttm_device_init(struct ttm_device *bdev, stru=
ct ttm_device_funcs *funcs,
> >>>        bdev->funcs =3D funcs;
> >>>
> >>>        ttm_sys_man_init(bdev);
> >>> -     ttm_pool_init(&bdev->pool, dev, use_dma_alloc, use_dma32);
> >>> +     ttm_pool_init(&bdev->pool, dev, NUMA_NO_NODE, use_dma_alloc, us=
e_dma32);
> >>>
> >>>        bdev->vma_manager =3D vma_manager;
> >>>        INIT_DELAYED_WORK(&bdev->wq, ttm_device_delayed_workqueue);
> >>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm=
_pool.c
> >>> index 9f6764bf3b15..1068a41cded1 100644
> >>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> >>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> >>> @@ -92,7 +92,7 @@ static struct page *ttm_pool_alloc_page(struct ttm_=
pool *pool, gfp_t gfp_flags,
> >>>                        __GFP_KSWAPD_RECLAIM;
> >>>
> >>>        if (!pool->use_dma_alloc) {
> >>> -             p =3D alloc_pages(gfp_flags, order);
> >>> +             p =3D alloc_pages_node(pool->nid, gfp_flags, order);
> >>>                if (p)
> >>>                        p->private =3D order;
> >>>                return p;
> >>> @@ -286,7 +286,7 @@ static struct ttm_pool_type *ttm_pool_select_type=
(struct ttm_pool *pool,
> >>>                                                  enum ttm_caching cac=
hing,
> >>>                                                  unsigned int order)
> >>>    {
> >>> -     if (pool->use_dma_alloc)
> >>> +     if (pool->use_dma_alloc || pool->nid !=3D NUMA_NO_NODE)
> >>>                return &pool->caching[caching].orders[order];
> >>>
> >>>    #ifdef CONFIG_X86
> >>> @@ -523,29 +523,32 @@ EXPORT_SYMBOL(ttm_pool_free);
> >>>     *
> >>>     * @pool: the pool to initialize
> >>>     * @dev: device for DMA allocations and mappings
> >>> + * @nid: NUMA node to use for allocations
> >>>     * @use_dma_alloc: true if coherent DMA alloc should be used
> >>>     * @use_dma32: true if GFP_DMA32 should be used
> >>>     *
> >>>     * Initialize the pool and its pool types.
> >>>     */
> >>>    void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
> >>> -                bool use_dma_alloc, bool use_dma32)
> >>> +                int nid, bool use_dma_alloc, bool use_dma32)
> >>>    {
> >>>        unsigned int i, j;
> >>>
> >>>        WARN_ON(!dev && use_dma_alloc);
> >>>
> >>>        pool->dev =3D dev;
> >>> +     pool->nid =3D nid;
> >>>        pool->use_dma_alloc =3D use_dma_alloc;
> >>>        pool->use_dma32 =3D use_dma32;
> >>>
> >>> -     if (use_dma_alloc) {
> >>> +     if (use_dma_alloc || nid !=3D NUMA_NO_NODE) {
> >>>                for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i)
> >>>                        for (j =3D 0; j < MAX_ORDER; ++j)
> >>>                                ttm_pool_type_init(&pool->caching[i].o=
rders[j],
> >>>                                                   pool, i, j);
> >>>        }
> >>>    }
> >>> +EXPORT_SYMBOL(ttm_pool_init);
> >>>
> >>>    /**
> >>>     * ttm_pool_fini - Cleanup a pool
> >>> @@ -559,7 +562,7 @@ void ttm_pool_fini(struct ttm_pool *pool)
> >>>    {
> >>>        unsigned int i, j;
> >>>
> >>> -     if (pool->use_dma_alloc) {
> >>> +     if (pool->use_dma_alloc || pool->nid !=3D NUMA_NO_NODE) {
> >>>                for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i)
> >>>                        for (j =3D 0; j < MAX_ORDER; ++j)
> >>>                                ttm_pool_type_fini(&pool->caching[i].o=
rders[j]);
> >>> diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
> >>> index ef09b23d29e3..23bd8be6d4f8 100644
> >>> --- a/include/drm/ttm/ttm_pool.h
> >>> +++ b/include/drm/ttm/ttm_pool.h
> >>> @@ -61,12 +61,14 @@ struct ttm_pool_type {
> >>>     * struct ttm_pool - Pool for all caching and orders
> >>>     *
> >>>     * @dev: the device we allocate pages for
> >>> + * @nid: which numa node to use
> >>>     * @use_dma_alloc: if coherent DMA allocations should be used
> >>>     * @use_dma32: if GFP_DMA32 should be used
> >>>     * @caching: pools for each caching/order
> >>>     */
> >>>    struct ttm_pool {
> >>>        struct device *dev;
> >>> +     int nid;
> >>>
> >>>        bool use_dma_alloc;
> >>>        bool use_dma32;
> >>> @@ -81,7 +83,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct tt=
m_tt *tt,
> >>>    void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt);
> >>>
> >>>    void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
> >>> -                bool use_dma_alloc, bool use_dma32);
> >>> +                int nid, bool use_dma_alloc, bool use_dma32);
> >>>    void ttm_pool_fini(struct ttm_pool *pool);
> >>>
> >>>    int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);
