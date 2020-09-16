Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C738E26C437
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 17:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D0A6EA3A;
	Wed, 16 Sep 2020 15:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242986EA37
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 15:31:43 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id j2so7377320wrx.7
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 08:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=9cI/Q3uj4XukmIC4z8WNHvSj/a5e8kMejOwJHwyLhrU=;
 b=AM+EYquCzfIKg9LA8lupSx3x3fv80mV8XsdCao572x7y+f/jTyZhXBwzrc0WjnQou8
 LrCfZ50AraT6NxKKEryKLx4mXtBR5VtT4qys9tKcbvpyx2AL35v5k0GhLaNw/8gavSU8
 IsuN1Obfj09QlPgHgTIBmdOQvsn9a1XVQaKgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=9cI/Q3uj4XukmIC4z8WNHvSj/a5e8kMejOwJHwyLhrU=;
 b=TIVpX3Q5Z6caS3SEc4ryWoce0Yd24UZj5Mk11kjqVCV8J0dmxeH3JGrnCCa+MlUYTg
 snsRGssEz/d1OdwOCtk8xTxhg7O6FjriltMPFpp2s8GuEzT6PQL9Tjg+39pHTUgAc2rA
 DsVrAkJCJIspvdaeM5+2HR6jh3puieRopK0dv08eZCFxdFlRE08uz8zLfwL/V9nAfGpC
 r74TiNlavTLo3eBNE1JEvUdp42rpWEv8Kfzd2yBDiyNn+fVQmrw2hFdrtTXoEW5v7Y3q
 vYWXF7VZhB4iEQrF/0ty6trkgCGOdqj3fl136VC93DR4lMa90OJOPUgNqF+1NVjb00jc
 4uog==
X-Gm-Message-State: AOAM530aAkCt3n6V3KGqdmowyo3lmJbGvI0wpw0NLvS8vjK+YGXytteB
 PbttlbSQg8kHn0YMroGtCCbVIw==
X-Google-Smtp-Source: ABdhPJzS3ONUGxvj8D+IIvQbIM66/m0KNy7Rh9Y4UxkZuG8AIJ3dk9r1W8t5jYlSX5UuYWW6Uyecjw==
X-Received: by 2002:adf:a4cc:: with SMTP id h12mr22069549wrb.123.1600270301723; 
 Wed, 16 Sep 2020 08:31:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z15sm32992374wrv.94.2020.09.16.08.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 08:31:40 -0700 (PDT)
Date: Wed, 16 Sep 2020 17:31:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH -next 0/8] drm/amd/amdgpu: fix comparison pointer to bool
 warning
Message-ID: <20200916153138.GR438822@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 Alex Deucher <alexdeucher@gmail.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 yi.zhang@huawei.com, Dave Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Zheng Bin <zhengbin13@huawei.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>
References: <20200909130720.105234-1-zhengbin13@huawei.com>
 <1fce0f2a-3777-e6d8-5a09-30261f843cfd@amd.com>
 <CADnq5_NoeFbBAMT6s_ictVXsUc2tx1U48MLxnMbAr2Sd58jyYA@mail.gmail.com>
 <20200915193549.GP6112@intel.com>
 <6658f89f-6957-e6ea-af41-7625f1fd3cb1@gmail.com>
 <20200916075156.GU438822@phenom.ffwll.local>
 <CADnq5_OS814FxmadZ9yBkrY6ije8h7FxswWstsxNr3rw=Bum=Q@mail.gmail.com>
 <372d7001-22cc-79b6-83b8-2fd75a1804d5@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <372d7001-22cc-79b6-83b8-2fd75a1804d5@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: yi.zhang@huawei.com, Dave Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Zheng Bin <zhengbin13@huawei.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 16, 2020 at 04:02:18PM +0200, Christian K=F6nig wrote:
> Am 16.09.20 um 15:36 schrieb Alex Deucher:
> > On Wed, Sep 16, 2020 at 3:51 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > On Wed, Sep 16, 2020 at 09:38:34AM +0200, Christian K=F6nig wrote:
> > > > Am 15.09.20 um 21:35 schrieb Ville Syrj=E4l=E4:
> > > > > On Tue, Sep 15, 2020 at 03:16:32PM -0400, Alex Deucher wrote:
> > > > > > I question the value of these warnings.  Why even have a boolea=
n type
> > > > > > if you are going to get warnings when you use them...
> > > > > > That said, applied to avoid getting these patches again and aga=
in
> > > > > > every time someone sees this.
> > > > > if (this_is_sparta)
> > > > > if (this_is_sparta =3D=3D true)
> > > > > if (this_is_sparta !=3D false)
> > > > > =

> > > > > I think the first one reads the best, and avoids having to
> > > > > decide between truth and falsehood :)
> > > > +1
> > > +1, especially because we also have the inversion when using negative
> > > errno codes for failures and 0 as success, which results in
> > > =

> > >          if (errno =3D=3D 0) /* success case */
> > > =

> > > but
> > >          if (bool =3D=3D 0) /* failure case */
> > > =

> > > now creative people do sometimes
> > > =

> > >          if (!errno) /* success case */
> > > =

