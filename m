Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAD3438244
	for <lists+dri-devel@lfdr.de>; Sat, 23 Oct 2021 09:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8CF36E08A;
	Sat, 23 Oct 2021 07:45:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 344FD6E08A
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Oct 2021 07:45:01 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 27a44a98-33d5-11ec-ac3c-0050568cd888;
 Sat, 23 Oct 2021 07:45:12 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 8E0A8194B12;
 Sat, 23 Oct 2021 09:44:55 +0200 (CEST)
Date: Sat, 23 Oct 2021 09:44:54 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, noralf@tronnes.org,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, javierm@redhat.com, kernel@amanoeldawod.com,
 dirty.ice.hu@gmail.com, michael+lkml@stapelberg.ch, aros@gmx.com,
 joshua@stroblindustries.com, arnd@arndb.de,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux-foundation.org
Subject: Re: [PATCH 0/9] drm/simpledrm: Enable damage clips and virtual screens
Message-ID: <YXO9dlQkdJFbUbvb@ravnborg.org>
References: <20211022132829.7697-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211022132829.7697-1-tzimmermann@suse.de>
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

Hi Thomas,

On Fri, Oct 22, 2021 at 03:28:20PM +0200, Thomas Zimmermann wrote:
> Enable FB_DAMAGE_CLIPS with simpledrm for improved performance and/or
> less overhead. With this in place, add support for virtual screens
> (i.e., framebuffers that are larger than the display resolution). This
> also enables fbdev panning and page flipping.
> 
> After the discussion and bug fixing wrt to fbdev overallocation, I
> decided to add full support for this to simpledrm. Patches #1 to #5
> change the format-helper functions accordingly. Destination buffers
> are now clipped by the caller and all functions support a similar
> feature set. This has some fallout in various drivers.
> 
> Patch #6 change fbdev emulation to support overallocation with
> shadow buffers, even if the hardware buffer would be too small.
This change is very welcome - I hope it will solve the problem
Alistair experience - see:
https://lore.kernel.org/all/CAKmqyKPCP45O5_gjCFwUs8jU4NrDnjAeLs7OYAE4j-LEUw+Hzg@mail.gmail.com/

	Sam

> 
> Patch #7 and #8 update simpledrm to enable damage clipping and virtual
> screen sizes. Both feature go hand in hand, sort of. For shadow-
> buffered planes, the DRM framebuffer lives in system memory. So the
> maximum size of the virtual screen is somewhat arbitrary. We add two
> constants for resonable maximum width and height of 4096 each.
> 
> Patch #9 adds documentation and a TODO item.
> 
> Tested with simpledrm. I also ran the recently posted fbdev panning
> tests to make sure that the fbdev overallocation works correctly. [1]
> 
> [1] https://lists.freedesktop.org/archives/igt-dev/2021-October/036642.html
> 
> Thomas Zimmermann (9):
>   drm/format-helper: Export drm_fb_clip_offset()
>   drm/format-helper: Rework format-helper memcpy functions
>   drm/format-helper: Add destination-buffer pitch to drm_fb_swab()
>   drm/format-helper: Rework format-helper conversion functions
>   drm/format-helper: Streamline blit-helper interface
>   drm/fb-helper: Allocate shadow buffer of surface height
>   drm/simpledrm: Enable FB_DAMAGE_CLIPS property
>   drm/simpledrm: Support virtual screen sizes
>   drm: Clarify semantics of struct
>     drm_mode_config.{min,max}_{width,height}
> 
>  Documentation/gpu/todo.rst                  |  15 ++
>  drivers/gpu/drm/drm_fb_helper.c             |   2 +-
>  drivers/gpu/drm/drm_format_helper.c         | 236 ++++++++++----------
>  drivers/gpu/drm/drm_mipi_dbi.c              |   6 +-
>  drivers/gpu/drm/gud/gud_pipe.c              |  14 +-
>  drivers/gpu/drm/hyperv/hyperv_drm_modeset.c |   5 +-
>  drivers/gpu/drm/mgag200/mgag200_mode.c      |   4 +-
>  drivers/gpu/drm/tiny/cirrus.c               |  24 +-
>  drivers/gpu/drm/tiny/repaper.c              |   2 +-
>  drivers/gpu/drm/tiny/simpledrm.c            |  41 +++-
>  drivers/gpu/drm/tiny/st7586.c               |   2 +-
>  include/drm/drm_format_helper.h             |  58 ++---
>  include/drm/drm_gem_atomic_helper.h         |  18 ++
>  include/drm/drm_mode_config.h               |  13 ++
>  14 files changed, 254 insertions(+), 186 deletions(-)
> 
> --
> 2.33.0
