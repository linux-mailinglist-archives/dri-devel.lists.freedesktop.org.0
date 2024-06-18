Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C507A90E02C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 01:50:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B10B410E80B;
	Tue, 18 Jun 2024 23:50:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="KkDrjT1Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B45AE10E80B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 23:50:06 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-6316253dc2aso54793307b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 16:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718754604; x=1719359404;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LuRs4UoMixZtW9wC9DXlGZ+iQJ7nv669Oq/k30wGXbM=;
 b=KkDrjT1QImPpprlDanijZNh06frIza2OtoyF6qrErt9VFlMx3SkS5vhZIZ3tcWGmR8
 x97nZPvHSydM1uaDukiN/PJkzvJRHme/myQORntB+sM7kUrvWs7bICd0f0oH7xNAhJrg
 Y/CBwgOzWIQAGRza6cBuMDLBLja4JaJpBL/WM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718754604; x=1719359404;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LuRs4UoMixZtW9wC9DXlGZ+iQJ7nv669Oq/k30wGXbM=;
 b=nZbRe1c0GT7TfwkVUO6xfEym4DKhegc+7lrpejuq6RjN4NHC4mfwzSZQ/oZzCbD9Dl
 ppTQ0kaE2yFQoHRt4kV7elpU69a5jM9USjCPEz3suasUYLWDd0wJXZuzot/QolaQChjd
 H62AywgMQM2ZYUz1uXBqTKu3XeV5X5tMUHVl31w9GuHfNoosPUlQ+19wwaGpmcNNZIf9
 y3MYLp7TS8N3d28is0GikexKyeFqFmLucKSNEhSjuDHtYRnYxinc07dxE6gnBOKCFlfa
 2XwXt+b1HUcl3IcnL5tZMDODlnycZq1hESVf1abMr0L9kLLoRubmt8Dbsz5rQLLeOIcP
 x3+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDc+bQqKKCZOh0T3hxub+5xh8GgHcRYu0I+z+FAuX9LcRqGvg4k330+9/zUhZybyUCieGs1j4bElCeD3H+0GihVxLM0UQZam+TzZ/tbUhm
X-Gm-Message-State: AOJu0YypOJxAPZogeMMVtQKBIx+VwuKbrRjK3IwKMV9O+bJ0fwUz3fj5
 t5EaT6w49S+SqYc1+kvoNnd4YC2qnOPoWz6IMnNC5FZgN/dfj/YZrs6XfwXCafN4oUKCjdHBfKA
 =
X-Google-Smtp-Source: AGHT+IGK3Ui+FQPcFDMm/OG2IA/SLPvdsWYU9r3U1XWlEcP6+NHg8PNyKDHWZqgNa2+16sZMvgH+Qw==
X-Received: by 2002:a05:690c:724:b0:61b:a7de:1f8c with SMTP id
 00721157ae682-63a8d72d40emr12992537b3.2.1718754603647; 
 Tue, 18 Jun 2024 16:50:03 -0700 (PDT)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com.
 [209.85.160.172]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b505b5c076sm876196d6.127.2024.06.18.16.49.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 16:49:57 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-443586c2091so206051cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 16:49:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUJTQsyOCAMN1oW/C85Z9+RgNsHt+fuTQgxNF/qxDzFWBCagDGW9RejNxj/PswW4DMy2qEw+gJJB1tan6UyT8Z412o7ysTNJ5q5m2YJaV8D
X-Received: by 2002:ac8:5982:0:b0:444:a616:de03 with SMTP id
 d75a77b69052e-444aa3b5060mr753291cf.1.1718754584856; Tue, 18 Jun 2024
 16:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240611074846.1.Ieb287c2c3ee3f6d3b0d5f49b29f746b93621749c@changeid>
 <ZmljNHteJ9L5EdE9@phenom.ffwll.local>
 <CAD=FV=V4C1AYVqG4gig+SiQr4n_mAPVASxneDDZT1a=7AY3Hzw@mail.gmail.com>
 <Zmm6i6iQOdP613w3@phenom.ffwll.local>
 <CACRpkdbb5OdizDLSRW3bFEJJhrQ7Fs8Pb=Q2yxBog62Z1m-bOQ@mail.gmail.com>
 <CAD=FV=Vm==ngDo_bZ+xqV4Ojj0SSOO3ZWaxAbWA906h6-e8FMA@mail.gmail.com>
 <ZnBGsbeJfvqP7wqI@phenom.ffwll.local>
