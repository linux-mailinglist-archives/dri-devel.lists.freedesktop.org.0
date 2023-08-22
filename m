Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08174784249
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 15:43:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B96510E36B;
	Tue, 22 Aug 2023 13:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16BA310E062
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 13:43:30 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-523bf06f7f8so5401698a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 06:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf.com; s=google; t=1692711808; x=1693316608;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oB2a41GXxzn1Id0Tgjq4GLJ6fIScP+igA47mG2t0frw=;
 b=a2VzzHQ6YNgVbW8erw+fyUrFdglXt5s2jyRHuiNGTKapru2gGj6kgVDaQjmA1s0wZ2
 nDa6padS911K5gKiOmUTviU8y7V8mCgBLyXnYtLaE1iVI73pytW+z3gommr+7ctF2x7C
 /zuDIv4qcPOnwLLNp4+UbIWqj1UTjZ+pZdb5av5ddqK8pI5L5jmMxtjf35x1pYEl0AS7
 kCu434ANgLlsELkIk89SEwwBbOBJhohiVPADQNj8ociya3r0ZpMWOzhiAoZx7rskzeqh
 dDyTPkEADoBp+uvO+D6VWYkeRt5JYHeADAbTwsLAUszWf0uKhUnTDrR4sLclTBTsYr8q
 QBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692711808; x=1693316608;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oB2a41GXxzn1Id0Tgjq4GLJ6fIScP+igA47mG2t0frw=;
 b=OOO9h0tM450avRvUGLl47Ib91mVR3sq0NfjXdzsJYoDZxze2aE6lk/MRlhrG6YLJvd
 TLQZa0PBaw0UUv6ouDCgRpdhdCABYxuN+McMPW8oqPC76oA9y3lZZQaILKadcAno9Nzh
 T6KUuGJr+WE8D2SITjFs+VfJaF3UqmkrmYJPCygRsDohVYAy8YqGH/j1D28NbntvkK5/
 rl4wtPlS+pdlqMY/0mW5XWkObE2vS6sv//sVoMPSUZ1oogcCyponAtx9xPOgDhTXI5bj
 WvMKXDLg5GRJ1Z4TN2xbTwzWE3I/sCS0v8QDhm5JFGHMnYk0s9PWWxzIbv15MaWwvgVT
 3aug==
X-Gm-Message-State: AOJu0Yyy6u8UmpbIcwhXYD1jGhtMNEoXPChKtuR4J7pfKTiDT79mSauA
 DWorwscaeTaEFLzH5rWWU5K5oI3XeBTVpO/pFH867A==
X-Google-Smtp-Source: AGHT+IFuIGlEfKcbbAirIBcV0EgvfOKew4RdmMeTahSVUW7XJtHdhn24ksoo+3DQfHLzrcArdfWPzwJyl/u5egbGtxM=
X-Received: by 2002:a17:906:2250:b0:99b:ed18:7a10 with SMTP id
 16-20020a170906225000b0099bed187a10mr7594326ejr.36.1692711807977; Tue, 22 Aug
 2023 06:43:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230803092308.79197-1-lma@semihalf.com>
 <CAFJ_xbqoVjXQXJZ0krbsRqUOe3hLNubi12r_q=idSgkfeV=LRQ@mail.gmail.com>
In-Reply-To: <CAFJ_xbqoVjXQXJZ0krbsRqUOe3hLNubi12r_q=idSgkfeV=LRQ@mail.gmail.com>
From: =?UTF-8?Q?Rados=C5=82aw_Biernacki?= <rad@semihalf.com>
Date: Tue, 22 Aug 2023 15:43:11 +0200
Message-ID: <CAOs-w0JZpq2toJBmEKQ500Jtsvwr1GAvDnk2nHiDVF=jwMjSJw@mail.gmail.com>
Subject: Re: [PATCH] drm/dp_mst: Fix NULL deref in
 get_mst_branch_device_by_guid_helper()
To: Lukasz Majczak <lma@semihalf.com>
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
Cc: upstream@semihalf.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

