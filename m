Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3C6510BF0
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 00:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3469C10E598;
	Tue, 26 Apr 2022 22:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0959D10E598
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 22:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651011682; x=1682547682;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yW+IVy1TYk/6dsQfiqAiApa9tYNgTKImjmG5uw6IEkk=;
 b=gUztEt1fs2rQpuX+K0cMgmabLaviw67a8AnqqTIxswLDgsDmrhSgkZD+
 uwZ9d88FEKdAvTCWVMAWTCaqatESSZUX25cZ6VxiIT1YnCz9ALpD2pVjl
 HrtSgDoT5p8zCHoARpucI+CJx9TURv0QClsLuHGfc82EtVPG6cvLXFJce A=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 26 Apr 2022 15:21:21 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 15:21:20 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 26 Apr 2022 15:21:20 -0700
Received: from [10.111.160.161] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 26 Apr
 2022 15:21:17 -0700
Message-ID: <47bf6151-4a71-1ee1-62e6-acdf82563ff4@quicinc.com>
Date: Tue, 26 Apr 2022 15:21:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 1/2] drm/probe-helper: Add helper for
 drm_helper_probe_single_connector_modes()
Content-Language: en-US
To: Douglas Anderson <dianders@chromium.org>, <dri-devel@lists.freedesktop.org>
References: <20220426114627.1.I2dd93486c6952bd52f2020904de0133970d11b29@changeid>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220426114627.1.I2dd93486c6952bd52f2020904de0133970d11b29@changeid>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: quic_sbillaka@quicinc.com, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_khsieh@quicinc.com,
 dmitry.baryshkov@linaro.org, quic_aravindh@quicinc.com, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/26/2022 11:46 AM, Douglas Anderson wrote:
> The drm_helper_probe_single_connector_modes() is a bit long. Let's
> break a chunk off to update and validate modes. This helps avoid one
> goto and also will allow us to more easily call the helper a second
> time in a future patch without adding looping or another goto.
> 
> This change is intended to be a no-op change--just code movement.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

I think this cleanup looks reasonable to me.

Hence,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> 
>   drivers/gpu/drm/drm_probe_helper.c | 105 ++++++++++++++++-------------
>   1 file changed, 59 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index 682359512996..819225629010 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -354,6 +354,61 @@ drm_helper_probe_detect(struct drm_connector *connector,
>   }
>   EXPORT_SYMBOL(drm_helper_probe_detect);
>   
> +static bool _drm_helper_update_and_validate(struct drm_connector *connector,
> +					    uint32_t maxX, uint32_t maxY,
> +					    struct drm_modeset_acquire_ctx *ctx)
> +{
> +	struct drm_device *dev = connector->dev;
> +	struct drm_display_mode *mode;
> +	int mode_flags = 0;
> +	int ret;
> +
> +	drm_connector_list_update(connector);
> +
> +	if (connector->interlace_allowed)
> +		mode_flags |= DRM_MODE_FLAG_INTERLACE;
> +	if (connector->doublescan_allowed)
> +		mode_flags |= DRM_MODE_FLAG_DBLSCAN;
> +	if (connector->stereo_allowed)
> +		mode_flags |= DRM_MODE_FLAG_3D_MASK;
> +
> +	list_for_each_entry(mode, &connector->modes, head) {
> +		if (mode->status != MODE_OK)
> +			continue;
> +
> +		mode->status = drm_mode_validate_driver(dev, mode);
> +		if (mode->status != MODE_OK)
> +			continue;
> +
> +		mode->status = drm_mode_validate_size(mode, maxX, maxY);
> +		if (mode->status != MODE_OK)
> +			continue;
> +
> +		mode->status = drm_mode_validate_flag(mode, mode_flags);
> +		if (mode->status != MODE_OK)
> +			continue;
> +
> +		ret = drm_mode_validate_pipeline(mode, connector, ctx,
> +						 &mode->status);
> +		if (ret) {
> +			drm_dbg_kms(dev,
> +				    "drm_mode_validate_pipeline failed: %d\n",
> +				    ret);
> +
> +			if (drm_WARN_ON_ONCE(dev, ret != -EDEADLK))
> +				mode->status = MODE_ERROR;
> +			else
> +				return true;
> +		}
> +
> +		if (mode->status != MODE_OK)
> +			continue;
> +		mode->status = drm_mode_validate_ycbcr420(mode, connector);
> +	}
> +
> +	return false;
> +}
> +
>   /**
>    * drm_helper_probe_single_connector_modes - get complete set of display modes
>    * @connector: connector to probe
> @@ -421,7 +476,6 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>   	const struct drm_connector_helper_funcs *connector_funcs =
>   		connector->helper_private;
>   	int count = 0, ret;
> -	int mode_flags = 0;
>   	bool verbose_prune = true;
>   	enum drm_connector_status old_status;
>   	struct drm_modeset_acquire_ctx ctx;
> @@ -519,52 +573,11 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>   			   connector->status == connector_status_unknown))
>   		count = drm_add_modes_noedid(connector, 1024, 768);
>   	count += drm_helper_probe_add_cmdline_mode(connector);
> -	if (count == 0)
> -		goto prune;
> -
> -	drm_connector_list_update(connector);
> -
> -	if (connector->interlace_allowed)
> -		mode_flags |= DRM_MODE_FLAG_INTERLACE;
> -	if (connector->doublescan_allowed)
> -		mode_flags |= DRM_MODE_FLAG_DBLSCAN;
> -	if (connector->stereo_allowed)
> -		mode_flags |= DRM_MODE_FLAG_3D_MASK;
> -
> -	list_for_each_entry(mode, &connector->modes, head) {
> -		if (mode->status != MODE_OK)
> -			continue;
> -
> -		mode->status = drm_mode_validate_driver(dev, mode);
> -		if (mode->status != MODE_OK)
> -			continue;
> -
> -		mode->status = drm_mode_validate_size(mode, maxX, maxY);
> -		if (mode->status != MODE_OK)
> -			continue;
> -
> -		mode->status = drm_mode_validate_flag(mode, mode_flags);
> -		if (mode->status != MODE_OK)
> -			continue;
> -
> -		ret = drm_mode_validate_pipeline(mode, connector, &ctx,
> -						 &mode->status);
> -		if (ret) {
> -			drm_dbg_kms(dev,
> -				    "drm_mode_validate_pipeline failed: %d\n",
> -				    ret);
> -
> -			if (drm_WARN_ON_ONCE(dev, ret != -EDEADLK)) {
> -				mode->status = MODE_ERROR;
> -			} else {
> -				drm_modeset_backoff(&ctx);
> -				goto retry;
> -			}
> +	if (count != 0) {
> +		if (_drm_helper_update_and_validate(connector, maxX, maxY, &ctx)) {
> +			drm_modeset_backoff(&ctx);
> +			goto retry;
>   		}
> -
> -		if (mode->status != MODE_OK)
> -			continue;
> -		mode->status = drm_mode_validate_ycbcr420(mode, connector);
>   	}
>   
>   prune:
