Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D84523F6E
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 23:27:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 545FC10EEC9;
	Wed, 11 May 2022 21:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A26A10EED9
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 21:27:05 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id y32so5761076lfa.6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 14:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0t9E9hcubacycb/zfx8NOSEjN1B6k+ZB3dddohbc/ik=;
 b=kM3dmvoncuD5XtNPlhBAKOP2qXP2ajDKmQmc1lBzJca2oYpJO1qR2EKzsLRYmIBBGL
 F/2Ki+OsQfYsDfDNLQPyHLngCEJpG7Hmv03c8SCUEPdnHM1eDhKoUnRgzR3wlpF/IdkF
 SsVYG9b0LTVmdk0af6aEyhOsON9J549uHEB+eVcaC3zGAwNNYxs+i1p/sDHFQDax3rn0
 WDvMd2HDY0d9/I/Lx8D6PVSigLHMTb7rFTFfn0BwyGgz9F2C9rgEmoKnLPZyKTW+dCBF
 pdpZczEaXwNlNuZ98OjNnrFRfW9dxZ2E6mADUSPaKoYjgKuiFxYNnXUsQLervijrtRt0
 jj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0t9E9hcubacycb/zfx8NOSEjN1B6k+ZB3dddohbc/ik=;
 b=LUX5qVh5Wm5Az2A1TadITOjfImd9L0/iGDUv7NntUTSKZxqylJC81InaRGT0FFsa2n
 4ZC9MjTLKxQdC12VC+ERpapesZyhizUwjFkJSDh8WdppwJXIHslo7BTVj03D1DUCgHaj
 odDY8nffEqrWRcvFuwl1fY85lqnmw66TjWEDaHRdzmKX0LH9At76QqoIzypzK6ZmFXWI
 Bq5/sfno5q6etlhHjUdQ/h8OmDw+4UuaMZo+wGNtIF1tKKwfhTwbvA25Cp+LKflAqtY/
 oz3hw2/qEzz1ONHuDi57yuvtx9uP7868QLj/eFhfmOb0uOY18OhMN0ogUal1y/DaRg5Z
 xj4A==
X-Gm-Message-State: AOAM530GR4l5po4FETtFjaaGouozV4jmSBcyA2isfRF2NABEGfLkafIG
 nTorq82MtiK1XKV3IUEm+CgK2w==
X-Google-Smtp-Source: ABdhPJxJbTJa9hCT9uXv/2v5fnZ5XvY4eL65/ufFsRs0owsiNgUQf/BPFxlypK8lT+xGGI+GzA004w==
X-Received: by 2002:a05:6512:401d:b0:473:c7e2:f3ca with SMTP id
 br29-20020a056512401d00b00473c7e2f3camr22421513lfb.153.1652304424182; 
 Wed, 11 May 2022 14:27:04 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 d7-20020a05651c088700b0024f3d1daeadsm538518ljq.53.2022.05.11.14.27.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 14:27:03 -0700 (PDT)
Message-ID: <e9ab2ffe-4e98-6f12-927e-5defa1fae304@linaro.org>
Date: Thu, 12 May 2022 00:27:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3] drm/msm/dp: Always clear mask bits to disable
 interrupts at dp_ctrl_reset_irq_ctrl()
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
 vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie, agross@kernel.org,
 bjorn.andersson@linaro.org
