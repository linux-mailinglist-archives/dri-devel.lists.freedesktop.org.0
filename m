Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FDD40BBD8
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 00:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09FC46E835;
	Tue, 14 Sep 2021 22:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2068.outbound.protection.outlook.com [40.107.212.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E416E830;
 Tue, 14 Sep 2021 22:59:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dpTzrGjrk0BmGmAq/UTIsd+8PcACDXZtSmU1E0dmgjdZtL4uRfKto6nGJHGJCljhwees6TwuUjvx0nxIlmprt5EGtd7jrqVKfV4bh/K3Okfnq7YxbsqpHy2kKQNFK2mRrPn+EzhUK5oJq8dnyIsoQ5a02CHpzlkHJzEF932QRJyKbdUQCqRvC7HPfRT804D6NySZiuuhP9c8A0IHjbgQpohME2BE2JLmlzvfz8RKSl8rqugbOZMOei10QKnoL8RaX4w5EEs/XtIphstY/tFMkdbbaiQwzhS7/GEhFqoTd/p+IjGhZM2U5ipthb9Jm69aG6SCXR+ySCMZukIF/CT19A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=TVnCW/t1lb5Lne3K6V1x2Gv+ph8brUUS/u8FuFOoqYA=;
 b=NQ2T6PfM6h20h9VArVeq5bfgYbKUUz3wsPzZ2Xrl2RgIlMGUyD0LQcXn1gVoj1d5fXfF5R5JKWPFDhfpfNdDbrQmWpOnYeASX2aLJj5TATN8A33PV/5uxfE5J13O122Ii5Rx+58jHvC9QwAxnO4SJtQYdIE3Y6ckIspn9WezUVw+4v5uY9TDXhjqPsgwmgo97C+qZQpg+a6mjvqGz+mVUmYs9yvtdgXy8UmNEAOWpU+rnUU7bivTNCeV8LMoARD+Ch6+8rFWFtyuFDQuocYM87tq9ke/eomC+vKbKUm3rxFwoixTC5rLb3SyHlz/9pL2fnIiBtR0HBJkVtTVlM1Ufg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVnCW/t1lb5Lne3K6V1x2Gv+ph8brUUS/u8FuFOoqYA=;
 b=nFINIChVjz7t3sSpC9PigkFkMGd26xT3ZbNIVJ1ZcGMcu7VRwH8b1HXSxZ5ivBkfrh5IQxX+nlqBDhLypIo8NGLNsuosvbG0++5ydRYzg9j0nG2IuaQsWbKdpUDbOlspA3T+A3BzJP0tlEHukRJ7i3z10LLvGsabKq6nkGAEaCM=
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4381.namprd12.prod.outlook.com (2603:10b6:806:70::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Tue, 14 Sep
 2021 22:59:38 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::c4ac:2505:5bd8:295d]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::c4ac:2505:5bd8:295d%6]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 22:59:38 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, =?iso-8859-1?Q?Christian_K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>
CC: "Liu, Monk" <Monk.Liu@amd.com>, amd-gfx list
 <amd-gfx@lists.freedesktop.org>, Maling list - DRI developers
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/sched: fix the bug of time out calculation(v4)
Thread-Topic: [PATCH 1/2] drm/sched: fix the bug of time out calculation(v4)
Thread-Index: AQHXnsrfYEjjAkZF2EWgzw9h8IOc+auOvcGAgADofICAFFsXAIAAOTS7
Date: Tue, 14 Sep 2021 22:59:38 +0000
Message-ID: <SN6PR12MB4623F8A1707C870938E08140EADA9@SN6PR12MB4623.namprd12.prod.outlook.com>
References: <1630457207-13107-1-git-send-email-Monk.Liu@amd.com>
 <28709f7f-8a48-40ad-87bb-c2f0dd89da38@gmail.com>
 <CADnq5_PRE4WyftqO15c08qwQx2CRszsj4gJQtDeon9TvtV+qkA@mail.gmail.com>
 <CADnq5_POHuuQYm5ZULWeumCmsy+eWbsRe0MSKuJcQxb7R=962g@mail.gmail.com>
