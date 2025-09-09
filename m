Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 872EEB4A9E3
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 12:13:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3885110E69D;
	Tue,  9 Sep 2025 10:13:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="TSlW3BhB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448F110E69D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 10:13:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id EC3361A0E1B;
 Tue,  9 Sep 2025 10:13:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BD17360630;
 Tue,  9 Sep 2025 10:13:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 73E5D102F2894; 
 Tue,  9 Sep 2025 12:13:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1757412820; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ncdmf1jhLSIzFX+n3bWuOq0zu5sbccap6rdFTbTyrp4=;
 b=TSlW3BhBfGVHzv475bNiMhL8Bw8Af3XCJJTHeL2j78xMN8yMp46G3obLq8qYawvTQ+Z8O/
 6qzCYGbzQEw4iyUDCgRjdPeepGT+ksqfZ2l0FwtHikXZcix/OsxLr1Rg2wLHg70jilqdlO
 5rOAmGcIyiz4VYuU36vecgaQ+lvkfX6ApdRXwREj2aFFzfdOT/hW+BQpe7H5mYrYGSZ4Zq
 XPvT/PKdMkxw+20IuhZprIRd1cmd0Z2uv5nhGSHYthrbUJSf7ZAShC9QKaNQuN9f15CKBm
 6ArHqVKmlB6kCpf8WrEEY45YAgcNExhUyH1uqIBIWMCLEuQUzndLSoe7/1Px1w==
Date: Tue, 9 Sep 2025 12:13:17 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding
 <treding@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Jonathan
 Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni
 <skomatineni@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter De
 Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad
 <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Osipenko
 <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>,
 linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 09/19] staging: media: tegra-video: vi: add flip
 controls only if no source controls are provided
Message-ID: <20250909121317.6f34e2f3@booty>
In-Reply-To: <CAPVz0n0_DJh9M-h5a0bcBA8b6_7vzgOYSktGxAhFzuVncoJhmw@mail.gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <20250819121631.84280-10-clamor95@gmail.com>
 <20250905175915.2d7e02a7@booty>
 <CAPVz0n0_DJh9M-h5a0bcBA8b6_7vzgOYSktGxAhFzuVncoJhmw@mail.gmail.com>
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

On Fri, 5 Sep 2025 19:05:16 +0300
Svyatoslav Ryhel <clamor95@gmail.com> wrote:

> =D0=BF=D1=82, 5 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 18:59 Luc=
a Ceresoli <luca.ceresoli@bootlin.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > Hello Svyatoslav,
> >
> > On Tue, 19 Aug 2025 15:16:21 +0300
> > Svyatoslav Ryhel <clamor95@gmail.com> wrote:
> > =20
> > > Add HFLIP and VFLIP from SoC only if camera sensor does not provide t=
hose
> > > controls.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  drivers/staging/media/tegra-video/vi.c | 9 ++++++---
> > >  1 file changed, 6 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging=
/media/tegra-video/vi.c
> > > index 4f67adc395ac..61b65a2c1436 100644
> > > --- a/drivers/staging/media/tegra-video/vi.c
> > > +++ b/drivers/staging/media/tegra-video/vi.c
> > > @@ -961,6 +961,7 @@ static int tegra_channel_setup_ctrl_handler(struc=
t tegra_vi_channel *chan)
> > >       }
> > >  #else
> > >       struct v4l2_subdev *subdev;
> > > +     struct v4l2_ctrl *hflip, *vflip;
> > >
> > >       /* custom control */
> > >       v4l2_ctrl_new_custom(&chan->ctrl_handler, &syncpt_timeout_ctrl,=
 NULL);
> > > @@ -986,11 +987,13 @@ static int tegra_channel_setup_ctrl_handler(str=
uct tegra_vi_channel *chan)
> > >               return ret;
> > >       }
> > >
> > > -     if (chan->vi->soc->has_h_v_flip) {
> > > +     hflip =3D v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_HFLIP);
> > > +     if (chan->vi->soc->has_h_v_flip && !hflip)
> > >               v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4=
L2_CID_HFLIP, 0, 1, 1, 0);
> > > -             v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4=
L2_CID_VFLIP, 0, 1, 1, 0);
> > > -     }
> > >
> > > +     vflip =3D v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_VFLIP);
> > > +     if (chan->vi->soc->has_h_v_flip && !vflip)
> > > +             v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4=
L2_CID_VFLIP, 0, 1, 1, 0); =20
> >
> > Based on my understanding of V4L2, this should not be done.
> > AFAIK subdevs should expose what the hardware block can do,
> > independently from other subdevs. It is up to userspace (e.g.
> > libcamera) to use the most appropriate control when there are redundant
> > ones.
> > =20
>=20
> This driver is video-centric, interactions are done via /dev/videoX
> not subdevices like media-centric derivers do. Conversion is possible
> but it is not scope of this patchset and in case such conversion takes
> place, one who will do that, will definitely know what to do.
> Video-centric drivers expose all controls within single video device
> and it cannot hold duplicates of controls, this causes error. So this
> solution exposes camera flip controls and if camera has none, SoC
> controls are exposed.

Sorry, forgot to think in the past. :-)
Thanks for the clarification, it makes sense now!

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
