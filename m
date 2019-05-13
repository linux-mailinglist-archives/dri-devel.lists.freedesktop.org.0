Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0461AF08
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 05:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C5D892BF;
	Mon, 13 May 2019 03:00:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on0621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::621])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5089892BB
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 03:00:55 +0000 (UTC)
Received: from MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) by
 MN2PR12MB3581.namprd12.prod.outlook.com (20.178.242.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Mon, 13 May 2019 03:00:54 +0000
Received: from MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::11eb:77b3:f5ae:f6c1]) by MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::11eb:77b3:f5ae:f6c1%4]) with mapi id 15.20.1878.024; Mon, 13 May 2019
 03:00:54 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/ttm: fix busy memory to fail other user v7
Thread-Topic: [PATCH 1/2] drm/ttm: fix busy memory to fail other user v7
Thread-Index: AQHVBnfNLyuQPsYSgUuQSIb3jUCHlKZjx07AgASXyUA=
Date: Mon, 13 May 2019 03:00:53 +0000
Message-ID: <MN2PR12MB353654756B1834E18A9509F7FB0F0@MN2PR12MB3536.namprd12.prod.outlook.com>
References: <20190507114531.26089-1-david1.zhou@amd.com>
 <e40420ea-3b25-a738-9c6e-4d251ed9e390@amd.com>
 <-yd30ko-7yy2hg-rmre4orxyza7-xndome2qdx81-wtzk8a-eccw2rc52fs2-grqgt7bajdlk-5lgjxo-xu3otx-5m9i78-2xa184-z2lana96yogmoisk45t18dyy9462b5f86c1cg5hlpw-xorlqm-lev8gs.1557413178321@email.android.com>
 <a912da5d-d429-1eff-db51-77e38e9b0724@gmail.com>
 <MN2PR12MB35361BDEABAC09560DCE6730FB0C0@MN2PR12MB3536.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB35361BDEABAC09560DCE6730FB0C0@MN2PR12MB3536.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88005559-ac55-4921-a9d6-08d6d74f36c2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3581; 
x-ms-traffictypediagnostic: MN2PR12MB3581:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <MN2PR12MB358178DA2C1FBD1471887803FB0F0@MN2PR12MB3581.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(396003)(136003)(366004)(39860400002)(199004)(189003)(13464003)(7696005)(606006)(110136005)(8676002)(99286004)(81156014)(66574012)(81166006)(8936002)(2501003)(2906002)(6246003)(14454004)(68736007)(966005)(478600001)(72206003)(33656002)(229853002)(55016002)(316002)(561944003)(30864003)(76116006)(3846002)(6436002)(6306002)(54896002)(790700001)(9686003)(71190400001)(71200400001)(236005)(53946003)(25786009)(52536014)(66556008)(66476007)(66946007)(11346002)(26005)(66066001)(476003)(102836004)(6116002)(446003)(73956011)(64756008)(5660300002)(66446008)(53936002)(256004)(6506007)(14444005)(53546011)(186003)(74316002)(7736002)(486006)(76176011)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3581;
 H:MN2PR12MB3536.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XK72y132b3R9QFH8CX1wghWFgtXjYcl03Md/Iua6NlfNn6oLRo56VP4emydfgzkwkA58ROVuIgz5GanLedt/oSBzq93FwIoKcpMhk7c40ll/VEhrLaskh71glVLIYHRZePlQNPCsvtpMPLeHu6PjiB0DrPu9WLn6Vh7Y3nnWOCsFMXBKTH1M637DfMMfgW5nRor+k9stOsZJHcMDWNFaZGo2iwJQEREoO1/l5LdNrq2h+rAEICq2p5iH/omeTp9pEZlGeX9UollvG3pKOZkKQQZZ3J4IVK5wT/XPlGp2iunH8tepZBSZNTwtFPmE9tbUHkQMq4atxzPZ9M82Ogp6pMtGxlKYSdiGzj6uGkMs8W+vNo7ldHw2fGm187P46GtDq7qyflYPB8RPgQkDnewOyQeTF9hYuoEMEhKhnm3EenU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88005559-ac55-4921-a9d6-08d6d74f36c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 03:00:53.9468 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3581
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6vGLuX4GEv6Aq/sHtpjCEvI52ucbfkevgmwDqqZujM=;
 b=4EowMa4ljLB8n2PPzOse8PwAscLNvguk6/RfARobjWTvVLK2GXm+t5X+FKRjfmjhNIOCbMI1won/JiLBW3vtxnKMvYsXu85tx7mfNtxXwzZ6PWH8leygGuOnieOFJwdr8ux3RMiV4GMRpEuxAP9WHpMYKDYcWSA72Vq7ChkDZf8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Prike.Liang@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============1135554306=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1135554306==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB353654756B1834E18A9509F7FB0F0MN2PR12MB3536namp_"

