Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F99912B0B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 18:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0EB210F343;
	Fri, 21 Jun 2024 16:14:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="e1cgLbJl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED5410F343
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 16:14:33 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-42110872bf9so2762295e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 09:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1718986471; x=1719591271; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uMfbjZr2uTJhT15l2+QRq4M97mwyKH8RJy7ujbcJHMg=;
 b=e1cgLbJlBXvSBYEBBxOQ47hEEruCPHPxJjLRmXyB1l93uFHOvwUmLRYfwoYvLKKMR9
 /DV3RwIm3a0sVDsCeoBcdkvqYtuLO3lmPu/twGSSLsYTilzg0R2GX0Aq8NDP+CsCAwM7
 MdiCJ9pJ2F6f5P+EohnHWSxawAA6f3sdk9c3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718986471; x=1719591271;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uMfbjZr2uTJhT15l2+QRq4M97mwyKH8RJy7ujbcJHMg=;
 b=cqHY/pDaNa6+ADIaNlPKGKwH1+reQlb5wa9EUadugU/tMZKL6WMo4jlfRtnJeYmNsT
 pLRGO1DYx6wwunQtdCQzlkWTk9SD4ZRlrr3kK8qepAF/P/Un0UPZ1Mu43ZOzwU57vxn3
 CPkUu5nxpf7CvPqPLs32uzB2NIHaE+YIqcmsaGDBWQa6YCnue1WlwXedgeA47SasyPS5
 wL/lOTtZ9eWFLhL8anZ8Abbp8sieykk9Cmhz86AF1HtYmyBn/XNkjlGVZ/hpFmCXDOAr
 0ZQmeT/nAt6p3el/K93cKJNk0uJibcckwml7RsySvz8adLottZ2TQM+7ToqnpP65VXMX
 rs7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfukmjLZCSzkQZbaHIlvoOv/SvBCLJgjKzgM/mQlA7bQ7p3AOPV1jzyenpgiAgTQPMM7vvm8ZvXvfpCPUJfzRD+db6lJdmsfRz2BGZkTV7
X-Gm-Message-State: AOJu0Yzr0JTrIzzMegJEhRNkAahO0N0OGnrQPNJ+xsT5DTj/AaPhUS89
 neMAqZ7d1H1FOb3R0Xla8LWYrPQeNO+gy4H2MG3H7nz84mfeXAsV0iCeHT5kAcc=
X-Google-Smtp-Source: AGHT+IGozZS2m6Aa4Z+FGRAs8P6YpolAvk9pp4PxgbE/ZkeiyhByU1hTM7pxKiMz1N8GrN4T9tvxtQ==
X-Received: by 2002:a05:6000:4023:b0:35f:2287:7b97 with SMTP id
 ffacd0b85a97d-363193c62a9mr6191675f8f.4.1718986471317; 
 Fri, 21 Jun 2024 09:14:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366389b8597sm2186532f8f.36.2024.06.21.09.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 09:14:30 -0700 (PDT)
Date: Fri, 21 Jun 2024 18:14:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Doug Anderson <dianders@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Ripard <mripard@kernel.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Chris Morgan <macromorgan@hotmail.com>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Saravana Kannan <saravanak@google.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/panel: Avoid warnings w/ panel-simple/panel-edp at
 shutdown
Message-ID: <ZnWm5PPA43CG4XUs@phenom.ffwll.local>
Mail-Followup-To: Doug Anderson <dianders@chromium.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Ripard <mripard@kernel.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Chris Morgan <macromorgan@hotmail.com>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org,
 Saravana Kannan <saravanak@google.com>
References: <20240611074846.1.Ieb287c2c3ee3f6d3b0d5f49b29f746b93621749c@changeid>
 <ZmljNHteJ9L5EdE9@phenom.ffwll.local>
 <CAD=FV=V4C1AYVqG4gig+SiQr4n_mAPVASxneDDZT1a=7AY3Hzw@mail.gmail.com>
 <Zmm6i6iQOdP613w3@phenom.ffwll.local>
 <CACRpkdbb5OdizDLSRW3bFEJJhrQ7Fs8Pb=Q2yxBog62Z1m-bOQ@mail.gmail.com>
 <CAD=FV=Vm==ngDo_bZ+xqV4Ojj0SSOO3ZWaxAbWA906h6-e8FMA@mail.gmail.com>
 <ZnBGsbeJfvqP7wqI@phenom.ffwll.local>
 <CAD=FV=WUNcS0uAUro-oXEksHcKMb37kF2NMfd4pE9FahT7jXVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=WUNcS0uAUro-oXEksHcKMb37kF2NMfd4pE9FahT7jXVA@mail.gmail.com>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Tue, Jun 18, 2024 at 04:49:32PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Mon, Jun 17, 2024 at 7:22 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > > I'm really not convinced that hacking with device links in order to
