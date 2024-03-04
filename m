Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AE2870569
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 16:29:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA3210E967;
	Mon,  4 Mar 2024 15:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="fUDKbr2J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDF11122A3
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 15:29:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E963220002;
 Mon,  4 Mar 2024 15:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709566151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wHCBsLOi2TE/F/MpyV0az3Z7gDeEkKLlFB40S9OqL2A=;
 b=fUDKbr2JWqXWaXdvMufpjmE2aIQjbZ1jDbMoNw7SefeVIUW/fA+J+lG9RtnVmjDOUSdQab
 im1zsGpBccW0uJE2G9uiWDwx6/MbhzibaM3R3MWBtvaUE9txrhpSTYM15vOynuBm/f4PrM
 nMsYkag57/JMFif2MANj5lga5VtT18PI2WdPB6PWjOfEIjv/K262XA7gdN2NL42DRDvcUd
 n3/o0ohI+K9d7o/9P4MsXNXLIhsIs7XfWmTGLueBX4DFDMZyTlLN2vzcGlSpY7n63VzXdX
 N3SVRuAhs3R4Eh9vNGVW/lExs9jYxN7SlFsbJAAYKihWTD8DC+zvLrc/dopHmg==
Date: Mon, 4 Mar 2024 16:29:08 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com
Subject: Re: [PATCH v2 7/9] drm/vkms: Add range and encoding properties to
 pixel_read function
Message-ID: <ZeXoopxVQieA1WCl@localhost.localdomain>
Mail-Followup-To: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com
References: <20240223-yuv-v2-0-aa6be2827bb7@bootlin.com>
 <20240223-yuv-v2-7-aa6be2827bb7@bootlin.com>
 <20240226142343.459f23f7.pekka.paalanen@collabora.com>
 <Zd35cpAID3ea8AFO@localhost.localdomain>
 <20240229142426.274ae199.pekka.paalanen@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240229142426.274ae199.pekka.paalanen@collabora.com>
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

Le 29/02/24 - 14:24, Pekka Paalanen a écrit :
> On Tue, 27 Feb 2024 16:02:10 +0100
> Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> 
> > (same as for PATCHv2 6/9, I took the patch from Arthur with no 
> > modifications)
> > 
> > Le 26/02/24 - 14:23, Pekka Paalanen a écrit :
> > > On Fri, 23 Feb 2024 12:37:27 +0100
> > > Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> > >   
> > > > From: Arthur Grillo <arthurgrillo@riseup.net>
> > > > 
> > > > Create range and encoding properties. This should be noop, as none of
> > > > the conversion functions need those properties.  
> > > 
> > > None of the conversion function needs this? How can one say so?
> > > The previous patch is making use of them already, AFAICT?  
> > 
> > It's my fault, I mixed the commits (in Arthur's series, "Add range..." was 
> > before "Add YUV support"), but for me it makes no sens to have the color 
> > property without the support in the driver.
> 
> Ah, so if there was no YUV support, these properties would never affect
> anything. Ok, I see where that is coming from.
>
> > 
> > Maybe it's better just to merge "Add range..." with "Add YUV support"?
> > 
> > > How is this a noop? Is it not exposing new UAPI from VKMS?  
> > 
> > It's not a no-op from userspace, but from the driver side, yes.
> 
> If it all is already hooked up and handled in the driver, then say just
> that?
> 
> "Now that the driver internally handles these quantization ranges and YUV
> encoding matrices, expose the UAPI for setting them."
> 
> And fix the commit summary line too, nothing "pixel_read" here.

Ack
 
Kind regards,
Louis Chauvet

> Thanks,
> pq
> 
> > 
> > Kind regards,
> > Louis Chauvet
> > 
> > > Thanks,
> > > pq
> > >   
> > > > 
> > > > Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> > > > [Louis Chauvet: retained only relevant parts]
> > > > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > ---
> > > >  drivers/gpu/drm/vkms/vkms_plane.c | 9 +++++++++
> > > >  1 file changed, 9 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> > > > index 427ca67c60ce..95dfde297377 100644
> > > > --- a/drivers/gpu/drm/vkms/vkms_plane.c
> > > > +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> > > > @@ -228,5 +228,14 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> > > >  	drm_plane_create_rotation_property(&plane->base, DRM_MODE_ROTATE_0,
> > > >  					   DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK);
> > > >  
> > > > +	drm_plane_create_color_properties(&plane->base,
> > > > +					  BIT(DRM_COLOR_YCBCR_BT601) |
> > > > +					  BIT(DRM_COLOR_YCBCR_BT709) |
> > > > +					  BIT(DRM_COLOR_YCBCR_BT2020),
> > > > +					  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
> > > > +					  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
> > > > +					  DRM_COLOR_YCBCR_BT601,
> > > > +					  DRM_COLOR_YCBCR_FULL_RANGE);
> > > > +
> > > >  	return plane;
> > > >  }
> > > >   
> > >   
> > 
> > 
> > 
> 



-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
