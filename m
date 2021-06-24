Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A81A73B2CE9
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 12:51:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1529B6EB54;
	Thu, 24 Jun 2021 10:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85096EB56
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 10:51:02 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1lwMwj-0001L8-Jm; Thu, 24 Jun 2021 12:50:57 +0200
Message-ID: <d31b8b5237695d9bea3ad52b9be410249d12d652.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: Implement mmap as GEM object function
From: Lucas Stach <l.stach@pengutronix.de>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux+etnaviv@armlinux.org.uk, 
 christian.gmeiner@gmail.com, airlied@linux.ie, daniel@ffwll.ch
Date: Thu, 24 Jun 2021 12:50:56 +0200
In-Reply-To: <ddae9158-0aa7-f861-2c61-5d8f8d28fb62@suse.de>
References: <20210624085800.7941-1-tzimmermann@suse.de>
 <657956dded241192bbd9ca59f6e9d58a9283f972.camel@pengutronix.de>
 <ddae9158-0aa7-f861-2c61-5d8f8d28fb62@suse.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Donnerstag, dem 24.06.2021 um 12:47 +0200 schrieb Thomas Zimmermann:
> Hi
> 
> Am 24.06.21 um 11:11 schrieb Lucas Stach:
> > Am Donnerstag, dem 24.06.2021 um 10:58 +0200 schrieb Thomas Zimmermann:
> > > Moving the driver-specific mmap code into a GEM object function allows
> > > for using DRM helpers for various mmap callbacks.
> > > 
> > > The respective etnaviv functions are being removed. The file_operations
> > > structure fops is now being created by the helper macro
> > > DEFINE_DRM_GEM_FOPS().
> > > 
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > ---
> > >   drivers/gpu/drm/etnaviv/etnaviv_drv.c       | 14 ++------------
> > >   drivers/gpu/drm/etnaviv/etnaviv_drv.h       |  3 ---
> > >   drivers/gpu/drm/etnaviv/etnaviv_gem.c       | 18 +++++-------------
> > >   drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 13 -------------
> > >   4 files changed, 7 insertions(+), 41 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> > > index f0a07278ad04..7dcc6392792d 100644
> > > --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> > > @@ -468,17 +468,7 @@ static const struct drm_ioctl_desc etnaviv_ioctls[] = {
> > >   	ETNA_IOCTL(PM_QUERY_SIG, pm_query_sig, DRM_RENDER_ALLOW),
> > >   };
> > >   
> > > -static const struct file_operations fops = {
> > > -	.owner              = THIS_MODULE,
> > > -	.open               = drm_open,
> > > -	.release            = drm_release,
> > > -	.unlocked_ioctl     = drm_ioctl,
> > > -	.compat_ioctl       = drm_compat_ioctl,
> > > -	.poll               = drm_poll,
> > > -	.read               = drm_read,
> > > -	.llseek             = no_llseek,
> > > -	.mmap               = etnaviv_gem_mmap,
> > > -};
> > > +DEFINE_DRM_GEM_FOPS(fops);
> > >   
> > >   static const struct drm_driver etnaviv_drm_driver = {
> > >   	.driver_features    = DRIVER_GEM | DRIVER_RENDER,
> > > @@ -487,7 +477,7 @@ static const struct drm_driver etnaviv_drm_driver = {
> > >   	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
> > >   	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> > >   	.gem_prime_import_sg_table = etnaviv_gem_prime_import_sg_table,
> > > -	.gem_prime_mmap     = etnaviv_gem_prime_mmap,
> > > +	.gem_prime_mmap     = drm_gem_prime_mmap,
> > >   #ifdef CONFIG_DEBUG_FS
> > >   	.debugfs_init       = etnaviv_debugfs_init,
> > >   #endif
> > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> > > index 003288ebd896..049ae87de9be 100644
> > > --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> > > @@ -47,12 +47,9 @@ struct etnaviv_drm_private {
> > >   int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
> > >   		struct drm_file *file);
> > >   
> > > -int etnaviv_gem_mmap(struct file *filp, struct vm_area_struct *vma);
> > >   int etnaviv_gem_mmap_offset(struct drm_gem_object *obj, u64 *offset);
> > >   struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_object *obj);
> > >   int etnaviv_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
> > > -int etnaviv_gem_prime_mmap(struct drm_gem_object *obj,
> > > -			   struct vm_area_struct *vma);
> > >   struct drm_gem_object *etnaviv_gem_prime_import_sg_table(struct drm_device *dev,
> > >   	struct dma_buf_attachment *attach, struct sg_table *sg);
> > >   int etnaviv_gem_prime_pin(struct drm_gem_object *obj);
> > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> > > index b8fa6ed3dd73..8f1b5af47dd6 100644
> > > --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> > > @@ -130,8 +130,7 @@ static int etnaviv_gem_mmap_obj(struct etnaviv_gem_object *etnaviv_obj,
> > >   {
> > >   	pgprot_t vm_page_prot;
> > >   
> > > -	vma->vm_flags &= ~VM_PFNMAP;
> > > -	vma->vm_flags |= VM_MIXEDMAP;
> > > +	vma->vm_flags |= VM_IO | VM_MIXEDMAP | VM_DONTEXPAND | VM_DONTDUMP;
> > 
> > I don't fully understand why this change is needed and the commit log
> > is silent about it. Excuse my ignorance, but can you please explain the
> > reasoning behind this change?
> 
> Sure, sorry for being brief.
> 
> I worked on cleaning up the deprecated gem_prime_* callbacks in struct 
> drm_driver. These are supposed to be GEM object functions. The only 
> obsolete gem prime callback in drm_driver is gem_prime_mmap.

Sorry, that's a misunderstanding. I see the justification for the patch
as a whole. I was asking specifically about the hunk above my comment.
Why are the vm_flags changed and how did you come up with this exact
combination of flags?

Regards,
Lucas

