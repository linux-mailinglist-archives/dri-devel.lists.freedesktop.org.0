Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 923BD96ED99
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 10:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3FF10E9A6;
	Fri,  6 Sep 2024 08:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="db5hdR/o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1FDB10E9A6
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 08:18:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 85DCC5C5AFB;
 Fri,  6 Sep 2024 08:18:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2301EC4CEC4;
 Fri,  6 Sep 2024 08:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725610708;
 bh=P9ijqIiAgO/MrBm843x3Xs7+rP6/2wpXmDlmyoVM9dw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=db5hdR/o5UoYbI2b7BscGrpbq9xRl/AdUrPSlA/8fOZxDBR1QdSNxnkUtd9QrwnYQ
 6pQtPdpljx4ztREQGI0fUOu7ElhyluT3ouzQDIDl7B4k1JJA3nLP2WF6yw2VnRse+4
 WbQ7KdTqpR80IKFv3Ktw1YT/pOxcAID/Sbkj9+6IaVE9GZRxTFPxCwgqPXfRrmzMvF
 CUXEEoKFKUvVt3XayK9lBqBdEbRKeOOLa33STCZCrXjw1r/joD50JkYuCVKMXSwwjf
 kekuTfnzGTCIsKf4wyU4EcQvvHRVXT0de/rhtGwZorbh485sthvIKXxw1T+vNc7jzH
 O0Vg4PR9q+y/Q==
Date: Fri, 6 Sep 2024 08:18:21 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev, devicetree@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Benson Leung <bleung@chromium.org>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, Guenter Roeck <groeck@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Prashant Malani <pmalani@chromium.org>,
 Robert Foss <rfoss@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Ivan Orlov <ivan.orlov0322@gmail.com>, linux-acpi@vger.kernel.org,
 linux-usb@vger.kernel.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v4 18/18] platform/chrome: cros_ec_typec: Handle lack of
 HPD information
Message-ID: <Ztq6zf8n09ZcJNjT@google.com>
References: <20240901040658.157425-1-swboyd@chromium.org>
 <20240901040658.157425-19-swboyd@chromium.org>
 <ZtgqLZXbJbpG65vD@google.com>
 <CAE-0n51w3AAtLPq5M-i8F6z2jSOT3xFw3g8HM1h48xXBSeoZnA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n51w3AAtLPq5M-i8F6z2jSOT3xFw3g8HM1h48xXBSeoZnA@mail.gmail.com>
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

On Wed, Sep 04, 2024 at 02:45:36PM -0700, Stephen Boyd wrote:
> Quoting Tzung-Bi Shih (2024-09-04 02:36:45)
> > On Sat, Aug 31, 2024 at 09:06:56PM -0700, Stephen Boyd wrote:
> > > +static void cros_typec_inject_hpd(struct cros_typec_data *typec,
> > > +                               struct ec_response_usb_pd_mux_info *resp,
> > > +                               struct cros_typec_port *port)
> > > +{
> > [...]
> > > +     /*
> > > +      * Only read the mux GPIO setting if we need to change the active port.
> > > +      * Otherwise, an active port is already set and HPD going high or low
> > > +      * doesn't change the muxed port until DP mode is exited.
> > > +      */
> > > +     if (!typec->active_dp_port) {
> >
> > Given that cros_typec_inject_hpd() is called before `typec->active_dp_port`
> > would be set (from previous patch "platform/chrome: ...  Support DP muxing"),
> > would it possibly wrongly fall into here at the beginning?  (E.g.:
> > cros_typec_probe() -> cros_typec_port_update() -> cros_typec_configure_mux()
> > -> cros_typec_inject_hpd().)
> 
> We wouldn't get here if 'hpd_asserted' is false though. We want to fall

Ack, I overlooked that.

> > > [...]
> > > +     /* Inject HPD from the GPIO state if EC firmware is broken. */
> > > +     if (typec->hpd_asserted)
> > > +             resp->flags |= USB_PD_MUX_HPD_LVL;
> >
> > `typec->hpd_asserted` is shared between all typec->ports[...].  Would it be
> > possible that a HPD is asserted for another port but not current `port`?
> > E.g.: cros_typec_inject_hpd() for port 2 and cros_typec_dp_bridge_hpd_notify()
> > gets called due to port 1 at the same time?
> 
> I'd like to avoid synchronizing the hpd notify and this injection code,
> if that's what you're asking. Thinking about this though, I've realized
> that it's broken even when HPD is working on the EC. Consider this
> scenario with two type-c ports C0 and C1:
>
> [...]

I understood it more: originally, I was wondering if it needs an array
`typec->hpd_asserted[...]` for storing HPD for each port.  But, no.

What cros_typec_dp_bridge_hpd_notify() get is just a connected/disconnected
signal.  It kicks off cros_typec_port_work() for finding which port is
supposed to trigger the event (with some logic with `active_dp_port`,
`mux_gpio`, and `hpd_asserted`).


Curious about one more scenario, is it possible:

Initially, no DP port and no mux is using:
  active_dp_port = NULL
  hpd_asserted = false
  mux_gpio = NULL

CPU A                                        CPU B
------------------------------------------------------------------------------
cros_typec_port_work()
  cros_typec_port_update(port_num=0)
                                             [C0 connected]
                                             cros_typec_dp_bridge_hpd_notify()
                                               hpd_asserted = true
  cros_typec_port_update(port_num=1)
    cros_typec_configure_mux(port_num=1)
      cros_typec_inject_hpd()
      active_dp_port = C1
