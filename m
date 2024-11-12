Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1C59C4C5D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 03:16:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB7A10E07E;
	Tue, 12 Nov 2024 02:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="g8DTcB/m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com
 [209.85.221.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A15110E07E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 02:16:29 +0000 (UTC)
Received: by mail-vk1-f182.google.com with SMTP id
 71dfb90a1353d-5142468fa79so819470e0c.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 18:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1731377788; x=1731982588;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=NxRKeUzGQNckc94jdll6DwNIvw1FmonhQhpVuy4egzI=;
 b=g8DTcB/mfTRwSCAlA7R1S8/9UZGqSYiH7mJnz/gopUxlCRa/dxxaoK3Z0byNe0J5Wt
 pPtiBqKH7nzkbOelPjVxzRiWbEdsKfpePCvZ0h4yCjeihMI/SPTrLvNXTg2T0orlLGjD
 DtS7PKSr2hQP3eHPpNgJtnNpEiB3E3EQwFjZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731377788; x=1731982588;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NxRKeUzGQNckc94jdll6DwNIvw1FmonhQhpVuy4egzI=;
 b=OmPev/TgX58uTBjXIF4kxgcPoh9B1TlpqS1fpssaoDacFCUrN2Iv+c/bQDQve9R/P5
 5mZEnRRCDpBXlZeMAckut1bbXqcoGgjYIklBi7WJtryQMN2MFu5PPY1Ckr/PKn9MPS9h
 ZO4gnH5CK+wVEtz/yNaDFa1RmA06xKTk0afmiXCnFJKzQ3c5dPywCXBAxWkNCiSxUYfj
 4Kf9lJXQ/jeT8ef6QdKpXPr5lUWwXx5Afbm3jP/YrZfI/Y5QKi1go0ikRP+bNEWIfSjP
 mOAFRDjZBJuiFDJZu8cjbPmKwvPygQuVmQVvqgpE9mtGn+66PkPXpu5pK+A4py28xOmF
 gTPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVne9DBE+I6iHfd3weEeAVgFPEHzhafZ/CsvO2/hTUJkbz/Anfd0YNoS4lE4y+s1ZmXt70F6LVqPyU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhBk4xdUG16cNcFlNNymvQFb307l93NbNjmrODcgq96DpFOKiV
 ZkCotxA2Ptp05b10SPL1HNFBdo6arpOGElrJqEsJN+/3A5i6r6ijYRoMIBNhDYusG1vUH/I7Ypn
 OQp1LVmaZ4flJJ2iyEI89TLqowE+Miy5/E5hY
X-Google-Smtp-Source: AGHT+IFhUIXP7ugxUy7Dy8ell04Jmp5igMqxBklJN6VB90eF5BUKVkmxt6TVApQ3QciA6G8tm/1mdhhf0qwz2BvQ98Y=
X-Received: by 2002:a05:6122:3d13:b0:50d:35d9:ad60 with SMTP id
 71dfb90a1353d-51401ba6e0emr14533759e0c.5.1731377788451; Mon, 11 Nov 2024
 18:16:28 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 Nov 2024 18:16:28 -0800
MIME-Version: 1.0
In-Reply-To: <hqmx7jtkvrwvb27n56hw7rpefhp37lhr3a5fawz7gsl76uuj5s@h7m6wpdhibkk>
References: <20240901040658.157425-1-swboyd@chromium.org>
 <phdcjgqqpjpruxp7v2mw446q73xr3eg4wfgfbjw5tasgr2pgg2@77swbk47b2tg>
 <CAE-0n514QMaQC2yjKP8bZqyfbv6B3AQm=+NJ87vxo6NdYiL03A@mail.gmail.com>
 <lf7y7wpuca6kzqcglgs5d443iusf7xjocum4adi7t3npfavccx@zgsp37oyztme>
 <CAE-0n53-KmOS3zXmJPvOOZ7xxkek9-S=oBExgaY0PDnt_HjdNw@mail.gmail.com>
 <yk3xidaisbd56yndaucax7otijjauqmm7lqm6q4q633kdawlqo@qaq27lwxmvwd>
 <CAE-0n501j+8bMnMKabFyZjn+MLUy3Z68Hiv1PsfW0APy5ggN8g@mail.gmail.com>
 <gstohhcdnmnkszk4l2ikd5xiewtotgo5okia62paauj6zpaw7y@4wchyvoynm2p>
 <CAE-0n50z6MNa7WOsg-NU7k8BpFeJJyYfHX3ov6DsthLWauSNpA@mail.gmail.com>
 <hqmx7jtkvrwvb27n56hw7rpefhp37lhr3a5fawz7gsl76uuj5s@h7m6wpdhibkk>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Mon, 11 Nov 2024 18:16:27 -0800
Message-ID: <CAE-0n50y1O2C47zOGJPmMjKXK_m6a=jhpEAP4nW+RymZbo2xyg@mail.gmail.com>
Subject: Re: [PATCH v4 15/18] dt-bindings: usb: Add ports to
 google,cros-ec-typec for DP altmode
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 patches@lists.linux.dev, devicetree@vger.kernel.org, 
 Douglas Anderson <dianders@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Benson Leung <bleung@chromium.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, 
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
 Thomas Zimmermann <tzimmermann@suse.de>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Ivan Orlov <ivan.orlov0322@gmail.com>, 
 linux-acpi@vger.kernel.org, linux-usb@vger.kernel.org, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2024-11-08 23:05:18)
