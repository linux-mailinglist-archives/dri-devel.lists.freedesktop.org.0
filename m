Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A64BE9D55DE
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 23:59:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C9F10E00A;
	Thu, 21 Nov 2024 22:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hQEyBHyn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5185F10E00A
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 22:59:48 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-539f76a6f0dso1526174e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 14:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732229986; x=1732834786; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QURbtaV3ukiez0tTpXs4XxFFZ1jpH59O/Y0WaDRjYZ8=;
 b=hQEyBHynSPIwTkVH6mv/73R+/LVw3xNFCeZN/dAxue7+6mjmyF5Ihf2YEvnMAcqKs/
 dFsWzTgipSGrVSNdv4dWF+FWGdaxKQ5spjV4EKBb/Tp/MpQGg8hSB4Tj8Jvawof9g+aF
 UqS8gBW6TU8qUa0UEExjgHxA5Pz/sv703toN7Ioz57HQ4EnjbsoLzYq5R4+RpT70mFRj
 x1KJZdP+SeBw0Da5i9o3kE7fR/AjZUrGsYhp4ol7k8JlG4iHJ+rPnjWsX0xMeAH5k6CZ
 RzUUHReFbCIO/PFxD1CZ+UCYB0p+aFWbrUumqm4TmABDRJLfMF+4u44IgIwAU9JQJgw5
 DyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732229986; x=1732834786;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QURbtaV3ukiez0tTpXs4XxFFZ1jpH59O/Y0WaDRjYZ8=;
 b=WHRu4f833tNDFCQQqpdn+dOw4OpcmgJOPp7rXYoYzlUn7gwdqUSTKZiy3XNJzjYwUk
 Ih0M4VbcTrQ7+mF+ANIm1ur/CX8Ax5Tg+mZ42K5KKUIjs2xLRhfJ2IZ3onzIgX8I68XV
 XDr+6ZnSW6PhlXNHLzzLpEgdzsasOXV6htSvU7RK+dUrtlQvkc2NT3m23ZI9L+KZ5SIe
 ZPd5b9Ss7Lywj+JeDxmwY9k6Mbsbgnp2addvjgDI1RUbzcit5WoMYQjRM7VmlxFcMGle
 gdvw8MUcRhKZzYeZJ5+4EUa/7HzlOvFIjBo1nARKS/wQuy2LxQBNdhHaPmRMHP/9FOEO
 3KJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp4yME8dLTawIw9OUk/FsR2DUjbLP5Hi76lsN160K0DQjLhMO5ri1IejgScl7w5wqDtjKAHcrvnwk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrO4lQJs5f+F9RJrmVjN9U6kel+EIvG4UjT7UU+Bl1MMfRB9Q0
 EBGlVvrFYi3B4TCEd5BAsE+Z7EPBq+lD3llCicFeExZjAJ+Gd6NJMyIjDyG1rJk=
X-Gm-Gg: ASbGncuv+mh8Bi+sBudFRHZrdWNIlGYs1EaCMFn2/DNPzuUxdp3+7xW3snyJyxDk0HO
 2K32iv+yGvQ8dCClMGvEdLHRezdImFLU0EL1A3pcqggwNe1jPNiBaUJu2RBHTWBxTjKG1TJ82wJ
 tjh+LP5OFwyZpoG/4Wopp5cFdv8S0Nv/UK59Yjl5VIcdDCNz0Zr6zxPQVkRQg7sH6M/fjKHy+QW
 kfJn6oU2RHdQK461Kk3kKGBLkztTxaflrARZorW86xjk0GeJFRI/VDfBZXUCbt4fPQD0vMC42kz
 Lx9Yd0HF2GtueLJXh5ypUWfsCZwR0g==
X-Google-Smtp-Source: AGHT+IE6DjiOZhXmoiIdOsYpY9drZdFOpFVFxO9EFxt4q6f2ze6fD79PWnzY9ZmQkAwPJkgf0DziAg==
X-Received: by 2002:a05:6512:b12:b0:53d:a2a6:ef67 with SMTP id
 2adb3069b0e04-53dd39b5620mr232580e87.49.1732229986274; 
 Thu, 21 Nov 2024 14:59:46 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd24456a7sm105592e87.14.2024.11.21.14.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 14:59:44 -0800 (PST)
