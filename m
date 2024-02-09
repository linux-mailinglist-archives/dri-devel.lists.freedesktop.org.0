Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A8C84F434
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 12:07:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F22810F0E3;
	Fri,  9 Feb 2024 11:07:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Lt9xkEtQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BAD310F0E3
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 11:07:25 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-40fb17fd179so1926615e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Feb 2024 03:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1707476844; x=1708081644; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PhrnFyHqy0aS26mIHqOzAL9BsMYc94FViF7OPHFoQ/w=;
 b=Lt9xkEtQHfFcydfi2IPfYrMJVIFHhtB7CUskXVDmODACxoTnagSBIf+lFx4f1CmaY6
 j/XjPf1VZa9faAHWgzu/BFVifBL9snEcpXSdp6+1m2GNDNJlW6btF02/wb1942DNVyBj
 dXYmzqqU0bAQgX69FtriFfB/i31mlBoMox/w8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707476844; x=1708081644;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PhrnFyHqy0aS26mIHqOzAL9BsMYc94FViF7OPHFoQ/w=;
 b=GAcIqyXLygGSDwCTdIc/l3xcJs90iWDr7Y7zAAF+WouKOLnflJJNKOqI41EknoUr1g
 +XSvzKUnfcj//pfjsdxDXIfjn37W++TOuiqTEG6LFJqowpoqudAhTp/lYvfKmyIlG6mX
 9DMdqyS4dZt7qws8H48EA0ThRMiNqsjkLUsOzmye/+3Z/Kjyf1BzA0G3kRNMZRMaucTf
 eNzeUv8AQfSMo9e08e91uRZfVhQkBX8EcmaKVJhljPWE+5M1VZ7LTYpgaMorKpGJ8VrQ
 7lu92d09zWsC86kGiBNtpsWe1FRchztzgzAPyqa5T+Zqjov5/Bq4YuEedZtBaNiHePUU
 nAvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBlkmNmSo8jASEzh8zzJyFg44Z6CGn0LZIitr7mwr1xSQEJJh/QELSUD0DJU3h+JMqXhysqbFoUXqf+BrVNO8hspwnJsRe4Kvs5l+UIe4w
X-Gm-Message-State: AOJu0YxGxxsW7F+XHr2Ld/QIa7bJ3uOMQdntlOe1nQle4GgB/jeSO4J9
 Z2ZWepF10AroAkHKOUEEPTSiJcSStYh+96lPf0abUMgMe9J4Q86O4qrVppcHMKU=
X-Google-Smtp-Source: AGHT+IESgQ/XoK3SRZmBXi3b5ikWdz6eVncuVf3cEnstSnjQCV9N/vFouYd2MVwTobjhl48ECI9Ilg==
X-Received: by 2002:adf:e188:0:b0:33b:52cf:ebd5 with SMTP id
 az8-20020adfe188000000b0033b52cfebd5mr761452wrb.5.1707476843780; 
 Fri, 09 Feb 2024 03:07:23 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVtdkordPphCgqyMB+BMAQXrG4CC6BqVcmdmOVeCn/Jn3saUScdVw2KpMv2L9QB9xybAk7EVtRBzqt88YHwPeIRMGdmauy71GqDYAOr80StpMlaw1Ah5p8GY9jA12cnZ/aa6dcwZbJ4NeX/kLY3FuRSNakzQv8cRw1Kg2R/R7VUQOGxpWNmW51Y+DC8aph7B55k2cuYvGO7bzLIFrDtXb3e7Jq9Xra2VTghe8WKHD6mPnG0FuFdnzjZ5D3bEYby11xF8eWCi/0Gc3zgXne2XpRuUGByEXiomn91j7vh7zaLhTyfkbZptNAz71BOn3yYBAmSx372jzuttcbC7nfszh0KNGNPjBprbIl+0tWrvgHlhUButRr5Ri4HExZLRvwkx6JaNm2w9rW7kqrOQ8WzDd5mCw==
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 o15-20020adfeacf000000b0033b5a6b4b9bsm1520956wrn.71.2024.02.09.03.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 03:07:23 -0800 (PST)
Date: Fri, 9 Feb 2024 12:07:21 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Melissa Wen <mwen@igalia.com>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v4 1/3] drm: Add drm_get_acpi_edid() helper
Message-ID: <ZcYHaXNJ8IqbLIra@phenom.ffwll.local>
Mail-Followup-To: Jani Nikula <jani.nikula@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Melissa Wen <mwen@igalia.com>, Dave Airlie <airlied@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20240207224429.104625-1-mario.limonciello@amd.com>
 <20240207224429.104625-2-mario.limonciello@amd.com>
 <87y1bvb7ns.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y1bvb7ns.fsf@intel.com>
