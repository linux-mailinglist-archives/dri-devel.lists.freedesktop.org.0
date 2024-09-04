Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C196D96C515
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 19:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 049E410E824;
	Wed,  4 Sep 2024 17:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="a5d9HA8t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F9910E822
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 17:17:17 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-6c358b72615so22540786d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2024 10:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1725470236; x=1726075036;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=3OSNlGLBd8NLSWyCnfTJEaUwWihfhoQwqRJWu1zx2FI=;
 b=a5d9HA8tOMJkPrF9oB35MFXLIwPAcAMEZKt+WV7TIOFIYiT5xe7abPI+subPyqkeZU
 R0e27SPndwnTaIJO0jmpUZNLUhnqk2uCsqgZV3jvyB3LdroX8P2MacU14btBRS2Nqtwk
 CuYbBsBIzXFom2rbKhDMsEzYYU+yYPpKgb0tk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725470236; x=1726075036;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3OSNlGLBd8NLSWyCnfTJEaUwWihfhoQwqRJWu1zx2FI=;
 b=PNWawj8eQt7EDxQUcqet0Kx8bk0Q411WC3jhMiM/7U+LU9Uy1mMaiI75qfDhFMD/Bn
 wYOg6gE35AZzCbrZbftubYGO0cUWMiCHT8wZK/CM0oWJXFk3FzEQyRlBffYoCcylxp7c
 2kuG2MNz62OOcXF9PysjjbIQ4wLS+ttoQ2jM2qUKAP7XjD69vcAetFD3hVGwQQYzRW9T
 mAR4KerD7ecuEcaYWAjbdvnL3ZAfHSvD+SJjOpawVViLtrwt6nnZFfQIuRorLxHlf9Qo
 KJeJfogLpHUltoO/iWZ5fL3rnsL2lRvvWM9aFQ6eYle0BgirvcJe8KM/SmnbFUWsN+7z
 qthQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVm7I3rUCxqew1OiMoBA3pnO0eAEMIAL6KQA4hLa83XYunY30ccoEM4U+yCWzFJdmk8d0UIQq6Nggw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+2Qpi5XSy5e8K0SyuzdFuXD0zdWrmV/03PuceNVHjpLWL1sqC
 dhZrE9pPAWl2eY9Lbt6t8HiNbFfFHjQVqSqRXip50SjXcAziJTvGpXMAWOE1Og2EKmnqJkuaV/c
 fXlPduFyWrwXElf/wI/DbwYh9YP94J9QILeQZ
X-Google-Smtp-Source: AGHT+IEVE/zja0Ta9Tz96mzKz/L550YBB+VoIesNmcQXcpg7Z7ieAwebVwSfXt2IZeQcblS1lNC8BSuXnTTjD/SJFRM=
X-Received: by 2002:a05:6214:3104:b0:6c3:5f8f:2745 with SMTP id
 6a1803df08f44-6c510a93bc4mr62896466d6.27.1725470236496; Wed, 04 Sep 2024
 10:17:16 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Sep 2024 13:17:15 -0400
MIME-Version: 1.0
In-Reply-To: <ZthaCQel2aHhyIu4@smile.fi.intel.com>
References: <20240901040658.157425-1-swboyd@chromium.org>
 <20240901040658.157425-7-swboyd@chromium.org>
 <ZtWjEudmlR51zkU9@smile.fi.intel.com>
 <CAE-0n51eSxxvnJXwnfPrXx1=rei=8OGGEtCAgw6nhCktZ0iQDw@mail.gmail.com>
 <ZthaCQel2aHhyIu4@smile.fi.intel.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 4 Sep 2024 13:17:15 -0400
Message-ID: <CAE-0n52PxnSMGn3TVt3iiq_3Bimnd4JPoeZ1F6XB1o4itiykUQ@mail.gmail.com>
Subject: Re: [PATCH v4 06/18] drm/bridge: aux-hpd: Support USB Type-C DP
 altmodes via DRM lane assignment
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 patches@lists.linux.dev, devicetree@vger.kernel.org, 
 Douglas Anderson <dianders@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Benson Leung <bleung@chromium.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org,
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
 Daniel Scally <djrscally@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Ivan Orlov <ivan.orlov0322@gmail.com>, 
 linux-acpi@vger.kernel.org, linux-usb@vger.kernel.org, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vinod Koul <vkoul@kernel.org>
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

Quoting Andy Shevchenko (2024-09-04 06:00:57)
> On Tue, Sep 03, 2024 at 06:20:14PM -0400, Stephen Boyd wrote:
> > Quoting Andy Shevchenko (2024-09-02 04:35:46)
> > > On Sat, Aug 31, 2024 at 09:06:44PM -0700, Stephen Boyd wrote:
>
> > > > +     adev->dev.of_node = of_node_get(parent->of_node);
> > >
> > > device_set_node() ?
> >
> > Or device_set_of_node_from_dev()?
>
> This is quite unclear to me. The second one bumps the reference count IIRC
> for no reason (in usual cases). Also only few drivers use that, I would hear
> what OF people can tell about this API and its usage scope.

Sure, but to be equivalent to the existing code from which this has been
copied it should use device_set_of_node_from_dev(). Seems fine to just
use that.

> > > > +static int dp_lane_to_typec_lane(enum dp_lane lane)
> > > > +{
> > > > +     switch (lane) {
> > > > +     case DP_ML0:
> > > > +             return USB_SSTX2;
> > > > +     case DP_ML1:
> > > > +             return USB_SSRX2;
> > > > +     case DP_ML2:
> > > > +             return USB_SSTX1;
> > > > +     case DP_ML3:
> > > > +             return USB_SSRX1;
> > > > +     }
> > >
> > > > +     return -EINVAL;
> > >
> > > Hmm... This can be simply made as default case.
> >
> > And then the enum is always "covered" and the compiler doesn't complain
> > about missing cases (I don't think we have -Wswitch-enum)? Seems worse.
>
> Hmm... You mean if I remove one of the above cases I will get the warning?
>

Yes.
