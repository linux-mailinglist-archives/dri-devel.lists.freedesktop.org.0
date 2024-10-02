Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2148D98CF55
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 10:57:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 847AA10E6D2;
	Wed,  2 Oct 2024 08:57:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="fymJGdAi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D591610E6D8
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 08:57:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 87469240002;
 Wed,  2 Oct 2024 08:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1727859465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=38iADGjAlQ+R0YlTGLDUaomdoi9nXjm7ob6OZct28gE=;
 b=fymJGdAiSXGnPND7ldeS8HDljOKYrQ5BSbA5J8Q57lRICPwVT0uel8ByC2SX5UA+eb7EWA
 oDGFPZYXTZH1WwHgYLBUFMRceMDUcbK3S7mXglBpko2jC2AXiCgDMo8M55xb3M91rNkQR0
 e2uwgGRleJaMTyQY9IsAykS0chymyJsVGhMMkg23FcxkAdIj9RH6HALQigjFLwxLSphra+
 OyXCiZaIrqgwMiwEzMT3YkoiufMYuqwIY8+AZpEfzgmLAxthFLS7CQQ8KGw+y9lLiFo4fT
 GblWfyqFUrtLwnGvGHSToTpHcQ069l3O84hgLOddzu7EzbcDf7YZ8WhRj17AWw==
Date: Wed, 2 Oct 2024 10:57:42 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, Maaara Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Simona Vetter <simona@ffwll.ch>, arthurgrillo@riseup.net,
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, thomas.petazzoni@bootlin.com,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v11 06/15] drm/vkms: Avoid computing blending limits
 inside pre_mul_alpha_blend
Message-ID: <Zv0LBo8OtRHJM029@louis-chauvet-laptop>
Mail-Followup-To: Randy Dunlap <rdunlap@infradead.org>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maaara Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Simona Vetter <simona@ffwll.ch>, arthurgrillo@riseup.net,
 pekka.paalanen@haloniitty.fi,
 Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, thomas.petazzoni@bootlin.com,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 Pekka Paalanen <pekka.paalanen@collabora.com>
References: <20240930-yuv-v11-0-4b1a26bcfc96@bootlin.com>
 <20240930-yuv-v11-6-4b1a26bcfc96@bootlin.com>
 <30573f5a-d3dd-4aa4-ac5a-cf6df77b79dc@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30573f5a-d3dd-4aa4-ac5a-cf6df77b79dc@infradead.org>
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

On 01/10/24 - 20:54, Randy Dunlap wrote:
> Hi--
> 
> On 9/30/24 8:31 AM, Louis Chauvet wrote:
> > The pre_mul_alpha_blend is dedicated to blending, so to avoid mixing
> > different concepts (coordinate calculation and color management), extract
> > the x_limit and x_dst computation outside of this helper.
> > It also increases the maintainability by grouping the computation related
> > to coordinates in the same place: the loop in `blend`.
> > 
> > Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >  drivers/gpu/drm/vkms/vkms_composer.c | 40 +++++++++++++++++-------------------
> >  1 file changed, 19 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> > index 931e214b225c..4d220bbb023c 100644
> > --- a/drivers/gpu/drm/vkms/vkms_composer.c
> > +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> > @@ -24,34 +24,30 @@ static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
> >  
> >  /**
> >   * pre_mul_alpha_blend - alpha blending equation
> > - * @frame_info: Source framebuffer's metadata
> >   * @stage_buffer: The line with the pixels from src_plane
> >   * @output_buffer: A line buffer that receives all the blends output
> > + * @x_start: The start offset
> > + * @pixel_count: The number of pixels to blend
> 
> so is this actually pixel count + 1; or
> 
> >   *
> > - * Using the information from the `frame_info`, this blends only the
> > - * necessary pixels from the `stage_buffer` to the `output_buffer`
> > - * using premultiplied blend formula.
> > + * The pixels 0..@pixel_count in stage_buffer are blended at @x_start..@x_start+@pixel_count in
> 
> should these ranges include a "- 1"?
> Else please explain.

Hi Randy,

For the next version, I will use standard mathematical notation to clarify 
the "inclusiveness" of the interval: [0;pixel_count[

Thanks,
Louis Chauvet
 
> > + * output_buffer.
> 
