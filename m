Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 350789962D5
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 10:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9AC010E688;
	Wed,  9 Oct 2024 08:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="JeIq8cBV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492D010E688
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 08:33:23 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-6cb82317809so49672676d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 01:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1728462802; x=1729067602;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fnxUKUa13w6tl42fc3nnF2dJEBWkq6juB+0sXuyGbc0=;
 b=JeIq8cBVxGl94YZWr+erURjH77QcfDfu8LERx50JRdbtNv4f3z1hMDKczfNVuheNOT
 ubamyLo9uA3o2KFbMPbHzsZ1VLLg7/aVJnEQr3WzaMfd2Ppo9Ged60V0OBKID3zBfEbk
 3xfEhge6c/j8gpBHsfgMoUi7xvg2MOb7ZaS+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728462802; x=1729067602;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fnxUKUa13w6tl42fc3nnF2dJEBWkq6juB+0sXuyGbc0=;
 b=u1mXn9+s0VkNCwPNFv7xV28N/y3KbjMSNJt7Wicls9qXj26lFUFYAv4Jjve/boz+12
 UNWDUMtCL5Z+COnp6fsCH8Yt1ovhJuI6uXyHRClJgqkdc+EnhCbj+B9sH6ftJuwubQKL
 f9WzbP73HDlWoa9XoE+q2qO99s5tvDN2zgnm6J0OqB8j/FrnZr71Z7w+z6LiRLbGKa7L
 E+/C7mxF7/8J4KjRiKxWfQTjZmwLD5y0H8/p+WRNt4j5cR37KcQGxykCFjC/EdLHglxS
 x4DGTXp0sqoGoaW98aqrxEV0ASKgXYJ/V+4K/HiKK+6I7rTMczVgbT3WE9wwPOga3++0
 kY1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwgLo9lJcijzMF6LVIsVWqOFqegWgOzv2f9nH7jQuvzwtAUI9EjurwJ1j/ftu943Npl5l8k62b0yQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyc1/qtT2434fZCZBvJ59DjKNEsoMs6jelwQwSZz80Ke7dsP5UM
 BJXW++6R2uvmQjkniBnzgeMq+KxrEzIoZendxf3AJmwaFSqgA5VfFQF3LfuSIw==
X-Google-Smtp-Source: AGHT+IGrtcW5X9UCaKvtPP8MDxfWOnVzjW0YyKKeEVN2RHVfP/cLidzTH7KTA/WBR2DMJagUDfTRQQ==
X-Received: by 2002:a05:6214:3b86:b0:6cb:8339:3443 with SMTP id
 6a1803df08f44-6cbc942fdd0mr28167736d6.7.1728462802142; 
 Wed, 09 Oct 2024 01:33:22 -0700 (PDT)
