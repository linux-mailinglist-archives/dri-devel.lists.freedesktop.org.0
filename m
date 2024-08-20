Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CA6958D75
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 19:33:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A65010E800;
	Tue, 20 Aug 2024 17:33:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Q4YCCnXO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 165D810E800
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 17:33:16 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-7a1dcc7bc05so394366185a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 10:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724175195; x=1724779995;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=9vtSBBXJK5LCYoMXhK0wAXHgfrMBnfJ+I9BOwaqkeIw=;
 b=Q4YCCnXOBxJ7LnMaMONNZMVTrXU4A/El/ax7yijoaJYBXAzkQ2YMbWsIHD31MPy82Z
 ulwmB67ZjkYOYLwP87X7HDC6321K50nr+yamD3tiEinPehvpjbhVRtTOCBE2pSRebo8S
 F2HRUiyXKkiTNOdqMWMfIoWNPGzRyQzgymF38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724175195; x=1724779995;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9vtSBBXJK5LCYoMXhK0wAXHgfrMBnfJ+I9BOwaqkeIw=;
 b=qAgKfg/k4mqpYrFSK++Z9Ir8YpVhp3CpH2LcrzJXdAhES0X4IrYMXqbJfHra0Tlfe0
 XqqXioGbK5EYF78jyPx/B2LwYJMu87ALidRavQU7LYSkI0C+CyPKQXRzk8JsnukCt0hz
 vHCdgISXZYgGZEqtvSopThiPEiP56krcUuInKF/fN6zfSRv/UnCzUVn+21QrLWlHHHAi
 yo6t6cDDa7X3z6+gR63OndRsa8ysWLdE6ZUvgrL3h0sAkGthEC9Dvqle1sWgfv6LDw7P
 3xoZNwqrXG40dASk2xWo8JyXoUTsKBD1ynJ4AlYrQdbm3cn0PUiF9gRLzpfkQbxtBSm7
 TYgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeHOvw6MlLqm5f26iZH6kzyJ02+FBXF6AWzdFFvPEw6TqSYNS/ATYxFJ96cUiQXFZd5Nhcvo1jgho=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1cgPUIzT3DLAHnlyfquXQohbdht+DG1LlS1LXJDmlkROzVRml
 SB0hrpS1hsozXCEUjEPmD8K6bkgj+zyP9S+xLx7hoDqJjLe3ZEwKFUYRUUiaFBiWdWDoWH6gO1G
 Ze2/n4AW16fPyT1AeB41AGB6XLe3ecN+Z56Ab
X-Google-Smtp-Source: AGHT+IGYOhjKEQmlHtrugQt34padsEOCiU22JleS9UeHG8yLwrBPBBWRxbXoU9frSSi4wQBqFivZBoMrIwRgXX1QdHI=
X-Received: by 2002:a05:620a:269a:b0:7a1:d9a6:a9af with SMTP id
 af79cd13be357-7a5069f1f8dmr1864595885a.68.1724175194965; Tue, 20 Aug 2024
 10:33:14 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Aug 2024 10:33:14 -0700
MIME-Version: 1.0
In-Reply-To: <ZsTShZnD-NbZqGio@smile.fi.intel.com>
References: <20240819223834.2049862-1-swboyd@chromium.org>
 <20240819223834.2049862-3-swboyd@chromium.org>
 <ZsRrWfoPPVGC4Dqy@smile.fi.intel.com>
 <CAE-0n536OWtoOoRSM=6u=wA75A+0WtBktiY=6Y6VjKKTQWPcNw@mail.gmail.com>
 <ZsTPuvoTIFVFHw6o@smile.fi.intel.com>
 <CAE-0n50xcj21WiPHW9ATE7BfxKpOWvdV7of97G_U5ZrMV0zUUw@mail.gmail.com>
 <ZsTShZnD-NbZqGio@smile.fi.intel.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 20 Aug 2024 10:33:14 -0700
Message-ID: <CAE-0n53JBtB0YAZxMhLVJhbsUNZo4JPyXUiHu=9EQT4Bx+tHPA@mail.gmail.com>
Subject: Re: [PATCH v3 02/17] drm/bridge: Verify lane assignment is going to
 work during atomic_check
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

Quoting Andy Shevchenko (2024-08-20 10:29:41)
> On Tue, Aug 20, 2024 at 10:24:47AM -0700, Stephen Boyd wrote:
> > Quoting Andy Shevchenko (2024-08-20 10:17:46)
> > > On Tue, Aug 20, 2024 at 10:12:55AM -0700, Stephen Boyd wrote:
> > > > Quoting Andy Shevchenko (2024-08-20 03:09:29)
> > > > > On Mon, Aug 19, 2024 at 03:38:16PM -0700, Stephen Boyd wrote:
>
> ...
>
> > > > > > +     /*
> > > > > > +      * Ensure this bridge is aware that the next bridge wants to
> > > > > > +      * reassign lanes.
> > > > > > +      */
> > > > > > +     for (i = 0; i < num_input_lanes; i++)
> > > > > > +             if (i != input_lanes[i].logical && !num_output_lanes)
> > > > > > +                     return -ENOTSUPP;
> > > > >
> > > > > Besides missing {} this code is internal to the Linux kernel. Is it okay?
> > > >
> > > > ENOTSUPP is used by select_bus_fmt_recursive() so I simply followed that
> > > > style.
> > >
> > > Okay, just be aware of that side effect of that code, also checkpatch may
> > > complain (however it might be false positive).
> >
> > Yes checkpatch complained but didn't enlighten me. Please tell me the
> > side effect as I'm unaware!
>
> I already told you above, if this code ever appears in user space it will be
> printed as a number and very much confuse the user!
>
> That's why usage of this code either has to be documented or be subsystem
> _known_ practice (GPIO library comes to my mind as it uses it internally,\
> but filters for user space).
>

Ok, got it. Thanks!
