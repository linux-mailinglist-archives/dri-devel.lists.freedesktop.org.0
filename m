Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB0A84E33E
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 15:32:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1F810E837;
	Thu,  8 Feb 2024 14:32:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QRd+WHVi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9FB10E834;
 Thu,  8 Feb 2024 14:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707402727; x=1738938727;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=KLUcyDxIIkcgthwnVcRsPO8Ou2+YvQDl9VrpRHzEETc=;
 b=QRd+WHVin9nTEjX/JzXeNE7lswMIVuv6dC4SQm5Lut4Wa9grJVQ9Pfwt
 xUNHErDBxRMXuvILN5DmClBw/N3LiAxkCHYurtKdrIFd9Pb6r7H+BrQwk
 azgwU8G9++gOXxQ5O+1aToHirIVQUGactxQc5TkndXoT7hsLkuToztV3m
 Hx140+4coawEGYGVKOE4RKxMMsXXFRL712p+VWRcpkodTdwhteoknRlXu
 cE2V49thcC1UGA56WzOTkb6jv4kjcIt7wFjFU6rKdXAYzvYGgEUcufHcx
 Qbq12IErOH6omN8A3HDGH31TfAcYXgvnMaR71wFqK6il10MPHgX0pnQ2W w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="5044953"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="5044953"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 06:32:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="934146115"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="934146115"
Received: from unknown (HELO localhost) ([10.237.66.162])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 06:32:02 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, "open list:ACPI"
 <linux-acpi@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Melissa Wen <mwen@igalia.com>, Dave Airlie <airlied@redhat.com>, Daniel
 Vetter <daniel.vetter@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: Re: [PATCH v4 1/3] drm: Add drm_get_acpi_edid() helper
In-Reply-To: <ysm2e3vczov7z7vezmexe35fjnkhsakud3elsgggedhk2lknlz@cx7j44y354db>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240207224429.104625-1-mario.limonciello@amd.com>
 <20240207224429.104625-2-mario.limonciello@amd.com>
 <87y1bvb7ns.fsf@intel.com>
 <ysm2e3vczov7z7vezmexe35fjnkhsakud3elsgggedhk2lknlz@cx7j44y354db>
Date: Thu, 08 Feb 2024 16:31:56 +0200
Message-ID: <87sf23auxv.fsf@intel.com>
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

