Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA02A2D909
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 22:54:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ABDC10E0C9;
	Sat,  8 Feb 2025 21:54:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nE6iUtwX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A02510E0C9
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 21:54:20 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-307d1ab59c6so30197931fa.1
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 13:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739051659; x=1739656459; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+IUlttlBGiwOKNWSHl5RMZ560JvRYW645eqTcaf0c80=;
 b=nE6iUtwXCHHcPMieZEkElm583h5t6LTPVYQtzGYxTkFThKXIxR/e9EdiulRsHPTjoj
 QaU5qXpGDm/sOGaILRuw394mYrA3yQ2oShKICS8WdCD2joLDekRxAQyQ/t25yJ4Buhd3
 ay4Lzws1E+Y+4aezTVA13wUQ3sa5nZFOPF4eWx+NWh3fmTeU4z68ZLQe5ps7FThUbrG5
 0ELIZNEa634BX0kG0JF2T9EiC4VXFHIDRM9b8onG3WrEVQ0IyPAy5hz4YOMaWiQxNH7o
 dS4coR0FqMO/fAz9gUTAIogbzhw+/Ir/+VKM9ykT+AbAp8madFPyw+ImwOU9kg+WjoBW
 feGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739051659; x=1739656459;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+IUlttlBGiwOKNWSHl5RMZ560JvRYW645eqTcaf0c80=;
 b=vXN8gRmccgrG3cjg8uRXlZESFaXZ63I29auiMpdGERIkD87EBbxB10z0l2z0/PPKIq
 TjGNrIqn6TbJ6Joc+KdJ/MU6pmEg00EAj8l8eTmsT99lQIfzQH8q5+JSL6AG+M9NQihl
 MWgOlv2hyl0drCbsKbkuSN6+XncqWVn39Ux842B0G/EuAzjOSMOJ11n8Bj1theEhU3ua
 +3EKs0gHRy6TML+XgK+Pn1wfO8s/Zswa6sJvrG+kb/cZ57HzBrnIYQDQpKmM1P5tRsio
 kCtV/d6vtP2eka62PYhC2BgbcK2KvXy/LRrv7s2dN6zkrfXUR9cn+N3VPMQGsror1q83
 DpLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6Paseu7Qjd+2kWzaYf/lVHK1T41mnDhkU+cHMZYjNG6f9Zr/QGPKKX/V/yQJLZbySbBf9MWu/vuw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2q4A6RJWymO63iycVWiEN0F8OVaVHjLvETyyg+IKYy2zNcJNh
 U4CL28xjFj/X1vuF2cD8rKQwTUwhFu40N7k6vp6xc35TNT+yt5Rpe1MCAHvnJ1Q=
X-Gm-Gg: ASbGnctRr1Ah24aTAm17zAczidAREsNW5yWydSp5kyVn7Y+mOkhu0mXo8buph+EIo3Q
 cczSj0bXBUuuAG/LYaNcMrvGmQo35ua7dgzCpPKYrckmyu+fmwaN1KBlDbHGwOYgBFNe0XdcHMG
 dX1kjRMxTqtGlf6yQa4UTkstqAbI62TAzlSXJ2X6ia0bUHJ5/KqDlh13iBCyvSODlXmDZ/EEHYJ
 ogINluSgmHvYgHKMc3FktJEPRpxEyv9aDvgGU4azi4KwjISED9b2uR8AwvYZLTG84FL8vrmq8Gm
 GYsBBeo7HGofMq7UWvoSEJesxyhQ1ikNy2/ZJXtC/b8Dsz1LcfLwl2/dJzRFVlnrH7qXPrU=
X-Google-Smtp-Source: AGHT+IHJfBJuM+yjPz1NXD1IyLdQIvQdw0Uqz8vdJkManVm1y5kWHyb3iHB1vHQ9kc9WY6rbefjp7g==
X-Received: by 2002:a05:651c:241:b0:302:2598:dec2 with SMTP id
 38308e7fff4ca-307e57fedf9mr29532621fa.14.1739051658561; 
 Sat, 08 Feb 2025 13:54:18 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-308dea6ab59sm3127321fa.24.2025.02.08.13.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 13:54:17 -0800 (PST)
Date: Sat, 8 Feb 2025 23:54:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Tejas Vipin <tejasvipin76@gmail.com>, neil.armstrong@linaro.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel: visionox-r66451: transition to mipi_dsi
 wrapped functions
Message-ID: <j2uxa226jpttxlzycqpxya2zh34k5uvr2zyy7dhj3xjpouiybk@td6k2ebx5ji6>
References: <20250208051541.176667-1-tejasvipin76@gmail.com>
 <CAD=FV=WmOhHq4qQ5neDjfBy71za3AguvtQ9hFnwf0hwtwSmiqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=WmOhHq4qQ5neDjfBy71za3AguvtQ9hFnwf0hwtwSmiqw@mail.gmail.com>
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

On Sat, Feb 08, 2025 at 12:18:47PM -0800, Doug Anderson wrote:
> Hi,
> 
> On Fri, Feb 7, 2025 at 9:16 PM Tejas Vipin <tejasvipin76@gmail.com> wrote:
> >
> > Change the visionox-r66451 panel to use multi style functions for
> > improved error handling.
> >
> > Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> > ---
> >  drivers/gpu/drm/panel/panel-visionox-r66451.c | 179 ++++++++----------
> >  1 file changed, 76 insertions(+), 103 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-visionox-r66451.c b/drivers/gpu/drm/panel/panel-visionox-r66451.c
> > index 493f2a6076f8..81d615e1937a 100644
> > --- a/drivers/gpu/drm/panel/panel-visionox-r66451.c
> > +++ b/drivers/gpu/drm/panel/panel-visionox-r66451.c
> > @@ -42,85 +42,84 @@ static void visionox_r66451_reset(struct visionox_r66451 *ctx)
> >  static int visionox_r66451_on(struct visionox_r66451 *ctx)
> >  {
> >         struct mipi_dsi_device *dsi = ctx->dsi;
> > +       struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
> >
> >         dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> >
> > -       mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x00);
> > -       mipi_dsi_dcs_write_seq(dsi, 0xc2,
> > -                              0x09, 0x24, 0x0c, 0x00, 0x00, 0x0c, 0x00, 0x00, 0x00,
> > -                              0x09, 0x3c);

[...]

> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf2, 0x19);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdf, 0x50, 0x42);
> > +       mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> > +       mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0, 1080 - 1);
> > +       mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0, 2340 - 1);
> >
> >         dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> 
> I think that to match the old behavior the most correctly, you'd only
> want to clear MIPI_DSI_MODE_LPM if there were no errors, right? All of
> the old mipi_dsi_dcs_write_seq() calls would have returned early in
> the case of an error because of that non-obvious control flow.
> 
> I'm not a total expert on MIPI_DSI_MODE_LPM, but I suspect your new
> behavior is actually more correct, but it might not hurt to at least
> point out this change in behavior in the commit message.

Yes, I think new behaviour is more correct. We should drop LPM flag
after sending init sequence.


-- 
With best wishes
Dmitry