> > > get the shutdown notification in the right order is correct, though.
> > > The idea is that after we're confident that all DRM modeset drivers
> > > are calling shutdown properly that we should _remove_ any code
> > > handling shutdown from panel-edp and panel-simple. They should just
> > > get disabled as part of DRM's shutdown. That means that if we messed
> > > with devicelinks just to get a different shutdown order that it was
> > > just for a short term thing.
> >
> > The device links would allow us to add consistency checks to the panel
> > code to make sure that the shutdown has already happened.
> >
> > And we do kinda need the device ordering still, because if they're shut
> > down in the wrong order the panel might lose it's power already, before
> > the drm driver had a chance to have the last chat with it. Only relevant
> > for non-dumb panels like dsi, but there's cases.
> 
> My impression is that we shouldn't be relying on the driver-level
> "shutdown" call at all but should instead be relying on DRM core to
> call us at the right times. I get this impression based on the fact
> that panel drivers are encouraged _not_ to implement a shutdown()
> callback but instead to rely on the DRM driver to do an orderly power
> off of things (like via drm_atomic_helper_shutdown()) at shutdown
> time.
> 
> I would also tend to say that for suspend/resume that things are more
> complicated than the driver model can really account for, which again
> is why DRM devices have prepare() and enable() phases with complicated
> rules about the ordering that the bridge chain runs those functions
> in.
> 
> Said another way, I believe I could re-phrase your paragraph above and
> say the exact opposite and it would be just as true:
> 
> And we do kinda need the device ordering still, because if they're
> shut down in the wrong order then the DRM device might lose its power
> already, before the panel driver has a chance to use it to send a few
> last commands to the panel.
> 
> ...but that would imply the exact opposite ordering. The issue is that
> there are established rules for the order things are powered on and
> off and those rules are encoded in the orders that prepare() and
> enable() are called. Trying to replicate these rules in the driver
> model just seems like something destined to fail and probably causes
> everyone who attempts this to give up.

Both is true.

a) panels need a lot more ordering than what the pm core provides

b) we still need to make sure that all the _other_ things the pm core
manages (like power/clock domains) don't get shut down too early

If the panel is gone, there's no point in the drm driver calling unprepare
and disable in the right order, the thing is off already.

So yeah defacto this means:
- panel and bridge drivers should _not_ put anything that manages drm kms
  state into their pm callbacks. None of them. The only stuff they can do
  in there is essentially undo anything they do in ->probe. But then I
  have questions why they're wasting power even when not in use ...

- drm driver must be in charge of the entire sequence, and the
  panel/bridge drivers must do any pm management in their kms callbacks

- but we still need to make sure that the pm core doesn't shut down the
  panel/bridges too early, because there's parent resources that the pm
  core manages for us (and they might be entirely disjoint from the
  display device, e.g. if your panel is on an i2c bus, then that i2c must
  stay powered on until after the drm device has done the pm handling)

> > > That being said, one could argue that having device links between the
> > > DRM device and the panel is the right thing long term anyway and that
> > > may well be. I guess the issue is that it's not necessarily obvious
> > > how the "parent/child" or "supplier/consumer" relationship works w/
> > > DRM devices, especially panels. My instinct says that the panel
> > > logically is a "child" or "consumer" of the DRM device and thus
> > > inserting the correct long term device link would mean we'd get
> > > shutdown notification in the wrong order. It would be hard to argue
> > > that the panel is the "parent" of a DRM device, but I guess you could
> > > call it a "supplier"? ...but it's also a "consumer" of some other
> > > stuff, like the pixels being output and also (perhaps) the DP AUX bus.
> > > All this complexity is why the DRM framework tends to use its own
> > > logic for things like prepare/enable instead of using what Linux gives
> > > you. I'm sure Saravanah can also tell you about all the crazy device
> > > link circular dependencies that DRM has thrown him through...
> >
> > The panel driver provides the panel, the drm device driver consumes it.
> > I'm not really clear why you want to structure this the other way round, I
> > can't come up with another way that makes sense from a device driver
> > model. And it's device driver model stuff here, not what's really going on
> > at the hardware level when everything is set up.
> 
> ...but, at least on eDP, the DRM device driver provides the DP AUX bus
> and the panel consumes it. This is the reverse order.

Nah, still the same order like in a more separate panel driver:

- Whatever physical bus driver the panel sits on is the parent bus for the
  panel. Whether that's i2c, spi, dsi or dp aux kinda doesn't matter.

- The panel driver provides the panel for the drm_device. Note that
  drm_device is does have a struct device pointer, but that's just for
  nesting/linking/userspace device enumeration. There's _no_ pm
  relationship between the two

- It's up to the drm driver to figure out how to make sure it's shuts down
  the software drm_device _before_ any of the hardware pieces go away. For
  pci drivers this is usually pretty easy, for anything else you need a
  device link or it'll go wrong in corner cases.

> Perhaps you
> could say that you should have a separate "struct device" for the DP
> AUX bus and the panel consumes the DP AUX bus device but then the DRM
> device consumes the panel?

Yes. And I think for buses like the mipi dsi one we really should have
that. And indeed, we do:

struct mipi_dsi_device {
	struct mipi_dsi_host *host;
	struct device dev;

	...

So it all checks out.

The edp case is special because we don't need per-panel edp drivers,
because it's all specialized. Therefore the full driver model with a
full-blown struct device is overkill. But conceptually, it should be
there.

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
