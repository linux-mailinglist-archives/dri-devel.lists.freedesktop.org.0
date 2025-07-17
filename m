Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9966BB0983A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 01:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A2410E334;
	Thu, 17 Jul 2025 23:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X2Dh8XW4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C82210E89C;
 Thu, 17 Jul 2025 20:28:30 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-604bff84741so2516134a12.2; 
 Thu, 17 Jul 2025 13:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752784109; x=1753388909; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FGydj71aILIamuVYXMAhah/i/gdu8v+ZS/ho+uyn49k=;
 b=X2Dh8XW4sKJ2yD2Mkn2GCcJ8i2XvK1EEXpZD38+cQUDvYNnQ4tUUJ+BVXtCCfT1CfV
 YZurlov/0ydknui3Tczh9kRQ4jynz37ZBTJ/op3LhjD1oSSjphlzLPDQJolSu8kxsYw/
 Os2x3BaG7sFB191LLEO9K0/HogXt2OItn589UzvWjmizSlTUfrDcILP5+IjT9Ufm8BD2
 bfdxck6Su6THiQ49sxhlq2jlw8C3nJb9nZAwOkO1vSYmxNwzPxf2GZoQ2X92Jq1nw3DU
 fnSixyn5hqHXLbeeYU2D8CnjI2E8saDX6GhR2my75YMNRC1aFiizlD7cyk2YbelQngD0
 Je3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752784109; x=1753388909;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FGydj71aILIamuVYXMAhah/i/gdu8v+ZS/ho+uyn49k=;
 b=sjEctj+O7jFli9wSSNZ2/F0VPXmxpDID44/LX3uuZsJf7/roqvB3YPqNLKQAafi4Hk
 ctxZXOqHN9sUL15QKaLUNc3RJ4xVGwUaP72wdkB8s8sIYIOfUwKXPdKf+DeTsi5VmuUT
 ZgLkUOPopyfryQIDxMdXP1ya1pQQnWF7nlLCu6mByYRbFnPBOTPA5ft7DTlEJhcze7ZW
 cwks5JKlLYwzjyQtPJznVFbkiFnQnhlN1lSX6PR8on90RDx67DBjdwaZZ+Gtf2pYKsam
 lW8bqsNE9c+B4Jpuue2BcckPErBkQKvSAtnq9wmfGsicMS7aACF3bofz3DegkrU27I0E
 m2SA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX41Wye+uuHtZlH8nB5rWpdqhlXUqoNtqeXqgtpzQHnBUdwVseiqW3r6ovor/NM7lMcXaJXhm+409vJ@lists.freedesktop.org,
 AJvYcCX5ep09d6DU8kwrfQS9NTPsMKIfYU9SXTapGBACO1kYqsANhSF0jGtPBjwvtRjBBi0Pv7WTDXY9SKs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZwflOMwrAsQ5potPTpo1XshObdt9aRQTTu172bIO0M++3sTNO
 Tiq5D8xkXvLlWiQRYr1OlLRww6DdOZcaWElAfFB6YM/KKUOJ01qj5vUTv4IA+nQ9fzjjvYrKiPS
 s9cJNGEqV0IWWKZEjvUHH39m+fN4nnQ==
X-Gm-Gg: ASbGncv9LibtU7uLyqjPGNpepbD1NqxcVQbyYaQZeuAsraI49JvOx9tk0BPFLC+liYO
 8gNtP6O6aDyn0IH/1PUqmQzFIDKq0Bv5xbM2QM8tWR+v+vGlaCZzCBr0RlT5KaHnizl3xtFAwjb
 3jAj05wq/VSxwzDd9a1YWja6zQqx43FAKx54+Szngu3xLeRkak2TLKhtrOIuJe/AibLTHesDZoK
 4mVZ/+p4wA2JnL9FAYGfczuS0Swc5KLXIgnwNY=
