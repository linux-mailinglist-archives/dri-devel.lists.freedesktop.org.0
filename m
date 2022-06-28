Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D275A55EFB5
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 22:40:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD4AA1125BE;
	Tue, 28 Jun 2022 20:40:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BA91125BE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 20:40:45 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 n12-20020a9d64cc000000b00616ebd87fc4so1745777otl.7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 13:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=g7DzDcGO0C//Tm2mK6aKPbRwKZWmv3UtbhY+R8SWnp0=;
 b=KWNEvpPfmo2SmKf5bhaztGdiQA6tvFbLTUxtrhK6rIjkzfNXr0keJwbndIKL9tV+kc
 GJvLAH4zZhqCxZY5XcSqSB007mXJECoqbN7dcQdel3VfCXDBC+smGP7zRPJ+jnJwH0lC
 EKUm1ID9cMqQTYUrXSF130ZWwW3VemS6uvCCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=g7DzDcGO0C//Tm2mK6aKPbRwKZWmv3UtbhY+R8SWnp0=;
 b=t2OmSFs1mgHdI6Rv8BOCPt1bvctnj7ZkuFn1RNw1DNBxQ9iDJFjHAf3pJEdnXvXUE/
 SNgHGsUmTf3mCBevpe/gvOJJ6riQZ27NpSJURPJqFDNHQ+JJnBuSCOxMITfyWJme1HXc
 C8Lwjw0NgjBxRcTUD4D7WDExkx1adtpZRgSCzAPxcKsAaWBPvMAHWCAjvp7si4SKRbPz
 dV/VQdNnF6P5Gx9/N/9Fq7QALFbanuN2riR/7VTmfkax3FijT0pJSSNyBbYbhG2FsK6d
 X/LLNZnJiL6WkiP6VK+aTRRvsd92Ac1MIRpNEIXlO0qURZf4UvJ4Hsa759jCGb56L0qP
 aiRw==
X-Gm-Message-State: AJIora+Ui86SlE8YazbiApPll4hGw38Rw6UufRvsUcKXj1y+52UriCOg
 W3Od623IpTMXGYh9vajX1mSBwLXhjnNEel/xstodfA==
X-Google-Smtp-Source: AGRyM1tGIqN+N5fxU26uQPwuhb/+Q+PPDxiV9zB3lkXobvidTtjy4ULjamLp4gDIpHvSTR5pfmD19QEOr8obxLOLWwA=
X-Received: by 2002:a9d:6484:0:b0:60b:eb0b:4054 with SMTP id
 g4-20020a9d6484000000b0060beb0b4054mr9324278otl.159.1656448844842; Tue, 28
 Jun 2022 13:40:44 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Jun 2022 15:40:44 -0500
MIME-Version: 1.0
In-Reply-To: <CACeCKafR8hFke_tc2=1VGDNF-CFrZoAG1aUKuxGJG-6pd37hbg@mail.gmail.com>
References: <20220622173605.1168416-1-pmalani@chromium.org>
 <20220622173605.1168416-6-pmalani@chromium.org>
 <CAE-0n517BB8YbN5AZG6M3ZrZGOJDV=+t0R9d8wD+gVqO1aD1Xg@mail.gmail.com>
 <CACeCKafR8hFke_tc2=1VGDNF-CFrZoAG1aUKuxGJG-6pd37hbg@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 28 Jun 2022 15:40:44 -0500
Message-ID: <CAE-0n50XbO5Wu4-429Ao05A4QrbSXoi1wBjTpGFjKm3pZj1Ybg@mail.gmail.com>
Subject: Re: [PATCH v5 5/9] drm/bridge: anx7625: Add typec_mux_set callback
 function
To: Prashant Malani <pmalani@chromium.org>
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Prashant Malani (2022-06-28 12:48:11)
> On Tue, Jun 28, 2022 at 12:25 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Prashant Malani (2022-06-22 10:34:34)
> > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > index bd21f159b973..5992fc8beeeb 100644
> > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
[..]
> > > +
> > > +       if (ctx->num_typec_switches == 1)
> >
> > How do we handle the case where the usb-c-connector is directly
> > connected to the RX1/TX1 and RX2/TX2 pins? This device would be an
> > orientation (normal/reverse) and mode switch (usb/dp) in that scenario,
> > but this code is written in a way that the orientation switch isn't
> > going to flip the crosspoint switch for the different pin assignments.
>
> If all 4 SS lanes are connected to 1 usb-c-connector; there would be
> just 1 "typec-switch" node.
> In that case, the DT would only specify it as an "orientation-switch"
> and register
> an orientation-switch with the Type-C framework. The orientation switch would
> pretty much do what the mode-switch callback does here (configuring
> the crosspoint
> switch).
> One could also register a "mode-switch" there but it wouldn't do
> anything (all 4 lanes are already
> connected so there is nothing to re-route in the crosspoint switch).
> Hence the above "if" check.

Would we still want to route the DP traffic out if the pin assignment
didn't have DP? Does the hardware support some mode where the DP traffic
is shutdown? Or maybe the HPD pin needs to be quieted unless DP is
assigned?

I suppose none of those things matter though as long as there is some
typec switch registered here so that the driver can be informed of the
pin assignment. Is it right that the "mode-switch" property is only
required in DT if this device is going to control the mode of the
connector, i.e. USB+DP, or just DP? Where this device can't do that
because it doesn't support only DP.

>
> Unfortunately, I don't have hardware which connects all 4 SS lanes
> from 1 Type-C port
> to the anx7625, so I didn't add the orientation switch handling to the
> driver (since I have no way of verifying it).

Alright. Maybe add a TODO then so it's more obvious that orientation
isn't handled.

>
> Regarding DP alt-mode pin assignments : I think anx7625 will only support Pin D
> (only 2 lane DP, no 4 lane DP).
>

Makes sense. Thanks!
