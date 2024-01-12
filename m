Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8943682BD47
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 10:30:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E5310EAC7;
	Fri, 12 Jan 2024 09:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3416510EAC7
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 09:30:56 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a2b9e2c9858so83511066b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 01:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1705051854; x=1705656654; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=iF1u7IHFBeeqe9HTwGKMvatCIDvvyVY2dE6LfY3bR0Y=;
 b=gOuRxyWYhGjfAFgf/bwnX2fvXhgayXtvPqTXOLd0Pw9puOfIXkI2W7folfSYPQa+2E
 D3jVCLKOzA58YuEDNrt3zFO2bLQIuv1oLDU08W4VI3VGXLMs6ZIA0egahqXF8m2chFBw
 ib52knC4tmZTvztG63Ufw/u40T9BglgJanV60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705051854; x=1705656654;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iF1u7IHFBeeqe9HTwGKMvatCIDvvyVY2dE6LfY3bR0Y=;
 b=Qe/HWaqBYghus6tbyLERy0fWESe+BHRHuFqiLBOPYKFTpESijY+JoLBqYFgu90BnBS
 xwlzdNtlvk6uDgoEaTlesUYyzU0T5c4SMVEh/fLq1qDKlbrgEhyr9IVmGxdUl0g5VTlp
 S2Xod/om5bwjrAkhcM9O4+D2cWzx2rxxS9lY+8RL4yQjeTCvV3BadWsbRwW/VK7oFyFW
 VU3JEx8OdIpscqYO+g/uz/lQtsvx4QD8DOsVdVCS/Srs5NDRD/lRtP0shF2acxrnD1fy
 7SSLl3IV7u/saKntnCE+LcAX5QlbceaJ4HPT1mI1LJS3HB8V0DWdKeSt/RDuM8Y/Cufe
 5dxg==
X-Gm-Message-State: AOJu0Yxd8kywz65e5DQsE4F4vUT5NJRD2DLBo7s6SZesuQUI6FozeXWt
 1zn0bxL8HsEUf6CZPztIZFOPxUfbk07uG8aDNf1rnOxiKHQ=
X-Google-Smtp-Source: AGHT+IGYYy9BrYc8Nc5FPgRXPxqIx6QknCUBWZCNMISPGD81PapPqnDyzj9Xx+3SBdfmdv/KCeX7BQ==
X-Received: by 2002:a17:907:9716:b0:a2c:cc44:2382 with SMTP id
 jg22-20020a170907971600b00a2ccc442382mr624839ejc.3.1705051854412; 
 Fri, 12 Jan 2024 01:30:54 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ox9-20020a170907100900b00a2825a9e1d0sm1605443ejb.174.2024.01.12.01.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 01:30:53 -0800 (PST)
Date: Fri, 12 Jan 2024 10:30:52 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Zack Rusin <zack.rusin@broadcom.com>
Subject: Re: BUG / design challenge: vmwgfx + PRIME handle free == clobbering
 errno
Message-ID: <ZaEGzAHMOVIcYcRt@phenom.ffwll.local>
References: <20231219171554.Horde.U9YedWH6peFYoNUi4CA_Wzp@webmail.your-server.de>
 <CABQX2QPkEWDhE6xAaucaFh7QWvA06xJ8bfqrmPQTKM61X-YMmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABQX2QPkEWDhE6xAaucaFh7QWvA06xJ8bfqrmPQTKM61X-YMmQ@mail.gmail.com>
X-Operating-System: Linux phenom 6.5.0-4-amd64 
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
Cc: VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Stefan Hoffmeister <stefan.hoffmeister@econos.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 22, 2023 at 08:27:14PM -0500, Zack Rusin wrote:
> On Tue, Dec 19, 2023 at 11:15 AM Stefan Hoffmeister
> <stefan.hoffmeister@econos.de> wrote:
> >
> >
> > Hi,
> >
> > vmwgfx implements drmPrimeFDToHandle in terms of the TTM resource manager.
> >
> > At the same time, the driver advertises
> >
> >         .driver_features =
> >         DRIVER_MODESET | DRIVER_RENDER | DRIVER_ATOMIC | DRIVER_GEM,
> >
> > Given that, a userland application will call drmCloseBufferHandle to
> > correctly release any previously acquired handle.
> >
> > In kernel language, this translates to ioctl
> > DRM_IOCTL_PRIME_FD_TO_HANDLE and DRM_IOCTL_GEM_CLOSE.
> >
> > Problems:
> >
> > a) because the application uses drmCloseBufferHandle, and that goes
> > through GEM (the driver claims "I am GEM"!), vmwgfx will always return
> > EINVAL, because the driver is _not_ GEM, but TTM on that aspect.
> >
> > This will always clobber errno for userspace, which is not at all
> > helpful for meaningful error handling.
> >
> > Additionally, the driver offers no formal API contract which would
> > allow applications to detect that the driver does not like be talked
> > to like a GEM driver, although it is _claims_ to be GEM driver.

