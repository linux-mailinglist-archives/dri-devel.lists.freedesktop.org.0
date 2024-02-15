Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 980D3856535
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 15:01:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9059310E809;
	Thu, 15 Feb 2024 14:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VQ4kc547";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DAD10E7C6;
 Thu, 15 Feb 2024 14:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708005669; x=1739541669;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=NU9Se3/hUjZuq4O8oLC6OrFNJO05DdvNQarp036H6Ss=;
 b=VQ4kc547LXGXQkGJxkbAgnTRR2JkarAVA+jBpzXoTqW7j1wpkOpGp/Hz
 tSAXc1F26lSCFHQG9d+xFWpYCQRz4aXSInMGKogq+hfrmtxRIkNJjMpbN
 p4nrZARD0nZPN69R5tkJkSV/uzVk4RuFlOtFLhKWuyjqM2rOH2D8Fu9LH
 lsOp2U8tJCajjg6AYHJy/hk/wZccsuq2RTK8SyTL8TbSn7zVbl3HGdsi4
 aS/hf8bo3rOWOdO6/sKm4LLa1JtUIwfFIjoNcbgOXo8OrtyysSADbRp3A
 tXyF5YuoHq6ksYpBjbz60MtfptRmFJisI6k3MEzyDh5XpwN1OMpWP3OQ8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="5867670"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="5867670"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 06:01:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="826416889"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; d="scan'208";a="826416889"
Received: from kraszkow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.44.13])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 06:01:04 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>
Cc: "open list:ACPI" <linux-acpi@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>, Melissa Wen <mwen@igalia.com>, Mark
 Pearson <mpearson-lenovo@squebb.ca>, Mario Limonciello
 <mario.limonciello@amd.com>
Subject: Re: [PATCH v5 1/3] drm: Add support to get EDID from ACPI
In-Reply-To: <20240211055011.3583-2-mario.limonciello@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240211055011.3583-1-mario.limonciello@amd.com>
 <20240211055011.3583-2-mario.limonciello@amd.com>
Date: Thu, 15 Feb 2024 16:01:02 +0200
Message-ID: <87eddd6d41.fsf@intel.com>
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

On Sat, 10 Feb 2024, Mario Limonciello <mario.limonciello@amd.com> wrote:
> Some manufacturers have intentionally put an EDID that differs from
> the EDID on the internal panel on laptops.  Drivers that prefer to
> fetch this EDID can set a bit on the drm_connector to indicate that
> the DRM EDID helpers should try to fetch it and it is preferred if
> it's present.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v1->v2:
>  * Split code from previous amdgpu specific helper to generic drm helper.
> v2->v3:
>  * Add an extra select to fix a variety of randconfig errors found from
>    LKP robot.
> v3->v4:
>  * Return struct drm_edid
> v4->v5:
>  * Rename to drm_edid_read_acpi
>  * Drop selects
> ---
>  drivers/gpu/drm/Kconfig     |   7 +++
>  drivers/gpu/drm/drm_edid.c  | 113 +++++++++++++++++++++++++++++++++---
>  include/drm/drm_connector.h |   6 ++
>  include/drm/drm_edid.h      |   1 +
>  4 files changed, 119 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 2520db0b776e..a49740c528b9 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -103,6 +103,13 @@ config DRM_KMS_HELPER
>  	help
>  	  CRTC helpers for KMS drivers.
>  
> +config DRM_ACPI_HELPER
> +	tristate "ACPI support in DRM"
> +	depends on DRM
> +	depends on (ACPI_VIDEO || ACPI_VIDEO=n)
> +	help
> +	  ACPI helpers for DRM drivers.
> +
>  config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
>          bool "Enable refcount backtrace history in the DP MST helpers"
>  	depends on STACKTRACE_SUPPORT
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 69c68804023f..096c278b6f66 100644
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
> @@ -2188,6 +2189,62 @@ drm_do_probe_ddc_edid(void *data, u8 *buf, unsigned int block, size_t len)
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
> +
> +	/* fetch the entire edid from BIOS */
> +	if (IS_REACHABLE(CONFIG_DRM_ACPI_HELPER)) {
> +		r = acpi_video_get_edid(acpidev, ACPI_VIDEO_DISPLAY_LCD, -1, &edid);
> +		if (r < 0) {
> +			DRM_DEBUG_KMS("Failed to get EDID from ACPI: %d\n", r);
> +			return -EINVAL;
> +		}
> +	} else {
> +		r = -EOPNOTSUPP;
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
> @@ -2621,7 +2678,8 @@ EXPORT_SYMBOL(drm_probe_ddc);
>   * @connector: connector we're probing
>   * @adapter: I2C adapter to use for DDC
>   *
> - * Poke the given I2C channel to grab EDID data if possible.  If found,
> + * If the connector allows it, try to fetch EDID data using ACPI. If not found
> + * poke the given I2C channel to grab EDID data if possible.  If found,
>   * attach it to the connector.
>   *
>   * Return: Pointer to valid EDID or NULL if we couldn't find any.
> @@ -2629,20 +2687,50 @@ EXPORT_SYMBOL(drm_probe_ddc);
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

Hmm. So do you want the presence of ACPI EDID to determine whether the
display is there or not?

Note how the override and firmware EDID mechanisms only override the
EDID *contents*. They are orthogonal from connector forcing. So you can
override the EDID, but still rely on the DDC probe to determine if the
display is there.

The question is, how likely is it that the ACPI EDID is used not just
because the actual EDID is bogus, but also because the display just
doesn't respond to DDC at all?

If possible, I'd like ACPI EDID to follow the override/firmware EDID
semantics on this.

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

If the caller handled all the connector->force stuff, this could be
dropped.

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
> @@ -2727,10 +2815,11 @@ const struct drm_edid *drm_edid_read_ddc(struct drm_connector *connector,
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
> @@ -2742,10 +2831,18 @@ EXPORT_SYMBOL(drm_edid_read_ddc);
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
> +		drm_edid = drm_edid_read_acpi(connector);
> +
> +	if (!drm_edid)
> +		drm_edid = drm_edid_read_ddc(connector, connector->ddc);

This should be in drm_edid_read_ddc() not drm_edid_read(). Please let's
not make the two behave any different. It would be really weird if one
had an ACPI check and the other not.

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
>  };
>  
>  #define obj_to_connector(x) container_of(x, struct drm_connector, base)
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 518d1b8106c7..38b5e1b5c773 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -463,5 +463,6 @@ bool drm_edid_is_digital(const struct drm_edid *drm_edid);
>  
>  const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
>  				  int ext_id, int *ext_index);
> +const struct drm_edid *drm_edid_read_acpi(struct drm_connector *connector);
>  
>  #endif /* __DRM_EDID_H__ */

-- 
Jani Nikula, Intel
