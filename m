Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECA05256C7
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 22:59:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA6310EB1D;
	Thu, 12 May 2022 20:59:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9997310EA04
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 20:59:03 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id b18so11175400lfv.9
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 13:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+QzGJTvCvX/Tp+rKIYyLc9ObXbm26PwN+ZPeeu5sbv8=;
 b=F/PZNisIZWAXwRg66sgt2TnzUNMrHlKMf9QBjNVbNSzou/e3RFLvySuHID2qefJ8Kx
 Mc1faerfTJpyTNYejLm4Q3gdMcKl0wKSfdVprabvrsTDVqOmGZVfGUAFNwGMmb1NJ0fG
 nr/EbgkzTuabVCRO/9mF6//63TjJtddzo/f6dbNrIsVU0x6zIwyFlXGWSEIL1fJerpwf
 V0sUqCsdJhNdaktWHgm+/dNrRxssTS8YqROM/eMi77Ifmg57o4iX8bkg6D6ymAP2smK5
 HJ+yVF/N2dwdGhVjxSloraxEPfX/Z+URDEaahNJFtPjmQXixzc3rOFffDOkudIESCLV3
 FeIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+QzGJTvCvX/Tp+rKIYyLc9ObXbm26PwN+ZPeeu5sbv8=;
 b=eBIlCwZrcVYEGf4KRMxWnAs4Xnms66nTkUCa80gVqP5aCNaIdx4GsJFL7IEgiR/Q4a
 d3ksTJuiE7Jr0WH4B2sITbTCHlk/2CwxvJZy5ZeC7nuIWg+qzzEattd1mk6dRWFWAWSp
 UjqxuvfPAI5rO8VY7TeBgwQ4s3gGcnT6R8n6WGsGBO5ByXUrUv92xkGSI5Haku7TxUb9
 kVbU148WGT7OAyYFsX0JZd2yX5DXS+xsXIBoMr3b4fLKjUe6CYtqEZnVtZzAIz6TIn6z
 NYMEOdD3ZAmYTlQkQSqCo81xpArcJA+hN3bjeONlT9+0mDIfhVGC9ihCRn7hPiH8hO6d
 8wpg==
X-Gm-Message-State: AOAM532CA91LuYmbbQGORXTX5w5/G6vnWcMGS+mgWA/uJ/d3Y2b5hosQ
 wlVnRvpYAiGTCc/T/reFGpD60Q==
X-Google-Smtp-Source: ABdhPJxY3vfl5CmuGdfluIk7eDh4d454OFIFjElvC9u6pF71RXntAwwzhyEQi/MvSrdXhDzrB0duwQ==
X-Received: by 2002:a05:6512:321c:b0:46b:b7fd:1eca with SMTP id
 d28-20020a056512321c00b0046bb7fd1ecamr1123052lfe.481.1652389141810; 
 Thu, 12 May 2022 13:59:01 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 c13-20020a2ebf0d000000b0025052e35be2sm85333ljr.130.2022.05.12.13.59.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 13:59:01 -0700 (PDT)
Message-ID: <e8d75148-22ee-5809-fc65-d0fb38ad4876@linaro.org>
Date: Thu, 12 May 2022 23:58:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3] drm/msm/dsi: only powerup at modeset time if
 "early_poweron" modparam
Content-Language: en-GB
To: Douglas Anderson <dianders@chromium.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220512135134.v3.1.Ia196e35ad985059e77b038a41662faae9e26f411@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220512135134.v3.1.Ia196e35ad985059e77b038a41662faae9e26f411@changeid>
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/05/2022 23:52, Douglas Anderson wrote:
> Commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
> time") caused sc7180 Chromebooks that use the parade-ps8640 bridge
> chip to fail to turn the display back on after it turns off.
> 
> Unfortunately, it doesn't look easy to fix the parade-ps8640 driver to
> handle the new power sequence. The Linux driver has almost nothing in
> it and most of the logic for this bridge chip is in black-box firmware
> that the bridge chip uses.
> 
> Also unfortunately, reverting the patch will break "tc358762".
> 
> The long term solution here is probably Dave Stevenson's series [1]
> that would give more flexibility. However, that is likely not a quick
> fix.
> 
> For the short term, let's introduce a module parameter that selects
> between the two behaviors. This is a short term hack but at least can
> keep both users working. We'll default the value of the module
> parameter to the old behavior. Given that the old behavior has existed
> for longer it's probably a safer default.
> 
> [1] https://lore.kernel.org/r/cover.1646406653.git.dave.stevenson@raspberrypi.com
> 
> Fixes: 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset time")
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Two minor issues below.

> ---
> 
> Changes in v3:
> - No longer a revert; now a module parameter.
> 
> Changes in v2:
> - Remove the mud from my face.
> 
>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index 50b987658b1f..2bf4123ef5df 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -34,6 +34,10 @@ static struct msm_dsi_manager msm_dsim_glb;
>   #define IS_SYNC_NEEDED()	(msm_dsim_glb.is_sync_needed)
>   #define IS_MASTER_DSI_LINK(id)	(msm_dsim_glb.master_dsi_link_id == id)
>   
> +bool early_poweron;
> +MODULE_PARM_DESC(early_poweron, "Power DSI controller early");
> +module_param(early_poweron, bool, 0600);

Nit: dsi_early_poweron (to be clear that it related to DSI only).

I thought about suggesting 'dsi_no_early_poweron' instead to catch 
possible issues with other bridges. But... I think with Dave's series 
will have to enable bridges one by one, so it doesn't make real sense.

> +
>   static inline struct msm_dsi *dsi_mgr_get_dsi(int id)
>   {
>   	return msm_dsim_glb.dsi[id];
> @@ -389,6 +393,9 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
>   	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
>   		return;
>   
> +	if (!early_poweron)
> +		dsi_mgr_bridge_power_on(bridge);
> +
>   	/* Always call panel functions once, because even for dual panels,
>   	 * there is only one drm_panel instance.
>   	 */
> @@ -570,7 +577,8 @@ static void dsi_mgr_bridge_mode_set(struct drm_bridge *bridge,
>   	if (is_bonded_dsi && other_dsi)
>   		msm_dsi_host_set_display_mode(other_dsi->host, adjusted_mode);
>   
> -	dsi_mgr_bridge_power_on(bridge);
> +	if (early_poweron)
> +		dsi_mgr_bridge_power_on(bridge);
>   }
>   
>   static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,


-- 
With best wishes
Dmitry
