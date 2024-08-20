Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CDC958008
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 09:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5375F10E312;
	Tue, 20 Aug 2024 07:40:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ots0jAAc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 887A410E03B;
 Tue, 20 Aug 2024 07:40:43 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 024A8581;
 Tue, 20 Aug 2024 09:39:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1724139580;
 bh=cOc2yH+YwdyzwKqe3rJLyWdCVz7IIv7AvofOUKV4dhg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ots0jAAcEcKonBtEfxOiI3MUGZHGyFZr02OzUoUlDfcATFcNQTV6Y8UbMm2hsmG5i
 gsiK4BHonxnxJqqfG7B+pmum8RY2rcxQ+k4o/vk2LFcs5pLQuX4xDASeJs5kY/dJyy
 EVSZAojrcNqXGlBs07m4eSVuYQO7PnLnx7l7JHWE=
Date: Tue, 20 Aug 2024 10:40:14 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH 04/86] drm: Add client-agnostic setup helper
Message-ID: <20240820074014.GA24895@pendragon.ideasonboard.com>
References: <20240816125408.310253-1-tzimmermann@suse.de>
 <20240816125408.310253-5-tzimmermann@suse.de>
 <20240818200735.GB729@pendragon.ideasonboard.com>
 <b82cb17f-4da7-4e7c-ad92-3c7c9abb45ee@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b82cb17f-4da7-4e7c-ad92-3c7c9abb45ee@suse.de>
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

