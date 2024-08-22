Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA23895AD38
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 08:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA39310E71D;
	Thu, 22 Aug 2024 06:12:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="Cep8Ey4o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E798110E71D;
 Thu, 22 Aug 2024 06:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1724307121;
 bh=Ll0eFfhpuU1oGsENGFevzKkMJM5AObXPdlRvemU7hAQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cep8Ey4o6M6YW/t02LL6UYFETAes5hQ3OJKAmlgFjfqozTxhWCHyaaBCbxJPkrdmS
 4mwHH4AkHN98jFgmVfqa7ETAJ+kU2xWcTKhJ252YQFd9m6WeSa1SyCU6ODUXjUSVNK
 Xy2ey4n80U8f+mnjL61epR3f007yq+l8Nkauycrw=
Date: Thu, 22 Aug 2024 08:12:01 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Matt Hartley <matt.hartley@gmail.com>, 
 Kieran Levin <ktl@framework.net>, Hans de Goede <hdegoede@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Xinhui Pan <Xinhui.Pan@amd.com>, 
 Jonathan Corbet <corbet@lwn.net>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Dustin Howett <dustin@howett.net>,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 1/4] drm: Add panel backlight quirks
Message-ID: <f3dac7f6-22ee-483e-b2f3-3a1c900c3f06@t-8ch.de>
References: <20240818-amdgpu-min-backlight-quirk-v5-0-b6c0ead0c73d@weissschuh.net>
 <20240818-amdgpu-min-backlight-quirk-v5-1-b6c0ead0c73d@weissschuh.net>
 <5363536d-0f96-4e96-8f1f-c8e1799b6421@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5363536d-0f96-4e96-8f1f-c8e1799b6421@amd.com>
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

