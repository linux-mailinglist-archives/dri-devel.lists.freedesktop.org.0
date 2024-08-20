Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C2E958D7A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 19:34:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3BA810E801;
	Tue, 20 Aug 2024 17:34:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="haJn6xRg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04BA910E801
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 17:34:16 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-7a501dd544eso352835385a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 10:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724175255; x=1724780055;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=sT8btaeVFgKiZIC2/bVrNe0cKcp239nORrve01JKc1Q=;
 b=haJn6xRggtaVrLs9YNsBU/gKo3+HWoO0PEGPoslg4gLdYifNHt7dlWOaVE2GPaQU4V
 uXv0wONdFrvfPPu9CGND69KqvQhIPlaA/vnZKnz9pEk8JvgRaGk9wxpxhv4KLtAS4zzr
 cvV0Q294imUstMTtmrq19M9IkXu4lxv4P5zX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724175255; x=1724780055;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sT8btaeVFgKiZIC2/bVrNe0cKcp239nORrve01JKc1Q=;
 b=YGyrLR8dZiEdRx4gNuKwOoRXs0QnSa7Mp9l/ztdibaJPmTbRVzRTiEFmj5I0qjnyld
 fY85VlumiqAonVwUB6CT6BJzxNWkQlVxSnrv3+i8yZcYXuchd6r84HrTP3gMhwGifQtA
 0yp7pHEw8TVaq2UV2fulxdVT10ifPHZX108CZx0cQ0wUWvnKXGLBDvE2PmXOzXRavmx8
 soCnb0vI2zVemiBaLGX42RDW6Nv1PI/KO2lZ8G1p/xtQ2ZIEUW2RbBzDJ85o8wvA6VA/
 I/G9Fkq1/mV+EDmz+yuvOK+XtzDYi5zP70zHUGjjQG5Y5Nz8vZitc9U5ivnmzaO4CQmc
 F13w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbo8vUpT+3A36YTDTL3UnP6VSM8ym4Kw04G1iyTRnqpwfFeftYaof8XE0iIBa6SYBUaLal4C0TYSnpmcC6CfdHOzn5PHu8PO4GIkXTEFYl
X-Gm-Message-State: AOJu0Yy5zfRq+XnY9lEs+uG7lhhLoZhmzqLHpSE1Rnp2Y1IKk+M6/1yd
 1jsTpSFqkePoNasIzxS3LOFaaxVyFaq8MtFvgLkD1yg97R9gpEOV7mM2neRgQPR+Yzdj3I7W7Lq
 ZdAJY3qE24MD6OiZ3K5S8qMysy0UJoimfkljj
X-Google-Smtp-Source: AGHT+IGGJj/BEL1gcz7E4TOfNemZPl2ZAZ1e0Im3r9+oB7B/patnof4GuWnoFzCxo19sTL6oKp0QcBKMjKB8KkoFPP4=
X-Received: by 2002:a05:620a:2453:b0:79f:8f3:6ad4 with SMTP id
 af79cd13be357-7a6740028d4mr2801085a.1.1724175254910; Tue, 20 Aug 2024
 10:34:14 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Aug 2024 10:34:13 -0700
MIME-Version: 1.0
In-Reply-To: <ZsRt_I6y9MfWLawy@smile.fi.intel.com>
References: <20240819223834.2049862-1-swboyd@chromium.org>
 <20240819223834.2049862-11-swboyd@chromium.org>
 <ZsRt_I6y9MfWLawy@smile.fi.intel.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 20 Aug 2024 10:34:13 -0700
Message-ID: <CAE-0n516QBSg-ODNjaM-q52UtU17DJ45VC-pov+1oSfm2E_9Sg@mail.gmail.com>
Subject: Re: [PATCH v3 10/17] device property: Add remote endpoint to devcon
 matcher
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

Quoting Andy Shevchenko (2024-08-20 03:20:44)
> On Mon, Aug 19, 2024 at 03:38:24PM -0700, Stephen Boyd wrote:
> >  include/linux/property.h    | 5 +++--
>
> > -typedef void *(*devcon_match_fn_t)(const struct fwnode_handle *fwnode, const char *id,
> > -                                void *data);
> > +typedef void *(*devcon_match_fn_t)(const struct fwnode_handle *fwnode,
> > +                                const struct fwnode_handle *endpoint,
> > +                                const char *id, void *data);
>
> Seems there is no explanation of the parameters here, can we add a kernel-doc
> to this typedef (may be a separate patch)?

Sure. I'll throw in another patch.
