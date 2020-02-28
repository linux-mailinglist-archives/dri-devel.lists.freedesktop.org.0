Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FFF173A7B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 15:58:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7626E02C;
	Fri, 28 Feb 2020 14:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A25C56E02C;
 Fri, 28 Feb 2020 14:58:10 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Feb 2020 06:58:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,496,1574150400"; d="scan'208";a="350934320"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 28 Feb 2020 06:58:07 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 28 Feb 2020 16:58:06 +0200
Date: Fri, 28 Feb 2020 16:58:06 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH resend 2/2] drm/i915/dp: Use BDB_GENERAL_FEATURES VBT
 block info for builtin panel-orientation
Message-ID: <20200228145806.GG13686@intel.com>
References: <20200228114110.187792-1-hdegoede@redhat.com>
 <20200228114110.187792-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200228114110.187792-3-hdegoede@redhat.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 28, 2020 at 12:41:10PM +0100, Hans de Goede wrote:
> Some devices with a builtin panel have the panel mounted upside down,
> this is indicated by the rotate_180 bit in the BDB_GENERAL_FEATURES VBT
> block.
> =

> We store this info in dev_priv->vbt.orientation, use this to set the
> connector's orientation property so that fbcon and userspace will show
> the image the right way up on devices with an upside-down mounted panel.
> =

> This fixes the image being upside-down on a Teclast X89 tablet.
> =

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 2db8d46f61a1..c31f5233941c 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -7608,9 +7608,8 @@ static bool intel_edp_init_connector(struct intel_d=
p *intel_dp,
>  	intel_panel_setup_backlight(connector, pipe);
>  =

>  	if (fixed_mode) {
> -		/* We do not know the orientation, but their might be a quirk */
>  		drm_connector_set_panel_orientation_with_quirk(connector,
> -				DRM_MODE_PANEL_ORIENTATION_UNKNOWN,
> +				dev_priv->vbt.orientation,

That's the non-DSI specific one I presume... yes.

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

>  				fixed_mode->hdisplay, fixed_mode->vdisplay);
>  	}
>  =

> -- =

> 2.24.1

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
