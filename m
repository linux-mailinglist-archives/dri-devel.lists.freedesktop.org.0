Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A27368BA43D
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 01:54:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61BE510F8E0;
	Thu,  2 May 2024 23:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FRGEwMZI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C9110F8E0
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 23:54:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA10A593;
 Fri,  3 May 2024 01:53:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1714693998;
 bh=HRe5ljL+DRh/cLziQZQnHnErjG7fAwPUbblbiOOjz10=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FRGEwMZIp8bwwSkOb//OCCGNgD5GveHlaLhmZHRxlSeVgXLcl01HKvAYosVSpyqz6
 B4WgmiShlNWFu5HeZp2Nv1TarfhZxMImvJj359KKEqlbAXzpCvCmkz8C5jUBRq+NgO
 1ybdm7fICZczzjlTOPiVgL0Mn7IqJl9LEOjmZwgE=
Date: Fri, 3 May 2024 02:54:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Naushir Patuck <naush@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH] drm/fourcc: Add RGB161616 and BGR161616 formats
Message-ID: <20240502235409.GH4959@pendragon.ideasonboard.com>
References: <20240226132544.82817-1-jacopo.mondi@ideasonboard.com>
 <ecuukxmwolxr77p5mpktjhd5bkjpaf27rnprhey4y7bst4vntv@o3uzkb67molt>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ecuukxmwolxr77p5mpktjhd5bkjpaf27rnprhey4y7bst4vntv@o3uzkb67molt>
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

Hi Jacopo,

On Thu, May 02, 2024 at 11:02:27AM +0200, Jacopo Mondi wrote:
> Hello
>    which tree should this patch be collected from now that it has
> been reviewed ?

I think this can go through drm-misc. I'm not sure what the rule is for
patches that touch core code like these, can then be pushed by anyone
with commit access, or do they need to be collected by a drm-misc
maintainer ?

> On Mon, Feb 26, 2024 at 02:25:43PM GMT, Jacopo Mondi wrote:
> > Add FourCC definitions for the 48-bit RGB/BGR formats to the
> > DRM/KMS uapi.
> >
> > The format will be used by the Raspberry Pi PiSP Back End,
> > supported by a V4L2 driver in kernel space and by libcamera in
> > userspace, which uses the DRM FourCC identifiers.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  drivers/gpu/drm/drm_fourcc.c  | 8 ++++++++
> >  include/uapi/drm/drm_fourcc.h | 4 ++++
> >  2 files changed, 12 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> > index 193cf8ed7912..908f20b96fd5 100644
> > --- a/drivers/gpu/drm/drm_fourcc.c
> > +++ b/drivers/gpu/drm/drm_fourcc.c
> > @@ -210,6 +210,14 @@ const struct drm_format_info *__drm_format_info(u32 format)
> >  		{ .format = DRM_FORMAT_ABGR2101010,	.depth = 30, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
> >  		{ .format = DRM_FORMAT_RGBA1010102,	.depth = 30, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
> >  		{ .format = DRM_FORMAT_BGRA1010102,	.depth = 30, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
> > +		{ .format = DRM_FORMAT_RGB161616,	.depth = 0,
> > +		  .num_planes = 1, .char_per_block = { 6, 0, 0 },
> > +		  .block_w = { 1, 0, 0 }, .block_h = { 1, 0, 0 },
> > +		  .hsub = 1, .vsub = 1, .has_alpha = false },
> > +		{ .format = DRM_FORMAT_BGR161616,	.depth = 0,
> > +		  .num_planes = 1, .char_per_block = { 6, 0, 0 },
> > +		  .block_w = { 1, 0, 0 }, .block_h = { 1, 0, 0 },
> > +		  .hsub = 1, .vsub = 1, .has_alpha = false },
> >  		{ .format = DRM_FORMAT_ARGB8888,	.depth = 32, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
> >  		{ .format = DRM_FORMAT_ABGR8888,	.depth = 32, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
> >  		{ .format = DRM_FORMAT_RGBA8888,	.depth = 32, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
> > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> > index 84d502e42961..00db00083175 100644
> > --- a/include/uapi/drm/drm_fourcc.h
> > +++ b/include/uapi/drm/drm_fourcc.h
> > @@ -210,6 +210,10 @@ extern "C" {
> >  #define DRM_FORMAT_RGBA1010102	fourcc_code('R', 'A', '3', '0') /* [31:0] R:G:B:A 10:10:10:2 little endian */
> >  #define DRM_FORMAT_BGRA1010102	fourcc_code('B', 'A', '3', '0') /* [31:0] B:G:R:A 10:10:10:2 little endian */
> >
> > +/* 48 bpp RGB */
> > +#define DRM_FORMAT_RGB161616 fourcc_code('R', 'G', '4', '8') /* [47:0] R:G:B 16:16:16 little endian */
> > +#define DRM_FORMAT_BGR161616 fourcc_code('B', 'G', '4', '8') /* [47:0] B:G:R 16:16:16 little endian */
> > +
> >  /* 64 bpp RGB */
> >  #define DRM_FORMAT_XRGB16161616	fourcc_code('X', 'R', '4', '8') /* [63:0] x:R:G:B 16:16:16:16 little endian */
> >  #define DRM_FORMAT_XBGR16161616	fourcc_code('X', 'B', '4', '8') /* [63:0] x:B:G:R 16:16:16:16 little endian */

-- 
Regards,

Laurent Pinchart
