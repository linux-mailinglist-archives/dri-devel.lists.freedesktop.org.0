Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B40378C3BCA
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 09:15:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5D410E406;
	Mon, 13 May 2024 07:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="i6Gwne/A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A9110E406
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 07:15:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D80F01C0009;
 Mon, 13 May 2024 07:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715584518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q5dn2MPOf1PSIm7z/V3iIjqsAJYU1Za0Jzr7Ny6Sqvw=;
 b=i6Gwne/A1aBtYIRnJIWVd1KlrxIch66paJ+HQmP5P2aG7NhH6IZTi3sIQSvpgq/kqVPNdQ
 reThlQag28kLbi1mjSrCrEGPsMUBH0FrklljBp5Pvgxc13KHYKua56IZaHkzYn0ykbM8sI
 lVKDo+Uf4crCjcbISZRc+DQJDrNixwCdD81waH8DX9Xpla0moKFzyDaCHx1O27cJ7Hr995
 u3dmdKkWDFykQoAXryEjSN9E/19jAAOXWEdlm93mARKsWqGsOB5lDvcIcdXxU/rgtb8BJZ
 MHLwkqd+KqvNdEmEZd1uNPsBdJjvbXLsXOrPaV3oRhxWxXzmx2v1pQAcKwg1HQ==
Date: Mon, 13 May 2024 09:15:14 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org,
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com,
 marcheu@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v6 09/17] drm/vkms: Introduce pixel_read_direction enum
Message-ID: <ZkG-AjScoFvMSA1O@localhost.localdomain>
Mail-Followup-To: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org,
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com,
 marcheu@google.com, nicolejadeyee@google.com
References: <20240409-yuv-v6-0-de1c5728fd70@bootlin.com>
 <20240409-yuv-v6-9-de1c5728fd70@bootlin.com>
 <20240422143918.098d3d09.pekka.paalanen@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240422143918.098d3d09.pekka.paalanen@collabora.com>
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

> > +/**
> > + * direction_for_rotation() - Get the correct reading direction for a given rotation
> > + *
> > + * @rotation: Rotation to analyze. It correspond the field @frame_info.rotation.
> > + *
> > + * This function will use the @rotation setting of a source plane to compute the reading
> > + * direction in this plane which correspond to a "left to right writing" in the CRTC.
> > + * For example, if the buffer is reflected on X axis, the pixel must be read from right to left
> > + * to be written from left to right on the CRTC.
> > + */
> > +static enum pixel_read_direction direction_for_rotation(unsigned int rotation)
> > +{
> > +	struct drm_rect tmp_a, tmp_b;
> > +	int x, y;
> > +
> > +	/*
> > +	 * The direction is computed by rotating the vector AB (top-left to top-right) in a
> > +	 * 1x1 square.
> 
> Points A and B are depicted as zero-size rectangles on the CRTC.
> The CRTC writing direction is from A to B. The plane reading direction
> is discovered by inverse-transforming A and B.
> 
> (If you want, you can add that to the comment.)

It is better, thanks!
 
> > +	 */
> > +
> > +	tmp_a = DRM_RECT_INIT(0, 0, 0, 0);
> > +	tmp_b = DRM_RECT_INIT(1, 0, 0, 0);
> > +	drm_rect_rotate_inv(&tmp_a, 1, 1, rotation);
> > +	drm_rect_rotate_inv(&tmp_b, 1, 1, rotation);
> > +
> > +	x = tmp_b.x1 - tmp_a.x1;
> > +	y = tmp_b.y1 - tmp_a.y1;
> > +
> > +	if (x == 1)
> > +		return READ_LEFT_TO_RIGHT;
> > +	else if (x == -1)
> > +		return READ_RIGHT_TO_LEFT;
> > +	else if (y == 1)
> > +		return READ_TOP_TO_BOTTOM;
> > +	else if (y == -1)
> > +		return READ_BOTTOM_TO_TOP;
> 
> I find this code practically obvious. Excellent!
> 
> If you want to be more strict, each condition could also require the
> other component to be zero.

I will add it.

[...]

> > + */
> > +static int get_block_step_byte(struct drm_framebuffer *fb, enum pixel_read_direction direction,
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
> 
> I'm not sure if this is correct for formats with block_h > 1.
> 
> If a pitch is the theoretical count of bytes per line, then this should
> return block_h * pitch. But I'm not exactly sure what is correct here.

I think it is related to my answer to patch 07/17. If pitch is what you 
describe, yes, the step should be block_h * DIV_ROUND_UP(fb_width / 
block_w) (or something similar).

If I take X0L2 with a buffer of 9x5 pixels, the step between two blocks 
verticaly must be 40 bytes. Your formula and interpretation of pitch will 
give only 36 bytes (a row only need 18 bytes). So a new "pitch" is needed.

> Aside from this problem, looks good.
> 
> 
> Thanks,
> pq
> 
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  /**
> >   * packed_pixels_addr_1x1() - Get the pointer to the block containing the pixel at the given
> >   * coordinates
> > 
> 



-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
