Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF6218C37
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 16:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35B789C93;
	Thu,  9 May 2019 14:46:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730071.outbound.protection.outlook.com [40.107.73.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1784589C93
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2019 14:46:21 +0000 (UTC)
Received: from MN2PR12MB2910.namprd12.prod.outlook.com (20.179.81.219) by
 MN2PR12MB3645.namprd12.prod.outlook.com (20.178.243.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Thu, 9 May 2019 14:46:19 +0000
Received: from MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::9daa:c9ea:c94e:ae45]) by MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::9daa:c9ea:c94e:ae45%3]) with mapi id 15.20.1856.012; Thu, 9 May 2019
 14:46:19 +0000
From: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>, "Liang, Prike" <Prike.Liang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re:[PATCH 1/2] drm/ttm: fix busy memory to fail other user v7
Thread-Topic: Re:[PATCH 1/2] drm/ttm: fix busy memory to fail other user v7
Thread-Index: AQHVBMpnbAstBEaBSkWziB1RTU3QM6Zi3WsAgAAE7Yk=
Date: Thu, 9 May 2019 14:46:19 +0000
Message-ID: <-yd30ko-7yy2hg-rmre4orxyza7-xndome2qdx81-wtzk8a-eccw2rc52fs2-grqgt7bajdlk-5lgjxo-xu3otx-5m9i78-2xa184-z2lana96yogmoisk45t18dyy9462b5f86c1cg5hlpw-xorlqm-lev8gs.1557413178321@email.android.com>
References: <20190507114531.26089-1-david1.zhou@amd.com>,
 <e40420ea-3b25-a738-9c6e-4d251ed9e390@amd.com>
