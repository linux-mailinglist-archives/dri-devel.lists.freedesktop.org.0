Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F23F6930FBB
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 10:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8178C10E2C6;
	Mon, 15 Jul 2024 08:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="HqPXNyt4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDDD410E2C6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 08:28:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A13DC000C;
 Mon, 15 Jul 2024 08:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1721032095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yGc188UpjzG+33fxD7SNC2KQ7T06wKgav19Xcw+WTdQ=;
 b=HqPXNyt4oq66oUA1KngW2Xq2vyQuxKCrK/Zfb1ZxH4igPTYNAqGIp+7njQ32fDs8jm0LXX
 VYWFRHZcGOKRz+ur9qU+pRUppjsW+NmslUb3ss7lliN+j2gRqsqrGfivG0CY3dNGfVMj/j
 nbJQUsyobNSJLoOrbHYcCG00he2O3wgqxOdvBoOEcjD9ItpESj2fzsVM1+feAvl/efSHbO
 EQ3TrPS3CBg0h+5BIDI1tonFosjP/NYjoJfSdrqYslVld1ZS7x5mnKtwhr7qYxxnN2ucxE
 W5+RqlpTxfWOC+iVvBIpgGB40jHEtURRWV1IRMIjs65YVRNMvC8JsvbQa4md9A==
Date: Mon, 15 Jul 2024 10:28:11 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org,
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>,
 pekka.paalanen@haloniitty.fi, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v8 04/17] drm/vkms: Add typedef and documentation for
 pixel_read and pixel_write functions
Message-ID: <ZpTdmxfqx3ulALk8@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org,
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>,
 pekka.paalanen@haloniitty.fi, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 Pekka Paalanen <pekka.paalanen@collabora.com>
References: <20240516-yuv-v8-0-cf8d6f86430e@bootlin.com>
 <20240516-yuv-v8-4-cf8d6f86430e@bootlin.com>
 <99be1782-0235-4418-adbf-cd80d8b28d7a@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <99be1782-0235-4418-adbf-cd80d8b28d7a@igalia.com>
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

Le 13/07/24 - 11:38, Maíra Canal a écrit :
> On 5/16/24 10:04, Louis Chauvet wrote:
> > Introduce two typedefs: pixel_read_t and pixel_write_t. It allows the
> > compiler to check if the passed functions take the correct arguments.
> > Such typedefs will help ensuring consistency across the code base in
> > case of update of these prototypes.
> > 
> > Rename input/output variable in a consistent way between read_line and
> > write_line.
> > 
> > A warn has been added in get_pixel_*_function to alert when an unsupported
> > pixel format is requested. As those formats are checked before
> > atomic_update callbacks, it should never happen.
> > 
> > Document for those typedefs.
> > 
> > Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

[...]

> >   /**
> > @@ -265,7 +265,7 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
> >    *
> >    * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
> >    */
> > -void *get_pixel_conversion_function(u32 format)
> > +pixel_read_t get_pixel_read_function(u32 format)
> >   {
> >   	switch (format) {
> >   	case DRM_FORMAT_ARGB8888:
> > @@ -279,7 +279,16 @@ void *get_pixel_conversion_function(u32 format)
> >   	case DRM_FORMAT_RGB565:
> >   		return &RGB565_to_argb_u16;
> >   	default:
> > -		return NULL;
> > +		/*
> > +		 * This is a bug in vkms_plane_atomic_check(). All the supported
> > +		 * format must:
> > +		 * - Be listed in vkms_formats in vkms_plane.c
> > +		 * - Have a pixel_read callback defined here
> > +		 */
> > +		WARN(true,
> > +		     "Pixel format %p4cc is not supported by VKMS planes. This is a kernel bug, atomic check must forbid this configuration.\n",
> > +		     &format);
> 
> Well, if this is a kernel bug, shouldn't we use a BUG_ON()/BUG() macro?

I don't know what is the "rule" for this kind of bug. Yes it is a kernel 
bug, but it is recoverable and I can avoid a full kernel crash by using a 
"do nothing" callback. 

If you prefer I can replace this by:

	pr_err("Pixel format %p4cc is [...]", &format);
	BUG();

and drop the next commit. The kernel will crash if there is a mismatch 
between advertised supported formats and formats listed here.

> Best Regards,
> - Maíra
> 
> >    * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
> >    */
> > -void *get_pixel_write_function(u32 format)
> > +pixel_write_t get_pixel_write_function(u32 format)
> >   {
> >   	switch (format) {
> >   	case DRM_FORMAT_ARGB8888:
> > @@ -304,6 +313,15 @@ void *get_pixel_write_function(u32 format)
> >   	case DRM_FORMAT_RGB565:
> >   		return &argb_u16_to_RGB565;
> >   	default:
> > -		return NULL;
> > +		/*
> > +		 * This is a bug in vkms_writeback_atomic_check. All the supported
> > +		 * format must:
> > +		 * - Be listed in vkms_wb_formats in vkms_writeback.c
> > +		 * - Have a pixel_write callback defined here
> > +		 */
> > +		WARN(true,
> > +		     "Pixel format %p4cc is not supported by VKMS writeback. This is a kernel bug, atomic check must forbid this configuration.\n",
> > +		     &format);
> > +		return (pixel_write_t)NULL;

I can do the same here.

Thanks,
Louis Chauvet

[...]

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
