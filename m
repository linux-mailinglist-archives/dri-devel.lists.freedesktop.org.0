Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E221AEDAFD
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 13:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3656610E412;
	Mon, 30 Jun 2025 11:30:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="V5JaRGrU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF3010E412
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 11:30:35 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 55B53928;
 Mon, 30 Jun 2025 13:30:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1751283012;
 bh=f8UGTCDHYUrbrwvxFMRydIPYre+TP2vUFa3uY2UjE3o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V5JaRGrUmgKsFenh53PLVTcWCNAKl1NB2vLxyVYinBaWGgSEFN5FULnUIocHmCZns
 lftjSc7ySRFu9V3xuE1aXarNkSVN7TcxHvbbJYR+1z6dvjXH+yrMiP53f12vzyQ1Vb
 CHekjsxnYiGfyj/MT8h2yYae02fw3lVyVRo6ufuY=
Date: Mon, 30 Jun 2025 14:30:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Michal Simek <michal.simek@amd.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
Message-ID: <20250630113008.GD20333@pendragon.ideasonboard.com>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.fb98a918-329e-4536-a0a5-a99b22ba0120@emailsignatures365.codetwo.com>
 <20250627145058.6880-1-mike.looijmans@topic.nl>
 <20250627181911.GF24912@pendragon.ideasonboard.com>
 <42af6260-c8af-42e1-a9bb-adfaaabf0190@topic.nl>
 <20250630-psychedelic-tested-smilodon-adcbb3@houat>
 <20250630091156.GE24861@pendragon.ideasonboard.com>
 <20250630-phenomenal-taipan-of-imagination-59b300@houat>
 <20250630093335.GC20333@pendragon.ideasonboard.com>
 <20250630-delicate-stirring-sawfly-dd81be@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250630-delicate-stirring-sawfly-dd81be@houat>
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

On Mon, Jun 30, 2025 at 12:52:48PM +0200, Maxime Ripard wrote:
> On Mon, Jun 30, 2025 at 12:33:35PM +0300, Laurent Pinchart wrote:
> > On Mon, Jun 30, 2025 at 11:29:08AM +0200, Maxime Ripard wrote:
> > > On Mon, Jun 30, 2025 at 12:11:56PM +0300, Laurent Pinchart wrote:
> > > > On Mon, Jun 30, 2025 at 10:27:55AM +0200, Maxime Ripard wrote:
> > > > > On Mon, Jun 30, 2025 at 10:03:16AM +0200, Mike Looijmans wrote:
> > > > > > On 27-06-2025 20:19, Laurent Pinchart wrote:
> > > > > > > On Fri, Jun 27, 2025 at 04:50:46PM +0200, Mike Looijmans wrote:
> > > > > > > > XRGB8888 is the default mode that Xorg will want to use. Add support
> > > > > > > > for this to the Zynqmp DisplayPort driver, so that applications can use
> > > > > > > > 32-bit framebuffers. This solves that the X server would fail to start
> > > > > > > > unless one provided an xorg.conf that sets DefaultDepth to 16.
> > > > > > > > 
> > > > > > > > Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> > > > > > > > ---
> > > > > > > > 
> > > > > > > >   drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
> > > > > > > >   1 file changed, 5 insertions(+)
> > > > > > > > 
> > > > > > > > diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > > > > > > > index 80d1e499a18d..501428437000 100644
> > > > > > > > --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > > > > > > > +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > > > > > > > @@ -312,6 +312,11 @@ static const struct zynqmp_disp_format avbuf_gfx_fmts[] = {
> > > > > > > >   		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
> > > > > > > >   		.swap		= true,
> > > > > > > >   		.sf		= scaling_factors_888,
> > > > > > > > +	}, {
> > > > > > > > +		.drm_fmt	= DRM_FORMAT_XRGB8888,
> > > > > > > > +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
> > > > > > > > +		.swap		= true,
> > > > > > > > +		.sf		= scaling_factors_888,
> > > > > > > 
> > > > > > > I'm afraid that's not enough. There's a crucial difference between
> > > > > > > DRM_FORMAT_ARGB8888 (already supported by this driver) and
> > > > > > > DRM_FORMAT_XRGB8888: for the latter, the 'X' component must be ignored.
> > > > > > > The graphics layer is blended on top of the video layer, and the blender
> > > > > > > uses both a global alpha parameter and the alpha channel of the graphics
> > > > > > > layer for 32-bit RGB formats. This will lead to incorrect operation when
> > > > > > > the 'X' component is not set to full opacity.
> > > > > > 
> > > > > > I spent a few hours digging in the source code and what I could find in the
> > > > > > TRM and register maps, but there's not enough information in there to
> > > > > > explain how the blender works. The obvious "XRGB" implementation would be to
> > > > > > just disable the blender.
> > > > > > 
> > > > > > What I got from experimenting so far is that the alpha component is ignored
> > > > > > anyway while the video path isn't active. So as long as one isn't using the
> > > > > > video blending path, the ARGB and XRGB modes are identical.
> > > > > > 
> > > > > > Guess I'll need assistance from AMD/Xilinx to completely implement the XRGB
> > > > > > modes.
> > > > > > 
> > > > > > (For our application, this patch is sufficient as it solves the issues like
> > > > > > X11 not starting up, OpenGL not working and horrendously slow scaling
> > > > > > performance)
> > > > > 
> > > > > Given that we consider XRGB8888 mandatory,
> > > > 
> > > > How about platforms that can't support it at all ?
> > > 
> > > We emulate it.
> > 
> > Does that imply a full memcpy of the frame buffer in the kernel driver,
> > or is it emulated in userspace ?
> 
> Neither :)
> 
> The kernel deals with it through drm_fb_xrgb8888_to_* helpers, but only
> on the parts of the framebuffer that were modified through the damage
> API.

Aahhh OK, it's for the fbdev emulation. So that means that drivers are
not required to support XRGB8888 ?


-- 
Regards,

Laurent Pinchart
