Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 273CA6D3791
	for <lists+dri-devel@lfdr.de>; Sun,  2 Apr 2023 13:20:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A51110E2E5;
	Sun,  2 Apr 2023 11:20:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 388 seconds by postgrey-1.36 at gabe;
 Sun, 02 Apr 2023 11:20:43 UTC
Received: from lynxeye.de (ns.lynxeye.de [87.118.118.114])
 by gabe.freedesktop.org (Postfix) with ESMTP id 60DF510E2E5;
 Sun,  2 Apr 2023 11:20:43 +0000 (UTC)
Received: by lynxeye.de (Postfix, from userid 501)
 id D153DE74004; Sun,  2 Apr 2023 13:13:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on lynxeye.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham version=3.3.1
Received: from [192.168.178.22] (a89-183-231-124.net-htp.de [89.183.231.124])
 by lynxeye.de (Postfix) with ESMTPSA id 510DFE74004;
 Sun,  2 Apr 2023 13:13:42 +0200 (CEST)
Message-ID: <3c1d4d055df1b75c757956b47b77a23a9edcf842.camel@lynxeye.de>
Subject: Re: [PATCH 0/3] drm/lima: expose usage statistics via fdinfo
From: Lucas Stach <dev@lynxeye.de>
To: Qiang Yu <yuq825@gmail.com>, Erico Nunes <nunes.erico@gmail.com>
Date: Sun, 02 Apr 2023 13:13:41 +0200
In-Reply-To: <CAKGbVbtb-cKv2Fb1x91vZssZxayxciSp3RLJeVsn0z1JhvT6QQ@mail.gmail.com>
References: <20230312233052.21095-1-nunes.erico@gmail.com>
 <CAKGbVbs2ZRGyYOy9yYUMJ+apQm=NaXXb58C-97CaoTe5KPNqgw@mail.gmail.com>
 <CAKGbVbtb-cKv2Fb1x91vZssZxayxciSp3RLJeVsn0z1JhvT6QQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Sonntag, dem 02.04.2023 um 18:22 +0800 schrieb Qiang Yu:
> Applied to drm-misc-next.
>=20
"df622729ddbf drm/scheduler: track GPU active time per entity" had to
be reverted due to it introducing a use after free. I guess this
patchset now conflicts with the revert.

Regards,
Lucas

> On Mon, Mar 13, 2023 at 11:09=E2=80=AFAM Qiang Yu <yuq825@gmail.com> wrot=
e:
> >=20
> > Patch set is:
> > Reviewed-by: Qiang Yu <yuq825@gmail.com>
> >=20
> > Looks like drm-misc-next does not contain "df622729ddbf drm/scheduler:
> > track GPU active time per entity" yet.
> > Will apply later.
> >=20
> > Regards,
> > Qiang
> >=20
> > On Mon, Mar 13, 2023 at 7:31=E2=80=AFAM Erico Nunes <nunes.erico@gmail.=
com> wrote:
> > >=20
> > > Expose lima gp and pp usage stats through fdinfo, following
> > > Documentation/gpu/drm-usage-stats.rst.
> > > Borrowed from these previous implementations:
> > >=20
> > > "df622729ddbf drm/scheduler: track GPU active time per entity" added
> > > usage time accounting to drm scheduler, which is where the data used
> > > here comes from.
> > >=20
> > > Then the main implementation is based on these etnaviv commits:
> > > "d306788b6e1b drm/etnaviv: allocate unique ID per drm_file" and
> > > "97804a133c68 drm/etnaviv: export client GPU usage statistics via
> > > fdinfo"
> > >=20
> > > Also "874442541133 drm/amdgpu: Add show_fdinfo() interface" since lim=
a
> > > has a context manager very similar to amdgpu and all contexts created
> > > (and released) at the ctx_mgr level need to be accounted for.
> > >=20
> > > Tested with the generic "gputop" tool currently available as patches =
to
> > > igt, a sample run with this patchset looks like this:
> > >=20
> > > DRM minor 128
> > >     PID               NAME             gp                        pp
> > >     4322   glmark2-es2-way |=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=
=96=88=E2=96=8A                  ||=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=
=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=
=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88      |
> > >     3561            weston |=E2=96=8E                       ||=E2=96=
=88=E2=96=88=E2=96=88=E2=96=8C                    |
> > >     4159          Xwayland |=E2=96=8F                       ||=E2=96=
=89                       |
> > >     4154          glxgears |=E2=96=8F                       ||=E2=96=
=8E                       |
> > >     3661           firefox |=E2=96=8F                       ||=E2=96=
=8F                       |
> > >=20
> > >=20
> > > Erico Nunes (3):
> > >   drm/lima: add usage counting method to ctx_mgr
> > >   drm/lima: allocate unique id per drm_file
> > >   drm/lima: add show_fdinfo for drm usage stats
> > >=20
> > >  drivers/gpu/drm/lima/lima_ctx.c    | 30 ++++++++++++++++++++-
> > >  drivers/gpu/drm/lima/lima_ctx.h    |  3 +++
> > >  drivers/gpu/drm/lima/lima_device.h |  3 +++
> > >  drivers/gpu/drm/lima/lima_drv.c    | 43 ++++++++++++++++++++++++++++=
+-
> > >  drivers/gpu/drm/lima/lima_drv.h    |  1 +
> > >  5 files changed, 78 insertions(+), 2 deletions(-)
> > >=20
> > > --
> > > 2.39.2
> > >=20