On Thu, 08 Feb 2024, Maxime Ripard <mripard@kernel.org> wrote:
> On Thu, Feb 08, 2024 at 11:57:11AM +0200, Jani Nikula wrote:
>> On Wed, 07 Feb 2024, Mario Limonciello <mario.limonciello@amd.com> wrote:
>> > Some manufacturers have intentionally put an EDID that differs from
>> > the EDID on the internal panel on laptops.  Drivers can call this
>> > helper to attempt to fetch the EDID from the BIOS's ACPI _DDC method.
>> >
>> > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> > ---
>> >  drivers/gpu/drm/Kconfig    |  5 +++
>> >  drivers/gpu/drm/drm_edid.c | 77 ++++++++++++++++++++++++++++++++++++++
>> >  include/drm/drm_edid.h     |  1 +
>> >  3 files changed, 83 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> > index 6ec33d36f3a4..ec2bb71e8b36 100644
>> > --- a/drivers/gpu/drm/Kconfig
>> > +++ b/drivers/gpu/drm/Kconfig
>> > @@ -21,6 +21,11 @@ menuconfig DRM
>> >  	select KCMP
>> >  	select VIDEO_CMDLINE
>> >  	select VIDEO_NOMODESET
>> > +	select ACPI_VIDEO if ACPI
>> > +	select BACKLIGHT_CLASS_DEVICE if ACPI
>> > +	select INPUT if ACPI
>> > +	select X86_PLATFORM_DEVICES if ACPI && X86
>> > +	select ACPI_WMI if ACPI && X86
>> 
>> I think I'll defer to drm maintainers on whether this is okay or
>> something to be avoided.
>> 
>> 
>> >  	help
>> >  	  Kernel-level support for the Direct Rendering Infrastructure (DRI)
>> >  	  introduced in XFree86 4.0. If you say Y here, you need to select
>> > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> > index 923c4423151c..c649b4f9fd8e 100644
>> > --- a/drivers/gpu/drm/drm_edid.c
>> > +++ b/drivers/gpu/drm/drm_edid.c
>> > @@ -28,6 +28,7 @@
>> >   * DEALINGS IN THE SOFTWARE.
>> >   */
>> >  
>> > +#include <acpi/video.h>
>> >  #include <linux/bitfield.h>
>> >  #include <linux/cec.h>
>> >  #include <linux/hdmi.h>
>> > @@ -2188,6 +2189,49 @@ drm_do_probe_ddc_edid(void *data, u8 *buf, unsigned int block, size_t len)
>> >  	return ret == xfers ? 0 : -1;
>> >  }
>> >  
>> > +/**
>> > + * drm_do_probe_acpi_edid() - get EDID information via ACPI _DDC
>> > + * @data: struct drm_device
>> > + * @buf: EDID data buffer to be filled
>> > + * @block: 128 byte EDID block to start fetching from
>> > + * @len: EDID data buffer length to fetch
>> > + *
>> > + * Try to fetch EDID information by calling acpi_video_get_edid() function.
>> > + *
>> > + * Return: 0 on success or error code on failure.
>> > + */
>> > +static int
>> > +drm_do_probe_acpi_edid(void *data, u8 *buf, unsigned int block, size_t len)
>> > +{
>> > +	struct drm_device *ddev = data;
>> > +	struct acpi_device *acpidev = ACPI_COMPANION(ddev->dev);
>> > +	unsigned char start = block * EDID_LENGTH;
>> > +	void *edid;
>> > +	int r;
>> > +
>> > +	if (!acpidev)
>> > +		return -ENODEV;
>> > +
>> > +	/* fetch the entire edid from BIOS */
>> > +	r = acpi_video_get_edid(acpidev, ACPI_VIDEO_DISPLAY_LCD, -1, &edid);
>> > +	if (r < 0) {
>> > +		DRM_DEBUG_KMS("Failed to get EDID from ACPI: %d\n", r);
>> > +		return -EINVAL;
>> > +	}
>> > +	if (len > r || start > r || start + len > r) {
>> > +		r = -EINVAL;
>> > +		goto cleanup;
>> > +	}
>> > +
>> > +	memcpy(buf, edid + start, len);
>> > +	r = 0;
>> > +
>> > +cleanup:
>> > +	kfree(edid);
>> > +
>> > +	return r;
>> > +}
>> > +
>> >  static void connector_bad_edid(struct drm_connector *connector,
>> >  			       const struct edid *edid, int num_blocks)
>> >  {
>> > @@ -2643,6 +2687,39 @@ struct edid *drm_get_edid(struct drm_connector *connector,
>> >  }
>> >  EXPORT_SYMBOL(drm_get_edid);
>> >  
>> > +/**
>> > + * drm_get_acpi_edid - get EDID data, if available
>> 
>> I'd prefer all the new EDID API to be named drm_edid_*. Makes a clean
>> break from the old API, and is more consistent.
>> 
>> So perhaps drm_edid_read_acpi() to be in line with all the other struct
>> drm_edid based EDID reading functions.
>> 
>> > + * @connector: connector we're probing
>> > + *
>> > + * Use the BIOS to attempt to grab EDID data if possible.
>> > + *
>> > + * The returned pointer must be freed using drm_edid_free().
>> > + *
>> > + * Return: Pointer to valid EDID or NULL if we couldn't find any.
>> > + */
>> > +const struct drm_edid *drm_get_acpi_edid(struct drm_connector *connector)
>> > +{
>> > +	const struct drm_edid *drm_edid;
>> > +
>> > +	switch (connector->connector_type) {
>> > +	case DRM_MODE_CONNECTOR_LVDS:
>> > +	case DRM_MODE_CONNECTOR_eDP:
>> > +		break;
>> > +	default:
>> > +		return NULL;
>> > +	}
>> > +
>> > +	if (connector->force == DRM_FORCE_OFF)
>> > +		return NULL;
>> > +
>> > +	drm_edid = drm_edid_read_custom(connector, drm_do_probe_acpi_edid, connector->dev);
>> > +
>> > +	/* Note: Do *not* call connector updates here. */
>> > +
>> > +	return drm_edid;
>> > +}
>> > +EXPORT_SYMBOL(drm_get_acpi_edid);
>
> Why shouldn't we use the BIOS/UEFI to retrieve them if it's available?
>
> I guess what I'm asking is why should we make this an exported function
> that drivers would have to call explicitly, instead of just making it
> part of the usual EDID retrieval interface.

Two main questions:

What if the EDID from ACPI is bogus? Needs to be configurable in the
connector somehow?

What if you have multiple local panels? This seems to only support one,
and would return the same EDID for both.

BR,
Jani.


-- 
Jani Nikula, Intel
