Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39660A362A1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 17:05:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C9F10ECFC;
	Fri, 14 Feb 2025 16:05:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R5F0m4TH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B85210ECFC
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 16:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739549102; x=1771085102;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=tPGnKsTSsJ9kM1YYt80WEh9vN2E3msPM20nio3hN6pg=;
 b=R5F0m4TH1rWGxw2riVqBU5Ig4izd6n3yX1+MAI6s/0WckhfLeIqyuBXR
 N2utMQ8OGATAd0MM/y6m6oeENT5eHFRO5n92963K6b8G+91Kv0IQdgPHm
 moTVnLXuhSDqpA/gooB6mSfXnryQV6GnNfZEYi1nWyFgJzY47DFefkGmi
 cZ6SoB+Oc9IW4JgaG14g9G4YFVnaQV6tOoejamfJRJYlIY5VvlfvpBznQ
 GDr9fkJUEDxHjMXc6ubAX46CRAUPzq+zg/U2ITvGoNntmaZHVb4U/3TlE
 gJFLXJ7ETyoERyGcWwpVgw8CAQbTAqmMO9a5f1LpCBU2xisie+xwclIpH A==;
X-CSE-ConnectionGUID: UOLMs/KjSuqV2Pym+CLxZA==
X-CSE-MsgGUID: X3TXwYy5SHGiy+0lst8FVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40337213"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="40337213"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 08:05:01 -0800
X-CSE-ConnectionGUID: BgH7hRJcSu6uLekeFBYs8w==
X-CSE-MsgGUID: TDrZw5o1Q/qmDokW3HNLVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118113217"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.110])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 08:04:57 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Egor Vorontsov <sdoregor@sdore.me>, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Egor Vorontsov
 <sdoregor@sdore.me>, Maximilian =?utf-8?Q?Bo=C3=9Fe?= <max@bosse.io>
Subject: Re: [PATCH v3 1/2] drm/edid: Implement DisplayID Type IX & X timing
 blocks parsing
In-Reply-To: <20250214110643.506740-1-sdoregor@sdore.me>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250214110643.506740-1-sdoregor@sdore.me>
Date: Fri, 14 Feb 2025 18:04:50 +0200
Message-ID: <87y0y8v7fh.fsf@intel.com>
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

On Fri, 14 Feb 2025, Egor Vorontsov <sdoregor@sdore.me> wrote:
> Some newer high refresh rate consumer monitors (including those by Samsun=
g)
> make use of DisplayID 2.1 timing blocks in their EDID data, notably for
> their highest refresh rate modes. Such modes won't be available as of now.
>
> Implement partial support for such blocks in order to enable native
> support of HRR modes of most such monitors for users without having to re=
ly
> on EDID patching/override (or need thereof).
>
> Closes: https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/55
> Suggested-by: Maximilian Bo=C3=9Fe <max@bosse.io>
> Signed-off-by: Egor Vorontsov <sdoregor@sdore.me>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/drm_displayid_internal.h | 13 +++++
>  drivers/gpu/drm/drm_edid.c               | 63 ++++++++++++++++++++++++
>  2 files changed, 76 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_displayid_internal.h b/drivers/gpu/drm/d=
rm_displayid_internal.h
> index aee1b86a73c1..84831ecfdb6e 100644
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
> +	__le16 hactive;
> +	__le16 vactive;
> +	u8 vrefresh;
> +} __packed;
> +
> +struct displayid_formula_timing_block {
> +	struct displayid_block base;
> +	struct displayid_formula_timings_9 timings[];
> +} __packed;
> +
>  #define DISPLAYID_VESA_MSO_OVERLAP	GENMASK(3, 0)
>  #define DISPLAYID_VESA_MSO_MODE		GENMASK(6, 5)
>=20=20
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 13bc4c290b17..03edf0e1598e 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6833,6 +6833,66 @@ static int add_displayid_detailed_1_modes(struct d=
rm_connector *connector,
>  	return num_modes;
>  }
>=20=20
> +static struct drm_display_mode *drm_mode_displayid_formula(struct drm_de=
vice *dev,
> +							   const struct displayid_formula_timings_9 *timings,
> +							   bool type_10)
> +{
> +	struct drm_display_mode *mode;
> +	u16 hactive =3D le16_to_cpu(timings->hactive) + 1;
> +	u16 vactive =3D le16_to_cpu(timings->vactive) + 1;
> +	u8 timing_formula =3D timings->flags & 0x7;
> +
> +	/* TODO: support RB-v2 & RB-v3 */
> +	if (timing_formula > 1)
> +		return NULL;
> +
> +	/* TODO: support video-optimized refresh rate */
> +	if (timings->flags & (1 << 4))
> +		drm_dbg_kms(dev, "Fractional vrefresh is not implemented, proceeding w=
ith non-video-optimized refresh rate");
> +
> +	mode =3D drm_cvt_mode(dev, hactive, vactive, timings->vrefresh + 1, tim=
ing_formula =3D=3D 1, false, false);
> +	if (!mode)
> +		return NULL;
> +
> +	/* TODO: interpret S3D flags */
> +
> +	mode->type =3D DRM_MODE_TYPE_DRIVER;
> +	drm_mode_set_name(mode);
> +
> +	return mode;
> +}
> +
> +static int add_displayid_formula_modes(struct drm_connector *connector,
> +				       const struct displayid_block *block)
> +{
> +	const struct displayid_formula_timing_block *formula_block =3D (struct =
displayid_formula_timing_block *)block;
> +	int num_timings;
> +	struct drm_display_mode *newmode;
> +	int num_modes =3D 0;
> +	bool type_10 =3D block->tag =3D=3D DATA_BLOCK_2_TYPE_10_FORMULA_TIMING;
> +	int timing_size =3D 6 + ((formula_block->base.rev & 0x70) >> 4);
> +
> +	/* extended blocks are not supported yet */
> +	if (timing_size !=3D 6)
> +		return 0;
> +
> +	if (block->num_bytes % timing_size)
> +		return 0;
> +
> +	num_timings =3D block->num_bytes / timing_size;
> +	for (int i =3D 0; i < num_timings; i++) {
> +		const struct displayid_formula_timings_9 *timings =3D &formula_block->=
timings[i];
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
> @@ -6845,6 +6905,9 @@ static int add_displayid_detailed_modes(struct drm_=
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