In-Reply-To: <CADnq5_POHuuQYm5ZULWeumCmsy+eWbsRe0MSKuJcQxb7R=962g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47d3702b-40a3-4d60-9f91-08d977d35443
x-ms-traffictypediagnostic: SA0PR12MB4381:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR12MB4381F84259DE59AC973969E2EADA9@SA0PR12MB4381.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:268;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Cn6Tx0VT35AFnfiNqj+3/O3kTQX1SFVMu8f6+1ajK3qsICbu4lGIUaih2COYriNb/2bhAIjaaVvxedaMliRdwPeCzriJIYuVl0H+c5Vc+G/8I8QHIWw1AErfJGvA5sJ46wIU0K84g9khBqQ/qVSlkkzF3qHRt4wHhfcYPNfBkbErWxcIfoK6675LJa83GG3Exzw4Hr6uzaQ/gXL+yjwmCzqih9KdJt5TcWjoGsjo7t5OQwhBMydJJ4164Izwzkv3OJP/4yJYQwqxdI6oFpO8rbohFi2kiCFChKYjnV0d6PM0P5dp1lLe8qTww0XLmsL+3uaEGkmY0pIbGB61BODuYKsWdFapYySPuSztqSJeAvH3ZKmIu5lIK7bsC6Lh8+kGqy9lvV358eUWmH4lh9ctp5ECrrxb0WXkESCQ+FTRhQ9DJlqh1twxVET2m19jzoeTkyDTqdqptxmbScdf4T9z9sypP2DOGKhnAP+yRRgj+Wyt8m04Gvqf+W3bllWMM2BqJ1m4HZn3yeRWBIUnm07jqly5OMvel7QrefqFFRT9NLlUC7NbyYPsXizX6cB7cFdLMMDPjNpBzdacIHSBu+TSfBZFSpwueqdc1uLf5QRcFov6QYk41dQbooYQGhg5FfmO8c6Yr0xYPWUCL32McsprfcfSJqa3zYIQtHxb0fqCFTUUHKlKvC04p68Ho7+yc1e12H2+XgiRDAg8vNWiZt0Q4A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(39860400002)(366004)(346002)(26005)(4326008)(478600001)(52536014)(316002)(86362001)(54906003)(186003)(110136005)(83380400001)(71200400001)(6506007)(91956017)(76116006)(2906002)(66574015)(66476007)(66556008)(64756008)(66946007)(122000001)(66446008)(5660300002)(8936002)(38100700002)(53546011)(38070700005)(8676002)(55016002)(33656002)(7696005)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?8bYWaBqWaYNntLLmQ1rX2PeMOGF+Bv79dYamiRcb6L4o2GSxEi3reDduKB?=
 =?iso-8859-1?Q?FkH663egQolq2tFGGELPbBpkpHD75Zi/xfMAPTOhBkluZG496cUv5yJaEp?=
 =?iso-8859-1?Q?eW8GSTtC8J/sARDm4lVdhEMo0B79+c6TUWu7XYpbkpwI/XCYdN2KbwB4i2?=
 =?iso-8859-1?Q?5ze0/1295LEdQGj6vBH9iq3JvJl9CNDd0W4TwiaOXJvGotKNar0OkrWV7g?=
 =?iso-8859-1?Q?qn6xp/sY1SnG6o5LdbpXXnsZQpExMABhpdONrPvs1hPvczNPN9NqN8fTk0?=
 =?iso-8859-1?Q?rFtPlE2JMWIJ8haR+/J4IAm6SbZT+tZ+eEbMAR4XhtZPh3qOU0nYiHgw7O?=
 =?iso-8859-1?Q?AwINW02Y0imqwTwxjuRcmgmwkpoz0YSBnjFbldsrUgE1FdS2HtqxD9su8p?=
 =?iso-8859-1?Q?vv9OS2vouXmfQMCVlyomhplmIkWTEoKmv/Cq2R8kckXSVvQqPoCl/1c68O?=
 =?iso-8859-1?Q?edgtNX+qWxVIuuf1QplEWGD0RLGBVOpRP3p6SHgZe/LPXhqZP5burqjIbT?=
 =?iso-8859-1?Q?K6rF3+y9Xas/nxg6sCZqnCPdOPsamPE/4xein9WSpi9BodnFaLQejEB4oe?=
 =?iso-8859-1?Q?d8+nN1P7MhZSys+Or1DCJMjY5+NysG5lqyfx5g7+atqyJMnnghP/cc7zBj?=
 =?iso-8859-1?Q?DCbSSdXtIjVU1U7WvboS98HSEJ7qhkMgqaTxOeiDHEp/Ov6ouOsFmUt8vH?=
 =?iso-8859-1?Q?uL0UnnBbBjkwPTDjpK035M+6zRT/ck+Ac9QOVRBZKTsLvVXM57AzA7jMBO?=
 =?iso-8859-1?Q?CxFUVLE8QboVdSECJPEnD+XZ/RkY6rqjK3fs1s8g8d3v2ErY+RjjBHURoH?=
 =?iso-8859-1?Q?Q9VnnPaSLB91C8BuLaiJ9zHvn4pjooqznjICmzgyejax/eKI1JGP1z6zKk?=
 =?iso-8859-1?Q?6yQfQvIsncPibvjqSob5qVIkdRUB716Wd+ec/lSgW31YcNqG1rAVR7LRgy?=
 =?iso-8859-1?Q?9PIz4YhFapmtWhn4SK82j7DSCBAyIJiSn/mD0jMmKrwMPId9d5pj2uTm+U?=
 =?iso-8859-1?Q?5ia/Cx6wh2VIzGYw70Dg0WkwNfMsMXsUbaJNtZ5MvqjvjnOWgJyAoLJGLA?=
 =?iso-8859-1?Q?ZtozFOldf4oLVs39aEXIvZmSU/xpbG1LJz0kRApyB4u8s5pkwO2lIkJv2l?=
 =?iso-8859-1?Q?XFDLa1g381HLRpPumHQ3kAidS6d97dpqUhfZTVuAyLC05Ik3d4gPjQBQ3a?=
 =?iso-8859-1?Q?3AecUCnRWY7jvhuo4AbcQGAmc9PIcl5iWZVuh9lXwYmxoTjjjGkQcb4915?=
 =?iso-8859-1?Q?QV8qnC6B5VB5znXPz17yS2ffYpDuzguA56jMLpFjjvBJIu/jlJ80nAqcBH?=
 =?iso-8859-1?Q?WI4MjgKutz+/SP65BAYME9Pp1I8+kfnvjfLYPcj1x7G81Ck=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SN6PR12MB4623F8A1707C870938E08140EADA9SN6PR12MB4623namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47d3702b-40a3-4d60-9f91-08d977d35443
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2021 22:59:38.4129 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2pr0TZWouXAqlKaN4uHboNIMRnIfjyMPHGv2CHTcEfSQs9e1zxP/yDfEtd5E6mRmrZrT+gW+ZpzwPJHTArEavg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4381
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

