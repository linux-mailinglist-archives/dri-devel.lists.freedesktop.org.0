Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 445ED6D6B08
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 20:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4530810E282;
	Tue,  4 Apr 2023 18:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E057D10E282
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 18:01:03 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id n125so39685868ybg.7
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 11:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680631263;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vVGjnQzjacxJYEz87CLNCMx+IAs8NBMqV1ppnHwQkAw=;
 b=XXNM5G/e4+7WGEJMh/0CUXkvl4f4Fmm6ueNyhHj+vvgL8NbCtyA5mCU59kXHBO7mFM
 ecXc6lnvlZ8x45R1E8NxIquiDE7oEVWgHmWg78aEWFSw9/nlFBf5EWtLlvQuunmnpo+K
 mOiR7Cz+vQ3Zb1ILAfElpP0siKSu0cSui5JlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680631263;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vVGjnQzjacxJYEz87CLNCMx+IAs8NBMqV1ppnHwQkAw=;
 b=VJNjDkU8myat/mY+ldqBRauUso4IysBcvwbAL/dlH5h94E918p7BrIOcDSNZCOkgzD
 0gDyXOefTE7GKp0mpZ+dETWrwX6lkygvkLSKzkDj/uSm6LJVsITkTK6s9RnEOVd4i113
 JqyVUPtNq3CFxZ9bBMBze+4GXLdpTb41Qk67CJ4guBqYk1hi6hRiD2LUQ4cuJTMK3hyn
 5h/xoQ8y84POCjwnKZN16TQULE5UJbgmn91bJMFROaYmb0YLlAgARN8I6QcsmOY+lse1
 olxatHlBHvo7IPpGZ+YliHFgSDtIZQ+8LB5GsylzPkYfnViTCg/E8dFzsb7b01IyGlnN
 IfFQ==
X-Gm-Message-State: AAQBX9cJszWzArrwFZfmNNn1E8FPHNjq5UeKKJDH9XuClPovtId0a+sq
 7XS1OAjoHzk35cExWW/iTMaYIE2VveOwz4Xk/QOACw==
X-Google-Smtp-Source: AKy350bQTCB60Rqax5fRgoQLjYERVAEuYc37U6g7A5Bs98TMEm8n6mfyD+v6TiOUuLdhmb53xMGpdkYI60/jeAAbab4=
X-Received: by 2002:a25:cb83:0:b0:b6a:5594:5936 with SMTP id
 b125-20020a25cb83000000b00b6a55945936mr2365120ybg.5.1680631262560; Tue, 04
 Apr 2023 11:01:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230329131929.1328612-1-jagan@amarulasolutions.com>
 <CAPY8ntCJP53uiGNQHUZqma08Vsxfwm7KvAkgMzK=hn4AxJLS3A@mail.gmail.com>
 <20230329164638.v43la4l7rxut6hk6@penduick>
 <CAMty3ZCsn6OR1-TvqFXP48iamG-k5sPU1_CH2fNLBQP3Ofb0QA@mail.gmail.com>
 <CAPY8ntCpmKPzPVjRWS7Pf1Fat9V_JqGD4BaMo8P8_o+74DeDiQ@mail.gmail.com>
In-Reply-To: <CAPY8ntCpmKPzPVjRWS7Pf1Fat9V_JqGD4BaMo8P8_o+74DeDiQ@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 4 Apr 2023 23:30:50 +0530
Message-ID: <CAMty3ZCdqwbx0_N7rseZuGOKUz-KgUOwmOpNobKK5jr4q7WK8A@mail.gmail.com>
Subject: Re: [PATCH v7 10/12] drm/bridge: Implement enable_next_first to alter
 bridge init order
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

