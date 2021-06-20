Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD433ADF09
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jun 2021 16:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFFA8891D1;
	Sun, 20 Jun 2021 14:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E621F891D1
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jun 2021 14:29:20 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 o39-20020a05600c5127b02901d23584fd9bso9187680wms.0
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jun 2021 07:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UaZFNuj1O/NYbAadi023WB7PHzorR9ng9Ol+jKOeGsk=;
 b=Gnhizufn9jrPCX1RwZWU28OPnl/VYBREN9SZ8eeQeOELXn0tTZHAyPjClVna7+zdnh
 lDilGeMPdtEJIPJxxbFLt6bZgChnjeiejesQczFSAb/0aWhsVu7BkttzMjtQhR4cWwAD
 8KTEGGm60Otb34Wir8yuucmucsqLuSrVFex/Vzm9nIs8F2T9kISl0ANg8p/GXwZpEY7Q
 Soxh2QQGrt0RA5uNtPbA0XTcoaqTxGEMMoigHQvJLfHGXDXuoeNlimIQlrL6CUo8xAGy
 Bc7wYIBAH3eGmpbkU11ZLe6BzHaBIaOJjTS+LsSFUmAj/tzi+L4iRUeB0UmDYk1owD9L
 lZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UaZFNuj1O/NYbAadi023WB7PHzorR9ng9Ol+jKOeGsk=;
 b=LkR+ql4mu6B4c5UAZfxxSi6VlkXkLAwbm4cYKxJyCkjYq1qk99vKlkEZW+onVlb+ek
 HXu/WxONuqCyfw4Vitdxo4GSnpHqV7eIFTyZoeg2VauLgbhW0slKWm5wi07OOzDiTEwY
 7VF2dzoixJjCOz9QHxCkXGoc+OsrAzP7qlXGAvgiZKUhBpRdGlhdjQNtG/UzScvhutOi
 xza+JRl/rmXpJPoZBxckyJ+RELLQP6nujYMx4OZVSAH3v7XLPOGhNO+9MS14JRgzLBnJ
 aDC7IhDWzmASXMecSKmB2Xvl9XyP+1jKm6x50udyvxM/KO4J6hQ9uIuTbvwAk75cu9V/
 326A==
X-Gm-Message-State: AOAM533RNLkDLSwB73uvHZ9F4vqZANVKkx3ebVAGaGLNJNOY7wMqH4rc
 tADbvf8v1w6tNMG2X7PwWjyZMJWPjREWfmPyVXMRRQ==
X-Google-Smtp-Source: ABdhPJy0A4VSpP0+ABfVUuiOeP3wbNej0RcZyRBtaiErIeXcnve32sGeSVOuZQp7P2kQviVfdHroARBzW3ygQmOFd00=
X-Received: by 2002:a7b:c24f:: with SMTP id b15mr5112879wmj.96.1624199359566; 
 Sun, 20 Jun 2021 07:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200707101912.571531-1-maxime@cerno.tech>
 <YM6dgVb12oITNfc0@pendragon.ideasonboard.com>
In-Reply-To: <YM6dgVb12oITNfc0@pendragon.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Sun, 20 Jun 2021 15:29:03 +0100
Message-ID: <CAPY8ntC+hzmfrJwWW0ytNdHSXruMKMi7N3K6tdJbp9gDBbJ3Qw@mail.gmail.com>
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
 Eric Anholt <eric@anholt.net>, linux-arm-kernel@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 Maxime Ripard <maxime@cerno.tech>, Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent

On Sun, 20 Jun 2021 at 04:26, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Maxime,
>
> I'm testing this, and I'm afraid it causes an issue with all the
> I2C-controlled bridges. I'm focussing on the newly merged ti-sn65dsi83
> driver at the moment, but other are affected the same way.
>
> With this patch, the DSI component is only added when the DSI device is
> attached to the host with mipi_dsi_attach(). In the ti-sn65dsi83 driver,
> this happens in the bridge attach callback, which is called when the
> bridge is attached by a call to drm_bridge_attach() in vc4_dsi_bind().
> This creates a circular dependency, and the DRM/KMS device is never
> created.
>
> How should this be solved ? Dave, I think you have shown an interest in
> the sn65dsi83 recently, any help would be appreciated. On a side note,
> I've tested the ti-sn65dsi83 driver on a v5.10 RPi kernel, without much
> success (on top of commit e1499baa0b0c I get a very weird frame rate -
> 147 fps of 99 fps instead of 60 fps - and nothing on the screen, and on
> top of the latest v5.10 RPi branch, I get lock-related warnings at every
> page flip), which is why I tried v5.12 and noticed this patch. Is it
> worth trying to bring up the display on the v5.10 RPi kernel in parallel
> to fixing the issue introduced in this patch, or is DSI known to be
> broken there ?

I've been looking at SN65DSI83/4, but as I don't have any hardware
I've largely been suggesting things to try to those on the forums who
do [1].

My branch at https://github.com/6by9/linux/tree/rpi-5.10.y-sn65dsi8x-marek
is the latest one I've worked on. It's rpi-5.10.y with Marek's driver
cherry-picked, and an overlay and simple-panel definition by others.
It also has a rework for vc4_dsi to use pm_runtime, instead of
breaking up the DSI bridge chain (which is flawed as it never calls
the bridge mode_set or mode_valid functions which sn65dsi83 relies
on).

