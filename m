Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99415856D0B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 19:47:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C3AD10E6D9;
	Thu, 15 Feb 2024 18:47:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M2G2D+2g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E3110E6D9;
 Thu, 15 Feb 2024 18:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708022855; x=1739558855;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0xDOg2u0V8uxNM+kqNyuZBvObXbz+y7zI30XTxDevLI=;
 b=M2G2D+2gfEqsj8S58uuG0Q9EIZJceqfqYaeYNLBK92DydgFRqDbHjC3+
 H/DwG6k66lPi49qgUHU8/p3ThEsIDDaKZkvPsZHgDoiCS7xdsc8sfSpXt
 5rVdqFNBmek0sbVbNE70DZ2ezGysZksU0lRYEcVFhGbaitKKGm7GQsTWs
 LvK1eis84GGdbx35qpfY8ZJjGBIcaYnHAYCqrwDkenTak8CMoCUiEk30i
 iOC3J7TiZVYKcOaHmuvnsmrDdLbTJM/6rfkCMj1/KNgeOi4fFCOdCe9wG
 gmieS6Un3DVc2YuXfuGaBYIPVA922Zs89/FcbNRQpRyNGXp9Ap12DB7jI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="19649951"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="19649951"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 10:47:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="826449228"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="826449228"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 15 Feb 2024 10:47:27 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 15 Feb 2024 20:47:26 +0200
Date: Thu, 15 Feb 2024 20:47:26 +0200
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
Message-ID: <Zc5cPjpNZydqKeS8@intel.com>
References: <20240214215756.6530-1-mario.limonciello@amd.com>
 <20240214215756.6530-4-mario.limonciello@amd.com>
 <Zc1JEg5mC0ww_BeU@intel.com>
 <9831e9bc-d55f-4a72-950a-684a757af59c@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9831e9bc-d55f-4a72-950a-684a757af59c@amd.com>
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

