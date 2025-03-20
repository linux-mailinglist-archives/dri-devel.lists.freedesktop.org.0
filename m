Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3C3A6A677
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 13:50:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1DC10E0D2;
	Thu, 20 Mar 2025 12:50:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mM4gHu5l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1FB110E0D2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 12:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742475051; x=1774011051;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=bI03A8s/0Y8i1F+wyyse99wDeRdrkB5O3FwM/O8uPCY=;
 b=mM4gHu5lvkK7jNmYvTWvrkzjMUG9VIgrSaqVAJ3eORscn3OscQwfC8xw
 PvdGDnjSiSobi5izybriPamUh0N+sO86iCOaczFNoE6QcHfmLrorEjw+H
 HMn99N7H/XAWHZGE9F0c9yHmNVB3VJXx6r1F9ixi1X1lbD1V1E46zo5ai
 BJRp5zFI/kC6GjB/nmgOLiqxB6S80KUjjmvAOajHCFnIMmmDojUDP30xD
 bNKqiRlFE+jKd4hXg8cqJktOon8yiWSt39MX3tXVjpnUWfWyu4SagTmyQ
 JKb+wVzwRH1dOVQQvEPZEWlS8a8vYeWfwla1E7MKA+6EzrJMS8X+/N66S A==;
X-CSE-ConnectionGUID: xNYQz3KLQdKPzlkHifAsPw==
X-CSE-MsgGUID: xyyBTKPVTpe5Ovu7FEppSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43871822"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="43871822"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 05:50:51 -0700
X-CSE-ConnectionGUID: fBH+Tvw7QY20jk+THLYBog==
X-CSE-MsgGUID: eJZM4JVySkqDGDI0ateXSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="153973338"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 05:50:49 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 simona@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 12/18] drm/sysfb: ofdrm: Add EDID support
In-Reply-To: <20250319083021.6472-13-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250319083021.6472-1-tzimmermann@suse.de>
 <20250319083021.6472-13-tzimmermann@suse.de>
