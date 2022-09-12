Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6655B6118
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 20:37:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B0E10E137;
	Mon, 12 Sep 2022 18:37:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C5A10E13D
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 18:37:23 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id a14so9505150ljj.8
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 11:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=mo0xYdjPNpZiahHOR94h5CTJKhNqWSHm+oWy5fg8cNI=;
 b=pHRztTxM4pWOgSvsoaFKzmPB9AvHg29ymH0gJF9MzsJE9BgHtsjDL1q35eLBhAoxPY
 HkNNw4IxRzUyqJCz060VxKoVLJE3d3tfyiULCc8ltdCdepERxn/BrINbFPJ3D3Fc6oXE
 Jwd2M8LB/nP7o7nfL0B6+tJa0IAIMMlAck54iffSl4PfGNQ1pTnqYIu+Rc7ZXoqcZ9CJ
 T7uel7Yb/V+pzHr9504GzFzAm2Y6yMSwwtyYDu7eTILDghqWlEkW66vfAHX9I4evEuWF
 SioVmBla2CsVEEGRWQgBYvHBXe8/d2NEAUK2Al19bTxRacYtFXn6CEllie2BTnGCHqrc
 BX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=mo0xYdjPNpZiahHOR94h5CTJKhNqWSHm+oWy5fg8cNI=;
 b=zZz7Ax4R1pNfQyvOyzs5UqsXTb29tMwju4QjMe+mEma7+YtYtExE0uOxsqqUigEXGV
 hVtfzrykkAq/sHhAqH7YeoE8ThpzQ06bywhDaLnU5YSHx2NVss0MPDcq6Rpx891CA3mm
 v3UwNI5Txx8MNIL1GgaSR39ZOBWsu0z111DmItkbzDHFlreWZNqHm0kMxOry6iE61SJh
 91LxQoXVJ6e24ZH2rJr/q+UNYkne9vqytD4PNY4I6vXL5Y8QaBXFaLl3S8a+zwxFSEqi
 yQ7VhWUi4YelmdmfCo6seyJSwwXB8LTETdgoS4671uP+CX2ChebSgOgKkAT/cWlMcRat
 AdwA==
X-Gm-Message-State: ACgBeo1DaUfX3Sf5A0OzjKlZv9/fHkkc7Lp+L0zkC1HVIP7nhN+ydJIY
 puXFmblCsgVCHdHgx0+lseI9Lg==
X-Google-Smtp-Source: AA6agR7vubIG0+XIw39Zt1ct04GLvMTZSzuisgoMMfI1SDteYWNLf1sIBPKpN0mJUjoqodPB1z4XUw==
X-Received: by 2002:a2e:a787:0:b0:26b:ded1:7652 with SMTP id
 c7-20020a2ea787000000b0026bded17652mr5702450ljf.263.1663007841645; 
 Mon, 12 Sep 2022 11:37:21 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 cf11-20020a056512280b00b00499b232875dsm1116793lfb.171.2022.09.12.11.37.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 11:37:21 -0700 (PDT)
Message-ID: <067c7bc0-4746-f714-db56-a3c9e4f25588@linaro.org>
Date: Mon, 12 Sep 2022 21:37:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v5 3/3] drm/msm/dp: retry 3 times if set sink to D0 poweer
 state failed
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 agross@kernel.org, bjorn.andersson@linaro.org
References: <1662999830-13916-1-git-send-email-quic_khsieh@quicinc.com>
 <1662999830-13916-4-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1662999830-13916-4-git-send-email-quic_khsieh@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/09/2022 19:23, Kuogee Hsieh wrote:
> Bring sink out of D3 (power down) mode into D0 (normal operation) mode
> by setting DP_SET_POWER_D0 bit to DP_SET_POWER dpcd register. This
> patch will retry 3 times if written to DP_SET_POWER register failed.

Could you please elaborate this change? Can the sink succeed in reading 
the DP_SET_POWER, but fail writing DP_SET_POWER?

> 
> Changes in v5:
> -- split into two patches
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_link.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index 9d5381d..4360728 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -50,6 +50,7 @@ static int dp_aux_link_power_up(struct drm_dp_aux *aux,
>   {
>   	u8 value;
>   	ssize_t len;
> +	int i;
>   
>   	if (link->revision < 0x11)
>   		return 0;
> @@ -61,11 +62,13 @@ static int dp_aux_link_power_up(struct drm_dp_aux *aux,
>   	value &= ~DP_SET_POWER_MASK;
>   	value |= DP_SET_POWER_D0;
>   
> -	len = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
> -	if (len < 0)
> -		return len;
> -
> -	usleep_range(1000, 2000);
> +	/* retry for 1ms to give the sink time to wake up */
> +	for (i = 0; i < 3; i++) {
> +		len = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
> +		usleep_range(1000, 2000);
> +		if (len == 1)
> +			break;
> +	}
>   
>   	return 0;
>   }

-- 
With best wishes
Dmitry

