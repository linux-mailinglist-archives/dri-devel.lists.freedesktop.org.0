Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AA81E21EB
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 14:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C866A6E17E;
	Tue, 26 May 2020 12:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308076E17E
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 12:32:41 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id y5so3024058wmj.4
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 05:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LbsXZlSJ6mM5YuG/Buamk1h7fSSiXTc8VSuG+rzaVVM=;
 b=NeWFwHZARMp6IWl1uL16S4jUhaLeXaJEr+BttgJXRl4aqbWWz1UuWiMj9kwRvwC9eV
 dyFNFEG9CJ9G1a8TpwwvV3RnzxMOB8YBRExNstaqtxXA2rEyiI+A3pp8B3ElUYPoMCEs
 2R1O4i/p2UEMI/i2iCjUTvJQbYh1yhxB99omUzzhQhfNk/PCQZpEEgK5sJgYFEFrs5SC
 GyTy0iZcP7C9H2dE/hVbOpxVazVlnbMiUtAzF1/rZFtLS+8IO8VK8Q/H1VlCVSTM3Hw+
 q1gvASeK6HOPdEvJ8fWuqGRlUQjzWfwSps+9ipSmiS/bUgN8SMsIr/lXONHHHwj88klt
 Kdhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=LbsXZlSJ6mM5YuG/Buamk1h7fSSiXTc8VSuG+rzaVVM=;
 b=cRcfL1KlHsxY5IOPgx4ZmxtBkFps2INbDD12LSqoZUQABLPoS+o+v1a5sX94GtkLaB
 mpQvOK4XTCfybdwxf9kUFXbOSAZQ4Kk/WRK40lto7VxrvzUQKPnIzIHMxCZueZ47dfrA
 zZ+9StOvjM04BzFgUQHeAurhgXVmqKZs6zbK+91B8mZT18EVEL94kDEn8Ix8i2G5z51A
 vZIAaLtXHNHcu1WciQyzVSb6xpX/A+U7pqG0gDd+cGxLKFll4mg8EMdcuRAQ6QlaptM2
 jhUs30X1ehK/Ez8bwVCI3iPrFoHL4FoSLyx0iXH1GbG5Ei2oXEcA3Eu5zEVu4hgg9yC1
 dfgw==
X-Gm-Message-State: AOAM530JB71y6a3lOa/u3fslzLkQTnJ2XUHqnzV2y8q7S+ZHz0/PkH/h
 XYT5dm7ML8LKDksLBEzguVjarw==
X-Google-Smtp-Source: ABdhPJzczdS2K1qtXO9fpwHdLXNiwkWPJbooUA5vQn+T2ijPeHFHzDWnBUiNbg0hCDFbD8sk3CcWpA==
X-Received: by 2002:a1c:6042:: with SMTP id u63mr1178660wmb.65.1590496359644; 
 Tue, 26 May 2020 05:32:39 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:acf8:18a8:b3a5:a17b?
 ([2a01:e35:2ec0:82b0:acf8:18a8:b3a5:a17b])
 by smtp.gmail.com with ESMTPSA id 94sm22284340wrf.74.2020.05.26.05.32.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2020 05:32:39 -0700 (PDT)
Subject: Re: [PATCH 14/27] drm: meson: dw-hdmi: Use dw_hdmi context to replace
 hack
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200526011505.31884-15-laurent.pinchart+renesas@ideasonboard.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <16f998ea-6666-c2ca-56f9-dfde14bb8769@baylibre.com>
Date: Tue, 26 May 2020 14:32:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200526011505.31884-15-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 linux-amlogic@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/05/2020 03:14, Laurent Pinchart wrote:
> The meson-dw-hdmi driver needs to access its own context from the
> .mode_valid() operation. It currently gets it from the dev_private field
> of the drm_device retrieved from the connector, which is a hack. Use the
> private data passed to the .mode_valid() operation instead.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/meson/meson_dw_hdmi.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 5cc311c1b8e0..34ba94922605 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -634,7 +634,8 @@ dw_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
>  		   struct drm_connector *connector,
>  		   const struct drm_display_mode *mode)
>  {
> -	struct meson_drm *priv = connector->dev->dev_private;
> +	struct meson_dw_hdmi *dw_hdmi = data;
> +	struct meson_drm *priv = dw_hdmi->priv;
>  	bool is_hdmi2_sink = connector->display_info.hdmi.scdc.supported;
>  	unsigned int phy_freq;
>  	unsigned int vclk_freq;
> @@ -693,7 +694,7 @@ dw_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
>  	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
>  		venc_freq /= 2;
>  
> -	dev_dbg(connector->dev->dev, "%s: vclk:%d phy=%d venc=%d hdmi=%d\n",
> +	dev_dbg(dw_hdmi->dev, "%s: vclk:%d phy=%d venc=%d hdmi=%d\n",
>  		__func__, phy_freq, vclk_freq, venc_freq, hdmi_freq);
>  
>  	return meson_vclk_vic_supported_freq(priv, phy_freq, vclk_freq);
> @@ -1068,6 +1069,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  
>  	/* Bridge / Connector */
>  
> +	dw_plat_data->priv_data = meson_dw_hdmi;
>  	dw_plat_data->mode_valid = dw_hdmi_mode_valid;
>  	dw_plat_data->phy_ops = &meson_dw_hdmi_phy_ops;
>  	dw_plat_data->phy_name = "meson_dw_hdmi_phy";
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