I ran it on Friday in the lab and encountered an issue with vc4_dsi
should vc4_dsi_encoder_mode_fixup wish for a divider of 7 (required
for this 800x1280 panel over 4 lanes) where it resulted in an invalid
mode configuration. That resulted in patch [2] which then gave me
sensible numbers.

That branch with dtoverlay=vc4-kms-v3d and
dtoverlay=vc4-kms-dsi-ti-sn65dsi83 created all the expected devices,
and everything came up normally.
It was a busy day, but I think I even stuck a scope on the clock lanes
at that point and confirmed that they were at the link frequency
expected.


Coming back to this patch though, it isn't in 5.10 so I'm not seeing
the issues. As to the exact ordering of attaches, I can't claim
sufficient knowledge on that front.
I can try a cherry-pick of this patch to see what goes on, but it
won't be for a day or two.

Hope that helps
  Dave

[1] Largely https://www.raspberrypi.org/forums/viewtopic.php?f=44&t=305690,
but ignore about the first 5 pages of the thread as different driver
versions were floating about. Most stuff after that is based on
Marek's driver.
[2] https://github.com/6by9/linux/commit/c3c774136a1e946109048711d16974be8d520aaa

> On Tue, Jul 07, 2020 at 12:19:12PM +0200, Maxime Ripard wrote:
> > If the DSI driver is the last to probe, component_add will try to run all
> > the bind callbacks straight away and return the error code.
> >
> > However, since we depend on a power domain, we're pretty much guaranteed to
> > be in that case on the BCM2711, and are just lucky on the previous SoCs
> > since the v3d also depends on that power domain and is further in the probe
> > order.
> >
> > In that case, the DSI host will not stick around in the system: the DSI
> > bind callback will be executed, will not find any DSI device attached and
> > will return EPROBE_DEFER, and we will then remove the DSI host and ask to
> > be probed later on.
> >
> > But since that host doesn't stick around, DSI devices like the RaspberryPi
> > touchscreen whose probe is not linked to the DSI host (unlike the usual DSI
> > devices that will be probed through the call to mipi_dsi_host_register)
> > cannot attach to the DSI host, and we thus end up in a situation where the
> > DSI host cannot probe because the panel hasn't probed yet, and the panel
> > cannot probe because the DSI host hasn't yet.
> >
> > In order to break this cycle, let's wait until there's a DSI device that
> > attaches to the DSI host to register the component and allow to progress
> > further.
> >
> > Suggested-by: Andrzej Hajda <a.hajda@samsung.com>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/gpu/drm/vc4/vc4_dsi.c | 25 ++++++++-----------------
> >  1 file changed, 8 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
> > index eaf276978ee7..19aab4e7e209 100644
> > --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> > @@ -1246,10 +1246,12 @@ static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
> >       return ret;
> >  }
> >
> > +static const struct component_ops vc4_dsi_ops;
> >  static int vc4_dsi_host_attach(struct mipi_dsi_host *host,
> >                              struct mipi_dsi_device *device)
> >  {
> >       struct vc4_dsi *dsi = host_to_dsi(host);
> > +     int ret;
> >
> >       dsi->lanes = device->lanes;
> >       dsi->channel = device->channel;
> > @@ -1284,6 +1286,12 @@ static int vc4_dsi_host_attach(struct mipi_dsi_host *host,
> >               return 0;
> >       }
> >
> > +     ret = component_add(&dsi->pdev->dev, &vc4_dsi_ops);
> > +     if (ret) {
> > +             mipi_dsi_host_unregister(&dsi->dsi_host);
> > +             return ret;
> > +     }
> > +
> >       return 0;
> >  }
> >
> > @@ -1662,7 +1670,6 @@ static int vc4_dsi_dev_probe(struct platform_device *pdev)
> >  {
> >       struct device *dev = &pdev->dev;
> >       struct vc4_dsi *dsi;
> > -     int ret;
> >
> >       dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
> >       if (!dsi)
> > @@ -1670,26 +1677,10 @@ static int vc4_dsi_dev_probe(struct platform_device *pdev)
> >       dev_set_drvdata(dev, dsi);
> >
> >       dsi->pdev = pdev;
> > -
> > -     /* Note, the initialization sequence for DSI and panels is
> > -      * tricky.  The component bind above won't get past its
> > -      * -EPROBE_DEFER until the panel/bridge probes.  The
> > -      * panel/bridge will return -EPROBE_DEFER until it has a
> > -      * mipi_dsi_host to register its device to.  So, we register
> > -      * the host during pdev probe time, so vc4 as a whole can then
> > -      * -EPROBE_DEFER its component bind process until the panel
> > -      * successfully attaches.
> > -      */
> >       dsi->dsi_host.ops = &vc4_dsi_host_ops;
> >       dsi->dsi_host.dev = dev;
> >       mipi_dsi_host_register(&dsi->dsi_host);
> >
> > -     ret = component_add(&pdev->dev, &vc4_dsi_ops);
> > -     if (ret) {
> > -             mipi_dsi_host_unregister(&dsi->dsi_host);
> > -             return ret;
> > -     }
> > -
> >       return 0;
> >  }
> >
>
> --
> Regards,
>
> Laurent Pinchart
