Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A678511E2BD
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 12:25:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2F4898C8;
	Fri, 13 Dec 2019 11:25:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2554889872;
 Fri, 13 Dec 2019 11:25:08 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Dec 2019 03:25:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,309,1571727600"; d="scan'208";a="226258655"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 13 Dec 2019 03:25:03 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 13 Dec 2019 13:25:02 +0200
Date: Fri, 13 Dec 2019 13:25:02 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v2 11/12] drm/i915: Expose HDCP shim functions from dp
 for use by dp_mst
Message-ID: <20191213112502.GX1208@intel.com>
References: <20191212190230.188505-1-sean@poorly.run>
 <20191212190230.188505-12-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191212190230.188505-12-sean@poorly.run>
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
Cc: intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 12, 2019 at 02:02:29PM -0500, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> =

> These functions are all the same for dp and dp_mst, so expose them for
> use by the dp_mst hdcp implementation.
> =

> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20191203173638.94919-=
11-sean@poorly.run #v1
> =

> Changes in v2:
> -none
> ---
>  .../drm/i915/display/intel_display_types.h    | 22 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_dp.c       | 14 ++----------
>  2 files changed, 24 insertions(+), 12 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers=
/gpu/drm/i915/display/intel_display_types.h
> index ac5af925e403..b9e1f4638ff2 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h

Don't we have have intel_dp.h these days?

In fact might be nice to lift all the DP hdcp stuff into its own file.
But not sure if that's doable or not.

> @@ -1636,4 +1636,26 @@ static inline u32 intel_plane_ggtt_offset(const st=
ruct intel_plane_state *state)
>  	return i915_ggtt_offset(state->vma);
>  }
>  =

> +int intel_dp_hdcp_write_an_aksv(struct intel_digital_port *intel_dig_por=
t,
> +				u8 *an);
> +int intel_dp_hdcp_read_bksv(struct intel_digital_port *intel_dig_port,
> +			    u8 *bksv);
> +int intel_dp_hdcp_read_bstatus(struct intel_digital_port *intel_dig_port,
> +				      u8 *bstatus);
> +int intel_dp_hdcp_read_bcaps(struct intel_digital_port *intel_dig_port,
> +			     u8 *bcaps);
> +int intel_dp_hdcp_repeater_present(struct intel_digital_port *intel_dig_=
port,
> +				   bool *repeater_present);
> +int intel_dp_hdcp_read_ri_prime(struct intel_digital_port *intel_dig_por=
t,
> +				u8 *ri_prime);
> +int intel_dp_hdcp_read_ksv_ready(struct intel_digital_port *intel_dig_po=
rt,
> +				 bool *ksv_ready);
> +int intel_dp_hdcp_read_ksv_fifo(struct intel_digital_port *intel_dig_por=
t,
> +				int num_downstream, u8 *ksv_fifo);
> +int intel_dp_hdcp_read_v_prime_part(struct intel_digital_port *intel_dig=
_port,
> +				    int i, u32 *part);
> +bool intel_dp_hdcp_check_link(struct intel_digital_port *intel_dig_port);
> +int intel_dp_hdcp_capable(struct intel_digital_port *intel_dig_port,
> +			  bool *hdcp_capable);
> +
>  #endif /*  __INTEL_DISPLAY_TYPES_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 155067657e23..3d62b1b7224e 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -5915,7 +5915,6 @@ static void intel_dp_hdcp_wait_for_cp_irq(struct in=
tel_hdcp *hdcp, int timeout)
>  		DRM_DEBUG_KMS("Timedout at waiting for CP_IRQ\n");
>  }
>  =