--_000_MN2PR12MB353654756B1834E18A9509F7FB0F0MN2PR12MB3536namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I have verified this solution again and the Abaqus case finished after abou=
t 27 hours running .
But not sure whether retrieve the first busy BO and then retry evict the LR=
U BOs result in
Abaqus poor performance .

Anyway this can fix the age-old issue .Does any other concern before push t=
he following patch to the drm-next branch .

drm/amd/display: use ttm_eu_reserve_buffers instead of amdgpu_bo_reserve
drm/ttm: fix busy memory to fail other user v7

Thanks,
Prike
From: Liang, Prike
Sent: Friday, May 10, 2019 1:40 PM
To: Koenig, Christian <Christian.Koenig@amd.com>; Zhou, David(ChunMing) <Da=
vid1.Zhou@amd.com>; dri-devel@lists.freedesktop.org
Subject: RE: [PATCH 1/2] drm/ttm: fix busy memory to fail other user v7

Thanks Christian proposal and David draft the solution implement .

The pinned Bos failed not observed from prepare_fb ,but Abaqus job can't  f=
inished through the whole night .
Regards the NULL fist BO EBUSY error case , which  comes from amdgpu_cs_bo_=
validate perform period as the below call stack show . Now the NULL first B=
O debug error message popup out endlessly during Abaqus running ,that's see=
ms the function @amdgpu_cs_validate run into invoked amdgpu_cs_bo_validate =
dead loop.

lxj ttm_mem_evict_first first_bo=3D          (null),request_resv=3Dffff929d=
47b33218,request_resv->lock.ctx=3Dffff929b8d6bfbd8
[ 2703.091731] CPU: 3 PID: 10739 Comm: standard Kdump: loaded Tainted: G   =
        OE  ------------   3.10.0-957.el7.x86_64 #1
[ 2703.103046] Hardware name: MSI MS-7984/Z170 KRAIT GAMING (MS-7984), BIOS=
 B.80 05/11/2016
