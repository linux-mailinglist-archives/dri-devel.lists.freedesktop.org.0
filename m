Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2AD3F173A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 12:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD07B6E8AC;
	Thu, 19 Aug 2021 10:25:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2052.outbound.protection.outlook.com [40.107.102.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 549C86E8A4;
 Thu, 19 Aug 2021 10:25:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3lqd1ljTe/yVsuB2k+x8GuPMVIExmywxRDbsiHoKz3VHaHhvOECSQuZtMsUzPBNnZXmewOssO1WnoaP1G1hZTaGeNgK3OU1f99IT4s20Hlka6DTHJx+C08BOKz7qVt0KGlic3uiVsf321mOrzsFCFyd5wT8OxdFvLSvot/c/uJ63+N9MzsiHCbUeLcF/42LoYbQbUWf6+epw/LkIW0HcXlASLeVPurQ4a4psqAan5TtTyRO5GBUrbCvLveF2/FZglBNpvqTOkppQhW6ef22h3TSU//+u8UatwtA8VLg1c5A8dLyqR3PjmE3OTGvDgJryJNllXtYQrQ8PWR/nnMUlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDGOIQpi8ZWwXkyJ9aXoh9HkBY6dzdVOrcEh/5IdW/k=;
 b=l6c3mWOEYtwZHvX+FPNmVIcA6QSfrNvU5G1dcLGtQjExlCqtIn3E+KYDxSQkWSDb4VROrh/kh0mMc0NnMaIHQQjQ1lPRSPe0nqg/rVzVx/GyPSsZo2QABmCaGOn+2l5RwxW77hdzGoVD/Z9jnZrmpkVxC3a9F7dPPXuZgW41r4lBJv9u4kbvO3k959p60e1JJzFtQ27mj9+A4TRl01BkxtTjBnJR6+9HLeViZkNkawvXD+AosGsmvf/cq3I8n311EaoAiTHCR9kLHms7NMP7AmU1CIPy14K0QkiUMzCi9p+t7yl4JAtfdM7YiZ0eFF0SUMc9M02oIofFH5GB0YZmUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDGOIQpi8ZWwXkyJ9aXoh9HkBY6dzdVOrcEh/5IdW/k=;
 b=ZyuTbKxB0LI2mDS07ir2oZXlatBBWbtrbiojosz6OVI+Zh5nOne9dUbAVYTXm/k7yiCCv9z3Zp8yRRTiWnjIj+jXCDx/OBXBo3kEtMX/Ke/qJEdwG2LW+v1Me0QBach82/Ikoz3OX6yParhnv7Te9gSLX2Bb0T6sZKeijPYVQ5k=
Received: from BL1PR12MB5269.namprd12.prod.outlook.com (2603:10b6:208:30b::20)
 by BL1PR12MB5272.namprd12.prod.outlook.com (2603:10b6:208:319::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Thu, 19 Aug
 2021 10:25:42 +0000
Received: from BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::acc6:c407:1353:6a]) by BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::acc6:c407:1353:6a%5]) with mapi id 15.20.4415.024; Thu, 19 Aug 2021
 10:25:42 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>, "Grodzovsky, Andrey"
 <Andrey.Grodzovsky@amd.com>
CC: Alex Deucher <alexdeucher@gmail.com>, "Chen, JingWen"
 <JingWen.Chen2@amd.com>, Maling list - DRI developers
 <dri-devel@lists.freedesktop.org>, amd-gfx list
 <amd-gfx@lists.freedesktop.org>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: RE: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