References: <1652299449-31205-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1652299449-31205-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/05/2022 23:04, Kuogee Hsieh wrote:
> dp_catalog_ctrl_reset() will software reset DP controller. But it will
> not reset programmable registers to default value. DP driver still have
> to clear mask bits to interrupt status registers to disable interrupts
> after software reset of controller. This patch removes the enable flag
> condition checking to always clear mask bits of interrupt status
> registers to disable interrupts if enable flag is false.
> 
> This patch also will fix the potential problem happen at system suspend where
> dp_ctrl_reset_irq_ctrl() was called to try to disable HPD related irqs but
> the irq is still unmasked unexpectedly and can come in while system are
> suspending. This leads to bus hangs if the irq is handled after we power down
> the DP hardware because we run the irq handler and access a device register
> assuming that no irq could ever come in if we powered down the device. We
> don't know when the irq will be handled though, so it's possible the irq is
> pending from before we disable the irq in the hardware.
> 
> Changes in v2:
> -- add more details commit text
> 
> Changes in v3:
> -- add synchrons_irq()
> -- add atomic_t suspended
> 
> Fixes: ba0a422be723 ("drm/msm/dp: do not initialize phy until plugin interrupt received")

Revision in the Fixes tag is incorrect

> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_ctrl.c    |  9 +++++++--
>   drivers/gpu/drm/msm/dp/dp_display.c | 18 ++++++++++++++++++
>   2 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index af7a80c..f3e333e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1389,8 +1389,13 @@ void dp_ctrl_reset_irq_ctrl(struct dp_ctrl *dp_ctrl, bool enable)
>   
>   	dp_catalog_ctrl_reset(ctrl->catalog);
>   
> -	if (enable)
> -		dp_catalog_ctrl_enable_irq(ctrl->catalog, enable);
> +	/*
> +	 * all dp controller programmable registers will not
> +	 * be reset to default value after DP_SW_RESET
> +	 * therefore interrupt mask bits have to be updated
> +	 * to enable/disable interrupts
> +	 */
> +	dp_catalog_ctrl_enable_irq(ctrl->catalog, enable);
>   }
>   
>   void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index c388323..c34dbfc 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -98,6 +98,8 @@ struct dp_display_private {
>   	struct dp_ctrl    *ctrl;
>   	struct dp_debug   *debug;
>   
> +	atomic_t suspended;
> +
>   	struct dp_usbpd_cb usbpd_cb;
>   	struct dp_display_mode dp_mode;
>   	struct msm_dp dp_display;
> @@ -187,6 +189,11 @@ static int dp_add_event(struct dp_display_private *dp_priv, u32 event,
>   	int pndx;
>   
>   	spin_lock_irqsave(&dp_priv->event_lock, flag);
> +	if (atomic_read(&dp_priv->suspended)) {
> +		spin_unlock_irqrestore(&dp_priv->event_lock, flag);
> +		return -EPERM;
> +	}
> +
>   	pndx = dp_priv->event_pndx + 1;
>   	pndx %= DP_EVENT_Q_MAX;
>   	if (pndx == dp_priv->event_gndx) {
> @@ -454,6 +461,13 @@ static void dp_display_host_deinit(struct dp_display_private *dp)
>   		dp->dp_display.connector_type, dp->core_initialized,
>   		dp->phy_initialized);
>   
> +	if (!dp->core_initialized) {
> +		DRM_DEBUG_DP("DP core not initialized\n");
> +		return;
> +	}
> +
> +	synchronize_irq(dp->irq);
> +
>   	dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
>   	dp_aux_deinit(dp->aux);
>   	dp_power_deinit(dp->power);
> @@ -1362,6 +1376,8 @@ static int dp_pm_resume(struct device *dev)
>   		dp->dp_display.connector_type, dp->core_initialized,
>   		dp->phy_initialized, dp_display->power_on);
>   
> +	atomic_set(&dp->suspended, 0);
> +
>   	/* start from disconnected state */
>   	dp->hpd_state = ST_DISCONNECTED;
>   
> @@ -1431,6 +1447,8 @@ static int dp_pm_suspend(struct device *dev)
>   		dp->dp_display.connector_type, dp->core_initialized,
>   		dp->phy_initialized, dp_display->power_on);
>   
> +	atomic_inc(&dp->suspended);
> +
>   	/* mainlink enabled */
>   	if (dp_power_clk_status(dp->power, DP_CTRL_PM))
>   		dp_ctrl_off_link_stream(dp->ctrl);


-- 
With best wishes
Dmitry
