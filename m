Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C241648CC
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 16:38:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36CB6EC29;
	Wed, 19 Feb 2020 15:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0E86EC29;
 Wed, 19 Feb 2020 15:38:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7503752B;
 Wed, 19 Feb 2020 16:38:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582126693;
 bh=2U6yE0hALD/a+CAw+BylUkrid1bqjiG3mxMUzkozhjU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kmTEB5LFVzDvIiOyfVKQEx41qYhjYB1t2tulo8kI0jOUy1Yh1nxpLyFRN5KRiflSP
 GlXQxNVX7D0tWYOF5RZ03GCp+Lv5ziobHGaPw6Q8IoQVR9kV0g5MKzR5T94D7Cqi2M
 pxB5PfLEN4eXa7rszoJT87/XROR5I97jeid7av5Y=
Date: Wed, 19 Feb 2020 17:37:55 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 22/52] drm: Use drmm_ for drm_dev_init cleanup
Message-ID: <20200219153755.GU5070@pendragon.ideasonboard.com>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-23-daniel.vetter@ffwll.ch>
 <20200219143537.GM5070@pendragon.ideasonboard.com>
 <CAKMK7uEhvT2MWfcwQDVpUZ86bgV78CMoj9wCPbeb+kLk8s9yJA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uEhvT2MWfcwQDVpUZ86bgV78CMoj9wCPbeb+kLk8s9yJA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Wed, Feb 19, 2020 at 04:27:57PM +0100, Daniel Vetter wrote:
> On Wed, Feb 19, 2020 at 3:35 PM Laurent Pinchart wrote:
> > On Wed, Feb 19, 2020 at 11:20:52AM +0100, Daniel Vetter wrote:
> > > Well for the simple stuff at least, vblank, gem and minor cleanup I
> > > want to further split up as a demonstration.
> > >
> > > v2: We need to clear drm_device->dev otherwise the debug drm printing
> > > after our cleanup hook (e.g. in drm_manged_release) will chase
> > > released memory and result in a use-after-free. Not really pretty, but
> > > oh well.
> > >
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_drv.c | 48 ++++++++++++++++++++-------------------
> > >  1 file changed, 25 insertions(+), 23 deletions(-)
> >
> > Is the managed API overhead, coupled with the fact that the code size
> > doesn't get reduced, worth it for core code ?
> 
> I've mostly done this as an example, to show how if you do this
> consistently, you can drop a few if (is_it_set_up) checks and remove
> the onion unwinding with lots of gotos.

That's however more a matter of making the cleanup handlers idempotent
than using a managed API, isn't it ?

> I do think it's worth it from
> that pov, since long-term I want to get to a world where everything
> related to drm_device gets unwound with drmm_ actions. The logging
> output becomes fairly nice if you enable it :-)
> 
> But yeah stand-alone it's not a good pitch. Heck even the overall
> patch series is still a net loss I think, simply because this is just
> the bare minimum to get started.
> -Daniel
> 
> > > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > > index 782fd5d6f8b2..1f7ab88d9435 100644
> > > --- a/drivers/gpu/drm/drm_drv.c
> > > +++ b/drivers/gpu/drm/drm_drv.c
> > > @@ -580,6 +580,23 @@ static void drm_fs_inode_free(struct inode *inode)
> > >   *    used.
> > >   */
> > >
> > > +static void drm_dev_init_release(struct drm_device *dev, void *res)
> > > +{
> > > +     drm_legacy_ctxbitmap_cleanup(dev);
> > > +     drm_legacy_remove_map_hash(dev);
> > > +     drm_fs_inode_free(dev->anon_inode);
> > > +
> > > +     put_device(dev->dev);
> > > +     /* Prevent use-after-free in drm_managed_release when debugging is
> > > +      * enabled. Slightly awkward, but can't really be helped. */
> > > +     dev->dev = NULL;
> > > +     mutex_destroy(&dev->master_mutex);
> > > +     mutex_destroy(&dev->clientlist_mutex);
> > > +     mutex_destroy(&dev->filelist_mutex);
> > > +     mutex_destroy(&dev->struct_mutex);
> > > +     drm_legacy_destroy_members(dev);
> > > +}
> > > +
> > >  /**
> > >   * drm_dev_init - Initialise new DRM device
> > >   * @dev: DRM device
> > > @@ -647,11 +664,15 @@ int drm_dev_init(struct drm_device *dev,
> > >       mutex_init(&dev->clientlist_mutex);
> > >       mutex_init(&dev->master_mutex);
> > >
> > > +     ret = drmm_add_action(dev, drm_dev_init_release, NULL);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > >       dev->anon_inode = drm_fs_inode_new();
> > >       if (IS_ERR(dev->anon_inode)) {
> > >               ret = PTR_ERR(dev->anon_inode);
> > >               DRM_ERROR("Cannot allocate anonymous inode: %d\n", ret);
> > > -             goto err_free;
> > > +             goto err;
> > >       }
> > >
> > >       if (drm_core_check_feature(dev, DRIVER_RENDER)) {
> > > @@ -688,19 +709,12 @@ int drm_dev_init(struct drm_device *dev,
> > >       if (drm_core_check_feature(dev, DRIVER_GEM))
> > >               drm_gem_destroy(dev);
> > >  err_ctxbitmap:
> > > -     drm_legacy_ctxbitmap_cleanup(dev);
> > > -     drm_legacy_remove_map_hash(dev);
> > >  err_minors:
> > >       drm_minor_free(dev, DRM_MINOR_PRIMARY);
> > >       drm_minor_free(dev, DRM_MINOR_RENDER);
> > > -     drm_fs_inode_free(dev->anon_inode);
> > > -err_free:
> > > -     put_device(dev->dev);
> > > -     mutex_destroy(&dev->master_mutex);
> > > -     mutex_destroy(&dev->clientlist_mutex);
> > > -     mutex_destroy(&dev->filelist_mutex);
> > > -     mutex_destroy(&dev->struct_mutex);
> > > -     drm_legacy_destroy_members(dev);
> > > +err:
> > > +     drm_managed_release(dev);
> > > +
> > >       return ret;
> > >  }
> > >  EXPORT_SYMBOL(drm_dev_init);
> > > @@ -763,20 +777,8 @@ void drm_dev_fini(struct drm_device *dev)
> > >       if (drm_core_check_feature(dev, DRIVER_GEM))
> > >               drm_gem_destroy(dev);
> > >
> > > -     drm_legacy_ctxbitmap_cleanup(dev);
> > > -     drm_legacy_remove_map_hash(dev);
> > > -     drm_fs_inode_free(dev->anon_inode);
> > > -
> > >       drm_minor_free(dev, DRM_MINOR_PRIMARY);
> > >       drm_minor_free(dev, DRM_MINOR_RENDER);
> > > -
> > > -     put_device(dev->dev);
> > > -
> > > -     mutex_destroy(&dev->master_mutex);
> > > -     mutex_destroy(&dev->clientlist_mutex);
> > > -     mutex_destroy(&dev->filelist_mutex);
> > > -     mutex_destroy(&dev->struct_mutex);
> > > -     drm_legacy_destroy_members(dev);
> > >  }
> > >  EXPORT_SYMBOL(drm_dev_fini);
> > >

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
