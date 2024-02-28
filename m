Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E50786AF80
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 13:54:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E70710E39A;
	Wed, 28 Feb 2024 12:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Wq6t8z5a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39BA110E2E5
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 12:53:59 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5131c21314fso708220e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 04:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709124837; x=1709729637; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=eBe+rzXrdenb0iUz0ZZGc8egCqRBZ+ZnIGgizHBx4Ek=;
 b=Wq6t8z5a5UF3LyaC28KgC7mhEjqpzQN0HkQ1fsCiXSzFINGmbTRdmCUxXQz5HnL8SB
 e6NJSRVmYsXUBJHri+jDN5bQ8QDLsEa+8oMqRuNe4JbHS7qAI2LrjHgSvr0Ecr/Ts+IE
 NJESyUDojr8R0bDv4VqEQR/Tdolij78jnYiVpiV58uzJNTDO0FH/0e9U8VeKODCH2odF
 4ffIJ5nKGHaoSbvO5/mMl4MeD+eZjVfd04JlX2CvPULkzXkJ+DUOE/AKjeX9Q2tNLWAi
 mCtfmIJricsDfHzG12L/r3u9UJZP1tpBaMffklCuJbd/A1HcMjqgCihH9bAsT/WS7X4Q
 h+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709124837; x=1709729637;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=eBe+rzXrdenb0iUz0ZZGc8egCqRBZ+ZnIGgizHBx4Ek=;
 b=ilXWx89VyrL0AVN2BQXui2WSPU/oIoZ9CNvaWOiGdocCycbfDePdcz0d/V1TsdZ0v3
 BdE0JvoGcNK1fUK44Ph9z2S0z9+sSy5l2V3oqxI+6yFGTLZLCY2q6phs/ifYmHS1YpTc
 1xp/4rVWZOE1kEl+wi+DwdqnSNZ16y0WKXVZyaa3Uyx/g+cjY5BQeFvIF9CyfKKQO7fk
 IAgQUAVInhGlwFYZon+1GVI4gbg+YovR6x1EarcPcGmlSuQGB98myAFu1/ZdkfGnh/oj
 Gu2w6CeTECFGqqqEnNSzdnK3AGvhDx3NmEvXGUDkpTrOaoOLb9ziNEFvgKAox5xuK+b9
 U+9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRZf7sjXorzxAuMKvdU9C05/hYbBb21G/f4flv7FEaMXyk5LRptUOmhBr0X04A462TxIQrPP23FoPAPeOyQ57YJN7aNtOPQUtAwiiXPloB
X-Gm-Message-State: AOJu0YwkvVwhjdmqKhbrUMgysgGYGeglJzH9UXY/svHpk9nOzitupXf3
 frb6KFgiV5oge29QhynVFN4zyCbS5DQ9IFF0jAbAHvWOvYfXqylg+xWKk25rhP0=
X-Google-Smtp-Source: AGHT+IGMrXWIF4BtpLNgNbQPhjweH/gzh0Midrdiz6XOkwXeasOElaYJkWmHE4FF8i6K/KbZFLlhzw==
X-Received: by 2002:a05:6512:2820:b0:512:b915:606a with SMTP id
 cf32-20020a056512282000b00512b915606amr10138578lfb.12.1709124836857; 
 Wed, 28 Feb 2024 04:53:56 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8e80:16d6:ae57:b1cb?
 ([2a01:e0a:982:cbb0:8e80:16d6:ae57:b1cb])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a05600c205a00b00412b62f6e35sm1260350wmg.15.2024.02.28.04.53.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 04:53:56 -0800 (PST)
Message-ID: <cba58018-ee9e-432d-bea7-eb0e6e7f2c0e@linaro.org>
Date: Wed, 28 Feb 2024 13:53:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] Revert "drm/msm/dp: use drm_bridge_hpd_notify() to report
 HPD status changes"
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd
 <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Johan Hovold <johan@kernel.org>
References: <20240227220808.50146-1-dmitry.baryshkov@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <20240227220808.50146-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/02/2024 23:08, Dmitry Baryshkov wrote:
> This reverts commit e467e0bde881 ("drm/msm/dp: use
> drm_bridge_hpd_notify() to report HPD status changes").
> 
> The commit changed the way how the MSM DP driver communicates
> HPD-related events to the userspace. The mentioned commit made some of
> the HPD events being reported earlier. This way userspace starts poking
> around. It interacts in a bad way with the dp_bridge_detect and the
> driver's state machine, ending up either with the very long delays
> during hotplug detection or even inability of the DP driver to report
> the display as connected.
> 
> A proper fix will involve redesigning of the HPD handling in the MSM DP
> driver. It is underway, but it will be intrusive and can not be thought
> about as a simple fix for the issue. Thus, revert the offending commit.
> 
> Fixes: e467e0bde881 ("drm/msm/dp: use drm_bridge_hpd_notify() to report HPD status changes")
> Link: https://gitlab.freedesktop.org/drm/msm/-/issues/50
> Reported-by: Johan Hovold <johan@kernel.org>
> Link: https://lore.kernel.org/r/Zd3YPGmrprxv-N-O@hovoldconsulting.com/
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 20 ++++++++++++++++++--
>   1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index d37d599aec27..4c72124ffb5d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -329,10 +329,26 @@ static const struct component_ops dp_display_comp_ops = {
>   	.unbind = dp_display_unbind,
>   };
>   
> +static void dp_display_send_hpd_event(struct msm_dp *dp_display)
> +{
> +	struct dp_display_private *dp;
> +	struct drm_connector *connector;
> +
> +	dp = container_of(dp_display, struct dp_display_private, dp_display);
> +
> +	connector = dp->dp_display.connector;
> +	drm_helper_hpd_irq_event(connector->dev);
> +}
> +
>   static int dp_display_send_hpd_notification(struct dp_display_private *dp,
>   					    bool hpd)
>   {
> -	struct drm_bridge *bridge = dp->dp_display.bridge;
> +	if ((hpd && dp->dp_display.link_ready) ||
> +			(!hpd && !dp->dp_display.link_ready)) {
> +		drm_dbg_dp(dp->drm_dev, "HPD already %s\n",
> +				(hpd ? "on" : "off"));
> +		return 0;
> +	}
>   
>   	/* reset video pattern flag on disconnect */
>   	if (!hpd) {
> @@ -348,7 +364,7 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
>   
>   	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
>   			dp->dp_display.connector_type, hpd);
> -	drm_bridge_hpd_notify(bridge, dp->dp_display.link_ready);
> +	dp_display_send_hpd_event(&dp->dp_display);
>   
>   	return 0;
>   }

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
