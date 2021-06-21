Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B603AF1D8
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 19:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0ECB6E2B6;
	Mon, 21 Jun 2021 17:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F109A6E2B6
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 17:25:00 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id i24so9353559edx.4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 10:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yksK4X6+8Tdxbx2WrBBGvKC5wDVLn6otjnHQDHKi3Sk=;
 b=IiEneIKmdV6rzCyUDCUZ6Zz+Anyk4Ca/JUYBnztStiSJgUYyfNTFXU3TbPDrV0Q2lE
 ofxI/KyIeTZYdwiY/ko9mI9iTripS/CuqRRlfBc1B9MC7UwngZKHhu6SFMEM9w9zXA3t
 XxuQIoodnqnKEPvub7DzFx2zKO72bc8NoCkKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yksK4X6+8Tdxbx2WrBBGvKC5wDVLn6otjnHQDHKi3Sk=;
 b=m5l/465KRj/AyBFzCS6UqHfuBEoyLfuil1j6iII7zwWb69gJeFY79dQFzzy9uQwZ1v
 dl4XRqEWAROsEpkfnWnglDWNoi9ulxVcmBEtl0uSJFyrkEkjL6i0SfRVpVDM0P3KtEg3
 C6ZPwNFmdMNiPlsdP8k8ylOku5rJIoMb4uaADfzLa2Q/iD2cmtwNsSQpopiXwKhS8Bu/
 Z3MPikb8LbHIGov6V2dRmTq2OtRvCteOSZ983C5SmwGJOckNdfvJ2uUzkmhdIQCbYPvL
 2HjpEiYbIhbskTpSo3LOLDeSPf1+HbeP8RnVq7sIHERMUC1r6+32a79q44sR/Q2JPB4D
 iWwg==
X-Gm-Message-State: AOAM532U6SkOvlH+K9u8E9qw9SPFIgypBXiLsyOcRWADFrU5wfoRr9PK
 I1eWyRMxBPNKMgsLxln/Xoqibmae+6KK9asPjeq2Pg==
X-Google-Smtp-Source: ABdhPJzOboYh8r/aQbmljjT5nT9gx0qmH5HAkiGD+ULcGDhY8NM8PMJbcJ4AN2GbG4wEzg8xca9IIEVZ9c2OyY2UxDk=
X-Received: by 2002:a05:6402:4408:: with SMTP id
 y8mr5483279eda.55.1624296299381; 
 Mon, 21 Jun 2021 10:24:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200707101912.571531-1-maxime@cerno.tech>
 <YM6dgVb12oITNfc0@pendragon.ideasonboard.com>
 <CAPY8ntC+hzmfrJwWW0ytNdHSXruMKMi7N3K6tdJbp9gDBbJ3Qw@mail.gmail.com>
 <YM+MEsKjdkYAVI5X@pendragon.ideasonboard.com>
 <YM/FwVkkQXX8VrzV@pendragon.ideasonboard.com>
 <CAPY8ntCbzFkbM5fZmo3RVw5okQkVKFcR8TCHOo+xkW7wNk8MQA@mail.gmail.com>
 <YNCMbw6B6OL4Gho3@pendragon.ideasonboard.com>
 <CAMty3ZCsa+=vyqT3S1mjAYH2g57O8_BPciQ-dE4+qTsHWCwSDA@mail.gmail.com>
 <YNCesxIe8cgncnxq@pendragon.ideasonboard.com>
In-Reply-To: <YNCesxIe8cgncnxq@pendragon.ideasonboard.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 21 Jun 2021 22:54:48 +0530
Message-ID: <CAMty3ZBim5nnPKNUy3i4aRxFWK29o-=VaW_aMUmqNZJ8Dn2kKQ@mail.gmail.com>
Subject: Re: [PATCH] drm/vc4: dsi: Only register our component once a DSI
 device is attached
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Eric Anholt <eric@anholt.net>,
 bcm-kernel-feedback-list@broadcom.com, Maxime Ripard <maxime@cerno.tech>,
 Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Mon, Jun 21, 2021 at 7:44 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Jagan,