[ 2703.111181] Call Trace:
[ 2703.113745]  [<ffffffff81961dc1>] dump_stack+0x19/0x1b
[ 2703.118979]  [<ffffffffc055cd19>] ttm_mem_evict_first+0x3a9/0x400 [amdtt=
m]
[ 2703.125974]  [<ffffffffc055d05b>] amdttm_bo_mem_space+0x2eb/0x4a0 [amdtt=
m]
[ 2703.132967]  [<ffffffffc055d6e4>] amdttm_bo_validate+0xc4/0x140 [amdttm]
[ 2703.139827]  [<ffffffffc059fed5>] amdgpu_cs_bo_validate+0xa5/0x220 [amdg=
pu]
[ 2703.146879]  [<ffffffffc05a0097>] amdgpu_cs_validate+0x47/0x2e0 [amdgpu]
[ 2703.153776]  [<ffffffffc05b41a2>] ? amdgpu_vm_del_from_lru_notify+0x12/0=
x80 [amdgpu]
[ 2703.161707]  [<ffffffffc05a0050>] ? amdgpu_cs_bo_validate+0x220/0x220 [a=
mdgpu]
[ 2703.169018]  [<ffffffffc05b4452>] amdgpu_vm_validate_pt_bos+0x92/0x140 [=
amdgpu]
[ 2703.176512]  [<ffffffffc05a23e5>] amdgpu_cs_ioctl+0x18a5/0x1d40 [amdgpu]
[ 2703.183372]  [<ffffffffc05a0b40>] ? amdgpu_cs_find_mapping+0x120/0x120 [=
amdgpu]
[ 2703.190815]  [<ffffffffc042df2c>] drm_ioctl_kernel+0x6c/0xb0 [drm]
[ 2703.197109]  [<ffffffffc042e647>] drm_ioctl+0x1e7/0x420 [drm]
[ 2703.202995]  [<ffffffffc05a0b40>] ? amdgpu_cs_find_mapping+0x120/0x120 [=
amdgpu]
[ 2703.210471]  [<ffffffffc058004b>] amdgpu_drm_ioctl+0x4b/0x80 [amdgpu]
[ 2703.217019]  [<ffffffff81456210>] do_vfs_ioctl+0x3a0/0x5a0
[ 2703.222596]  [<ffffffff8196744a>] ? __schedule+0x13a/0x890
[ 2703.228172]  [<ffffffff814564b1>] SyS_ioctl+0xa1/0xc0
[ 2703.233308]  [<ffffffff81974ddb>] system_call_fastpath+0x22/0x27

Thanks,
Prike
From: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com<mailto:ckoenig.le=
ichtzumerken@gmail.com>>
Sent: Thursday, May 09, 2019 10:59 PM
To: Zhou, David(ChunMing) <David1.Zhou@amd.com<mailto:David1.Zhou@amd.com>>=
; Koenig, Christian <Christian.Koenig@amd.com<mailto:Christian.Koenig@amd.c=
om>>; Liang, Prike <Prike.Liang@amd.com<mailto:Prike.Liang@amd.com>>; dri-d=
evel@lists.freedesktop.org<mailto:dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/ttm: fix busy memory to fail other user v7

[CAUTION: External Email]
Oh, I know where this is coming from.

The problem is that we remove the BOs from the LRU during CS and so we can'=
t wait for the CS to finish up.

Already working on this problem for Marek's similar issue,
Christian.

Am 09.05.19 um 16:46 schrieb Zhou, David(ChunMing):
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
g<mailto:dri-devel@lists.freedesktop.org>
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
> Signed-off-by: Chunming Zhou <david1.zhou@amd.com><mailto:david1.zhou@amd=
.com>
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


_______________________________________________

dri-devel mailing list

dri-devel@lists.freedesktop.org<mailto:dri-devel@lists.freedesktop.org>

https://lists.freedesktop.org/mailman/listinfo/dri-devel


--_000_MN2PR12MB353654756B1834E18A9509F7FB0F0MN2PR12MB3536namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:black;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";
	color:black;}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;
	color:black;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:black;}
p.emailquote, li.emailquote, div.emailquote
	{mso-style-name:emailquote;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:1.0pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:black;}
span.EmailStyle21
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle23
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body bgcolor=3D"white" lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:windowtext">I have verified thi=
s solution again and the Abaqus case finished after about 27 hours running =
.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">But not sure whethe=
r retrieve the first busy BO and then retry evict the LRU BOs result in
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Abaqus poor perform=
ance .<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Anyway this can fix=
 the age-old issue .Does any other concern before push the following patch =
