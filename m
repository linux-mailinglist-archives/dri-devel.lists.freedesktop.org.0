Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EF01F3EB8
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 16:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A0689E9E;
	Tue,  9 Jun 2020 14:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87A589E9E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 14:58:09 +0000 (UTC)
IronPort-SDR: AY6Bm7UFmqThCjfLzt62AhPluISpG7SWzcjTzcxoH9taYQcx/IAwdU1qptRRWEqYCCmdLembJA
 nIn1Vjrrqayg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2020 07:58:09 -0700
IronPort-SDR: tMSN7Nuone8GvvVNmU8W6rqQ5cg9e7QBFaHz1xtf3c0cIhx/GpbXcOVAif3LeSrMB9PI4/7t/W
 dIIUVVJDTIrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,492,1583222400"; d="scan'208";a="314219612"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 09 Jun 2020 07:58:06 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 09 Jun 2020 17:57:45 +0300
Date: Tue, 9 Jun 2020 17:57:45 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Cyrus Lien <cyrus.lien@canonical.com>
Subject: Re: [PATCH] drm/edid: add support for min horizontal rate equal to
 max horizontal rate
Message-ID: <20200609145745.GO6112@intel.com>
References: <20200608195704.29841-1-cyrus.lien@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200608195704.29841-1-cyrus.lien@canonical.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 09, 2020 at 03:57:04AM +0800, Cyrus Lien wrote:
> According to EDID spec, table 3.26, byte #6 and #8, which said "Minimum
> rate value shall be less than or equal to maximum rate value". The minimum
> horizontal/vertical rate value is able to be equal to maximum horizontal/
> veritcal rate value.

How does that justifiy ignoring the min value?

> =

> This change check if h/v-sync excess maximum horizontal/vertical rate if
> hmin equal to hmax or vmin equal to vmax.
> =

> Signed-off-by: Cyrus Lien <cyrus.lien@canonical.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> =

> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index fed653f13c26..23878320eabd 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2674,6 +2674,9 @@ mode_in_hsync_range(const struct drm_display_mode *=
mode,
>  	    hmax +=3D ((t[4] & 0x08) ? 255 : 0);
>  	hsync =3D drm_mode_hsync(mode);
>  =

> +	if (hmax =3D=3D hmin)
> +		return (hsync <=3D hmax);
> +
>  	return (hsync <=3D hmax && hsync >=3D hmin);
>  }
>  =

> @@ -2691,6 +2694,9 @@ mode_in_vsync_range(const struct drm_display_mode *=
mode,
>  	    vmax +=3D ((t[4] & 0x02) ? 255 : 0);
>  	vsync =3D drm_mode_vrefresh(mode);
>  =

> +	if (vmax =3D=3D vmin)
> +		return (vsync <=3D vmax);
> +
>  	return (vsync <=3D vmax && vsync >=3D vmin);
>  }
>  =

> -- =

> 2.25.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
