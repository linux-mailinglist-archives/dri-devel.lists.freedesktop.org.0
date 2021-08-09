Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D01053E475C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 16:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D48893A7;
	Mon,  9 Aug 2021 14:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B3D89BFC
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 14:19:29 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id u1so731667wmm.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Aug 2021 07:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=asxuMfNmFDWbe1m96nTaMaCjzDZkLvcWUtq3w1gIv78=;
 b=hVtNv1XFAgn8MUGa02a/+tdWVdwlEUGaeV68PhLvuybTC7YGe6NTPO9Zb6P06nuhWL
 2xE8f5IIL5uz+Dm+bEPjXApIwtrCn5V269188Dz9vzSdmGYfC1Xab1w7phY/l/x+MsdY
 Ai33OPC4NjMYl4ETLa7Hzfjn1nRT5NG+Kh1WA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=asxuMfNmFDWbe1m96nTaMaCjzDZkLvcWUtq3w1gIv78=;
 b=M5231FFXf4IxY5aKkgaxG14VY/VX6UwrRve5nvsc78vzjTEXtM+pJ5O5HlGG9LyLH5
 +1JKB4u/+DfvK4E93o+/aqI2KjXdG1uvq8JDDJkZ/3MhkBZw3FINBCoRkzDvh8O2KXdt
 u7aavfxinucMrmqO5jZMyeVyAWavIVcfSq96AJfbqEUkwDYobQbUyRnkp/CG1U6zh4Ot
 qD6+FKM8jpohnFMo5B9ThZ/BoQ8Uu7qg6lAqZpz1VJN6VblVrrgsOVtOhZAPpLuFp9JF
 s0sKlvJ1e8rG1lCGZw4DgSOu5/UNpl+lrpeaEMVzJHtY+Ip7uOul8XHdHyO8S8LxqWqw
 ke/A==
X-Gm-Message-State: AOAM5331WjJ1V9feBOMvyBGk6kS8aEAXSCk7TEKwGBhoTB2gz4IVT9Lj
 qKV9IAVS3jwU3tRORd2PLz4Niw==
X-Google-Smtp-Source: ABdhPJzCprHZRWVc+gVADu7DGEw4x5JaA6CKsPhvZyVNbvyGY5GvZgsgoXI/ydusr4z3zDID/L6Piw==
X-Received: by 2002:a7b:cc16:: with SMTP id f22mr34033986wmh.99.1628518768465; 
 Mon, 09 Aug 2021 07:19:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u25sm4526123wml.8.2021.08.09.07.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 07:19:27 -0700 (PDT)
Date: Mon, 9 Aug 2021 16:19:25 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Imre Deak <imre.deak@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, linux-fbdev@vger.kernel.org,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] fbdev/efifb: Release PCI device's runtime PM
 ref during FB destroy
Message-ID: <YRE5bbarqMW9AV5T@phenom.ffwll.local>
References: <20210802133551.1904964-1-imre.deak@intel.com>
 <YQsTWSGIgY00XEU7@phenom.ffwll.local>
 <20210807152110.GA2390730@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210807152110.GA2390730@ideak-desk.fi.intel.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Sat, Aug 07, 2021 at 06:21:10PM +0300, Imre Deak wrote:
> On Thu, Aug 05, 2021 at 12:23:21AM +0200, Daniel Vetter wrote:
> > On Mon, Aug 02, 2021 at 04:35:51PM +0300, Imre Deak wrote:
> > > Atm the EFI FB driver gets a runtime PM reference for the associated GFX
> > > PCI device during driver probing and releases it only when removing the
> > > driver.
> > > 
> > > When fbcon switches to the FB provided by the PCI device's driver (for
> > > instance i915/drmfb), the EFI FB will get only unregistered without the
> > > EFI FB driver getting unloaded, keeping the runtime PM reference
> > > acquired during driver probing. This reference will prevent the PCI
> > > driver from runtime suspending the device.
> > > 
> > > Fix this by releasing the RPM reference from the EFI FB's destroy hook,
> > > called when the FB gets unregistered.
> > > 
> > > Fixes: a6c0fd3d5a8b ("efifb: Ensure graphics device for efifb stays at PCI D0")
> > > Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > 
> > Patch looks good:
> > 
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > 
> > But I've found a bunch of ordering issues here:
> > - we should probably get the runtime pm reference _before_ we register the
> >   framebuffer. There's a race right now about there.
> 
> Yea, missed this will send a v2 moving it earlier.
> 
> > - the sysfs_remove_groups and framebuffer_release should also be moved
> >   into the destroy callback. This is more a leak type of situation.
> 
> Those sysfs entries belong to the efifb platform device, showing the
> bootup screen_info.lfb_* info, not related to fb_info, so imo
> efifb_remove() is the correct place to remove those. But yes, freeing
> fb_info seems to belong to fb_destroy().

