Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B33A2EB1C
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 12:31:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9656410E176;
	Mon, 10 Feb 2025 11:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bGx8yZAO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5689610E176
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 11:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739187105; x=1770723105;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=uD24vpMHjIDvnNg9Yk5gleO0qA/L2sqeXXlSpc2KcRc=;
 b=bGx8yZAOQj3QeXQlp1uu6JRlxN56AqxE7D7PL4Nj2cKJFZbo6gWCT8HQ
 RhP1dT9u1FPV3GgzvuzFqxt/eQTcverHBhBcmhXbs9U0EevxRJTO+rgnz
 y1BtSkVqxYQ2/myDJrONPurRHH05apWjd796AK1GIt8cSdEcep1C+P8iB
 X3PP2KU3HLO4VokWi9sbj1lC6XSi2j4LP0BzmvnHDhH3iuo//p+lkHTvo
 XShMhertwbUhTI04XqUkecoB335UKKN4f3tJQGUDInRir+Knq1JXq7aeJ
 OVtk+DgP4J1J1O+RxtRELKsStO9TRC1uoYm8Ur3K6vL4xHdFwmkP5PDbN g==;
X-CSE-ConnectionGUID: hY85Z9VkQ9SUchKZa9K4BQ==
X-CSE-MsgGUID: pdg7gwLWTsS9UubADseO+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="50401476"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="50401476"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 03:31:45 -0800
X-CSE-ConnectionGUID: Y1wboBuoQ4Wpsg8HqlW5tQ==
X-CSE-MsgGUID: MpoMJlTqQwSp7FuMSscSbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117376393"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.244])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 03:31:41 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Egor Vorontsov <sdoregor@sdore.me>, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Egor Vorontsov <sdoregor@sdore.me>
Subject: Re: [PATCH RESEND] drm/edid: Implement DisplayID Type IX & X timing
 blocks parsing
In-Reply-To: <e60254ec3544d37367c9917bc0e1cd5fdb95248d.camel@sdore.me>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <e60254ec3544d37367c9917bc0e1cd5fdb95248d.camel@sdore.me>
Date: Mon, 10 Feb 2025 13:31:38 +0200
Message-ID: <87o6za3ujp.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 08 Feb 2025, Egor Vorontsov <sdoregor@sdore.me> wrote:
> Some newer high refresh rate consumer monitors (including those by Samsun=
g)
> make use of DisplayID 2.1 timing blocks in their EDID data, notably for
> their highest refresh rate modes. Such modes won't be available as of now.
>
> Implement partial support for such blocks in order to enable native
> support of HRR modes of most such monitors for users without having to re=
ly
> on EDID patching/override (or need thereof).

Thanks for the patch. It appears to do what's desired, but please find
quite a bit of comments inline.

> Link: https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/55

I think "Closes:" is what we want.

> Suggested-by: Maximilian Bo=C3=9Fe <max@bosse.io>
> Signed-off-by: Egor Vorontsov <sdoregor@sdore.me>
>
> ---
>
> The formatting was taken from the neighboring code for consistency,
> thus some warnings.

Sometimes it's good to follow the surrounding code, but let's not
duplicate existing mistakes. ;)

>
> [Resent due to some Spamhaus issues that are now resolved.]
>
>  drivers/gpu/drm/drm_displayid_internal.h | 13 +++++
>  drivers/gpu/drm/drm_edid.c               | 61 ++++++++++++++++++++++++
>  2 files changed, 74 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_displayid_internal.h b/drivers/gpu/drm/d=
rm_displayid_internal.h
> index aee1b86a73c1..a75d0f637b72 100644
> --- a/drivers/gpu/drm/drm_displayid_internal.h
> +++ b/drivers/gpu/drm/drm_displayid_internal.h
> @@ -66,6 +66,7 @@ struct drm_edid;
>  #define DATA_BLOCK_2_STEREO_DISPLAY_INTERFACE	0x27
>  #define DATA_BLOCK_2_TILED_DISPLAY_TOPOLOGY	0x28
>  #define DATA_BLOCK_2_CONTAINER_ID		0x29
> +#define DATA_BLOCK_2_TYPE_10_FORMULA_TIMING	0x2a
>  #define DATA_BLOCK_2_VENDOR_SPECIFIC		0x7e
>  #define DATA_BLOCK_2_CTA_DISPLAY_ID		0x81
>=20=20
> @@ -129,6 +130,18 @@ struct displayid_detailed_timing_block {
>  	struct displayid_detailed_timings_1 timings[];
>  };
>=20=20
> +struct displayid_formula_timings_9 {
> +	u8 flags;
> +	u8 hactive[2];
> +	u8 vactive[2];

Regardless of what was done in struct displayid_detailed_timings_1, I'd
go for defining these as:

	__be16 hactive;
	__be16 vactive;

and using be16_to_cpu() instead of hand-rolling it.

> +	u8 refresh;

Nitpick, I'd go for vrefresh.

> +} __packed;
> +
> +struct displayid_formula_timing_block {
> +	struct displayid_block base;
> +	struct displayid_formula_timings_9 timings[];
> +};