Yeah this is really badly breaking expectations of generic userspace :-/

> > b) there is no (documented) means to release the handle acquired from
> > a call to drmPrimeFDToHandle; this implies that in principle any call
> > to drmPrimeFDToHandle will leak the handle.
> >
> > Questions:
> >
> > a) how can errno clobbering by vmwgfx with EINVAL be avoided?
> >
> > b) what is the correct way to release the TTM resources allocated
> > through drmPrimeFDToHandle?
> >
> >
> > For context: the KDE Plasma Desktop kwin DRM integration layer makes
> > extensive use of drmPrimeFDToHandle. With the way the VMware vmwgfx
> > driver behaves, I see these options:
> >
> > a) correctly check the return code of drmCloseBufferHandle and blindly
> > log all the EINVAL errors triggered by the VMware driver, putting
> > blame on the application for mis-managing handles
> > b) drop any return code from drmCloseBufferHandle onto the floor,
> > completely disregarding application integrity checking
> > c) hard-code a check for "vmwgfx" as the driver in use and spam "this
> > driver owned by VMware / Broadcom is broken, ignore the following
> > EINVAL and secondary effects" for integrity checks
> >
> > I do not like any of these options, to be honest.
> >
> > Many thanks for any input
> 
> Thanks for the report! This is mainly an artifact of vmwgfx predating
> GEM and really basically all of drm, so the ioctl interface on top of
> which vmwgfx operates is a bit bonkers. I know there are a number of
> examples where drm graphics drivers were breaking the ioctl interface,
> but we've tried avoiding that in vmwgfx and so supporting our old
> userspace and new userspace, which are incompatible, is incredibly
> complex and fragile. Our approach was to, in general, deal with those
> as they come. Our userspace, also in general, deals with surfaces,
> which aren't GEM's, as you've noticed, but instead are backed by a GEM
> object, so expects the handle to prime to not be GEM's. As you can
> imagine it's a bit hard to make sure ioctl's for which userspace has
> the opposite expectations are working fine (we've done it for some
> already though, the "dumb" ones being an example).
> 
> If you'd have an IGT test that tests for this without requiring CRC's
> then we'd get it fixed quickly. Otherwise making it work is difficult,
> not because this particular bug is difficult to fix, but because it's
> difficult to fix it while keeping the xorg drivers from 2012 working.
> We'll likely just make sure the prime ioctl's return proper GEM
> objects for clients that advertise certain cap's. Is KWin advertising
> DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT?  That'd be a trivial, albeit
> unexpected, way of making sure the old userspace gets the semantics it
> expects, while making sure the new clients get proper behavior.

Instead of trying to detect generic userspace, which I think is futile
because there's really not anything beyoned "generic userspace expects
gem handles, so give it to them", would it be possible to detect the
legacy driver somehow? Because generic kms clients are really not required
to use any specific feature at all that kms provides, so I don't think
there's a way to reliably detect those that works across everything.

Like some legacy ioctl/parameter set that only the legacy xorg-modesetting
driver uses should fit the bill here, or maybe a combination of them. Some
ideas:

- if you get an ADDFB call with a legacy buffer (not a gem buffer), mark
  the client as legacy and then return legacy buffer handles, not gem ones
  from fd2handle.

- maybe similar for "you get a legacy buffer handle for SETCURSOR ioctl"

- maybe there's a unique setup sequence that only the xorg driver uses?
  Like a sequence of ioctl/ioctl parameters that's unique to the old xorg
  driver.

It's still brittle, but since no one's working on the legacy driver
anymore you only need to chase this once and then be done. And it /should/
allow you to implement standard gem behaviour by default for all these
standard ioctls that generic userspace expects to work, and only use the
old behaviour when you detect the legacy userspace and have set the
fpriv->uses_legacy_buffer_handles flag.

A really bonkers fix would be to merge the buffer handle xarrays into one
and use one of the tag bits to denote whether it's a legacy or gem one,
and then allow GEM_CLOSE to close them all. But that's really ugly and
probably way too much surgery.

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
