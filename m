Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31937524C92
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 14:20:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E5710E7FD;
	Thu, 12 May 2022 12:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E18B410E7FD
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 12:20:40 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id t6so7027869wra.4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 05:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=RB4UFWflnqT7YBqkDdk/tHJ953wpGWAq9+2dQip5Mgk=;
 b=SYyQEfdTxPtJhqIjDzLvhoXxyWDkBykTLx2EMy2UIBn9ANURE3n1SbvvtNKJiZRdb9
 QxgtIFjOVr0i1qU7eFxs7SAlFzFLIMyOfqJQRMcVZwp89iY5o2qN8fB/bRpKe413XYx6
 080m+FmyhUnWUdQhf33FL6LXzpjGiaJP383/f5NwouESb9+/Ap6JFzbb4ituiGdzm1o0
 no25PcXJuN67b6sN8hdFf4Fu9mryvYGvwYBqx35zXirO6yTRdPLYG2GInX6XHZoHBDGA
 w8y4OdbFAKcH+ezHiHm+UjUB5pt9wJuEFHUQvmwwSAUJOpdM4SXx2ohi5d2cuja7KxzU
 nCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=RB4UFWflnqT7YBqkDdk/tHJ953wpGWAq9+2dQip5Mgk=;
 b=eMEcl1nkbiEqsrRlLu2pOnbuxvKrKFIKJiGc6RWA52gCSzE0YUVJVu5ozZ4xWMAdiK
 Lj8yBe8oqnqaWGfHTwRcPzrCF6JvnDtQtbNfo6l3cs1kNX35VS5N9wDYWR4k/vfJwFjw
 HQyP9RR8RuiwcpouuN9gRVLkim8GeAmZc0SbyOGztE2b2gnvA8K/Y57rezl6N2br0Nj8
 1gnMA7T9ArbA2E3wjqgIH5fD+ue5vS1e1FXoYbHnq2X2uij7bZs4qx8199+tIQ/x4a/B
 LQJb2CL+5Qj04fDGorai79TvL+3Vn3FEn/s0UJepcpo7tLKLyr8z8UyLHOICCv49kRGS
 FpgA==
X-Gm-Message-State: AOAM531Unw9pHBVcATDWXe//5I6h2VpQFHvwbaEnYhCCeaQaJLuerNbm
 6LIycRkq1UVCgUfXqir4nM7ySA==
X-Google-Smtp-Source: ABdhPJyu1aKN5KiuDTzkBD61oRd1v63Bb1+xpDXJPlEui//nYUG2arMwW3pCr9WkbGGiND0niBZcfg==
X-Received: by 2002:a05:6000:144f:b0:20c:6090:3040 with SMTP id
 v15-20020a056000144f00b0020c60903040mr26377831wrx.479.1652358039271; 
 Thu, 12 May 2022 05:20:39 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:8073:a89f:6230:abb?
 ([2001:861:44c0:66c0:8073:a89f:6230:abb])
 by smtp.gmail.com with ESMTPSA id
 c1-20020a5d4cc1000000b0020c5253d8ccsm4104892wrt.24.2022.05.12.05.20.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 05:20:38 -0700 (PDT)
Message-ID: <dabe6a15-b0ba-0458-bbd7-a07224071920@baylibre.com>
Date: Thu, 12 May 2022 14:20:37 +0200
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
References: <20220511054052.51981-1-linmq006@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220511054052.51981-1-linmq006@gmail.com>
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

On 11/05/2022 07:40, Miaoqian Lin wrote:
> of_find_device_by_node() takes reference, we should use put_device()
> to release it when not need anymore.
> Add missing put_device() in error path to avoid refcount
> leak.
> 
> Fixes: 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
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

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
