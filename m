Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F859029C8
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 22:12:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E81910E2A7;
	Mon, 10 Jun 2024 20:12:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="EjkK7y3U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA5EB10E2A7;
 Mon, 10 Jun 2024 20:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1718050361;
 bh=I1Hh+qcmMRJfWvLmvO7pofMH2jbsnSVY2A5MKQ0zG1I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EjkK7y3Ucn6Lpi55NnrvHM8MdR0uWWIlbro80NYBZk5JxC9SvzqzlBbkF9M+2uQt2
 HMRAs3jULLMxi/pHiyO9VVP+fZoblbIxPDf+d9yD1EHTtKdJztAXoikLznzRI07trF
 vwryK5coz1arzS1vWzarler8/rPYUb7OIVw1SsYM=
Date: Mon, 10 Jun 2024 22:12:40 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Kieran Levin <ktl@framework.net>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dustin Howett <dustin@howett.net>, Matt Hartley <matt.hartley@gmail.com>
Subject: Re: [PATCH] drm/amd: force min_input_signal to 0 on Framework AMD
 13/16
Message-ID: <0759ed40-efef-4230-86fc-cdf6702843e6@t-8ch.de>
References: <20240610-amdgpu-min-backlight-quirk-v1-1-8459895a5b2a@weissschuh.net>
 <74f3c189-f3d3-4dca-9357-d4bc8f98da08@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <74f3c189-f3d3-4dca-9357-d4bc8f98da08@amd.com>
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

On 2024-06-10 14:58:02+0000, Mario Limonciello wrote:
> +Kieran
> 
> On 6/10/2024 14:26, Thomas Weißschuh wrote:
> > The value of "min_input_signal" returned from ATIF on a Framework AMD 13
> > is "12". This leads to a fairly bright minimum display backlight.
> > 
> > Introduce a quirk to override "min_input_signal" to "0" which leads to a
> > much lower minimum brightness, which is still readable even in daylight.
> > 
> > Tested on a Framework AMD 13 BIOS 3.05 and Framework AMD 16.
> > 
> > Link: https://community.frame.work/t/25711/9
> > Link: https://community.frame.work/t/47036
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 35 ++++++++++++++++++++++++++++++++
> >   1 file changed, 35 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> > index 7099ff9cf8c5..b481889f7491 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> > @@ -25,6 +25,7 @@
> >   #include <linux/pci.h>
> >   #include <linux/acpi.h>
> >   #include <linux/backlight.h>
> > +#include <linux/dmi.h>
> >   #include <linux/slab.h>
> >   #include <linux/xarray.h>
> >   #include <linux/power_supply.h>
> > @@ -130,6 +131,35 @@ static struct amdgpu_acpi_priv {
> >   	struct amdgpu_atcs atcs;
> >   } amdgpu_acpi_priv;
> > +struct amdgpu_acpi_quirks {
> > +	bool ignore_min_input_signal;
> > +};
> > +
> > +static const struct dmi_system_id amdgpu_acpi_quirk_table[] = {
> > +	{
> > +		/* the Framework Laptop 13 (AMD Ryzen) and 16 (AMD Ryzen) */
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Framework"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "AMD Ryzen"),
> > +			DMI_MATCH(DMI_PRODUCT_FAMILY, "Laptop"),
> > +		},
> 
> Two problems I see:
> 
> 1) This really "should" be fixed in the BIOS. I added Kieran to the thread
> for comments if that's viable.

Agreed!

> 2) IMO this is going to match too liberally across all potential Framework
> models.  If they introduce a refreshed motherboard for either product then
> the quirk would apply to both products when we don't know that such a
> deficiency would exist.

Also agreed.
In addition to be really specific this should also match by display type
(via EDID?).

So far this was only tested with the matte panel.
(I forgot to mention that, sorry)

> You can reference drivers/platform/x86/amd/pmc/pmc-quirks.c for what we used
> for a quirk that was matching against a single product and single BIOS.

Will do for the next revision, but let's gather some feedback first.

> But FWIW if that issue isn't fixed in the next BIOS I think we'll end up
> needing to tear out the BIOS string match and match just the platform.

I'm wondering what the longterm strategy will have to be.
Given that there are different kinds of displays, and new ones will be
released, each new display type will require an update to the firmware.

When there are no firmware updates for a device anymore, but new,
compatible displays are released, then the kernel will need the quirks
again.

> > +		.driver_data = &(struct amdgpu_acpi_quirks) {
> > +			.ignore_min_input_signal = true,
> > +		},
> > +	},
> > +	{}
> > +};
> > +
> > +static const struct amdgpu_acpi_quirks *amdgpu_acpi_get_quirks(void)
> > +{
> > +	const struct dmi_system_id *dmi_id;
> > +
> > +	dmi_id = dmi_first_match(amdgpu_acpi_quirk_table);
> > +	if (!dmi_id)
> > +		return NULL;
> > +	return dmi_id->driver_data;
> > +}
> > +
> >   /* Call the ATIF method
> >    */
> >   /**
> > @@ -1388,6 +1418,7 @@ bool amdgpu_acpi_should_gpu_reset(struct amdgpu_device *adev)
> >    */
> >   void amdgpu_acpi_detect(void)
> >   {
> > +	const struct amdgpu_acpi_quirks *quirks = amdgpu_acpi_get_quirks();
> >   	struct amdgpu_atif *atif = &amdgpu_acpi_priv.atif;
> >   	struct amdgpu_atcs *atcs = &amdgpu_acpi_priv.atcs;
> >   	struct pci_dev *pdev = NULL;
> > @@ -1429,6 +1460,10 @@ void amdgpu_acpi_detect(void)
> >   					ret);
> >   			atif->backlight_caps.caps_valid = false;
> >   		}
> > +		if (quirks && quirks->ignore_min_input_signal) {
> > +			DRM_INFO("amdgpu_acpi quirk: min_input_signal=0\n");
> > +			atif->backlight_caps.min_input_signal = 0;
> > +		}
> >   	} else {
> >   		atif->backlight_caps.caps_valid = false;
> >   	}
> > 
> > ---
> > base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
> > change-id: 20240610-amdgpu-min-backlight-quirk-8402fd8e736a
> > 
> > Best regards,
> 
