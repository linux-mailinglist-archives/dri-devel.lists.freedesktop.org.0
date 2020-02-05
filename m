Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE8B153604
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 18:12:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 389406E9D2;
	Wed,  5 Feb 2020 17:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FCE36E9D1;
 Wed,  5 Feb 2020 17:12:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Feb 2020 09:12:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,406,1574150400"; d="scan'208";a="264291574"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga002.fm.intel.com with ESMTP; 05 Feb 2020 09:12:36 -0800
Received: from bgsmsx106.gar.corp.intel.com (10.223.43.196) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 5 Feb 2020 09:12:36 -0800
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.97]) by
 BGSMSX106.gar.corp.intel.com ([169.254.1.101]) with mapi id 14.03.0439.000;
 Wed, 5 Feb 2020 22:42:22 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v3 16/17] drm/i915/dp: Add compute routine for DP PSR
 VSC SDP
Thread-Topic: [PATCH v3 16/17] drm/i915/dp: Add compute routine for DP PSR
 VSC SDP
Thread-Index: AQHV2uieWoofwEseyEqfmgCbsDyCzagM2KTw
Date: Wed, 5 Feb 2020 17:12:21 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F823DD16B@BGSMSX104.gar.corp.intel.com>
References: <20200203232014.906651-1-gwan-gyeong.mun@intel.com>
 <20200203232014.906651-17-gwan-gyeong.mun@intel.com>
In-Reply-To: <20200203232014.906651-17-gwan-gyeong.mun@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZTExZTJlZWEtM2ZkNC00ZjBlLTkzMzAtODk2M2FhZDg2ZDgyIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoibzNLUW95UlJRY3NWZ00xdU9RUkgzbEUwMUVBeHdScTdPR0x2T3FYSVI3RmR0Y2N6OGcwOTM2RktjNVo0amNSciJ9
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.223.10.10]
MIME-Version: 1.0
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Gwan-
> gyeong Mun
> Sent: Tuesday, February 4, 2020 4:50 AM
> To: intel-gfx@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org; dri-devel@lists.freedesktop.org
> Subject: [PATCH v3 16/17] drm/i915/dp: Add compute routine for DP PSR VSC SDP
> 
> In order to use a common VSC SDP Colorimetry calculating code on PSR, it adds a
> compute routine for PSR VSC SDP.
> As PSR routine can not use infoframes.vsc of crtc state, it also adds new writing of
> DP SDPs (Secondary Data Packet) for PSR.
> PSR routine has its own scenario and timings of writing a VSC SDP.
> 
> v3: Replace a structure name to drm_dp_vsc_sdp from intel_dp_vsc_sdp

Looks good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 53 +++++++++++++++++++++++++
> drivers/gpu/drm/i915/display/intel_dp.h |  8 ++++
>  2 files changed, 61 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index cffb77daec96..4d65ef36577f 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2463,6 +2463,42 @@ static void intel_dp_compute_vsc_sdp(struct intel_dp
> *intel_dp,
>  					 &crtc_state->infoframes.vsc);
>  }
> 
> +void intel_dp_compute_psr_vsc_sdp(struct intel_dp *intel_dp,
> +				  const struct intel_crtc_state *crtc_state,
> +				  const struct drm_connector_state *conn_state,
> +				  struct drm_dp_vsc_sdp *vsc)
> +{
> +	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
> +
> +	vsc->sdp_type = DP_SDP_VSC;
> +
> +	if (dev_priv->psr.psr2_enabled) {
> +		if (dev_priv->psr.colorimetry_support &&
> +		    intel_dp_needs_vsc_sdp(crtc_state, conn_state)) {
> +			/* [PSR2, +Colorimetry] */
> +			intel_dp_compute_vsc_colorimetry(crtc_state, conn_state,
> +							 vsc);
> +		} else {
> +			/*
> +			 * [PSR2, -Colorimetry]
> +			 * Prepare VSC Header for SU as per eDP 1.4 spec, Table 6-
> 11
> +			 * 3D stereo + PSR/PSR2 + Y-coordinate.
> +			 */
> +			vsc->revision = 0x4;
> +			vsc->length = 0xe;
> +		}
> +	} else {
> +		/*
> +		 * [PSR1]
> +		 * Prepare VSC Header for SU as per DP 1.4 spec, Table 2-118
> +		 * VSC SDP supporting 3D stereo + PSR (applies to eDP v1.3 or
> +		 * higher).
> +		 */
> +		vsc->revision = 0x2;
> +		vsc->length = 0x8;
> +	}
> +}
> +
>  static void
>  intel_dp_compute_hdr_metadata_infoframe_sdp(struct intel_crtc_state
> *crtc_state,
>  					    const struct drm_connector_state
> *conn_state) @@ -4889,6 +4925,23 @@ static void intel_write_dp_sdp(struct
> intel_encoder *encoder,
>  	intel_dig_port->write_infoframe(encoder, crtc_state, type, &sdp, len);  }
> 
> +void intel_write_dp_vsc_sdp(struct intel_encoder *encoder,
> +			    const struct intel_crtc_state *crtc_state,
> +			    struct drm_dp_vsc_sdp *vsc)
> +{
> +	struct intel_digital_port *intel_dig_port = enc_to_dig_port(encoder);
> +	struct dp_sdp sdp = {};
> +	ssize_t len;
> +
> +	len = intel_dp_vsc_sdp_pack(vsc, &sdp, sizeof(sdp));
> +
> +	if (WARN_ON(len < 0))
> +		return;
> +
> +	intel_dig_port->write_infoframe(encoder, crtc_state, DP_SDP_VSC,
> +					&sdp, len);
> +}
> +
>  void intel_dp_set_infoframes(struct intel_encoder *encoder,
>  			     bool enable,
>  			     const struct intel_crtc_state *crtc_state, diff --git
> a/drivers/gpu/drm/i915/display/intel_dp.h
> b/drivers/gpu/drm/i915/display/intel_dp.h
> index 6562bb8edeba..5074e52722c0 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> @@ -18,6 +18,7 @@ struct drm_connector_state;  struct drm_encoder;  struct
> drm_i915_private;  struct drm_modeset_acquire_ctx;
> +struct drm_dp_vsc_sdp;
>  struct intel_connector;
>  struct intel_crtc_state;
>  struct intel_digital_port;
> @@ -110,6 +111,13 @@ int intel_dp_link_required(int pixel_clock, int bpp);  int
> intel_dp_max_data_rate(int max_link_clock, int max_lanes);  bool
> intel_dp_needs_vsc_sdp(const struct intel_crtc_state *crtc_state,
>  			    const struct drm_connector_state *conn_state);
> +void intel_dp_compute_psr_vsc_sdp(struct intel_dp *intel_dp,
> +				  const struct intel_crtc_state *crtc_state,
> +				  const struct drm_connector_state *conn_state,
> +				  struct drm_dp_vsc_sdp *vsc);
> +void intel_write_dp_vsc_sdp(struct intel_encoder *encoder,
> +			    const struct intel_crtc_state *crtc_state,
> +			    struct drm_dp_vsc_sdp *vsc);
>  void intel_dp_set_infoframes(struct intel_encoder *encoder, bool enable,
>  			     const struct intel_crtc_state *crtc_state,
>  			     const struct drm_connector_state *conn_state);
> --
> 2.24.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
