Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F08F06712CA
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 05:50:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF56E10E67A;
	Wed, 18 Jan 2023 04:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2AC610E67A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 04:50:34 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id bn6so35369975ljb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 20:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
 :from:references:in-reply-to:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mxHmCLyxCtxqovft70l3YWZ7M9nPAwuaYmzKmP5Vdk8=;
 b=QHN9KuLNwUOEpAQz7/9/npcURu9nh3xi4LJG8DdLa3vO3LQMZdIxS+2rNCBviCh3oA
 bBD7qjE1rLw3m/tVpdzEqpdHYfx9xcVyvpnGDYHzb28AWUwtQHhqtULHg+i86JB0uOmY
 mCH1MaCVxU+yaR0WqvnG3OE8OYw+4tQjE2DIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
 :from:references:in-reply-to:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mxHmCLyxCtxqovft70l3YWZ7M9nPAwuaYmzKmP5Vdk8=;
 b=Ojow+9M+E2lxcaOEn19EYSEtO/GAnZfo+Jn7RqwCk7VC/PLVM6gX8kim8PQQpsr3yI
 fg4yjkp8Cbe3fxHTo+BGDOogmWOx0fsWHU1KiWeWswyJkQkhX7JiyMMHXWsJ/w83NerH
 +W4NNy1fbr8a+v+6mjEhAtXlisn7KwtsTLLBUPIvyt9flgmGu/Il3BpfLlznwi3D1uGA
 ETSDp6/F5DjJm+vHsl1bmUSE8VvOvWwcWXWEDmImeaV3q6DNZfKxluQLOM+CfIWkYASt
 H2rC8qv9vpmt6TF/B7zGLAEHtpgWq8wvJtdxMAviB0Jd17DaWzt+YKmHBoiJRRIDz3qh
 Jelg==
X-Gm-Message-State: AFqh2kpyOK211FGB5wV6HEUemG/Qdwy05GItQ3lBkR2kkY3qlCqgydI5
 FMxyHcsvxMsmkpHPhFfyVEMjWqyOzu28PPYfqe6uKw==
X-Google-Smtp-Source: AMrXdXs1wB3tC8P9IFtpxqdvJAiuejEDy4DNJkFrxMFxuFOT6senstkO3M6au8sdTnY8QF0yYjtgWQ2Ygcu8p6F9+3o=
X-Received: by 2002:a2e:a49a:0:b0:28b:6abf:29ea with SMTP id
 h26-20020a2ea49a000000b0028b6abf29eamr496414lji.359.1674017433221; Tue, 17
 Jan 2023 20:50:33 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 17 Jan 2023 20:50:32 -0800
MIME-Version: 1.0
In-Reply-To: <CAPY8ntCcHG2A7LHT-jVa9SzvPggxBP8z-t_3rEy+YY8UVHNL9A@mail.gmail.com>
References: <20230106030108.2542081-1-swboyd@chromium.org>
 <CAPY8ntA=Dq6GFQ3gEOm9PzPyOa9bHTr8JrpXLibnai7xKqRbpQ@mail.gmail.com>
 <CAE-0n53UFuyYvjJUWViXy9Eex2mpBRJGtt4vGc2cbFZS9i8xFw@mail.gmail.com>
 <CAPY8ntCcHG2A7LHT-jVa9SzvPggxBP8z-t_3rEy+YY8UVHNL9A@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 17 Jan 2023 20:50:32 -0800
Message-ID: <CAE-0n52fLBLG2dkCe7376TrfoGLcVrYTHYnULNvnbVEZAT-CNw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: boe-tv101wum-nl6: Ensure DSI writes succeed
 during disable
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Jitao Shi <jitao.shi@mediatek.com>,
 yangcong <yangcong5@huaqin.corp-partner.google.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, patches@lists.linux.dev,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dave Stevenson (2023-01-16 06:11:02)
> Hi Stephen
>
> On Fri, 13 Jan 2023 at 21:12, Stephen Boyd <swboyd@chromium.org> wrote:
> >
> >
> > Thanks for the info! It says "Drivers that need the underlying device t=
o
> > be powered to perform these operations will first need to make sure it=
=E2=80=99s
> > been properly enabled." Does that mean the panel driver needs to make
> > sure the underlying dsi host device is powered? The sentence is too
> > ambiguous for me to understand what 'drivers' and 'underlying device'
> > are.
>
> The DSI host driver (ie in your case something under
> drivers/gpu/drm/msm/dsi) should ensure that a transfer can be made,
> regardless of state.
>
> I must say that this has been documented as the case, but doesn't
> necessarily reflect reality in a number of drivers.

Alright, thanks for the clarification.

> >
> > Cool. Glad that we can clean that up with your series.
> >
> > Is it wrong to split unprepare to a disable and unprepare phase? I'm no=
t
> > super keen on fixing 6.1 stable kernels by opting this driver into the
> > ordering change. Splitting the phase into two is small and simple and
> > works. I suspect changing the ordering may uncover more bugs, or be a
> > larger task. I'd be glad to test that series[2] from you to get rid of
> > [3].
>
> Ah, I hadn't realised it was a regression in a released kernel :(
>
> Splitting into a disable and unprepare is totally fine. Normally
> disable would normally disable the panel and backlight (probably by
> drm_panel before the panel disable call), with unprepare disabling
> power and clocks
>
> Do note that AIUI you will be telling the panel to enter sleep mode
> whilst video is still being transmitted. That should be safe as the
> panel has to still be partially active to handle an exit sleep mode
> command, but actually powering hardware down at that point could cause
> DSI bus arbitration errors as clock or data lanes could be pulled down
> when the host is trying to adopt HS or LP11.
>

Ok. I don't think I'm running into that issue, but I have run into a
different issue. I tried to split the prepare phase into enable and
prepare with the DSI writes in the enable to make things symmetric but
that totally failed. Now I get lots of timeouts when enabling the panel.

This patch is still the best fix I have. Maybe with your series we can
combine the unprepare and disable ops together again (i.e. revert this)
so that power is removed immediately after sending the DSI commands?  Or
is that not enough to avoid the DSI bus arbitration problems you're
talking about? When is the host adopting HS or LP11 with regards to the
bridge ops?