Ah ok. Might be good to put a comment down that this isn't tied to fb_info
lifetime.

> Atm, things will blow up when unbinding the efifb device after the efifb
> framebuffer was unregistered while removing it as a conflicting FB
> (since unregister_framebuffer() will be called twice), so that would
> need to be solved as well. Maybe remove_conflicting_pci_framebuffers()
> could unregister the platform device instead of only unregistering the
> framebuffer, similarly to drm_aperture_detach_firmware(), but haven't
> checked this in more detail.

Yeah either that, or a double-unregister check (plus correct refcount) in
unregister_framebuffer. Ideally with a check so that only the
double-unregstier from remove_conflicting_pci_framebuffers is caught, and
not a driver that accidentally unregisters the fbdev twice.

Even better if this would be all devm_ wrapped so it's idiot proof.

I think generally I'd say "let's not invest in fbdev", but a) these
hotremove/unload bugs have been hurting us since forever, and b) efifb
seems to be bound to stay around for a very long time - the simpldrmfb
stuff isn't really moving forward very fast.

Anyway, would be good to get this all sorted eventually.
-Daniel

> 
> > Cheers, Daniel
> > 
> > > ---
> > >  drivers/video/fbdev/efifb.c | 8 +++++---
> > >  1 file changed, 5 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
> > > index 8ea8f079cde26..25cdea32b9633 100644
> > > --- a/drivers/video/fbdev/efifb.c
> > > +++ b/drivers/video/fbdev/efifb.c
> > > @@ -47,6 +47,8 @@ static bool use_bgrt = true;
> > >  static bool request_mem_succeeded = false;
> > >  static u64 mem_flags = EFI_MEMORY_WC | EFI_MEMORY_UC;
> > >  
> > > +static struct pci_dev *efifb_pci_dev;	/* dev with BAR covering the efifb */
> > > +
> > >  static struct fb_var_screeninfo efifb_defined = {
> > >  	.activate		= FB_ACTIVATE_NOW,
> > >  	.height			= -1,
> > > @@ -243,6 +245,9 @@ static inline void efifb_show_boot_graphics(struct fb_info *info) {}
> > >  
> > >  static void efifb_destroy(struct fb_info *info)
> > >  {
> > > +	if (efifb_pci_dev)
> > > +		pm_runtime_put(&efifb_pci_dev->dev);
> > > +
> > >  	if (info->screen_base) {
> > >  		if (mem_flags & (EFI_MEMORY_UC | EFI_MEMORY_WC))
> > >  			iounmap(info->screen_base);
> > > @@ -333,7 +338,6 @@ ATTRIBUTE_GROUPS(efifb);
> > >  
> > >  static bool pci_dev_disabled;	/* FB base matches BAR of a disabled device */
> > >  
> > > -static struct pci_dev *efifb_pci_dev;	/* dev with BAR covering the efifb */
> > >  static struct resource *bar_resource;
> > >  static u64 bar_offset;
> > >  
> > > @@ -603,8 +607,6 @@ static int efifb_remove(struct platform_device *pdev)
> > >  	unregister_framebuffer(info);
> > >  	sysfs_remove_groups(&pdev->dev.kobj, efifb_groups);
> > >  	framebuffer_release(info);
> > > -	if (efifb_pci_dev)
> > > -		pm_runtime_put(&efifb_pci_dev->dev);
> > >  
> > >  	return 0;
> > >  }
> > > -- 
> > > 2.27.0
> > > 
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