Date: Fri, 22 Nov 2024 00:59:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 patches@lists.linux.dev, devicetree@vger.kernel.org, 
 Douglas Anderson <dianders@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Benson Leung <bleung@chromium.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 Guenter Roeck <groeck@chromium.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
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
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 15/18] dt-bindings: usb: Add ports to
 google,cros-ec-typec for DP altmode
Message-ID: <cartdeijkv6z23dgm7uif4lti3lahfqmuyxcmruzqbefhsp6yk@m6ocjhncs2ko>
References: <lf7y7wpuca6kzqcglgs5d443iusf7xjocum4adi7t3npfavccx@zgsp37oyztme>
 <CAE-0n53-KmOS3zXmJPvOOZ7xxkek9-S=oBExgaY0PDnt_HjdNw@mail.gmail.com>
 <yk3xidaisbd56yndaucax7otijjauqmm7lqm6q4q633kdawlqo@qaq27lwxmvwd>
 <CAE-0n501j+8bMnMKabFyZjn+MLUy3Z68Hiv1PsfW0APy5ggN8g@mail.gmail.com>
 <gstohhcdnmnkszk4l2ikd5xiewtotgo5okia62paauj6zpaw7y@4wchyvoynm2p>
 <CAE-0n50z6MNa7WOsg-NU7k8BpFeJJyYfHX3ov6DsthLWauSNpA@mail.gmail.com>
 <hqmx7jtkvrwvb27n56hw7rpefhp37lhr3a5fawz7gsl76uuj5s@h7m6wpdhibkk>
 <CAE-0n50y1O2C47zOGJPmMjKXK_m6a=jhpEAP4nW+RymZbo2xyg@mail.gmail.com>
 <5kisfv22tgqwzjpxqrbx56ywr7l4r7pny3pl2r7crv4rijqbwk@azricdasttg7>
 <CAE-0n50Bxi2GfnxOmMwe-F+k5jMSiyAVPDb6K8pYm-i6hpJTOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n50Bxi2GfnxOmMwe-F+k5jMSiyAVPDb6K8pYm-i6hpJTOA@mail.gmail.com>
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

