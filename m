Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5249C180720
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 19:42:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0B06E37F;
	Tue, 10 Mar 2020 18:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D79606E37F;
 Tue, 10 Mar 2020 18:42:26 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Mar 2020 11:42:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,538,1574150400"; d="scan'208";a="236134880"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 10 Mar 2020 11:42:21 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 10 Mar 2020 20:42:20 +0200
Date: Tue, 10 Mar 2020 20:42:20 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH] drm/i915/mst: Hookup DRM DP MST
 late_register/early_unregister callbacks
Message-ID: <20200310184220.GO13686@intel.com>
References: <20200310182856.1587752-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310182856.1587752-1-lyude@redhat.com>
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
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Manasi Navare <manasi.d.navare@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, "Lee, Shawn C" <shawn.c.lee@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 10, 2020 at 02:28:54PM -0400, Lyude Paul wrote:
> i915 can enable aux device nodes for DP MST by calling
> drm_dp_mst_connector_late_register()/drm_dp_mst_connector_early_unregiste=
r(),
> so let's hook that up.

Oh, we didn't have that yet? I thought it got hooked up for everyone
but I guess not.

> =

> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Cc: "Lee, Shawn C" <shawn.c.lee@intel.com>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 22 +++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/dr=
m/i915/display/intel_dp_mst.c
> index d53978ed3c12..bcff2e06ead6 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -548,12 +548,30 @@ static int intel_dp_mst_get_ddc_modes(struct drm_co=
nnector *connector)
>  	return ret;
>  }
>  =

> +static int
> +intel_dp_mst_connector_late_register(struct drm_connector *connector)
> +{
> +	struct intel_connector *intel_connector =3D to_intel_connector(connecto=
r);
> +
> +	return drm_dp_mst_connector_late_register(connector,
> +						  intel_connector->port);
> +}
> +
> +static void
> +intel_dp_mst_connector_early_unregister(struct drm_connector *connector)
> +{
> +	struct intel_connector *intel_connector =3D to_intel_connector(connecto=
r);
> +
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

Dunno if we want to lose the error injection...

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
