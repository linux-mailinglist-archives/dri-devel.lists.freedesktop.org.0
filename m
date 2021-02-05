Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8730E3111A7
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 21:00:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4528C6F4C0;
	Fri,  5 Feb 2021 20:00:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73BC46F4BF;
 Fri,  5 Feb 2021 20:00:49 +0000 (UTC)
IronPort-SDR: tsYzvP5oizzLbtsHBDrA8BCpF3q1n10PXo9CmNqtnlzryZIv4cMh+w1VkuH8o97THft19FcuDG
 d/lOxlL1JHQw==
X-IronPort-AV: E=McAfee;i="6000,8403,9886"; a="200494238"
X-IronPort-AV: E=Sophos;i="5.81,156,1610438400"; d="scan'208";a="200494238"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 12:00:48 -0800
IronPort-SDR: AVXywm+LvuL9JOh4xF8j61XBvdZ18yXe3ymuBppsj+6Dp4zcXi6/S7MHIqCqySwk3cmzTxGe5P
 vB0WvlLVGACQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,156,1610438400"; d="scan'208";a="393994678"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga008.jf.intel.com with SMTP; 05 Feb 2021 12:00:45 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 05 Feb 2021 22:00:44 +0200
Date: Fri, 5 Feb 2021 22:00:44 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 2/3] drm/dp_helper: Define options for FRL training for
 HDMI2.1 PCON
Message-ID: <YB2j7KQWBIGR3g0f@intel.com>
References: <20210204064842.11595-1-ankit.k.nautiyal@intel.com>
 <20210204064842.11595-3-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210204064842.11595-3-ankit.k.nautiyal@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, uma.shankar@intel.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 04, 2021 at 12:18:41PM +0530, Ankit Nautiyal wrote:
> Currently the FRL training mode (Concurrent, Sequential) and
> training type (Normal, Extended) are not defined properly and
> are passed as bool values in drm_helpers for pcon
> configuration for FRL training.
> =

> This patch:
> -Defines FRL training type and link bring up sequence mode as enum.
> -Fixes the drm_helpers for FRL Training configuration to use these enums.
> -Modifies the calls to the above drm_helpers in i915/intel_dp as per the
> above change.
> =

> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/drm_dp_helper.c         | 18 +++++-----
>  drivers/gpu/drm/i915/display/intel_dp.c | 10 +++---
>  include/drm/drm_dp_helper.h             | 46 +++++++++++++++++++++++--
>  3 files changed, 56 insertions(+), 18 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_hel=
per.c
> index eedbb48815b7..2ca4ab5af470 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -2635,14 +2635,13 @@ EXPORT_SYMBOL(drm_dp_pcon_is_frl_ready);
>   * drm_dp_pcon_frl_configure_1() - Set HDMI LINK Configuration-Step1
>   * @aux: DisplayPort AUX channel
>   * @max_frl_gbps: maximum frl bw to be configured between PCON and HDMI =
sink
> - * @concurrent_mode: true if concurrent mode or operation is required,
> - * false otherwise.
> + * @frl_mode: FRL Training mode, it can be either Concurrent or Sequenti=
al.
>   *
>   * Returns 0 if success, else returns negative error code.
>   */
>  =

