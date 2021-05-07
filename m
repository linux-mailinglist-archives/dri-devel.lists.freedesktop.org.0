Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0995C376BA2
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 23:25:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057C56EE7B;
	Fri,  7 May 2021 21:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C1E6E57E;
 Fri,  7 May 2021 21:24:56 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 2905EC800A2;
 Fri,  7 May 2021 23:24:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id kG2Ru1_ixux5; Fri,  7 May 2021 23:24:54 +0200 (CEST)
Received: from [IPv6:2003:e3:7f12:f200:d51b:e97d:b8e4:23b2]
 (p200300E37f12F200d51be97dB8e423B2.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f12:f200:d51b:e97d:b8e4:23b2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id 882A9C800A1;
 Fri,  7 May 2021 23:24:54 +0200 (CEST)
Subject: Re: [PATCH v6 2/3] drm/i915/display: Restructure output format
 computation for better expandability
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20210506172325.1995964-1-wse@tuxedocomputers.com>
 <20210507084903.28877-1-wse@tuxedocomputers.com>
 <20210507084903.28877-3-wse@tuxedocomputers.com> <YJV+Xr59xyK2yLXT@intel.com>
From: Werner Sembach <wse@tuxedocomputers.com>
Message-ID: <38ff8510-9509-b807-fdf0-ea1c653263c5@tuxedocomputers.com>
Date: Fri, 7 May 2021 23:24:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJV+Xr59xyK2yLXT@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.05.21 um 19:52 schrieb Ville Syrjälä:
> On Fri, May 07, 2021 at 10:49:02AM +0200, Werner Sembach wrote:
>> Couples the decission between RGB and YCbCr420 mode and the check if the
>> port clock can archive the required frequency. Other checks and
>> configuration steps that where previously done in between can also be done
>> before or after.
>>
>> This allows for are cleaner implementation of retrying different color
>> encodings.
>>
>> A slight change in behaviour occurs with this patch: If YCbCr420 is not
>> allowed but display is YCbCr420 only it no longer fails, but just prints
>> an error and tries to fallback on RGB.
>>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_hdmi.c | 65 ++++++++++++-----------
>>  1 file changed, 34 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
>> index 576d3d910d06..9f3da72dabee 100644
>> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
>> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
>> @@ -1999,29 +1999,6 @@ static bool hdmi_deep_color_possible(const struct intel_crtc_state *crtc_state,
>>  					      INTEL_OUTPUT_FORMAT_YCBCR420);
>>  }
>>  
>> -static int
>> -intel_hdmi_ycbcr420_config(struct intel_crtc_state *crtc_state,
>> -			   const struct drm_connector_state *conn_state)
>> -{
>> -	struct drm_connector *connector = conn_state->connector;
>> -	struct drm_i915_private *i915 = to_i915(connector->dev);
>> -	const struct drm_display_mode *adjusted_mode =
>> -		&crtc_state->hw.adjusted_mode;
>> -
>> -	if (!drm_mode_is_420_only(&connector->display_info, adjusted_mode))
>> -		return 0;
>> -
>> -	if (!connector->ycbcr_420_allowed) {
>> -		drm_err(&i915->drm,
>> -			"Platform doesn't support YCBCR420 output\n");
>> -		return -EINVAL;
>> -	}
>> -
>> -	crtc_state->output_format = INTEL_OUTPUT_FORMAT_YCBCR420;
>> -
>> -	return intel_pch_panel_fitting(crtc_state, conn_state);
>> -}
>> -
>>  static int intel_hdmi_compute_bpc(struct intel_encoder *encoder,
>>  				  struct intel_crtc_state *crtc_state,
>>  				  int clock)
>> @@ -2128,6 +2105,30 @@ static bool intel_hdmi_has_audio(struct intel_encoder *encoder,
>>  		return intel_conn_state->force_audio == HDMI_AUDIO_ON;
>>  }
>>  
>> +static int intel_hdmi_compute_output_format(struct intel_encoder *encoder,
>> +					    struct intel_crtc_state *crtc_state,
>> +					    const struct drm_connector_state *conn_state)
>> +{
>> +	struct drm_connector *connector = conn_state->connector;
>> +	struct drm_i915_private *i915 = to_i915(connector->dev);
>> +	const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
>> +	int ret;
>> +	bool ycbcr_420_only;
>> +
>> +	ycbcr_420_only = drm_mode_is_420_only(&connector->display_info, adjusted_mode);
>> +	if (connector->ycbcr_420_allowed && ycbcr_420_only) {
>> +		crtc_state->output_format = INTEL_OUTPUT_FORMAT_YCBCR420;
>> +	} else {
>> +		if (!connector->ycbcr_420_allowed && ycbcr_420_only)
>> +			drm_err(&i915->drm, "Display only supports YCbCr420 output, but connector does not allow it. Fallback to RGB, but this will likely fail.\n");
> We can't let the user spam dmesg with errors freely. So this needs
> to be a drm_dbg_kms(). Also a bit long, so going to annoyingly wrap
> always. Could maybe shorten a bit to something like:
> "YCbCr 4:2:0 mode but YCbCr 4:2:0 output not possible. Falling back to RGB."
Done, but I don't have time anymore to test it today. I will test and submit v7 on Monday.
>
> With that sorted, and the intel_hdmi_port_clock() stuff restored,
> I believe this series is good to go.
>
> I think you confused our CI by replying to the old patch with a whole
> new series. It can generally deal with a whole new series as a new
> thread or replies to individual patches with updated versions of
> exactly that patch, but not full series as a reply to a patch.
> So I suggest just posting the final versions as a new series. Thanks.
>
>> +		crtc_state->output_format = INTEL_OUTPUT_FORMAT_RGB;
>> +	}
>> +
>> +	ret = intel_hdmi_compute_clock(encoder, crtc_state);
>> +
>> +	return ret;
>> +}
>> +
>>  int intel_hdmi_compute_config(struct intel_encoder *encoder,
>>  			      struct intel_crtc_state *pipe_config,
>>  			      struct drm_connector_state *conn_state)
>> @@ -2152,23 +2153,25 @@ int intel_hdmi_compute_config(struct intel_encoder *encoder,
>>  	if (adjusted_mode->flags & DRM_MODE_FLAG_DBLCLK)
>>  		pipe_config->pixel_multiplier = 2;
>>  
>> -	ret = intel_hdmi_ycbcr420_config(pipe_config, conn_state);
>> -	if (ret)
>> -		return ret;
>> -
>> -	pipe_config->limited_color_range =
>> -		intel_hdmi_limited_color_range(pipe_config, conn_state);
>> -
>>  	if (HAS_PCH_SPLIT(dev_priv) && !HAS_DDI(dev_priv))
>>  		pipe_config->has_pch_encoder = true;
>>  
>>  	pipe_config->has_audio =
>>  		intel_hdmi_has_audio(encoder, pipe_config, conn_state);
>>  
>> -	ret = intel_hdmi_compute_clock(encoder, pipe_config);
>> +	ret = intel_hdmi_compute_output_format(encoder, pipe_config, conn_state);
>>  	if (ret)
>>  		return ret;
>>  
>> +	if (pipe_config->output_format == INTEL_OUTPUT_FORMAT_YCBCR420) {
>> +		ret = intel_pch_panel_fitting(pipe_config, conn_state);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	pipe_config->limited_color_range =
>> +		intel_hdmi_limited_color_range(pipe_config, conn_state);
>> +
>>  	if (conn_state->picture_aspect_ratio)
>>  		adjusted_mode->picture_aspect_ratio =
>>  			conn_state->picture_aspect_ratio;
>> -- 
>> 2.25.1