> On Thu, Nov 07, 2024 at 04:28:24PM -0800, Stephen Boyd wrote:
> > Quoting Dmitry Baryshkov (2024-10-31 15:54:49)
> > > On Thu, Oct 31, 2024 at 02:45:29PM -0700, Stephen Boyd wrote:
> > > > Quoting Dmitry Baryshkov (2024-10-31 11:42:36)
> > > > > On Tue, Oct 29, 2024 at 01:15:51PM -0700, Stephen Boyd wrote:
> > Long story short, I don't see how we can avoid _any_ lane assignment
> > logic in drm_bridge. The logic shouldn't walk the entire bridge chain,
> > but it should at least act on the bridge that is a DP bridge. I think
> > you're saying pretty much the same thing here, but you want the lane
> > remapping to be done via the typec layer whereas I want it to be done in
> > the drm_bridge layer. To me it looks out of place to add a
> > typec_switch_desc inside each DP drm_bridge because we duplicate the
> > logic about USB type-c DP altmode lane assignment to each DP bridge. A
> > DP bridge should just think about DP and not know or care about USB
> > type-c.
> >
> > This is what's leading me to think we need some sort of lane assignment
> > capability at the DP connector. How that assignment flows from the DP
> > connector created in drm_bridge_connector.c to the hardware is where it
> > is less clear to me. Should that be implemented as a typec_switch_desc,
> > essentially out of band with drm_bridge, or as some drm_bridge_funcs
> > function similar to struct drm_bridge_funcs::hdmi_*()? If you look at
> > IT6505 in it6505_get_extcon_property() it actually wants to pull the
> > orientation of the type-c port with extcon_get_property(EXTCON_DISP_DP,
> > EXTCON_PROP_USB_TYPEC_POLARITY). Maybe pushing the orientation to the DP
> > bridge is backwards and we should be exposing this as some sort of
> > connector API that the drm_bridge can query whenever it wants.
>
> And it6505_get_extcon_property() / EXTCON_PROP_USB_TYPEC_POLARITY is a
> Type-C code, isn't it?
>

Sort of? It's combining DP and USB_TYPEC enums there so it's not very
clear if it's one or the other instead of just both.

> > and then a drm_bridge is created in cros-ec to terminate the bridge
> > chain. The displayport altmode driver will find the drm_bridge and the
> > drm_connector from the cros-ec node. When DP altmode is entered the
> > displayport altmode driver will set the drm_connector orientation based
> > on the presence of the dp-reverse-orientation property. We'll be able to
> > hook the hpd_notify() path in cros-ec by adding code to the drm_bridge
> > made there to do the HPD workaround. I'm not sure we need to use an
> > auxiliary device in this case, because it's a one-off solution for
> > cros-ec. And we don't even need to signal HPD from the cros-ec
> > drm_bridge because the oob_hotplug event will do it for us. If anything,
> > we need that displayport.c code to skip sending the hotplug event when
> > "no-hpd" is present in the cros-ec node. Note, this works for any number
> > of usb-c-connector nodes. And finally, DP bridges like IT6505 don't need
> > to implement a typec_switch_desc, they can simply support flipping the
> > orientation by querying the drm_connector for the bridge chain when they
> > see fit. ANX7625 can support that as well when it doesn't see the
> > 'orientation-switch' property.
> >
> > Did I miss anything? I suspect a drm_connector having an orientation is
> > the most controversial part of this proposal.
>
> Yes... I understand that having orientation-switch handling in the DRM
> driver sounds strange, but this is what we do in the QMP PHY driver. It
> makes the code easier, as it keeps lane remapping local to the place
> where it belongs - to the Type-C handlers.
>

The QMP PHY is a type-c PHY, similar to ANX7625. It sits on the output
of the DP and USB PHYs and handles the type-c orientation and lane
merging for different USB type-c alternate modes. It's not a great
example of a plain DP bridge because it combines USB and USB type-c
features.

Either way, doing this through Type-C handlers is weird because the port
orientation in the Type-C framework is for the connector and there is an
orientation control hardware that handles the orientation already. For
example, with the IT6505 part on Corsola, the orientation is controlled
by a redriver part that the EC controls. It takes the DP and USB signals
and routes them to the correct pins on the usb-c-connector depending on
the cable orientation. The input side pinout is basically 2 or 4 lanes
DP and 2 lanes USB and the output side pinout is the USB type-c pinout
SSTXRX1 and SSTXRX2.

This redriver is equivalent to the QMP PHY type-c part. Maybe to bring
this example closer to QMP we can imagine if the QMP PHY was split into
two pairs of lanes, and the USB functionality wasn't used. The
orientation control for a usb-c-connector would be on a redriver that
takes 2 DP lanes from the QMP PHY as input. Saying that this QMP PHY is
the "orientation-switch" with that property in DT is confusing, because
it isn't controlling the orientation of the type-c port. The orientation
is handled by the redriver. That redriver may even be controlled by the
kernel as an orientation-switch.

I understand that the QMP PHY driver has implemented the lane control
for orientation with a typec_switch_desc, but the QMP PHY is a plain DP
PHY in this scenario. How would the type-c handlers work here? We
couldn't call them through the type-c framework as far as I can tell.

This is why I'm thinking the end of the bridge chain needs to have some
sort of orientation. If we had that then the place where the chain ends
and becomes muxed onto the usb-c-connector, i.e. the redriver, would be
where the DP bridge is told that it needs to flip the lanes. In the
cases I have, the redriver is the EC, and so we've combined them all
together in one node, cros-ec-typec. In the QMP PHY case the redriver is
the QMP PHY type-c part that sits on the DP and USB PHYs and sends their
signals out of the SoC.

Maybe the DT property in the ANX7625 or IT6505 node should be something
like "dp-orientation-switch" and then we have the type-c framework find
this property? Then we would need to add support for that property in
IT6505 using a typec_switch_desc, which is weird. I guess it all feels
like a hack because it's not always the case that the DP PHY is glued to
a USB type-c PHY.
