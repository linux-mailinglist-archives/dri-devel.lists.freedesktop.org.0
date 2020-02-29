Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C312B17467E
	for <lists+dri-devel@lfdr.de>; Sat, 29 Feb 2020 12:29:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F0B6E2F9;
	Sat, 29 Feb 2020 11:28:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89306E2F0
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Feb 2020 11:28:54 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id v22so604120otq.11
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Feb 2020 03:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kgx3asov+q3Sz6icywO0p03BuTN5ekvKXaX/30JiGRM=;
 b=fH09UrNIxNH/jnAphA5qz5l2+8D2CSXpdp5MRm1ul/n8ELZQZC3ctqz9DIa00HqfZ0
 w4ceWO3B3jN+8mPBZmT8oOiyaDYFoZ41vgEgW4flD8jfQ+i05Xs+G3PAJg0DBaQL9+W3
 +GX4iFJG5C/Wl70jdizI2vkj7fduXPpTT8XEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kgx3asov+q3Sz6icywO0p03BuTN5ekvKXaX/30JiGRM=;
 b=m+tbhWbQNGye386dK7TaxxWu8n8jtmNLvvD+Ti/yytHKqb5Hly4QaApkQ2MXv47N4L
 W6Zr9R+p1AfkBoEzqxlUGic2Iu/BHfbUaa1uYhBuh8Jn7vkS17YoNUupyZV4sGw+Ois6
 EofTfn9NFCLGHIMLyiswU6hqPsQA0eUTEOp+uTH6mWELAuxJz3WqS0JsaSDjBzKigNjP
 QxfHP1BRN97YsP47cB29N0gRgW1pS2DgetmsUBqY/Rxxh3voq4Qg5xFbX0X/IY4b7ldh
 DNrU4z+KwgbWWbzf89FLjHgnr3dVJ+ATyPwXczFXHt3D4r6rp6rLOTdVgPVi4WejZ+C9
 NwUQ==
X-Gm-Message-State: APjAAAXpT1a+TscIAD0JiBpS83xTc1wJH8AMfU8hWFetv2vOfs3PmuGS
 mTRPucsptNzzTV6kqv0MXz/ephf6uDfPYZ305OAriA==
X-Google-Smtp-Source: APXvYqwNL0fKGwCurxrTQ5N5hlOXNPeM3GYvXbZHIKEz3ftwS0DT4+npG/QVTJ+fu8U15yG1j5a0Nb85l9XDOWBVGBM=
X-Received: by 2002:a9d:6196:: with SMTP id g22mr6744413otk.204.1582975734049; 
 Sat, 29 Feb 2020 03:28:54 -0800 (PST)
MIME-Version: 1.0
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
 <20200227181522.2711142-4-daniel.vetter@ffwll.ch>
 <20200228224504.GA23961@ravnborg.org>
 <CAKMK7uHPWZ=F2EyqnM7x1GpXY_SGu3e_jGXX4cg0OGyx_+C8ig@mail.gmail.com>
 <20200229111710.GB3674@ravnborg.org>
In-Reply-To: <20200229111710.GB3674@ravnborg.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Sat, 29 Feb 2020 12:28:42 +0100
Message-ID: <CAKMK7uEYxM8BAsp+DHUxw+qdE_B3J+ePAxC-j0V+v+J6trffgw@mail.gmail.com>
Subject: Re: [PATCH 03/51] drm: add managed resources tied to drm_device
To: Sam Ravnborg <sam@ravnborg.org>, "Nikula,
 Jani" <jani.nikula@linux.intel.com>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Marco Felsch <m.felsch@pengutronix.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 29, 2020 at 12:17 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > > > + *
> > > > + * Based on drivers/base/devres.c
> > > > + */
> > > > +
> > > > +#include <drm/drm_managed.h>
> > > > +
> > > > +#include <linux/list.h>
> > > > +#include <linux/slab.h>
> > > > +#include <linux/spinlock.h>
> > > > +
> > > > +#include <drm/drm_device.h>
> > > > +#include <drm/drm_print.h>
> > >
> > > It is good practice to group the include files.
> > > And drm/ comes after linux/
> >
> > I try to put the main header first to make sure it's stand-alone, but
> > I guess that works with the header check now? Do I need to do anything
> > to get that checked?
>
> The header-check infrastructure was dropped again - see:
> fcbb8461fd2376ba3782b5b8bd440c929b8e4980

Uh I'm disappoint :-/

Adding Jani in case he missed this too. I guess maybe we should
resurrect it for drm again (and with a file pattern starting in a
.dot).

> > > > +     /**
> > > > +      * @managed:
> > > > +      *
> > > > +      * Managed resources linked to the lifetime of this &drm_device as
> > > > +      * tracked by @ref.
> > > > +      */
> > > > +     struct {
> > > > +             struct list_head resources;
> > > > +             void *final_kfree;
> > > > +             spinlock_t lock;
> > > > +     } managed;
> > >
> > > I am missing kernel-doc here.
> > > At least document that lock is used to guard access to resources.
> > > (s/lock/lock_resources/ ?)
> >
> > Dunno why, but the support for name sub-structures seems to have
> > broken in kerneldoc. So I can type it, but it's not showing up, so I
> > didn't bother. Well I had it, but deleted it again. It's still
> > documented to work, but I have no idea what I'm doing wrong.
>
> Most readers prefer the .c files as the source.
> I personally read the generated kernel doc when I google
> and when I check that my own stuff looks good in kernel-doc format.
> So comments are still valueable despite not being picked up by
> kernel-doc.
> You know this - but I just wanted to encourage you to write the few
> lines that may help me and others :-)

Hm I thought way back this actually worked. Again ping for Jani, he's
better on top of what's happening in kernel-doc land.
-Daniel
--
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