On 2024-08-21 15:51:17+0000, Mario Limonciello wrote:
> On 8/18/2024 01:56, Thomas Weißschuh wrote:
> > Panels using a PWM-controlled backlight source do not have a standard
> > way to communicate their valid PWM ranges.
> > On x86 the ranges are read from ACPI through driver-specific tables.
> > The built-in ranges are not necessarily correct, or may grow stale if an
> > older device can be retrofitted with newer panels.
> > 
> > Add a quirk infrastructure with which the minimum valid backlight value
> > can be maintained as part of the kernel.
> > 
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > Tested-by: Dustin L. Howett <dustin@howett.net>
> 
> One small nit below but otherwise this patch is fine to me.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> 
> > ---
> >   Documentation/gpu/drm-kms-helpers.rst        |  3 ++
> >   drivers/gpu/drm/Kconfig                      |  4 ++
> >   drivers/gpu/drm/Makefile                     |  1 +
> >   drivers/gpu/drm/drm_panel_backlight_quirks.c | 70 ++++++++++++++++++++++++++++
> >   include/drm/drm_utils.h                      |  4 ++
> >   5 files changed, 82 insertions(+)
> > 
> > diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
> > index 8435e8621cc0..a26989500129 100644
> > --- a/Documentation/gpu/drm-kms-helpers.rst
> > +++ b/Documentation/gpu/drm-kms-helpers.rst
> > @@ -230,6 +230,9 @@ Panel Helper Reference
> >   .. kernel-doc:: drivers/gpu/drm/drm_panel_orientation_quirks.c
> >      :export:
> > +.. kernel-doc:: drivers/gpu/drm/drm_panel_backlight_quirks.c
> > +   :export:
> > +
> >   Panel Self Refresh Helper Reference
> >   ===================================
> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > index 6b2c6b91f962..9ebb8cdb535e 100644
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -454,6 +454,10 @@ config DRM_HYPERV
> >   config DRM_EXPORT_FOR_TESTS
> >   	bool
> > +# Separate option as not all DRM drivers use it
> > +config DRM_PANEL_BACKLIGHT_QUIRKS
> > +	tristate
> > +
> >   config DRM_LIB_RANDOM
> >   	bool
> >   	default n
> > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > index 68cc9258ffc4..adf85999aee2 100644
> > --- a/drivers/gpu/drm/Makefile
> > +++ b/drivers/gpu/drm/Makefile
> > @@ -92,6 +92,7 @@ drm-$(CONFIG_DRM_PANIC) += drm_panic.o
> >   obj-$(CONFIG_DRM)	+= drm.o
> >   obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
> > +obj-$(CONFIG_DRM_PANEL_BACKLIGHT_QUIRKS) += drm_panel_backlight_quirks.o
> >   #
> >   # Memory-management helpers
> > diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/drm/drm_panel_backlight_quirks.c
> > new file mode 100644
> > index 000000000000..6b8bbed77c7f
> > --- /dev/null
> > +++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
> > @@ -0,0 +1,70 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <linux/array_size.h>
> > +#include <linux/dmi.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <drm/drm_edid.h>
> > +#include <drm/drm_utils.h>
> > +
> > +struct drm_panel_min_backlight_quirk {
> > +	struct {
> > +		enum dmi_field field;
> > +		const char * const value;
> > +	} dmi_match;
> > +	struct drm_edid_ident ident;
> > +	u8 min_brightness;
> > +};
> > +
> > +static const struct drm_panel_min_backlight_quirk drm_panel_min_backlight_quirks[] = {
> > +};
> > +
> > +static bool drm_panel_min_backlight_quirk_matches(const struct drm_panel_min_backlight_quirk *quirk,
> > +						  const struct drm_edid *edid)
> > +{
> > +	if (!dmi_match(quirk->dmi_match.field, quirk->dmi_match.value))
> > +		return false;
> > +
> > +	if (!drm_edid_match(edid, &quirk->ident))
> > +		return false;
> > +
> > +	return true;
> > +}
> > +
> > +/**
> > + * drm_get_panel_min_brightness_quirk - Get minimum supported brightness level for a panel.
> > + * @edid: EDID of the panel to check
> > + *
> > + * This function checks for platform specific (e.g. DMI based) quirks
> > + * providing info on the minimum backlight brightness for systems where this
> > + * cannot be probed correctly from the hard-/firm-ware.
> > + *
> > + * Returns:
> > + * A negative error value or
> > + * an override value in the range [0, 255] representing 0-100% to be scaled to
> > + * the drivers target range.
> > + */
> > +int drm_get_panel_min_brightness_quirk(const struct drm_edid *edid)
> > +{
> > +	const struct drm_panel_min_backlight_quirk *quirk;
> > +	size_t i;
> 
> Nit: this doesn't really seem like it needs to be size_t.  Shouldn't it just
> be an unsigned int?

ARRAY_SIZE() works with sizeof() which returns size_t.
It doesn't really matter, but I slightly prefer to keep the size_t.

> > +
> > +	if (!IS_ENABLED(CONFIG_DMI))
> > +		return -ENODATA;
> > +
> > +	if (!edid)
> > +		return -EINVAL;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(drm_panel_min_backlight_quirks); i++) {
> > +		quirk = &drm_panel_min_backlight_quirks[i];
> > +
> > +		if (drm_panel_min_backlight_quirk_matches(quirk, edid))
> > +			return quirk->min_brightness;
> > +	}
> > +
> > +	return -ENODATA;
> > +}
> > +EXPORT_SYMBOL(drm_get_panel_min_brightness_quirk);
> > +
> > +MODULE_DESCRIPTION("Quirks for panel backlight overrides");
> > +MODULE_LICENSE("GPL");
> > diff --git a/include/drm/drm_utils.h b/include/drm/drm_utils.h
> > index 70775748d243..15fa9b6865f4 100644
> > --- a/include/drm/drm_utils.h
> > +++ b/include/drm/drm_utils.h
> > @@ -12,8 +12,12 @@
> >   #include <linux/types.h>
> > +struct drm_edid;
> > +
> >   int drm_get_panel_orientation_quirk(int width, int height);
> > +int drm_get_panel_min_brightness_quirk(const struct drm_edid *edid);
> > +
> >   signed long drm_timeout_abs_to_jiffies(int64_t timeout_nsec);
> >   #endif
> > 
> 
