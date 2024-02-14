Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BC48556EE
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 00:13:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752B810E37B;
	Wed, 14 Feb 2024 23:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hCw1MKmv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B977E10E0F8;
 Wed, 14 Feb 2024 23:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707952410; x=1739488410;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Z1/yl5RJ77QqCCp71GxnprkzPjJyVEnw3bnTqBlUQMY=;
 b=hCw1MKmvNqiDO7/1L/9VPDy6alVhEDrY7mK+AXV5JxG95XwyGYLqL7OH
 l+z2TcQ8uPpgkrVAfwJhJCRt4zsYf6GdUm4qIncp7dGbl8gY6+99hz6mH
 SvoSkIYlr3LXkPQgWdt9lHaRKq0TEEGnKrGnZ1Ju65oIDtQmclNgCq8Ug
 iCYzktPoSYuEkLKXIdpTEqDgcT48Bn5nLHdZHAQXszir1t9XakAUkJK12
 voQQ6jjM2iIOtBU7tNlMkfv4yMmyxdC/i6Zgu84ZcqegOPbbqOuUNjBMR
 eL4bBtrpJfTHCnlfc/0xFG6WubCVSnuy0oZNaCZC/iRrE15q1oEd8mYfw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="13422005"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; d="scan'208";a="13422005"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 15:13:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="826369893"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; d="scan'208";a="826369893"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 14 Feb 2024 15:13:23 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 15 Feb 2024 01:13:22 +0200
Date: Thu, 15 Feb 2024 01:13:22 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 linux-fbdev@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Melissa Wen <mwen@igalia.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH v6 3/5] drm: Add support to get EDID from ACPI
Message-ID: <Zc1JEg5mC0ww_BeU@intel.com>
References: <20240214215756.6530-1-mario.limonciello@amd.com>
 <20240214215756.6530-4-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240214215756.6530-4-mario.limonciello@amd.com>
X-Patchwork-Hint: comment
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