On Thu, Mar 30, 2023 at 3:31=E2=80=AFPM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Jagan
>
> On Thu, 30 Mar 2023 at 07:56, Jagan Teki <jagan@amarulasolutions.com> wro=
te:
> >
> > On Wed, Mar 29, 2023 at 10:16=E2=80=AFPM Maxime Ripard <maxime@cerno.te=
ch> wrote:
> > >
> > > On Wed, Mar 29, 2023 at 05:28:28PM +0100, Dave Stevenson wrote:
> > > > On Wed, 29 Mar 2023 at 14:19, Jagan Teki <jagan@amarulasolutions.co=
m> wrote:
> > > > >
> > > > > DSI sink devices typically send the MIPI-DCS commands to the DSI =
host
> > > > > via general MIPI_DSI_DCS read and write API.
> > > > >
> > > > > The classical DSI sequence mentioned that the DSI host receives M=
IPI-DCS
> > > > > commands from the DSI sink first in order to switch HS mode prope=
rly.
> > > > > Once the DSI host switches to HS mode any MIPI-DCS commands from =
the
> > > > > DSI sink are unfunctional.
> > > >
> > > > That statement contradicts the spec.
> > > > The DSI spec section 8.11.1 Transmission Packet Sequences says that
> > > > during any BLLP (Blanking or Low Power) period the host can do any =
of:
> > > > - remain in LP-11
> > > > - transmit one or more non-video packets from host to peripheral in=
 escape mode
> > > > - transmit one or more non-video packets from host to peripheral in
> > > > using HS mode
> > > > - receive one or more packets from peripheral to host using escape =
mode
> > > > - transmit data on a different virtual channel.
> > > >
> > > > Indeed if the sink doesn't set MIPI_DSI_MODE_LPM /
> > > > MIPI_DSI_MSG_USE_LPM, then the expectation is that any data transfe=
r
> > > > will be in HS mode.
> > > >
> > > > That makes me confused as to the need for this patch.
> > >
> > > Yeah, and it looks like that would break the expectation that, in
> > > enable, a bridge can expect its controller to be in HS mode.
> > >
> > > I think that was Jagan is trying to do is to work around an issue wit=
h
> > > the Allwinner DSI driver:
> > > https://elixir.bootlin.com/linux/v6.3-rc4/source/drivers/gpu/drm/sun4=
i/sun6i_mipi_dsi.c#L775
> >
> > Correct and I can see it seems to be a classic DSI sequence observed
> > in dw-mipi-dsi as well - based on Neil's comments.
> > https://lore.kernel.org/all/9aa3d19d-4378-aaf3-6857-c40be5d252c7@baylib=
re.com/
>
> Neil's comments are from 2021, and his response would appear to be
> with regard the PHY power up sequence issues that
> pre_enable_prev_first should solve. The DSI host pre_enable can now be
> called before the sink's pre_enable, therefore allowing the PHY to be
> configured in pre_enable. Hacking the PHY init into mode_set is
> therefore not required.
>
> I don't see any restriction in dw-mipi-dsi over when transfer can be
> called (as long as it is between pre_enable and post_disable), and it
> supports MIPI_DSI_MSG_USE_LPM for requesting the command be sent in
> either LP or HS mode.
>
> > In fact, I did follow and initialize the command-mode mode_set which
> > set low-speed DCS and switch back to video-mode @enable and switch to
> > HS but could see the same issue as the host cannot accept DCS as
> > before (I might implement improper sequence, but not sure due to lack
> > of documentation). But this sequence has issues with calling
> > post_disable twice even on dw-mipi-dsi.
>
> Calling up/down the bridge chain from within other bridge elements is
> going to have issues and shouldn't be necessary.
>
> The comment in dw-mipi-dsi post_disable[1]
> * TODO Only way found to call panel-bridge post_disable &
> * panel unprepare before the dsi "final" disable...
> * This needs to be fixed in the drm_bridge framework and the API
> * needs to be updated to manage our own call chains...
>
> It has now been fixed up with pre_enable_prev_first.

This seems not fixed in dw-mipi-dsi and it often still requires the
forth and back switch of HS mode even if pre_enable_prev_first.

Thanks,
Jagan.