In-Reply-To: <e40420ea-3b25-a738-9c6e-4d251ed9e390@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [101.86.234.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d0ff51f2-41ca-4f87-26ba-08d6d48d1932
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3645; 
x-ms-traffictypediagnostic: MN2PR12MB3645:
x-microsoft-antispam-prvs: <MN2PR12MB3645276BA5FF4B0BCE363247B4330@MN2PR12MB3645.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(376002)(366004)(39860400002)(396003)(199004)(189003)(13464003)(66066001)(81166006)(8936002)(76176011)(6506007)(256004)(14444005)(99286004)(476003)(6436002)(486006)(446003)(11346002)(186003)(66946007)(2501003)(102836004)(91956017)(76116006)(73956011)(26005)(6116002)(5660300002)(66446008)(64756008)(66556008)(66476007)(8676002)(6486002)(81156014)(86362001)(68736007)(478600001)(72206003)(316002)(53936002)(9686003)(6512007)(54896002)(7736002)(110136005)(14454004)(25786009)(3846002)(2906002)(71190400001)(71200400001)(87826002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3645;
 H:MN2PR12MB2910.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jlOF3pj/AeKjDQscem8XNDEMjYfMebHH78XvVULlPS3p/Dw832CaD6olcrbId4USyzP/DlmQku5mUzdmGh5tIg7jfSpAyPp/FNmuK0BBGFzbZpS+z1beFNIYGvrutU8vdcSPxRvjKzzeEnrSaImf839mGsNQrPxiwD/C3ClnfXOomjhaft9dzS7nrkQFRVBD27iTO8xof+KLj8DwOBvia+KuUNEC0yh1Mx06uXsQ567leC935jD9/dREglwaoZQmf2FJkpsU0heUxNiCqQdqV4igESHK2FXeBT07U9d5BJkkE+pUnjc/70d94X3UTAb3N0J53fJA4zZNd6JbmXBlpFLDZlxqKdgZLqkCzqt1Yv2YiYUA5ZxeG/tQ5VUKEpPM7L17B9tXhETRyNp4rnnl91yudlX4Op46yA2Jfc+PlcQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0ff51f2-41ca-4f87-26ba-08d6d48d1932
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 14:46:19.6427 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3645
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80DujgdDF5GXhCeCH33hzq8T3mpJwSGZQY/SwDfhJAs=;
 b=a02ibXXw+Nzfx2k0rO/HJ3U+Jq4LNSmYNxoB3h8d6/Xalht9RhPzBS8gAjWznnUYIhh9mMPtHMWODs1aaHtrpVN8/xbksnyaCOYywuHje2GJh+cVC3jiRjYoCiWzmPrdupbY9KWNzbcssXftxALyj/2hLYM9wj+QJQtbbpZ0YIY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=David1.Zhou@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============1939802789=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1939802789==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_yd30ko7yy2hgrmre4orxyza7xndome2qdx81wtzk8aeccw2rc52fs2g_"

--_000_yd30ko7yy2hgrmre4orxyza7xndome2qdx81wtzk8aeccw2rc52fs2g_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I know that before, it will issue warning only when debug option is enabled=
. Removing that is ok to me.
I only help Prike draft your idea, and Prike is trying this patch on his si=
de. The latest feedback he gave me is first_bo is always null, code doesn't=
 run into busy path, which is very confusing me, and he said  he is debuggi=
ng  that.

-David


-------- Original Message --------
Subject: Re: [PATCH 1/2] drm/ttm: fix busy memory to fail other user v7
From: "Koenig, Christian"
To: "Zhou, David(ChunMing)" ,"Liang, Prike" ,dri-devel@lists.freedesktop.or=
g
CC:

I've foudn one more problem with this.

With lockdep enabled I get a warning because ttm_eu_reserve_buffers()
has called ww_acquire_done() on the ticket (which essentially means we
are done, no more locking with that ticket).

The simplest solution is probably to just remove the call to
ww_acquire_done() from ttm_eu_reserve_buffers().

Christian.

Am 07.05.19 um 13:45 schrieb Chunming Zhou:
> heavy gpu job could occupy memory long time, which lead other user fail t=
o get memory.
>
> basically pick up Christian idea:
>
> 1. Reserve the BO in DC using a ww_mutex ticket (trivial).
> 2. If we then run into this EBUSY condition in TTM check if the BO we nee=
d memory for (or rather the ww_mutex of its reservation object) has a ticke=
t assigned.
> 3. If we have a ticket we grab a reference to the first BO on the LRU, dr=
op the LRU lock and try to grab the reservation lock with the ticket.
> 4. If getting the reservation lock with the ticket succeeded we check if =
the BO is still the first one on the LRU in question (the BO could have mov=
ed).
> 5. If the BO is still the first one on the LRU in question we try to evic=
t it as we would evict any other BO.
> 6. If any of the "If's" above fail we just back off and return -EBUSY.
>
> v2: fix some minor check
> v3: address Christian v2 comments.
> v4: fix some missing
> v5: handle first_bo unlock and bo_get/put
> v6: abstract unified iterate function, and handle all possible usecase no=
t only pinned bo.
> v7: pass request bo->resv to ttm_bo_evict_first
>
> Change-Id: I21423fb922f885465f13833c41df1e134364a8e7
> Signed-off-by: Chunming Zhou <david1.zhou@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 111 +++++++++++++++++++++++++++++------
>   1 file changed, 94 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 8502b3ed2d88..f5e6328e4a57 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -766,11 +766,13 @@ EXPORT_SYMBOL(ttm_bo_eviction_valuable);
>    * b. Otherwise, trylock it.
>    */
>   static bool ttm_bo_evict_swapout_allowable(struct ttm_buffer_object *bo=
,
> -                     struct ttm_operation_ctx *ctx, bool *locked)
> +                     struct ttm_operation_ctx *ctx, bool *locked, bool *=
busy)
>   {
>        bool ret =3D false;
>
>        *locked =3D false;
> +     if (busy)
> +             *busy =3D false;
>        if (bo->resv =3D=3D ctx->resv) {
>                reservation_object_assert_held(bo->resv);
>                if (ctx->flags & TTM_OPT_FLAG_ALLOW_RES_EVICT
> @@ -779,35 +781,46 @@ static bool ttm_bo_evict_swapout_allowable(struct t=
tm_buffer_object *bo,
>        } else {
>                *locked =3D reservation_object_trylock(bo->resv);
>                ret =3D *locked;
> +             if (!ret && busy)
> +                     *busy =3D true;
>        }
>
>        return ret;
>   }
>
> -static int ttm_mem_evict_first(struct ttm_bo_device *bdev,
> -                            uint32_t mem_type,
> -                            const struct ttm_place *place,
> -                            struct ttm_operation_ctx *ctx)
> +static struct ttm_buffer_object*
> +ttm_mem_find_evitable_bo(struct ttm_bo_device *bdev,
> +                      struct ttm_mem_type_manager *man,
> +                      const struct ttm_place *place,
> +                      struct ttm_operation_ctx *ctx,
> +                      struct ttm_buffer_object **first_bo,
> +                      bool *locked)
>   {
> -     struct ttm_bo_global *glob =3D bdev->glob;
> -     struct ttm_mem_type_manager *man =3D &bdev->man[mem_type];
>        struct ttm_buffer_object *bo =3D NULL;
> -     bool locked =3D false;
> -     unsigned i;
> -     int ret;
> +     int i;
>
> -     spin_lock(&glob->lru_lock);
> +     if (first_bo)
> +             *first_bo =3D NULL;
>        for (i =3D 0; i < TTM_MAX_BO_PRIORITY; ++i) {
>                list_for_each_entry(bo, &man->lru[i], lru) {
> -                     if (!ttm_bo_evict_swapout_allowable(bo, ctx, &locke=
d))
> +                     bool busy =3D false;
> +
> +                     if (!ttm_bo_evict_swapout_allowable(bo, ctx, locked=
,
> +                                                         &busy)) {
> +                             if (first_bo && !(*first_bo) && busy) {
> +                                     ttm_bo_get(bo);
> +                                     *first_bo =3D bo;
> +                             }
>                                continue;
> +                     }
>
>                        if (place && !bdev->driver->eviction_valuable(bo,
>                                                                      plac=
e)) {
> -                             if (locked)
> +                             if (*locked)
>                                        reservation_object_unlock(bo->resv=
);
>                                continue;
>                        }
> +
>                        break;
>                }
>
> @@ -818,9 +831,67 @@ static int ttm_mem_evict_first(struct ttm_bo_device =
*bdev,
>                bo =3D NULL;
>        }
>
> +     return bo;
> +}
> +
> +static int ttm_mem_evict_first(struct ttm_bo_device *bdev,
> +                            uint32_t mem_type,
> +                            const struct ttm_place *place,
> +                            struct ttm_operation_ctx *ctx,
> +                            struct reservation_object *request_resv)
> +{
> +     struct ttm_bo_global *glob =3D bdev->glob;
> +     struct ttm_mem_type_manager *man =3D &bdev->man[mem_type];
> +     struct ttm_buffer_object *bo =3D NULL, *first_bo =3D NULL;
> +     bool locked =3D false;
> +     int ret;
> +
> +     spin_lock(&glob->lru_lock);
> +     bo =3D ttm_mem_find_evitable_bo(bdev, man, place, ctx, &first_bo,
> +                                   &locked);
>        if (!bo) {
> +             struct ttm_operation_ctx busy_ctx;
> +
>                spin_unlock(&glob->lru_lock);
> -             return -EBUSY;
> +             /* check if other user occupy memory too long time */
> +             if (!first_bo || !request_resv || !request_resv->lock.ctx) =
{
> +                     if (first_bo)
> +                             ttm_bo_put(first_bo);
> +                     return -EBUSY;
> +             }
> +             if (first_bo->resv =3D=3D request_resv) {
> +                     ttm_bo_put(first_bo);
> +                     return -EBUSY;
> +             }
> +             if (ctx->interruptible)
> +                     ret =3D ww_mutex_lock_interruptible(&first_bo->resv=
->lock,
> +                                                       request_resv->loc=
k.ctx);
> +             else
> +                     ret =3D ww_mutex_lock(&first_bo->resv->lock, reques=
t_resv->lock.ctx);
> +             if (ret) {
> +                     ttm_bo_put(first_bo);
> +                     return ret;
> +             }
> +             spin_lock(&glob->lru_lock);
> +             /* previous busy resv lock is held by above, idle now,
> +              * so let them evictable.
> +              */
> +             busy_ctx.interruptible =3D ctx->interruptible;
> +             busy_ctx.no_wait_gpu   =3D ctx->no_wait_gpu;
> +             busy_ctx.resv          =3D first_bo->resv;
> +             busy_ctx.flags         =3D TTM_OPT_FLAG_ALLOW_RES_EVICT;
> +
> +             bo =3D ttm_mem_find_evitable_bo(bdev, man, place, &busy_ctx=
, NULL,
> +                                           &locked);
> +             if (bo && (bo->resv =3D=3D first_bo->resv))
> +                     locked =3D true;
> +             else if (bo)
> +                     ww_mutex_unlock(&first_bo->resv->lock);
> +             if (!bo) {
> +                     spin_unlock(&glob->lru_lock);
> +                     ttm_bo_put(first_bo);
> +                     return -EBUSY;
> +             }
>        }
>
>        kref_get(&bo->list_kref);
> @@ -829,11 +900,15 @@ static int ttm_mem_evict_first(struct ttm_bo_device=
 *bdev,
>                ret =3D ttm_bo_cleanup_refs(bo, ctx->interruptible,
>                                          ctx->no_wait_gpu, locked);
>                kref_put(&bo->list_kref, ttm_bo_release_list);
> +             if (first_bo)
> +                     ttm_bo_put(first_bo);
>                return ret;
>        }
>
>        ttm_bo_del_from_lru(bo);
>        spin_unlock(&glob->lru_lock);
> +     if (first_bo)
> +             ttm_bo_put(first_bo);
>
>        ret =3D ttm_bo_evict(bo, ctx);
>        if (locked) {
> @@ -907,7 +982,7 @@ static int ttm_bo_mem_force_space(struct ttm_buffer_o=
bject *bo,
>                        return ret;
>                if (mem->mm_node)
>                        break;
> -             ret =3D ttm_mem_evict_first(bdev, mem_type, place, ctx);
> +             ret =3D ttm_mem_evict_first(bdev, mem_type, place, ctx, bo-=
>resv);
>                if (unlikely(ret !=3D 0))
>                        return ret;
>        } while (1);
> @@ -1413,7 +1488,8 @@ static int ttm_bo_force_list_clean(struct ttm_bo_de=
vice *bdev,
>        for (i =3D 0; i < TTM_MAX_BO_PRIORITY; ++i) {
>                while (!list_empty(&man->lru[i])) {
>                        spin_unlock(&glob->lru_lock);
> -                     ret =3D ttm_mem_evict_first(bdev, mem_type, NULL, &=
ctx);
> +                     ret =3D ttm_mem_evict_first(bdev, mem_type, NULL, &=
ctx,
> +                                               NULL);
>                        if (ret)
>                                return ret;
>                        spin_lock(&glob->lru_lock);
> @@ -1784,7 +1860,8 @@ int ttm_bo_swapout(struct ttm_bo_global *glob, stru=
ct ttm_operation_ctx *ctx)
>        spin_lock(&glob->lru_lock);
>        for (i =3D 0; i < TTM_MAX_BO_PRIORITY; ++i) {
>                list_for_each_entry(bo, &glob->swap_lru[i], swap) {
> -                     if (ttm_bo_evict_swapout_allowable(bo, ctx, &locked=
)) {
> +                     if (ttm_bo_evict_swapout_allowable(bo, ctx, &locked=
,
> +                                                        NULL)) {
>                                ret =3D 0;
>                                break;
>                        }


--_000_yd30ko7yy2hgrmre4orxyza7xndome2qdx81wtzk8aeccw2rc52fs2g_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div>I know that before, it will issue warning only when debug option is en=
abled. Removing that is ok to me.<br>
I only help Prike draft your idea, and Prike is trying this patch on his si=
de. The latest feedback he gave me is first_bo is always null, code doesn't=
 run into busy path, which is very confusing me, and he said&nbsp; he is de=
bugging&nbsp; that.<br>
<br>
-David<br>
<br>
<br>
-------- Original Message --------<br>
Subject: Re: [PATCH 1/2] drm/ttm: fix busy memory to fail other user v7<br>
From: &quot;Koenig, Christian&quot; <br>
To: &quot;Zhou, David(ChunMing)&quot; ,&quot;Liang, Prike&quot; ,dri-devel@=
lists.freedesktop.org<br>
CC: <br>
<br>
</div>
<font size=3D"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText">I've foudn one more problem with this.<br>
<br>
With lockdep enabled I get a warning because ttm_eu_reserve_buffers() <br>
has called ww_acquire_done() on the ticket (which essentially means we <br>
are done, no more locking with that ticket).<br>
<br>
The simplest solution is probably to just remove the call to <br>
ww_acquire_done() from ttm_eu_reserve_buffers().<br>
<br>
Christian.<br>
<br>
Am 07.05.19 um 13:45 schrieb Chunming Zhou:<br>
&gt; heavy gpu job could occupy memory long time, which lead other user fai=
l to get memory.<br>
&gt;<br>
&gt; basically pick up Christian idea:<br>
&gt;<br>
&gt; 1. Reserve the BO in DC using a ww_mutex ticket (trivial).<br>
&gt; 2. If we then run into this EBUSY condition in TTM check if the BO we =
need memory for (or rather the ww_mutex of its reservation object) has a ti=
cket assigned.<br>
&gt; 3. If we have a ticket we grab a reference to the first BO on the LRU,=
 drop the LRU lock and try to grab the reservation lock with the ticket.<br=
>
&gt; 4. If getting the reservation lock with the ticket succeeded we check =
if the BO is still the first one on the LRU in question (the BO could have =
moved).<br>
&gt; 5. If the BO is still the first one on the LRU in question we try to e=
vict it as we would evict any other BO.<br>
&gt; 6. If any of the &quot;If's&quot; above fail we just back off and retu=
rn -EBUSY.<br>
&gt;<br>
&gt; v2: fix some minor check<br>
&gt; v3: address Christian v2 comments.<br>
&gt; v4: fix some missing<br>
&gt; v5: handle first_bo unlock and bo_get/put<br>
&gt; v6: abstract unified iterate function, and handle all possible usecase=
 not only pinned bo.<br>
&gt; v7: pass request bo-&gt;resv to ttm_bo_evict_first<br>
&gt;<br>
&gt; Change-Id: I21423fb922f885465f13833c41df1e134364a8e7<br>
&gt; Signed-off-by: Chunming Zhou &lt;david1.zhou@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/ttm/ttm_bo.c | 111 &#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;------<br>
&gt;&nbsp;&nbsp; 1 file changed, 94 insertions(&#43;), 17 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo=
.c<br>
&gt; index 8502b3ed2d88..f5e6328e4a57 100644<br>
&gt; --- a/drivers/gpu/drm/ttm/ttm_bo.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/ttm/ttm_bo.c<br>
&gt; @@ -766,11 &#43;766,13 @@ EXPORT_SYMBOL(ttm_bo_eviction_valuable);<br>
&gt;&nbsp;&nbsp;&nbsp; * b. Otherwise, trylock it.<br>
&gt;&nbsp;&nbsp;&nbsp; */<br>
&gt;&nbsp;&nbsp; static bool ttm_bo_evict_swapout_allowable(struct ttm_buff=
er_object *bo,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct ttm_operation_ct=
x *ctx, bool *locked)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct ttm_operatio=
n_ctx *ctx, bool *locked, bool *busy)<br>
&gt;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool ret =3D false;<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *locked =3D false;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (busy)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; *busy =3D false;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (bo-&gt;resv =3D=3D ctx-&=
gt;resv) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; reservation_object_assert_held(bo-&gt;resv);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; if (ctx-&gt;flags &amp; TTM_OPT_FLAG_ALLOW_RES_EVICT<br=
>
&gt; @@ -779,35 &#43;781,46 @@ static bool ttm_bo_evict_swapout_allowable(s=
truct ttm_buffer_object *bo,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; *locked =3D reservation_object_trylock(bo-&gt;resv);<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D *locked;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (!ret &amp;&amp; busy)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *busy =3D true;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt; -static int ttm_mem_evict_first(struct ttm_bo_device *bdev,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; uint32_t mem_type,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; const struct ttm_place *place,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; struct ttm_operation_ctx *ctx)<br>
&gt; &#43;static struct ttm_buffer_object*<br>
&gt; &#43;ttm_mem_find_evitable_bo(struct ttm_bo_device *bdev,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct ttm_me=
m_type_manager *man,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct =
ttm_place *place,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct ttm_op=
eration_ctx *ctx,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct ttm_bu=
ffer_object **first_bo,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool *locked)=
<br>
&gt;&nbsp;&nbsp; {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; struct ttm_bo_global *glob =3D bdev-&gt;glob=
;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; struct ttm_mem_type_manager *man =3D &amp;bd=
ev-&gt;man[mem_type];<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct ttm_buffer_object *bo=
 =3D NULL;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; bool locked =3D false;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; unsigned i;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int i;<br>
&gt;&nbsp;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; spin_lock(&amp;glob-&gt;lru_lock);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (first_bo)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; *first_bo =3D NULL;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; TTM_MAX=
_BO_PRIORITY; &#43;&#43;i) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; list_for_each_entry(bo, &amp;man-&gt;lru[i], lru) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ttm_bo_evict_swapo=
ut_allowable(bo, ctx, &amp;locked))<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool busy =3D false=
;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ttm_bo_evict_s=
wapout_allowable(bo, ctx, locked,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;busy)) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; if (first_bo &amp;&amp; !(*first_bo) &amp;&amp=
; busy) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; ttm_bo_get(bo);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; *first_bo =3D bo;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pla=
ce &amp;&amp; !bdev-&gt;driver-&gt;eviction_valuable(bo,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; place)) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; if (locked)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; if (*locked)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; reservation_object_unlock(bo-&gt;resv);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt; @@ -818,9 &#43;831,67 @@ static int ttm_mem_evict_first(struct ttm_bo_=
device *bdev,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; bo =3D NULL;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return bo;<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;static int ttm_mem_evict_first(struct ttm_bo_device *bdev,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; uint32_t mem_type,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; const struct ttm_place *place,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; struct ttm_operation_ctx *ctx,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; struct reservation_object *request_resv)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct ttm_bo_global *glob =3D bdev-&gt;=
glob;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct ttm_mem_type_manager *man =3D &am=
p;bdev-&gt;man[mem_type];<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct ttm_buffer_object *bo =3D NULL, *=
first_bo =3D NULL;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bool locked =3D false;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; spin_lock(&amp;glob-&gt;lru_lock);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bo =3D ttm_mem_find_evitable_bo(bdev, ma=
n, place, ctx, &amp;first_bo,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;locke=
d);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!bo) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; struct ttm_operation_ctx busy_ctx;<br>
&gt; &#43;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; spin_unlock(&amp;glob-&gt;lru_lock);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return -EBUSY;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; /* check if other user occupy memory too long time */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (!first_bo || !request_resv || !request_resv-&gt;lock.ctx) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (first_bo)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm_bo_put(first_bo);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EBUSY;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (first_bo-&gt;resv =3D=3D request_resv) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm_bo_put(first_bo=
);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EBUSY;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (ctx-&gt;interruptible)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D ww_mutex_lo=
ck_interruptible(&amp;first_bo-&gt;resv-&gt;lock,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; request_resv-&gt;lock.ctx);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; else<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D ww_mutex_lo=
ck(&amp;first_bo-&gt;resv-&gt;lock, request_resv-&gt;lock.ctx);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (ret) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm_bo_put(first_bo=
);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; spin_lock(&amp;glob-&gt;lru_lock);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; /* previous busy resv lock is held by above, idle now,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; * so let them evictable.<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; busy_ctx.interruptible =3D ctx-&gt;interruptible;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; busy_ctx.no_wait_gpu&nbsp;&nbsp; =3D ctx-&gt;no_wait_gpu;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; busy_ctx.resv&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 =3D first_bo-&gt;resv;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; busy_ctx.flags&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D =
TTM_OPT_FLAG_ALLOW_RES_EVICT;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; bo =3D ttm_mem_find_evitable_bo(bdev, man, place, &amp;busy_ctx, NU=
LL,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;locked);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (bo &amp;&amp; (bo-&gt;resv =3D=3D first_bo-&gt;resv))<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; locked =3D true;<br=
>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; else if (bo)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ww_mutex_unlock(&am=
p;first_bo-&gt;resv-&gt;lock);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (!bo) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin_unlock(&amp;gl=
ob-&gt;lru_lock);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm_bo_put(first_bo=
);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EBUSY;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kref_get(&amp;bo-&gt;list_kr=
ef);<br>
&gt; @@ -829,11 &#43;900,15 @@ static int ttm_mem_evict_first(struct ttm_bo=
_device *bdev,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D ttm_bo_cleanup_refs(bo, ctx-&gt;interruptible,<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;no_wait_gpu, locked);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; kref_put(&amp;bo-&gt;list_kref, ttm_bo_release_list);<b=
r>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (first_bo)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm_bo_put(first_bo=
);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm_bo_del_from_lru(bo);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin_unlock(&amp;glob-&gt;lr=
u_lock);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (first_bo)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; ttm_bo_put(first_bo);<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D ttm_bo_evict(bo, ctx=
);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (locked) {<br>
&gt; @@ -907,7 &#43;982,7 @@ static int ttm_bo_mem_force_space(struct ttm_b=
uffer_object *bo,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
ret;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; if (mem-&gt;mm_node)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<=
br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D ttm_mem_evict_first(bdev, mem_type, place, ctx);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; ret =3D ttm_mem_evict_first(bdev, mem_type, place, ctx, bo-&gt;resv=
);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; if (unlikely(ret !=3D 0))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
ret;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } while (1);<br>
&gt; @@ -1413,7 &#43;1488,8 @@ static int ttm_bo_force_list_clean(struct tt=
m_bo_device *bdev,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; TTM_MAX=
_BO_PRIORITY; &#43;&#43;i) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; while (!list_empty(&amp;man-&gt;lru[i])) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin_un=
lock(&amp;glob-&gt;lru_lock);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D ttm_mem_evict_f=
irst(bdev, mem_type, NULL, &amp;ctx);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D ttm_mem_evi=
ct_first(bdev, mem_type, NULL, &amp;ctx,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret=
)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin_lo=
ck(&amp;glob-&gt;lru_lock);<br>
&gt; @@ -1784,7 &#43;1860,8 @@ int ttm_bo_swapout(struct ttm_bo_global *glo=
b, struct ttm_operation_ctx *ctx)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin_lock(&amp;glob-&gt;lru_=
lock);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; TTM_MAX=
_BO_PRIORITY; &#43;&#43;i) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; list_for_each_entry(bo, &amp;glob-&gt;swap_lru[i], swap=
) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ttm_bo_evict_swapou=
t_allowable(bo, ctx, &amp;locked)) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ttm_bo_evict_sw=
apout_allowable(bo, ctx, &amp;locked,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL)) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D 0;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
<br>
</div>
</span></font>
</body>
</html>

--_000_yd30ko7yy2hgrmre4orxyza7xndome2qdx81wtzk8aeccw2rc52fs2g_--

--===============1939802789==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1939802789==--