On Tue, Aug 20, 2024 at 09:22:36AM +0200, Thomas Zimmermann wrote:
> Am 18.08.24 um 22:07 schrieb Laurent Pinchart:
> > On Fri, Aug 16, 2024 at 02:22:30PM +0200, Thomas Zimmermann wrote:
> >> DRM may support multiple in-kernel clients that run as soon as a DRM
> >> driver has been registered. To select the client(s) in a single place,
> >> introduce drm_client_setup().
> >>
> >> Drivers that call the new helper automatically instantiate the kernel's
> >> configured default clients. Only fbdev emulation is currently supported.
> >> Later versions can add support for DRM-based logging, a boot logo or even
> >> a console.
> > I really like the direction this is taking :-)
> >
> >> Some drivers handle the color mode for clients internally. Provide the
> >> helper drm_client_setup_with_color_mode() for them.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> ---
> >>   drivers/gpu/drm/Makefile           |  1 +
> >>   drivers/gpu/drm/drm_client_setup.c | 55 ++++++++++++++++++++++++++++++
> >>   include/drm/drm_client_setup.h     | 12 +++++++
> >>   3 files changed, 68 insertions(+)
> >>   create mode 100644 drivers/gpu/drm/drm_client_setup.c
> >>   create mode 100644 include/drm/drm_client_setup.h
> >>
> >> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> >> index 0beb55d028a8..e7fc77d1d573 100644
> >> --- a/drivers/gpu/drm/Makefile
> >> +++ b/drivers/gpu/drm/Makefile
> >> @@ -129,6 +129,7 @@ drm_kms_helper-y := \
> >>   	drm_atomic_helper.o \
> >>   	drm_atomic_state_helper.o \
> >>   	drm_bridge_connector.o \
> >> +	drm_client_setup.o \
> >>   	drm_crtc_helper.o \
> >>   	drm_damage_helper.o \
> >>   	drm_encoder_slave.o \
> >> diff --git a/drivers/gpu/drm/drm_client_setup.c b/drivers/gpu/drm/drm_client_setup.c
> >> new file mode 100644
> >> index 000000000000..2e3315f5c3e2
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/drm_client_setup.c
> >> @@ -0,0 +1,55 @@
> >> +// SPDX-License-Identifier: MIT
> >> +
> >> +#include <drm/drm_client_setup.h>
> >> +#include <drm/drm_device.h>
> >> +#include <drm/drm_fbdev_client.h>
> >> +#include <drm/drm_fourcc.h>
> >> +#include <drm/drm_print.h>
> >> +
> >> +/**
> >> + * drm_client_setup() - Setup in-kernel DRM clients
> >> + * @dev: DRM device
> >> + * @format: Preferred color format for the device. Use NULL, unless
> >>
> > s/color format/pixel format/
> 
> Ah, ok.
> 
> >> + *          there is clearly a driver-preferred format.
> >> + *
> >> + * This function sets up the in-kernel DRM clients. Restore, hotplug
> >> + * events and teardown are all taken care of.
> >> + *
> >> + * Drivers should call drm_client_setup() after registering the new
> >> + * DRM device with drm_dev_register(). This function is safe to call
> >> + * even when there are no connectors present. Setup will be retried
> >> + * on the next hotplug event.
> >> + *
> >> + * The clients are destroyed by drm_dev_unregister().
> >> + */
> >> +void drm_client_setup(struct drm_device *dev, const struct drm_format_info *format)
> >> +{
> >> +	int ret;
> >> +
> >> +	if (!format)
> >> +		format = drm_format_info(DRM_FORMAT_XRGB8888);
> >> +
> >> +	ret = drm_fbdev_client_setup(dev, format);
> >> +	if (ret)
> >> +		drm_warn(dev, "Failed to set up DRM client; error %d\n", ret);
> >> +}
> >> +EXPORT_SYMBOL(drm_client_setup);
> >> +
> >> +/**
> >> + * drm_client_setup_with_color_mode() - Setup in-kernel DRM clients for color mode
> >> + * @dev: DRM device
> >> + * @color_mode: Preferred color mode for the device
> >> + *
> >> + * This function sets up the in-kernel DRM clients. It is equivalent
> >> + * to drm_client_setup(), but expects a color mode as second argument.
> >> + *
> >> + * Do not use this function in new drivers. Prefer drm_client_setup() with a
> >> + * format of NULL.
> >> + */
> >> +void drm_client_setup_with_color_mode(struct drm_device *dev, unsigned int color_mode)
> >> +{
> >> +	uint32_t fmt = drm_driver_color_mode_format(dev, color_mode);
> >> +
> >> +	drm_client_setup(dev, drm_format_info(fmt));
> >> +}
> >> +EXPORT_SYMBOL(drm_client_setup_with_color_mode);
> >> diff --git a/include/drm/drm_client_setup.h b/include/drm/drm_client_setup.h
> >> new file mode 100644
> >> index 000000000000..f5fd1fabd4b1
> >> --- /dev/null
> >> +++ b/include/drm/drm_client_setup.h
> >> @@ -0,0 +1,12 @@
> >> +/* SPDX-License-Identifier: MIT */
> >> +
> >> +#ifndef DRM_CLIENT_SETUP_H
> >> +#define DRM_CLIENT_SETUP_H
> >> +
> >> +struct drm_device;
> >> +struct drm_format_info;
> >> +
> >> +void drm_client_setup(struct drm_device *dev, const struct drm_format_info *format);
> >> +void drm_client_setup_with_color_mode(struct drm_device *dev, unsigned int color_mode);
> > This is not common in DRM, so we may not want to introduce it here, but
> > _Generic() gives a nice function overloading syntax:
> >
> > void drm_client_setup_with_format(struct drm_device *dev, const struct drm_format_info *format);
> > void drm_client_setup_with_color_mode(struct drm_device *dev, unsigned int color_mode);
> >
> > #define drm_client_setup_(dev, format_or_color_mode)							 \
> > 	_Generic(format_or_color_mode,									 \
> > 		const struct drm_format_info *: drm_client_setup_with_format(dev, format_or_color_mode), \
> > 		unsigned int: drm_client_setup_with_color_mode(dev, format_or_color_mode)		 \
> > 	)
> >
> > Up to you.
> 
> The color format is really a user interface. I'd rather like to remove 
> it from the implementation where possible.

Do you mean the color mode ? If so I agree.

> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >
> >> +
> >> +#endif

-- 
Regards,

Laurent Pinchart
