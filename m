Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A547C666141
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 18:01:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3150F10E7A2;
	Wed, 11 Jan 2023 17:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [IPv6:2607:f8b0:4864:20::92c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D3910E7A2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 17:00:58 +0000 (UTC)
Received: by mail-ua1-x92c.google.com with SMTP id j14so3830366ual.10
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 09:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AAJpJh3pnYfbotxwLc8hJ3ZJQeLdy37F9DfaFWo/sLU=;
 b=KFsOiHc/eK/+jvzytsM1pbHH9AVsGSGlo9s8rTMx0LWLi3Zut7QLF1D2LjO7mf5U91
 juW+sGemm/myxJe+clLMrK/wdR2R1ginZw/Jbw2a0f0toHd4vSxmTrW38OLDptoIXi1A
 xhY2KEoyh1uO1BzU7fOudSiAmvw0lUhrTTuXdNKoeB58daZZJElUBL5x1IbrE5uK4Yml
 GCqpIC1++JIZiHMkmInPzwLh21b8cDotofFpW7EDZhcpkO7uLohUXQI6rDVDWZH+HgOj
 QZ/N1nzwBfc3+dJu95SE9zorhjfZQgoig/jFM9UVq8TzGWghARzIXXGEll3Ulr+hv7o0
 ltIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AAJpJh3pnYfbotxwLc8hJ3ZJQeLdy37F9DfaFWo/sLU=;
 b=7yVI68ZpT2NFs+/DvJrogEEVwbWgnxYNsy6k3mFl8MjCrprKIPpFvhf95BNQ+KE7xH
 KKy46VYE6rSxt7j3WVNCRjFIt+ncMvYo4NLtJTGmffurdv5w7iynkL3eHWOPwCNI/rq2
 Oyd9QXROK7sVj053aIh33XJm9h3kXL77olM3qkQRdN6if3wtf8U//aFFUjPBTERbkUB2
 3ncaZoa+/jNyiHByK5YUGEJXzvQfQNh3XTmEgslqhovNOZiIoJ/AmQ2OnFugrgMBhx5E
 funnzr0UaU+7EvtmCOQnNqV7WudpOYDah47u76RffotdoOID3T6ADVzMydswFax4hLPK
 c2Vw==
X-Gm-Message-State: AFqh2krX+UA3wSWdLl76IMvcK2cdyitMrSP+lV1Bm648sOGTrjhOwQqc
 SloknLTqDUgO2ZNu05EmXRqNG6OqcC2qw8uPmFEiKQ==
X-Google-Smtp-Source: AMrXdXu7KLCAx6U5MqODafuTn9yHQvvRVhJJKsPdUp/GGWCjRC+o01vEMkWZswX/SPv3zXsPGFbOKDcrbsJMFbFEeYs=
X-Received: by 2002:ab0:59aa:0:b0:419:25c5:30dc with SMTP id
 g39-20020ab059aa000000b0041925c530dcmr8816091uad.26.1673456456994; Wed, 11
 Jan 2023 09:00:56 -0800 (PST)
MIME-Version: 1.0
References: <20221207-rpi-hdmi-improvements-v1-0-6b15f774c13a@cerno.tech>
 <20221207-rpi-hdmi-improvements-v1-5-6b15f774c13a@cerno.tech>
 <5394a702-20ef-bada-4731-b720b810998d@suse.de>
In-Reply-To: <5394a702-20ef-bada-4731-b720b810998d@suse.de>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 11 Jan 2023 17:00:41 +0000
Message-ID: <CAPY8ntCsp_qbjeyYvUQ0jmKh8gecvR-NmYaEPkrsxBhyZrHPxg@mail.gmail.com>
Subject: Re: [PATCH 5/9] drm/vc4: hdmi: Rework the CSC matrices organization
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Emma Anholt <emma@anholt.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas

Thanks for the review

On Wed, 11 Jan 2023 at 15:03, Thomas Zimmermann <tzimmermann@suse.de> wrote=
:
>
> Hi
>
> Am 07.12.22 um 17:07 schrieb Maxime Ripard:
> > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >
> > The CSC matrices were stored as separate matrix for each colorspace, an=
d
> > if we wanted a limited or full RGB output.
> >
> > This created some gaps in our support and we would not always pick the
> > relevant matrix.
> >
> > Let's rework our data structure to store one per colorspace, and then a
> > matrix for limited range and one for full range. This makes us add a ne=
w
> > matrix to support full range BT709 YUV output, and drops the redundant
> > (but somehow different) BT709 YUV444 vs YUV422 matrix.
>
> The final sentence is confusing and I didn't understand how two
> different matrices can now be just one.

Two changes to accommodate the hardware requirements:

Firstly the driver was only defining
vc5_hdmi_csc_full_rgb_to_limited_yuv444_bt709 and
vc5_hdmi_csc_full_rgb_to_limited_yuv422_bt709. There was no matrix for
full_rgb_to_full_yuv_bt709, so that had to be added.

Secondly, for some reason when in 444 mode the hardware wants the
matrix rows in a different order. That is why
vc5_hdmi_csc_full_rgb_to_limited_yuv444_bt709 differed from
vc5_hdmi_csc_full_rgb_to_limited_yuv422_bt709 - it was a simple
reordering of the rows.

This patch dropped the special handling for 444, and in the process
programmed the wrong coefficients into the hardware :-(
Patch 6/9 then reintroduces this reordering, so really should be
squashed into the one patch.

Looking at my more recent work, it looks like I messed up on 6/9 too.
One of the patches on [1] corrects that row swapping for yuv444 - I
was obviously having a bad day.

Maxime: Are you OK to fix that up?

Thanks

  Dave

[1] https://github.com/raspberrypi/linux/pull/5249/commits

> Best regards
> Thomas
>
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >   drivers/gpu/drm/vc4/vc4_hdmi.c | 124 +++++++++++++++++++++-----------=
---------
> >   1 file changed, 63 insertions(+), 61 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> > index 51469939a8b4..299a8fe7a2ae 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -1178,68 +1178,72 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi =
*vc4_hdmi,
> >   }
> >
> >   /*
> > - * If we need to output Full Range RGB, then use the unity matrix
> > + * Matrices for (internal) RGB to RGB output.
> >    *
> > - * [ 1      0      0      0]
> > - * [ 0      1      0      0]
> > - * [ 0      0      1      0]
> > - *
> > - * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
> > - */
> > -static const u16 vc5_hdmi_csc_full_rgb_unity[3][4] =3D {
> > -     { 0x2000, 0x0000, 0x0000, 0x0000 },
> > -     { 0x0000, 0x2000, 0x0000, 0x0000 },
> > -     { 0x0000, 0x0000, 0x2000, 0x0000 },
> > -};
> > -
> > -/*
> > - * CEA VICs other than #1 require limited range RGB output unless
> > - * overridden by an AVI infoframe. Apply a colorspace conversion to
> > - * squash 0-255 down to 16-235. The matrix here is:
> > - *
> > - * [ 0.8594 0      0      16]
> > - * [ 0      0.8594 0      16]
> > - * [ 0      0      0.8594 16]
> > - *
> > - * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
> > + * Matrices are signed 2p13 fixed point, with signed 9p6 offsets
> >    */
> > -static const u16 vc5_hdmi_csc_full_rgb_to_limited_rgb[3][4] =3D {
> > -     { 0x1b80, 0x0000, 0x0000, 0x0400 },
> > -     { 0x0000, 0x1b80, 0x0000, 0x0400 },
> > -     { 0x0000, 0x0000, 0x1b80, 0x0400 },
> > +static const u16 vc5_hdmi_csc_full_rgb_to_rgb[2][3][4] =3D {
> > +     {
> > +             /*
> > +              * Full range - unity
> > +              *
> > +              * [ 1      0      0      0]
> > +              * [ 0      1      0      0]
> > +              * [ 0      0      1      0]
> > +              */
> > +             { 0x2000, 0x0000, 0x0000, 0x0000 },
> > +             { 0x0000, 0x2000, 0x0000, 0x0000 },
> > +             { 0x0000, 0x0000, 0x2000, 0x0000 },
> > +     },
> > +     {
> > +             /*
> > +              * Limited range
> > +              *
> > +              * CEA VICs other than #1 require limited range RGB
> > +              * output unless overridden by an AVI infoframe. Apply a
> > +              * colorspace conversion to squash 0-255 down to 16-235.
> > +              * The matrix here is:
> > +              *
> > +              * [ 0.8594 0      0      16]
> > +              * [ 0      0.8594 0      16]
> > +              * [ 0      0      0.8594 16]
> > +              */
> > +             { 0x1b80, 0x0000, 0x0000, 0x0400 },
> > +             { 0x0000, 0x1b80, 0x0000, 0x0400 },
> > +             { 0x0000, 0x0000, 0x1b80, 0x0400 },
> > +     },
> >   };
> >
> >   /*
> > - * Conversion between Full Range RGB and Full Range YUV422 using the
> > - * BT.709 Colorspace
> > - *
> > - *
> > - * [  0.181906  0.611804  0.061758  16  ]
> > - * [ -0.100268 -0.337232  0.437500  128 ]
> > - * [  0.437500 -0.397386 -0.040114  128 ]
> > - *
> > - * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
> > - */
> > -static const u16 vc5_hdmi_csc_full_rgb_to_limited_yuv422_bt709[3][4] =
=3D {
> > -     { 0x05d2, 0x1394, 0x01fa, 0x0400 },
> > -     { 0xfccc, 0xf536, 0x0e00, 0x2000 },
> > -     { 0x0e00, 0xf34a, 0xfeb8, 0x2000 },
> > -};
> > -
> > -/*
> > - * Conversion between Full Range RGB and Full Range YUV444 using the
> > - * BT.709 Colorspace
> > - *
> > - * [ -0.100268 -0.337232  0.437500  128 ]
> > - * [  0.437500 -0.397386 -0.040114  128 ]
> > - * [  0.181906  0.611804  0.061758  16  ]
> > + * Conversion between Full Range RGB and YUV using the BT.709 Colorspa=
ce
> >    *
> > - * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
> > + * Matrices are signed 2p13 fixed point, with signed 9p6 offsets
> >    */
> > -static const u16 vc5_hdmi_csc_full_rgb_to_limited_yuv444_bt709[3][4] =
=3D {
> > -     { 0xfccc, 0xf536, 0x0e00, 0x2000 },
> > -     { 0x0e00, 0xf34a, 0xfeb8, 0x2000 },
> > -     { 0x05d2, 0x1394, 0x01fa, 0x0400 },
> > +static const u16 vc5_hdmi_csc_full_rgb_to_yuv_bt709[2][3][4] =3D {
> > +     {
> > +             /*
> > +              * Full Range
> > +              *
> > +              * [  0.212600  0.715200  0.072200  0   ]
> > +              * [ -0.114572 -0.385428  0.500000  128 ]
> > +              * [  0.500000 -0.454153 -0.045847  128 ]
> > +              */
> > +             { 0x06ce, 0x16e3, 0x024f, 0x0000 },
> > +             { 0xfc56, 0xf3ac, 0x1000, 0x2000 },
> > +             { 0x1000, 0xf179, 0xfe89, 0x2000 },
> > +     },
> > +     {
> > +             /*
> > +              * Limited Range
> > +              *
> > +              * [  0.181906  0.611804  0.061758  16  ]
> > +              * [ -0.100268 -0.337232  0.437500  128 ]
> > +              * [  0.437500 -0.397386 -0.040114  128 ]
> > +              */
> > +             { 0x05d2, 0x1394, 0x01fa, 0x0400 },
> > +             { 0xfccc, 0xf536, 0x0e00, 0x2000 },
> > +             { 0x0e00, 0xf34a, 0xfeb8, 0x2000 },
> > +     },
> >   };
> >
> >   static void vc5_hdmi_set_csc_coeffs(struct vc4_hdmi *vc4_hdmi,
> > @@ -1262,6 +1266,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *v=
c4_hdmi,
> >       struct drm_device *drm =3D vc4_hdmi->connector.dev;
> >       struct vc4_hdmi_connector_state *vc4_state =3D
> >               conn_state_to_vc4_hdmi_conn_state(state);
> > +     unsigned int lim_range =3D vc4_hdmi_is_full_range(vc4_hdmi, mode)=
 ? 0 : 1;
> >       unsigned long flags;
> >       u32 if_cfg =3D 0;
> >       u32 if_xbar =3D 0x543210;
> > @@ -1277,7 +1282,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *v=
c4_hdmi,
> >
> >       switch (vc4_state->output_format) {
> >       case VC4_HDMI_OUTPUT_YUV444:
> > -             vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_t=
o_limited_yuv444_bt709);
> > +             vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_t=
o_yuv_bt709[lim_range]);
> >               break;
> >
> >       case VC4_HDMI_OUTPUT_YUV422:
> > @@ -1292,16 +1297,13 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi =
*vc4_hdmi,
> >               if_cfg |=3D VC4_SET_FIELD(VC5_DVP_HT_VEC_INTERFACE_CFG_SE=
L_422_FORMAT_422_LEGACY,
> >                                       VC5_DVP_HT_VEC_INTERFACE_CFG_SEL_=
422);
> >
> > -             vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_t=
o_limited_yuv422_bt709);
> > +             vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_t=
o_yuv_bt709[lim_range]);
> >               break;
> >
> >       case VC4_HDMI_OUTPUT_RGB:
> >               if_xbar =3D 0x354021;
> >
> > -             if (!vc4_hdmi_is_full_range(vc4_hdmi, mode))
> > -                     vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_fu=
ll_rgb_to_limited_rgb);
> > -             else
> > -                     vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_fu=
ll_rgb_unity);
> > +             vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_t=
o_rgb[lim_range]);
> >               break;
> >
> >       default:
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
