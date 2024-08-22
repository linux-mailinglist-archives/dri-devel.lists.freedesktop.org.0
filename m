Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBF595B830
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 16:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C6A10EAE3;
	Thu, 22 Aug 2024 14:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="bSboo3rb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0F910EAE3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 14:20:41 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id
 006d021491bc7-5daa4f8f1c4so601237eaf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 07:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724336438; x=1724941238;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SMvcrfJAhB5h4XFF3sFhLtI9e6UgOu5Ml/MtEViBiC0=;
 b=bSboo3rbwlt3lMHd+h54+UL8pPLtYXLIFL/GyUe/rxfGWM7M69Aia4YU2E/H6rOpoE
 C8pnDn6/Uv40KemeQ1OdQA9WoZOwGS3FdX33GYhWzwERfBgCM91VTVyJozq87wKFCLWJ
 xsiI6rSXGwGrlmdPADrvOSTaIDa13M4mGiD1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724336438; x=1724941238;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SMvcrfJAhB5h4XFF3sFhLtI9e6UgOu5Ml/MtEViBiC0=;
 b=LcqHfGedWmFbexHicMPOzJMQDssejh37OX9Y4E2+ObU2uqHfhGfl4puzmWm4mE4iws
 enPkAKQDETZ384JxdsbrGtyETcW3KUWjfxb/T4sV/UW+q3/NQVpAkU4ucAOzzVpt7kSg
 Xhqbz1zElP/hssb4sUwnJTGe0+7V5jJsLVk7HSrP+wqwiEODKiAj2AvasbG7KscNX60k
 AXgiAGWwOnEyndn7eCJ/iPhP0LzeDzWtRH+8deX0EcYZPER8YouRfNxw+5opqxA6vcKt
 5kQu5z3VVvhBsX6QSoalE/KYuv8xZMHa7KfXZvzVDqTA23jtcrEF5OKgB/Z8lr9H93xZ
 87DQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUALOAisLz/dKuHgLC6YVOJv0I01yxrA6ASTLkNImKSu+4zu9zYkrdyJTMn/e/AIfRTrq9aStKlM5s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywi1lGxFXrzUqnN/ELXWLIHK0RPcqGg/kiPoOi1P4+19dUNDnUP
 wQIVfh55tlPnHyrvaLmHlZ0C/XSc7FWpOVawJ1fpRG6dI9CBNyWfHwVbSwYz8lI5cCQ4LKFjCbY
 =
X-Google-Smtp-Source: AGHT+IGt+a9Ssk5i/GVZ8z2hl+oGuBsWouwxLixSQW/mhZEzB6w5ewL5DhArLJzU04nTwts+sq5+bA==
X-Received: by 2002:a4a:ee89:0:b0:5da:a462:6a30 with SMTP id
 006d021491bc7-5dcb64fc586mr2422756eaf.1.1724336438437; 
 Thu, 22 Aug 2024 07:20:38 -0700 (PDT)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com.
 [209.85.161.42]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5dcb5bd9efbsm288377eaf.8.2024.08.22.07.20.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Aug 2024 07:20:37 -0700 (PDT)
Received: by mail-oo1-f42.google.com with SMTP id
 006d021491bc7-5da686531d3so581041eaf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 07:20:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWhyGs96ossTuXLXGDydXQC0dmH7/rGVoR9nzEepsIQRfIzoBJKIacFZZ9RFXP2mgZ29/HUmPqTzoc=@lists.freedesktop.org
X-Received: by 2002:a05:6820:180c:b0:5c6:60d9:b0e1 with SMTP id
 006d021491bc7-5dcb64fc8bfmr2617864eaf.2.1724336436661; Thu, 22 Aug 2024
 07:20:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240822093442.4262-1-hanchunchao@inspur.com>
 <CAHwB_N+1a9pWTVZmWb6tDTR0S1G5tCj7zJx9xaOL_tBTS5oTtQ@mail.gmail.com>
In-Reply-To: <CAHwB_N+1a9pWTVZmWb6tDTR0S1G5tCj7zJx9xaOL_tBTS5oTtQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 22 Aug 2024 07:20:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UapLj46M7jbyg-_qZN77iUjDD7B3sPdOU6wJazqjLtHQ@mail.gmail.com>
Message-ID: <CAD=FV=UapLj46M7jbyg-_qZN77iUjDD7B3sPdOU6wJazqjLtHQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: fix null pointer dereference in
 hx83102_get_modes
To: cong yang <yangcong5@huaqin.corp-partner.google.com>
Cc: Charles Han <hanchunchao@inspur.com>, neil.armstrong@linaro.org, 
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, liuyanming@ieisystem.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Aug 22, 2024 at 3:02=E2=80=AFAM cong yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> Hi,
>
> Charles Han <hanchunchao@inspur.com> =E4=BA=8E2024=E5=B9=B48=E6=9C=8822=
=E6=97=A5=E5=91=A8=E5=9B=9B 17:34=E5=86=99=E9=81=93=EF=BC=9A
> >
> > In hx83102_get_modes(), the return value of drm_mode_duplicate()
> > is assigned to mode, which will lead to a possible NULL
> > pointer dereference on failure of drm_mode_duplicate(). Add a
> > check to avoid npd.
> >
> > Fixes: 0ef94554dc40 ("drm/panel: himax-hx83102: Break out as separate d=
river")
> >
> > Signed-off-by: Charles Han <hanchunchao@inspur.com>

Note: please no blank line between "Fixes" and "Signed-off-by". All
tags should be together in the last "paragraph".


> > ---
> >  drivers/gpu/drm/panel/panel-himax-hx83102.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/=
drm/panel/panel-himax-hx83102.c
> > index 6e4b7e4644ce..7c2a5e9b7fb3 100644
> > --- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
> > +++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
> > @@ -565,6 +565,10 @@ static int hx83102_get_modes(struct drm_panel *pan=
el,
> >         struct drm_display_mode *mode;
> >
> >         mode =3D drm_mode_duplicate(connector->dev, m);
> > +       if (!mode) {
> > +               dev_err(&ctx->dsi->dev, "bad mode or failed to add mode=
\n");
> > +               return -EINVAL;
> > +       }
>
>  In my V2 series, Doug suggested:
> "nit: no need for an error message when drm_mode_duplicate() fails.
> It is incredibly unlikely that the allocation will fail and the Linux"
>
> https://lore.kernel.org/all/CAD=3DFV=3DV2O2aFDVn5CjbXfgcOLkmNp-G3ChVqQKou=
B2mDB+NZug@mail.gmail.com/

Sorry for missing that we still need the NULL check and we should
definitely add it in. Cong is right, though, that the error message
here is pointless. The only way the function can fail is if a small
memory allocation fails. Even though such a small allocation failing
is basically impossible, kernel policy is still to check for NULL so
we should add the check. ...but the kernel already adds a WARN_ON
splat for all failed allocations so the extra message here is just
wasteful.

-Doug
