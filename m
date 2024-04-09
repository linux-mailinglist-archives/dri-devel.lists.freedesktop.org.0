Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8C889D63F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 12:06:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB479112C4B;
	Tue,  9 Apr 2024 10:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="bSzAwssn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F48F112C4C
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 10:06:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E98340008;
 Tue,  9 Apr 2024 10:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1712657169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5H49i2PxxNai/K6ycWDJvpcrRnWv61IRnD8Osqq+4FI=;
 b=bSzAwssnXzyBF0E55bS86BWdB2MXEYOQmSSqGGOb3+L47AOCqwL5Z9zVadFKvYjyogzGO7
 jHdkFFzkTHqul7QHQylswkcJgUbr6d+Jcm5jeAIqBIDFPRIsYIHmv4DdfXZfLVoG6lOXVE
 XJKgbM2PUumap28qFWcgoS05jmY+xtJe6WtkAxuCYNzPJx3GSgDiit+Fi7ixyAWHLso51g
 G2X0eA8Cs9WM4NRJxfoT777PcsyXhImL+Qjui3G+ozxqYzNlw7BJOdtJ5NgURYzvXMhS+S
 +X5avQTwMyf8W5cpQ2c5xDh/p0Ai5bOXON1R1k3uMhWFol/kFGuQiMMn77m3hg==
Date: Tue, 9 Apr 2024 12:06:06 +0200
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
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v5 11/16] drm/vkms: Add YUV support
Message-ID: <ZhUTDiN8dX_K4S-b@localhost.localdomain>
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
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
References: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
 <20240313-yuv-v5-11-e610cbd03f52@bootlin.com>
 <20240327162307.4b9b6e45.pekka.paalanen@collabora.com>
 <ZhOhuzllWYooTPa6@louis-chauvet-laptop>
 <20240409105857.67bc4ce4.pekka.paalanen@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240409105857.67bc4ce4.pekka.paalanen@collabora.com>
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

