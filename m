Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6128A88C835
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 16:57:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3915D10F0B5;
	Tue, 26 Mar 2024 15:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Na7DpHe8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14C0610F0B0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 15:57:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B96CEFF805;
 Tue, 26 Mar 2024 15:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1711468618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uacAxC3Jpg/BrJJgXbpM5Yci6lTOxQ0Dr22mHZFlRdY=;
 b=Na7DpHe8cqlhPTECr6dKUuDSzEiY8kMdqJF69uj3KGpBxa/N0EpgYqMlP/vOPaVPqu+C8N
 FyzQ/3eHN8tIXQGDZBRHlJVkLZAjXK66sCKX7XP0FsJEtOjY0v4mZfccZ9Lr/BJO6r+T/r
 vlvDRMj6ce5BkW2pppfuin6ig30Ioik0wdV6aYj5BCKZ26lEmKpo+WwjIQY4I5Dp1X4TXC
 QvWXLeB+YYCtSgYgJEJ/qzoCfFK/ezl0VMtS3RrWH/EQA6qehu5mpAxuSfm4hYWrFmzr4S
 QEM1wyXVviuIUcythGyRkSZlspdZnP3gVnQ9lLTR0Igcc27iFwRB1O+4KC+WFA==
Date: Tue, 26 Mar 2024 16:56:55 +0100
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
Subject: Re: [PATCH v5 02/16] drm/vkms: Use drm_frame directly
Message-ID: <ZgLwR7oc8eoPisgi@localhost.localdomain>
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
 <20240313-yuv-v5-2-e610cbd03f52@bootlin.com>
 <3f577a73-3daa-44e4-ab3c-ead1df422cfd@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f577a73-3daa-44e4-ab3c-ead1df422cfd@igalia.com>
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

Le 25/03/24 - 10:20, Maíra Canal a écrit :
> On 3/13/24 14:44, Louis Chauvet wrote:
> > From: Arthur Grillo <arthurgrillo@riseup.net>
> > 
> > Remove intermidiary variables and access the variables directly from
> > drm_frame. These changes should be noop.
> > 
> > Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >   drivers/gpu/drm/vkms/vkms_drv.h       |  3 ---
> >   drivers/gpu/drm/vkms/vkms_formats.c   | 12 +++++++-----
> >   drivers/gpu/drm/vkms/vkms_plane.c     |  3 ---
> >   drivers/gpu/drm/vkms/vkms_writeback.c |  5 -----
> >   4 files changed, 7 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> > index 8f5710debb1e..b4b357447292 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.h
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> > @@ -31,9 +31,6 @@ struct vkms_frame_info {
> >   	struct drm_rect rotated;
> >   	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
> >   	unsigned int rotation;
> > -	unsigned int offset;
> > -	unsigned int pitch;
> > -	unsigned int cpp;
> >   };
> >   
> >   struct pixel_argb_u16 {
> > diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> > index 36046b12f296..172830a3936a 100644
> > --- a/drivers/gpu/drm/vkms/vkms_formats.c
> > +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> > @@ -11,8 +11,10 @@
> >   
> >   static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int y)
> >   {
> > -	return frame_info->offset + (y * frame_info->pitch)
> > -				  + (x * frame_info->cpp);
> > +	struct drm_framebuffer *fb = frame_info->fb;
> > +
> > +	return fb->offsets[0] + (y * fb->pitches[0])
> > +			      + (x * fb->format->cpp[0]);
> 
> Nitpicking: Could this be packed into a single line?

Applied on the v6.

Thanks,
Louis Chauvet
 
> Anyway,
> 
> Reviewed-by: Maíra Canal <mcanal@igalia.com>
> 
> Best Regards,
> - Maíra
> 
> >   }
> >   
> >   /*
> > @@ -131,12 +133,12 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
> >   	u8 *src_pixels = get_packed_src_addr(frame_info, y);
> >   	int limit = min_t(size_t, drm_rect_width(&frame_info->dst), stage_buffer->n_pixels);
> >   
> > -	for (size_t x = 0; x < limit; x++, src_pixels += frame_info->cpp) {
> > +	for (size_t x = 0; x < limit; x++, src_pixels += frame_info->fb->format->cpp[0]) {
> >   		int x_pos = get_x_position(frame_info, limit, x);
> >   
> >   		if (drm_rotation_90_or_270(frame_info->rotation))
> >   			src_pixels = get_packed_src_addr(frame_info, x + frame_info->rotated.y1)
> > -				+ frame_info->cpp * y;
> > +				+ frame_info->fb->format->cpp[0] * y;
> >   
> >   		plane->pixel_read(src_pixels, &out_pixels[x_pos]);
> >   	}
> > @@ -223,7 +225,7 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
> >   	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
> >   	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst), src_buffer->n_pixels);
> >   
> > -	for (size_t x = 0; x < x_limit; x++, dst_pixels += frame_info->cpp)
> > +	for (size_t x = 0; x < x_limit; x++, dst_pixels += frame_info->fb->format->cpp[0])
> >   		wb->pixel_write(dst_pixels, &in_pixels[x]);
> >   }
> >   
> > diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> > index 5a8d295e65f2..21b5adfb44aa 100644
> > --- a/drivers/gpu/drm/vkms/vkms_plane.c
> > +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> > @@ -125,9 +125,6 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
> >   	drm_rect_rotate(&frame_info->rotated, drm_rect_width(&frame_info->rotated),
> >   			drm_rect_height(&frame_info->rotated), frame_info->rotation);
> >   
> > -	frame_info->offset = fb->offsets[0];
> > -	frame_info->pitch = fb->pitches[0];
> > -	frame_info->cpp = fb->format->cpp[0];
> >   	vkms_plane_state->pixel_read = get_pixel_conversion_function(fmt);
> >   }
> >   
> > diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> > index bc724cbd5e3a..c8582df1f739 100644
> > --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> > +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> > @@ -149,11 +149,6 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
> >   	crtc_state->active_writeback = active_wb;
> >   	crtc_state->wb_pending = true;
> >   	spin_unlock_irq(&output->composer_lock);
> > -
> > -	wb_frame_info->offset = fb->offsets[0];
> > -	wb_frame_info->pitch = fb->pitches[0];
> > -	wb_frame_info->cpp = fb->format->cpp[0];
> > -
> >   	drm_writeback_queue_job(wb_conn, connector_state);
> >   	active_wb->pixel_write = get_pixel_write_function(wb_format);
> >   	drm_rect_init(&wb_frame_info->src, 0, 0, crtc_width, crtc_height);
> > 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
