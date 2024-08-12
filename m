Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7FC94EFCE
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 16:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE23010E249;
	Mon, 12 Aug 2024 14:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="h1w4Ko5A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB9910E253
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 14:40:55 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-52f00427236so730417e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 07:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1723473653; x=1724078453; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=a0rVZzR8kdk4P0DdRNEbtQ3wZtu1f1m7SpAvyEyUkQ0=;
 b=h1w4Ko5APzrPQDxrCuMBDxVD1PN5CFxmqdMiE8GgE6R6ArF9ms7zP55WwIOecCQIQY
 /zvntcCnrisG45JNo0zXoIVdYyLqo2HediDvwHmmRwKusR48tGbnwiJK0RlQdX28RnkC
 iJbgX8/NKstHioqndBi0rEdbT24HwcrV3ddXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723473653; x=1724078453;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a0rVZzR8kdk4P0DdRNEbtQ3wZtu1f1m7SpAvyEyUkQ0=;
 b=gUZjQaEJiujKUXbWB/5JVqlwzdS20O0tTUiU7CCUVnaTQ7+ZuGWYr1Ofi57+5H94F1
 vX5k4FVXO+ftjRudaKHqzmiPGE915X8S7ZZSDtlnvAQqf1HSPLu2gi6+MJxNGmwke4dW
 mTFyIwcYfUs/4iP8BKRA11i4b29CuliGgY6ACYnlbuyH8Q8nOPlj0GVnVuC6OiLpCm3f
 kmzFJTag3wMEWzdND1IcUdDpTM8fOBqykowxNbHb5Fx2/sUruoANyQNtd05kR8Fdl18e
 HYqtlbdCMnPFDpNYdGuzOjb5gjnXD5JgWC0AhhK6UleR4+sHiAOETrRa+44ko5Bg2kSv
 Y+3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLK1mgWGQgn6yQSQ/h7ziY2giU0U3YplKj2Zki7sLOPqD0J+lPvFS1vOnBfenmPXv7cJGwfTxdHrY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6em+b2LfQYY3v9FueXZ+QGSuZsIvTr4CzjtczjRusBb05YqaA
 clXUMiajBXB+Q+c0ngH8mBGOJIiqiouiL4rpmUYkblJkvuoSWNmJW8KZtANpjOw=
X-Google-Smtp-Source: AGHT+IFcP9gun+jG2FSiDDVfzAuc4TJKhPAn1ST0I66Mb2eSttXPJ1173mOU2G5VU4MjdLyfk8Kxtg==
X-Received: by 2002:a05:6512:4025:b0:52e:f99e:5dd3 with SMTP id
 2adb3069b0e04-5321369eb60mr128453e87.8.1723473652793; 
 Mon, 12 Aug 2024 07:40:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80bb0e124bsm236323366b.61.2024.08.12.07.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 07:40:52 -0700 (PDT)
Date: Mon, 12 Aug 2024 16:40:50 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kherbst@redhat.com, lyude@redhat.com,
 dakr@redhat.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 1/9] drm: Do delayed switcheroo in drm_lastclose()
Message-ID: <Zroe8pi1pRRhdIW8@phenom.ffwll.local>
References: <20240812083000.337744-1-tzimmermann@suse.de>
 <20240812083000.337744-2-tzimmermann@suse.de>
 <ZrnUoPuYv0v-yx79@phenom.ffwll.local>
 <ZrnhiTofu_L3hLzA@phenom.ffwll.local>
 <c8228a22-9a8c-4eca-bf09-d72208fe007b@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8228a22-9a8c-4eca-bf09-d72208fe007b@suse.de>
X-Operating-System: Linux phenom 6.9.10-amd64 
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

On Mon, Aug 12, 2024 at 12:41:39PM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 12.08.24 um 12:18 schrieb Daniel Vetter:
> > On Mon, Aug 12, 2024 at 11:23:44AM +0200, Daniel Vetter wrote:
> > > On Mon, Aug 12, 2024 at 10:28:22AM +0200, Thomas Zimmermann wrote:
> > > > Amdgpu and nouveau call vga_switcheroo_process_delayed_switch() from
> > > > their lastclose callbacks. Call it from drm_lastclose(), so that the
> > > > driver functions can finally be removed. Only PCI devices with enabled
> > > > switcheroo do the delayed switching. The call has no effect on other
> > > > hardware.
> > > > 
> > > > v2:
> > > > - move change to drm_lastclose() (Sima)
> > > > - update docs for vga_switcheroo_process_delayed_switch()
> > > > 
> > > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > A bit an aside: The entire vgaswitcheroo code is still a midlayer mess,
> > > where the locking is at the wrong layers resulting in the can_switch check
> > > potentially being racy. But that's a different can of worms.
> > Ok I got a bit annoyed about this mess again, and I think I have a
> > reasonable idea for how to address it. Not sure why this took a decade,
> > and definitely only pick this up if you're really bored.
> 
> No, definitely not. :) I don't think I have hardware for testing
> vga_switcheroo. Does this still exist? It seemed to be a thing of the 2000s.

