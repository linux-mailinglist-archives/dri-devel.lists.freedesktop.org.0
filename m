Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E04F317F715
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 13:07:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2806E1CE;
	Tue, 10 Mar 2020 12:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A551C6E1CE
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 12:07:41 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Mar 2020 05:07:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,536,1574150400"; d="scan'208";a="234330305"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 10 Mar 2020 05:07:38 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 10 Mar 2020 14:07:37 +0200
Date: Tue, 10 Mar 2020 14:07:37 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH] drm/panel-simple: Fix dotclock for Ortustech COM37H3M
Message-ID: <20200310120737.GC13686@intel.com>
References: <e63a0533ad5b5142373437ef758aedbdb716152d.1583826198.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e63a0533ad5b5142373437ef758aedbdb716152d.1583826198.git.hns@goldelico.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 letux-kernel@openphoenux.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 10, 2020 at 08:43:19AM +0100, H. Nikolaus Schaller wrote:
> The currently listed dotclock disagrees with the currently
> listed vrefresh rate. Change the dotclock to match the vrefresh.
> =

> There are two variants of the COM37H3M panel.
> The older one's COM37H3M05DTC data sheet specifies:
> =

>                          MIN      TYP     MAX
> CLK frequency    fCLK     --       22.4    26.3 MHz (in VGA mode)
> VSYNC Frequency  fVSYNC   54       60      66   Hz
> VSYNC cycle time tv       --      650      --   H
> HSYNC frequency  fHSYNC   --       39.3    --   kHz
> HSYNC cycle time th       --      570      --   CLK
> =

> The newer one's COM37H3M99DTC data sheet says:
> =

>                          MIN      TYP     MAX
> CLK frequency    fCLK     18       19.8    27   MHz
> VSYNC Frequency  fVSYNC   54       60      66   Hz
> VSYNC cycle time tv      646      650     700   H
> HSYNC frequency  fHSYNC  --        39.0    50.0 kHz
> HSYNC cycle time th      504      508     630   CLK
> =

> So we choose a parameter set that lies within the specs
> of both variants. We start at .vrefresh =3D 60,
> choose .htotal =3D 570 and .vtotal =3D 650 and end up
> in a clock of 22.230 MHz.
> =

> Reported-by: Ville Syrjala <ville.syrjala@linux.intel.com>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> =

> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel=
/panel-simple.c
> index e14c14ac62b5..b4cb23d4898d 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2390,15 +2390,15 @@ static const struct panel_desc ontat_yx700wv03 =
=3D {
>  };
>  =

>  static const struct drm_display_mode ortustech_com37h3m_mode  =3D {
> -	.clock =3D 22153,
> +	.clock =3D 22230,
>  	.hdisplay =3D 480,
> -	.hsync_start =3D 480 + 8,
> -	.hsync_end =3D 480 + 8 + 10,
> -	.htotal =3D 480 + 8 + 10 + 10,
> +	.hsync_start =3D 480 + 40,
> +	.hsync_end =3D 480 + 40 + 10,
> +	.htotal =3D 480 + 40 + 10 + 40,
>  	.vdisplay =3D 640,
>  	.vsync_start =3D 640 + 4,
> -	.vsync_end =3D 640 + 4 + 3,
> -	.vtotal =3D 640 + 4 + 3 + 4,
> +	.vsync_end =3D 640 + 4 + 2,
> +	.vtotal =3D 640 + 4 + 2 + 4,
>  	.vrefresh =3D 60,

Numbers look consistent.

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

>  	.flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
>  };
> -- =

> 2.23.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
