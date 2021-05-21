Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A2038CA20
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 17:32:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E246EB0E;
	Fri, 21 May 2021 15:32:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEAD26EB63
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 15:32:12 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id r12so21488132wrp.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 08:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=CNMKcijQVquaMBJ+WGo20PjbrA43l1fqxKOe5bq3x5g=;
 b=F9unqGpK9ZQWLu39xhVuEsxgo/Cbu5rApxCHVDojuxkO9F4/RQCxzbo8HGlGB9Dwu5
 sM9mNN3i5SwK9YGrVlkvXFAxgPngSsy9cqNGKYFZDGruGE0vZ1KPnWms9rkNWPMq86ue
 LNYGJnmtkyvjXNUO8651tNd4MS/Gs8LBCpzKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=CNMKcijQVquaMBJ+WGo20PjbrA43l1fqxKOe5bq3x5g=;
 b=YaXl3p0k/Y9QG+WRCIAvAdie0a3aXrywu2Sp8zq6ax24nP2MDDj7SKHV1MtS/rYaoS
 rd/QkgzQwBshsLdQ84Vbm48fdso0ahtiKb4PkcOmqRh3hyowoEgEHEPvF+TWUJKNIfH4
 jTl3c50ew9GeQDycUmCAwY0N8+18d5vi4sAvaWW0uQnqRW+jRi/ZFbJG/9PxtT4w7UyV
 f9WE/MSQbIdWt5BWnyuwX+WZ+I9qbn7dclZgDidrItFfuNfQXNwIcjyRv38mlllZPZYZ
 glzJxJ4YHnIZOBCVA/lQgi9e24XyUV4drDqy5GzjnpSwEYQL7Rf7qdpgbNS/T2TrkkZT
 GLfg==
X-Gm-Message-State: AOAM530F5Z4v4L0l+pE+KlS/bCnuzPrHc3CBCl6PRsKU/KItDGMvuDdi
 Jrz2KDGviLTjTTXXCmFp74RBPg==
X-Google-Smtp-Source: ABdhPJy7hNKHarTmPB2N61OrXBmySG8p0l/JeTOBfBGdkOtjecHjbovid48JSrymvCZOc64qF7pPxA==
X-Received: by 2002:adf:e4c8:: with SMTP id v8mr10338485wrm.345.1621611131705; 
 Fri, 21 May 2021 08:32:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q1sm12703589wmq.48.2021.05.21.08.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 08:32:11 -0700 (PDT)
Date: Fri, 21 May 2021 17:32:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Zou Wei <zou_wei@huawei.com>
Subject: Re: [PATCH -next] drm: Fix PM reference leak
Message-ID: <YKfSeS1vvqKNSRSH@phenom.ffwll.local>
Mail-Followup-To: Zou Wei <zou_wei@huawei.com>, a.hajda@samsung.com,
 narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, emma@anholt.net,
 mripard@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <1621602186-74786-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621602186-74786-1-git-send-email-zou_wei@huawei.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: emma@anholt.net, jonas@kwiboo.se, airlied@linux.ie, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 21, 2021 at 09:03:06PM +0800, Zou Wei wrote:
> pm_runtime_get_sync will increment pm usage counter even it failed.
> Forgetting to putting operation will result in reference leak here.
> Fix it by replacing it with pm_runtime_resume_and_get to keep usage
> counter balanced.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>

Looks good, but can you pls split this up into a patch per driver (vc and
bridge/cdns-dsi here)?

Thanks, Daniel

> ---
>  drivers/gpu/drm/bridge/cdns-dsi.c | 2 +-
>  drivers/gpu/drm/vc4/vc4_hdmi.c    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cdns-dsi.c b/drivers/gpu/drm/bridge/cdns-dsi.c
> index 76373e3..b31281f 100644
> --- a/drivers/gpu/drm/bridge/cdns-dsi.c
> +++ b/drivers/gpu/drm/bridge/cdns-dsi.c
> @@ -1028,7 +1028,7 @@ static ssize_t cdns_dsi_transfer(struct mipi_dsi_host *host,
>  	struct mipi_dsi_packet packet;
>  	int ret, i, tx_len, rx_len;
>  
> -	ret = pm_runtime_get_sync(host->dev);
> +	ret = pm_runtime_resume_and_get(host->dev);
>  	if (ret < 0)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index c27b287..f20a65b 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -798,7 +798,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
>  	unsigned long pixel_rate, hsm_rate;
>  	int ret;
>  
> -	ret = pm_runtime_get_sync(&vc4_hdmi->pdev->dev);
> +	ret = pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev);
>  	if (ret < 0) {
>  		DRM_ERROR("Failed to retain power domain: %d\n", ret);
>  		return;
> -- 
> 2.6.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