Yeah good chances the old style switcheroo doesn't have many, if any users
left ...
-Sima

> 
> Best regards
> Thomas
> 
> > 
> > - We add a new vga_switcheroo_client_tryget, which checks the current
> >    state, and if it's on, increments a newly added refcount (which vgw
> >    switheroo maintains). Otherwise it fails. Drivers call this from their
> >    drm_driver->open hook. This check also allows us to drop the
> >    layer-violating checks in drm_open_helper for drm_dev->dev_power_state.
> > 
> > - That refcount is dropped with vga_switcheroo_client_put, called from
> >    drm_driver->close. If the refcount drops to 0 this function also does
> >    delayed switch processing.
> > 
> > - All the can_switch callbacks get removed and instead the vgwswr code
> >    directly consults its own refount.
> > 
> > With this we don't have locking inversions anymore, and the old vgw
> > switcheroo code works a lot more like the new mode based on runtime pm and
> > power domains.
> > 
> > With a bit more shuffling I think we can also ditch
> > drm_driver->dev_power_state:
> > 
> > - There's one in the intel backlight code, which is annoying, since it's
> >    wants to know whether the current callchain is from a vga switcheroo
> >    state change. But doable with a little helper.
> > 
> > - Most others just want a vga_switcheroo_client_is_off() helper, which
> >    should be easy. Some are even entirely redundant, at least from a cursor
> >    callchain check. There's no races for these because they only matter
> >    during system suspend, since you should not mix both runtime and classic
> >    vgaswitcheroo logic. We might want some checks for that in that new
> >    helper ...
> > 
> > - The one in the fbdev code is annoying, because it's another race.
> >    Ideally instead of that check it needs a call to
> >    vga_switcheroo_client_tryget/put just around the call to restore modes
> >    (we do not want fbdev to block state switches), but that probably means
> >    wiring a new callback through drm_client to drivers.
> > 
> > - Might have missed a special case ...
> > 
> > Anyway, I got nerdsniped, had an idea, figured best to type it up. Maybe
> > we want to add a link to this to todo.rst, I think we have a vgaswitcheroo
> > entry already.
> > 
> > Cheers, Sima
> > 
> > 
> > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > 
> > > > ---
> > > >   drivers/gpu/drm/drm_file.c       | 4 ++++
> > > >   drivers/gpu/vga/vga_switcheroo.c | 3 +--
> > > >   2 files changed, 5 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> > > > index 714e42b05108..513bef816ae9 100644
> > > > --- a/drivers/gpu/drm/drm_file.c
> > > > +++ b/drivers/gpu/drm/drm_file.c
> > > > @@ -38,6 +38,7 @@
> > > >   #include <linux/pci.h>
> > > >   #include <linux/poll.h>
> > > >   #include <linux/slab.h>
> > > > +#include <linux/vga_switcheroo.h>
> > > >   #include <drm/drm_client.h>
> > > >   #include <drm/drm_drv.h>
> > > > @@ -404,6 +405,9 @@ void drm_lastclose(struct drm_device * dev)
> > > >   	drm_dbg_core(dev, "driver lastclose completed\n");
> > > >   	drm_client_dev_restore(dev);
> > > > +
> > > > +	if (dev_is_pci(dev->dev))
> > > > +		vga_switcheroo_process_delayed_switch();
> > > >   }
> > > >   /**
> > > > diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switcheroo.c
> > > > index 365e6ddbe90f..18f2c92beff8 100644
> > > > --- a/drivers/gpu/vga/vga_switcheroo.c
> > > > +++ b/drivers/gpu/vga/vga_switcheroo.c
> > > > @@ -926,8 +926,7 @@ static void vga_switcheroo_debugfs_init(struct vgasr_priv *priv)
> > > >   /**
> > > >    * vga_switcheroo_process_delayed_switch() - helper for delayed switching
> > > >    *
> > > > - * Process a delayed switch if one is pending. DRM drivers should call this
> > > > - * from their ->lastclose callback.
> > > > + * Process a delayed switch if one is pending.
> > > >    *
> > > >    * Return: 0 on success. -EINVAL if no delayed switch is pending, if the client
> > > >    * has unregistered in the meantime or if there are other clients blocking the
> > > > -- 
> > > > 2.46.0
> > > > 
> > > -- 
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> 
> -- 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