> > > which I think is horribly confusing. So imo for more easier telling a=
part
> > > of these too I think consistently using the short form for booleans, =
and
> > > consistently using the more explicit long form for errno checks is a =
Very
> > > Good Pattern :-)
> > I don't disagree with your logic, but we regularly get patches to
> > convert errno checks to drop the direct comparison because that is the
> > "preferred kernel style".  Arguably, we should be explicit in all
> > cases as that avoids all confusion.  With that in mind, my original
> > point stands.  Why have a type when comparisons against valid settings
> > for that type produce errors?

Oh, I didn't know that this happens for errno too.

I withdraw my +1 and concur this is a bikeshed. I guess still applying to
shut up the patch stream is the most reasonable thing :-/
-Daniel

> Well it isn't an error, but raising a nice warning is most likely a good
> idea.

> =

> Christian.
> =

> > =

> > Alex
> > =

> > > Cheers, Daniel
> > > =

> > > > Christian.
> > > > =

> > > > > > Alex
> > > > > > =

> > > > > > On Wed, Sep 9, 2020 at 9:21 AM Christian K=F6nig <christian.koe=
nig@amd.com> wrote:
> > > > > > > Acked-by: Christian K=F6nig <christian.koenig@amd.com> for th=
e series.
> > > > > > > =

> > > > > > > Am 09.09.20 um 15:07 schrieb Zheng Bin:
> > > > > > > > Zheng Bin (8):
> > > > > > > >      drm/amd/amdgpu: fix comparison pointer to bool warning=
 in gfx_v9_0.c
> > > > > > > >      drm/amd/amdgpu: fix comparison pointer to bool warning=
 in gfx_v10_0.c
> > > > > > > >      drm/amd/amdgpu: fix comparison pointer to bool warning=
 in sdma_v5_0.c
> > > > > > > >      drm/amd/amdgpu: fix comparison pointer to bool warning=
 in sdma_v5_2.c
> > > > > > > >      drm/amd/amdgpu: fix comparison pointer to bool warning=
 in si.c
> > > > > > > >      drm/amd/amdgpu: fix comparison pointer to bool warning=
 in uvd_v6_0.c
> > > > > > > >      drm/amd/amdgpu: fix comparison pointer to bool warning=
 in
> > > > > > > >        amdgpu_atpx_handler.c
> > > > > > > >      drm/amd/amdgpu: fix comparison pointer to bool warning=
 in sdma_v4_0.c
> > > > > > > > =

> > > > > > > >     drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c | 4 ++=
--
> > > > > > > >     drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c           | 2 +-
> > > > > > > >     drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c            | 2 +-
> > > > > > > >     drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c           | 4 ++=
--
> > > > > > > >     drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c           | 2 +-
> > > > > > > >     drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c           | 2 +-
> > > > > > > >     drivers/gpu/drm/amd/amdgpu/si.c                  | 2 +-
> > > > > > > >     drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c            | 4 ++=
--
> > > > > > > >     8 files changed, 11 insertions(+), 11 deletions(-)
> > > > > > > > =

> > > > > > > > --
> > > > > > > > 2.26.0.106.g9fadedd
> > > > > > > > =

> > > > > > > _______________________________________________
> > > > > > > amd-gfx mailing list
> > > > > > > amd-gfx@lists.freedesktop.org
> > > > > > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3=
A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D02%7=
C01%7Cchristian.koenig%40amd.com%7Cdc7a8d7517d341e3a80c08d85a458ba8%7C3dd89=
61fe4884e608e11a82d994e183d%7C0%7C0%7C637358602051676053&amp;sdata=3DMS0vcB=
cU7unXjEFlbd8kLbJkJ4sKcvIdLjc8yhX4UUI%3D&amp;reserved=3D0
> > > > > > _______________________________________________
> > > > > > dri-devel mailing list
> > > > > > dri-devel@lists.freedesktop.org
> > > > > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D02%7=
C01%7Cchristian.koenig%40amd.com%7Cdc7a8d7517d341e3a80c08d85a458ba8%7C3dd89=
61fe4884e608e11a82d994e183d%7C0%7C0%7C637358602051686051&amp;sdata=3DMgfR%2=
BwCVY9gWfhQ9i5kWcKiiYkV1C8O2dEKlZYSqscE%3D&amp;reserved=3D0
> > > > _______________________________________________
> > > > dri-devel mailing list
> > > > dri-devel@lists.freedesktop.org
> > > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D02%7C01%=
7Cchristian.koenig%40amd.com%7Cdc7a8d7517d341e3a80c08d85a458ba8%7C3dd8961fe=
4884e608e11a82d994e183d%7C0%7C0%7C637358602051686051&amp;sdata=3DMgfR%2BwCV=
Y9gWfhQ9i5kWcKiiYkV1C8O2dEKlZYSqscE%3D&amp;reserved=3D0
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fbl=
og.ffwll.ch%2F&amp;data=3D02%7C01%7Cchristian.koenig%40amd.com%7Cdc7a8d7517=
d341e3a80c08d85a458ba8%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6373586=
02051686051&amp;sdata=3DGvLs5OXw2Ny%2BieJxm8hjawNb0rGA966539iAwlWwPMY%3D&am=
p;reserved=3D0
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
