Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDA03A064D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 23:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A01B6EC61;
	Tue,  8 Jun 2021 21:41:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7F56EC62
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 21:41:24 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id p17so33665671lfc.6
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 14:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m2/Viwebc/2TFFYJCIrNgdNWp3SLfLGvPKMWPogNWF8=;
 b=lvDsHb6v06OsDFfbD6jb/6R9l4aXWoI98dHR4wni++83bOnzWqcpgrDIHB4nolIatK
 Ilz5ncN5fByEqtNk664hkwcd/R53BzkMj90wZx88FExCXMHhl1GuFUV6u4wcHMIPYRnf
 9vG6F3AVAI2rCgg49hFzdiGp8zRA2omUXadbOxDw0JM4sohgka6EJhCVhuU9ss/lC3+N
 EkYLgGg4uLmbV4TVBMxZzpWAe8/CJWsnRkvkE/OWeVybh5wZ970x+vYmhnwWXY5FdCgj
 2juTZfXYxZ4Y9fhvj4/atu6w/B3d1CU74IBGJaNtnxyAF68UTb2Dy+ojl927NSslQ4Tf
 FEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m2/Viwebc/2TFFYJCIrNgdNWp3SLfLGvPKMWPogNWF8=;
 b=DW+gajdyT4RMtdLDyZD4LirrGfs8/6cIqA0od18PQNKYcsWwf+F03EXuFvEytVcdTg
 JBWCkn4Vh4O2nijxngff+dHG9C8Be2RNzYOCSpbMLkihpQjG+VIRKZNQzl7I+TtXW9ra
 xAc6AeZI3Q4L7rqrbvnXeghpn9i0XJxwDRvZ5bSbW3d/LUn299lBoR1Javahb2l42mSv
 t2NCiuS0AwuKuyzSWNZcoOhw7bjGRwzncRG4tbftm1qPip64RO5ui5dTK0i1bbgHkMao
 SGEC2sjPaFKgjIYgimFXoKJXJykyuVtOkFaLoSgw3bLKrJFCVo9VzBILZNGRbAfa/Dor
 oQxA==
X-Gm-Message-State: AOAM533SwhPu4c65Y+rd4RbbmjwObDpzCpECdSUGCHRleDWvrtDnHmPo
 Ih6NtUGRePEf6dKJWu8jGER+LA==
X-Google-Smtp-Source: ABdhPJwmm2woy4Z9z+Av7c2XEY96pnzfeWiicQKHoJUqxhfyXisMrZ3kolFVbwfjasLOpJpkmxDung==
X-Received: by 2002:ac2:4d50:: with SMTP id 16mr16622726lfp.600.1623188482396; 
 Tue, 08 Jun 2021 14:41:22 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id q3sm100155lfb.279.2021.06.08.14.41.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 14:41:21 -0700 (PDT)
Subject: Re: [PATCH] drm/msm/dsi: Stash away calculated vco frequency on recalc
To: Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>
References: <20210608195519.125561-1-swboyd@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <a6356956-9d4a-6fe7-2acc-bbe968d3a936@linaro.org>
Date: Wed, 9 Jun 2021 00:41:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210608195519.125561-1-swboyd@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Abhinav Kumar <abhinavk@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen,

On 08/06/2021 22:55, Stephen Boyd wrote:
> A problem was reported on CoachZ devices where the display wouldn't come
> up, or it would be distorted. It turns out that the PLL code here wasn't
> getting called once dsi_pll_10nm_vco_recalc_rate() started returning the
> same exact frequency, down to the Hz, that the bootloader was setting
> instead of 0 when the clk was registered with the clk framework.
> 
> After commit 001d8dc33875 ("drm/msm/dsi: remove temp data from global
> pll structure") we use a hardcoded value for the parent clk frequency,
> i.e.  VCO_REF_CLK_RATE, and we also hardcode the value for FRAC_BITS,
> instead of getting it from the config structure. This combination of
> changes to the recalc function allows us to properly calculate the
> frequency of the PLL regardless of whether or not the PLL has been
> clk_prepare()d or clk_set_rate()d. That's a good improvement.
> 
> Unfortunately, this means that now we won't call down into the PLL clk
> driver when we call clk_set_rate() because the frequency calculated in
> the framework matches the frequency that is set in hardware. If the rate
> is the same as what we want it should be OK to not call the set_rate PLL
> op. The real problem is that the prepare op in this driver uses a
> private struct member to stash away the vco frequency so that it can
> call the set_rate op directly during prepare. Once the set_rate op is
> never called because recalc_rate told us the rate is the same, we don't
> set this private struct member before the prepare op runs, so we try to
> call the set_rate function directly with a frequency of 0. This
> effectively kills the PLL and configures it for a rate that won't work.
> Calling set_rate from prepare is really quite bad and will confuse any
> downstream clks about what the rate actually is of their parent. Fixing
> that will be a rather large change though so we leave that to later.
> 
> For now, let's stash away the rate we calculate during recalc so that
> the prepare op knows what frequency to set, instead of 0. This way
> things keep working and the display can enable the PLL properly. In the
> future, we should remove that code from the prepare op so that it
> doesn't even try to call the set rate function.
> 
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Abhinav Kumar <abhinavk@codeaurora.org>
> Fixes: 001d8dc33875 ("drm/msm/dsi: remove temp data from global pll structure")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Thank you for the lengthy explanation. May I suggest another solution:
  - Apply 
https://lore.kernel.org/linux-arm-msm/010101750064e17e-3db0087e-fc37-494d-aac9-2c2b9b0a7c5b-000000@us-west-2.amazonses.com/

  - And make save_state for 7nm and 10nm cache vco freq (like 14nm does).

What do you think?


> ---
> 
> I didn't update the 14nm file as the caching logic looks different. But
> between the 7nm and 10nm files it looks practically the same.
> 
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 1 +
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c  | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index 34bc93548fcf..657778889d35 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -432,6 +432,7 @@ static unsigned long dsi_pll_10nm_vco_recalc_rate(struct clk_hw *hw,
>   	pll_freq += div_u64(tmp64, multiplier);
>   
>   	vco_rate = pll_freq;
> +	pll_10nm->vco_current_rate = vco_rate;
>   
>   	DBG("DSI PLL%d returning vco rate = %lu, dec = %x, frac = %x",
>   	    pll_10nm->phy->id, (unsigned long)vco_rate, dec, frac);
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index e76ce40a12ab..6f96fbac8282 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -460,6 +460,7 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
>   	pll_freq += div_u64(tmp64, multiplier);
>   
>   	vco_rate = pll_freq;
> +	pll_7nm->vco_current_rate = vco_rate;
>   
>   	DBG("DSI PLL%d returning vco rate = %lu, dec = %x, frac = %x",
>   	    pll_7nm->phy->id, (unsigned long)vco_rate, dec, frac);
> 
> base-commit: 8124c8a6b35386f73523d27eacb71b5364a68c4c
> 


-- 
With best wishes
Dmitry