Thread-Topic: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
Thread-Index: AQHXlCM5tpADXUaHLkOoBAv6YPx0dat5SvoAgAAGzICAAAGgAIAAATMAgAAByYCAAAJCAIABOOmAgAANvtA=
Date: Thu, 19 Aug 2021 10:25:42 +0000
Message-ID: <BL1PR12MB52690CB11358D0298AABC8C084C09@BL1PR12MB5269.namprd12.prod.outlook.com>
References: <20210818112114.1417685-1-Jingwen.Chen2@amd.com>
 <CADnq5_OApvH1Jo2VzJBHewHB_LXgg1WzUHvTBvrNYnbYdFAWhQ@mail.gmail.com>
 <69cbf5bd-42c2-be55-a604-43f4ebba159d@amd.com>
 <YR0Z7qtEti2hwZ7i@phenom.ffwll.local>
 <b92c62f2-7b1c-d4d8-cb84-1b5ccc3e4bb1@amd.com>
 <YR0cb43Wv8jGiIbb@phenom.ffwll.local>
 <82782ff5-d2a7-a4a8-8526-d1ff231630ed@amd.com>
 <YR4k0fPfUL5viMRY@phenom.ffwll.local>
In-Reply-To: <YR4k0fPfUL5viMRY@phenom.ffwll.local>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-08-19T10:25:40Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=e6ef5199-574c-48a9-8147-c533a670ce27;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 144bb66a-0d72-48f9-eb9f-08d962fbb2b9
x-ms-traffictypediagnostic: BL1PR12MB5272:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL1PR12MB527283BCD80C25664CB1034D84C09@BL1PR12MB5272.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:187;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bplGF1WkaYlkMVAV4tKHaD/NQXaYyXRYChO8+4kTVsKEBYiwDLcpcQwVy4CH3DBn0xMbpW4I7H40Mj5Qdg+ZQcCZQ7FJVZcrBjJ6IYFxWwWeSU6Ejh+IDsUTO1lnkKjVc1M3Pw0USgHn2+Jr9IlVPhAT+5O7y/EcXmWSOZ/MDGDjb2ZwbUdowrh8a5n5GjpmXUrLMiVc486tcl9ia4h9+D6lpOs5lxzKg4XKVrdc3ig87JPLNgA4l4NOJNN2oYpHi017XMJmpBVMpnr3dRKyQ4tKz4GThlrcUTXE92W2wTcTgZ+ZaYASFesub9Ro12jmw8jgmUMWdxgzF9hKhFkkz4YPOFXswr6NjsmHbWo/MG3znArB/Q2gJWLLz/v3kJrZCGAec8J1NhZ7ijL4vXUm5JrhXGnXsDvT1rm0PSPYZyQhapMGh4EQv6ziMK807rhpBBQRdpDwI5oMkg7nNCboJdOurHoK84AlLKusKRfQvFW9tNACye3I4WSyoax87D33yydfO4u2xd23sXqI5CGzDJml+RItKcRKWWpVm4kUL+8YCtiEyP1Z40TV/3Gf/7RFxncrhlEB487BtLbWnpZI/iHBFKp85i+TbTkoAQvlzLoQraGI0Qo9woKyD9jMMDFDBpFw3zMToyZ6lBuEMNEAh0QoXVm41sT+uI7ujTgRKYDdK8wrvpFcLjCMy1bZ4olbE37DE+kmP7JL19/NdEslnRBGdbBn75OhEt9Jj73s/LMZDT9QUM0KXWkhjfbkCGcOqHuG+sieDhsRrz4pCagLzHLeL66qjzvZq8EuHQAHsCQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5269.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(508600001)(5660300002)(45080400002)(8936002)(7696005)(71200400001)(55016002)(66476007)(66446008)(26005)(966005)(53546011)(64756008)(33656002)(52536014)(6636002)(38100700002)(316002)(2906002)(110136005)(9686003)(6506007)(86362001)(83380400001)(8676002)(30864003)(38070700005)(4326008)(76116006)(66556008)(186003)(66946007)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?gzHLv1YeVr/awtuX6sAgUmvibVIeZZhw7Q/1SowKqtHBmpED3X5kr/C28o?=
 =?iso-8859-1?Q?5rHrOvUieKt4PXpIhswt70lHfrODPe0p/rMneIPs3zVB/rUwtJKd9vxRIY?=
 =?iso-8859-1?Q?uERha06O8nCpWcrVSldIMY9TS0Ws0MafRMcHflzJUmlA6oTp8ugL+X5DHO?=
 =?iso-8859-1?Q?AmgMs3be84dftBjkjT/PVRqOcaekgj4va2eVfGL16LQMF7wnEBpUeaLrtg?=
 =?iso-8859-1?Q?IRYKLGwMxvF+4wIj7+QeVPLefnA5QXnn7nM56Vb2OdDIkkm8NCgCXAkR01?=
 =?iso-8859-1?Q?U5BgFzDlWEY1J3vnhYArxrvS9eqHQvpHGWgyzM8WdDgODB2wAo4zbyIW7K?=
 =?iso-8859-1?Q?7qhKwLQPN/ZUUJYjlLQRpePrD6sGG08fdNI9f2KtfOH2pb4i53WxUzjMX+?=
 =?iso-8859-1?Q?hV5Cr66VX5bFq7ksqB5sJ5AhCaU670wsdy2g8Sp9Yl0Lg8AKd2RWoqwoSz?=
 =?iso-8859-1?Q?JJpgNJy7qP59dGgzhL3daoDlvJzbTlu+CECzA0daaRLww3bwDwkz9F/RkW?=
 =?iso-8859-1?Q?LC/nFTkzhYv1Pg+rNmGgBPsE6XgA1GHW1+oqf5H2wkKk0fMOYAsgjv39fX?=
 =?iso-8859-1?Q?fsTakamNuQuAoFXdyIlNpDy2kwccqipqyf2VzEoH0sx8aS6uQV5qHLRdHT?=
 =?iso-8859-1?Q?7OxmD7BOck+6kXPc+LB+IrEl9I7tm0xAUsZOFU1HOUYljJHCY4RAEXyxpG?=
 =?iso-8859-1?Q?lnSuIpPo/ypF794qlYgKVCMWIoMNDwEHpBKGXMZNEkxVA6gTz3hsHdzcVp?=
 =?iso-8859-1?Q?haGUGApChBRIP47HKOKiCh2jIj3o+mc3reufOAJHrf9pC+njsIl1xJC3yg?=
 =?iso-8859-1?Q?GAOuSSJjpKkOK5dEWkgVF+vZhY8BrxhdBgZmjMFPriGBc/1pCrd2+Luq6f?=
 =?iso-8859-1?Q?6zAYk5Oa+YT4zKBSnof+u8nKkOZNUNpTEnzyqZcp1FYNoO2qMoD+qGxxdp?=
 =?iso-8859-1?Q?g1+uUTzqI0OBKAKgfJJM6D4yhwYeHGzaplEOMZkjzeHeFwklh0X7Kt/Vim?=
 =?iso-8859-1?Q?Wgfs16K7h/X3zrAzTeiR+3xlRcLPqWXKSQ0dvfHkbLfogERP4ZmBvzqub0?=
 =?iso-8859-1?Q?/Kf36kuKDvaWEHWnL4TR602gBB5AtkknGHmMlTFSXyGaGGnfRVjd9WcS99?=
 =?iso-8859-1?Q?Mr14bAyr94YIhdzC6NEPs8kyYpnJ8eRlw5OLCUfm21KrqGtqwInTW5nQfT?=
 =?iso-8859-1?Q?vOeNdJcfkE06WRy+Wl0lUDwoOUkIPQFOOPtr62d6k8tQT3Wx6NUupeCYFn?=
 =?iso-8859-1?Q?ohRJbV7/OLSbB68aI65Mi0JMPV3cA9HTwewPgKcVA+W1fPRHeJZfOt1v/E?=
 =?iso-8859-1?Q?xLawd/Mt/R0zaIa4CxXMQvM27ahgiMt6WuPAbD10b7WSGQ81rba6uBwScT?=
 =?iso-8859-1?Q?EIqW1oRyBz?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5269.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 144bb66a-0d72-48f9-eb9f-08d962fbb2b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2021 10:25:42.2934 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zL24GSdyG8G8ER+pYiDK/9521eePWLA2EURleAPTBfZ0gfJqvT+toUEPnMsQ7nQz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5272
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only]