> -static
>  int intel_dp_hdcp_write_an_aksv(struct intel_digital_port *intel_dig_por=
t,
>  				u8 *an)
>  {
> @@ -5947,8 +5946,7 @@ int intel_dp_hdcp_write_an_aksv(struct intel_digita=
l_port *intel_dig_port,
>  	return 0;
>  }
>  =

> -static int intel_dp_hdcp_read_bksv(struct intel_digital_port *intel_dig_=
port,
> -				   u8 *bksv)
> +int intel_dp_hdcp_read_bksv(struct intel_digital_port *intel_dig_port, u=
8 *bksv)
>  {
>  	ssize_t ret;
>  	ret =3D drm_dp_dpcd_read(&intel_dig_port->dp.aux, DP_AUX_HDCP_BKSV, bks=
v,
> @@ -5960,7 +5958,7 @@ static int intel_dp_hdcp_read_bksv(struct intel_dig=
ital_port *intel_dig_port,
>  	return 0;
>  }
>  =

> -static int intel_dp_hdcp_read_bstatus(struct intel_digital_port *intel_d=
ig_port,
> +int intel_dp_hdcp_read_bstatus(struct intel_digital_port *intel_dig_port,
>  				      u8 *bstatus)
>  {
>  	ssize_t ret;
> @@ -5978,7 +5976,6 @@ static int intel_dp_hdcp_read_bstatus(struct intel_=
digital_port *intel_dig_port,
>  	return 0;
>  }
>  =

> -static
>  int intel_dp_hdcp_read_bcaps(struct intel_digital_port *intel_dig_port,
>  			     u8 *bcaps)
>  {
> @@ -5994,7 +5991,6 @@ int intel_dp_hdcp_read_bcaps(struct intel_digital_p=
ort *intel_dig_port,
>  	return 0;
>  }
>  =

> -static
>  int intel_dp_hdcp_repeater_present(struct intel_digital_port *intel_dig_=
port,
>  				   bool *repeater_present)
>  {
> @@ -6009,7 +6005,6 @@ int intel_dp_hdcp_repeater_present(struct intel_dig=
ital_port *intel_dig_port,
>  	return 0;
>  }
>  =

> -static
>  int intel_dp_hdcp_read_ri_prime(struct intel_digital_port *intel_dig_por=
t,
>  				u8 *ri_prime)
>  {
> @@ -6023,7 +6018,6 @@ int intel_dp_hdcp_read_ri_prime(struct intel_digita=
l_port *intel_dig_port,
>  	return 0;
>  }
>  =

> -static
>  int intel_dp_hdcp_read_ksv_ready(struct intel_digital_port *intel_dig_po=
rt,
>  				 bool *ksv_ready)
>  {
> @@ -6039,7 +6033,6 @@ int intel_dp_hdcp_read_ksv_ready(struct intel_digit=
al_port *intel_dig_port,
>  	return 0;
>  }
>  =

> -static
>  int intel_dp_hdcp_read_ksv_fifo(struct intel_digital_port *intel_dig_por=
t,
>  				int num_downstream, u8 *ksv_fifo)
>  {
> @@ -6062,7 +6055,6 @@ int intel_dp_hdcp_read_ksv_fifo(struct intel_digita=
l_port *intel_dig_port,
>  	return 0;
>  }
>  =

> -static
>  int intel_dp_hdcp_read_v_prime_part(struct intel_digital_port *intel_dig=
_port,
>  				    int i, u32 *part)
>  {
> @@ -6090,7 +6082,6 @@ int intel_dp_hdcp_toggle_signalling(struct intel_di=
gital_port *intel_dig_port,
>  	return 0;
>  }
>  =

> -static
>  bool intel_dp_hdcp_check_link(struct intel_digital_port *intel_dig_port)
>  {
>  	ssize_t ret;
> @@ -6106,7 +6097,6 @@ bool intel_dp_hdcp_check_link(struct intel_digital_=
port *intel_dig_port)
>  	return !(bstatus & (DP_BSTATUS_LINK_FAILURE | DP_BSTATUS_REAUTH_REQ));
>  }
>  =

> -static
>  int intel_dp_hdcp_capable(struct intel_digital_port *intel_dig_port,
>  			  bool *hdcp_capable)
>  {
> -- =

> Sean Paul, Software Engineer, Google / Chromium OS

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
