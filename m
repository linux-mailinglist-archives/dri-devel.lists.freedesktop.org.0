Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9C6B06E8F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 09:13:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B60110E673;
	Wed, 16 Jul 2025 07:13:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V3dj1uRm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D52189C0D;
 Tue, 15 Jul 2025 22:53:33 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-60c01b983b6so733770a12.0; 
 Tue, 15 Jul 2025 15:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752620011; x=1753224811; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+XsV7dB0/dBV/4w5KD5MsUTgHRRbA9nMltbkQvDt2jw=;
 b=V3dj1uRmWmMYTCr2tdKrnGMgGqwO8ZpwM0wch+AqUZA8mn+QI6mWkBgZHCxsTdib/J
 aPr2eGUbQbfO9pRh0G+vXidGTkeE2nWNWu5zRRCi+z/Re9K66GgjKjJQanh1gTC12MXl
 ZT5i+ui2IsbQnLHTCKWblmL+oKV19vZeI1GjLRWarxKQEDRJlaLBPpKYP+e5mksmGknc
 XMfDuYRh+7JGK78MlQz5yqNPH2fPEj0RNSEA/RSdFk6jxYQ5V0RMc30LZbK951QvSCW7
 tgmesIkxfdgIbFPDcbD6FbdLYqJ9RND3FZ2F0vH8O7zn04A2kJln5t7C3U8u3dVNDkP+
 gShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752620011; x=1753224811;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+XsV7dB0/dBV/4w5KD5MsUTgHRRbA9nMltbkQvDt2jw=;
 b=Oj+COgdvVDyawmWoIYaPJ9L6JZL7OPWEQU72+jMG+LhqlgOFcrLultx4hwiRJFYqwB
 y+LBmYp1NtAKKwQiSULP6rzLzG0C0yU6JPWQQgtuyX2cqgeUg4yZmWooCi2XlWMcD3Hm
 lpm1CEL8r+RYMr4Onb6cxunuGAmck+VfOwLBXHS84b3CvtxhSae0h6MpDACbAfmbNBVb
 2n/fwUXhqXfBHVNqd1P95kM4BokoLYh2JfDgxEQbPvG+8KGR7P3hGicW8Ec9aE326YnJ
 RahBQWw4unKqon9vbpk5biwr96gqqKuvSuSNQZ8FK2IWe3QWBx7v2RY00DUSyZFOJJdj
 S/0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqSQt3QgNVzy5UwrqFX6rtybJRFTUNabc80CVyVXTO9pT39tG6WOzt/GnBQCT1xNC9qRdjEt3QgQyW@lists.freedesktop.org,
 AJvYcCXKKKUjFUVdIbdLLGKvu0v1CCKt5RQ4uP+edwN75npcfcbw8TEYpDWmPO1GK8ZHYsoIQfZtFZiVGb0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCQqo+kXTswsfrg3Ptc4yDANEw0acf35Z1OgKX+0kg8ENuQY+k
 PhVkLdtaM/Zybmm0veBHyyff3P6nHhW0ZTBYjuQl8Pqcg4Aa9qy9WjJWl76P6NSkTgin6ku/LLc
 JKMF4BXwi1C6o1Wm9RVgVywIPZdhdEw==
X-Gm-Gg: ASbGnct4Rp/jlAk6TfzAE2zBR8abaI7f4fZeB2yksPp3RYdS9ytYhBQhEccqRTNcHzA
 xPWZovviHjosO0seX9GVlffTJ+OAX96W6dG+m/lAzRy7WXKjJwxEa6vf/3btBVPwyTsO7S/P9JW
 dwCx3SsyBfflMQ3f479YP3Kdh8GyLW0ePASfXF49z90wQ+uZgpt5QJepSYNmTh6ctHC0EVq4XZ+
 Y/ITYZQMR+U59TlRurh23Cuxh0yc/UL4VtmXlg=
X-Google-Smtp-Source: AGHT+IHJ0UrphscN3ZQ6MjbsfF09sNSf+YfHJeVDahoSygCKdgSFJpnKOrntHpiY1NQ/G9FOEePT6PqTIu3mZzcGNhU=
X-Received: by 2002:a05:6402:3787:b0:607:35d:9fb4 with SMTP id
 4fb4d7f45d1cf-61282c93cb7mr699146a12.15.1752620011188; Tue, 15 Jul 2025
 15:53:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250714173554.14223-1-daleyo@gmail.com>
 <20250714173554.14223-7-daleyo@gmail.com>
 <CACSVV00-DDnQYp-65Pi-XwpEKT1_jYik2=zH_bK_oJiGLxX48A@mail.gmail.com>