>
> On Mon, Jun 21, 2021 at 07:41:07PM +0530, Jagan Teki wrote:
> > On Mon, Jun 21, 2021 at 6:26 PM Laurent Pinchart wrote:
> > > On Mon, Jun 21, 2021 at 12:49:14PM +0100, Dave Stevenson wrote:
> > > > On Sun, 20 Jun 2021 at 23:49, Laurent Pinchart wrote:
> > > > > On Sun, Jun 20, 2021 at 09:42:27PM +0300, Laurent Pinchart wrote:
> > > > > > On Sun, Jun 20, 2021 at 03:29:03PM +0100, Dave Stevenson wrote:
> > > > > > > On Sun, 20 Jun 2021 at 04:26, Laurent Pinchart wrote:
> > > > > > > >
> > > > > > > > Hi Maxime,
> > > > > > > >
> > > > > > > > I'm testing this, and I'm afraid it causes an issue with all the
> > > > > > > > I2C-controlled bridges. I'm focussing on the newly merged ti-sn65dsi83
> > > > > > > > driver at the moment, but other are affected the same way.
> > > > > > > >
> > > > > > > > With this patch, the DSI component is only added when the DSI device is
> > > > > > > > attached to the host with mipi_dsi_attach(). In the ti-sn65dsi83 driver,
> > > > > > > > this happens in the bridge attach callback, which is called when the
> > > > > > > > bridge is attached by a call to drm_bridge_attach() in vc4_dsi_bind().
> > > > > > > > This creates a circular dependency, and the DRM/KMS device is never
> > > > > > > > created.
> > > > > > > >
> > > > > > > > How should this be solved ? Dave, I think you have shown an interest in
> > > > > > > > the sn65dsi83 recently, any help would be appreciated. On a side note,
> > > > > > > > I've tested the ti-sn65dsi83 driver on a v5.10 RPi kernel, without much
> > > > > > > > success (on top of commit e1499baa0b0c I get a very weird frame rate -
> > > > > > > > 147 fps of 99 fps instead of 60 fps - and nothing on the screen, and on
> > > > > > > > top of the latest v5.10 RPi branch, I get lock-related warnings at every
> > > > > > > > page flip), which is why I tried v5.12 and noticed this patch. Is it
> > > > > > > > worth trying to bring up the display on the v5.10 RPi kernel in parallel
> > > > > > > > to fixing the issue introduced in this patch, or is DSI known to be
> > > > > > > > broken there ?
> > > > > > >
> > > > > > > I've been looking at SN65DSI83/4, but as I don't have any hardware
> > > > > > > I've largely been suggesting things to try to those on the forums who
> > > > > > > do [1].
> > > > > > >
> > > > > > > My branch at https://github.com/6by9/linux/tree/rpi-5.10.y-sn65dsi8x-marek
> > > > > > > is the latest one I've worked on. It's rpi-5.10.y with Marek's driver
> > > > > > > cherry-picked, and an overlay and simple-panel definition by others.
> > > > > > > It also has a rework for vc4_dsi to use pm_runtime, instead of
> > > > > > > breaking up the DSI bridge chain (which is flawed as it never calls
> > > > > > > the bridge mode_set or mode_valid functions which sn65dsi83 relies
> > > > > > > on).
> > > > > > >
> > > > > > > I ran it on Friday in the lab and encountered an issue with vc4_dsi
> > > > > > > should vc4_dsi_encoder_mode_fixup wish for a divider of 7 (required
> > > > > > > for this 800x1280 panel over 4 lanes) where it resulted in an invalid
> > > > > > > mode configuration. That resulted in patch [2] which then gave me
> > > > > > > sensible numbers.
> > > > > > >
> > > > > > > That branch with dtoverlay=vc4-kms-v3d and
> > > > > > > dtoverlay=vc4-kms-dsi-ti-sn65dsi83 created all the expected devices,
> > > > > > > and everything came up normally.
> > > > > > > It was a busy day, but I think I even stuck a scope on the clock lanes
> > > > > > > at that point and confirmed that they were at the link frequency
> > > > > > > expected.
> > > > > >
> > > > > > Thanks, I'll test your branch and will report the results.
> > > > >
> > > > > I had to apply the following diff to work around a crash:
> > > > >
> > > > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > > > index 55b6c53207f5..647426aa793a 100644
> > > > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > > > @@ -525,6 +525,9 @@ static bool sn65dsi83_mode_fixup(struct drm_bridge *bridge,
> > > > >
> > > > >         /* The DSI format is always RGB888_1X24 */
> > > > >         list_for_each_entry(connector, &ddev->mode_config.connector_list, head) {
> > > > > +               if (!connector->display_info.bus_formats)
> > > > > +                       continue;
> > > > > +
> > > > >                 switch (connector->display_info.bus_formats[0]) {
> > > > >                 case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
> > > > >                         ctx->lvds_format_24bpp = false;
> > > > >
> > > > > connector->display_info.bus_formats is NULL for the HDMI connectors, as
> > > > > I have nothing connected to them, as well as for the writeback
> > > > > connector.
> > > >
> > > > I'm now confused as to what I'm doing as my branch appears NOT to have
> > > > Marek's latest version of the driver as it doesn't have
> > > > sn65dsi83_mode_fixup.
> > > > I need to have another look at what's going on - I think I've got
> > > > branches confused when switching between machines :-( Remaking that
> > > > branch now.
> > > >
> > > > I do see that Marek has sent another patch around
> > > > sn65dsi83_mode_fixup, but it'll still dereference
> > > > connector->display_info.bus_formats[0] on all connectors. Shouldn't it
> > > > only be switching on the one connector that is connected to this
> > > > bridge, not HDMI or writeback connectors? I'm not totally clear on
> > > > which connectors are in that list.
> > > > https://patchwork.freedesktop.org/patch/440175/
> > >
> > > The following series should fix the issue:
> > >
> > > [PATCH] drm/bridge: ti-sn65dsi83: Replace connector format patching with atomic_get_input_bus_fmts
> > > [PATCH 0/5] ti-sn65dsi83: Finalize transition to atomic operations
> >
> > Look like DSI on STM32MP1 seems broken even with these on top of
> > drm-misc/drm-misc-next , anything broken on the tree?
>
> No idea, I don't have a functional display on my RPi CM4 device yet, so
> I can't tell :-)

Look like FB circular dependency patch f611b1e7624c causing the issue.
Maxime is also mentioned same it seems in other response.

Jagan.
