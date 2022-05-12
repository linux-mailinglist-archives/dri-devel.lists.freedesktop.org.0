Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4000A5248FB
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 11:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A440A10ED35;
	Thu, 12 May 2022 09:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA1410EC2D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 09:32:15 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id u3so6414571wrg.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 02:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=VQN/aLux/2RP21RLeqsLxxrhMb3H+/UUp0giAkzj/KY=;
 b=WJZbJ3OILOz44m7dxa/s2kBpGiX7pJmSaVbOIL68jRiSqr9EeJmEipxQbwv+V0NeWH
 LDFrHfyUZfcjCqrG4pddn/y3+5G0c5SgjS9TTM6+PTlCLH4RtR3D+ArkoK6psjEf6TUn
 fFhHpqmqZjO8isUf5vpZOfmIsp2v9Z0HGvAZlf+bLlMtUWvDIgZ2uZ2Bstilfe+qxyDL
 wLuehjGI3xQCoLXdk+xwxtnZ9UQHyzOzbzastcFlEIjBi1G7+jsfaTswBPIhjzIYvaVN
 xiaukeNdk0zHeO4+Xa6a3EGLePNKgLcg1H5E37Yy1321Tq4c9g2iritE1Yf3Fe2q5/Xt
 nRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VQN/aLux/2RP21RLeqsLxxrhMb3H+/UUp0giAkzj/KY=;
 b=QDovXhr9OLHBjwbWZmeYIvpx/W7hNpfVsYcZZj4dVXtomlzluIHHayOzV6kZOHId3b
 dGqih8VdJmFqE7LQj4QEa7sWDb9uzSTAnmqXfdTorzIUyW4Bhs6dpeGsIcDyDZLuHGeC
 hJbKRW4Brt4A/F3VFm/Ds29omVXF4lC5GLPm8j8+SBnksHXHcsQhCNnsUdyLgFbeQTvm
 0wc2USa8ujuxGobeqcKZ7MKWA0UTit6nigZl8BxycXqWW0QtjV3nFD+yzNPewFz1aZPy
 H1jQ5LNTWWiORtxXVZ/WvzypX1A429ONgAmwr70IkZUP0cLIzdnlBPkWdTmoAyWr8kiA
 dtTA==
X-Gm-Message-State: AOAM533lB+dh0KUftHbExhBbap58rFTe+EMF6A6fjKuIneHYe22XpPRL
 LJwCdhQD6eJQtUliXe+ZAGUjfg==
X-Google-Smtp-Source: ABdhPJw00kG769CryQ6GyYt8QzevXxWsniJdsZ3bDBhdnyNPjJ/q5GSrgrVTkEWWjjGvXIW0MOpg9A==
X-Received: by 2002:adf:d1c2:0:b0:20c:a916:490e with SMTP id
 b2-20020adfd1c2000000b0020ca916490emr25540965wrd.403.1652347934209; 
 Thu, 12 May 2022 02:32:14 -0700 (PDT)
Received: from [10.1.3.188]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a7bc04c000000b003942a244ed6sm2203918wmc.27.2022.05.12.02.32.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 02:32:13 -0700 (PDT)
Message-ID: <a811a26e-ec34-f9ce-589f-82e96a975594@baylibre.com>
Date: Thu, 12 May 2022 11:32:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/meson: Fix refcount leak in meson_encoder_hdmi_init
Content-Language: en-US
To: Miaoqian Lin <linmq006@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220512092114.38426-1-linmq006@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220512092114.38426-1-linmq006@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 12/05/2022 11:21, Miaoqian Lin wrote:
> of_find_device_by_node() takes a reference to the embedded struct device,
> we should use put_device() to release it when not need anymore.
> Add missing put_device() in error path to avoid refcount leak.
> 
> Fixes: 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

You already sent the same patch yesterday, please avoid this.

Neil

> ---
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> index 5e306de6f485..de87f02cd388 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> @@ -435,8 +435,10 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
>   		cec_fill_conn_info_from_drm(&conn_info, meson_encoder_hdmi->connector);
>   
>   		notifier = cec_notifier_conn_register(&pdev->dev, NULL, &conn_info);
> -		if (!notifier)
> +		if (!notifier) {
> +			put_device(&pdev->dev);
>   			return -ENOMEM;
> +		}
>   
>   		meson_encoder_hdmi->cec_notifier = notifier;
>   	}

