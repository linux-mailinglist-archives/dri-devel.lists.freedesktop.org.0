Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F8B8B0279
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 08:53:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1CE611387F;
	Wed, 24 Apr 2024 06:53:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yDjRhCI9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 804A211387E
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 06:53:21 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-34665dd7744so4966922f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 23:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713941600; x=1714546400; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=eqU6fPwBtkCZTZvnM/ZJ76eoBIYTFy3ASfBRYXLlBBw=;
 b=yDjRhCI9kvWqyS/Z/7cepqJ9smb6gsdEkEPGQ8fGjZNGoKgvL2+MDLHlKp02s1ot7/
 p2ZYUwipafiaW6Qc7uSVJL196ss7fMhRazSqutJXT6i7cF3bdunAbyDB5KbO4WmbQeHM
 OPj6Aw1Eh95vbJKVggN6iqQCAzrU/F3gHrzYo6uuH7tNb5/wKi8VCG+PrujUnTHEIVxD
 9OOofyayJ6f7+r+jP0UEOLUes4Q8RzbSQqps1PKWECq0vNtK9Htv4s+RAJ7cKENiqqCL
 JVGqZnH+0axfcTzgaDa10v0e9YN3l8TlUN4N+1BX+SqQ9aPElhnL3FQnhXYTt52F2xwa
 rIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713941600; x=1714546400;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=eqU6fPwBtkCZTZvnM/ZJ76eoBIYTFy3ASfBRYXLlBBw=;
 b=ZdYoXgNRkuytTsVuHGmBvnYXrNmU9tI8RxfpubJqn1tLQyi6miREyb7v5K4YOqgDcM
 PwD7F1od6M/5+shMhxmb2bUJg/Epua9xI8gUw9aGh9sZhjzYopWy9eHh9sGYgyX+LDIF
 p2910ByiiCpbO0NAPFQBAhaeScsPXDolCzvJ42VIz8GLDpG09hbd80vtNpAfu6DwCZ9+
 zB7vUwjiVdtm683rTZRuzvzE+MNUqIhOA0THekp7OI5sL0Sb/jPFbBqgF2WjI93CBbqm
 xbO+EovBO4SaYCWPms/5U6tWMolDGGiPE+v5Gww7ForIi7KmrgXQCMU+Zj2ksJM86s1x
 lLXA==
X-Gm-Message-State: AOJu0YwWQkU19jtDcdhF9dPeovDKueU3hd3Ess/v4ZzB1zZ3f+nZLeLl
 L7/EQITL+Wj/xF+KGERvFu83Bx9PiqPEC2oMIKluIAmEdT5XoQqeX9Ni6D7ErZ8=
X-Google-Smtp-Source: AGHT+IFNRZPm2LDELThFDdehPYka/qFCJmWDSy/dxL0Ndkbn2JxTZB/V+nr7S/iP9/hxS6SH0iNWCQ==
X-Received: by 2002:a05:6000:1970:b0:347:a81c:dadb with SMTP id
 da16-20020a056000197000b00347a81cdadbmr823946wrb.57.1713941599752; 
 Tue, 23 Apr 2024 23:53:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ed3e:c90b:dd74:51a7?
 ([2a01:e0a:982:cbb0:ed3e:c90b:dd74:51a7])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a5d6445000000b0034659d971a6sm16258046wrw.26.2024.04.23.23.53.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 23:53:19 -0700 (PDT)
Message-ID: <362383f6-6029-4fc5-8522-7b8fb131ea07@linaro.org>
Date: Wed, 24 Apr 2024 08:53:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5/6] drm/panel: novatek-nt36672a: stop calling
 regulator_set_load manually
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Kaehlcke <mka@chromium.org>,
 Harigovindan P <harigovi@codeaurora.org>,
 Ritesh Kumar <quic_riteshk@quicinc.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240404-drop-panel-unregister-v1-0-9f56953c5fb9@linaro.org>
 <20240404-drop-panel-unregister-v1-5-9f56953c5fb9@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20240404-drop-panel-unregister-v1-5-9f56953c5fb9@linaro.org>
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/04/2024 12:08, Dmitry Baryshkov wrote:
> Use .init_load_uA part of the bulk regulator API instead of calling
> register_set_load() manually.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/panel/panel-novatek-nt36672a.c | 11 +++--------
>   1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> index 33fb3d715e54..3886372415c2 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> @@ -605,21 +605,16 @@ static int nt36672a_panel_add(struct nt36672a_panel *pinfo)
>   	struct device *dev = &pinfo->link->dev;
>   	int i, ret;
>   
> -	for (i = 0; i < ARRAY_SIZE(pinfo->supplies); i++)
> +	for (i = 0; i < ARRAY_SIZE(pinfo->supplies); i++) {
>   		pinfo->supplies[i].supply = nt36672a_regulator_names[i];
> +		pinfo->supplies[i].init_load_uA = nt36672a_regulator_enable_loads[i];
> +	}
>   
>   	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(pinfo->supplies),
>   				      pinfo->supplies);
>   	if (ret < 0)
>   		return dev_err_probe(dev, ret, "failed to get regulators\n");
>   
> -	for (i = 0; i < ARRAY_SIZE(pinfo->supplies); i++) {
> -		ret = regulator_set_load(pinfo->supplies[i].consumer,
> -					 nt36672a_regulator_enable_loads[i]);
> -		if (ret)
> -			return dev_err_probe(dev, ret, "failed to set regulator enable loads\n");
> -	}
> -
>   	pinfo->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
>   	if (IS_ERR(pinfo->reset_gpio))
>   		return dev_err_probe(dev, PTR_ERR(pinfo->reset_gpio),
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
