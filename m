Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FF554DE58
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 11:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5BED113D1B;
	Thu, 16 Jun 2022 09:44:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4A740113D1A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 09:44:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2B8112FC
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 02:44:17 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7FFD73F7F5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 02:44:17 -0700 (PDT)
Date: Thu, 16 Jun 2022 10:44:10 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2] drm/arm/hdlcd: Take over EFI framebuffer properly
Message-ID: <Yqr7aorDndZAfy/j@e110455-lin.cambridge.arm.com>
References: <31acd57f4aa8a4d02877026fa3a8c8d035e15a0d.1655309004.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <31acd57f4aa8a4d02877026fa3a8c8d035e15a0d.1655309004.git.robin.murphy@arm.com>
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, javierm@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 15, 2022 at 05:09:15PM +0100, Robin Murphy wrote:
> The Arm Juno board EDK2 port has provided an EFI GOP display via HDLCD0
> for some time now, which works nicely as an early framebuffer. However,
> once the HDLCD driver probes and takes over the hardware, it should
> take over the logical framebuffer as well, otherwise the now-defunct GOP
> device hangs about and virtual console output inevitably disappears into
> the wrong place most of the time.
> 
> We'll do this after binding the HDMI encoder, since that's the most
> likely thing to fail, and the EFI console is still better than nothing
> when that happens. However, the two HDLCD controllers on Juno are
> independent, and many users will still be using older firmware without
> any display support, so we'll only bother if we find that the HDLCD
> we're probing is already enabled. And if it is, then we'll also stop it,
> since otherwise the display can end up shifted if it's still scanning
> out while the rest of the registers are subsequently reconfigured.

Agree on trying to figure out if the controller is enabled before taking over the
framebuffer, but we're also making the big asssumption (currently true) that EKD2
will only initialise one controller. If that is ever false, we should be looking into
HDLCD_REG_FB_BASE to figure out the start of the firmware framebuffer and request
that via drm_aperture_remove_conflicting_framebuffers(). Not a big deal at the moment
and I think the patch can be merged as is.

What I'm interested to know more is this

> since otherwise the display can end up shifted if it's still scanning
> out while the rest of the registers are subsequently reconfigured.

Now I know that probe time is not atomic and it can have some weird behaviour, but I
was not expecting pixels to shift. Maybe it is because of clock reprogramming?

> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Will merge this into drm-misc-next if/when there are no more comments.

Best regards,
Liviu

> ---
> 
> Since I ended up adding (relatively) a lot here, I didn't want to
> second-guess Javier's opinion so left off the R-b tag from v1.
> 
>  drivers/gpu/drm/arm/hdlcd_drv.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
> index e89ae0ec60eb..1f1171f2f16a 100644
> --- a/drivers/gpu/drm/arm/hdlcd_drv.c
> +++ b/drivers/gpu/drm/arm/hdlcd_drv.c
> @@ -21,6 +21,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  
> +#include <drm/drm_aperture.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_debugfs.h>
> @@ -314,6 +315,12 @@ static int hdlcd_drm_bind(struct device *dev)
>  		goto err_vblank;
>  	}
>  
> +	/* If EFI left us running, take over from efifb/sysfb */
> +	if (hdlcd_read(hdlcd, HDLCD_REG_COMMAND)) {
> +		hdlcd_write(hdlcd, HDLCD_REG_COMMAND, 0);
> +		drm_aperture_remove_framebuffers(false, &hdlcd_driver);
> +	}
> +
>  	drm_mode_config_reset(drm);
>  	drm_kms_helper_poll_init(drm);
>  
> -- 
> 2.36.1.dirty
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
