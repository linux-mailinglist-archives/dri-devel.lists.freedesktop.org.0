Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 900788699AC
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 16:02:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3149E10E909;
	Tue, 27 Feb 2024 15:02:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="S5S8wzPZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 447CA10E8C4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 15:02:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1025860014;
 Tue, 27 Feb 2024 15:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709046134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wD53UKuw4zxoHOpXnQGMSfTDv9JExg1coPAv+jx4svI=;
 b=S5S8wzPZTwAnzhPdNHgvBSpPuxeFMNddFlI5FAvIXkIC0bw7wE2XCOGWOPB6c/l0WaAtqB
 Vap+q7sezl/pplwp2lQcyef0WDcrVNuKR32vUa3PDa1ZG3j2wVuca5GDHV3bHeHvyyautT
 qFN2zChzidAtscR/dxNmGhZc3JWylWv70vnrY/zDcoVY8GhZXrWIkKbLM4di3gDPSaBb3m
 mpjTVRBBchwaDTfxdScq7JQl4aBwkpELhdziP118IQJi9WzcxIyWercVM7JE6Z59kA5Wv2
 0qW/bQyNVRg8csjClDzQW9wvJf5hf/gcFwEsLunYuGxwUAg9RfUe6NCEq83TqQ==
Date: Tue, 27 Feb 2024 16:02:11 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 pekka.paalanen@haloniitty.fi, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v3 4/9] drm/vkms: Add typedef and documentation for
 pixel_read and pixel_write functions
Message-ID: <Zd35c1dTf8AAxen4@localhost.localdomain>
Mail-Followup-To: Arthur Grillo <arthurgrillo@riseup.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 pekka.paalanen@haloniitty.fi, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
References: <20240226-yuv-v3-0-ff662f0994db@bootlin.com>
 <20240226-yuv-v3-4-ff662f0994db@bootlin.com>
 <848f2690-2f20-4a92-82ff-64cdee8cb2ee@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <848f2690-2f20-4a92-82ff-64cdee8cb2ee@riseup.net>
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

[...]

> > diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> > index d5203f531d96..f68b1b03d632 100644
> > --- a/drivers/gpu/drm/vkms/vkms_plane.c
> > +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> > @@ -106,6 +106,13 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
> >  		return;
> >  
> >  	fmt = fb->format->format;
> > +	pixel_read_t pixel_read = get_pixel_read_function(fmt);
> > +
> > +	if (!pixel_read) {
> > +		DRM_WARN("Pixel format is not supported by VKMS planes. State is inchanged\n");
> 
> s/inchanged/unchanged/

Thanks for this correction. See my answer to [1], I changed the message a 
bit.
[1]: https://lore.kernel.org/dri-devel/20240226133646.174d3fb2.pekka.paalanen@collabora.com/

Kind regards,
Louis Chauvet

> > +		return;
> > +	}
> > +
> >  	vkms_plane_state = to_vkms_plane_state(new_state);
> >  	shadow_plane_state = &vkms_plane_state->base;
> >  
> > @@ -124,7 +131,7 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
> >  	drm_rect_rotate(&frame_info->rotated, drm_rect_width(&frame_info->rotated),
> >  			drm_rect_height(&frame_info->rotated), frame_info->rotation);
> >  
> > -	vkms_plane_state->pixel_read = get_pixel_conversion_function(fmt);
> > +	vkms_plane_state->pixel_read = pixel_read;
> >  }
> >  
> >  static int vkms_plane_atomic_check(struct drm_plane *plane,
> > diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> > index c8582df1f739..c92b9f06c4a4 100644
> > --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> > +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> > @@ -140,6 +140,13 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
> >  	if (!conn_state)
> >  		return;
> >  
> > +	pixel_write_t pixel_write = get_pixel_write_function(wb_format);
> > +
> > +	if (!pixel_write) {
> > +		DRM_WARN("Pixel format is not supported by VKMS writeback. State is inchanged\n");
> 
> Same here
> 
> Best Regards,
> ~Arthur Grillo
> 
> > +		return;
> > +	}
> > +
> >  	vkms_set_composer(&vkmsdev->output, true);
> >  
> >  	active_wb = conn_state->writeback_job->priv;
> > @@ -150,7 +157,7 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
> >  	crtc_state->wb_pending = true;
> >  	spin_unlock_irq(&output->composer_lock);
> >  	drm_writeback_queue_job(wb_conn, connector_state);
> > -	active_wb->pixel_write = get_pixel_write_function(wb_format);
> > +	active_wb->pixel_write = pixel_write;
> >  	drm_rect_init(&wb_frame_info->src, 0, 0, crtc_width, crtc_height);
> >  	drm_rect_init(&wb_frame_info->dst, 0, 0, crtc_width, crtc_height);
> >  }
> > 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