Hi Daniel

>> Why can't we stop the scheduler thread first, so that there's guaranteed=
 no race? I've recently had a lot of discussions with panfrost folks about =
their reset that spawns across engines, and without stopping the scheduler =
thread first before you touch anything it's just plain impossible.

Yeah we had this though as well in our mind.

Our second approach is to call ktrhead_stop() in job_timedout() routine so =
that  the "bad" job is guaranteed to be used without scheduler's touching o=
r freeing,
Check this sample patch one as well please:

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sched=
uler/sched_main.c
index a2a9536..50a49cb 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -319,17 +319,12 @@ static void drm_sched_job_timedout(struct work_struct=
 *work)
        sched =3D container_of(work, struct drm_gpu_scheduler, work_tdr.wor=
k);
=20
        /* Protects against concurrent deletion in drm_sched_get_cleanup_jo=
b */
+       kthread_park(sched->thread);
        spin_lock(&sched->job_list_lock);
        job =3D list_first_entry_or_null(&sched->pending_list,
                                       struct drm_sched_job, list);
=20
        if (job) {
-               /*
-                * Remove the bad job so it cannot be freed by concurrent
-                * drm_sched_cleanup_jobs. It will be reinserted back after=
 sched->thread
-                * is parked at which point it's safe.
-                */
-               list_del_init(&job->list);
                spin_unlock(&sched->job_list_lock);
=20
                status =3D job->sched->ops->timedout_job(job);
@@ -345,6 +340,7 @@ static void drm_sched_job_timedout(struct work_struct *=
work)
        } else {
                spin_unlock(&sched->job_list_lock);
        }