X-Operating-System: Linux phenom 6.6.11-amd64 
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

On Thu, Feb 08, 2024 at 11:57:11AM +0200, Jani Nikula wrote:
> On Wed, 07 Feb 2024, Mario Limonciello <mario.limonciello@amd.com> wrote:
> > Some manufacturers have intentionally put an EDID that differs from
> > the EDID on the internal panel on laptops.  Drivers can call this
> > helper to attempt to fetch the EDID from the BIOS's ACPI _DDC method.
> >
> > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > ---
> >  drivers/gpu/drm/Kconfig    |  5 +++
> >  drivers/gpu/drm/drm_edid.c | 77 ++++++++++++++++++++++++++++++++++++++
> >  include/drm/drm_edid.h     |  1 +
> >  3 files changed, 83 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > index 6ec33d36f3a4..ec2bb71e8b36 100644
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -21,6 +21,11 @@ menuconfig DRM
> >  	select KCMP
> >  	select VIDEO_CMDLINE
> >  	select VIDEO_NOMODESET
> > +	select ACPI_VIDEO if ACPI
> > +	select BACKLIGHT_CLASS_DEVICE if ACPI
> > +	select INPUT if ACPI
> > +	select X86_PLATFORM_DEVICES if ACPI && X86
> > +	select ACPI_WMI if ACPI && X86
> 
> I think I'll defer to drm maintainers on whether this is okay or
> something to be avoided.

Uh yeah this is a bit much, and select just messes with everything. Just
#ifdef this in the code with a dummy alternative, if users configure their
kernel without acpi but need it, they get to keep all the pieces.

Alternatively make a DRM_ACPI_HELPERS symbol, but imo a Kconfig for every
function is also not great. And just using #ifdef in the code also works
for CONFIG_OF, which is exactly the same thing for platforms using dt to
describe hw.

Also I'd expect ACPI code to already provide dummy functions if ACPI is
provided, so you probably dont even need all that much #ifdef in the code.

What we defo cant do is select platform/hw stuff just because you enable
CONFIG_DRM.
-Sima