>  int drm_dp_pcon_frl_configure_1(struct drm_dp_aux *aux, int max_frl_gbps,
> -				bool concurrent_mode)
> +				enum dp_pcon_frl_train_mode frl_mode)
>  {
>  	int ret;
>  	u8 buf;
> @@ -2651,7 +2650,7 @@ int drm_dp_pcon_frl_configure_1(struct drm_dp_aux *=
aux, int max_frl_gbps,
>  	if (ret < 0)
>  		return ret;
>  =

> -	if (concurrent_mode)
> +	if (frl_mode =3D=3D DP_PCON_FRL_MODE_CONCURRENT)
>  		buf |=3D DP_PCON_ENABLE_CONCURRENT_LINK;
>  	else
>  		buf &=3D ~DP_PCON_ENABLE_CONCURRENT_LINK;
> @@ -2694,21 +2693,20 @@ EXPORT_SYMBOL(drm_dp_pcon_frl_configure_1);
>   * drm_dp_pcon_frl_configure_2() - Set HDMI Link configuration Step-2
>   * @aux: DisplayPort AUX channel
>   * @max_frl_mask : Max FRL BW to be tried by the PCON with HDMI Sink
> - * @extended_train_mode : true for Extended Mode, false for Normal Mode.
> - * In Normal mode, the PCON tries each frl bw from the max_frl_mask star=
ting
> - * from min, and stops when link training is successful. In Extended mod=
e, all
> - * frl bw selected in the mask are trained by the PCON.
> + * @frl_type : FRL training type, can be Extended, or Normal.
>   *
>   * Returns 0 if success, else returns negative error code.
>   */
>  int drm_dp_pcon_frl_configure_2(struct drm_dp_aux *aux, int max_frl_mask,
> -				bool extended_train_mode)
> +				enum dp_pcon_frl_train_type frl_type)
>  {
>  	int ret;
>  	u8 buf =3D max_frl_mask;
>  =

> -	if (extended_train_mode)
> +	if (frl_type =3D=3D DP_PCON_FRL_TRAIN_EXTENDED)
>  		buf |=3D DP_PCON_FRL_LINK_TRAIN_EXTENDED;
> +	else
> +		buf &=3D ~DP_PCON_FRL_LINK_TRAIN_EXTENDED;

These names are annoyingly close to each other. Prettu much
guaranteed to mix them up at some point. We should try to come
up something a bit more distinctive for the enum, or just forget
the enum and use the register values directly.

>  =

>  	ret =3D drm_dp_dpcd_writeb(aux, DP_PCON_HDMI_LINK_CONFIG_2, buf);
>  	if (ret < 0)
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 2b83f0f433a2..1962d6dd8641 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2560,10 +2560,6 @@ static int intel_dp_hdmi_sink_max_frl(struct intel=
_dp *intel_dp)
>  =

>  static int intel_dp_pcon_start_frl_training(struct intel_dp *intel_dp)
>  {
> -#define PCON_EXTENDED_TRAIN_MODE (1 > 0)
> -#define PCON_CONCURRENT_MODE (1 > 0)
> -#define PCON_SEQUENTIAL_MODE !PCON_CONCURRENT_MODE
> -#define PCON_NORMAL_TRAIN_MODE !PCON_EXTENDED_TRAIN_MODE
>  #define TIMEOUT_FRL_READY_MS 500
>  #define TIMEOUT_HDMI_LINK_ACTIVE_MS 1000
>  =

> @@ -2597,10 +2593,12 @@ static int intel_dp_pcon_start_frl_training(struc=
t intel_dp *intel_dp)
>  		return -ETIMEDOUT;
>  =

>  	max_frl_bw_mask =3D intel_dp_pcon_set_frl_mask(max_frl_bw);
> -	ret =3D drm_dp_pcon_frl_configure_1(&intel_dp->aux, max_frl_bw, PCON_SE=
QUENTIAL_MODE);
> +	ret =3D drm_dp_pcon_frl_configure_1(&intel_dp->aux, max_frl_bw,
> +					  DP_PCON_FRL_MODE_SEQUENTIAL);
>  	if (ret < 0)
>  		return ret;
> -	ret =3D drm_dp_pcon_frl_configure_2(&intel_dp->aux, max_frl_bw_mask, PC=
ON_NORMAL_TRAIN_MODE);
> +	ret =3D drm_dp_pcon_frl_configure_2(&intel_dp->aux, max_frl_bw_mask,
> +					  DP_PCON_FRL_TRAIN_NORMAL);
>  	if (ret < 0)
>  		return ret;
>  	ret =3D drm_dp_pcon_frl_enable(&intel_dp->aux);
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index edffd1dcca3e..c3f56e87a5ec 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1646,6 +1646,48 @@ enum dp_content_type {
>  	DP_CONTENT_TYPE_GAME =3D 0x04,
>  };
>  =

> +/**
> + * enum dp_pcon_frl_train_type - drm DP PCON FRL Training Type
> + *
> + * This enum is used to select FRL training type for FRL training between
> + * an HDMI2.1 PCON and an HDMI2.1 sink.
> + *
> + * It is based on VESA DP-to-HDMI Protocol Converter (PCON) Specification
> + * Sec 6.1 Table-3.
> + * In Normal FRL training, the PCON tries each frl bw from the MAX FRL M=
ASK
> + * starting from min, and stops when link training is successful.
> + * In Extended FRL training, all frl bw selected in the mask are trained=
 by the
> + * PCON.
> + *
> + * @DP_PCON_FRL_TRAIN_NORMAL: FRL training type Normal
> + * @DP_PCON_FRL_TRAIN_EXTENDED: FRL training type Extended
> + */
> +enum dp_pcon_frl_train_type {
> +	DP_PCON_FRL_TRAIN_NORMAL =3D 0,
> +	DP_PCON_FRL_TRAIN_EXTENDED =3D 1,
> +};
> +
> +/**
> + * enum dp_pcon_frl_train_mode - drm DP PCON FRL Training Mode
> + *
> + * This enum is used to select mode for FRL Link bringup between an HDMI=
2.1
> + * PCON and an HDMI2.1 sink.
> + *
> + * It is based on VESA DP-to-HDMI Protocol Converter (PCON) Specification
> + * Sec 6.1 Table-3.
> + * In Concurrent Mode, the FRL link bring up can be done along with DP L=
ink
> + * training. In Sequential mode, the FRL link bring up is done prior to =
the
> + * DP Link training.
> + *
> + * @DP_PCON_FRL_MODE_SEQUENTIAL: Sequential Training mode
> + * @DP_PCON_FRL_MODE_CONCURRENT: Concurrent Training mode
> + */
> +
> +enum dp_pcon_frl_train_mode {
> +	DP_PCON_FRL_MODE_SEQUENTIAL =3D 0,
> +	DP_PCON_FRL_MODE_CONCURRENT =3D 1,
> +};
> +
>  /**
>   * struct drm_dp_vsc_sdp - drm DP VSC SDP
>   *
> @@ -2149,9 +2191,9 @@ int drm_dp_get_pcon_max_frl_bw(const u8 dpcd[DP_REC=
EIVER_CAP_SIZE],
>  int drm_dp_pcon_frl_prepare(struct drm_dp_aux *aux, bool enable_frl_read=
y_hpd);
>  bool drm_dp_pcon_is_frl_ready(struct drm_dp_aux *aux);
>  int drm_dp_pcon_frl_configure_1(struct drm_dp_aux *aux, int max_frl_gbps,
> -				bool concurrent_mode);
> +				enum dp_pcon_frl_train_mode frl_mode);
>  int drm_dp_pcon_frl_configure_2(struct drm_dp_aux *aux, int max_frl_mask,
> -				bool extended_train_mode);
> +				enum dp_pcon_frl_train_type frl_type);
>  int drm_dp_pcon_reset_frl_config(struct drm_dp_aux *aux);
>  int drm_dp_pcon_frl_enable(struct drm_dp_aux *aux);
>  =

> -- =

> 2.29.2

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
