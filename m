Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A6333474F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 20:00:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B9CF6E250;
	Wed, 10 Mar 2021 19:00:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB216E250;
 Wed, 10 Mar 2021 19:00:20 +0000 (UTC)
IronPort-SDR: DlpVBf1XpvDpkDUwh5tr4SqBMaFhCSYCEGYgcdIj/og7p4xtrvQh3gtzGOM4iIwohQXjdYfcm+
 eH5cwwyuuKtA==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="168458294"
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="168458294"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 11:00:19 -0800
IronPort-SDR: kSDBTH/8VDfZV+B99y7DfHWSaOidglpaH3vwoVqHyBorRxjayf2LqM2qESdTweKwKLccnLWn2Q
 ylxOWsqb2i7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="403794493"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga008.fm.intel.com with SMTP; 10 Mar 2021 11:00:17 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 10 Mar 2021 21:00:16 +0200
Date: Wed, 10 Mar 2021 21:00:16 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [RFC v1 2/6] drm/displayid: add separate
 drm_displayid.c
Message-ID: <YEkXQHR596NZMQPH@intel.com>
References: <cover.1615297748.git.jani.nikula@intel.com>
 <6c62c8b87ea14bc4dd4d9ecaf9d100afaab3478d.1615297748.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6c62c8b87ea14bc4dd4d9ecaf9d100afaab3478d.1615297748.git.jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 09, 2021 at 03:54:10PM +0200, Jani Nikula wrote:
> We'll be adding more DisplayID specific functions going forward, so
> start off by splitting out a few functions to a separate file.
> =

> We don't bother with exporting the functions; at least for now they
> should be needed solely within drm.ko.
> =

> No functional changes.
> =

> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/Makefile        |  2 +-
>  drivers/gpu/drm/drm_displayid.c | 59 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_edid.c      | 58 ++------------------------------
>  include/drm/drm_displayid.h     |  8 +++++
>  include/drm/drm_edid.h          |  3 ++
>  5 files changed, 73 insertions(+), 57 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_displayid.c
> =

> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 5eb5bf7c16e3..78ef2fd14f10 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -7,7 +7,7 @@ drm-y       :=3D	drm_auth.o drm_cache.o \
>  		drm_file.o drm_gem.o drm_ioctl.o drm_irq.o \
>  		drm_drv.o \
>  		drm_sysfs.o drm_hashtab.o drm_mm.o \
> -		drm_crtc.o drm_fourcc.o drm_modes.o drm_edid.o \
> +		drm_crtc.o drm_fourcc.o drm_modes.o drm_edid.o drm_displayid.o \
>  		drm_encoder_slave.o \
>  		drm_trace_points.o drm_prime.o \
>  		drm_rect.o drm_vma_manager.o drm_flip_work.o \
> diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displa=
yid.c
> new file mode 100644
> index 000000000000..908bbe6feb61
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_displayid.c
> @@ -0,0 +1,59 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =A9 2021 Intel Corporation
> + */
> +
> +#include <drm/drm_displayid.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_print.h>
> +
> +static int validate_displayid(const u8 *displayid, int length, int idx)
> +{
> +	int i, dispid_length;
> +	u8 csum =3D 0;
> +	const struct displayid_hdr *base;
> +
> +	base =3D (const struct displayid_hdr *)&displayid[idx];
> +
> +	DRM_DEBUG_KMS("base revision 0x%x, length %d, %d %d\n",
> +		      base->rev, base->bytes, base->prod_id, base->ext_count);
> +
> +	/* +1 for DispID checksum */
> +	dispid_length =3D sizeof(*base) + base->bytes + 1;
> +	if (dispid_length > length - idx)
> +		return -EINVAL;
> +
> +	for (i =3D 0; i < dispid_length; i++)
> +		csum +=3D displayid[idx + i];
> +	if (csum) {
> +		DRM_NOTE("DisplayID checksum invalid, remainder is %d\n", csum);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +const u8 *drm_find_displayid_extension(const struct edid *edid,
> +				       int *length, int *idx,
> +				       int *ext_index)
> +{
> +	const u8 *displayid =3D drm_find_edid_extension(edid, DISPLAYID_EXT, ex=
t_index);
> +	const struct displayid_hdr *base;
> +	int ret;
> +
> +	if (!displayid)
> +		return NULL;
> +
> +	/* EDID extensions block checksum isn't for us */
> +	*length =3D EDID_LENGTH - 1;
> +	*idx =3D 1;
> +
> +	ret =3D validate_displayid(displayid, *length, *idx);
> +	if (ret)
> +		return NULL;
> +
> +	base =3D (const struct displayid_hdr *)&displayid[*idx];
> +	*length =3D *idx + sizeof(*base) + base->bytes;
> +
> +	return displayid;
> +}
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index d510b827a1f8..58e61f792bc7 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1585,8 +1585,6 @@ module_param_named(edid_fixup, edid_fixup, int, 040=
0);
>  MODULE_PARM_DESC(edid_fixup,
>  		 "Minimum number of valid EDID header bytes (0-8, default 6)");
>  =

> -static int validate_displayid(const u8 *displayid, int length, int idx);
> -
>  static int drm_edid_block_checksum(const u8 *raw_edid)
>  {
>  	int i;
> @@ -3241,8 +3239,8 @@ add_detailed_modes(struct drm_connector *connector,=
 struct edid *edid,
>  /*
>   * Search EDID for CEA extension block.
>   */
> -static const u8 *drm_find_edid_extension(const struct edid *edid,
> -					 int ext_id, int *ext_index)
> +const u8 *drm_find_edid_extension(const struct edid *edid,
> +				  int ext_id, int *ext_index)
>  {
>  	const u8 *edid_ext =3D NULL;
>  	int i;
> @@ -3266,32 +3264,6 @@ static const u8 *drm_find_edid_extension(const str=
uct edid *edid,
>  	return edid_ext;
>  }
>  =

> -
> -static const u8 *drm_find_displayid_extension(const struct edid *edid,
> -					      int *length, int *idx,
> -					      int *ext_index)
> -{
> -	const u8 *displayid =3D drm_find_edid_extension(edid, DISPLAYID_EXT, ex=
t_index);
> -	const struct displayid_hdr *base;
> -	int ret;
> -
> -	if (!displayid)
> -		return NULL;
> -
> -	/* EDID extensions block checksum isn't for us */
> -	*length =3D EDID_LENGTH - 1;
> -	*idx =3D 1;
> -
> -	ret =3D validate_displayid(displayid, *length, *idx);
> -	if (ret)
> -		return NULL;
> -
> -	base =3D (const struct displayid_hdr *)&displayid[*idx];
> -	*length =3D *idx + sizeof(*base) + base->bytes;
> -
> -	return displayid;
> -}
> -
>  static const u8 *drm_find_cea_extension(const struct edid *edid)
>  {
>  	int length, idx;
> @@ -5287,32 +5259,6 @@ u32 drm_add_display_info(struct drm_connector *con=
nector, const struct edid *edi
>  	return quirks;
>  }
>  =

> -static int validate_displayid(const u8 *displayid, int length, int idx)
> -{
> -	int i, dispid_length;
> -	u8 csum =3D 0;
> -	const struct displayid_hdr *base;
> -
> -	base =3D (const struct displayid_hdr *)&displayid[idx];
> -
> -	DRM_DEBUG_KMS("base revision 0x%x, length %d, %d %d\n",
> -		      base->rev, base->bytes, base->prod_id, base->ext_count);
> -
> -	/* +1 for DispID checksum */
> -	dispid_length =3D sizeof(*base) + base->bytes + 1;
> -	if (dispid_length > length - idx)
> -		return -EINVAL;
> -
> -	for (i =3D 0; i < dispid_length; i++)
> -		csum +=3D displayid[idx + i];
> -	if (csum) {
> -		DRM_NOTE("DisplayID checksum invalid, remainder is %d\n", csum);
> -		return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -
>  static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_d=
evice *dev,
>  							    struct displayid_detailed_timings_1 *timings)
>  {
> diff --git a/include/drm/drm_displayid.h b/include/drm/drm_displayid.h
> index f141c0eff083..3c6db22a518a 100644
> --- a/include/drm/drm_displayid.h
> +++ b/include/drm/drm_displayid.h
> @@ -22,6 +22,10 @@
>  #ifndef DRM_DISPLAYID_H
>  #define DRM_DISPLAYID_H
>  =

> +#include <linux/types.h>
> +
> +struct edid;
> +
>  #define DATA_BLOCK_PRODUCT_ID 0x00
>  #define DATA_BLOCK_DISPLAY_PARAMETERS 0x01
>  #define DATA_BLOCK_COLOR_CHARACTERISTICS 0x02
> @@ -100,4 +104,8 @@ struct displayid_detailed_timing_block {
>  	     (idx) +=3D sizeof(struct displayid_block) + (block)->num_bytes, \
>  	     (block) =3D (const struct displayid_block *)&(displayid)[idx])
>  =

> +const u8 *drm_find_displayid_extension(const struct edid *edid,
> +				       int *length, int *idx,
> +				       int *ext_index);
> +
>  #endif
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index a158f585f658..759328a5eeb2 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -543,5 +543,8 @@ struct drm_display_mode *drm_mode_find_dmt(struct drm=
_device *dev,
>  struct drm_display_mode *
>  drm_display_mode_from_cea_vic(struct drm_device *dev,
>  			      u8 video_code);
> +const u8 *drm_find_edid_extension(const struct edid *edid,
> +				  int ext_id, int *ext_index);
> +
>  =

>  #endif /* __DRM_EDID_H__ */
> -- =

> 2.20.1
> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