to the drm-next branch .<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">drm/amd/display: us=
e ttm_eu_reserve_buffers instead of amdgpu_bo_reserve
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">drm/ttm: fix busy m=
emory to fail other user v7<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Thanks,<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Prike<o:p></o:p></s=
pan></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"color:windowtext">From:</span></b>=
<span style=3D"color:windowtext"> Liang, Prike
<br>
<b>Sent:</b> Friday, May 10, 2019 1:40 PM<br>
<b>To:</b> Koenig, Christian &lt;Christian.Koenig@amd.com&gt;; Zhou, David(=
ChunMing) &lt;David1.Zhou@amd.com&gt;; dri-devel@lists.freedesktop.org<br>
<b>Subject:</b> RE: [PATCH 1/2] drm/ttm: fix busy memory to fail other user=
 v7<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Thanks Christian pr=
oposal and David draft the solution implement .<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">The pinned Bos fail=
ed not observed from prepare_fb ,but Abaqus job can&#8217;t &nbsp;finished =
through the whole night .
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Regards the NULL fi=
st BO EBUSY error case , which &nbsp;comes from amdgpu_cs_bo_validate perfo=
rm period as the below call stack show . Now the NULL first BO debug error =
message popup out endlessly during Abaqus
 running ,that&#8217;s seems the function @amdgpu_cs_validate run into invo=
ked amdgpu_cs_bo_validate dead loop.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">lxj ttm_mem_evict_f=
irst first_bo=3D&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (nul=
l),request_resv=3Dffff929d47b33218,request_resv-&gt;lock.ctx=3Dffff929b8d6b=
fbd8<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">[ 2703.091731] CPU:=
 3 PID: 10739 Comm: standard Kdump: loaded Tainted: G&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OE&nbsp; ------------&nbsp;&nbsp; 3.=
10.0-957.el7.x86_64 #1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">[ 2703.103046] Hard=
ware name: MSI MS-7984/Z170 KRAIT GAMING (MS-7984), BIOS B.80 05/11/2016<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">[ 2703.111181] Call=
 Trace:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">[ 2703.113745]&nbsp=
