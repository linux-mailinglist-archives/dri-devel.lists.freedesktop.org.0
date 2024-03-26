Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE8388C846
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 16:57:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFAF10F0C8;
	Tue, 26 Mar 2024 15:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="la2gUlTb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3774810F0B2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 15:57:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 794E06000A;
 Tue, 26 Mar 2024 15:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1711468627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fpI7AsFFwuwahUd/Ix1I35YDWVAvrwAzlUuyygSJgsQ=;
 b=la2gUlTbrXX0AtB/bHqFWTPBoySL1Isl0U6U6YwWnzNlYiDNXYuvHs1TujbLBT1B2fzQ7m
 Mvhaodv0FqUnHV3lDq9yqr4M/a26MsofopO1RUwvZGvKhsnKe2SJ1inRJR1o3WFQ7Tpv6J
 3RWexpF7y8SivjsviDihAKZvbAmZE8JiRkXR4NA9e1bBkTFjpP37EiD5fVXOvUkonFzhZu
 FNNtrrexdj9slUusBS9NrzIBxA7Woo0J2rXolj1USgv3u1mxE06aL6tkl3PD7M617Tba3b
 4PoVF1LmsmdqzuO1ok25rq3aMtbrWYM8FgEaUOUyFQqVYxzy5EgKKA+lEkECQQ==
Date: Tue, 26 Mar 2024 16:57:01 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net,
 Jonathan Corbet <corbet@lwn.net>, pekka.paalanen@haloniitty.fi,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com,
 marcheu@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v5 09/16] drm/vkms: Introduce pixel_read_direction enum
Message-ID: <ZgLwTbd_LHwsDF0I@localhost.localdomain>
Mail-Followup-To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net,
 Jonathan Corbet <corbet@lwn.net>, pekka.paalanen@haloniitty.fi,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com,
 marcheu@google.com, nicolejadeyee@google.com
References: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
 <20240313-yuv-v5-9-e610cbd03f52@bootlin.com>
 <ecffe7bd-98bc-444a-bf5b-d8f3ff933a34@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ecffe7bd-98bc-444a-bf5b-d8f3ff933a34@igalia.com>
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

