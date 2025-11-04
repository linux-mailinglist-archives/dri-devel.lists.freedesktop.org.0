Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C122DC3222A
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 17:50:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78EA10E648;
	Tue,  4 Nov 2025 16:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J3zBAhwO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4468210E648
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 16:50:08 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-4283be7df63so3185946f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 08:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762275007; x=1762879807; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GdZgp8rFwisH6sL9hW06vie32Q/MJPgK1VmXTcKs3fA=;
 b=J3zBAhwOH7SmNRNhZDkTopDl1sV7sRgyMIkq4u/FvIgKf1siW8pvTAio3P3s8coRN/
 G9mTLLcuKzIvbFBqmxfE4omand1XuCU9AL2a1TkVgAiiCrFNsoWGwIKXIvyIDL9l2qvj
 ZFZ/qugcN/pAys/5865ZMjLvfk2iSNGt1EmuOmzI3D/QQ8bYmaoiHm9IFUvnkzMukSSZ
 9owtxe2Gr5GFEdFvF1Pzz8huKu7VTazSDVENCy3LuXLnSst1LXgNScYfKAp05zK2D9Jr
 0pJO/hIaHAlcTwBE+iRiIlcQ6YR0faC35/J1iEGvmLQ70UI5zvzsBjkV5kQY1yAPYq24
 iUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762275007; x=1762879807;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GdZgp8rFwisH6sL9hW06vie32Q/MJPgK1VmXTcKs3fA=;
 b=BKd2Jiyg0YWv6Iqnjfph65+YUaPiPRn/5OYqsHcpvLEX66DF/Zhq5YCIdCvk73TI2K
 QlRUVNBXSx72gtyVtKqqez/qKrNpk0t5JZFG8dBJ2qz4l5OOG5eviX92rakxC0z6DErY
 MRETJTu92YZgzq4ulcP+PRUODwZI+Q40WxWTBRPOr7gfWIISit2VkmE2594kqG9Vo/Qb
 Ql6rBD4V1NMpcrcyJzR/THM/GNeYym/B6Jo1WxgB4MIbrwE9q1bnhiq5SWYX4ApKAcr3
 suh85LZ/vGmcSzBw2kz2zV3THh+nC3oZ+nz17AvwAwNeuJEkeG3izDiwCKULWWqNuARb
 GNsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6km8AfMhEj+2LlXeAT3MRRvwTjLakvZiU1KuAAbAvkLxpIDN3XCjc0JumVEfeInuJ+e70f74Lv98=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7Rk01gzk/YZBPCC92nknpo9VqpymLv/YLCalxurqH5L7XO+B8
 Gb3Is7DA8Gb7AGYwLTrgR0N4eNLJ+/9fpjdZyUqb8MKViJY4OTCVLDnu
X-Gm-Gg: ASbGncuk1iiiL/rgHNtALSYj9Q0BVeJNu1cLavV/7YQkp8ke0kU91zIGolcpiQAjecA
 VaN2qFwHiaIn4kj7rP69ae08FcBLIQOihzHwNc1t7CZhoAChwMOCL2I4sFyJ3msr+QY5BxFuUfU
 OJgu+nCUY9LBbBRbAJPY43vF30Dyqkq+D2ghUjWbRqAmlrmHxHMBm8G4okTVxuhRmyzlugo9gVc
 W/+W2uQ445j5Ig9ixTeyEj1lJ24W6sNaso5Zl50Glx9qyH97mKXXpU8oj8kMjq7zRkx1qj6tN1o
 tGzZqFCAawuXzEl49pIPFoyNbR0AG0xCd9pvd499EDIo4ZPfWEVHvQFU/aXMtp1P/mchjew6khi
 IwPEyQDvcx0uhMqu47YrQkMgs3FYDDUdyQCttbfp9qL+sjTq/kRbq+5UMupQMAQ4irxlc4HHxGJ
 7uvaS+hGvBTOTSPp+EA9Q51Jdcq+w+8CHYn03FiPoByIVgHUXJb+UnDPVwDpQF7xGnF+E=
