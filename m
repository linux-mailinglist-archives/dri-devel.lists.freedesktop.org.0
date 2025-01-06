Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A0FA025DC
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 13:47:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6833210E65A;
	Mon,  6 Jan 2025 12:47:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="pjpSI1AG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125B910E65A
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 12:47:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C73DBFF806;
 Mon,  6 Jan 2025 12:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736167610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZKrFmXD6TjvH5o1w6Dlbb7cMDhenToSfWWFSP7Y1qvU=;
 b=pjpSI1AGqe5WlD1G35LIHVY+E/6roxFIZ4gaA+QfLr8TjhTXB40lWpCSFukgmPpffGCeXt
 Y0vNuVnQzF0Q7+l/EiV+B5Xdk7LuShaojfpCQXd5KGSBvYkgcqU6f3qLVc6Jo0MDrnEMiO
 buBfCZQxgWZhPQizImb8E5IYS+CB8dFrWnO1jVT5/oSIJMt39RNAE3jykDxH5X1WzcnHR9
 /0sO18dN58gaS3d/prL7NT8UgIo/VyO4w/627TexHh0C6HEH9ebTLU766fBHsVVTS8UlvP
 PdJ1iuF4GTuaKR6DOBqxNyoLDVnZcmGfewMzcrF0Sxt5j/z4MBfxivYazH2KMQ==
Date: Mon, 6 Jan 2025 13:46:47 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v6 4/8] drm: writeback: Introduce cleanup function
Message-ID: <Z3vQt9J2coVae7EO@louis-chauvet-laptop>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com
References: <20241230-google-vkms-managed-v6-0-15c7d65cd63b@bootlin.com>
 <20241230-google-vkms-managed-v6-4-15c7d65cd63b@bootlin.com>
 <20250106-straight-cyan-hare-50d8e0@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106-straight-cyan-hare-50d8e0@houat>
X-GND-Sasl: louis.chauvet@bootlin.com
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

On 06/01/25 - 10:43, Maxime Ripard wrote:
> On Mon, Dec 30, 2024 at 07:37:34PM +0100, Louis Chauvet wrote:
> > Currently there is no cleanup function for writeback connectors. To allows
> > implementation of drmm variant of writeback connector, create a cleanup
> > function that can be used to properly remove all the writeback-specific
> > properties and allocations.
> > 
> > This also introduce an helper to cleanup only the drm_writeback_connector
> > properties, so it can be used during initialization to cleanup in case of
> > failure.
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >  drivers/gpu/drm/drm_writeback.c | 43 +++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 43 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> > index 33a3c98a962d1ec49ac4b353902036cf74290ae6..c274cba257cde5f4b446df3854974e690c60bf7b 100644
> > --- a/drivers/gpu/drm/drm_writeback.c
> > +++ b/drivers/gpu/drm/drm_writeback.c
> > @@ -15,6 +15,7 @@
> >  #include <drm/drm_device.h>
> >  #include <drm/drm_drv.h>
> >  #include <drm/drm_framebuffer.h>
> > +#include <drm/drm_managed.h>
> >  #include <drm/drm_modeset_helper_vtables.h>
> >  #include <drm/drm_property.h>
> >  #include <drm/drm_writeback.h>
> > @@ -140,6 +141,22 @@ static int create_writeback_properties(struct drm_device *dev)
> >  	return 0;
> >  }
> >  
> > +static void delete_writeback_properties(struct drm_device *dev)
> > +{
> > +	if (dev->mode_config.writeback_pixel_formats_property) {
> > +		drm_property_destroy(dev, dev->mode_config.writeback_pixel_formats_property);
> > +		dev->mode_config.writeback_pixel_formats_property = NULL;
> > +	}
> > +	if (dev->mode_config.writeback_out_fence_ptr_property) {
> > +		drm_property_destroy(dev, dev->mode_config.writeback_out_fence_ptr_property);
> > +		dev->mode_config.writeback_out_fence_ptr_property = NULL;
> > +	}
> > +	if (dev->mode_config.writeback_fb_id_property) {
> > +		drm_property_destroy(dev, dev->mode_config.writeback_fb_id_property);
> > +		dev->mode_config.writeback_fb_id_property = NULL;
> > +	}
> > +}
> > +
> >  static const struct drm_encoder_funcs drm_writeback_encoder_funcs = {
> >  	.destroy = drm_encoder_cleanup,
> >  };
> > @@ -284,6 +301,32 @@ int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
> >  }
> >  EXPORT_SYMBOL(drm_writeback_connector_init_with_encoder);
> >  
> > +/**
> > + * drm_writeback_connector_cleanup - Cleanup the writeback connector
> > + * @dev: DRM device
> > + * @wb_connector: Pointer to the writeback connector to clean up
> > + *
> > + * This will decrement the reference counter of blobs and destroy properties. It
> > + * will also clean the remaining jobs in this writeback connector. Caution: This helper will not
> > + * clean up the attached encoder and the drm_connector.
> > + */
> > +static void drm_writeback_connector_cleanup(struct drm_device *dev,
> > +					    struct drm_writeback_connector *wb_connector)
> > +{
> > +	unsigned long flags;
> > +	struct drm_writeback_job *pos, *n;
> > +
> > +	delete_writeback_properties(dev);
> > +	drm_property_blob_put(wb_connector->pixel_formats_blob_ptr);
> > +
> > +	spin_lock_irqsave(&wb_connector->job_lock, flags);
> > +	list_for_each_entry_safe(pos, n, &wb_connector->job_queue, list_entry) {
> > +		drm_writeback_cleanup_job(pos);
> > +		list_del(&pos->list_entry);
> > +	}
> > +	spin_unlock_irqrestore(&wb_connector->job_lock, flags);
> > +}
> > +
> 
> Given that this function is static now, it should be merged with the
> patch using it.
> 
> Maxime

Hi Maxime,

Thanks for your review. I appreciate your feedback and will take it into 
account for the next iteration.

Besides this comment, is there anything else you noticed that might need 
attention before adding your Acked-by/Reviewed-by to the rest of the 
series?

Thanks a lot,
Louis Chauvet