Le 09/04/24 - 10:58, Pekka Paalanen a écrit :
> On Mon, 8 Apr 2024 09:50:19 +0200
> Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> 
> > Le 27/03/24 - 16:23, Pekka Paalanen a écrit :
> > > On Wed, 13 Mar 2024 18:45:05 +0100
> > > Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> > >   
> > > > From: Arthur Grillo <arthurgrillo@riseup.net>
> > > > 
> > > > Add support to the YUV formats bellow:
> > > > 
> > > > - NV12/NV16/NV24
> > > > - NV21/NV61/NV42
> > > > - YUV420/YUV422/YUV444
> > > > - YVU420/YVU422/YVU444
> > > > 
> > > > The conversion from yuv to rgb is done with fixed-point arithmetic, using
> > > > 32.32 floats and the drm_fixed helpers.  
> > > 
> > > You mean fixed-point, not floating-point (floats).
> > >   
> > > > 
> > > > To do the conversion, a specific matrix must be used for each color range
> > > > (DRM_COLOR_*_RANGE) and encoding (DRM_COLOR_*). This matrix is stored in
> > > > the `conversion_matrix` struct, along with the specific y_offset needed.
> > > > This matrix is queried only once, in `vkms_plane_atomic_update` and
> > > > stored in a `vkms_plane_state`. Those conversion matrices of each
> > > > encoding and range were obtained by rounding the values of the original
> > > > conversion matrices multiplied by 2^32. This is done to avoid the use of
> > > > floating point operations.
> > > > 
> > > > The same reading function is used for YUV and YVU formats. As the only
> > > > difference between those two category of formats is the order of field, a
> > > > simple swap in conversion matrix columns allows using the same function.  
> > > 
> > > Sounds good!
> > >   
> > > > Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> > > > [Louis Chauvet:
> > > > - Adapted Arthur's work
> > > > - Implemented the read_line_t callbacks for yuv
> > > > - add struct conversion_matrix
> > > > - remove struct pixel_yuv_u8
> > > > - update the commit message
> > > > - Merge the modifications from Arthur]
> > > > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > ---
> > > >  drivers/gpu/drm/vkms/vkms_drv.h     |  22 ++
> > > >  drivers/gpu/drm/vkms/vkms_formats.c | 431 ++++++++++++++++++++++++++++++++++++
> > > >  drivers/gpu/drm/vkms/vkms_formats.h |   4 +
> > > >  drivers/gpu/drm/vkms/vkms_plane.c   |  17 +-
> > > >  4 files changed, 473 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> > > > index 23e1d247468d..f3116084de5a 100644
> > > > --- a/drivers/gpu/drm/vkms/vkms_drv.h
> > > > +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> 
> ...
> 
> > > > +static struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 cb, u8 cr,
> > > > +						  struct conversion_matrix *matrix)  
> > > 
> > > If you are using the "swap the matrix columns" trick, then you cannot
> > > call these cb, cr nor even u,v, because they might be the opposite.
> > > They are simply the first and second chroma channel, and their meaning
> > > depends on the given matrix.  
> > 
> > I will rename them for v6, channel_1 and channel_2.
> > 
> > > > +{
> > > > +	u8 r, g, b;
> > > > +	s64 fp_y, fp_cb, fp_cr;
> > > > +	s64 fp_r, fp_g, fp_b;
> > > > +
> > > > +	fp_y = y - matrix->y_offset;
> > > > +	fp_cb = cb - 128;
> > > > +	fp_cr = cr - 128;  
> > > 
> > > This looks like an incorrect way to convert u8 to fixed-point, but...
> > >  
> > > > +
> > > > +	fp_y = drm_int2fixp(fp_y);
> > > > +	fp_cb = drm_int2fixp(fp_cb);
> > > > +	fp_cr = drm_int2fixp(fp_cr);  
> > > 
> > > I find it confusing to re-purpose variables like this.
> > > 
> > > I'd do just
> > > 
> > > 	fp_c1 = drm_int2fixp((int)c1 - 128);  
> > 
> > I agree with this remark, I will change it for the v6.
> > 
> > > If the function arguments were int to begin with, then the cast would
> > > be obviously unnecessary.  
> > 
> > For this I'm less sure. The name of the function and the usage is 
> > explicit: we want to use u8 as input. As we manipulate pointers in 
> > read_line, I don't know how it will works if the pointer is dereferenced 
> > to a int instead of a u8.
> 
> Dereference operator acts on its input type. What happens to the result
> is irrelevant.
> 
> If we have
> 
> u8 *p = ...;
> 
> void foo(int x);
> 
> then you can call
> 
> foo(*v);
> 
> if that was your question. Dereference acts on u8* which results in u8.
> Then it gets implicitly cast to int.

Thanks for the clear explaination!
 
> However, you have a semantic reason to keep the argument as u8, and
> that is fine.

So I will keep u8 for the v6.

> > > So, what you have in fp variables at this point is fractional numbers
> > > in the 8-bit integer scale. However, because the target format is
> > > 16-bit, you should not show the extra precision away here. Instead,
> > > multiply by 257 to bring the values to 16-bit scale, and do the RGB
> > > clamping to 16-bit, not 8-bit.
> > >   
> > > > +
> > > > +	fp_r = drm_fixp_mul(matrix->matrix[0][0], fp_y) +
> > > > +	       drm_fixp_mul(matrix->matrix[0][1], fp_cb) +
> > > > +	       drm_fixp_mul(matrix->matrix[0][2], fp_cr);
> > > > +	fp_g = drm_fixp_mul(matrix->matrix[1][0], fp_y) +
> > > > +	       drm_fixp_mul(matrix->matrix[1][1], fp_cb) +
> > > > +	       drm_fixp_mul(matrix->matrix[1][2], fp_cr);
> > > > +	fp_b = drm_fixp_mul(matrix->matrix[2][0], fp_y) +
> > > > +	       drm_fixp_mul(matrix->matrix[2][1], fp_cb) +
> > > > +	       drm_fixp_mul(matrix->matrix[2][2], fp_cr);
> > > > +
> > > > +	fp_r = drm_fixp2int_round(fp_r);
> > > > +	fp_g = drm_fixp2int_round(fp_g);
> > > > +	fp_b = drm_fixp2int_round(fp_b);
> > > > +
> > > > +	r = clamp(fp_r, 0, 0xff);
> > > > +	g = clamp(fp_g, 0, 0xff);
> > > > +	b = clamp(fp_b, 0, 0xff);
> > > > +
> > > > +	return argb_u16_from_u8888(255, r, g, b);  
> > > 
> > > Going through argb_u16_from_u8888() will throw away precision.  
> > 
> > I tried to fix it in the v6, IGT tests pass. If something is wrong in the 
> > v6, please let me know.
> > 
> > > > +}
> > > > +
> > > >  /*
> > > >   * The following functions are read_line function for each pixel format supported by VKMS.
> > > >   *
> > > > @@ -293,6 +367,79 @@ static void RGB565_read_line(const struct vkms_plane_state *plane, int x_start,
> > > >  	}
> > > >  }
> > > >  
> > > > +/*
> > > > + * This callback can be used for yuv and yvu formats, given a properly modified conversion matrix
> > > > + * (column inversion)  
> > > 
> > > Would be nice to explain what semi_planar_yuv means, so that the
> > > documentation for these functions would show how they differ rather
> > > than all saying exactly the same thing.  
> > 
> >  /* This callback can be used for YUV format where each color component is 
> >   * stored in a different plane (often called planar formats). It will 
> >   * handle correctly subsampling.
> > 
> >  /*
> >   * This callback can be used for YUV formats where U and V values are 
> >   * stored in the same plane (often called semi-planar formats). It will 
> >   * corectly handle subsampling.
> >   * 
> >   * The conversion matrix stored in the @plane is used to:
> >   * - Apply the correct color range and encoding
> >   * - Convert YUV and YVU with the same function (a simple column swap is 
> >   *   needed)
> >   */
> 
> Sounds good. I'd just drop the "It will handle correctly subsampling."
> because all code is supposed to be correct by default.

Will do for the v6.

Thanks,
Louis Chauvet
 
> If there is a function that intentionally overlooks something, that
> certainly should be documented.
> 
> 
> Thanks,
> pq



-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