X-Google-Smtp-Source: AGHT+IHsOmcFgrKN0VFuIMGhIpJEUqqSZDIXndB9GVdXwqoNi1GsBka2e33KfnMwqvPBDWre8Hxpqw==
X-Received: by 2002:a05:6000:186b:b0:429:ce81:fe2b with SMTP id
 ffacd0b85a97d-429ce82013amr7678935f8f.23.1762275006529; 
 Tue, 04 Nov 2025 08:50:06 -0800 (PST)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429dc1f5be4sm5345170f8f.31.2025.11.04.08.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 08:50:06 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 26/30] drm/sun4i: mixer: Add quirk for number of VI scalers
Date: Tue, 04 Nov 2025 17:50:04 +0100
Message-ID: <5959058.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <CAGb2v65RecyHZVUN--oSmtzPDpmUHALd3Pqf79a1fKP9yxD8cA@mail.gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-27-jernej.skrabec@gmail.com>
 <CAGb2v65RecyHZVUN--oSmtzPDpmUHALd3Pqf79a1fKP9yxD8cA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Hi Chen-Yu,

Dne ponedeljek, 3. november 2025 ob 18:11:07 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> On Mon, Oct 13, 2025 at 3:24=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gm=
ail.com> wrote:
> >
> > On DE2 and DE3, UI scalers are located right after VI scalers. So in
> > order to calculate proper UI scaler base address, number of VI scalers
> > must be known. In practice, it is same as number of VI channels, but it
> > doesn't need to be.
> >
> > Let's make a quirk for this number. Code for configuring channels and
> > associated functions won't have access to vi_num quirk anymore after
> > rework for independent planes.
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  drivers/gpu/drm/sun4i/sun8i_mixer.c     | 11 +++++++++++
> >  drivers/gpu/drm/sun4i/sun8i_mixer.h     |  2 ++
> >  drivers/gpu/drm/sun4i/sun8i_ui_scaler.c | 10 +++++-----
> >  3 files changed, 18 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4=
i/sun8i_mixer.c
> > index 78bbfbe62833..f9131396f22f 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > @@ -708,6 +708,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixe=
r0_cfg =3D {
> >         .scaler_mask    =3D 0xf,
> >         .scanline_yuv   =3D 2048,
> >         .de2_fcc_alpha  =3D 1,
> > +       .vi_scaler_num  =3D 1,
> >         .ui_num         =3D 3,
> >         .vi_num         =3D 1,
> >  };
> > @@ -718,6 +719,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixe=
r1_cfg =3D {
> >         .scaler_mask    =3D 0x3,
> >         .scanline_yuv   =3D 2048,
> >         .de2_fcc_alpha  =3D 1,
> > +       .vi_scaler_num  =3D 1,
> >         .ui_num         =3D 1,
> >         .vi_num         =3D 1,
> >  };
> > @@ -729,6 +731,7 @@ static const struct sun8i_mixer_cfg sun8i_h3_mixer0=
_cfg =3D {
> >         .scaler_mask    =3D 0xf,
> >         .scanline_yuv   =3D 2048,
> >         .de2_fcc_alpha  =3D 1,
> > +       .vi_scaler_num  =3D 1,
> >         .ui_num         =3D 3,
> >         .vi_num         =3D 1,
> >  };
> > @@ -740,6 +743,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer=
0_cfg =3D {
> >         .scaler_mask    =3D 0xf,
> >         .scanline_yuv   =3D 2048,
> >         .de2_fcc_alpha  =3D 1,
> > +       .vi_scaler_num  =3D 1,
> >         .ui_num         =3D 3,
> >         .vi_num         =3D 1,
> >  };
> > @@ -751,6 +755,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer=
1_cfg =3D {
> >         .scaler_mask    =3D 0x3,
> >         .scanline_yuv   =3D 2048,
> >         .de2_fcc_alpha  =3D 1,
> > +       .vi_scaler_num  =3D 1,
> >         .ui_num         =3D 1,
> >         .vi_num         =3D 1,
> >  };
> > @@ -761,6 +766,7 @@ static const struct sun8i_mixer_cfg sun8i_v3s_mixer=
_cfg =3D {
> >         .ui_num =3D 1,
> >         .scaler_mask =3D 0x3,
> >         .scanline_yuv =3D 2048,
> > +       .vi_scaler_num  =3D 2,
> >         .ccsc =3D CCSC_MIXER0_LAYOUT,
> >         .mod_rate =3D 150000000,
> >  };
> > @@ -772,6 +778,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer=
0_cfg =3D {
> >         .scaler_mask    =3D 0x3,
> >         .scanline_yuv   =3D 2048,
> >         .de2_fcc_alpha  =3D 1,
> > +       .vi_scaler_num  =3D 1,
> >         .ui_num         =3D 1,
> >         .vi_num         =3D 1,
> >  };
> > @@ -783,6 +790,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer=
1_cfg =3D {
> >         .scaler_mask    =3D 0x1,
> >         .scanline_yuv   =3D 1024,
> >         .de2_fcc_alpha  =3D 1,
> > +       .vi_scaler_num  =3D 1,
> >         .ui_num         =3D 0,
> >         .vi_num         =3D 1,
> >  };
> > @@ -794,6 +802,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixe=
r0_cfg =3D {
> >         .scaler_mask    =3D 0xf,
> >         .scanline_yuv   =3D 4096,
> >         .de2_fcc_alpha  =3D 1,
> > +       .vi_scaler_num  =3D 1,
> >         .ui_num         =3D 3,
> >         .vi_num         =3D 1,
> >  };
> > @@ -805,6 +814,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixe=
r1_cfg =3D {
> >         .scaler_mask    =3D 0x3,
> >         .scanline_yuv   =3D 2048,
> >         .de2_fcc_alpha  =3D 1,
> > +       .vi_scaler_num  =3D 1,
> >         .ui_num         =3D 1,
> >         .vi_num         =3D 1,
> >  };
> > @@ -814,6 +824,7 @@ static const struct sun8i_mixer_cfg sun50i_h6_mixer=
0_cfg =3D {
> >         .mod_rate       =3D 600000000,
> >         .scaler_mask    =3D 0xf,
> >         .scanline_yuv   =3D 4096,
> > +       .vi_scaler_num  =3D 1,
> >         .ui_num         =3D 3,
> >         .vi_num         =3D 1,
> >  };
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4=
i/sun8i_mixer.h
> > index def07afd37e1..40b800022237 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> > @@ -178,6 +178,7 @@ enum sun8i_mixer_type {
> >   * @scaline_yuv: size of a scanline for VI scaler for YUV formats.
> >   * @de2_fcc_alpha: use FCC for missing DE2 VI alpha capability
> >   *     Most DE2 cores has FCC. If number of VI planes is one, enable t=
his.
> > + * @vi_scaler_num: Number of VI scalers. Used on DE2 and DE3.
> >   * @map: channel map for DE variants processing YUV separately (DE33)
> >   */
> >  struct sun8i_mixer_cfg {
> > @@ -189,6 +190,7 @@ struct sun8i_mixer_cfg {
> >         unsigned int    de_type;
> >         unsigned int    scanline_yuv;
> >         unsigned int    de2_fcc_alpha : 1;
> > +       unsigned int    vi_scaler_num;
>=20
> This could be a smaller type. Please do a sweep of the struct after the
> refactoring is done and see if any of the types could be shrunk.

A lot of things can be stored in smaller type. However, making things small=
er
may be contraproductive. Structs are usually aligned for performance reason=
s,
so it won't save any memory and accessing them will use extra asm instructi=
ons
for zeroing out parts of CPU registers since registers are larger than used
data type.

>=20
> And just a nitpick, but I would probably insert it above scaler_mask.
>=20

Will do.

>=20
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
>=20

Thanks.

Best regards,
Jernej