Date: Thu, 20 Mar 2025 14:50:46 +0200
Message-ID: <87a59fdfx5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 19 Mar 2025, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Add EDID support to sysfb connector helpers. Read the EDID property
> from the OF node in ofdrm. Without EDID, this does nothing.
>
> Some systems with OF display, such as 32-bit PPC Macintoshs, provide
> the system display's EDID data as node property in their DT. Exporting
> this information allows compositors to implement correct DPI and
> meaningful color management.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/sysfb/drm_sysfb_helper.c | 29 ++++++++++++++++++++++++
>  drivers/gpu/drm/sysfb/drm_sysfb_helper.h |  2 ++
>  drivers/gpu/drm/sysfb/ofdrm.c            | 20 ++++++++++++++++
>  3 files changed, 51 insertions(+)
>
> diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.c b/drivers/gpu/drm/sysfb/drm_sysfb_helper.c
> index b48e06b25305..cb65c618f8d3 100644
> --- a/drivers/gpu/drm/sysfb/drm_sysfb_helper.c
> +++ b/drivers/gpu/drm/sysfb/drm_sysfb_helper.c
> @@ -9,6 +9,7 @@
>  #include <drm/drm_atomic_state_helper.h>
>  #include <drm/drm_damage_helper.h>
>  #include <drm/drm_drv.h>
> +#include <drm/drm_edid.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_gem_atomic_helper.h>
> @@ -281,10 +282,38 @@ EXPORT_SYMBOL(drm_sysfb_crtc_atomic_destroy_state);
>   * Connector
>   */
>  
> +static int drm_sysfb_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
> +{
> +	const u8 *edid = data;
> +	size_t off = block * EDID_LENGTH;
> +	size_t end = off + len;
> +
> +	if (!edid)
> +		return -1;
> +	if (end > EDID_LENGTH)
> +		return -1;

Nitpick, I guess -1 is used elsewhere, but I think I'd prefer actual
error codes even if they're not currently propagated. It's just cleaner.

> +	memcpy(buf, &edid[off], len);
> +
> +	return 0;
> +}
> +
>  int drm_sysfb_connector_helper_get_modes(struct drm_connector *connector)
>  {
>  	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(connector->dev);
> +	const struct drm_edid *drm_edid;
> +
> +	if (sysfb->edid) {
> +		drm_edid = drm_edid_read_custom(connector, drm_sysfb_get_edid_block,
> +						(void *)sysfb->edid);

Nitpick, the (void *) cast is superfluous.

> +		if (drm_edid) {
> +			drm_edid_connector_update(connector, drm_edid);
> +			drm_edid_free(drm_edid);
> +		} else {
> +			drm_edid_connector_update(connector, NULL);
> +		}

Nitpick, the above could just be

		drm_edid_connector_update(connector, drm_edid);
		drm_edid_free(drm_edid);

without the if.


Despite the nitpicks, overall LGTM.

BR,
Jani.


> +	}
>  
> +	/* Return the fixed mode even with EDID */
>  	return drm_connector_helper_get_modes_fixed(connector, &sysfb->fb_mode);
>  }
>  EXPORT_SYMBOL(drm_sysfb_connector_helper_get_modes);
> diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
> index 45e396bf74b7..3684bd0ef085 100644
> --- a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
> +++ b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
> @@ -24,6 +24,8 @@ struct drm_display_mode drm_sysfb_mode(unsigned int width,
>  struct drm_sysfb_device {
>  	struct drm_device dev;
>  
> +	const u8 *edid; /* can be NULL */
> +
>  	/* hardware settings */
>  	struct drm_display_mode fb_mode;
>  	const struct drm_format_info *fb_format;
> diff --git a/drivers/gpu/drm/sysfb/ofdrm.c b/drivers/gpu/drm/sysfb/ofdrm.c
> index 71e661ba9329..86c1a0c80ceb 100644
> --- a/drivers/gpu/drm/sysfb/ofdrm.c
> +++ b/drivers/gpu/drm/sysfb/ofdrm.c
> @@ -12,6 +12,7 @@
>  #include <drm/drm_damage_helper.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_drv.h>
> +#include <drm/drm_edid.h>
>  #include <drm/drm_fbdev_shmem.h>
>  #include <drm/drm_format_helper.h>
>  #include <drm/drm_framebuffer.h>
> @@ -227,6 +228,16 @@ static u64 display_get_address_of(struct drm_device *dev, struct device_node *of
>  	return address;
>  }
>  
> +static const u8 *display_get_edid_of(struct drm_device *dev, struct device_node *of_node,
> +				     u8 buf[EDID_LENGTH])
> +{
> +	int ret = of_property_read_u8_array(of_node, "EDID", buf, EDID_LENGTH);
> +
> +	if (ret)
> +		return NULL;
> +	return buf;
> +}
> +
>  static bool is_avivo(u32 vendor, u32 device)
>  {
>  	/* This will match most R5xx */
> @@ -298,6 +309,8 @@ struct ofdrm_device {
>  	/* colormap */
>  	void __iomem *cmap_base;
>  
> +	u8 edid[EDID_LENGTH];
> +
>  	/* modesetting */
>  	u32 formats[DRM_SYSFB_PLANE_NFORMATS(1)];
>  	struct drm_plane primary_plane;
> @@ -840,6 +853,7 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
>  	int width, height, depth, linebytes;
>  	const struct drm_format_info *format;
>  	u64 address;
> +	const u8 *edid;
>  	resource_size_t fb_size, fb_base, fb_pgbase, fb_pgsize;
>  	struct resource *res, *mem;
>  	void __iomem *screen_base;
> @@ -989,6 +1003,9 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
>  		}
>  	}
>  
> +	/* EDID is optional */
> +	edid = display_get_edid_of(dev, of_node, odev->edid);
> +
>  	/*
>  	 * Firmware framebuffer
>  	 */
> @@ -999,6 +1016,7 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
>  	sysfb->fb_pitch = linebytes;
>  	if (odev->cmap_base)
>  		sysfb->fb_gamma_lut_size = OFDRM_GAMMA_LUT_SIZE;
> +	sysfb->edid = edid;
>  
>  	drm_dbg(dev, "display mode={" DRM_MODE_FMT "}\n", DRM_MODE_ARG(&sysfb->fb_mode));
>  	drm_dbg(dev, "framebuffer format=%p4cc, size=%dx%d, linebytes=%d byte\n",
> @@ -1072,6 +1090,8 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
>  	drm_connector_set_panel_orientation_with_quirk(connector,
>  						       DRM_MODE_PANEL_ORIENTATION_UNKNOWN,
>  						       width, height);
> +	if (edid)
> +		drm_connector_attach_edid_property(connector);
>  
>  	ret = drm_connector_attach_encoder(connector, encoder);
>  	if (ret)

-- 
Jani Nikula, Intel
