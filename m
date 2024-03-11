Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BB8877BA4
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 09:23:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9766010F579;
	Mon, 11 Mar 2024 08:23:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IlBEz50c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC6010EEAB
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 08:23:31 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-413286f8985so4702755e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 01:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710145409; x=1710750209; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=AMJIYAT1aoLggdRB8puSiHOpe8FLhZyNAYzFcBUjOwA=;
 b=IlBEz50ceCci+DrWnj21VU3tyuvK/eS68XaDbW3ORwlu/6j1ML7Dg/P98AYbquCKuE
 Ferl0guqZ6ZoRfbuTDeupOFbcwlzM33eVnjyp+/BN6YX5+27UCyQ0qLDot8sWCTQ6BXL
 qnAVfFXvODg67CA2KddLJAZk/LUnNiZ/P7NqcfBFNpO5l12mZDuVKbIu9PhoZluI07ia
 xxQkz8L6WAEMgtt5G1kUhqJAq0+u8WkxI9SY/lXzo31uWDjqxBtBkrU447y0INlwLGv5
 OMBEJH4N1dEe/Rzn+gzlVV4MTdz4/72BdgzqQXa/vg6S51z2w8oLKdGkJyTfAEbbEW65
 Vj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710145409; x=1710750209;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=AMJIYAT1aoLggdRB8puSiHOpe8FLhZyNAYzFcBUjOwA=;
 b=B18IfXLl6Ld7SwdI+mPclyWLK5EAYKmtea/hQ/EKPNfX5cQlK2VeWlnU5mpcpJ/b/s
 +BGIzPl3PEGIJhXrYNMqgiloMMjZA1ITDcm6/yBwhhlSCYGYlX+QyeWLcdndBetzUgn3
 BmMkwtSFp8rC7j3xokH88jJZ6UcerQdKbw50CAdzCDSXh4USWNdPfiViflu0IRS8uv9m
 Yw4EzSXX8mjmaD5vB/RgiTAJddgEF4g+wJMpz4zqFL8XYziHvZYjt0yLbPa6uimZTn75
 /FUrp1FjmY3RXMh3SXDjcUnFFC87oTnjv37GVCGWAtBr/C8K3/0i7HIqR/PZWyJ/aS74
 f7RA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiMRui/jA+y8XMgrR3OUk5llQ09drPQ4HLieLHD/BVX0czM+FmFCB/SUlO9ycoZPdmedpxYoozqO+YuKt8Ry2lFFK+j1WQkeYTjV9jXvvv
X-Gm-Message-State: AOJu0YzdzFdhaz2EeDbCF8le9ZSHRIOBbofwKxGz7dj0uMKSGwuV/RtF
 xLdU/k0tIiFl+L9sqSE3EeH6jqVTsGwot8umtid5i2XuOrueiDQFo21n6RR9C70=
X-Google-Smtp-Source: AGHT+IGojr92IZ9JNjUk6i05tLWnB0/kzB3DppIN43i5jY2MgknDStpDu7m0C6KmkiaP5e7N7wDdDA==
X-Received: by 2002:a05:600c:3d88:b0:413:2a07:20d3 with SMTP id
 bi8-20020a05600c3d8800b004132a0720d3mr1254967wmb.35.1710145409494; 
 Mon, 11 Mar 2024 01:23:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:48be:feb9:192b:f402?
 ([2a01:e0a:982:cbb0:48be:feb9:192b:f402])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a05600c19cc00b004126afe04f6sm14688429wmq.32.2024.03.11.01.23.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Mar 2024 01:23:29 -0700 (PDT)
Message-ID: <af099226-6644-46c5-b424-3c3a61e454c4@linaro.org>
Date: Mon, 11 Mar 2024 09:23:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/8] drm/panel: do not return negative error codes from
 drm_panel_get_modes()
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 stable@vger.kernel.org
References: <cover.1709913674.git.jani.nikula@intel.com>
 <79f559b72d8c493940417304e222a4b04dfa19c4.1709913674.git.jani.nikula@intel.com>
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
Organization: Linaro Developer Services
In-Reply-To: <79f559b72d8c493940417304e222a4b04dfa19c4.1709913674.git.jani.nikula@intel.com>
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

On 08/03/2024 17:03, Jani Nikula wrote:
> None of the callers of drm_panel_get_modes() expect it to return
> negative error codes. Either they propagate the return value in their
> struct drm_connector_helper_funcs .get_modes() hook (which is also not
> supposed to return negative codes), or add it to other counts leading to
> bogus values.
> 
> On the other hand, many of the struct drm_panel_funcs .get_modes() hooks
> do return negative error codes, so handle them gracefully instead of
> propagating further.
> 
> Return 0 for no modes, whatever the reason.
> 
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: stable@vger.kernel.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/drm_panel.c | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index e814020bbcd3..cfbe020de54e 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -274,19 +274,24 @@ EXPORT_SYMBOL(drm_panel_disable);
>    * The modes probed from the panel are automatically added to the connector
>    * that the panel is attached to.
>    *
> - * Return: The number of modes available from the panel on success or a
> - * negative error code on failure.
> + * Return: The number of modes available from the panel on success, or 0 on
> + * failure (no modes).
>    */
>   int drm_panel_get_modes(struct drm_panel *panel,
>   			struct drm_connector *connector)
>   {
>   	if (!panel)
> -		return -EINVAL;
> +		return 0;
>   
> -	if (panel->funcs && panel->funcs->get_modes)
> -		return panel->funcs->get_modes(panel, connector);
> +	if (panel->funcs && panel->funcs->get_modes) {
> +		int num;
>   
> -	return -EOPNOTSUPP;
> +		num = panel->funcs->get_modes(panel, connector);
> +		if (num > 0)
> +			return num;
> +	}
> +
> +	return 0;
>   }
>   EXPORT_SYMBOL(drm_panel_get_modes);
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