--_000_SN6PR12MB4623F8A1707C870938E08140EADA9SN6PR12MB4623namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

AFAIK this one is independent.

Christian, can you confirm ?

Andrey
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Alex Deu=
cher <alexdeucher@gmail.com>
Sent: 14 September 2021 15:33
To: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com>
Cc: Liu, Monk <Monk.Liu@amd.com>; amd-gfx list <amd-gfx@lists.freedesktop.o=
rg>; Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/sched: fix the bug of time out calculation(v4)

Was this fix independent of the other discussions?  Should this be
applied to drm-misc?

Alex

On Wed, Sep 1, 2021 at 4:42 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Wed, Sep 1, 2021 at 2:50 AM Christian K=F6nig
> <ckoenig.leichtzumerken@gmail.com> wrote:
> >
> > Am 01.09.21 um 02:46 schrieb Monk Liu:
> > > issue:
> > > in cleanup_job the cancle_delayed_work will cancel a TO timer
> > > even the its corresponding job is still running.
> > >
> > > fix:
> > > do not cancel the timer in cleanup_job, instead do the cancelling
> > > only when the heading job is signaled, and if there is a "next" job
> > > we start_timeout again.
> > >
> > > v2:
> > > further cleanup the logic, and do the TDR timer cancelling if the sig=
naled job
> > > is the last one in its scheduler.
> > >
> > > v3:
> > > change the issue description
> > > remove the cancel_delayed_work in the begining of the cleanup_job
> > > recover the implement of drm_sched_job_begin.
> > >
> > > v4:
> > > remove the kthread_should_park() checking in cleanup_job routine,
> > > we should cleanup the signaled job asap
> > >
> > > TODO:
> > > 1)introduce pause/resume scheduler in job_timeout to serial the handl=
ing
> > > of scheduler and job_timeout.
> > > 2)drop the bad job's del and insert in scheduler due to above seriali=
zation
> > > (no race issue anymore with the serialization)
> > >
> > > tested-by: jingwen <jingwen.chen@@amd.com>
> > > Signed-off-by: Monk Liu <Monk.Liu@amd.com>
> >
> > Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>
> >
>
> Are you planning to push this to drm-misc?
>
> Alex
>
>
> > > ---
> > >   drivers/gpu/drm/scheduler/sched_main.c | 26 +++++++++--------------=
---
> > >   1 file changed, 9 insertions(+), 17 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm=
/scheduler/sched_main.c
> > > index a2a9536..3e0bbc7 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -676,15 +676,6 @@ drm_sched_get_cleanup_job(struct drm_gpu_schedul=
er *sched)
> > >   {
> > >       struct drm_sched_job *job, *next;
> > >
> > > -     /*
> > > -      * Don't destroy jobs while the timeout worker is running  OR t=
hread
> > > -      * is being parked and hence assumed to not touch pending_list
> > > -      */
> > > -     if ((sched->timeout !=3D MAX_SCHEDULE_TIMEOUT &&
> > > -         !cancel_delayed_work(&sched->work_tdr)) ||
> > > -         kthread_should_park())
> > > -             return NULL;
> > > -
> > >       spin_lock(&sched->job_list_lock);
> > >
> > >       job =3D list_first_entry_or_null(&sched->pending_list,
> > > @@ -693,17 +684,21 @@ drm_sched_get_cleanup_job(struct drm_gpu_schedu=
ler *sched)
> > >       if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
> > >               /* remove job from pending_list */
> > >               list_del_init(&job->list);
> > > +
> > > +             /* cancel this job's TO timer */
> > > +             cancel_delayed_work(&sched->work_tdr);
> > >               /* make the scheduled timestamp more accurate */
> > >               next =3D list_first_entry_or_null(&sched->pending_list,
> > >                                               typeof(*next), list);
> > > -             if (next)
> > > +
> > > +             if (next) {
> > >                       next->s_fence->scheduled.timestamp =3D
> > >                               job->s_fence->finished.timestamp;
> > > -
> > > +                     /* start TO timer for next job */
> > > +                     drm_sched_start_timeout(sched);
> > > +             }
> > >       } else {
> > >               job =3D NULL;
> > > -             /* queue timeout for next job */
> > > -             drm_sched_start_timeout(sched);
> > >       }
> > >
> > >       spin_unlock(&sched->job_list_lock);
> > > @@ -791,11 +786,8 @@ static int drm_sched_main(void *param)
> > >                                         (entity =3D drm_sched_select_=
entity(sched))) ||
> > >                                        kthread_should_stop());
> > >
> > > -             if (cleanup_job) {
> > > +             if (cleanup_job)
> > >                       sched->ops->free_job(cleanup_job);
> > > -                     /* queue timeout for next job */
> > > -                     drm_sched_start_timeout(sched);
> > > -             }
> > >
> > >               if (!entity)
> > >                       continue;
> >