On Wed, Feb 14, 2024 at 03:57:54PM -0600, Mario Limonciello wrote:
> Some manufacturers have intentionally put an EDID that differs from
> the EDID on the internal panel on laptops.  Drivers that prefer to
> fetch this EDID can set a bit on the drm_connector to indicate that
> the DRM EDID helpers should try to fetch it and it is preferred if
> it's present.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/gpu/drm/Kconfig     |   1 +
>  drivers/gpu/drm/drm_edid.c  | 109 +++++++++++++++++++++++++++++++++---
>  include/drm/drm_connector.h |   6 ++
>  include/drm/drm_edid.h      |   1 +
>  4 files changed, 109 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 872edb47bb53..3db89e6af01d 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -8,6 +8,7 @@
>  menuconfig DRM
>  	tristate "Direct Rendering Manager (XFree86 4.1.0 and higher DRI support)"
>  	depends on (AGP || AGP=n) && !EMULATED_CMPXCHG && HAS_DMA
> +	depends on (ACPI_VIDEO || ACPI_VIDEO=n)
>  	select DRM_PANEL_ORIENTATION_QUIRKS
>  	select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
>  	select FB_CORE if DRM_FBDEV_EMULATION
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 923c4423151c..cdc30c6d05d5 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -28,6 +28,7 @@
>   * DEALINGS IN THE SOFTWARE.
>   */
>  
> +#include <acpi/video.h>
>  #include <linux/bitfield.h>
>  #include <linux/cec.h>
>  #include <linux/hdmi.h>
> @@ -2188,6 +2189,58 @@ drm_do_probe_ddc_edid(void *data, u8 *buf, unsigned int block, size_t len)
>  	return ret == xfers ? 0 : -1;
>  }
>  
> +/**
> + * drm_do_probe_acpi_edid() - get EDID information via ACPI _DDC
> + * @data: struct drm_connector
> + * @buf: EDID data buffer to be filled
> + * @block: 128 byte EDID block to start fetching from
> + * @len: EDID data buffer length to fetch
> + *
> + * Try to fetch EDID information by calling acpi_video_get_edid() function.
> + *
> + * Return: 0 on success or error code on failure.
> + */
> +static int
> +drm_do_probe_acpi_edid(void *data, u8 *buf, unsigned int block, size_t len)
> +{
> +	struct drm_connector *connector = data;
> +	struct drm_device *ddev = connector->dev;
> +	struct acpi_device *acpidev = ACPI_COMPANION(ddev->dev);
> +	unsigned char start = block * EDID_LENGTH;
> +	void *edid;
> +	int r;
> +
> +	if (!acpidev)
> +		return -ENODEV;
> +
> +	switch (connector->connector_type) {
> +	case DRM_MODE_CONNECTOR_LVDS:
> +	case DRM_MODE_CONNECTOR_eDP:
> +		break;
> +	default:
> +		return -EINVAL;
> +	}

We could have other types of connectors that want this too.
I don't see any real benefit in having this check tbh. Drivers
should simply notset the flag on connectors where it won't work,
and only the driver can really know that.

> +	/* fetch the entire edid from BIOS */
> +	r = acpi_video_get_edid(acpidev, ACPI_VIDEO_DISPLAY_LCD, -1, &edid);
> +	if (r < 0) {
> +		DRM_DEBUG_KMS("Failed to get EDID from ACPI: %d\n", r);
> +		return r;
> +	}
> +	if (len > r || start > r || start + len > r) {
> +		r = -EINVAL;
> +		goto cleanup;
> +	}
> +
> +	memcpy(buf, edid + start, len);
> +	r = 0;
> +
> +cleanup:
> +	kfree(edid);
> +
> +	return r;
> +}
> +
>  static void connector_bad_edid(struct drm_connector *connector,
>  			       const struct edid *edid, int num_blocks)
>  {
> @@ -2621,7 +2674,8 @@ EXPORT_SYMBOL(drm_probe_ddc);
>   * @connector: connector we're probing
>   * @adapter: I2C adapter to use for DDC
>   *
> - * Poke the given I2C channel to grab EDID data if possible.  If found,
> + * If the connector allows it, try to fetch EDID data using ACPI. If not found
> + * poke the given I2C channel to grab EDID data if possible.  If found,
>   * attach it to the connector.
>   *
>   * Return: Pointer to valid EDID or NULL if we couldn't find any.
> @@ -2629,20 +2683,50 @@ EXPORT_SYMBOL(drm_probe_ddc);
>  struct edid *drm_get_edid(struct drm_connector *connector,
>  			  struct i2c_adapter *adapter)
>  {
> -	struct edid *edid;
> +	struct edid *edid = NULL;
>  
>  	if (connector->force == DRM_FORCE_OFF)
>  		return NULL;
>  
> -	if (connector->force == DRM_FORCE_UNSPECIFIED && !drm_probe_ddc(adapter))
> -		return NULL;
> +	if (connector->acpi_edid_allowed)
> +		edid = _drm_do_get_edid(connector, drm_do_probe_acpi_edid, connector, NULL);
> +
> +	if (!edid) {
> +		if (connector->force == DRM_FORCE_UNSPECIFIED && !drm_probe_ddc(adapter))
> +			return NULL;
> +		edid = _drm_do_get_edid(connector, drm_do_probe_ddc_edid, adapter, NULL);
> +	}
>  
> -	edid = _drm_do_get_edid(connector, drm_do_probe_ddc_edid, adapter, NULL);
>  	drm_connector_update_edid_property(connector, edid);
>  	return edid;
>  }
>  EXPORT_SYMBOL(drm_get_edid);
>  
> +/**
> + * drm_edid_read_acpi - get EDID data, if available
> + * @connector: connector we're probing
> + *
> + * Use the BIOS to attempt to grab EDID data if possible.
> + *
> + * The returned pointer must be freed using drm_edid_free().
> + *
> + * Return: Pointer to valid EDID or NULL if we couldn't find any.
> + */
> +const struct drm_edid *drm_edid_read_acpi(struct drm_connector *connector)
> +{
> +	const struct drm_edid *drm_edid;
> +
> +	if (connector->force == DRM_FORCE_OFF)
> +		return NULL;
> +
> +	drm_edid = drm_edid_read_custom(connector, drm_do_probe_acpi_edid, connector);
> +
> +	/* Note: Do *not* call connector updates here. */
> +
> +	return drm_edid;
> +}
> +EXPORT_SYMBOL(drm_edid_read_acpi);
> +
>  /**
>   * drm_edid_read_custom - Read EDID data using given EDID block read function
>   * @connector: Connector to use
> @@ -2727,10 +2811,11 @@ const struct drm_edid *drm_edid_read_ddc(struct drm_connector *connector,
>  EXPORT_SYMBOL(drm_edid_read_ddc);
>  
>  /**
> - * drm_edid_read - Read EDID data using connector's I2C adapter
> + * drm_edid_read - Read EDID data using BIOS or connector's I2C adapter
>   * @connector: Connector to use
>   *
> - * Read EDID using the connector's I2C adapter.
> + * Read EDID from BIOS if allowed by connector or by using the connector's
> + * I2C adapter.
>   *
>   * The EDID may be overridden using debugfs override_edid or firmware EDID
>   * (drm_edid_load_firmware() and drm.edid_firmware parameter), in this priority
> @@ -2742,10 +2827,18 @@ EXPORT_SYMBOL(drm_edid_read_ddc);
>   */
>  const struct drm_edid *drm_edid_read(struct drm_connector *connector)
>  {
> +	const struct drm_edid *drm_edid = NULL;
> +
>  	if (drm_WARN_ON(connector->dev, !connector->ddc))
>  		return NULL;
>  
> -	return drm_edid_read_ddc(connector, connector->ddc);
> +	if (connector->acpi_edid_allowed)

That should probably be called 'prefer_acpi_edid' or something
since it's the first choice when the flag is set.

But I'm not so sure there's any real benefit in having this
flag at all. You anyway have to modify the driver to use this,
so why not just have the driver do the call directly instead of
adding this extra detour via the flag?

> +		drm_edid = drm_edid_read_acpi(connector);
> +
> +	if (!drm_edid)
> +		drm_edid = drm_edid_read_ddc(connector, connector->ddc);
> +
> +	return drm_edid;
>  }
>  EXPORT_SYMBOL(drm_edid_read);
>  
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index fe88d7fc6b8f..74ed47f37a69 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1886,6 +1886,12 @@ struct drm_connector {
>  
>  	/** @hdr_sink_metadata: HDR Metadata Information read from sink */
>  	struct hdr_sink_metadata hdr_sink_metadata;
> +
> +	/**
> +	 * @acpi_edid_allowed: Get the EDID from the BIOS, if available.
> +	 * This is only applicable to eDP and LVDS displays.
> +	 */
> +	bool acpi_edid_allowed;

Aren't there other bools/small stuff in there for tighter packing?

>  };
>  
>  #define obj_to_connector(x) container_of(x, struct drm_connector, base)
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 7923bc00dc7a..1c1ee927de9c 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -459,5 +459,6 @@ bool drm_edid_is_digital(const struct drm_edid *drm_edid);
>  
>  const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
>  				  int ext_id, int *ext_index);
> +const struct drm_edid *drm_edid_read_acpi(struct drm_connector *connector);
>  
>  #endif /* __DRM_EDID_H__ */
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
