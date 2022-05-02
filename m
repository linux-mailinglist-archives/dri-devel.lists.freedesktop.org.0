Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D84CE5176A1
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 20:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 716A610F2A3;
	Mon,  2 May 2022 18:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADAE110F325
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 18:36:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 169A5484;
 Mon,  2 May 2022 20:36:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1651516610;
 bh=yaoaNhOAhbbsbhLLMHBGWoGvporF5ND1Yq8X+9irqbw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uY4m9h5inCrZ1g09AnkLj5YrOdPggXhfWf6LuWwcQk8AGinR5Uhfe1vHnUYY+i2QJ
 ftm1w2Dugb49XtnuH9+62iewsyI/iXtGXZ0wRhKnq6Zm9lQxeUq99el/FEdH2rvuUZ
 4hX/7H0ZU9x2SoQFz2VJNwjQxp0r7vwwcMAhgMIY=
Date: Mon, 2 May 2022 21:36:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 1/3] drm: Remove superfluous arg when calling to
 drm_fbdev_generic_setup()
Message-ID: <YnAkwRL7b++a0omG@pendragon.ideasonboard.com>
References: <20220502153900.408522-1-javierm@redhat.com>
 <20220502153900.408522-2-javierm@redhat.com>
 <YnABjdpGC166yIY7@pendragon.ideasonboard.com>
 <5dd80287-1b09-d02c-9f67-5a0bb0a4566c@redhat.com>
 <bc6b6598-0e09-1a43-4086-e4164ab42a20@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bc6b6598-0e09-1a43-4086-e4164ab42a20@redhat.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 02, 2022 at 07:15:16PM +0200, Javier Martinez Canillas wrote:
> On 5/2/22 18:55, Javier Martinez Canillas wrote:
> 
> [snip]
> 
> >> drop the depth option to drm_fbdev_generic_setup() ? There's a FIXME
> >> comment in drm_fbdev_generic_setup() that could be related.
> > 
> > A FIXME makes sense, I'll add that to when posting a v3.
> 
> There's actually a FIXME already in drm_fbdev_generic_setup(), so it's
> a documented issue [0]:

That's what I meant by "there's a FIXME" :-) It doesn't have to be
addressed by this series, but it would be good to fix it.

> void drm_fbdev_generic_setup(struct drm_device *dev,
> 			     unsigned int preferred_bpp)
> {
> ...
> 	/*
> 	 * FIXME: This mixes up depth with bpp, which results in a glorious
> 	 * mess, resulting in some drivers picking wrong fbdev defaults and
> 	 * others wrong preferred_depth defaults.
> 	 */
> 	if (!preferred_bpp)
> 		preferred_bpp = dev->mode_config.preferred_depth;
> 	if (!preferred_bpp)
> 		preferred_bpp = 32;
> 	fb_helper->preferred_bpp = preferred_bpp;
> ...
> }
> 
> [0]: https://elixir.bootlin.com/linux/v5.18-rc5/source/drivers/gpu/drm/drm_fb_helper.c#L2553

-- 
Regards,

Laurent Pinchart
