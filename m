Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAED21808DE
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 21:12:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3A36E8D7;
	Tue, 10 Mar 2020 20:12:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA1316E8D7;
 Tue, 10 Mar 2020 20:12:06 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Mar 2020 13:11:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,538,1574150400"; d="scan'208";a="353700766"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 10 Mar 2020 13:11:52 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 10 Mar 2020 22:11:51 +0200
Date: Tue, 10 Mar 2020 22:11:51 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v3] drm/i915/mst: Hookup DRM DP MST
 late_register/early_unregister callbacks
Message-ID: <20200310201151.GS13686@intel.com>
References: <20200310185417.1588984-1-lyude@redhat.com>
 <20200310195122.1590925-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310195122.1590925-1-lyude@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, Manasi Navare <manasi.d.navare@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, "Lee, Shawn C" <shawn.c.lee@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 10, 2020 at 03:51:21PM -0400, Lyude Paul wrote:
> i915 can enable aux device nodes for DP MST by calling
> drm_dp_mst_connector_late_register()/drm_dp_mst_connector_early_unregiste=
r(),
> so let's hook that up.
> =

> Changes since v1:
> * Call intel_connector_register/unregister() from
>   intel_dp_mst_connector_late_register/unregister() so we don't lose
>   error injection - Ville Syrj=E4l=E4
> Changes since v2:
> * Don't forget to clean up if intel_connector_register() fails - Ville
> =

> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Cc: "Lee, Shawn C" <shawn.c.lee@intel.com>
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 33 +++++++++++++++++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/dr=
m/i915/display/intel_dp_mst.c
> index d53978ed3c12..e08caca658c6 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -548,12 +548,41 @@ static int intel_dp_mst_get_ddc_modes(struct drm_co=
nnector *connector)
>  	return ret;
>  }
>  =

> +static int
> +intel_dp_mst_connector_late_register(struct drm_connector *connector)
> +{
> +	struct intel_connector *intel_connector =3D to_intel_connector(connecto=
r);
> +	int ret;
> +
> +	ret =3D drm_dp_mst_connector_late_register(connector,
> +						 intel_connector->port);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D intel_connector_register(connector);
> +	if (ret < 0)
> +		drm_dp_mst_connector_early_unregister(connector,
> +						      intel_connector->port);
> +
> +	return ret;
> +}
> +
> +static void
> +intel_dp_mst_connector_early_unregister(struct drm_connector *connector)
> +{
> +	struct intel_connector *intel_connector =3D to_intel_connector(connecto=
r);
> +
> +	intel_connector_unregister(connector);
> +	drm_dp_mst_connector_early_unregister(connector,
> +					      intel_connector->port);
> +}
> +
>  static const struct drm_connector_funcs intel_dp_mst_connector_funcs =3D=
 {
>  	.fill_modes =3D drm_helper_probe_single_connector_modes,
>  	.atomic_get_property =3D intel_digital_connector_atomic_get_property,
>  	.atomic_set_property =3D intel_digital_connector_atomic_set_property,
> -	.late_register =3D intel_connector_register,
> -	.early_unregister =3D intel_connector_unregister,
> +	.late_register =3D intel_dp_mst_connector_late_register,
> +	.early_unregister =3D intel_dp_mst_connector_early_unregister,
>  	.destroy =3D intel_connector_destroy,
>  	.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_state,
>  	.atomic_duplicate_state =3D intel_digital_connector_duplicate_state,
> -- =

> 2.24.1

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