+       kthread_unpark(sched->thread);
=20
        if (status !=3D DRM_GPU_SCHED_STAT_ENODEV) {
                spin_lock(&sched->job_list_lock);
@@ -393,20 +389,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, s=
truct drm_sched_job *bad)
        kthread_park(sched->thread);
=20
        /*
-        * Reinsert back the bad job here - now it's safe as
-        * drm_sched_get_cleanup_job cannot race against us and release the
-        * bad job at this point - we parked (waited for) any in progress
-        * (earlier) cleanups and drm_sched_get_cleanup_job will not be cal=
led
-        * now until the scheduler thread is unparked.
-        */
-       if (bad && bad->sched =3D=3D sched)
-               /*
-                * Add at the head of the queue to reflect it was the earli=
est
-                * job extracted.
-                */
-               list_add(&bad->list, &sched->pending_list);
-
-       /*
         * Iterate the job list from later to  earlier one and either deact=
ive
         * their HW callbacks or remove them from pending list if they alre=
ady
         * signaled.


Thanks=20

------------------------------------------
Monk Liu | Cloud-GPU Core team
------------------------------------------

-----Original Message-----
From: Daniel Vetter <daniel@ffwll.ch>=20
Sent: Thursday, August 19, 2021 5:31 PM
To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>; Alex Deucher <alexdeucher@gmail.com>; =
Chen, JingWen <JingWen.Chen2@amd.com>; Maling list - DRI developers <dri-de=
vel@lists.freedesktop.org>; amd-gfx list <amd-gfx@lists.freedesktop.org>; L=
iu, Monk <Monk.Liu@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>
Subject: Re: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad jo=
b."

On Wed, Aug 18, 2021 at 10:51:00AM -0400, Andrey Grodzovsky wrote:
>=20
> On 2021-08-18 10:42 a.m., Daniel Vetter wrote:
> > On Wed, Aug 18, 2021 at 10:36:32AM -0400, Andrey Grodzovsky wrote:
> > > On 2021-08-18 10:32 a.m., Daniel Vetter wrote:
> > > > On Wed, Aug 18, 2021 at 10:26:25AM -0400, Andrey Grodzovsky wrote:
> > > > > On 2021-08-18 10:02 a.m., Alex Deucher wrote:
> > > > >=20
> > > > > > + dri-devel
> > > > > >=20
> > > > > > Since scheduler is a shared component, please add dri-devel=20
> > > > > > on all scheduler patches.
> > > > > >=20
> > > > > > On Wed, Aug 18, 2021 at 7:21 AM Jingwen Chen <Jingwen.Chen2@amd=
.com> wrote:
> > > > > > > [Why]
> > > > > > > for bailing job, this commit will delete it from pending=20
> > > > > > > list thus the bailing job will never have a chance to be=20
> > > > > > > resubmitted even in advance tdr mode.
> > > > > > >=20
> > > > > > > [How]
> > > > > > > after embeded hw_fence into amdgpu_job is done, the race=20
> > > > > > > condition that this commit tries to work around is=20
> > > > > > > completely solved.So revert this commit.
> > > > > > > This reverts commit 135517d3565b48f4def3b1b82008bc17eb5d1c90.
> > > > > > > v2:
> > > > > > > add dma_fence_get/put() around timedout_job to avoid=20
> > > > > > > concurrent delete during processing timedout_job
> > > > > > >=20
> > > > > > > Signed-off-by: Jingwen Chen <Jingwen.Chen2@amd.com>
> > > > > > > ---
> > > > > > >     drivers/gpu/drm/scheduler/sched_main.c | 23 +++++--------=
----------
> > > > > > >     1 file changed, 5 insertions(+), 18 deletions(-)
> > > > > > >=20
> > > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c=20
> > > > > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > index a2a953693b45..f9b9b3aefc4a 100644
> > > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > @@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct=
 work_struct *work)
> > > > > > >     {
> > > > > > >            struct drm_gpu_scheduler *sched;
> > > > > > >            struct drm_sched_job *job;
> > > > > > > +       struct dma_fence *fence;
> > > > > > >            enum drm_gpu_sched_stat status =3D=20
> > > > > > > DRM_GPU_SCHED_STAT_NOMINAL;
> > > > > > >=20
> > > > > > >            sched =3D container_of(work, struct=20
> > > > > > > drm_gpu_scheduler, work_tdr.work); @@ -325,11 +326,10 @@=20
> > > > > > > static void drm_sched_job_timedout(struct work_struct=20
> > > > > > > *work)
> > > > > > >=20
> > > > > > >            if (job) {
> > > > > > >                    /*
> > > > > > > -                * Remove the bad job so it cannot be freed b=
y concurrent
> > > > > > > -                * drm_sched_cleanup_jobs. It will be reinser=
ted back after sched->thread
> > > > > > > -                * is parked at which point it's safe.
> > > > > > > +                * Get job->s_fence->parent here to avoid con=
current delete during
> > > > > > > +                * processing timedout_job
> > > > > > >                     */
> > > > > > > -               list_del_init(&job->list);
> > > > > > > +               fence =3D=20
> > > > > > > + dma_fence_get(job->s_fence->parent);
> > > > > While this is true for amdgpu, it has no meaning for other=20
> > > > > drivers for whom we haven't done the refactoring of embedding=20
> > > > > HW fence (parent) into the job structure.
> > > > > In fact thinking
> > > > > about it, unless you do the HW fence embedding for all the=20
> > > > > drivers using the scheduler you cannot revert this patch or=20
> > > > > you will just break them.
> > > > btw, why did you do that embedding? I do still have my patches=20
> > > > with dma_fence annotations floating around, but my idea at least=20
> > > > was to fix that issue with a mempool, not with embeddeding. What=20
> > > > was the motivation for embedding the wh fence?
> > > > -Daniel
> > >=20
> > > The motivation was 2 fold, avoid memory allocation during jobs=20
> > > submissions (HW fence allocation) because as Christian explained=20
> > > this leads to deadlock with mm code during evictions due to memory=20
> > > pressure (Christian can clarify if I messed
> > Yeah that's the exact same thing I've chased with my dma_fence=20
> > annotations, but thus far zero to none interested in getting it=20
> > sorted. I think it'd be good to have some cross-driver agreement on=20
> > how this should be solved before someone just charges ahead ...
> >=20
> > > this explanation). Second is to exactly revert this patch because=20
> > > while it solved the issue described in the patch it created=20
> > > another with drivers who baildc out early during TDR handling for=20
> > > various reason and the job would just leak because it was already=20
> > > removed form pending list.
> > Can't we reinsert it before we restart the scheduler thread? It=20
> > might need a separate list for that due to the lockless queue=20
> > tricks. Or am I thinking about the wrong kind of "we lost the job"?
> > -Danile
>=20
>=20
> If you look at the original patch it would reinsert it even earlier -=20
> right after stopping the=A0 SW scheduler thread, and even then it was to=
=20
> late for some drivers as they would decide to return back from their=20
> TDR handler even before that. It is solvable but in an ugly way as far=20
> as I see, you need to require each driver in his code to put the job=20
> back in the list if they do it before reaching the place where=20
> scheduler framework does it. Kind of spaghetti code seems to me.

