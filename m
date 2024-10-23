Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC5E9AC0F1
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 10:03:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFCDC10E784;
	Wed, 23 Oct 2024 08:03:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SKgRgtx7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23EB410E784
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 08:03:27 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4314c452180so3871445e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 01:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729670605; x=1730275405; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Jns0AjCrY+/sra6NNKO1WPiOfep6FlanuvD1RpWqF+U=;
 b=SKgRgtx7O5U2Z5/pjdhXcvdBzXBVCmnvI+kLZUvXheX2Pc4/ZI4KqqKYgZS86BlwQ3
 ALgvB9FwR54jRSuoIjR+w3+hdD+mviQjlLaGsPBKTZI09KUSqA2ntwp9i544JKbywi5H
 Raf+phNbXXjzEfUDMYIupgPLGhvk80WNpFZ6TVm/YbkgM5GECmMjQbpD6jDaKdAjQi9/
 /eghLO3vgL2YQoEAPYRrY/1akLdBbjANphUHhilDuM+XEbA6bpCBcLZv30Tb27XtlaYD
 zg9mBcIgwEmvexHkOeT19ke2NLeE63VQx3yPJXHVQKyUyNDu/XsC63J9PcaXKLRAm5u0
 bYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729670605; x=1730275405;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Jns0AjCrY+/sra6NNKO1WPiOfep6FlanuvD1RpWqF+U=;
 b=P/efxpW+fSONjDCHhs1CDnSGi50+Wwgdf5LERnCgaPJEhnpmQWUfmpYd7XGRllXVjt
 c+H/39BjHHy/6JEDJixi2yT8ht5T4vm0K/o00HIQrRhXjxb/mBdPAnt3/CIcCKouuYMZ
 S1+ooXSHjKjKqIqp7zwGNTL8VCmy1pWIlyvekQ9mjTHWnlmnAHxuaUEsAaZp6eXrtwFK
 vT8B/0+y4n/0Z4qFvsEq2iXS95VHgQse7WIQdXoE5TIQ+G/ykNvF6QjQlCJHmkvyi0yl
 EZduvOtXWlM+mYucs+kKFiK2VnDOAb6pL/cm+JnP8UWqmT7hZ2XQM89VbC9p6EhP2y1w
 XbuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVYIHsjUrSeDo7XTY5PyPOy6ULQgHxay0wFZ63qcmNAasvLbRmRkME8aHDWAiWArmqW03tZI0scZg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtJZmsxS9ptpgv7bvYExcNuHuZAXOgagulNkGO+cxb0dSbf94b
 0nGMOlqG0IH7lddDiC7kr5Sd3g5VeLkzXuF/dJCFdI4f+dndx3YaRoOUjTOusOg=
X-Google-Smtp-Source: AGHT+IEWCBccjn+i9HJOQ1/tjUbWC5+hikC7YmkDAGQe/PxV0SKYHv1wTezrnaRpi1ipxHSEOShBhQ==
X-Received: by 2002:a05:600c:4589:b0:42c:b697:a62c with SMTP id
 5b1f17b1804b1-4317bd7f197mr37781505e9.5.1729670605471; 
 Wed, 23 Oct 2024 01:03:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:f9e2:19d:5b22:8044?
 ([2a01:e0a:cad:2140:f9e2:19d:5b22:8044])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43186c1eccesm8882305e9.46.2024.10.23.01.03.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Oct 2024 01:03:25 -0700 (PDT)
Message-ID: <e28f88ca-357b-4751-8b37-c324ff40f9f5@linaro.org>
Date: Wed, 23 Oct 2024 10:03:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1] drm/bridge: tc358768: Fix DSI command tx
To: Francesco Dolcini <francesco@dolcini.it>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20240926141246.48282-1-francesco@dolcini.it>
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
In-Reply-To: <20240926141246.48282-1-francesco@dolcini.it>
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

On 26/09/2024 16:12, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Wait for the command transmission to be completed in the DSI transfer
> function polling for the dc_start bit to go back to idle state after the
> transmission is started.
> 
> This is documented in the datasheet and failures to do so lead to
> commands corruption.
> 
> Fixes: ff1ca6397b1d ("drm/bridge: Add tc358768 driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>   drivers/gpu/drm/bridge/tc358768.c | 21 +++++++++++++++++++--
>   1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
> index 0e8813278a2f..bb1750a3dab0 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -125,6 +125,9 @@
>   #define TC358768_DSI_CONFW_MODE_CLR	(6 << 29)
>   #define TC358768_DSI_CONFW_ADDR_DSI_CONTROL	(0x3 << 24)
>   
> +/* TC358768_DSICMD_TX (0x0600) register */
> +#define TC358768_DSI_CMDTX_DC_START	BIT(0)
> +
>   static const char * const tc358768_supplies[] = {
>   	"vddc", "vddmipi", "vddio"
>   };
> @@ -229,6 +232,21 @@ static void tc358768_update_bits(struct tc358768_priv *priv, u32 reg, u32 mask,
>   		tc358768_write(priv, reg, tmp);
>   }
>   
> +static void tc358768_dsicmd_tx(struct tc358768_priv *priv)
> +{
> +	u32 val;
> +
> +	/* start transfer */
> +	tc358768_write(priv, TC358768_DSICMD_TX, TC358768_DSI_CMDTX_DC_START);
> +	if (priv->error)
> +		return;
> +
> +	/* wait transfer completion */
> +	priv->error = regmap_read_poll_timeout(priv->regmap, TC358768_DSICMD_TX, val,
> +					       (val & TC358768_DSI_CMDTX_DC_START) == 0,
> +					       100, 100000);
> +}
> +
>   static int tc358768_sw_reset(struct tc358768_priv *priv)
>   {
>   	/* Assert Reset */
> @@ -516,8 +534,7 @@ static ssize_t tc358768_dsi_host_transfer(struct mipi_dsi_host *host,
>   		}
>   	}
>   
> -	/* start transfer */
> -	tc358768_write(priv, TC358768_DSICMD_TX, 1);
> +	tc358768_dsicmd_tx(priv);
>   
>   	ret = tc358768_clear_error(priv);
>   	if (ret)

Look good, I'll leave it here a few days if someone has comments

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
