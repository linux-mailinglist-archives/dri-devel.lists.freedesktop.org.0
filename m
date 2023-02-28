Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D6A6A6029
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 21:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A6D110E013;
	Tue, 28 Feb 2023 20:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A04D10E013;
 Tue, 28 Feb 2023 20:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677615032; x=1709151032;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=zq0ZAtl/HTSS7AbslgMzyKwKm0wMYojGH36nengR0nA=;
 b=XRHH3/ATXBuG2Mm4X88iatfqA2LS6Y3xw0m4mLSx3/+tYRS6BfNcWyKI
 6/tiCpMiU2Zyyrvyf9PHFAXehA+5oPvnduSgGaO7AQxrqq1TT50zqKtZm
 AChnOE1jSKRULbujAIKvKEj7oz0qVKiq0ZL6yvJWnxYvRfaN9T6UEVfi4
 cGCPz6Nav9idLubE68hgMWkQOsQUT4NvfylY5WDkzI9yojvlvVKMV0CLO
 /bX1A1Ds1ubKegaXXzCNhiBu97xtFNQw8IX6forq7c2g7FU4z2il81Flb
 xqDYffBQevK5mn6R48ybWQ2m5YMMErAoYF1D1dUWbRr3qJbcTTgAUwO71 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="318037859"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="318037859"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 12:10:31 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="919927780"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="919927780"
Received: from barumuga-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.47.26])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 12:10:29 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm/edid: Fix csync detailed mode parsing
In-Reply-To: <20230227143648.7776-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230227143648.7776-1-ville.syrjala@linux.intel.com>
Date: Tue, 28 Feb 2023 22:10:26 +0200
Message-ID: <87y1ohwnyl.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 27 Feb 2023, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Remove the bogus csync check and replace it with something that:
> - triggers for all forms of csync, not just the basic analog variant
> - actually populates the mode csync flags so that drivers can
>   decide what to do with the mode
>
> Originally the code tried to outright reject csync, but that
> apparently broke some bogus LCD monitor that claimed to have
> a detailed mode that uses analog csync, despite also claiming
> the monitor only support separate sync:
> https://bugzilla.redhat.com/show_bug.cgi?id=3D540024
> Potentially that monitor should just be quirked or something.
>
> Anyways, what we are dealing with now is some kind of funny i915
> JSL machine with eDP where the panel claims to support a sensible
> 60Hz separate sync mode, and a 50Hz mode with bipolar analog
> csync. The 50Hz mode does not work so we want to not use it.
> Easiest way is to just correctly flag it as csync and the driver
> will reject it.
>
> TODO: or should we just reject any form of csync (or at least
> the analog variants) for digital display interfaces?
>
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/8146
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 23 +++++++++++++++--------
>  include/drm/drm_edid.h     | 12 +++++++++---
>  2 files changed, 24 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index ebab862b8b1a..fa20b1107ce3 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3424,10 +3424,6 @@ static struct drm_display_mode *drm_mode_detailed(=
struct drm_connector *connecto
>  			    connector->base.id, connector->name);
>  		return NULL;
>  	}
> -	if (!(pt->misc & DRM_EDID_PT_SEPARATE_SYNC)) {
> -		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Composite sync not supported\n",
> -			    connector->base.id, connector->name);
> -	}
>=20=20
>  	/* it is incorrect if hsync/vsync width is zero */
>  	if (!hsync_pulse_width || !vsync_pulse_width) {
> @@ -3474,10 +3470,21 @@ static struct drm_display_mode *drm_mode_detailed=
(struct drm_connector *connecto
>  	if (info->quirks & EDID_QUIRK_DETAILED_SYNC_PP) {
>  		mode->flags |=3D DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC;
>  	} else {
> -		mode->flags |=3D (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
> -			DRM_MODE_FLAG_PHSYNC : DRM_MODE_FLAG_NHSYNC;
> -		mode->flags |=3D (pt->misc & DRM_EDID_PT_VSYNC_POSITIVE) ?
> -			DRM_MODE_FLAG_PVSYNC : DRM_MODE_FLAG_NVSYNC;
> +		switch (pt->misc & DRM_EDID_PT_SYNC_MASK) {
> +		case DRM_EDID_PT_ANALOG_CSYNC:
> +		case DRM_EDID_PT_BIPOLAR_ANALOG_CSYNC:
> +		case DRM_EDID_PT_DIGITAL_CSYNC:
> +			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Composite sync!\n",
> +				    connector->base.id, connector->name);
> +			mode->flags |=3D DRM_MODE_FLAG_CSYNC | DRM_MODE_FLAG_NCSYNC;

Not sure it makes a huge difference, and I expect this case to be rare,
but what's the _N_ CSYNC based on here?

I also observe the spec appears to indicate "Horizontal Sync is Negative
(outside of V-sync)" and "Horizontal Sync is Positive (outside of
V-sync)" bit is valid also for Digital Composite Sync.

See how the bits for vertical sync have "1 1 0" or "1 1 1" but for
horizontal sync it's "1 _ _ 0" and "1 _ _ 1". Does that indicate the
polarity for digital composite sync?! The spec is not super clear.

> +			break;
> +		case DRM_EDID_PT_DIGITAL_SEPARATE_SYNC:
> +			mode->flags |=3D (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
> +				DRM_MODE_FLAG_PHSYNC : DRM_MODE_FLAG_NHSYNC;
> +			mode->flags |=3D (pt->misc & DRM_EDID_PT_VSYNC_POSITIVE) ?
> +				DRM_MODE_FLAG_PVSYNC : DRM_MODE_FLAG_NVSYNC;

I think this is the good stuff, we shouldn't be looking at these flags
and setting PHSYNC/NHSYNC/PVSYNC/NVSYNC unless we have digital separate
sync.

Overall I think

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Although it's not all completely clear. But I think being explicit is
better than assuming something and simply debug logging about csync and
not really doing anything about it.

> +			break;
> +		}
>  	}
>=20=20
>  set_size:
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 70ae6c290bdc..49ee10272603 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -61,9 +61,15 @@ struct std_timing {
>  	u8 vfreq_aspect;
>  } __attribute__((packed));
>=20=20
> -#define DRM_EDID_PT_HSYNC_POSITIVE (1 << 1)
> -#define DRM_EDID_PT_VSYNC_POSITIVE (1 << 2)
> -#define DRM_EDID_PT_SEPARATE_SYNC  (3 << 3)
> +#define DRM_EDID_PT_SYNC_MASK              (3 << 3)
> +# define DRM_EDID_PT_ANALOG_CSYNC          (0 << 3)
> +# define DRM_EDID_PT_BIPOLAR_ANALOG_CSYNC  (1 << 3)
> +# define DRM_EDID_PT_DIGITAL_CSYNC         (2 << 3)
> +#  define DRM_EDID_PT_CSYNC_ON_RGB         (1 << 1) /* analog csync only=
 */
> +#  define DRM_EDID_PT_CSYNC_SERRATE        (1 << 2)
> +# define DRM_EDID_PT_DIGITAL_SEPARATE_SYNC (3 << 3)
> +#  define DRM_EDID_PT_HSYNC_POSITIVE       (1 << 1)
> +#  define DRM_EDID_PT_VSYNC_POSITIVE       (1 << 2)
>  #define DRM_EDID_PT_STEREO         (1 << 5)
>  #define DRM_EDID_PT_INTERLACED     (1 << 7)

--=20
Jani Nikula, Intel Open Source Graphics Center
