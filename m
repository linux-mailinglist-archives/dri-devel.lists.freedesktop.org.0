Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F6B92D8D9
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 21:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC8510E888;
	Wed, 10 Jul 2024 19:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NxOL9DE3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAAAE10E888
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 19:13:15 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id
 5614622812f47-3d9c4887533so80926b6e.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 12:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1720638794; x=1721243594;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4CJcQA4rqRaCFjiUl3yXOwI538Rxwz2YD9AUd38FoKk=;
 b=NxOL9DE34eMEsgqmOegjxpOB+3QZIMsAY+ggk8NKX+g9OibfzjwngvOGA1dBElEt4K
 ot6FTrMhnjkKAMfCm19mc04mQTXUKeu0N8COFvzZkIav1kR+sYC3bgVmR70+eR1kLHGN
 NWOaKap/9FjdqbhbUjSqBSn32zFOkwUre5CyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720638794; x=1721243594;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4CJcQA4rqRaCFjiUl3yXOwI538Rxwz2YD9AUd38FoKk=;
 b=PJxFJH1+4qBZvdkyFRY+SbfWEQxRgdiVGcMgvo4/RkIxo1DMvaknd1QJxk0VdmqDbg
 ytvWLGd/LJl5pJxgWsR3kqLT46Ou+cSrovxDLVd+dKNgKQ3ifrk9WYzvgOQX96Gx6+eV
 6AGUHPnp6UgF5esvjWaQl97ARvJNjeGh8QuOX4PYCRug9XMW3e0ioyuyHApAQrN/0mK2
 jwh4ZWw7QH9Sacs6/kw6lRgmAWtvDhrcarZZzLpqwRlPXAo3smjFme6aiaptD5h9ZYss
 YQCYG2CfuY+Tl87Iyxj2tKQAwJYZntZmzAwK/n+yzBEV1PEPezaYQs9dsO+1MAo2WY0G
 7CJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6P0FHiT2LHpvC0lZkW3SwwNzHw/ZAdO3gWjzQgejly17Iz6t7cdFtvWQvmz1dm231D5NASLeOLJo9cnU3jEFP8VGeV/yrb9jFBe7LDmU9
X-Gm-Message-State: AOJu0Yz/hiOuHElmsD/y2zKcMtQ4wgLvFIEvbGlqlrSFAHGsfw0jla9c
 doAy89GFt3k0R9ROcSBcHzg1Lw5WB3SLlM08buX6z8FSz+mfry7Z01Wq3egaxxwgTYMrqJuzxZi
 7Rg==
X-Google-Smtp-Source: AGHT+IFPkVB0O+kjuybPeMPaZTzMU5QqaAuS4JL/UiKCP7lz67OEhXIV9LRHdfGUBFO1oqrhKDh5Ow==
X-Received: by 2002:a05:6808:2390:b0:3d5:60fa:d717 with SMTP id
 5614622812f47-3d93c0856ffmr5897857b6e.41.1720638794108; 
 Wed, 10 Jul 2024 12:13:14 -0700 (PDT)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com.
 [209.85.160.178]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79f190103e1sm220879485a.42.2024.07.10.12.13.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jul 2024 12:13:10 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-447f8aa87bfso83891cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 12:13:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUgIG/ZtlD1wuN1DNwD/L64WW0XpNsfSssZGLcHs2hUea1wr19i8HNMlBwXQCZm+IB4onr888t7P1xzD18YWtmPxYMGCLg//p4T6ilay1a/
X-Received: by 2002:ac8:730a:0:b0:447:d7fd:63f with SMTP id
 d75a77b69052e-44d11f851f2mr337601cf.19.1720638789687; Wed, 10 Jul 2024
 12:13:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240710084715.1119935-1-yangcong5@huaqin.corp-partner.google.com>
 <20240710084715.1119935-5-yangcong5@huaqin.corp-partner.google.com>
 <D2LQJROQYIY3.2Q88EXS8HUDLQ@kernel.org>
In-Reply-To: <D2LQJROQYIY3.2Q88EXS8HUDLQ@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 10 Jul 2024 12:12:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WAosZPSKdpwR6pjOmiy4hih=jXaMg2guuVgmc+qj-Csw@mail.gmail.com>
Message-ID: <CAD=FV=WAosZPSKdpwR6pjOmiy4hih=jXaMg2guuVgmc+qj-Csw@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] drm/panel: ili9806e: Break some CMDS into helper
 functions
To: Michael Walle <mwalle@kernel.org>
Cc: Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 quic_jesszhan@quicinc.com, 
 neil.armstrong@linaro.org, linus.walleij@linaro.org, airlied@gmail.com, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Wed, Jul 10, 2024 at 2:02=E2=80=AFAM Michael Walle <mwalle@kernel.org> w=
rote:
>
> On Wed Jul 10, 2024 at 10:47 AM CEST, Cong Yang wrote:
> > Break select page cmds into helper function.
>
> Why though? I don't find that anything easier to read. In fact, I
> deliberately chose not to factor that out into a function. It's just
> a sequence of magic commands, taken straight from the datasheet. So,
> I'd like to keep it that way.

The consensus of previous discussion on the lists was that folks
agreed that we should, where possible, make it more obvious what these
magic sequences of commands were doing. IMO separating out the page
switch command helps. Certainly I'm always happy to hear other
opinions, though.


> -michael
>
> > Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> > ---
> >  drivers/gpu/drm/panel/panel-ilitek-ili9806e.c | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9806e.c b/drivers/gp=
u/drm/panel/panel-ilitek-ili9806e.c
> > index e4a44cd26c4d..68fb9a1a4d80 100644
> > --- a/drivers/gpu/drm/panel/panel-ilitek-ili9806e.c
> > +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9806e.c
> > @@ -35,6 +35,12 @@ struct ili9806e_panel {
> >       enum drm_panel_orientation orientation;
> >  };
> >
> > +#define ILI9806E_DCS_SWITCH_PAGE     0xff
> > +
> > +#define ili9806e_switch_page(ctx, page) \
> > +     mipi_dsi_dcs_write_seq_multi(ctx, ILI9806E_DCS_SWITCH_PAGE, \
> > +                                  0xff, 0x98, 0x06, 0x04, (page))
> > +
> >  static const char * const regulator_names[] =3D {
> >       "vdd",
> >       "vccio",
> > @@ -227,7 +233,7 @@ static void ili9806e_dsi_remove(struct mipi_dsi_dev=
ice *dsi)
> >  static void com35h3p70ulc_init(struct mipi_dsi_multi_context *ctx)
> >  {
> >       /* Switch to page 1 */
> > -     mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0xff, 0x98, 0x06, 0x04, 0=
x01);
> > +     ili9806e_switch_page(ctx, 0x01);

I think with your change you should remove the "Switch to page X"
comments since they're now obvious. Other than that, I'm happy with:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
