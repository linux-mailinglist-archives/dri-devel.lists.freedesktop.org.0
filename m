Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADB614719A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 20:16:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D686FE34;
	Thu, 23 Jan 2020 19:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1EDB6FE34
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 19:16:38 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id n9so1963385pff.13
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 11:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6wtdQZE06z+aORJTnpPZKoEwjECFJKRvpZenOyG2pbs=;
 b=fTwlNQnSmBYcTlW2X4DkUAm58zuHxoeu1OEc1vVlBWKcW7LfEspLDnJ4HX4efyba1l
 uObRu4eaRbt9SL8oC69dLx0ZzK8f0kGqGgDXBigb4khY/TnOqcOfpmpj0x3bKD/JteV6
 Jwk1lWXngMbf/5avCtsxAskWpmpWiUPoVg32g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6wtdQZE06z+aORJTnpPZKoEwjECFJKRvpZenOyG2pbs=;
 b=eteMrCymYSAJ4tMnLvM126Ak/Xc7mCFEwJm6Uyvruc1YnX26SIg+sPerarnpxXhZc0
 qrxHc0GKwIvjNNwh/B2ar+03T+puTgqURCaYT4LqSsSJHIdxSvC7NWpECcD52RzgEvz1
 X/MXa1eXWCCwQ8bcf7cNoQmGPfApFPcDajDUq3gBXvCa/wXkECpWXcryfBFgNLJnq12Z
 uJHsBU7+sTxAkp4WxGZiBvEb3lJx1sVQoo/SMcysSjXOFcXGrf7E+wpfPw4RMjbJkyNe
 Aqt0wWfMuztu17dh9/fb2BXZxf4zsSgGYAGUuYkoU1pzYq8/qKNvwqzHW0Y3AoP+vAnE
 eCxw==
X-Gm-Message-State: APjAAAWyvbzO7y3ZfyxOZu4gwyLKAcAaPSuTOelB4NyhEQJ8O4k21eov
 ibdnyKH88b0vc6BRyUVvmh9vmw==
X-Google-Smtp-Source: APXvYqw0a9ZjVf1aQi0SykCpNbX3nRr/2knF42uGFzUQInRewtmQbXeOhyiUEjTVPoGuKU6GqXuSJg==
X-Received: by 2002:a65:4d0b:: with SMTP id i11mr336402pgt.340.1579806998644; 
 Thu, 23 Jan 2020 11:16:38 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id w8sm3323441pfn.186.2020.01.23.11.16.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2020 11:16:38 -0800 (PST)
Date: Thu, 23 Jan 2020 11:16:36 -0800
From: Matthias Kaehlcke <mka@chromium.org>
To: Jordan Crouse <jcrouse@codeaurora.org>
Subject: Re: [PATCH] drm/msm: Fix a6xx GMU shutdown sequence
Message-ID: <20200123191636.GY89495@google.com>
References: <1579797756-10292-1-git-send-email-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1579797756-10292-1-git-send-email-jcrouse@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <sean@poorly.run>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jordan,

On Thu, Jan 23, 2020 at 09:42:36AM -0700, Jordan Crouse wrote:
> Commit e812744c5f95 ("drm: msm: a6xx: Add support for A618") missed
> updating the VBIF flush in a6xx_gmu_shutdown and instead
> inserted the new sequence into a6xx_pm_suspend along with a redundant
> GMU idle.
> 
> Move a6xx_bus_clear_pending_transactions to a6xx_gmu.c and use it in
> the appropriate place in the shutdown routine and remove the redundant
> idle call.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 36 +++++++++++++++++++++++++----
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 43 -----------------------------------
>  2 files changed, 31 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 983afea..f371227 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>
> ...
>
>  /* Gracefully try to shut down the GMU and by extension the GPU */
>  static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
>  {
> @@ -819,11 +849,7 @@ static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
>  			return;
>  		}
>  
> -		/* Clear the VBIF pipe before shutting down */
> -		gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, 0xf);
> -		spin_until((gpu_read(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL1) & 0xf)
> -			== 0xf);
> -		gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, 0);
> +		a6xx_bus_clear_pending_transactions(adreno_gpu);

With this the variable 'gpu' isn't used anymore in a6xx_gmu_shutdown(),
please remove it.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
