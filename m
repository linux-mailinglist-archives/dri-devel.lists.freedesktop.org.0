Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1470097EB50
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 14:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924F110E3E3;
	Mon, 23 Sep 2024 12:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DO8FLAMD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE96110E3E3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 12:07:35 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-535694d67eeso4395635e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 05:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727093254; x=1727698054; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=uITKFHsG45qX3SEwmrkI/jlizm58nr2czIUA71r1rLY=;
 b=DO8FLAMDKqGajcqoVa0t8NgaVMuad/qoYUz9yAk/dBzM2rmDSvp1vRH5z/oibPCW0D
 oXa+oj1+BVRZ/zpGta9XewRXNUoJ802V11Tp27DeSE8rf7EzaIVLHBcNxVvMxQSXH0Rb
 WArJKbBKvpSf4vNP91tRmugV4KHKNMaeVhhhIQFMBgr+6TpBgLXtA2tlZqeQ4ZEzZ+Fn
 U8JzSmH3SWM5b12oGSObx6aR7Ru2dUYwfsvZRF1VYQ0XEOQDwOwxaeCitmL6Agka8o62
 LqAz4LDZUduAWm2WZoMZqdsOaDyFnriEO/xb4XO1AxEM8WckJ/bCu85WHnME8N81+3P9
 73Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727093254; x=1727698054;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uITKFHsG45qX3SEwmrkI/jlizm58nr2czIUA71r1rLY=;
 b=RKjBgcfMJM+NuyitLc0mWyZ1zkse62mYXzd/cYcmnGnFEg1vVqJNPFHWsaLnjdPMGd
 SNYjCz1rDbUjDV24olVyQTcLHIIwKtyjH11s976+gNgVJzl+A8Rg5WfonJpoUC0V1nWj
 j5OzGo/xqItsMWqcD4QB9nS4wuuaURke7qivXJ6HtUTJn0JtT+1PmtzBpXW3ZflwDor9
 xTovsAinqFPg8jH9tFSV6TD0mhbCICCclCAa5rZI25fq7VCwLMm42I7cFlKD0hEKUjqF
 XhnFtnVV++FfOtHgBgIedquocrygJNu9homWjtz3Ojv2VycNpm6u8/rTSxl5Qf+yTDJU
 6TWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLTUavSg+N8WbPEm5K9gHweKPACFh49AiHoWF/qBDHD5RoWJdsYIWi+3ApUR4ly4cNovH98yQHTvg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy70zH/emoljfDP+Uwcr2+Nkki5IcllIoWMHJju+LBTR0Q498k+
 JOmocqo/nK8+MCHgDsCMMV4jUMEIGb7UUEHOT2BpH+StrdO0cYoAmxtpwmobImA=
X-Google-Smtp-Source: AGHT+IFNx3alq9qp6GjujjWykYrIjuZcFpCTCcLn/Id2delQNZ6kI974LK25jq1p/gKrcRDCvi7/GQ==
X-Received: by 2002:a05:6512:281c:b0:535:5eb2:5281 with SMTP id
 2adb3069b0e04-536a563e90bmr4901526e87.17.1727093253748; 
 Mon, 23 Sep 2024 05:07:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-536870b8ee6sm3249990e87.296.2024.09.23.05.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 05:07:32 -0700 (PDT)
Date: Mon, 23 Sep 2024 15:07:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: zhaoxiong lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, dianders@chromium.org, hsinyi@google.com, 
 awarnecke002@hotmail.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] drm/panel: boe-th101mb31ig002: Modify Starry
 panel timing
Message-ID: <ovmleeivshtixncuxwv3dink6l4fi242rcspklicl3u4qp73rx@km3nu4co4hen>
References: <20240915080830.11318-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240915080830.11318-3-lvzhaoxiong@huaqin.corp-partner.google.com>
 <CAA8EJpqC5tQ45gj8-0bDutinCs7CoxiQVL1EAzwDK9RJTXYMcQ@mail.gmail.com>
 <CA+6=WdR6+nh9e2HCuCVdR6uw3vuJoWfKCG4gPjJMp9db+Quimw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+6=WdR6+nh9e2HCuCVdR6uw3vuJoWfKCG4gPjJMp9db+Quimw@mail.gmail.com>
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