I know it's lacking in struct displayid_detailed_timing_block, but I'd
add __packed here too.

> +
>  #define DISPLAYID_VESA_MSO_OVERLAP	GENMASK(3, 0)
>  #define DISPLAYID_VESA_MSO_MODE		GENMASK(6, 5)
>=20=20
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 13bc4c290b17..8a4dec1d781c 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6833,6 +6833,64 @@ static int add_displayid_detailed_1_modes(struct d=
rm_connector *connector,
>  	return num_modes;
>  }
>=20=20
> +static struct drm_display_mode *drm_mode_displayid_formula(struct drm_de=
vice *dev,
> +							   struct displayid_formula_timings_9 *timings,

const

> +							   bool type_10)
> +{
> +	struct drm_display_mode *mode;
> +	unsigned hactive =3D (timings->hactive[0] | timings->hactive[1] << 8) +=
 1;
> +	unsigned vactive =3D (timings->vactive[0] | timings->vactive[1] << 8) +=
 1;

	u16 hactive =3D be16_to_cpu(timings->hactive) + 1;
        etc.

> +	u8 rb =3D timings->flags & 0b111;

I'd call this formula or algorithm instead of just rb.

Please avoid 0b, it's very rarely used. Just 0x7. Or we could start
defining macros for these in drm_displayid_internal.h...

Please add a blank line between declarations and code here.

> +	/* TODO: support RB-v2 & RB-v3 */
> +	if (rb > 1)
> +		return NULL;
> +
> +	mode =3D drm_cvt_mode(dev, hactive, vactive, timings->refresh, rb =3D=
=3D 1, false, false);

Refresh rate is -1 in the data block, so this needs timings->refresh +
1.

> +	if (!mode)
> +		return NULL;
> +
> +	/* TODO: interpret S3D flags */

More important is TODO for fractional refresh rate indicated by bit 4 of
flags.

> +
> +	mode->type =3D DRM_MODE_TYPE_DRIVER;
> +
> +	if (timings->flags & 0x80)
> +		mode->type |=3D DRM_MODE_TYPE_PREFERRED;

There's no such thing?

> +	drm_mode_set_name(mode);
> +
> +	return mode;
> +}
> +
> +static int add_displayid_formula_modes(struct drm_connector *connector,
> +				       const struct displayid_block *block)
> +{
> +	struct displayid_formula_timing_block *fb =3D (struct displayid_formula=
_timing_block *)block;

Please avoid fb as the name for this. Everyone's going to go all
"framebuffer", wtf, backtrack, oh, "formula block". ;)

This should also be a const pointer. (I know, the detailed modes one
isn't. Let's not duplicate mistakes from there.)

> +	int num_timings;
> +	struct drm_display_mode *newmode;
> +	int num_modes =3D 0;
> +	bool type_10 =3D block->tag =3D=3D DATA_BLOCK_2_TYPE_10_FORMULA_TIMING;
> +	u8 timing_size =3D 6 + ((fb->base.rev & 0x70) >> 4);

I'd go for int timing_size.

Blank line here.

> +	/* extended blocks are not supported yet */
> +	if (timing_size !=3D 6)
> +		return 0;
> +
> +	if (block->num_bytes % timing_size)
> +		return 0;
> +
> +	num_timings =3D block->num_bytes / timing_size;
> +	for (int i =3D 0; i < num_timings; i++) {
> +		struct displayid_formula_timings_9 *timings =3D \

const. Please don't use \ line continuations, it's not necessary.

> +			(struct displayid_formula_timings_9 *)&((u8 *)fb->timings)[i * timing=
_size];

Since we only support the one size for now, and that size is fixed in
struct displayid_formula_timings_9, there's no need to do all this
hackery. Just formula->timings[i].

Whoever fixes this for size 7 might have a better idea how to handle the
size anyway.

> +
> +		newmode =3D drm_mode_displayid_formula(connector->dev, timings, type_1=
0);
> +		if (!newmode)
> +			continue;
> +
> +		drm_mode_probed_add(connector, newmode);
> +		num_modes++;
> +	}
> +	return num_modes;
> +}
> +
>  static int add_displayid_detailed_modes(struct drm_connector *connector,
>  					const struct drm_edid *drm_edid)
>  {
> @@ -6845,6 +6903,9 @@ static int add_displayid_detailed_modes(struct drm_=
connector *connector,
>  		if (block->tag =3D=3D DATA_BLOCK_TYPE_1_DETAILED_TIMING ||
>  		    block->tag =3D=3D DATA_BLOCK_2_TYPE_7_DETAILED_TIMING)
>  			num_modes +=3D add_displayid_detailed_1_modes(connector, block);
> +		else if (block->tag =3D=3D DATA_BLOCK_2_TYPE_9_FORMULA_TIMING ||
> +			 block->tag =3D=3D DATA_BLOCK_2_TYPE_10_FORMULA_TIMING)
> +			num_modes +=3D add_displayid_formula_modes(connector, block);
>  	}
>  	displayid_iter_end(&iter);

--=20
Jani Nikula, Intel
