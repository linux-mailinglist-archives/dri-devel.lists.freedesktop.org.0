Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1BBA10797
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 14:20:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E59F10E021;
	Tue, 14 Jan 2025 13:20:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="IGH0prb8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BF310E021
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 13:20:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B72DC60003;
 Tue, 14 Jan 2025 13:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736860799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a5Z0AroFk1Z3h94p6fULgZmYAQLT7kfGOo/3Tossl0o=;
 b=IGH0prb8uo3kbQmvrh+EMqcuPyM20BRfUZfYw5cuehrqlKRhfWHiSI9BI4X2pHBUriJFm5
 3FrY5C4aqE+SJDjS+dzaHmJpaIqs4bMrzyuQn0JxEm59BxpbswtVs+6VX3ipKl5NdD3zTb
 klZzaSgtbts4fpAgXpLX8M5GWqvayRhN5pXmyEEP4juSd7ZvyZRW1VDJVd2O/vnHAlPkae
 wf8QTlh0RkDhihTPOVdqU/4tGojgdHGKAW2pdFSzRHFS/d9uWwWGxot8pXU3pJBNPYm7Av
 lAXqJCxlOLl3Y3nW2l4WRlCxU1sVLRvVAQ3D6UPBZeWirZnH7r1DIbR+eIEAEw==
Date: Tue, 14 Jan 2025 14:19:56 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH v7 3/7] drm/vkms: Switch to managed for crtc
Message-ID: <Z4ZkfK5p--NMTSKo@louis-chauvet-laptop>
Mail-Followup-To: Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
References: <20250113-google-vkms-managed-v7-0-4f81d1893e0b@bootlin.com>
 <20250113-google-vkms-managed-v7-3-4f81d1893e0b@bootlin.com>
 <e876c254-e107-4e8d-bd9e-9b42f844a187@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e876c254-e107-4e8d-bd9e-9b42f844a187@suse.de>
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

On 14/01/25 - 10:06, Thomas Zimmermann wrote:
> Hi
> 
> 
> Am 13.01.25 um 18:09 schrieb Louis Chauvet:
> > The current VKMS driver uses managed function to create crtc, but
> > don't use it to properly clean the crtc workqueue. It is not an
> > issue yet, but in order to support multiple devices easily,
> > convert this code to use drm and device managed helpers.
> > 
> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > Reviewed-by: Maíra Canal <mcanal@igalia.com>
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >   drivers/gpu/drm/vkms/vkms_crtc.c | 14 ++++++++++++++
> >   drivers/gpu/drm/vkms/vkms_drv.c  |  9 ---------
> >   2 files changed, 14 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> > index 28a57ae109fcc05af3fe74f94518c462c09119e3..ace8d293f7da611110c1e117b6cf2f3c9e9b4381 100644
> > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > @@ -6,6 +6,7 @@
> >   #include <drm/drm_atomic_helper.h>
> >   #include <drm/drm_probe_helper.h>
> >   #include <drm/drm_vblank.h>
> > +#include <drm/drm_managed.h>
> 
> Alphabetical order please.
> 
> >   #include "vkms_drv.h"
> > @@ -270,6 +271,14 @@ static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
> >   	.atomic_disable	= vkms_crtc_atomic_disable,
> >   };
> > +static void vkms_crtc_destroy_workqueue(struct drm_device *dev,
> > +					void *raw_vkms_out)
> > +{
> > +	struct vkms_output *vkms_out = raw_vkms_out;
> > +
> > +	destroy_workqueue(vkms_out->composer_workq);
> > +}
> > +
> 
> This could be implemented in drm_managed.c. drmm_alloc_ordered_workqueue()
> would call alloc_ordered_workqueue() and set up the managed callback as
> well.

Hello Thomas,

Thanks for this review. For the next iteration, I will add the macro 
drmm_alloc_ordered_workqueue:

void __drmm_destroy_workqueue(struct drm_device *device, void* res)
{
	struct workqueue_struct *wq = res;

	destroy_workqueue(wq);
}
EXPORT_SYMBOL(__drmm_destroy_workqueue);

#define drmm_alloc_ordered_workqueue(dev, fmt, flags, args...)					\
	({											\
		struct workqueue_struct *wq = alloc_ordered_workqueue(fmt, flags, ##args);	\
		wq ? ({										\
			int ret = drmm_add_action_or_reset(dev, __drmm_destroy_workqueue, wq);	\
			ret ? ERR_PTR(ret) : wq;						\
		}) :										\
			wq;									\
	})

Besides this, is there anything else you noticed that I should change 
for the next iteration in the remaining patches?

Thanks,
Louis Chauvet

> Best regards
> Thomas
> 
> >   int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
> >   		   struct drm_plane *primary, struct drm_plane *cursor)
> >   {
> > @@ -300,5 +309,10 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
> >   	if (!vkms_out->composer_workq)
> >   		return -ENOMEM;
> > +	ret = drmm_add_action_or_reset(dev, vkms_crtc_destroy_workqueue,
> > +				       vkms_out);
> > +	if (ret)
> > +		return ret;
> > +
> >   	return ret;
> >   }
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> > index e0409aba93496932b32a130ebb608ee53b1a9c59..7c142bfc3bd9de9556621db3e7f570dc0a4fab3a 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > @@ -53,14 +53,6 @@ MODULE_PARM_DESC(enable_overlay, "Enable/Disable overlay support");
> >   DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
> > -static void vkms_release(struct drm_device *dev)
> > -{
> > -	struct vkms_device *vkms = drm_device_to_vkms_device(dev);
> > -
> > -	if (vkms->output.composer_workq)
> > -		destroy_workqueue(vkms->output.composer_workq);
> > -}
> > -
> >   static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
> >   {
> >   	struct drm_device *dev = old_state->dev;
> > @@ -108,7 +100,6 @@ static const struct drm_debugfs_info vkms_config_debugfs_list[] = {
> >   static const struct drm_driver vkms_driver = {
> >   	.driver_features	= DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
> > -	.release		= vkms_release,
> >   	.fops			= &vkms_driver_fops,
> >   	DRM_GEM_SHMEM_DRIVER_OPS,
> >   	DRM_FBDEV_SHMEM_DRIVER_OPS,
> > 
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
