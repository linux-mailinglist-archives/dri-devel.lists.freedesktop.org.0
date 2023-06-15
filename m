Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B147323B8
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 01:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CB9310E585;
	Thu, 15 Jun 2023 23:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2AAD10E577
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 23:36:53 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-982ae93386aso4140866b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 16:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686872210; x=1689464210;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T0rZt7VTxPy2u4yytr6naYAQkiPv4eyJaIUeBq2hAvA=;
 b=BsFh7pTECPY62B6Mo0QO9rWv012oVDHuxhwwrPAaeMEA22WtZNUWqEdjmSH9i0fINa
 c4/3q3cX+u7akxgAu5ovYLFBoIqV0qgi+Q3FdwJgE8m+8y9UWVZ2wEjHPGGeyMKEySIp
 e7atN573VBzDevK7Rec+MyK/WI490N0uWwOu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686872210; x=1689464210;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T0rZt7VTxPy2u4yytr6naYAQkiPv4eyJaIUeBq2hAvA=;
 b=jCD8y41hvMT8sxbb0byu7uEw2CJBzR4V5sJq8bvPZgWOrzFV0hDsiDp0D3VPCpV2Ez
 Q5TIauUx63wulus5/e4cS3T063ps+qqWnM2WUDATo9pDn1NtPD/bt3GEVP2k9X7kdp8Q
 1R7BWwMuQ9mMc9w/GjA020BDtNGMxmk7IFjTH3vrGVNYapEhcgmK60tDbwKeDuTXMBjG
 fRZNTYx+NDdCJwArPED/WxihD+XVPssEGSz487rGrJOr125z65XWhObYzLoHNtTCe9o/
 ygWQOQ9e6lsvu6nIEyx5KTatWtfaymtoLXgEDk9OIXTsY3up8E+ir0u2+yWjmCMp2vqG
 r9cA==
X-Gm-Message-State: AC+VfDztOC7Vl7noNJETksPaLVPxmQC5lkKNbZs/NnmfQt2o33NYD6GC
 K7YA80t7Jm/Yz1sfyFW4uOvG3YaXda2nb43+I783JgaS
X-Google-Smtp-Source: ACHHUZ5CZdb7RQbabLpORp9m3NQlToVRupss/VUJlrRA15Pzk9ajzl0FyXOZ3rAJZRGWeY918HzEpA==
X-Received: by 2002:a17:907:5c2:b0:974:55a2:cb0b with SMTP id
 wg2-20020a17090705c200b0097455a2cb0bmr311641ejb.55.1686872209830; 
 Thu, 15 Jun 2023 16:36:49 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com.
 [209.85.208.44]) by smtp.gmail.com with ESMTPSA id
 z6-20020a1709060ac600b009745ecf5438sm9914838ejf.193.2023.06.15.16.36.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jun 2023 16:36:47 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-513ea2990b8so4576a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 16:36:47 -0700 (PDT)
X-Received: by 2002:a50:d681:0:b0:514:95d4:c2bb with SMTP id
 r1-20020a50d681000000b0051495d4c2bbmr182302edi.2.1686872207006; Thu, 15 Jun
 2023 16:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230613-panel-dsi-disable-v1-1-5e454e409fa8@linaro.org>
 <ZIjayn8nVy-ejThH@gerhold.net>
 <CACRpkdZ7a3aARMs3iBbBavF_0AkPOPs3fH8e6CrZYo7Ybr6m_A@mail.gmail.com>
 <4f78b601-6e6e-2274-3174-87c62d7cfcd5@linaro.org>
In-Reply-To: <4f78b601-6e6e-2274-3174-87c62d7cfcd5@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 15 Jun 2023 16:36:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X_xonf1Dz0BsNTKm4-zBm+ccKvPO+wEWFVMUVY_2=h3Q@mail.gmail.com>
Message-ID: <CAD=FV=X_xonf1Dz0BsNTKm4-zBm+ccKvPO+wEWFVMUVY_2=h3Q@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: move some dsi commands from unprepare to
 disable
To: neil.armstrong@linaro.org
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
Cc: Caleb Connolly <caleb.connolly@linaro.org>, phone-devel@vger.kernel.org,
 Stephan Gerhold <stephan@gerhold.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-arm-msm@vger.kernel.org,
 Joel Selvaraj <joelselvaraj.oss@gmail.com>, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Thierry Reding <treding@nvidia.com>, Sam Ravnborg <sam@ravnborg.org>,
 Ajay Kumar <ajaykumar.rs@samsung.com>, Joel Selvaraj <jo@jsfamily.in>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jun 15, 2023 at 12:49=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> On 14/06/2023 22:58, Linus Walleij wrote:
> > On Tue, Jun 13, 2023 at 11:08=E2=80=AFPM Stephan Gerhold <stephan@gerho=
ld.net> wrote:
> >
> >> I'm still quite confused about what exactly is supposed to be in
> >> (un)prepare and what in enable/disable. I've seen some related
> >> discussion every now and then but it's still quite inconsistent across
> >> different panel drivers... Can someone clarify this?
> >
> > It is somewhat clarified in commit 45527d435c5e39b6eec4aa0065a562e7cf05=
d503
> > that added the callbacks:
> >
> > Author: Ajay Kumar <ajaykumar.rs@samsung.com>
> > Date:   Fri Jul 18 02:13:48 2014 +0530
> >
> >      drm/panel: add .prepare() and .unprepare() functions
> >
> >      Panels often require an initialization sequence that consists of t=
hree
> >      steps: a) powering up the panel, b) starting transmission of video=
 data
