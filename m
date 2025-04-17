Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E06A921A7
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 17:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0388F10EB4C;
	Thu, 17 Apr 2025 15:31:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wzeRCU9p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C8A10EB3F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 15:31:30 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso9510435e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 08:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744903889; x=1745508689; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=GabpQFM6FHZHsv6ak2pU2BPX+s6Z3k+bnrJDF1aRDfE=;
 b=wzeRCU9pG68l63y9TZDHohJfNJYSIKRedrVSEGj/h+zA996njF2e91WoUKH56twBbj
 ayEs4fRvmw5AWiw8Vk6mfBadb1+qICL06ctX5ydgzb4AJhvHOdY6OAcwHth2rp8PPK4/
 jVAQgTSq9pkCUtSsjWW1lm2qRiP3iljKUR1cJCLQCY4mM/DPW42G5rG158k0a70++mu+
 L86mQ2xMbZZROnzDIypYZLQZ6fsYmnv/zA+lLtHbdRV32iwjyQufnfoVIghgXhG8OuS9
 bRU0yfMvPMKduXl4Nt2t+KMluBuD1zNWeZ9aCUxugLOT8pCMnxyfYrblKAYRaFiD5l6c
 cOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744903889; x=1745508689;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=GabpQFM6FHZHsv6ak2pU2BPX+s6Z3k+bnrJDF1aRDfE=;
 b=r8V2u/Z8jh9mv98nucOLIdMKUa7muWzWRcaoFQO0rmaF6mpuD5rOpEWxL0Lh8MAzSc
 Gv0SIgvnrZdSmN23Y4TAKMfi5Kv3fQHiE6nCuDJiBx/M5dOmAZXqIbFcp7K8Em5CrN5Y
 fWIrSx/LMGpKFW7Rqe+7nWw906YeDXGLSKqETNydxxxRugBSvOxz/QVTHz2PViaqMtBM
 5PrJU8kVKwVLMFbh4uMhQF75adF0HhO7l3M250T2E96MFqbTnMZ4RJQ0I0f1Tl0gK0Qg
 L8rLanlWzhTEorBwtB2c8clHqs+3oD2YC/oHtkXd64Y6WIXighGILgx2nCPbcSvtjoEE
 EGjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPY0QexXbS52TYuXGoXqNet3uXBJ7hy0uVwBTn9HRZ930oINnapNsAnSfZEjN1jXnAqBiJxsEsXlY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEiCJWavc4Z3zHLfn+0XSKRH8NnYzCJ3rM0o8jE+uUrDeFB1vG
 VDEdHJHCN39+JjoSuPN7s+l2uExdJ20z8Dm4A246PENtJ6BVdwLuvzh8pPMwp1Q=
X-Gm-Gg: ASbGncuFTwQxf/De1rQ3qkCETSqP5gynfqbIzorXCH0G8NzfF2k0jNtDfiIOnhnX5uC
 bZbRB/Z/+OMmyAxTybTZOaeomoKomnxrewgfk2eR82QBDy8/iD9cOpJqCn0JAWGcxYGzRlMtBRS
 ZlFmukB3Jeij6h2M9ckmuW2Tj2rYpUjeJVGE04yPSqW2K/3JKioa9M7kyP168/9S2tqEF4qQLmz
 uPqQ0XjmsHSg/h0ArjYCpkhfekWC12ddvsLOEj/2axFARZeMQCd/sPLxjNdUEa54TzyXfHykyzE
 OpZwV5jBtYO73na6TcKzAn/bE80cBxeKiAjM7OQB5ibo49knNGaU5VdOdP4Tzr5Ta+fEKATROyc
 sgW0N6AhfgUSXHR8=
X-Google-Smtp-Source: AGHT+IEXc2yZ84OQzIxc27xjxj+s0MRjzbSsN1SkSFfY0y63NTO2TgOX8V5f9KQrjAvVEdjTrXopHA==
X-Received: by 2002:a5d:64ae:0:b0:39a:c9b3:e1d7 with SMTP id
 ffacd0b85a97d-39ee5b35fc8mr5056045f8f.29.1744903888828; 
 Thu, 17 Apr 2025 08:31:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a7f9:634b:42d:1546?
 ([2a01:e0a:3d9:2080:a7f9:634b:42d:1546])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae979663sm21247275f8f.51.2025.04.17.08.31.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 08:31:28 -0700 (PDT)
Message-ID: <969b474b-b154-466b-87a1-3ae16c45af26@linaro.org>
Date: Thu, 17 Apr 2025 17:31:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/3] drm/panel: simple: Tianma TM070JDHG34-00: add
 delays
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Pu, Hui" <Hui.Pu@gehealthcare.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250411-tianma-p0700wxf1mbaa-v3-0-acbefe9ea669@bootlin.com>
 <20250411-tianma-p0700wxf1mbaa-v3-2-acbefe9ea669@bootlin.com>
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
In-Reply-To: <20250411-tianma-p0700wxf1mbaa-v3-2-acbefe9ea669@bootlin.com>
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

On 11/04/2025 21:19, Luca Ceresoli wrote:
> Add power on/off delays for the Tianma TM070JDHG34-00.
> 
> Fixes: bf6daaa281f7 ("drm/panel: simple: Add Tianma TM070JDHG34-00 panel support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changed in v3:
> - add Fixes: and Cc:
> - remove regulator delay
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index df718c4a86cb7dc0cd126e807d33306e5a21d8a0..fd7ee5d1ca280be306620def30d3b423106b4304 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -4452,6 +4452,12 @@ static const struct panel_desc tianma_tm070jdhg34_00 = {
>   		.width = 150, /* 149.76 */
>   		.height = 94, /* 93.60 */
>   	},
> +	.delay = {
> +		.prepare = 15,		/* Tp1 */
> +		.enable = 150,		/* Tp2 */
> +		.disable = 150,		/* Tp4 */
> +		.unprepare = 120,	/* Tp3 */
> +	},
>   	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
>   	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>   };
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
