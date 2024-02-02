Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BCA846DE5
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 11:29:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D41D610E548;
	Fri,  2 Feb 2024 10:29:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jV/+EzfI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097DE10E1B9;
 Fri,  2 Feb 2024 10:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706869792; x=1738405792;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=h4TFBQqxGzZUFtP/Vmen1pxw3+bNKf4+pE9E/5QUd84=;
 b=jV/+EzfIh91XLKmUMYKQ4SN9f/sA57qyeEGd3ieewBHVRtx2/79FCVH6
 MNPM/vFWSSkYuGY5b22VVK9I3eJ/tqXp3jRG0/iR0rQhgeQcrooow5hXt
 TRqrXtg0kcgqbRkczABeXAQhcNxJEAOL+IDyeNVfIu8ub7qepc24235xn
 3L0xjNUoaSjS+E/Y5D7R4BGOTADxLmB5rMhf3NKPZfTbfGkOegfGZDmr/
 iBIpGWsE/ZvJ2ndyyJ2jMq7R7GG64sN+EolYCUdGw07cz37B6ZPDgf/Zt
 S8VgYMQqn6xo5H0PE99GDfo+iXvNQcW8E0EK0uyrCUYOFAE1jMcLYaXK5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="10873612"
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; d="scan'208";a="10873612"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 02:29:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; 
   d="scan'208";a="4664969"
Received: from mistoan-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.41.140])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 02:29:47 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Cc: "open list:ACPI" <linux-acpi@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, Melissa Wen <mwen@igalia.com>, Mark
 Pearson <mpearson-lenovo@squebb.ca>, Mario Limonciello
 <mario.limonciello@amd.com>
Subject: Re: [PATCH v3 2/5] drm: Add drm_get_acpi_edid() helper
In-Reply-To: <20240201221119.42564-3-mario.limonciello@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240201221119.42564-1-mario.limonciello@amd.com>
 <20240201221119.42564-3-mario.limonciello@amd.com>
Date: Fri, 02 Feb 2024 12:29:42 +0200
Message-ID: <878r43f9bd.fsf@intel.com>
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

On Thu, 01 Feb 2024, Mario Limonciello <mario.limonciello@amd.com> wrote:
> Some manufacturers have intentionally put an EDID that differs from
> the EDID on the internal panel on laptops.  Drivers can call this
> helper to attempt to fetch the EDID from the BIOS's ACPI _DDC method.

I'm really not happy about adding new struct edid based APIs to
drm_edid.[ch]. Everything new should be struct drm_edid based. All
drivers should be converting towards struct drm_edid, instead of adding
more legacy to rip out later.

BR,
Jani.

>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v1->v2:
>  * Split code from previous amdgpu specific helper to generic drm helper.
> v2->v3:
>  * Add an extra select to fix a variety of randconfig errors found from
>    LKP robot.
> ---
>  drivers/gpu/drm/Kconfig    |  5 +++
>  drivers/gpu/drm/drm_edid.c | 73 ++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_edid.h     |  1 +
>  3 files changed, 79 insertions(+)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 2520db0b776e..14df907c96c8 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -21,6 +21,11 @@ menuconfig DRM
>  	select KCMP
>  	select VIDEO_CMDLINE
>  	select VIDEO_NOMODESET
> +	select ACPI_VIDEO if ACPI
> +	select BACKLIGHT_CLASS_DEVICE if ACPI
> +	select INPUT if ACPI
> +	select X86_PLATFORM_DEVICES if ACPI && X86
> +	select ACPI_WMI if ACPI && X86
>  	help
>  	  Kernel-level support for the Direct Rendering Infrastructure (DRI)
>  	  introduced in XFree86 4.0. If you say Y here, you need to select
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 69c68804023f..1fbbeaa664b2 100644
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
> @@ -2188,6 +2189,47 @@ drm_do_probe_ddc_edid(void *data, u8 *buf, unsigned int block, size_t len)
>  	return ret == xfers ? 0 : -1;
>  }
>  
> +/**
> + * drm_do_probe_acpi_edid() - get EDID information via ACPI _DDC
> + * @data: struct drm_device
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
> +	struct drm_device *ddev = data;
> +	struct acpi_device *acpidev = ACPI_COMPANION(ddev->dev);
> +	unsigned char start = block * EDID_LENGTH;
> +	void *edid;
> +	int r;
> +
> +	if (!acpidev)
> +		return -ENODEV;
> +
> +	/* fetch the entire edid from BIOS */
> +	r = acpi_video_get_edid(acpidev, ACPI_VIDEO_DISPLAY_LCD, -1, &edid);
> +	if (r < 0) {
> +		DRM_DEBUG_KMS("Failed to get EDID from ACPI: %d\n", r);
> +		return -EINVAL;
> +	}
> +	if (len > r || start > r || start + len > r) {
> +		r = EINVAL;
> +		goto cleanup;
> +	}
> +
> +	memcpy(buf, edid + start, len);
> +	r = 0;
> +cleanup:
> +	kfree(edid);
> +	return r;
> +}
> +
>  static void connector_bad_edid(struct drm_connector *connector,
>  			       const struct edid *edid, int num_blocks)
>  {
> @@ -2643,6 +2685,37 @@ struct edid *drm_get_edid(struct drm_connector *connector,
>  }
>  EXPORT_SYMBOL(drm_get_edid);
>  
> +/**
> + * drm_get_acpi_edid - get EDID data, if available
> + * @connector: connector we're probing
> + *
> + * Use the BIOS to attempt to grab EDID data if possible.  If found,
> + * attach it to the connector.
> + *
> + * Return: Pointer to valid EDID or NULL if we couldn't find any.
> + */
> +struct edid *drm_get_acpi_edid(struct drm_connector *connector)
> +{
> +	struct edid *edid = NULL;
> +
> +	switch (connector->connector_type) {
> +	case DRM_MODE_CONNECTOR_LVDS:
> +	case DRM_MODE_CONNECTOR_eDP:
> +		break;
> +	default:
> +		return NULL;
> +	}
> +
> +	if (connector->force == DRM_FORCE_OFF)
> +		return NULL;
> +
> +	edid = _drm_do_get_edid(connector, drm_do_probe_acpi_edid, connector->dev, NULL);
> +
> +	drm_connector_update_edid_property(connector, edid);
> +	return edid;
> +}
> +EXPORT_SYMBOL(drm_get_acpi_edid);
> +
>  /**
>   * drm_edid_read_custom - Read EDID data using given EDID block read function
>   * @connector: Connector to use
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 518d1b8106c7..60fbdc06badc 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -412,6 +412,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
>  	void *data);
>  struct edid *drm_get_edid(struct drm_connector *connector,
>  			  struct i2c_adapter *adapter);
> +struct edid *drm_get_acpi_edid(struct drm_connector *connector);
>  u32 drm_edid_get_panel_id(struct i2c_adapter *adapter);
>  struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
>  				     struct i2c_adapter *adapter);

-- 
Jani Nikula, Intel