In-Reply-To: <ZnBGsbeJfvqP7wqI@phenom.ffwll.local>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 18 Jun 2024 16:49:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WUNcS0uAUro-oXEksHcKMb37kF2NMfd4pE9FahT7jXVA@mail.gmail.com>
Message-ID: <CAD=FV=WUNcS0uAUro-oXEksHcKMb37kF2NMfd4pE9FahT7jXVA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Avoid warnings w/ panel-simple/panel-edp at
 shutdown
To: Doug Anderson <dianders@chromium.org>,
 Linus Walleij <linus.walleij@linaro.org>, 
 dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Maxime Ripard <mripard@kernel.org>, Yuran Pereira <yuran.pereira@hotmail.com>, 
 Chris Morgan <macromorgan@hotmail.com>, David Airlie <airlied@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 linux-kernel@vger.kernel.org, Saravana Kannan <saravanak@google.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
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

Hi,

On Mon, Jun 17, 2024 at 7:22=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch> wro=
te:
>
> > I'm really not convinced that hacking with device links in order to
> > get the shutdown notification in the right order is correct, though.
> > The idea is that after we're confident that all DRM modeset drivers
> > are calling shutdown properly that we should _remove_ any code
> > handling shutdown from panel-edp and panel-simple. They should just
> > get disabled as part of DRM's shutdown. That means that if we messed
> > with devicelinks just to get a different shutdown order that it was
> > just for a short term thing.
>
> The device links would allow us to add consistency checks to the panel
> code to make sure that the shutdown has already happened.
>
> And we do kinda need the device ordering still, because if they're shut
> down in the wrong order the panel might lose it's power already, before
> the drm driver had a chance to have the last chat with it. Only relevant
> for non-dumb panels like dsi, but there's cases.

My impression is that we shouldn't be relying on the driver-level
"shutdown" call at all but should instead be relying on DRM core to
call us at the right times. I get this impression based on the fact
that panel drivers are encouraged _not_ to implement a shutdown()
callback but instead to rely on the DRM driver to do an orderly power
off of things (like via drm_atomic_helper_shutdown()) at shutdown
time.

I would also tend to say that for suspend/resume that things are more
complicated than the driver model can really account for, which again
is why DRM devices have prepare() and enable() phases with complicated
rules about the ordering that the bridge chain runs those functions
in.

Said another way, I believe I could re-phrase your paragraph above and
say the exact opposite and it would be just as true:

And we do kinda need the device ordering still, because if they're
shut down in the wrong order then the DRM device might lose its power
already, before the panel driver has a chance to use it to send a few
last commands to the panel.

...but that would imply the exact opposite ordering. The issue is that
there are established rules for the order things are powered on and
off and those rules are encoded in the orders that prepare() and
enable() are called. Trying to replicate these rules in the driver
model just seems like something destined to fail and probably causes
everyone who attempts this to give up.


> > That being said, one could argue that having device links between the
> > DRM device and the panel is the right thing long term anyway and that
> > may well be. I guess the issue is that it's not necessarily obvious
> > how the "parent/child" or "supplier/consumer" relationship works w/
> > DRM devices, especially panels. My instinct says that the panel
> > logically is a "child" or "consumer" of the DRM device and thus
> > inserting the correct long term device link would mean we'd get
> > shutdown notification in the wrong order. It would be hard to argue
> > that the panel is the "parent" of a DRM device, but I guess you could
> > call it a "supplier"? ...but it's also a "consumer" of some other
> > stuff, like the pixels being output and also (perhaps) the DP AUX bus.
> > All this complexity is why the DRM framework tends to use its own
> > logic for things like prepare/enable instead of using what Linux gives
> > you. I'm sure Saravanah can also tell you about all the crazy device
> > link circular dependencies that DRM has thrown him through...
>
> The panel driver provides the panel, the drm device driver consumes it.
> I'm not really clear why you want to structure this the other way round, =
I
> can't come up with another way that makes sense from a device driver
> model. And it's device driver model stuff here, not what's really going o=
n
> at the hardware level when everything is set up.

...but, at least on eDP, the DRM device driver provides the DP AUX bus
and the panel consumes it. This is the reverse order. Perhaps you
could say that you should have a separate "struct device" for the DP
AUX bus and the panel consumes the DP AUX bus device but then the DRM
device consumes the panel?

-Doug
