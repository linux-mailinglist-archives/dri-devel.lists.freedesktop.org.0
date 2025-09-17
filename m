Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA61FB7CEB3
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2775A10E422;
	Wed, 17 Sep 2025 07:25:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="jrv27L5J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2497110E422
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 07:25:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 87B8FC8F473;
 Wed, 17 Sep 2025 07:25:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D65826063E;
 Wed, 17 Sep 2025 07:25:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DC40D102F179E; 
 Wed, 17 Sep 2025 09:25:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1758093922; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=GZJ8sPcO3Cf+QQuAdpx3fIteLOXORrAouzZNLpZWsvA=;
 b=jrv27L5Jlz6dFN0ujcqzXwnK9gIQ1V0dU4tBuCf7OAqdaZnjc+2nbXry5EnSBiMZaAbLom
 wVs2Vf2NuaQszYM42A4SDHQ05Sj1/hMzk3EaNUmjjfUauDW/2rzgXhkgINxRtunslVub4l
 DPzS0A9pFPlibNVRTWdiauuPeWqDO8rAQhXtCdkSCKYboxRBUz4WJcwwWjO/q8aR8Vd71Z
 iTbiTGCmU+bnx+SqevI3I5XDZuMrB+uaOd8hLDjJbkoeiC9bGLBpk7ygAhXsTFp9rFBDK9
 2lY9ODIJng2lK1cHK/jbGHlwJhwpLbaydfsVka6ga0llgK4aNRWk+xlAU2QRrA==
Date: Wed, 17 Sep 2025 09:25:06 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding
 <treding@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Jonathan
 Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni
 <skomatineni@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Prashant Gaikwad
 <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Osipenko
 <digetx@gmail.com>, Jonas =?UTF-8?B?U2Nod8O2YmVs?=
 <jonasschwoebel@yahoo.de>, Charan Pedumuru <charan.pedumuru@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 11/23] staging: media: tegra-video: csi: add a check
 to tegra_channel_get_remote_csi_subdev
Message-ID: <20250917092506.311c314c@booty>
In-Reply-To: <CAPVz0n1Nvun5yBf_i3NB=kDmLfNFRjbFt1uTUW-hpLbp-h0g4w@mail.gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
 <20250906135345.241229-12-clamor95@gmail.com>
 <20250916180418.3fa270a9@booty>
 <CAPVz0n1Nvun5yBf_i3NB=kDmLfNFRjbFt1uTUW-hpLbp-h0g4w@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
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

Hello Svyatoslav,

On Tue, 16 Sep 2025 19:24:52 +0300
Svyatoslav Ryhel <clamor95@gmail.com> wrote:

> =D0=B2=D1=82, 16 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 19:04 Lu=
ca Ceresoli <luca.ceresoli@bootlin.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > Hello Svyatoslav,
> >
> > On Sat,  6 Sep 2025 16:53:32 +0300
> > Svyatoslav Ryhel <clamor95@gmail.com> wrote:
> > =20
> > > By default tegra_channel_get_remote_csi_subdev returns next device in=
 pipe
> > > assuming it is CSI but in case of Tegra20 and Tegra30 it can also be =
VIP
> > > or even HOST. Lets check if returned device is actually CSI by compar=
ing
> > > subdevice operations. =20
> >
> > This is just for extra safety, or is there a real case where the lack
> > of this check creates some issues in your use case?
> > =20
> > > --- a/drivers/staging/media/tegra-video/csi.c
> > > +++ b/drivers/staging/media/tegra-video/csi.c
> > > @@ -445,6 +445,22 @@ static const struct v4l2_subdev_ops tegra_csi_op=
s =3D {
> > >       .pad    =3D &tegra_csi_pad_ops,
> > >  };
> > >
> > > +struct v4l2_subdev *tegra_channel_get_remote_csi_subdev(struct tegra=
_vi_channel *chan)
> > > +{
> > > +     struct media_pad *pad;
> > > +     struct v4l2_subdev *subdev;
> > > +
> > > +     pad =3D media_pad_remote_pad_first(&chan->pad);
> > > +     if (!pad)
> > > +             return NULL;
> > > +
> > > +     subdev =3D media_entity_to_v4l2_subdev(pad->entity);
> > > +     if (!subdev)
> > > +             return NULL;
> > > +
> > > +     return subdev->ops =3D=3D &tegra_csi_ops ? subdev : NULL;
> > > +} =20
> >
> > I tested your series on a Tegra20 with a parallel camera, so using the
> > VIP for parallel input.
> >
> > The added check on subdev->ops breaks probing the video device:
> >
> >   tegra-vi 54080000.vi: failed to setup channel controls: -19
> >   tegra-vi 54080000.vi: failed to register channel 0 notifier: -19
> >
> > This is because tegra20_chan_capture_kthread_start() is also calling
> > tegra_channel_get_remote_csi_subdev(), but when using VIP subdev->ops
> > points to tegra_vip_ops, not tegra_csi_ops.
> > =20
>=20
> Your assumption is wrong. 'tegra_channel_get_remote_csi_subdev' is
> designed to get next device which is expected to be CSI, NOT VIP
> (obviously, Tegra210 has no VIP). It seems that VIP implementation did
> not take into account that CSI even exists.

IIRC it's rather the initial VI implementation was meant to be open to
supporting both VIP and CSI but some CSI assumptions sneaked in. Which
is somewhat unavoidable if only CSI could be tested, isn't it? So I had
to change some when adding VIP (trying hard myself to not break CSI and
T210).

>  -19 errors are due to
> tegra_vi_graph_notify_complete not able to get next media device in
> the line. Correct approach would be to add similar helper for VIP and
> check if next device is VIP.

I think it's almost correct.

tegra_channel_get_remote_csi_subdev() is called:
 * in vi.c, where it is expeted to return either a CSI or VIP subdev
 * in tegra210.c, which apparently supports CSI only=20
   (I don't know whether the hardware has parallel input)
 * in tegra20.c [added by patch 23 in this series] where only a CSI
   subdev is wanted

Based on that,  you're right that we need two functions, but they
should be:

 1. one to return the remote subdev, be it CSI or VIP
    a. perhaps called tegra_channel_get_remote_subdev()
    b. perhaps in vi.c
    c. not checking subdev->ops (or checking for csi||vip)
 2. one to return the remote subdev, only if it is CSI
    a. perhaps called tegra_channel_get_remote_csi_subdev()
    b. perhaps in csi.c
    c. checking subdev->ops =3D=3D tegra_csi_ops

The function in mainline as of now complies with 2a, 1b, 1c, so it is a
hybrid.

In other words, what I propose is:

 * rename the current tegra_channel_get_remote_csi_subdev()
   to remove the "_csi" infix, so the name reflects what it does
   - optionally add the check for (csi||vip)
 * add tegra_channel_get_remote_csi_subdev() for where a CSI-only
   subdev is needed: that's exactly the function you are adding to csi.c
   in this patch

Does it look correct?

> Since I have no devices with VIP support
> I could not test this properly.

Of course, no problem. I can test it (but I cannot test CSI).

> I can add this in next iteration if
> you are willing to test.

Yes, please do, thanks.

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
