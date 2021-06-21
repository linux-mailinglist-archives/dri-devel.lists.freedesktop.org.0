Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 534DF3AED87
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 18:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 732DC89C16;
	Mon, 21 Jun 2021 16:18:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 899D189C16
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 16:18:40 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id h11so2863849wrx.5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 09:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tthdio2toNyiWcsxLuaNlU3sKk9Qswk6j48qKJdhloI=;
 b=qhaDLDHPMGDuCgFJBo3YwN8uNEPEWZV2c8hfOhY43wO4SjlCDHZbid9svB4Gj0YIBE
 5O6NfI+Zl7C4EkEoX2fiGureZkOzLPH8OL1WybeNAF2VACmyWpc8+8lTEGPQ4XyIvZB0
 XnxVezcTlsuJ8I4Cdna18yDM9csRjqh7z0MSwNZ+Pp2HaaiayBGTTwZ76n3vXMqehkWl
 COxak8LopA4zbC0Q2VwwTdO3oZZ99o7FjBwrwXx0+ZsZpCjhML4UaMF5Zvu6MHcLm2/+
 9AMOckO1zN/XeMPQGhCEi7QZ/YRN5NJXZNA+moDsb1Z4IWeNhLxEnvlYAENdjeppBf9N
 wywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tthdio2toNyiWcsxLuaNlU3sKk9Qswk6j48qKJdhloI=;
 b=ILUjQpkZL74XrjyXZdWelQMv2yR/teWmnCPgZuaAkzgVvSFO3kWh0yzzLJ4fQPQm5t
 rUtMOVQ/yQQgoFSmZggK3dM8LPkE3BJBzGbhHJpeyYl5inJVtjkCM8/Qs4TW8LxwZGpX
 jF9bNTvseTS+pvwwCvnw42lKhTM0oY4Q3GQtF92C5ipeYgyg8LnQRe/FsL8TfdtToRA3
 rX0Na+u3WHHlcSRwQrQqWWmjkE62sNcsnttGjqeL0DMprNBMtX4iD8oVxchOo3k8Hh+2
 K63Kiph/tVwihW6TD65Unw/ors5joTv6IhkfpwWMNKXNs31SDsCzxr5X94x2KMMxVBrf
 fL5A==
X-Gm-Message-State: AOAM532yOxLeXVk25Kqvrvh0GeBjVBDyRnssIwYktb9eB28Ft/fSO4i8
 NBVCoo1R1ujNU4t2INRQYb1l2vw+68w+PGzM9J4RMw==
X-Google-Smtp-Source: ABdhPJxfKgsLbD4mBF8xFTkaIH9Jnw9ynEp+yGhuiV13D4JlBQx5v9mfFu1UDaDERTmS2+WQtGjJYV+GeqnCMJ0Efic=
X-Received: by 2002:a5d:59a5:: with SMTP id p5mr28448027wrr.27.1624292319231; 
 Mon, 21 Jun 2021 09:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200707101912.571531-1-maxime@cerno.tech>
 <YM6dgVb12oITNfc0@pendragon.ideasonboard.com>
 <20210621160517.5fptdj4tkbzgqn76@gilmour>
In-Reply-To: <20210621160517.5fptdj4tkbzgqn76@gilmour>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 21 Jun 2021 17:18:22 +0100
Message-ID: <CAPY8ntA0dsNwiyEiSHR7AuL1ESyPvTpKWAAg=MK3Gx9HKhq5qg@mail.gmail.com>
Subject: Re: [PATCH] drm/vc4: dsi: Only register our component once a DSI
 device is attached
To: Maxime Ripard <maxime@cerno.tech>
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
 Andrzej Hajda <a.hajda@samsung.com>, linux-arm-kernel@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Eric Anholt <eric@anholt.net>, bcm-kernel-feedback-list@broadcom.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Mon, 21 Jun 2021 at 17:05, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Laurent,
>
> On Sun, Jun 20, 2021 at 04:44:33AM +0300, Laurent Pinchart wrote:
> > Hi Maxime,
> >
> > I'm testing this, and I'm afraid it causes an issue with all the
> > I2C-controlled bridges. I'm focussing on the newly merged ti-sn65dsi83
> > driver at the moment, but other are affected the same way.
> >
> > With this patch, the DSI component is only added when the DSI device is
> > attached to the host with mipi_dsi_attach(). In the ti-sn65dsi83 driver,
> > this happens in the bridge attach callback, which is called when the
> > bridge is attached by a call to drm_bridge_attach() in vc4_dsi_bind().
> > This creates a circular dependency, and the DRM/KMS device is never
> > created.
>
> We discussed it on IRC, but it makes more sense here.
>
> The thing is, that patch is fixing a circular dependency we discussed
> with Andrzej a year ago:
>
> https://lore.kernel.org/dri-devel/20200630132711.ezywhvoiuv3swo57@gilmour.lan/
>
> It seems like we have to choose between having the panels or bridges
> working :/

The Pi panel using the panel-raspberrypi-touchscreen driver is flawed
as it controls the power to the FT5406 touchscreen element as well as
the display. If DRM powers down the display, power goes to the
touchscreen too, but the edt-ft5x06 touchscreen driver has no notion
of this :-(

The two parts have been broken into bridge/tc358762 and
regulator/rpi-panel-attiny-regulator which then allows the edt-ft5x06
driver to keep control over power. I haven't had it be 100% reliable
though, so I'm still investigating as time allows, but this seems like
the better solution than panel-raspberrypi-touchscreen.

With the tc358762 node back under the DSI host node, I think that
circular dependency you were trying to solve goes away.
However with sn65dsi83 being I2C configured, is that an issue again?

  Dave
