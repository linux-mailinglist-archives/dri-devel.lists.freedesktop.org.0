Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBEC69B9D1
	for <lists+dri-devel@lfdr.de>; Sat, 18 Feb 2023 12:33:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F64010E4A4;
	Sat, 18 Feb 2023 11:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD26E10E4A4
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Feb 2023 11:33:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2C57760AEF;
 Sat, 18 Feb 2023 11:33:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0B57C433D2;
 Sat, 18 Feb 2023 11:33:45 +0000 (UTC)
Message-ID: <8802bf80-19a7-4064-0089-12deffad6636@xs4all.nl>
Date: Sat, 18 Feb 2023 12:33:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 3/9] drm/vc4: hdmi: Add Broadcast RGB property to allow
 override of RGB range
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20221207-rpi-hdmi-improvements-v2-0-8ace2d8221ad@cerno.tech>
 <20221207-rpi-hdmi-improvements-v2-3-8ace2d8221ad@cerno.tech>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20221207-rpi-hdmi-improvements-v2-3-8ace2d8221ad@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime, Dave,

On 26/01/2023 14:46, Maxime Ripard wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> Copy Intel's "Broadcast RGB" property semantics to add manual override
> of the HDMI pixel range for monitors that don't abide by the content
> of the AVI Infoframe.

Do we have to copy that property as-is?

First of all, I think this should really be a drm-level property, rather than
a driver property: RGB Quantization Range mismatches are the bane of my life,
and I think a way to override this would help everyone.

Secondly, I hate the name they came up with: 'Broadcast RGB' is pretty meaningless.
Can't we stick to something closer to what the CTA-861/HDMI specs use, which is
'RGB Quantization Range'? So either use that, or just 'RGB Range'.

In addition, 'Limited 16:235' should just be 'Limited' since the actual range
depends on the bits-per-color-component.

> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 97 ++++++++++++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/vc4/vc4_hdmi.h |  9 ++++
>  2 files changed, 102 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 4b3bf77bb5cd..78749c6fa837 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -150,10 +150,16 @@ static bool vc4_hdmi_mode_needs_scrambling(const struct drm_display_mode *mode,
>  }
>  
>  static bool vc4_hdmi_is_full_range_rgb(struct vc4_hdmi *vc4_hdmi,
> -				       const struct drm_display_mode *mode)
> +				       struct vc4_hdmi_connector_state *vc4_state)
>  {
> +	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
>  	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
>  
> +	if (vc4_state->broadcast_rgb == VC4_HDMI_BROADCAST_RGB_LIMITED)
> +		return false;
> +	else if (vc4_state->broadcast_rgb == VC4_HDMI_BROADCAST_RGB_FULL)
> +		return true;
> +
>  	return !display->is_hdmi ||
>  		drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_FULL;
>  }
> @@ -524,8 +530,12 @@ static int vc4_hdmi_connector_atomic_check(struct drm_connector *connector,
>  {
>  	struct drm_connector_state *old_state =
>  		drm_atomic_get_old_connector_state(state, connector);
> +	struct vc4_hdmi_connector_state *old_vc4_state =
> +		conn_state_to_vc4_hdmi_conn_state(old_state);
>  	struct drm_connector_state *new_state =
>  		drm_atomic_get_new_connector_state(state, connector);
> +	struct vc4_hdmi_connector_state *new_vc4_state =
> +		conn_state_to_vc4_hdmi_conn_state(new_state);
>  	struct drm_crtc *crtc = new_state->crtc;
>  
>  	if (!crtc)
> @@ -558,6 +568,7 @@ static int vc4_hdmi_connector_atomic_check(struct drm_connector *connector,
>  	}
>  
>  	if (old_state->colorspace != new_state->colorspace ||
> +	    old_vc4_state->broadcast_rgb != new_vc4_state->broadcast_rgb ||

The problem with this is that this will cause a mode change, even though all
that is necessary is to update the csc matrix and AVI InfoFrame.

I used this code (added just before the 'return 0;' at the end of this function):

        if (old_vc4_state->broadcast_rgb != new_vc4_state->broadcast_rgb) {
                const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;

                old_vc4_state->broadcast_rgb = new_vc4_state->broadcast_rgb;
                vc4_hdmi_set_avi_infoframe(encoder);
                if (vc4_hdmi->variant->csc_setup)
                        vc4_hdmi->variant->csc_setup(vc4_hdmi, old_state, mode);
        }

I'm certain this is in the wrong place, but I'm not familiar enough with the drm API
to determine where this should go.

This approach probably applies to the hdr_metadata metadata as well, that too
doesn't need a mode change.

I see that the i915 driver has a 'fastset' mechanism for changes like this, but
it is not clear to me how that interacts with the drm API.

I've been playing around with this vc4 driver and it is proving to be very useful
for debugging all sorts of quantization range bugs in other equipment.

Regards,

	Hans

>  	    !drm_connector_atomic_hdr_metadata_equal(old_state, new_state)) {
>  		struct drm_crtc_state *crtc_state;
>  
> @@ -571,6 +582,49 @@ static int vc4_hdmi_connector_atomic_check(struct drm_connector *connector,
>  	return 0;
>  }
>  
> +static int vc4_hdmi_connector_get_property(struct drm_connector *connector,
> +					   const struct drm_connector_state *state,
> +					   struct drm_property *property,
> +					   uint64_t *val)
> +{
> +	struct drm_device *drm = connector->dev;
> +	struct vc4_hdmi *vc4_hdmi =
> +		connector_to_vc4_hdmi(connector);
> +	const struct vc4_hdmi_connector_state *vc4_conn_state =
> +		conn_state_to_vc4_hdmi_conn_state(state);
> +
> +	if (property == vc4_hdmi->broadcast_rgb_property) {
> +		*val = vc4_conn_state->broadcast_rgb;
> +	} else {
> +		drm_dbg(drm, "Unknown property [PROP:%d:%s]\n",
> +			property->base.id, property->name);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int vc4_hdmi_connector_set_property(struct drm_connector *connector,
> +					   struct drm_connector_state *state,
> +					   struct drm_property *property,
> +					   uint64_t val)
> +{
> +	struct drm_device *drm = connector->dev;
> +	struct vc4_hdmi *vc4_hdmi =
> +		connector_to_vc4_hdmi(connector);
> +	struct vc4_hdmi_connector_state *vc4_conn_state =
> +		conn_state_to_vc4_hdmi_conn_state(state);
> +
> +	if (property == vc4_hdmi->broadcast_rgb_property) {
> +		vc4_conn_state->broadcast_rgb = val;
> +		return 0;
> +	}
> +
> +	drm_dbg(drm, "Unknown property [PROP:%d:%s]\n",
> +		property->base.id, property->name);
> +	return -EINVAL;
> +}
> +
>  static void vc4_hdmi_connector_reset(struct drm_connector *connector)
>  {
>  	struct vc4_hdmi_connector_state *old_state =
> @@ -590,6 +644,7 @@ static void vc4_hdmi_connector_reset(struct drm_connector *connector)
>  	new_state->base.max_bpc = 8;
>  	new_state->base.max_requested_bpc = 8;
>  	new_state->output_format = VC4_HDMI_OUTPUT_RGB;
> +	new_state->broadcast_rgb = VC4_HDMI_BROADCAST_RGB_AUTO;
>  	drm_atomic_helper_connector_tv_margins_reset(connector);
>  }
>  
> @@ -607,6 +662,7 @@ vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
>  	new_state->tmds_char_rate = vc4_state->tmds_char_rate;
>  	new_state->output_bpc = vc4_state->output_bpc;
>  	new_state->output_format = vc4_state->output_format;
> +	new_state->broadcast_rgb = vc4_state->broadcast_rgb;
>  	__drm_atomic_helper_connector_duplicate_state(connector, &new_state->base);
>  
>  	return &new_state->base;
> @@ -617,6 +673,8 @@ static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
>  	.reset = vc4_hdmi_connector_reset,
>  	.atomic_duplicate_state = vc4_hdmi_connector_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +	.atomic_get_property = vc4_hdmi_connector_get_property,
> +	.atomic_set_property = vc4_hdmi_connector_set_property,
>  };
>  
>  static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs = {
> @@ -625,6 +683,33 @@ static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs =
>  	.atomic_check = vc4_hdmi_connector_atomic_check,
>  };
>  
> +static const struct drm_prop_enum_list broadcast_rgb_names[] = {
> +	{ VC4_HDMI_BROADCAST_RGB_AUTO, "Automatic" },
> +	{ VC4_HDMI_BROADCAST_RGB_FULL, "Full" },
> +	{ VC4_HDMI_BROADCAST_RGB_LIMITED, "Limited 16:235" },
> +};
> +
> +static void
> +vc4_hdmi_attach_broadcast_rgb_property(struct drm_device *dev,
> +				       struct vc4_hdmi *vc4_hdmi)
> +{
> +	struct drm_property *prop = vc4_hdmi->broadcast_rgb_property;
> +
> +	if (!prop) {
> +		prop = drm_property_create_enum(dev, DRM_MODE_PROP_ENUM,
> +						"Broadcast RGB",
> +						broadcast_rgb_names,
> +						ARRAY_SIZE(broadcast_rgb_names));
> +		if (!prop)
> +			return;
> +
> +		vc4_hdmi->broadcast_rgb_property = prop;
> +	}
> +
> +	drm_object_attach_property(&vc4_hdmi->connector.base, prop,
> +				   VC4_HDMI_BROADCAST_RGB_AUTO);
> +}
> +
>  static int vc4_hdmi_connector_init(struct drm_device *dev,
>  				   struct vc4_hdmi *vc4_hdmi)
>  {
> @@ -671,6 +756,8 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
>  	if (vc4_hdmi->variant->supports_hdr)
>  		drm_connector_attach_hdr_output_metadata_property(connector);
>  
> +	vc4_hdmi_attach_broadcast_rgb_property(dev, vc4_hdmi);
> +
>  	drm_connector_attach_encoder(connector, encoder);
>  
>  	return 0;
> @@ -825,7 +912,7 @@ static void vc4_hdmi_set_avi_infoframe(struct drm_encoder *encoder)
>  
>  	drm_hdmi_avi_infoframe_quant_range(&frame.avi,
>  					   connector, mode,
> -					   vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode) ?
> +					   vc4_hdmi_is_full_range_rgb(vc4_hdmi, vc4_state) ?
>  					   HDMI_QUANTIZATION_RANGE_FULL :
>  					   HDMI_QUANTIZATION_RANGE_LIMITED);
>  	drm_hdmi_avi_infoframe_colorimetry(&frame.avi, cstate);
> @@ -1066,6 +1153,8 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
>  			       struct drm_connector_state *state,
>  			       const struct drm_display_mode *mode)
>  {
> +	struct vc4_hdmi_connector_state *vc4_state =
> +		conn_state_to_vc4_hdmi_conn_state(state);
>  	struct drm_device *drm = vc4_hdmi->connector.dev;
>  	unsigned long flags;
>  	u32 csc_ctl;
> @@ -1079,7 +1168,7 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
>  	csc_ctl = VC4_SET_FIELD(VC4_HD_CSC_CTL_ORDER_BGR,
>  				VC4_HD_CSC_CTL_ORDER);
>  
> -	if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode)) {
> +	if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, vc4_state)) {
>  		/* CEA VICs other than #1 requre limited range RGB
>  		 * output unless overridden by an AVI infoframe.
>  		 * Apply a colorspace conversion to squash 0-255 down
> @@ -1232,7 +1321,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
>  	case VC4_HDMI_OUTPUT_RGB:
>  		if_xbar = 0x354021;
>  
> -		if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode))
> +		if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, vc4_state))
>  			vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_limited_rgb);
>  		else
>  			vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_unity);
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index 5d249ac54cd1..89800c48aa24 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -117,6 +117,12 @@ enum vc4_hdmi_output_format {
>  	VC4_HDMI_OUTPUT_YUV420,
>  };
>  
> +enum vc4_hdmi_broadcast_rgb {
> +	VC4_HDMI_BROADCAST_RGB_AUTO,
> +	VC4_HDMI_BROADCAST_RGB_FULL,
> +	VC4_HDMI_BROADCAST_RGB_LIMITED,
> +};
> +
>  /* General HDMI hardware state. */
>  struct vc4_hdmi {
>  	struct vc4_hdmi_audio audio;
> @@ -129,6 +135,8 @@ struct vc4_hdmi {
>  
>  	struct delayed_work scrambling_work;
>  
> +	struct drm_property *broadcast_rgb_property;
> +
>  	struct i2c_adapter *ddc;
>  	void __iomem *hdmicore_regs;
>  	void __iomem *hd_regs;
> @@ -238,6 +246,7 @@ struct vc4_hdmi_connector_state {
>  	unsigned long long		tmds_char_rate;
>  	unsigned int 			output_bpc;
>  	enum vc4_hdmi_output_format	output_format;
> +	enum vc4_hdmi_broadcast_rgb	broadcast_rgb;
>  };
>  
>  #define conn_state_to_vc4_hdmi_conn_state(_state)			\
> 