X-Google-Smtp-Source: AGHT+IHGXL1UeZWOicM9mQkop2yE0ztjvDn7Io0cLaau/+RxX/PbQ5rxP/KoTTrmql+QnMO3IynXbQNQW4NQTYLDMMI=
X-Received: by 2002:a50:d695:0:b0:60c:6a48:8047 with SMTP id
 4fb4d7f45d1cf-612c7372b54mr112177a12.11.1752784108513; Thu, 17 Jul 2025
 13:28:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250714173554.14223-1-daleyo@gmail.com>
 <20250714173554.14223-7-daleyo@gmail.com>
 <A9DB4AE061FD8BB9+3519a519-1a29-49c1-a07d-28a0577677cc@radxa.com>
In-Reply-To: <A9DB4AE061FD8BB9+3519a519-1a29-49c1-a07d-28a0577677cc@radxa.com>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Thu, 17 Jul 2025 22:27:51 +0200
X-Gm-Features: Ac12FXxK_a1WSy8MtOR75-LLEFBaa3unYMUy-NNcME395brztJd9rIFyyqygTaQ
Message-ID: <CA+kEDGGaKrYO9Pu3un_Nq_6AOZC5L9sG+CEwh2ZEzWFeHGqtEA@mail.gmail.com>
Subject: Re: [PATCH 6/9] drm/msm/dp: Work around bogus maximum link rate
To: Xilin Wu <sophon@radxa.com>
Cc: Dale Whinham <daleyo@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 17 Jul 2025 23:39:59 +0000
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

On 2025/7/17 04:21, Xilin Wu <sophon@radxa.com> wrote :
>
> On 2025/7/15 01:35:42, Dale Whinham wrote:
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
> >   drivers/gpu/drm/msm/dp/dp_panel.c | 13 +++++++++++++
> >   1 file changed, 13 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp=
/dp_panel.c
> > index 4e8ab75c771b..b2e65b987c05 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> > @@ -11,6 +11,8 @@
> >   #include <drm/drm_of.h>
> >   #include <drm/drm_print.h>
> >
> > +#include <linux/dmi.h>
> > +
> >   #define DP_MAX_NUM_DP_LANES 4
> >   #define DP_LINK_RATE_HBR2   540000 /* kbytes */
> >
> > @@ -58,6 +60,17 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_pane=
l *msm_dp_panel)
> >       if (rc)
> >               return rc;
> >
> > +     /*
> > +      * for some reason the ATNA30DW01-1 OLED panel in the Surface Pro=
 11
> > +      * reports a max link rate of 0 in the DPCD. Fix it to match the
> > +      * EDPOverrideDPCDCaps string found in the ACPI DSDT
> > +      */
> > +     if (dpcd[DP_MAX_LINK_RATE] =3D=3D 0 &&
> > +         dmi_match(DMI_SYS_VENDOR, "Microsoft Corporation") &&
> > +         dmi_match(DMI_PRODUCT_NAME, "Microsoft Surface Pro, 11th Edit=
ion")) {
> > +             dpcd[1] =3D DP_LINK_BW_8_1;
> > +     }
> > +
>
> My Galaxy Book4 Edge with the ATNA60CL07-0 panel also reports a max link
> rate of 0. But I think eDP v1.4 panels need a different way to retrieve
> supported links rates, which could be found in the amdgpu [1], i915 [2]
> and nouveau [3] drivers.

Thanks Xilin for the sharing and pointers into 3 other drivers, that
would explain the current limitation for Adreno GPUs. Fixing it would
require a big contribution independent of the actual SP11 enablement.

Is it a feature planned in the short-medium term within the MSM driver?
If not, would a quirk like [4] be acceptable upstream in the meanwhile?

[4] https://github.com/JeromeDeBretagne/linux-surface-pro-11/commit/d265cfb

Thanks a lot,
J=C3=A9r=C3=B4me



> [1]:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/=
drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c#n2098
> [2]:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/=
drivers/gpu/drm/i915/display/intel_dp.c#n4281
> [3]:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/=
drivers/gpu/drm/nouveau/nouveau_dp.c#n101
>
>
> >       msm_dp_panel->vsc_sdp_supported =3D drm_dp_vsc_sdp_supported(pane=
l->aux, dpcd);
> >       link_info =3D &msm_dp_panel->link_info;
> >       link_info->revision =3D dpcd[DP_DPCD_REV];
>
>
> --
> Best regards,
> Xilin Wu <sophon@radxa.com>