Hm yeah I didn't realize this all happens before we stop the scheduler thre=
ad.

Why can't we stop the scheduler thread first, so that there's guaranteed no=
 race? I've recently had a lot of discussions with panfrost folks about the=
ir reset that spawns across engines, and without stopping the scheduler thr=
ead first before you touch anything it's just plain impossible.

I'm also still not understanding what exactly you guys have done, can someo=
ne please dig out the the amdgpu patches that motivate all this maybe that'=
s clearer? A full explanation would still be good since I've only started i=
n scheduler stuff.

Another thing I recently pondered for tdr races looking at i915 code is whe=
ther the tdr should first block the completion fence for that job. My motiv=
ation is to have a race-free error capture (if the completion races then we=
 might start evicting memory and everything goes boom), but maybe that help=
s here too. Some kind of atomic "block this fence from completing thing.

Or I'm I completely guessing in the wrong direction?
-Daniel

>=20
> Andrey
>=20
>=20
> >=20
> > > Andrey
> > >=20
> > >=20
> > > >=20
> > > > > Andrey
> > > > >=20
> > > > >=20
> > > > > > >                    spin_unlock(&sched->job_list_lock);
> > > > > > >=20
> > > > > > >                    status =3D=20
> > > > > > > job->sched->ops->timedout_job(job);
> > > > > > > @@ -342,6 +342,7 @@ static void drm_sched_job_timedout(struct=
 work_struct *work)
