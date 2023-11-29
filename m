Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E9C7FDC29
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 17:04:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F63F10E626;
	Wed, 29 Nov 2023 16:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8243710E20D;
 Wed, 29 Nov 2023 16:03:56 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1fa486a0e10so2234554fac.3; 
 Wed, 29 Nov 2023 08:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701273836; x=1701878636; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z7UzJljfmHlY261/3G0aNDMRQkGttOqN4meo5L3GUQc=;
 b=cqJE0V+93Jdf9Vlp11SszBiMU/TpL38Oc4FZKa/Pv0Z8nJdx24BubfJ0utb7E9EL7R
 8WpncDWHDikrZnH2MtRXJUpxrXKpgdLPmSIx+4UV9B42S8xfBx4JSTd700xxJKvsTxrI
 cVJg42rbfAIj82PVeurCCnjQ7gUXjszGEzrmqauALH3rGC8XFBmiSoB0uJyQNxOo3K2B
 78KUxuVPovfdZ2Hoqz+DsbDv6+DzMdiinjMQ4ZhF2kKy/K3kXjIIAnsAWk14w7qU6dk0
 J/S/ZAwjN6y5iYD+5QE/yyavF9FEDqLJVeIasXswfMCSmjg3Khu6I8oxvaF5tD2ReTE6
 jAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701273836; x=1701878636;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z7UzJljfmHlY261/3G0aNDMRQkGttOqN4meo5L3GUQc=;
 b=lebPC75zEOfKPFOX6KCej6xhZ9/KKH/CvkVLrZj9ms0Ev1kG6nmslKkf/ZUd8NBZKY
 JYDCxXVHmDb8qP+feSvBmb5jOgxu4j6lwaHJiozTGxsOit+VzvXuOXJsxVLXz67ulmIy
 i9XWvOMrtulc4KVm1c1CKTTbaN8lJec0Hg1fVjJxfTx/uwfvxYHU0kWpFrfFFBdQDgmo
 ykz1GDpGZeMjcAygLY/Y6jSC43/kjNV+TJMy6FZsY3vs5+ULiqQBHYcK1hT/awnRQOw4
 FuxH0p4HvWvgm7X4lZh780AhhigprrXKf2BslNfH/LtYUTUe+FzavgpsscczsDiW8UyL
 As1Q==
X-Gm-Message-State: AOJu0YzfV08cmDswixhQnWSnyeEs1g1Aydo5+JscF+Tr6ok2Bnw6IgHy
 3h6NfxWkfgZhESmZPcot0MIqyoXMCVxfuva2DQw=
X-Google-Smtp-Source: AGHT+IHoiXJZJAh5s4piufZ3+jeW0dyXseOkzVDXDHtjOgJ+lFkK8YIUj/kC/67GEby9dpMyF6D+LaQMEnf6B2u6Dj4=
X-Received: by 2002:a05:6870:82a8:b0:1f9:5cba:10f with SMTP id
 q40-20020a05687082a800b001f95cba010fmr23212183oae.38.1701273835699; Wed, 29
 Nov 2023 08:03:55 -0800 (PST)
MIME-Version: 1.0
References: <20231129152230.7931-1-n.zhandarovich@fintech.ru>
 <6a26b0c9-cbea-4ca2-bc16-79ed53e3a6fe@amd.com>
In-Reply-To: <6a26b0c9-cbea-4ca2-bc16-79ed53e3a6fe@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 29 Nov 2023 11:03:44 -0500
Message-ID: <CADnq5_P-Bxghq4N4GXZXUNwGR5BPyU2qQXDYzDeNkvn=VSTfwg@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon/r600_cs: Fix possible int overflows in
 r600_cs_check_reg()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 29, 2023 at 10:47=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 29.11.23 um 16:22 schrieb Nikita Zhandarovich:
> > While improbable, there may be a chance of hitting integer
> > overflow when the result of radeon_get_ib_value() gets shifted
> > left.
> >
> > Avoid it by casting one of the operands to larger data type (u64).
> >
> > Found by Linux Verification Center (linuxtesting.org) with static
> > analysis tool SVACE.
>
> Well IIRC cb_color_bo_offset is just 32bits anyway, so this doesn't
> change anything.

All of the GPU addresses in the structure are u64.  The registers are
32 bits which is why they are 256 byte aligned.  That said, I think
the MC on the chips supported by this code are only 32 bits so we
shouldn't see any addresses greater than 32 bits, but this seems like
good to do from a coding perspective.  Otherwise, we'll keep getting
this patch.

Alex


Alex

>
> Regards,
> Christian.
>
> >
> > Fixes: 1729dd33d20b ("drm/radeon/kms: r600 CS parser fixes")
> > Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
> > ---
> >   drivers/gpu/drm/radeon/r600_cs.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/r600_cs.c b/drivers/gpu/drm/radeon/=
r600_cs.c
> > index 638f861af80f..6cf54a747749 100644
> > --- a/drivers/gpu/drm/radeon/r600_cs.c
> > +++ b/drivers/gpu/drm/radeon/r600_cs.c
> > @@ -1275,7 +1275,7 @@ static int r600_cs_check_reg(struct radeon_cs_par=
ser *p, u32 reg, u32 idx)
> >                       return -EINVAL;
> >               }
> >               tmp =3D (reg - CB_COLOR0_BASE) / 4;
> > -             track->cb_color_bo_offset[tmp] =3D radeon_get_ib_value(p,=
 idx) << 8;
> > +             track->cb_color_bo_offset[tmp] =3D (u64)radeon_get_ib_val=
ue(p, idx) << 8;
> >               ib[idx] +=3D (u32)((reloc->gpu_offset >> 8) & 0xffffffff)=
;
> >               track->cb_color_base_last[tmp] =3D ib[idx];
> >               track->cb_color_bo[tmp] =3D reloc->robj;
> > @@ -1302,7 +1302,7 @@ static int r600_cs_check_reg(struct radeon_cs_par=
ser *p, u32 reg, u32 idx)
> >                                       "0x%04X\n", reg);
> >                       return -EINVAL;
> >               }
> > -             track->htile_offset =3D radeon_get_ib_value(p, idx) << 8;
> > +             track->htile_offset =3D (u64)radeon_get_ib_value(p, idx) =
<< 8;
> >               ib[idx] +=3D (u32)((reloc->gpu_offset >> 8) & 0xffffffff)=
;
> >               track->htile_bo =3D reloc->robj;
> >               track->db_dirty =3D true;
>
