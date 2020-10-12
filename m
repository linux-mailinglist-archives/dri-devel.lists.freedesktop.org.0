Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE42828B3A4
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 13:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827D36E25A;
	Mon, 12 Oct 2020 11:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ADF86E25A
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 11:20:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1D376ACA3;
 Mon, 12 Oct 2020 11:20:31 +0000 (UTC)
Date: Mon, 12 Oct 2020 13:20:30 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH 2/3] drm/vkms: Switch to shmem helpers
Message-ID: <20201012132030.0b8a48ae@linux-uq9g>
In-Reply-To: <160250034327.30484.13309178658036116683@build.alporthouse.com>
References: <20201009232156.3916879-1-daniel.vetter@ffwll.ch>
 <20201009232156.3916879-2-daniel.vetter@ffwll.ch>
 <160250034327.30484.13309178658036116683@build.alporthouse.com>
Organization: SUSE Software Solutions Germany GmbH
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 12 Oct 2020 11:59:03 +0100 Chris Wilson <chris@chris-wilson.co.uk>
wrote:

> Quoting Daniel Vetter (2020-10-10 00:21:55)
> > Inspired by a patch by Chris Wilson for vgem. Plus this gives us vmap
> > at the gem bo level, which we need for generic fbdev emulation.
> > 
> > Luckily shmem also tracks ->vaddr, so we just need to adjust the code
> > all over a bit to make this fit.
> > 
> > Also wire up handle_to_fd, dunno why that was missing.
> > 
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > Cc: Melissa Wen <melissa.srw@gmail.com>
> > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > ---
> > diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> > index 33c031f27c2c..66c6842d70db 100644
> > --- a/drivers/gpu/drm/vkms/vkms_composer.c
> > +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> > @@ -5,6 +5,7 @@
> >  #include <drm/drm_atomic.h>
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_gem_framebuffer_helper.h>
> > +#include <drm/drm_gem_shmem_helper.h>
> >  #include <drm/drm_vblank.h>
> 
> >  static void vkms_release(struct drm_device *dev)
> >  {
> > @@ -91,9 +82,11 @@ static struct drm_driver vkms_driver = {
> >         .driver_features        = DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
> >         .release                = vkms_release,
> >         .fops                   = &vkms_driver_fops,
> > -       .dumb_create            = vkms_dumb_create,
> > +       .dumb_create            = drm_gem_shmem_dumb_create,
> 
> Something worth pointing out is that will create an uncached (well WC)
> buffer, but since it is being exported with prime, that is probably for

I'd rather set .gem_create_object to drm_gem_shmem_create_object_cached() to
get cached memory. We already have other drivers that do this.

Best regards
Thomas


> the better. It might be worth using a memcpy_from_wc() for writeback/CRC
> calculations. E.g.
> 
> > @@ -129,15 +130,15 @@ static void compose_cursor(struct vkms_composer *cursor_composer,
> >                            void *vaddr_out)
> >  {
> > +       blend(vaddr_out, cursor_shmem_obj->vaddr,
> >               primary_composer, cursor_composer);
> >  }
> >  
> > @@ -147,20 +148,20 @@ static int compose_planes(void **vaddr_out,
> >  {
> > +       memcpy(*vaddr_out, shmem_obj->vaddr, shmem_obj->base.size);
> 
> would benefit from WC accessors.
> 
> On the other hand, if the load is so small no one notices, it can wait.
> 
> Do we have anything that uses vkms in CI?
> 
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
> -Chris

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