On Tue, Nov 19, 2024 at 08:09:31PM -0500, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2024-11-15 09:17:15)
> > On Mon, Nov 11, 2024 at 06:16:27PM -0800, Stephen Boyd wrote:
> > > Quoting Dmitry Baryshkov (2024-11-08 23:05:18)
> > > > On Thu, Nov 07, 2024 at 04:28:24PM -0800, Stephen Boyd wrote:
> > > > > Quoting Dmitry Baryshkov (2024-10-31 15:54:49)
> > > > > > On Thu, Oct 31, 2024 at 02:45:29PM -0700, Stephen Boyd wrote:
> > > > > > > Quoting Dmitry Baryshkov (2024-10-31 11:42:36)
> > > > > > > > On Tue, Oct 29, 2024 at 01:15:51PM -0700, Stephen Boyd wrote:
> > > > > Long story short, I don't see how we can avoid _any_ lane assignment
> > > > > logic in drm_bridge. The logic shouldn't walk the entire bridge chain,
> > > > > but it should at least act on the bridge that is a DP bridge. I think
> > > > > you're saying pretty much the same thing here, but you want the lane
> > > > > remapping to be done via the typec layer whereas I want it to be done in
> > > > > the drm_bridge layer. To me it looks out of place to add a
> > > > > typec_switch_desc inside each DP drm_bridge because we duplicate the
> > > > > logic about USB type-c DP altmode lane assignment to each DP bridge. A
> > > > > DP bridge should just think about DP and not know or care about USB
> > > > > type-c.
> > > > >
> > > > > This is what's leading me to think we need some sort of lane assignment
> > > > > capability at the DP connector. How that assignment flows from the DP
> > > > > connector created in drm_bridge_connector.c to the hardware is where it
> > > > > is less clear to me. Should that be implemented as a typec_switch_desc,
> > > > > essentially out of band with drm_bridge, or as some drm_bridge_funcs
> > > > > function similar to struct drm_bridge_funcs::hdmi_*()? If you look at
> > > > > IT6505 in it6505_get_extcon_property() it actually wants to pull the
> > > > > orientation of the type-c port with extcon_get_property(EXTCON_DISP_DP,
> > > > > EXTCON_PROP_USB_TYPEC_POLARITY). Maybe pushing the orientation to the DP
> > > > > bridge is backwards and we should be exposing this as some sort of
> > > > > connector API that the drm_bridge can query whenever it wants.
> > > >
> > > > And it6505_get_extcon_property() / EXTCON_PROP_USB_TYPEC_POLARITY is a
> > > > Type-C code, isn't it?
> > > >
> > >
> > > Sort of? It's combining DP and USB_TYPEC enums there so it's not very
> > > clear if it's one or the other instead of just both.
> >
> > But EXTCON_PROP_USB_TYPEC_POLARITY is just a Type-C, nothing about DP in it.
> 
> It's extcon_get_property(it6505->extcon, EXTCON_DISP_DP,
> EXTCON_PROP_USB_TYPEC_POLARITY, ...) which has EXTCON_DISP_DP in there,
> so there's something about DP there. That's all I'm saying.
> 
> > >
> > > I understand that the QMP PHY driver has implemented the lane control
> > > for orientation with a typec_switch_desc, but the QMP PHY is a plain DP
> > > PHY in this scenario. How would the type-c handlers work here? We
> > > couldn't call them through the type-c framework as far as I can tell.
> >
> > If QMP PHY is a plain DP PHY, it usually has no support for lane remapping
> > (e.g. phy-qcom-edp doesn't).
> >
> > Let me reiterate, please: lane management is outside of the DisplayPort
> > spec, at least as far as I can understand it. All lane remapping
> > (especially a dynamic one) is a pure vendor extension to the standard.
> > I'm trying to find a way to support Corsola and Trogdor without adding
> > "this is done specially for Google" kind of API. Usually that doesn't
> > fly in the long term.
> 
> Got it.
> 
> >
> > I understand that using Type-C API for the DRM bridge sounds strange.
> > But even the mentioned bridge uses Type-C API. It asks for the Type-C
> > polarity, not the DP polarity.
> >
> 
> I understand that lane assignment isn't part of the DisplayPort spec,
> while it is part of the USB Type-C DisplayPort Altmode spec.
> 
> I'm not entirely convinced that lane assignment is _only_ part of the
> altmode spec

just to clarify: I'm only talking about a dynamic lane management here.
If the DP bridge hardware supports remapping lanes in a weird way and
board designers decided to use that "feature", then having a property
linke data-lanes = <2 1 3 0>; makes perfect sense to me.

> and should be implemented with a typec switch though,
> because I imagine some hardware design could be created that has two
> DisplayPort connectors, just like these two USB-C connectors, and some
> sort of HPD redriver logic similar to the EC that decides which DP port
> "wins" and should have DP sent to it. Or perhaps 2 lanes DP to a DP
> connector and 2 lanes DP sent to a DP to HDMI bridge (shudder). In
> either case, USB type-c isn't involved.

/me keeps fingers crossed that hw designers won't do such a thing

But I see your point.

> 
> It sounds like we're debating how to handle lane assignment in the
> kernel. Either way, the code is going to be implemented in the bridge
> driver because it's the one that has to change what physical lane a
> logical lane is assigned to. The question is if it should be some sort
> of bridge_funcs callback, or should bridge drivers hook into the typec
> framework to expose an orientation switch, or something else?

I was assuming that orientation switch is such kind of a hook.

> 
> I'm thinking we should introduce some sort of bridge_funcs callback that
> can be called from the DP altmode driver, either parallel to the
> drm_connector_oob_hotplug_event() function or from it directly. If we
> can pass the fwnode for the usb-c-connector to the oob_hotplug_event
> callback, maybe that's all we need to figure out which lanes go where.
> And then in the 2 DP connector muxing world we can call
> drm_connector_oob_hotplug_event() with one or the other DP connector
> node, which will likely be children nodes of the "HPD redriver" device.

If you call it from drm_bridge_connector's oob_hotplug_event handler,
this should fly. Does it cover your 3-DP or 4-DP usecases?

-- 
With best wishes
Dmitry