Received: from google.com (172.174.245.35.bc.googleusercontent.com.
 [35.245.174.172]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6cba46cde41sm44169356d6.14.2024.10.09.01.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 01:33:21 -0700 (PDT)
Date: Wed, 9 Oct 2024 08:33:20 +0000
From: Paz Zcharya <pazz@chromium.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Maaara Canal <mairacanal@riseup.net>,
 Melissa Wen <melissa.srw@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/vkms: Add support for ABGR8888 pixel format
Message-ID: <ZwY_0H-NWm_cHI0K@google.com>
References: <20241007142814.4037157-1-pazz@google.com>
 <ZwQRhKHZuK4AgWuy@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZwQRhKHZuK4AgWuy@fedora>
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

On Mon, Oct 07, 2024 at 06:51:16PM +0200, Louis Chauvet wrote:
> On 07/10/24 - 14:27, Paz Zcharya wrote:
> > Add support for pixel format ABGR8888, which is the default format
> > on Android devices. This will allow us to use VKMS as the default
> > display driver in Android Emulator (Cuttlefish) and increase VKMS
> > adoption.
> 
> Hi Paz,
> 
> Thank you for your contribution!
> 
> I am very happy to see new users for VKMS, and I will be glad to add new 
> formats to VKMS!
> 
> However, as you can see [1], there is a significant rework of the VKMS 
> formats and composition that should be merged soon.
> 
Thank you for highlighting this. Great work!

> This series introduces two key improvements: performance enhancements and 
> YUV support. These changes involve substantial modifications to the 
> vkms_format.c file, which may conflict with your work.
> 
> Additionally, I wrote a few patches [2] and [3] a few months ago to 
> practice with VKMS, and they did not receive any comments, so I believe I 
> will be able to merge them quickly after [1].
> 
> In [2], I added many new formats: ABGR, BGRA, RGBA, XBGR, RGBX, BGRX, 
> BGR565, P010, P012, P016. 
> Would you mind testing this version to see if it meets your needs?
> 
Yep, this is perfect!

> In [3], I did similar work for writeback, but it is not as complete, so I 
> need to add a patch, almost identical to your code:
> 
> 	static void argb_u16_to_ABGR8888(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
> 		[...]
> 
> Added:	WRITE_LINE(XBGR8888_write_line, argb_u16_to_XBGR8888)
> 
> I need to send a v2 of [3] anyway because of conflicts, do you mind if I 
> take your argb_u16_to_ABGR8888 to integrate it (with your signed-off-by 
> obviously)?
> 
Yeah, that would be very helpful. Thank you so much!

> In any case, if you have time to test, or even better review [1], [2] or 
> [3], it could be amazing!
> 
Patches look great. I tested them locally after adding ABGR8888
support, and things seem to be working.

Let me know if I can assist you with anything else.

Thanks,
Paz Zcharya
> Thank you,
> Louis Chauvet
> 
> [1]:https://lore.kernel.org/all/20241007-yuv-v12-0-01c1ada6fec8@bootlin.com/
> [2]:https://lore.kernel.org/all/20241007-b4-new-color-formats-v2-0-d47da50d4674@bootlin.com/
> [3]:https://lore.kernel.org/all/20240814-writeback_line_by_line-v2-0-36541c717569@bootlin.com/
> 
> > Signed-off-by: Paz Zcharya <pazz@chromium.org>
> > ---
> > 
> >  drivers/gpu/drm/vkms/vkms_formats.c   | 20 ++++++++++++++++++++
> >  drivers/gpu/drm/vkms/vkms_plane.c     |  1 +
> >  drivers/gpu/drm/vkms/vkms_writeback.c |  1 +
> >  3 files changed, 22 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> > index 040b7f113a3b..9e9d7290388e 100644
> > --- a/drivers/gpu/drm/vkms/vkms_formats.c
> > +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> > @@ -73,6 +73,14 @@ static void XRGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixe
> >  	out_pixel->b = (u16)src_pixels[0] * 257;
> >  }
> >  
> > +static void ABGR8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
> > +{
> > +	out_pixel->a = (u16)src_pixels[3] * 257;
> > +	out_pixel->b = (u16)src_pixels[2] * 257;
> > +	out_pixel->g = (u16)src_pixels[1] * 257;
> > +	out_pixel->r = (u16)src_pixels[0] * 257;
> > +}
> > +
> >  static void ARGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
> >  {
> >  	__le16 *pixels = (__force __le16 *)src_pixels;
> > @@ -176,6 +184,14 @@ static void argb_u16_to_XRGB8888(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel
> >  	dst_pixels[0] = DIV_ROUND_CLOSEST(in_pixel->b, 257);
> >  }
> >  
> > +static void argb_u16_to_ABGR8888(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
> > +{
> > +	dst_pixels[3] = DIV_ROUND_CLOSEST(in_pixel->a, 257);
> > +	dst_pixels[2] = DIV_ROUND_CLOSEST(in_pixel->b, 257);
> > +	dst_pixels[1] = DIV_ROUND_CLOSEST(in_pixel->g, 257);
> > +	dst_pixels[0] = DIV_ROUND_CLOSEST(in_pixel->r, 257);
> > +}
> > +
> >  static void argb_u16_to_ARGB16161616(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
> >  {
> >  	__le16 *pixels = (__force __le16 *)dst_pixels;
> > @@ -234,6 +250,8 @@ void *get_pixel_conversion_function(u32 format)
> >  		return &ARGB8888_to_argb_u16;
> >  	case DRM_FORMAT_XRGB8888:
> >  		return &XRGB8888_to_argb_u16;
> > +	case DRM_FORMAT_ABGR8888:
> > +		return &ABGR8888_to_argb_u16;
> >  	case DRM_FORMAT_ARGB16161616:
> >  		return &ARGB16161616_to_argb_u16;
> >  	case DRM_FORMAT_XRGB16161616:
> > @@ -252,6 +270,8 @@ void *get_pixel_write_function(u32 format)
> >  		return &argb_u16_to_ARGB8888;
> >  	case DRM_FORMAT_XRGB8888:
> >  		return &argb_u16_to_XRGB8888;
> > +	case DRM_FORMAT_ABGR8888:
> > +		return &argb_u16_to_ABGR8888;
> >  	case DRM_FORMAT_ARGB16161616:
> >  		return &argb_u16_to_ARGB16161616;
> >  	case DRM_FORMAT_XRGB16161616:
> > diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> > index e5c625ab8e3e..8efd585fc34c 100644
> > --- a/drivers/gpu/drm/vkms/vkms_plane.c
> > +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> > @@ -15,6 +15,7 @@
> >  static const u32 vkms_formats[] = {
> >  	DRM_FORMAT_ARGB8888,
> >  	DRM_FORMAT_XRGB8888,
> > +	DRM_FORMAT_ABGR8888,
> >  	DRM_FORMAT_XRGB16161616,
> >  	DRM_FORMAT_ARGB16161616,
> >  	DRM_FORMAT_RGB565
> > diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> > index bc724cbd5e3a..04cb9c58e7ad 100644
> > --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> > +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> > @@ -17,6 +17,7 @@
> >  static const u32 vkms_wb_formats[] = {
> >  	DRM_FORMAT_ARGB8888,
> >  	DRM_FORMAT_XRGB8888,
> > +	DRM_FORMAT_ABGR8888,
> >  	DRM_FORMAT_XRGB16161616,
> >  	DRM_FORMAT_ARGB16161616,
> >  	DRM_FORMAT_RGB565
> > -- 
> > 2.47.0.rc0.187.ge670bccf7e-goog
> > 