; [&lt;ffffffff81961dc1&gt;] dump_stack&#43;0x19/0x1b<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">[ 2703.118979]&nbsp=
; [&lt;ffffffffc055cd19&gt;] ttm_mem_evict_first&#43;0x3a9/0x400 [amdttm]<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">[ 2703.125974]&nbsp=
; [&lt;ffffffffc055d05b&gt;] amdttm_bo_mem_space&#43;0x2eb/0x4a0 [amdttm]<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">[ 2703.132967]&nbsp=
; [&lt;ffffffffc055d6e4&gt;] amdttm_bo_validate&#43;0xc4/0x140 [amdttm]<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">[ 2703.139827]&nbsp=
; [&lt;ffffffffc059fed5&gt;] amdgpu_cs_bo_validate&#43;0xa5/0x220 [amdgpu]<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">[ 2703.146879]&nbsp=
; [&lt;ffffffffc05a0097&gt;] amdgpu_cs_validate&#43;0x47/0x2e0 [amdgpu]<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">[ 2703.153776]&nbsp=
; [&lt;ffffffffc05b41a2&gt;] ? amdgpu_vm_del_from_lru_notify&#43;0x12/0x80 =
[amdgpu]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">[ 2703.161707]&nbsp=
; [&lt;ffffffffc05a0050&gt;] ? amdgpu_cs_bo_validate&#43;0x220/0x220 [amdgp=
u]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">[ 2703.169018]&nbsp=
; [&lt;ffffffffc05b4452&gt;] amdgpu_vm_validate_pt_bos&#43;0x92/0x140 [amdg=
pu]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">[ 2703.176512]&nbsp=
; [&lt;ffffffffc05a23e5&gt;] amdgpu_cs_ioctl&#43;0x18a5/0x1d40 [amdgpu]<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">[ 2703.183372]&nbsp=
; [&lt;ffffffffc05a0b40&gt;] ? amdgpu_cs_find_mapping&#43;0x120/0x120 [amdg=
pu]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">[ 2703.190815]&nbsp=
; [&lt;ffffffffc042df2c&gt;] drm_ioctl_kernel&#43;0x6c/0xb0 [drm]<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">[ 2703.197109]&nbsp=
; [&lt;ffffffffc042e647&gt;] drm_ioctl&#43;0x1e7/0x420 [drm]<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">[ 2703.202995]&nbsp=
; [&lt;ffffffffc05a0b40&gt;] ? amdgpu_cs_find_mapping&#43;0x120/0x120 [amdg=
pu]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">[ 2703.210471]&nbsp=
; [&lt;ffffffffc058004b&gt;] amdgpu_drm_ioctl&#43;0x4b/0x80 [amdgpu]<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">[ 2703.217019]&nbsp=
; [&lt;ffffffff81456210&gt;] do_vfs_ioctl&#43;0x3a0/0x5a0<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">[ 2703.222596]&nbsp=
; [&lt;ffffffff8196744a&gt;] ? __schedule&#43;0x13a/0x890<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">[ 2703.228172]&nbsp=
; [&lt;ffffffff814564b1&gt;] SyS_ioctl&#43;0xa1/0xc0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">[ 2703.233308]&nbsp=
; [&lt;ffffffff81974ddb&gt;] system_call_fastpath&#43;0x22/0x27<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Thanks,<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Prike<o:p></o:p></s=
pan></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"color:windowtext">From:</span></b>=
<span style=3D"color:windowtext"> Christian K=F6nig &lt;<a href=3D"mailto:c=
koenig.leichtzumerken@gmail.com">ckoenig.leichtzumerken@gmail.com</a>&gt;
<br>
<b>Sent:</b> Thursday, May 09, 2019 10:59 PM<br>
<b>To:</b> Zhou, David(ChunMing) &lt;<a href=3D"mailto:David1.Zhou@amd.com"=
>David1.Zhou@amd.com</a>&gt;; Koenig, Christian &lt;<a href=3D"mailto:Chris=
tian.Koenig@amd.com">Christian.Koenig@amd.com</a>&gt;; Liang, Prike &lt;<a =
href=3D"mailto:Prike.Liang@amd.com">Prike.Liang@amd.com</a>&gt;;
<a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesk=
top.org</a><br>
<b>Subject:</b> Re: [PATCH 1/2] drm/ttm: fix busy memory to fail other user=
 v7<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">[CAUTION: External Email] <o:p></o:p></p>
<div>
<div>
<p class=3D"MsoNormal">Oh, I know where this is coming from.<br>
<br>
The problem is that we remove the BOs from the LRU during CS and so we can'=
t wait for the CS to finish up.<br>
<br>
Already working on this problem for Marek's similar issue,<br>
Christian.<br>
<br>
Am 09.05.19 um 16:46 schrieb Zhou, David(ChunMing):<o:p></o:p></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">I know that before, i=
t will issue warning only when debug option is enabled. Removing that is ok=
 to me.<br>
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
To: &quot;Zhou, David(ChunMing)&quot; ,&quot;Liang, Prike&quot; ,<a href=3D=
"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a=
><br>
CC: <o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">I've foudn one more p=
roblem with this.<br>
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
&gt; Signed-off-by: Chunming Zhou <a href=3D"mailto:david1.zhou@amd.com">&l=
t;david1.zhou@amd.com&gt;</a><br>
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
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p><=
/o:p></p>
</div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><o:p>&nbsp;</o:p></p>
<pre>_______________________________________________<o:p></o:p></pre>
<pre>dri-devel mailing list<o:p></o:p></pre>
<pre><a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.fre=
edesktop.org</a><o:p></o:p></pre>
<pre><a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel">h=
ttps://lists.freedesktop.org/mailman/listinfo/dri-devel</a><o:p></o:p></pre=
>
</blockquote>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</body>
</html>

--_000_MN2PR12MB353654756B1834E18A9509F7FB0F0MN2PR12MB3536namp_--

--===============1135554306==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1135554306==--
