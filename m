Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B343B3AC130
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 05:06:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE37F6E82A;
	Fri, 18 Jun 2021 03:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC1B26E82A
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 03:06:18 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id m17so776778plx.7
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 20:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MF+HvSh2Ph2aJcSQ8YS6FS+dV1UC86cI16zR69oJ2u8=;
 b=jYJn0PjuLeGUOI9PsxEFTmfohuH85BJzoU5Rq7Fst9tN15oc/M1M6mieCH2th80v0h
 +56mhuRuaWRmjRG3dECTL4xdtK9p2nica6EyBFtZYTNyrxY5oo6ArQhm4nR8Q/reji2G
 MhbNSTEpCBm9snqP44Xr93566LvXK1Jlv52/Nii/MhWe7XSGe0efrZCezH/nA3AP0Qmf
 dcIUHFaQbGdlcy9KzG9UybuyDDxpd21jHoMGH4Jrdafx8i+r28H9yDrcbLFn75ov5xhm
 JvmoNp2SMIoGuSaU2ntbtrSdpOBxnEm0XhGbnXGtFZVQJMiaFg1PAF+JGmLTOK2+6oAj
 pvUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MF+HvSh2Ph2aJcSQ8YS6FS+dV1UC86cI16zR69oJ2u8=;
 b=Z8gJi+ks618OO09qCT5/82KCu+GlTySPXxnmAUTekW5pZqVakCE7ZzcHWDKQR440pt
 w9ReMi8GUv61xRRk37N1/Cp29ldUIhWJZvfp8YoYEPFRcuOtfC57QlvARuGH9Ib2Al8g
 0Yy7aPfr2zGw16Hdmz7zUC2T9XmsjMJXNGuA0z0mWt8Ct606L/07y3eAPK2lr2ZVMNTE
 Uzmkv2pDTHnuitoOTFYKl/+OSmu6ba10EGAdwlbLOoP38EMypMjmRrolKBN7llBwRbuw
 B+wWLLkN5LYWfkQrcJqNWWGsFOTb3ji0Bp2KP3XR5M8PJOb/A0bSaKir4wRkU1xe/D9p
 /MdA==
X-Gm-Message-State: AOAM533A/b55jlFw4FSy1oJSOIZAbAunR6sk0JP7p2m5+iFh4N2AkQTg
 aKkSjyLZW+U5MeCnpiIFUdbEiU6nmIShSRZIAD8=
X-Google-Smtp-Source: ABdhPJzd3QjZo222960R4VEwMcg19qhdCaLwAOfwGm2SrRnSgF82Mc4zLEOH80+DEn9D9NbzapHzspaopRQih7B/NHE=
X-Received: by 2002:a17:90a:e98f:: with SMTP id
 v15mr19574185pjy.235.1623985578289; 
 Thu, 17 Jun 2021 20:06:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210617111925.162120-1-net147@gmail.com>
 <YMtYoaSIIRhb85fh@pendragon.ideasonboard.com>
In-Reply-To: <YMtYoaSIIRhb85fh@pendragon.ideasonboard.com>
From: Jonathan Liu <net147@gmail.com>
Date: Fri, 18 Jun 2021 13:06:07 +1000
Message-ID: <CANwerB0J9xKj3kjYPjzfeDvKV8JXPcDtoZaLMzkudCBz8=ZnVw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Fix null pointer dereference in
 remove callback
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <a.hajda@samsung.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Fri, 18 Jun 2021 at 00:14, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Jonathan,
>
> Thank you for the patch.
>
> On Thu, Jun 17, 2021 at 09:19:25PM +1000, Jonathan Liu wrote:
> > If attach has not been called, unloading the driver can result in a null
> > pointer dereference in mipi_dsi_detach as ctx->dsi has not been assigned
> > yet.
>
> Shouldn't this be done in a brige .detach() operation instead ?
>

Could you please take a look?
I don't have a working setup to test moving the code to detach.

> > Fixes: ceb515ba29ba6b ("drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and SN65DSI84 driver")
> > Signed-off-by: Jonathan Liu <net147@gmail.com>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > index 750f2172ef08..8e9f45c5c7c1 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > @@ -671,8 +671,11 @@ static int sn65dsi83_remove(struct i2c_client *client)
> >  {
> >       struct sn65dsi83 *ctx = i2c_get_clientdata(client);
> >
> > -     mipi_dsi_detach(ctx->dsi);
> > -     mipi_dsi_device_unregister(ctx->dsi);
> > +     if (ctx->dsi) {
> > +             mipi_dsi_detach(ctx->dsi);
> > +             mipi_dsi_device_unregister(ctx->dsi);
> > +     }
> > +
> >       drm_bridge_remove(&ctx->bridge);
> >       of_node_put(ctx->host_node);
> >

Thanks.

Regards,
Jonathan
