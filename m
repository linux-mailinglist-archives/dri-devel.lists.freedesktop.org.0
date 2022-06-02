Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DAB53B6F2
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 12:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F49112D73;
	Thu,  2 Jun 2022 10:22:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E294A112D73
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 10:22:38 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id r8so4186855ljp.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 03:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mhke0saUmUh/aB/di9/WbB1JwcFcgftrzK7UikGh97E=;
 b=bFvw+MLHVt+ArFBhnhxD4VGaWyar1Iw3Ys0oV4R9sP/bLgk9xK9kxzaaTZalR0EZcs
 DYSWd3KPnS2lKOJh8kuqKmbP0WytCHCLGP6f8aTF+7KR6jaPf/5c6UWfEtDMiLmKuYvu
 nSRNVsYr30Wy9XsFQjKkTsSelPDRlDAzdaouzM8KqVJC1FgwxXkJQKq2hqYkt76XSiQB
 zVCYTPHReYyktuzPNOEHoZK7KUZiiTF95MfsA6Lj40AukNe97nQ2ovR44xX/dekLSSVa
 TxXYFlcJ7uFbdFw6GvMxus+wXABsmy51VnApOpbnLGuauTZdeDtz6FXQ0PgkF3PwHF3w
 mrAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mhke0saUmUh/aB/di9/WbB1JwcFcgftrzK7UikGh97E=;
 b=4DHOY/pzj2XuB0YnCISMLziJlxJ5cuq4sbEo8RfSEZseWdrQ4968o3dlBTMk2qG71S
 dSoHML5GSY6tOLq68ri4i9MDpE1+Likd2u2h4e3J/zlJy0Qma7/2DbBmrwtJ6QU+ZL3T
 yzKB0qowjpBkkDJilIC+xKPgdBCIQmSY6BeksDe9rAsJjQePJF5JvgOnmN3twIcEpINO
 pEaNStFrjOZI3+d94G2ZHLwb1buXw8c2sGHPaKFHI1mZXegDK7xr+Bib72x5jba2S2zE
 GQmT0/WtCX2P6KhdLM3dR5B95/ythl6XSBszUSZ5Ew2xwSPcAxJQVW/Lwhlpc/GXuwcc
 t26A==
X-Gm-Message-State: AOAM530LFMe6J8TRsVTrQPyXTToVp+RoO8s37EQwDfN7SCh8An39mzc8
 5+jlPiQX5bDR0mHjhj1UrAMiQg==
X-Google-Smtp-Source: ABdhPJxBmqiSkec8TbeMYs+RFw+Rm4q/emiOOaTWMfi/pJk8O6t7jgcEYLMBlu3LcQem9bMjd/eBbg==
X-Received: by 2002:a2e:8881:0:b0:255:7790:25e6 with SMTP id
 k1-20020a2e8881000000b00255779025e6mr964729lji.525.1654165357162; 
 Thu, 02 Jun 2022 03:22:37 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a0565123d1000b0047255d21132sm961705lfv.97.2022.06.02.03.22.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 03:22:36 -0700 (PDT)
Message-ID: <b157ebf3-9846-1235-c8e7-693abe4569d3@linaro.org>
Date: Thu, 2 Jun 2022 13:22:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 1/4] drm/dp: Add wait_hpd_asserted() callback to struct
 drm_dp_aux
Content-Language: en-GB
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
References: <20220418171757.2282651-1-dianders@chromium.org>
 <20220418101725.v3.1.Icf57bb12233a47727013c6ab69eebf803e22ebc1@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220418101725.v3.1.Icf57bb12233a47727013c6ab69eebf803e22ebc1@changeid>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, Kees Cook <keescook@chromium.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Jani Nikula <jani.nikula@intel.com>, Maxime Ripard <maxime@cerno.tech>,
 Hsin-Yi Wang <hsinyi@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/04/2022 20:17, Douglas Anderson wrote:
> Sometimes it's useful for users of the DP AUX bus (like panels) to be
> able to poll HPD. Let's add a callback that allows DP AUX busses
> drivers to provide this.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> ---
> Left Dmitry's Reviewed-by tag off since patch changed enough.
> 
> (no changes since v2)
> 
> Changes in v2:
> - Change is_hpd_asserted() to wait_hpd_asserted()
> 
>   include/drm/dp/drm_dp_helper.h | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/include/drm/dp/drm_dp_helper.h b/include/drm/dp/drm_dp_helper.h
> index 53d1e722f4de..0940c415db8c 100644
> --- a/include/drm/dp/drm_dp_helper.h
> +++ b/include/drm/dp/drm_dp_helper.h
> @@ -2035,6 +2035,32 @@ struct drm_dp_aux {
>   	ssize_t (*transfer)(struct drm_dp_aux *aux,
>   			    struct drm_dp_aux_msg *msg);
>   
> +	/**
> +	 * @wait_hpd_asserted: wait for HPD to be asserted
> +	 *
> +	 * This is mainly useful for eDP panels drivers to wait for an eDP
> +	 * panel to finish powering on. This is an optional function.
> +	 *
> +	 * This function will efficiently wait for up to `wait_us` microseconds
> +	 * for HPD to be asserted and might sleep.
> +	 *
> +	 * This function returns 0 if HPD was asserted or -ETIMEDOUT if time
> +	 * expired and HPD wasn't asserted. This function should not print
> +	 * timeout errors to the log.
> +	 *
> +	 * The semantics of this function are designed to match the
> +	 * readx_poll_timeout() function. That means a `wait_us` of 0 means
> +	 * to wait forever. If you want to do a quick poll you could pass 1
> +	 * for `wait_us`.
> +	 *
> +	 * NOTE: this function specifically reports the state of the HPD pin
> +	 * that's associated with the DP AUX channel. This is different from
> +	 * the HPD concept in much of the rest of DRM which is more about
> +	 * physical presence of a display. For eDP, for instance, a display is
> +	 * assumed always present even if the HPD pin is deasserted.
> +	 */
> +	int (*wait_hpd_asserted)(struct drm_dp_aux *aux, unsigned long wait_us);
> +
>   	/**
>   	 * @i2c_nack_count: Counts I2C NACKs, used for DP validation.
>   	 */


-- 
With best wishes
Dmitry
