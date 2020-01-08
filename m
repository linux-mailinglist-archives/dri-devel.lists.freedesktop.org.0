Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C0713401D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 12:17:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFB66E891;
	Wed,  8 Jan 2020 11:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 899766E88D;
 Wed,  8 Jan 2020 11:17:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2020 03:17:30 -0800
X-IronPort-AV: E=Sophos;i="5.69,409,1571727600"; d="scan'208";a="222907900"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2020 03:17:27 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 rodrigo.vivi@intel.com, irlied@linux.ie, daniel@ffwll.ch,
 sudeep.dutt@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [RFC 3/7] drm/i915: add helper functions to get
 device ptr
In-Reply-To: <20200106172326.32592-4-pankaj.laxminarayan.bharadiya@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200106172326.32592-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200106172326.32592-4-pankaj.laxminarayan.bharadiya@intel.com>
Date: Wed, 08 Jan 2020 13:17:24 +0200
Message-ID: <87imlmqjsr.fsf@intel.com>
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 06 Jan 2020, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com> wrote:
> We will need struct device pointer to pass it to dev_WARN* calls.
>
> Add helper functions to exract device pointer from various structs.

Please focus on using and adding helpers to get the struct
drm_i915_private * pointer, and use that instead.

We've significantly consolidated on passing i915 around instead of
struct drm_device or struct device.

BR,
Jani.

>
> Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_types.h | 14 ++++++++++++++
>  drivers/gpu/drm/i915/gvt/gvt.h                     |  5 +++++
>  drivers/gpu/drm/i915/i915_drv.h                    | 11 +++++++++++
>  3 files changed, 30 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 630a94892b7b..6cca8921f3c6 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1523,6 +1523,20 @@ dp_to_i915(struct intel_dp *intel_dp)
>  	return to_i915(dp_to_dig_port(intel_dp)->base.base.dev);
>  }
>  
> +static inline struct device *enc_to_dev(const struct intel_encoder *encoder)
> +{
> +	return encoder->base.dev->dev;
> +}
> +
> +static inline struct device *
> +crtc_state_to_dev(const struct intel_crtc_state *state)
> +{
> +	struct intel_crtc *crtc = to_intel_crtc(state->uapi.crtc);
> +	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
> +
> +	return i915_to_dev(i915);
> +}
> +
>  static inline struct intel_digital_port *
>  hdmi_to_dig_port(struct intel_hdmi *intel_hdmi)
>  {
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
> index b47c6acaf9c0..2900ef848e84 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.h
> +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> @@ -348,6 +348,11 @@ static inline struct intel_gvt *to_gvt(struct drm_i915_private *i915)
>  	return i915->gvt;
>  }
>  
> +static inline struct device *vgpu_to_dev(const struct intel_vgpu *vgpu)
> +{
> +	return i915_to_dev(vgpu->gvt->dev_priv);
> +}
> +
>  enum {
>  	INTEL_GVT_REQUEST_EMULATE_VBLANK = 0,
>  
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index b7f122dccdca..bd4557d6f35b 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1314,6 +1314,17 @@ static inline struct drm_i915_private *pdev_to_i915(struct pci_dev *pdev)
>  	return pci_get_drvdata(pdev);
>  }
>  
> +static inline struct device *i915_to_dev(const struct drm_i915_private *i915)
> +{
> +	return i915->drm.dev;
> +}
> +
> +static inline struct device *
> +perf_stream_to_dev(const struct i915_perf_stream *stream)
> +{
> +	return i915_to_dev(stream->perf->i915);
> +}
> +
>  /* Simple iterator over all initialised engines */
>  #define for_each_engine(engine__, dev_priv__, id__) \
>  	for ((id__) = 0; \

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