=C5=9Br., 16 sie 2023 o 11:08 Lukasz Majczak <lma@semihalf.com> napisa=C5=
=82(a):
>
> czw., 3 sie 2023 o 11:23 Lukasz Majczak <lma@semihalf.com> napisa=C5=82(a=
):
> >
> > Check mgr->mst_primary, before passing it to
> > the get_mst_branch_device_by_guid_helper(), otherwise NULL dereference
> > may occur in the call to memcpy() and cause:
> >
> > [12579.365869] BUG: kernel NULL pointer dereference, address: 000000000=
0000049
> > [12579.365878] #PF: supervisor read access in kernel mode
> > [12579.365880] #PF: error_code(0x0000) - not-present page
> > [12579.365882] PGD 0 P4D 0
> > [12579.365887] Oops: 0000 [#1] PREEMPT SMP NOPTI
> > ...
> > [12579.365895] Workqueue: events_long drm_dp_mst_up_req_work
> > [12579.365899] RIP: 0010:memcmp+0xb/0x29
> > [12579.365921] Call Trace:
> > [12579.365927] get_mst_branch_device_by_guid_helper+0x22/0x64
> > [12579.365930] drm_dp_mst_up_req_work+0x137/0x416
> > [12579.365933] process_one_work+0x1d0/0x419
> > [12579.365935] worker_thread+0x11a/0x289
> > [12579.365938] kthread+0x13e/0x14f
> > [12579.365941] ? process_one_work+0x419/0x419
> > [12579.365943] ? kthread_blkcg+0x31/0x31
> > [12579.365946] ret_from_fork+0x1f/0x30
> >
> > Similar check is done in e.g: drm_dp_mst_topology_get_mstb_validated().
> >
> > Fixes: 5e93b8208d3c ("drm/dp/mst: move GUID storage from mgr, port to o=
nly mst branch")
> > Cc: <stable@vger.kernel.org> # 4.14+
> > Signed-off-by: Lukasz Majczak <lma@semihalf.com>
> > ---
> >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gp=
u/drm/display/drm_dp_mst_topology.c
> > index ed96cfcfa304..703cd97b1d11 100644
> > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > @@ -2595,19 +2595,19 @@ static struct drm_dp_mst_branch *
> >  drm_dp_get_mst_branch_device_by_guid(struct drm_dp_mst_topology_mgr *m=
gr,
> >                                      const uint8_t *guid)
> >  {
> > -       struct drm_dp_mst_branch *mstb;
> > +       struct drm_dp_mst_branch *mstb =3D NULL;
> >         int ret;
> >
> >         /* find the port by iterating down */
> >         mutex_lock(&mgr->lock);
> > -
> > -       mstb =3D get_mst_branch_device_by_guid_helper(mgr->mst_primary,=
 guid);
> > -       if (mstb) {
> > -               ret =3D drm_dp_mst_topology_try_get_mstb(mstb);
> > -               if (!ret)
> > -                       mstb =3D NULL;
> > +       if (mgr->mst_primary) {

One suggestion which just came to my mind:
get_mst_branch_device_by_guid_helper() is a recursive function.
This condition might be moved to the inside of that function as the first l=
ine.
This way we would have a single condition, meaning remove a similar
one for step over of NULL elements inside a recursive call so NULL
would be an acceptable value as param and therefore no need to check
for this here.

> > +               mstb =3D get_mst_branch_device_by_guid_helper(mgr->mst_=
primary, guid);
> > +               if (mstb) {
> > +                       ret =3D drm_dp_mst_topology_try_get_mstb(mstb);
> > +                       if (!ret)
> > +                               mstb =3D NULL;
> > +               }
> >         }
> > -
> >         mutex_unlock(&mgr->lock);
> >         return mstb;
> >  }
> > --
> > 2.41.0.640.ga95def55d0-goog
> >
> Hi,
>
> Is there anything more I should do regarding these changes?
>
> Best regards,
> Lukasz