In-Reply-To: <CACSVV00-DDnQYp-65Pi-XwpEKT1_jYik2=zH_bK_oJiGLxX48A@mail.gmail.com>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Wed, 16 Jul 2025 00:52:54 +0200
X-Gm-Features: Ac12FXwFj68pn6YB4znyT4ywvUmV_BN2k_YiCalM6sBLs5LcPLsqZL0a65VkVi8
Message-ID: <CA+kEDGF96VbjGPBW0hWSji2eQtQU-bXjsZAaZjjUo0cvpwhBQg@mail.gmail.com>
Subject: Re: [PATCH 6/9] drm/msm/dp: Work around bogus maximum link rate
To: rob.clark@oss.qualcomm.com
Cc: Dale Whinham <daleyo@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 16 Jul 2025 07:13:52 +0000
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

On Mon, Jul 14, 2025 at 21:51, Rob Clark <rob.clark@oss.qualcomm.com> wrote=
:
>
> On Mon, Jul 14, 2025 at 10:36=E2=80=AFAM Dale Whinham <daleyo@gmail.com> =
wrote:
> >
> > From: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
> >
> > The OLED display in the Surface Pro 11 reports a maximum link rate of
> > zero in its DPCD, causing it to fail to probe correctly.
> >
> > The Surface Pro 11's DSDT table contains some XML with an
> > "EDPOverrideDPCDCaps" block that defines the max link rate as 0x1E
> > (8.1Gbps/HBR3).
> >
> > Add a quirk to conditionally override the max link rate if its value
> > is zero specifically for this model.
> >
> > Signed-off-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.co=
m>
> > Signed-off-by: Dale Whinham <daleyo@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/dp/dp_panel.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp=
/dp_panel.c
> > index 4e8ab75c771b..b2e65b987c05 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> > @@ -11,6 +11,8 @@
> >  #include <drm/drm_of.h>
> >  #include <drm/drm_print.h>
> >
> > +#include <linux/dmi.h>
> > +
> >  #define DP_MAX_NUM_DP_LANES    4
> >  #define DP_LINK_RATE_HBR2      540000 /* kbytes */
> >
> > @@ -58,6 +60,17 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_pane=
l *msm_dp_panel)
> >         if (rc)
> >                 return rc;
> >
> > +       /*
> > +        * for some reason the ATNA30DW01-1 OLED panel in the Surface P=
ro 11
> > +        * reports a max link rate of 0 in the DPCD. Fix it to match th=
e
> > +        * EDPOverrideDPCDCaps string found in the ACPI DSDT
> > +        */
> > +       if (dpcd[DP_MAX_LINK_RATE] =3D=3D 0 &&
> > +           dmi_match(DMI_SYS_VENDOR, "Microsoft Corporation") &&
> > +           dmi_match(DMI_PRODUCT_NAME, "Microsoft Surface Pro, 11th Ed=
ition")) {
> > +               dpcd[1] =3D DP_LINK_BW_8_1;
> > +       }
>
> Not a dp expert myself, but..
>
> In drm_dp_helpers.c there is dpcd_quirk_list[].. which applies quirks
> based on the oui ("Organizational Unique ID") of the dp sink.  I think
> this would be the correct way to handle this.  Although I guess you'll
> need to add a new quirk for this.
>
> Idk if the surface pro 11 has multiple different panel options.  If so
> you defn wouldn't want to match on the DMI.
>
> BR,
> -R

Thanks Rob for the feedback, I have a working implementation
based on your suggestion with a new quirk, we will switch to it in V2.

Best,
J=C3=A9r=C3=B4me

> > +
> >         msm_dp_panel->vsc_sdp_supported =3D drm_dp_vsc_sdp_supported(pa=
nel->aux, dpcd);
> >         link_info =3D &msm_dp_panel->link_info;
> >         link_info->revision =3D dpcd[DP_DPCD_REV];
> > --
> > 2.50.1
> >