> 
> 
> >  	help
> >  	  Kernel-level support for the Direct Rendering Infrastructure (DRI)
> >  	  introduced in XFree86 4.0. If you say Y here, you need to select
> > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > index 923c4423151c..c649b4f9fd8e 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -28,6 +28,7 @@
> >   * DEALINGS IN THE SOFTWARE.
> >   */
> >  
> > +#include <acpi/video.h>
> >  #include <linux/bitfield.h>
> >  #include <linux/cec.h>
> >  #include <linux/hdmi.h>
> > @@ -2188,6 +2189,49 @@ drm_do_probe_ddc_edid(void *data, u8 *buf, unsigned int block, size_t len)
> >  	return ret == xfers ? 0 : -1;
> >  }
> >  
> > +/**
> > + * drm_do_probe_acpi_edid() - get EDID information via ACPI _DDC
> > + * @data: struct drm_device
> > + * @buf: EDID data buffer to be filled
> > + * @block: 128 byte EDID block to start fetching from
> > + * @len: EDID data buffer length to fetch
> > + *
> > + * Try to fetch EDID information by calling acpi_video_get_edid() function.
> > + *
> > + * Return: 0 on success or error code on failure.
> > + */
> > +static int
> > +drm_do_probe_acpi_edid(void *data, u8 *buf, unsigned int block, size_t len)
> > +{
> > +	struct drm_device *ddev = data;
> > +	struct acpi_device *acpidev = ACPI_COMPANION(ddev->dev);
> > +	unsigned char start = block * EDID_LENGTH;
> > +	void *edid;
> > +	int r;
> > +
> > +	if (!acpidev)
> > +		return -ENODEV;
> > +
> > +	/* fetch the entire edid from BIOS */
> > +	r = acpi_video_get_edid(acpidev, ACPI_VIDEO_DISPLAY_LCD, -1, &edid);
> > +	if (r < 0) {
> > +		DRM_DEBUG_KMS("Failed to get EDID from ACPI: %d\n", r);
> > +		return -EINVAL;
> > +	}
> > +	if (len > r || start > r || start + len > r) {
> > +		r = -EINVAL;
> > +		goto cleanup;
> > +	}
> > +
> > +	memcpy(buf, edid + start, len);
> > +	r = 0;
> > +
> > +cleanup:
> > +	kfree(edid);
> > +
> > +	return r;
> > +}
> > +
> >  static void connector_bad_edid(struct drm_connector *connector,
> >  			       const struct edid *edid, int num_blocks)
> >  {
> > @@ -2643,6 +2687,39 @@ struct edid *drm_get_edid(struct drm_connector *connector,
> >  }
> >  EXPORT_SYMBOL(drm_get_edid);
> >  
> > +/**
> > + * drm_get_acpi_edid - get EDID data, if available
> 
> I'd prefer all the new EDID API to be named drm_edid_*. Makes a clean
> break from the old API, and is more consistent.
> 
> So perhaps drm_edid_read_acpi() to be in line with all the other struct
> drm_edid based EDID reading functions.
> 
> > + * @connector: connector we're probing
> > + *
> > + * Use the BIOS to attempt to grab EDID data if possible.
> > + *
> > + * The returned pointer must be freed using drm_edid_free().
> > + *
> > + * Return: Pointer to valid EDID or NULL if we couldn't find any.
> > + */
> > +const struct drm_edid *drm_get_acpi_edid(struct drm_connector *connector)
> > +{
> > +	const struct drm_edid *drm_edid;
> > +
> > +	switch (connector->connector_type) {
> > +	case DRM_MODE_CONNECTOR_LVDS:
> > +	case DRM_MODE_CONNECTOR_eDP:
> > +		break;
> > +	default:
> > +		return NULL;
> > +	}
> > +
> > +	if (connector->force == DRM_FORCE_OFF)
> > +		return NULL;
> > +
> > +	drm_edid = drm_edid_read_custom(connector, drm_do_probe_acpi_edid, connector->dev);
> > +
> > +	/* Note: Do *not* call connector updates here. */
> > +
> > +	return drm_edid;
> > +}
> > +EXPORT_SYMBOL(drm_get_acpi_edid);
> > +
> >  /**
> >   * drm_edid_read_custom - Read EDID data using given EDID block read function
> >   * @connector: Connector to use
> > diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> > index 7923bc00dc7a..ca41be289fc6 100644
> > --- a/include/drm/drm_edid.h
> > +++ b/include/drm/drm_edid.h
> > @@ -410,6 +410,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
> >  	void *data);
> >  struct edid *drm_get_edid(struct drm_connector *connector,
> >  			  struct i2c_adapter *adapter);
> > +const struct drm_edid *drm_get_acpi_edid(struct drm_connector *connector);
> 
> There's a comment
> 
> /* Interface based on struct drm_edid */
> 
> towards the end of the file, gathering all the new API under it.
> 
> Other than that, LGTM,
> 
> BR,
> Jani.
> 
> >  u32 drm_edid_get_panel_id(struct i2c_adapter *adapter);
> >  struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
> >  				     struct i2c_adapter *adapter);
> 
> -- 
> Jani Nikula, Intel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