> >      and c) enabling the panel (e.g. turn on backlight). This is usuall=
y
> >      necessary to avoid visual glitches at the beginning of video data
> >      transmission.
> >
> >      Similarly, the shutdown sequence is typically done in three steps =
as
> >      well: a) disable the panel (e.g. turn off backlight), b) cease vid=
eo
> >      data transmission and c) power down the panel.
> >
> >      Currently drivers can only implement .enable() and .disable() func=
tions,
> >      which is not enough to implement the above sequences. This commit =
adds a
> >      second pair of functions, .prepare() and .unprepare() to allow mor=
e
> >      fine-grained control over when the above steps are performed.
> >
> >      Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> >      [treding: rewrite changelog, add kerneldoc]
> >      Signed-off-by: Thierry Reding <treding@nvidia.com>
> >
> > My interpretation is that .enable/.disable is for enabling/disabling
> > backlight and well, make things show up on the display, and that
> > happens quickly.
> >
> > prepare/unprepare is for everything else setting up/tearing down
> > the data transmission pipeline.
> >
> > In the clock subsystem the enable/disable could be called in fastpath
> > and prepare/unprepare only from slowpath so e.g an IRQ handler
> > can gate a simple gated clock. This semantic seems to have nothing
> > to do with the display semantic. :/
>
> It had to do, .prepare is called when the DSI link is at LP11 state
> before it has switched to the VIDEO mode, and .unprepare is the
> reverse when VIDEO mode has been disabled and before the DSI link
> is totally disabled.
>
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/bridge/syn=
opsys/dw-mipi-dsi.c#L938
>
> then
>
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/bridge/syn=
opsys/dw-mipi-dsi.c#L855
>
> but Doug has started changing this starting with MSM DSI driver, leading =
to
> current panel drivers not working anymore with the current DSI init mode
> and requires setting pre_enable_prev_first for only some DSI hosts
> who switched out of set_mode().
>
> The DSI init model doesn't fit at all with the atomic bridge model and
> some DSI controllers doesn't support the same features like the allwinner
> DSI controller not support sending LP commands when in HS video mode
> for example.

Summary of the history here as I understand it:

1. Before the switch to DRM_PANEL_BRIDGE, things worked OK.

2. After the switch to DRM_PANEL_BRIDGE, things broke for tc358762.
That led to commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup
to modeset time"), which was a little ugly but sorta OK, except ...

3. Moving the DSI host powerup to modeset time broke ps8640. That led
to commit ec7981e6c614 ("drm/msm/dsi: don't powerup at modeset time
for parade-ps8640"), which was a hack.

4. We fixed tc358762 using the new "pre_enable_prev_first" in commit
55cac10739d5 ("drm/bridge: tc358762: Set pre_enable_prev_first") and
thus were able to undo moving DSI host powerup to modeset time and
then undo the ps8640 hack. I talk about this a bit more in the message
for commit 9e15123eca79 ("drm/msm/dsi: Stop unconditionally powering
up DSI hosts at modeset").

If there are other things that need "pre_enable_prev_first" we could
do that. If I understand Dave Stevenson [1], though, this doesn't hurt
but technically shouldn't be required. He says that "It is documented
that the mipi_dsi_host_ops transfer function should be called with the
host in any state [1], so the host driver is failing there." Even if
it shouldn't be required, though, "pre_enable_prev_first" can still
have a benefit as Dave says [2] because it would mean that the DSI
controller doesn't have to power itself up and down for each
transfer...

If I understand, if the MSM DSI driver did what Dave said (proactive
turn on if someone sends commands) then we'd actually be OK even with
ps8640, since we don't send any commands in the ps8640 pre_enable()
function.

I guess one other point of reference is commit a3ee9e0b57f8
("drm/panel: boe-tv101wum-nl6: Ensure DSI writes succeed during
disable"). I think Stephen made that change before
"pre_enable_prev_first" was widely available...

Hopefully I summarized all that correctly. If I messed up, please yell.

I guess the tl;dr (summary of my summary) is:

a) Moving panels like this to "pre_enable_prev_first" seems like a
reasonable idea anyway and (presumably) works around the issue.

b) Moving some commands between disable() / post_diable() or
pre_enable() / enable() can also make sense and isn't terrible. As
people have pointed out, there is some vagueness on exactly what
belongs in each.

c) Ideally someone could fix the MSM DSI driver to behave as Dave documente=
d.


[1] https://lore.kernel.org/r/CAPY8ntA=3DDq6GFQ3gEOm9PzPyOa9bHTr8JrpXLibnai=
7xKqRbpQ@mail.gmail.com
[2] https://lore.kernel.org/r/CAPY8ntAUhVB6UtQTeHAcxNW950Ou+NcEoGwk3JnVWLay=
89_0Nw@mail.gmail.com
