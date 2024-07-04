Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5F8927030
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 09:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F7E10E342;
	Thu,  4 Jul 2024 07:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="QFir23xn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C10710E342
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 07:04:46 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-52e9a920e73so273750e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2024 00:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1720076684; x=1720681484;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+I0YFt2S31oYkUolijfK0ro39JsAf/yoRmVvlou8NbA=;
 b=QFir23xnNmsMn/BEcCZxpVD/Vbb05Y8CeCSERcKLjknR3L7nxqUeY7esuTTga3dR9n
 bdk4h+Lraj6vxEg0rS+Xh48sBSann9dQsTbEBpk4KBWKK3OxxlT0TqPwI49/zVNnCEwI
 frNyXfX49+h2dUORsh/ZVdGN5av600tVtYeY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720076684; x=1720681484;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+I0YFt2S31oYkUolijfK0ro39JsAf/yoRmVvlou8NbA=;
 b=iX3aP2Cu6j1dCOonbAS9NdN05XY/nX1/2CQj0RmtlhCSqFQDAqCxI1qfGwNKQ5SxwJ
 m+6i4azmPySDGSa7QNCYlCLELxkhIGTfRp6LP09Zf6fsAo1x7n+ToDpeYjIPnkCnL0R7
 PoclzQaQvrM/7sKv+Ii8BhkpxIuxQZzspoesfmdEKUNLxs+kkhZGlKQkCRctGcUF+LuY
 329K2UjfFg7J5X+A2sGINMFsosUQUMBRafpAU4zHEOHy1YvsiEVaRdpa1IYLYWqDduwN
 3ABzvVI3VXGaXHu/x8PjUa7wDJ/EJw/HmVEM94aBk958HETN01hXz3GHLhiOjlYg+Hh0
 h5dA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/fUfZ2KCQJPg0nprV+TLjwruoaaM7m3nc/DgLUAJTx3BJbFgwargGpoHIK0H0bboB5AookP0PbQT8PIcnbFDh+Ofz7CBYQRtHXM+YXcyC
X-Gm-Message-State: AOJu0YwEywWMU71FotJ05qAVLYNqeXVC9NHoc0oMppVMsGs/r1W2Y6EW
 ms+VlKsGz8lQXNSIc/0BYswg91XRg2eZVhB71aF+ZLWZsercJ9WBWCkuEH24lYyjfHMvVP5Zt1w
 +IR98nEvPptKQYgeFvMvOoR4YXN7fBqd7NMiA
X-Google-Smtp-Source: AGHT+IFA8Zpb5aVn/nJmjDl78Fqz8vpLDKvtcaia4i1+n5h5N+xv8zrHzcTB09mYhepYidg32nJsuqBn0nmYhW5KqtY=
X-Received: by 2002:ac2:5a5c:0:b0:52c:eeb0:8208 with SMTP id
 2adb3069b0e04-52ea06ef484mr375340e87.66.1720076684489; Thu, 04 Jul 2024
 00:04:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240627071904.4017160-1-wenst@chromium.org>
 <20240628123140.5872fc6f@booty>
In-Reply-To: <20240628123140.5872fc6f@booty>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 4 Jul 2024 15:04:33 +0800
Message-ID: <CAGXv+5FZtRb2R_OSwQQAUESM4p-UszXGWaDf8GW7+cHcZ7CuNQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mipi-dsi: Add OF notifier handler
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Jun 28, 2024 at 6:31=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> Hello Chen-Yu,
>
> +Rob
>
> On Thu, 27 Jun 2024 15:19:03 +0800
> Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> > Add OF notifier handler needed for creating/destroying MIPI DSI devices
> > according to dynamic runtime changes in the DT live tree. This code is
> > enabled when CONFIG_OF_DYNAMIC is selected.
> >
> > This is based on existing code for I2C and SPI subsystems.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Thanks for copying me on this patch. Could be useful for my
> hotplug-bridge work, however I'm aiming at writing code that works also
> for non-DSI so we'll see. The code looks pretty fine however.
>
> My concern however is about the usage of an OF reconfig notifier. A few
> days ago Rob Herring wrote:
>
> > a notifier is never a great design so
> > maybe we can come up with something better
>
> (https://lore.kernel.org/all/CAL_Jsq+=3DmGEJXsjq1UZFMJtHko_z+doiFMXnx9K7e=
xDuznymSA@mail.gmail.com)
>
> So maybe this is something you can clarify with him.

Well, as mentioned in the commit message, this is based on existing code
found in the I2C and SPI cores. In these cases it is dealing with the
status flipping from disabled to okay, which then triggers the subsystem
to register a new device for the toggled device node.

If a better mechanism can be developed, then the existing code along with
the code I introduce here can be migrated over.

ChenYu

> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