Le 25/03/24 - 11:07, Maíra Canal a écrit :
> On 3/13/24 14:45, Louis Chauvet wrote:
> > The pixel_read_direction enum is useful to describe the reading direction
> > in a plane. It avoids using the rotation property of DRM, which not
> > practical to know the direction of reading.
> > This patch also introduce two helpers, one to compute the
> > pixel_read_direction from the DRM rotation property, and one to compute
> > the step, in byte, between two successive pixel in a specific direction.
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >   drivers/gpu/drm/vkms/vkms_composer.c | 36 ++++++++++++++++++++++++++++++++++++
> >   drivers/gpu/drm/vkms/vkms_drv.h      | 11 +++++++++++
> >   drivers/gpu/drm/vkms/vkms_formats.c  | 30 ++++++++++++++++++++++++++++++
> >   3 files changed, 77 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> > index 9254086f23ff..989bcf59f375 100644
> > --- a/drivers/gpu/drm/vkms/vkms_composer.c
> > +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> > @@ -159,6 +159,42 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
> >   	}
> >   }
> >   
> > +/**
> > + * direction_for_rotation() - Get the correct reading direction for a given rotation
> > + *
> > + * This function will use the @rotation setting of a source plane to compute the reading
> > + * direction in this plane which correspond to a "left to right writing" in the CRTC.
> > + * For example, if the buffer is reflected on X axis, the pixel must be read from right to left
> > + * to be written from left to right on the CRTC.
> > + *
> > + * @rotation: Rotation to analyze. It correspond the field @frame_info.rotation.
> 
> A bit unusual to see arguments after the description.

Fixed in v6.
 
> > + */
> > +static enum pixel_read_direction direction_for_rotation(unsigned int rotation)
> > +{
> > +	if (rotation & DRM_MODE_ROTATE_0) {
> > +		if (rotation & DRM_MODE_REFLECT_X)
> > +			return READ_RIGHT_TO_LEFT;
> > +		else
> > +			return READ_LEFT_TO_RIGHT;
> > +	} else if (rotation & DRM_MODE_ROTATE_90) {
> > +		if (rotation & DRM_MODE_REFLECT_Y)
> > +			return READ_BOTTOM_TO_TOP;
> > +		else
> > +			return READ_TOP_TO_BOTTOM;
> > +	} else if (rotation & DRM_MODE_ROTATE_180) {
> > +		if (rotation & DRM_MODE_REFLECT_X)
> > +			return READ_LEFT_TO_RIGHT;
> > +		else
> > +			return READ_RIGHT_TO_LEFT;
> > +	} else if (rotation & DRM_MODE_ROTATE_270) {
> > +		if (rotation & DRM_MODE_REFLECT_Y)
> > +			return READ_TOP_TO_BOTTOM;
> > +		else
> > +			return READ_BOTTOM_TO_TOP;
> > +	}
> > +	return READ_LEFT_TO_RIGHT;
> > +}
> > +
> >   /**
> >    * blend - blend the pixels from all planes and compute crc
> >    * @wb: The writeback frame buffer metadata
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> > index 3ead8b39af4a..985e7a92b7bc 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.h
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> > @@ -69,6 +69,17 @@ struct vkms_writeback_job {
> >   	pixel_write_t pixel_write;
> >   };
> >   
> > +/**
> > + * enum pixel_read_direction - Enum used internaly by VKMS to represent a reading direction in a
> > + * plane.
> > + */
> > +enum pixel_read_direction {
> > +	READ_BOTTOM_TO_TOP,
> > +	READ_TOP_TO_BOTTOM,
> > +	READ_RIGHT_TO_LEFT,
> > +	READ_LEFT_TO_RIGHT
> > +};
> > +
> >   /**
> >    * typedef pixel_read_t - These functions are used to read a pixel in the source frame,
> >    * convert it to `struct pixel_argb_u16` and write it to @out_pixel.
> > diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> > index 649d75d05b1f..743b6fd06db5 100644
> > --- a/drivers/gpu/drm/vkms/vkms_formats.c
> > +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> > @@ -75,6 +75,36 @@ static void packed_pixels_addr(const struct vkms_frame_info *frame_info,
> >   	*addr = (u8 *)frame_info->map[0].vaddr + offset;
> >   }
> >   
> > +/**
> > + * get_step_next_block() - Common helper to compute the correct step value between each pixel block
> > + * to read in a certain direction.
> > + *
> > + * As the returned offset is the number of bytes between two consecutive blocks in a direction,
> > + * the caller may have to read multiple pixel before using the next one (for example, to read from
> > + * left to right in a DRM_FORMAT_R1 plane, each block contains 8 pixels, so the step must be used
> > + * only every 8 pixels.
> > + *
> > + * @fb: Framebuffer to iter on
> > + * @direction: Direction of the reading
> > + * @plane_index: Plane to get the step from
> 
> Same.

Fixed in v6.

Thanks,
Louis Chauvet
 
> Best Regards,
> - Maíra
> 
> > + */
> > +static int get_step_next_block(struct drm_framebuffer *fb, enum pixel_read_direction direction,
> > +			       int plane_index)
> > +{
> > +	switch (direction) {
> > +	case READ_LEFT_TO_RIGHT:
> > +		return fb->format->char_per_block[plane_index];
> > +	case READ_RIGHT_TO_LEFT:
> > +		return -fb->format->char_per_block[plane_index];
> > +	case READ_TOP_TO_BOTTOM:
> > +		return (int)fb->pitches[plane_index];
> > +	case READ_BOTTOM_TO_TOP:
> > +		return -(int)fb->pitches[plane_index];
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >   static void *get_packed_src_addr(const struct vkms_frame_info *frame_info, int y,
> >   				 int plane_index)
> >   {
> > 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
