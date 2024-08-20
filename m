Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3154E958D25
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 19:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D1A510E7F3;
	Tue, 20 Aug 2024 17:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="MijAQzIn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CCC210E7F3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 17:23:08 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id
 a1e0cc1a2514c-842fe718899so1438574241.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 10:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724174587; x=1724779387;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=jjiHfu5pkFzqUOsx+SOY2D+4odBwVmyecYJTsluInAs=;
 b=MijAQzInUKmaB+2tY8X2bonlyzEjpsEqXEAJrTXPq5GM5c6ALWk3MKI+ZjSHWsbBLa
 B70HNCWejWF2Rge2hiHM8Al8yGBKxgFNaiYqUcIHNdPt0NMnkCxkAd/+MlhEYAHGZezg
 HsEX1qXOn7rTCxIyAVm6oijQejD3Xwln+fY7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724174587; x=1724779387;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jjiHfu5pkFzqUOsx+SOY2D+4odBwVmyecYJTsluInAs=;
 b=bi506cq5Op+4tDlbbb40/OQ+kBezMM/9IxpP7Ogp9GWSZgsN0k1BzjFnnp3bm3G5jq
 etip0ui/jdXNtkuC/kH1wu7+sSdeG4YHjfE9nAGTvW9LFPBJMPwjxMlP1Wd99+Xlzv74
 kpiw2mKsFWMu2bpqaVgf/4Zq9EBS9n3KhK4m0Q+zmpVmcP+l0zoK8KaozbkoFRVeTvGf
 lwx5Iloew3z5XAz248Tn9Jcg9X2E7jBAC6T76APap15U/D8uFxt9TiGsNVRDHJT7kcTE
 tSwhtSR6oeMvnIVIE/j5bsFwEbtPuv8rxUWy9DAgvq8vzrUNC49qimUwt8ENfs99yUfF
 zeRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIAotKaNKSZ0h4qX2RNq1deYFoZlXAr1psty/4z8fmsAgTgtsMuF1ltGfkhhynfgLGhT4p47Na7PT81Pl6HRLI+G7uSt+BkldMLNhjojM1
X-Gm-Message-State: AOJu0Yw/zX1xZW6z4Cf1EqxVVqUa/4OjEJfnCcLDeCY/LMNyRgIYOQeJ
 PnMyq4TUx9OuCK18fW7niLY2oQz9kCLgLNoDp5+HMQKmvxDqVuki9eCBss9WlX8YksLuO5dIl+V
 KG0PKErav3tVW2ZR1YvRSPvtqwaqev6FDG/B9
X-Google-Smtp-Source: AGHT+IGfqseqp4mRIKADD9bykOeA01y+4F/62kKEBLZLbbbLI1oVDw9K0JgFNuY/9j8342Q36vrpqnXZCv1APwGTLdw=
X-Received: by 2002:a05:6102:f13:b0:493:d1c3:1aef with SMTP id
 ada2fe7eead31-4977990c46fmr12594753137.14.1724174586925; Tue, 20 Aug 2024
 10:23:06 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Aug 2024 10:23:06 -0700
MIME-Version: 1.0
In-Reply-To: <CAE-0n52FSUFictNQ9kotgFAZPYnJpy+3Ad__QeUN+EiJuBWGwQ@mail.gmail.com>
References: <20240819223834.2049862-1-swboyd@chromium.org>
 <20240819223834.2049862-6-swboyd@chromium.org>
 <ZsRs6d6uOMb4DqQQ@smile.fi.intel.com>
 <CAE-0n52O01UgrDT2=-JJpZj39BOJNyyQC4w_pgDUmKDmcN=8Yw@mail.gmail.com>
 <ZsTPeEsS1m4Y8imq@smile.fi.intel.com>
 <CAE-0n52FSUFictNQ9kotgFAZPYnJpy+3Ad__QeUN+EiJuBWGwQ@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 20 Aug 2024 10:23:06 -0700
Message-ID: <CAE-0n50uOcCHHaw=opEY089ymPBER2H7QLtORFzD6ypwHEKUJw@mail.gmail.com>
Subject: Re: [PATCH v3 05/17] usb: typec: Add device managed
 typec_switch_register()
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

Quoting Stephen Boyd (2024-08-20 10:19:48)
> Quoting Andy Shevchenko (2024-08-20 10:16:40)
> > On Tue, Aug 20, 2024 at 10:01:07AM -0700, Stephen Boyd wrote:
> > > Quoting Andy Shevchenko (2024-08-20 03:16:09)
> > > > On Mon, Aug 19, 2024 at 03:38:19PM -0700, Stephen Boyd wrote:
> > > > > +     ptr = devres_alloc(devm_typec_switch_unregister, sizeof(*ptr), GFP_KERNEL);
> > > > > +     if (!ptr)
> > > > > +             return ERR_PTR(-ENOMEM);
> > > > > +
> > > > > +     switch_dev = typec_switch_register(parent ,desc);
> >
> > (Side note: wrong location of the white space)
>
> Thanks.
>
> >
> > > > > +     if (!IS_ERR(switch_dev)) {
> >
> > (Side note: positive conditional is okay)
> >
> > > > > +             *ptr = switch_dev;
> > > > > +             devres_add(parent, ptr);
> > > > > +     } else {
> > > > > +             devres_free(ptr);
> > > > > +     }
> > > >
> > > > devm_add_action_or_reset() ?
> > >
> > > No. We don't want to call the 'action' devm_typec_switch_unregister()
> > > when it fails because that would unregister a switch that has never been
> > > registered.
> >
> > Hmm... With devm_add_action_or_reset() we first do things and then try to add
> > them to the managed resources. In that case it won't be like you described.
> >
> > What do I miss?
> >
>
> I believe you've missed that this is a wrapper around struct device and
> the error path is different (put_device() vs. device_unregister()).

Or you're suggesting devm_add_action_or_reset() after registering the
switch? Sorry it wasn't clear to me.