> > > > > > >                            job->sched->ops->free_job(job);
> > > > > > >                            sched->free_guilty =3D false;
> > > > > > >                    }
> > > > > > > +               dma_fence_put(fence);
> > > > > > >            } else {
> > > > > > >                    spin_unlock(&sched->job_list_lock);
> > > > > > >            }
> > > > > > > @@ -392,20 +393,6 @@ void drm_sched_stop(struct=20
> > > > > > > drm_gpu_scheduler *sched, struct drm_sched_job *bad)
> > > > > > >=20
> > > > > > >            kthread_park(sched->thread);
> > > > > > >=20
> > > > > > > -       /*
> > > > > > > -        * Reinsert back the bad job here - now it's safe as
> > > > > > > -        * drm_sched_get_cleanup_job cannot race against us a=
nd release the
> > > > > > > -        * bad job at this point - we parked (waited for) any=
 in progress
> > > > > > > -        * (earlier) cleanups and drm_sched_get_cleanup_job w=
ill not be called
> > > > > > > -        * now until the scheduler thread is unparked.
> > > > > > > -        */
> > > > > > > -       if (bad && bad->sched =3D=3D sched)
> > > > > > > -               /*
> > > > > > > -                * Add at the head of the queue to reflect it=
 was the earliest
> > > > > > > -                * job extracted.
> > > > > > > -                */
> > > > > > > -               list_add(&bad->list, &sched->pending_list);
> > > > > > > -
> > > > > > >            /*
> > > > > > >             * Iterate the job list from later to  earlier one=
 and either deactive
> > > > > > >             * their HW callbacks or remove them from=20
> > > > > > > pending list if they already
> > > > > > > --
> > > > > > > 2.25.1
> > > > > > >=20

--
Daniel Vetter
Software Engineer, Intel Corporation
https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fblog.ffw=
ll.ch%2F&amp;data=3D04%7C01%7Cmonk.liu%40amd.com%7C27fcce7ca8dd4f39608508d9=
62f40f33%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637649622657672189%7C=
Unknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL=
CJXVCI6Mn0%3D%7C1000&amp;sdata=3DJVZtg3AhbiA%2FDmVbNGo3MxVliO83nh8%2Fi50PCM=
svwyY%3D&amp;reserved=3D0