--_000_SN6PR12MB4623F8A1707C870938E08140EADA9SN6PR12MB4623namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<div>AFAIK this one is independent.</div>
<div><br>
</div>
<div>Christian, can you confirm ?</div>
<div><br>
</div>
<div>Andrey</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Alex Deucher &lt;alexdeucher@=
gmail.com&gt;<br>
<b>Sent:</b> 14 September 2021 15:33<br>
<b>To:</b> Christian K=F6nig &lt;ckoenig.leichtzumerken@gmail.com&gt;<br>
<b>Cc:</b> Liu, Monk &lt;Monk.Liu@amd.com&gt;; amd-gfx list &lt;amd-gfx@lis=
ts.freedesktop.org&gt;; Maling list - DRI developers &lt;dri-devel@lists.fr=
eedesktop.org&gt;<br>
<b>Subject:</b> Re: [PATCH 1/2] drm/sched: fix the bug of time out calculat=
ion(v4)</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Was this fix independent of the other discussions?=
&nbsp; Should this be<br>
applied to drm-misc?<br>
<br>
Alex<br>
<br>
On Wed, Sep 1, 2021 at 4:42 PM Alex Deucher &lt;alexdeucher@gmail.com&gt; w=
rote:<br>
&gt;<br>
&gt; On Wed, Sep 1, 2021 at 2:50 AM Christian K=F6nig<br>
&gt; &lt;ckoenig.leichtzumerken@gmail.com&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Am 01.09.21 um 02:46 schrieb Monk Liu:<br>
&gt; &gt; &gt; issue:<br>
&gt; &gt; &gt; in cleanup_job the cancle_delayed_work will cancel a TO time=
r<br>
&gt; &gt; &gt; even the its corresponding job is still running.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; fix:<br>
&gt; &gt; &gt; do not cancel the timer in cleanup_job, instead do the cance=
lling<br>
&gt; &gt; &gt; only when the heading job is signaled, and if there is a &qu=
ot;next&quot; job<br>
&gt; &gt; &gt; we start_timeout again.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; v2:<br>
&gt; &gt; &gt; further cleanup the logic, and do the TDR timer cancelling i=
f the signaled job<br>
&gt; &gt; &gt; is the last one in its scheduler.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; v3:<br>
&gt; &gt; &gt; change the issue description<br>
&gt; &gt; &gt; remove the cancel_delayed_work in the begining of the cleanu=
p_job<br>
&gt; &gt; &gt; recover the implement of drm_sched_job_begin.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; v4:<br>
&gt; &gt; &gt; remove the kthread_should_park() checking in cleanup_job rou=
tine,<br>
&gt; &gt; &gt; we should cleanup the signaled job asap<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; TODO:<br>
&gt; &gt; &gt; 1)introduce pause/resume scheduler in job_timeout to serial =
the handling<br>
&gt; &gt; &gt; of scheduler and job_timeout.<br>
&gt; &gt; &gt; 2)drop the bad job's del and insert in scheduler due to abov=
e serialization<br>
&gt; &gt; &gt; (no race issue anymore with the serialization)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; tested-by: jingwen &lt;jingwen.chen@@amd.com&gt;<br>
&gt; &gt; &gt; Signed-off-by: Monk Liu &lt;Monk.Liu@amd.com&gt;<br>
&gt; &gt;<br>
&gt; &gt; Reviewed-by: Christian K=F6nig &lt;christian.koenig@amd.com&gt;<b=
r>
&gt; &gt;<br>
&gt;<br>
&gt; Are you planning to push this to drm-misc?<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;&nbsp;&nbsp; drivers/gpu/drm/scheduler/sched_main.c | 26 ++++=
+++++-----------------<br>
&gt; &gt; &gt;&nbsp;&nbsp; 1 file changed, 9 insertions(+), 17 deletions(-)=
<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/driver=
s/gpu/drm/scheduler/sched_main.c<br>
&gt; &gt; &gt; index a2a9536..3e0bbc7 100644<br>
&gt; &gt; &gt; --- a/drivers/gpu/drm/scheduler/sched_main.c<br>
&gt; &gt; &gt; +++ b/drivers/gpu/drm/scheduler/sched_main.c<br>
&gt; &gt; &gt; @@ -676,15 +676,6 @@ drm_sched_get_cleanup_job(struct drm_gp=
u_scheduler *sched)<br>
&gt; &gt; &gt;&nbsp;&nbsp; {<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_sched_job *jo=
b, *next;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Don't destroy jobs while t=
he timeout worker is running&nbsp; OR thread<br>
&gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * is being parked and hence =
assumed to not touch pending_list<br>
&gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp; if ((sched-&gt;timeout !=3D MAX_SC=
HEDULE_TIMEOUT &amp;&amp;<br>
&gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !cancel_de=
layed_work(&amp;sched-&gt;work_tdr)) ||<br>
&gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kthread_sh=
ould_park())<br>
&gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; return NULL;<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin_lock(&amp;sched-&gt=
;job_list_lock);<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; job =3D list_first_entry=
_or_null(&amp;sched-&gt;pending_list,<br>
&gt; &gt; &gt; @@ -693,17 +684,21 @@ drm_sched_get_cleanup_job(struct drm_g=
pu_scheduler *sched)<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (job &amp;&amp; dma_f=
ence_is_signaled(&amp;job-&gt;s_fence-&gt;finished)) {<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; /* remove job from pending_list */<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; list_del_init(&amp;job-&gt;list);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; /* cancel this job's TO timer */<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; cancel_delayed_work(&amp;sched-&gt;work_tdr);<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; /* make the scheduled timestamp more accurate */<br=
>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; next =3D list_first_entry_or_null(&amp;sched-&gt;pe=
nding_list,<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; typeof(*n=
ext), list);<br>
&gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; if (next)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; if (next) {<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nex=
t-&gt;s_fence-&gt;scheduled.timestamp =3D<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; job-&gt;s_fence-&gt;finished.t=
imestamp;<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* start TO t=
imer for next job */<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_sched_sta=
rt_timeout(sched);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; }<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; job =3D NULL;<br>
&gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; /* queue timeout for next job */<br>
&gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; drm_sched_start_timeout(sched);<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin_unlock(&amp;sched-&=
gt;job_list_lock);<br>
&gt; &gt; &gt; @@ -791,11 +786,8 @@ static int drm_sched_main(void *param)<=
br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (entity =3D drm_sched_select_entity(sched))) =
||<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; kthread_should_stop());<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; if (cleanup_job) {<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; if (cleanup_job)<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sch=
ed-&gt;ops-&gt;free_job(cleanup_job);<br>
&gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* queue time=
out for next job */<br>
&gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_sched_sta=
rt_timeout(sched);<br>
&gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; }<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; if (!entity)<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; con=
tinue;<br>
&gt; &gt;<br>
</div>
</span></font></div>
</body>
</html>

--_000_SN6PR12MB4623F8A1707C870938E08140EADA9SN6PR12MB4623namp_--