On Mon, Sep 23, 2024 at 05:22:20PM GMT, zhaoxiong lv wrote:
> On Mon, Sep 16, 2024 at 1:15 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Same comment as the one that I've provided to the other patch, plus:
> >
> > On Sun, 15 Sept 2024 at 10:11, Zhaoxiong Lv
> > <lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
> > >
> > > In order to meet the timing, remove the delay between "backlight off"
> > > and "display off", and reduce the delay between "display_off" and
> > > "enter_sleep"
> >
> > Separate commit, separate _justification_. Why, not what.
> >
> > >
> > > Removing variables: display_off_to_enter_sleep_delay_ms
> >
> > This phrase is useless.
> >
> hi Dmitry
> 
> As in another patch reply, in order to solve a black screen problem,
> the delay is reduced.
> The panel spec:
> 1. https://github.com/Vme5o/power-on-off-sequential

It should be described in the commit message(s). You have removed one
delay and added another one. Is that a single fix or two separate fixes?

> 
> > >
> > > Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> > > ---
> > >  drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c | 11 +++++------
> > >  1 file changed, 5 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
> > > index 0b87f1e6ecae..c2d0ec199829 100644
> > > --- a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
> > > +++ b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
> > > @@ -29,7 +29,7 @@ struct panel_desc {
> > >         bool lp11_before_reset;
> > >         unsigned int vcioo_to_lp11_delay_ms;
> > >         unsigned int lp11_to_reset_delay_ms;
> > > -       unsigned int backlight_off_to_display_off_delay_ms;
> > > +       unsigned int display_off_to_enter_sleep_delay_ms;
> > >         unsigned int enter_sleep_to_reset_down_delay_ms;
> > >         unsigned int power_off_delay_ms;
> > >  };
> > > @@ -184,12 +184,10 @@ static int boe_th101mb31ig002_disable(struct drm_panel *panel)
> > >                                                       panel);
> > >         struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> > >
> > > -       if (ctx->desc->backlight_off_to_display_off_delay_ms)
> > > -               mipi_dsi_msleep(&dsi_ctx, ctx->desc->backlight_off_to_display_off_delay_ms);
> > > -
> > >         mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> > >
> > > -       mipi_dsi_msleep(&dsi_ctx, 120);
> > > +       if (ctx->desc->display_off_to_enter_sleep_delay_ms)
> > > +               mipi_dsi_msleep(&dsi_ctx, ctx->desc->display_off_to_enter_sleep_delay_ms);
> > >
> > >         mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> > >
> > > @@ -275,6 +273,7 @@ static const struct panel_desc boe_th101mb31ig002_desc = {
> > >                           MIPI_DSI_MODE_NO_EOT_PACKET |
> > >                           MIPI_DSI_MODE_LPM,
> > >         .init = boe_th101mb31ig002_enable,
> > > +       .display_off_to_enter_sleep_delay_ms = 120,
> > >  };
> > >
> > >  static const struct drm_display_mode starry_er88577_default_mode = {
> > > @@ -302,7 +301,7 @@ static const struct panel_desc starry_er88577_desc = {
> > >         .lp11_before_reset = true,
> > >         .vcioo_to_lp11_delay_ms = 5,
> > >         .lp11_to_reset_delay_ms = 50,
> > > -       .backlight_off_to_display_off_delay_ms = 100,
> > > +       .display_off_to_enter_sleep_delay_ms = 50,
> > >         .enter_sleep_to_reset_down_delay_ms = 100,
> > >         .power_off_delay_ms = 1000,
> > >  };
> > > --
> > > 2.17.1
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