On Thu, Feb 15, 2024 at 12:20:56PM -0600, Mario Limonciello wrote:
> On 2/14/2024 17:13, Ville Syrjälä wrote:
> > On Wed, Feb 14, 2024 at 03:57:54PM -0600, Mario Limonciello wrote:
> >> Some manufacturers have intentionally put an EDID that differs from
> >> the EDID on the internal panel on laptops.  Drivers that prefer to
> >> fetch this EDID can set a bit on the drm_connector to indicate that
> >> the DRM EDID helpers should try to fetch it and it is preferred if
> >> it's present.
> >>
> >> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> >> ---
> >>   drivers/gpu/drm/Kconfig     |   1 +
> >>   drivers/gpu/drm/drm_edid.c  | 109 +++++++++++++++++++++++++++++++++---
> >>   include/drm/drm_connector.h |   6 ++
> >>   include/drm/drm_edid.h      |   1 +
> >>   4 files changed, 109 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> >> index 872edb47bb53..3db89e6af01d 100644
> >> --- a/drivers/gpu/drm/Kconfig
> >> +++ b/drivers/gpu/drm/Kconfig
> >> @@ -8,6 +8,7 @@
> >>   menuconfig DRM
> >>   	tristate "Direct Rendering Manager (XFree86 4.1.0 and higher DRI support)"
> >>   	depends on (AGP || AGP=n) && !EMULATED_CMPXCHG && HAS_DMA
> >> +	depends on (ACPI_VIDEO || ACPI_VIDEO=n)
> >>   	select DRM_PANEL_ORIENTATION_QUIRKS
> >>   	select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
> >>   	select FB_CORE if DRM_FBDEV_EMULATION
> >> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> >> index 923c4423151c..cdc30c6d05d5 100644
> >> --- a/drivers/gpu/drm/drm_edid.c
> >> +++ b/drivers/gpu/drm/drm_edid.c
> >> @@ -28,6 +28,7 @@
> >>    * DEALINGS IN THE SOFTWARE.
> >>    */
> >>   
> >> +#include <acpi/video.h>
> >>   #include <linux/bitfield.h>
> >>   #include <linux/cec.h>
> >>   #include <linux/hdmi.h>
> >> @@ -2188,6 +2189,58 @@ drm_do_probe_ddc_edid(void *data, u8 *buf, unsigned int block, size_t len)
> >>   	return ret == xfers ? 0 : -1;
> >>   }
> >>   
> >> +/**
> >> + * drm_do_probe_acpi_edid() - get EDID information via ACPI _DDC
> >> + * @data: struct drm_connector
> >> + * @buf: EDID data buffer to be filled
> >> + * @block: 128 byte EDID block to start fetching from
> >> + * @len: EDID data buffer length to fetch
> >> + *
> >> + * Try to fetch EDID information by calling acpi_video_get_edid() function.
> >> + *
> >> + * Return: 0 on success or error code on failure.
> >> + */
> >> +static int
> >> +drm_do_probe_acpi_edid(void *data, u8 *buf, unsigned int block, size_t len)
> >> +{
> >> +	struct drm_connector *connector = data;
> >> +	struct drm_device *ddev = connector->dev;
> >> +	struct acpi_device *acpidev = ACPI_COMPANION(ddev->dev);
> >> +	unsigned char start = block * EDID_LENGTH;
> >> +	void *edid;
> >> +	int r;
> >> +
> >> +	if (!acpidev)
> >> +		return -ENODEV;
> >> +
> >> +	switch (connector->connector_type) {
> >> +	case DRM_MODE_CONNECTOR_LVDS:
> >> +	case DRM_MODE_CONNECTOR_eDP:
> >> +		break;
> >> +	default:
> >> +		return -EINVAL;
> >> +	}
> > 
> > We could have other types of connectors that want this too.
> > I don't see any real benefit in having this check tbh. Drivers
> > should simply notset the flag on connectors where it won't work,
> > and only the driver can really know that.
> 
> Ack.
> 
> > 
> >> +	/* fetch the entire edid from BIOS */
> >> +	r = acpi_video_get_edid(acpidev, ACPI_VIDEO_DISPLAY_LCD, -1, &edid);
> >> +	if (r < 0) {
> >> +		DRM_DEBUG_KMS("Failed to get EDID from ACPI: %d\n", r);
> >> +		return r;
> >> +	}
> >> +	if (len > r || start > r || start + len > r) {
> >> +		r = -EINVAL;
> >> +		goto cleanup;
> >> +	}
> >> +
> >> +	memcpy(buf, edid + start, len);
> >> +	r = 0;
> >> +
> >> +cleanup:
> >> +	kfree(edid);
> >> +
> >> +	return r;
> >> +}
> >> +
> >>   static void connector_bad_edid(struct drm_connector *connector,
> >>   			       const struct edid *edid, int num_blocks)
> >>   {
> >> @@ -2621,7 +2674,8 @@ EXPORT_SYMBOL(drm_probe_ddc);
> >>    * @connector: connector we're probing
> >>    * @adapter: I2C adapter to use for DDC
> >>    *
> >> - * Poke the given I2C channel to grab EDID data if possible.  If found,
> >> + * If the connector allows it, try to fetch EDID data using ACPI. If not found
> >> + * poke the given I2C channel to grab EDID data if possible.  If found,
> >>    * attach it to the connector.
> >>    *
> >>    * Return: Pointer to valid EDID or NULL if we couldn't find any.
> >> @@ -2629,20 +2683,50 @@ EXPORT_SYMBOL(drm_probe_ddc);
> >>   struct edid *drm_get_edid(struct drm_connector *connector,
> >>   			  struct i2c_adapter *adapter)
> >>   {
> >> -	struct edid *edid;
> >> +	struct edid *edid = NULL;
> >>   
> >>   	if (connector->force == DRM_FORCE_OFF)
> >>   		return NULL;
> >>   
> >> -	if (connector->force == DRM_FORCE_UNSPECIFIED && !drm_probe_ddc(adapter))
> >> -		return NULL;
> >> +	if (connector->acpi_edid_allowed)
> >> +		edid = _drm_do_get_edid(connector, drm_do_probe_acpi_edid, connector, NULL);
> >> +
> >> +	if (!edid) {
> >> +		if (connector->force == DRM_FORCE_UNSPECIFIED && !drm_probe_ddc(adapter))
> >> +			return NULL;
> >> +		edid = _drm_do_get_edid(connector, drm_do_probe_ddc_edid, adapter, NULL);
> >> +	}
> >>   
> >> -	edid = _drm_do_get_edid(connector, drm_do_probe_ddc_edid, adapter, NULL);
> >>   	drm_connector_update_edid_property(connector, edid);
> >>   	return edid;
> >>   }
> >>   EXPORT_SYMBOL(drm_get_edid);
> >>   
> >> +/**
> >> + * drm_edid_read_acpi - get EDID data, if available
> >> + * @connector: connector we're probing
> >> + *
> >> + * Use the BIOS to attempt to grab EDID data if possible.
> >> + *
> >> + * The returned pointer must be freed using drm_edid_free().
> >> + *
> >> + * Return: Pointer to valid EDID or NULL if we couldn't find any.
> >> + */
> >> +const struct drm_edid *drm_edid_read_acpi(struct drm_connector *connector)
> >> +{
> >> +	const struct drm_edid *drm_edid;
> >> +
> >> +	if (connector->force == DRM_FORCE_OFF)
> >> +		return NULL;
> >> +
> >> +	drm_edid = drm_edid_read_custom(connector, drm_do_probe_acpi_edid, connector);
> >> +
> >> +	/* Note: Do *not* call connector updates here. */
> >> +
> >> +	return drm_edid;
> >> +}
> >> +EXPORT_SYMBOL(drm_edid_read_acpi);
> >> +
> >>   /**
> >>    * drm_edid_read_custom - Read EDID data using given EDID block read function
> >>    * @connector: Connector to use
> >> @@ -2727,10 +2811,11 @@ const struct drm_edid *drm_edid_read_ddc(struct drm_connector *connector,
> >>   EXPORT_SYMBOL(drm_edid_read_ddc);
> >>   
> >>   /**
> >> - * drm_edid_read - Read EDID data using connector's I2C adapter
> >> + * drm_edid_read - Read EDID data using BIOS or connector's I2C adapter
> >>    * @connector: Connector to use
> >>    *
> >> - * Read EDID using the connector's I2C adapter.
> >> + * Read EDID from BIOS if allowed by connector or by using the connector's
> >> + * I2C adapter.
> >>    *
> >>    * The EDID may be overridden using debugfs override_edid or firmware EDID
> >>    * (drm_edid_load_firmware() and drm.edid_firmware parameter), in this priority
> >> @@ -2742,10 +2827,18 @@ EXPORT_SYMBOL(drm_edid_read_ddc);
> >>    */
> >>   const struct drm_edid *drm_edid_read(struct drm_connector *connector)
> >>   {
> >> +	const struct drm_edid *drm_edid = NULL;
> >> +
> >>   	if (drm_WARN_ON(connector->dev, !connector->ddc))
> >>   		return NULL;
> >>   
> >> -	return drm_edid_read_ddc(connector, connector->ddc);
> >> +	if (connector->acpi_edid_allowed)
> > 
> > That should probably be called 'prefer_acpi_edid' or something
> > since it's the first choice when the flag is set.
> 
> OK.
> 
> > 
> > But I'm not so sure there's any real benefit in having this
> > flag at all. You anyway have to modify the driver to use this,
> > so why not just have the driver do the call directly instead of
> > adding this extra detour via the flag?
> 
> This was proposed by Maxime Ripard during v4.
> 
> https://lore.kernel.org/dri-devel/ysm2e3vczov7z7vezmexe35fjnkhsakud3elsgggedhk2lknlz@cx7j44y354db/

Which somewhat ignores Jani's concerns about potentially
bogus EDIDs coming from ACPI, as well as not allowing
the driver to dictate the priority between ACPI vs. DDC
vs. whatever else methods are available. Eg. i915 has
at least one other place where it could get the EDID.
So I don't think i915 could use this version.

But as long we still have the individual methods available
as separate exported functions I suppose drivers can still
choose to stitch their own thing together.

I just don't see much point in having that midlayer.
I don't think drivers can just plug that thing straight
into an existing vfunc or can they? If not, then they still
have to implement the actual function where it gets called.
And once you're doing that, calling two functions instead of
one seems about the same amount of work as setting that flag.

But if people think it's actually useful for them
I won't stand in the way.

> 
> > 
> >> +		drm_edid = drm_edid_read_acpi(connector);
> >> +
> >> +	if (!drm_edid)
> >> +		drm_edid = drm_edid_read_ddc(connector, connector->ddc);
> >> +
> >> +	return drm_edid;
> >>   }
> >>   EXPORT_SYMBOL(drm_edid_read);
> >>   
> >> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> >> index fe88d7fc6b8f..74ed47f37a69 100644
> >> --- a/include/drm/drm_connector.h
> >> +++ b/include/drm/drm_connector.h
> >> @@ -1886,6 +1886,12 @@ struct drm_connector {
> >>   
> >>   	/** @hdr_sink_metadata: HDR Metadata Information read from sink */
> >>   	struct hdr_sink_metadata hdr_sink_metadata;
> >> +
> >> +	/**
> >> +	 * @acpi_edid_allowed: Get the EDID from the BIOS, if available.
> >> +	 * This is only applicable to eDP and LVDS displays.
> >> +	 */
> >> +	bool acpi_edid_allowed;
> > 
> > Aren't there other bools/small stuff in there for tighter packing?
> 
> Does the compiler automatically do the packing if you put bools nearby 
> in a struct?  If so; TIL.

Yes. Well, depends on the types and their alignment requirements
of course, and/or whether you specified __packed or not.

You can use 'pahole' to find the holes in structures.

> 
> > 
> >>   };
> >>   
> >>   #define obj_to_connector(x) container_of(x, struct drm_connector, base)
> >> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> >> index 7923bc00dc7a..1c1ee927de9c 100644
> >> --- a/include/drm/drm_edid.h
> >> +++ b/include/drm/drm_edid.h
> >> @@ -459,5 +459,6 @@ bool drm_edid_is_digital(const struct drm_edid *drm_edid);
> >>   
> >>   const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
> >>   				  int ext_id, int *ext_index);
> >> +const struct drm_edid *drm_edid_read_acpi(struct drm_connector *connector);
> >>   
> >>   #endif /* __DRM_EDID_H__ */
> >> -- 
> >> 2.34.1
> > 

-- 
Ville Syrjälä
Intel
