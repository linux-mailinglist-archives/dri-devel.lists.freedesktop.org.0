Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AABBE329F1E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 13:47:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B39126E93A;
	Tue,  2 Mar 2021 12:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB146E0A2;
 Tue,  2 Mar 2021 12:46:59 +0000 (UTC)
IronPort-SDR: lVUTSbBcPHox6YsjqAOJtWyhRff2AWAL3TAqbZORCaStlNACfRImWZdgu+Iu3KjcjmMB5SinCE
 EVM70/rihO8w==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="250842710"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="250842710"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 04:46:57 -0800
IronPort-SDR: jIAEDA8K3Tw4q4E0+xBEk+hIdtc4Z+53W73+k1VDtsldkGuU69QWIfDQNwqaQooORiqwMMCZo7
 EjMWMY0xtD7w==
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="406692523"
Received: from rwathan-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.61.106])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 04:46:54 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH resend 1/2] drm/i915/display: Add a
 intel_pipe_is_enabled() helper
In-Reply-To: <20210302120040.94435-2-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210302120040.94435-1-hdegoede@redhat.com>
 <20210302120040.94435-2-hdegoede@redhat.com>
Date: Tue, 02 Mar 2021 14:46:51 +0200
Message-ID: <87a6rlpvt0.fsf@intel.com>
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 02 Mar 2021, Hans de Goede <hdegoede@redhat.com> wrote:
> Factor the code to check if a pipe is currently enabled out of
> assert_pipe() and put it in a new intel_pipe_is_enabled() helper,
> so that it can be re-used without copy-pasting it.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Does what it says on the box.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 20 ++++++++++++++------
>  drivers/gpu/drm/i915/display/intel_display.h |  2 ++
>  2 files changed, 16 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index e1060076ac83..9cb304aee285 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -442,17 +442,13 @@ void assert_panel_unlocked(struct drm_i915_private *dev_priv, enum pipe pipe)
>  	     pipe_name(pipe));
>  }
>  
> -void assert_pipe(struct drm_i915_private *dev_priv,
> -		 enum transcoder cpu_transcoder, bool state)
> +bool intel_pipe_is_enabled(struct drm_i915_private *dev_priv,
> +			   enum transcoder cpu_transcoder)
>  {
>  	bool cur_state;
>  	enum intel_display_power_domain power_domain;
>  	intel_wakeref_t wakeref;
>  
> -	/* we keep both pipes enabled on 830 */
> -	if (IS_I830(dev_priv))
> -		state = true;
> -
>  	power_domain = POWER_DOMAIN_TRANSCODER(cpu_transcoder);
>  	wakeref = intel_display_power_get_if_enabled(dev_priv, power_domain);
>  	if (wakeref) {
> @@ -464,6 +460,18 @@ void assert_pipe(struct drm_i915_private *dev_priv,
>  		cur_state = false;
>  	}
>  
> +	return cur_state;
> +}
> +
> +void assert_pipe(struct drm_i915_private *dev_priv,
> +		 enum transcoder cpu_transcoder, bool state)
> +{
> +	bool cur_state = intel_pipe_is_enabled(dev_priv, cpu_transcoder);
> +
> +	/* we keep both pipes enabled on 830 */
> +	if (IS_I830(dev_priv))
> +		state = true;
> +
>  	I915_STATE_WARN(cur_state != state,
>  			"transcoder %s assertion failure (expected %s, current %s)\n",
>  			transcoder_name(cpu_transcoder),
> diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
> index 0e4c1481fa00..642cc87f3e38 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.h
> +++ b/drivers/gpu/drm/i915/display/intel_display.h
> @@ -533,6 +533,8 @@ void intel_enable_pipe(const struct intel_crtc_state *new_crtc_state);
>  void intel_disable_pipe(const struct intel_crtc_state *old_crtc_state);
>  void i830_enable_pipe(struct drm_i915_private *dev_priv, enum pipe pipe);
>  void i830_disable_pipe(struct drm_i915_private *dev_priv, enum pipe pipe);
> +bool intel_pipe_is_enabled(struct drm_i915_private *dev_priv,
> +			   enum transcoder cpu_transcoder);
>  enum pipe intel_crtc_pch_transcoder(struct intel_crtc *crtc);
>  int vlv_get_hpll_vco(struct drm_i915_private *dev_priv);
>  int vlv_get_cck_clock(struct drm_i915_private *dev_priv,

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
