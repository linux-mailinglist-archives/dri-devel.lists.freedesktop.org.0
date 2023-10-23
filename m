Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 394017D2B68
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 09:35:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C623110E154;
	Mon, 23 Oct 2023 07:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4FCB10E153
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 07:34:54 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-d9cb74cf53fso2637206276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 00:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698046494; x=1698651294; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UvVD2Vf14O9B8kXPrbE8pvJNizR2rdft4kqgfT1VWFE=;
 b=VboAF1jnUpCB1YjJ7ucNpP+DcasUUKl1WSUP/iqJFosp0wklczTGLU68GnwrExjMbV
 NsMzc+fwdKiYeUSbvBXmF0E9qB0VZ0v+o9mfI88s50FTutglQ7LClf2eO/HX+46yLF/l
 ZNLRw4KlJxd3kn/WLdmQabDCirbHx5/9cmKJqLXmJ2CkSXjY61DQU6Jq5/DK1tDQO6MJ
 jA1q2xzby08TtHkNhE2QgeWD0Q3/0gcqNagBek/IHZeAdUtj/U7zwWga0Byj1+5s3mSW
 CtgEVyRG+9amLKzox6ubTpyiqHu+G/yDJh6B1jhmDBn7VS18tUWasU508MDVOOWNqoXb
 srow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698046494; x=1698651294;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UvVD2Vf14O9B8kXPrbE8pvJNizR2rdft4kqgfT1VWFE=;
 b=KXlrh7NNsltMVt5NmZm2qErYU8u2LXxojSiLyutDw9sPKIlOsSJvZ0yh9KTWebXQj2
 ktqdvbaVFPhB+xm1gL+qXWjGs4m7YGLbOkMKpAhYl9QfUGlA/4PgwbaC9RBGAC9XQSIz
 DJtvxxbiADSFAkasVUbpm2+hZielDR4ZxrkOBE27Sy22b2lj6yNWVwzzKjivykVBPz+d
 9c0qcc3cUudI0MIzdUox9sJ4FF1kqcto8FM5GPa3zkhbFp2MPaDgpdP+YiLD4s69dy9G
 OH0fJWRrSwmBaJuf1PwaEXnffp4YnRhtCntQYBkuSx9zH5SpMnNLBYO70EeKMoNUmmcU
 2zwA==
X-Gm-Message-State: AOJu0YyNv2taRvhqlku6ARPX9snlWeMZGUrfN+qLZUR+P0pm/gWjfmeA
 lxB8Um7H5RO/y2Pg2zpj3SPNAEmYuAUpiwwXpo8xfQ==
X-Google-Smtp-Source: AGHT+IGt4nAtdDC++hWsqIdRPEhfnV6IkoVyNUDdWcAokDPoR0GkAGPsVz/zRYARQaZVEGGI2zP0FgmKWac6//hONDM=
X-Received: by 2002:a5b:9d2:0:b0:d9a:47a7:f7c1 with SMTP id
 y18-20020a5b09d2000000b00d9a47a7f7c1mr7713291ybq.42.1698046493712; Mon, 23
 Oct 2023 00:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
 <1907377.IobQ9Gjlxr@steina-w>
 <CAA8EJpoN36PHoZH=Osfn_wr7kO-dypius2ae_FuJ4Hk+gjeBtQ@mail.gmail.com>
 <1871104.tdWV9SEqCh@steina-w>
In-Reply-To: <1871104.tdWV9SEqCh@steina-w>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 23 Oct 2023 10:34:42 +0300
Message-ID: <CAA8EJpofiawC5z3jw1-TsxS+ZWz4QobCby3kScDDdk9Z-74mgQ@mail.gmail.com>
Subject: Re: [RFC PATCH 03/10] drm/mipi-dsi: add API for manual control over
 the DSI link power state
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Maxime Ripard <mripard@kernel.org>, Marek Vasut <marex@denx.de>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-arm-msm@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 23 Oct 2023 at 09:52, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi Dmitry,
>
> Am Sonntag, 22. Oktober 2023, 12:49:41 CEST schrieb Dmitry Baryshkov:
> > On Thu, 19 Oct 2023 at 14:42, Alexander Stein
> >
> > <alexander.stein@ew.tq-group.com> wrote:
> > > Hi,
> > >
> > > Am Donnerstag, 19. Oktober 2023, 13:19:51 CEST schrieb Dmitry Baryshkov:
> > > > On Thu, 19 Oct 2023 at 12:26, Maxime Ripard <mripard@kernel.org> wrote:
> > > > > On Mon, Oct 16, 2023 at 07:53:48PM +0300, Dmitry Baryshkov wrote:
> > > > > > The MIPI DSI links do not fully fall into the DRM callbacks model.
> > > > >
> > > > > Explaining why would help
> > > >
> > > > A kind of explanation comes afterwards, but probably I should change
> > > > the order of the phrases and expand it:
> > > >
> > > > The atomic_pre_enable / atomic_enable and correspondingly
> > > > atomic_disable / atomic_post_disable expect that the bridge links
> > > > follow a simple paradigm: either it is off, or it is on and streaming
> > > > video. Thus, it is fine to just enable the link at the enable time,
> > > > doing some preparations during the pre_enable.
> > > >
> > > > But then it causes several issues with DSI. First, some of the DSI
> > > > bridges and most of the DSI panels would like to send commands over
> > > > the DSI link to setup the device. Next, some of the DSI hosts have
> > > > limitations on sending the commands. The proverbial sunxi DSI host can
> > > > not send DSI commands after the video stream has started. Thus most of
> > > > the panels have opted to send all DSI commands from pre_enable (or
> > > > prepare) callback (before the video stream has started).
> > > >
> > > > However this leaves no good place for the DSI host to power up the DSI
> > > > link. By default the host's pre_enable callback is called after the
> > > > DSI bridge's pre_enable. For quite some time we were powering up the
> > > > DSI link from mode_set. This doesn't look fully correct. And also we
> > > > got into the issue with ps8640 bridge, which requires for the DSI link
> > > > to be quiet / unpowered at the bridge's reset time.
> > >
> > > There are also bridges (e.g. tc358767) which require DSI-LP11 upon bridge
> > > reset. And additionally this DSI-(e)DP bridge requires LP11 while
> > > accessing
> > > DP-AUX channel, e.g. reading EDID. So bridges need at least some control
> > > over DSI line state.
> >
> > For sending commands in LP11 it is typical to toggle the
> > MIPI_DSI_MODE_LPM flag, for example see panel-=jdi-lt070me05000.c or
> > some other drives. It might be a good idea to make that more explicit.
> > All suggestions here would be appreciated.
>
> The biggest difference between that display and the tc358767 bridge is that
> the display uses DSI commands, while the bridge is using i2c transfer to issue
> DP-AUX commands. There is no host_transfer [1] which would enable LP-11.
> It seems this DSI-DP bridge requires LP-11/HS on DSI lanes all times. This
> contradicts current Linux behaviour.

I see. I took a quick glance at the driver. Does the device mark AUX
as busy when there is a HS transfer?
Because otherwise it might be pretty hard to synchronise DP-AUX
transfers with the DSI link state. We might need to add an API for
this, if the DSI hosts actually can signal the blanking / DSI LP.

Side note: the driver needs some care. It doesn't support the aux-bus
bindings for eDP panels, it doesn't support other bridges on top of DP
connectors (but there can be e..g. dp-connector device).

>
> Best regards,
> Alexander
>
> [1] https://www.kernel.org/doc/html/latest/gpu/drm-kms-helpers.html#mipi-dsi-bridge-operation


-- 
With best wishes
Dmitry
