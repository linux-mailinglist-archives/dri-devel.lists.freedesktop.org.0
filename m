Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8894A977A50
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 09:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF4610E180;
	Fri, 13 Sep 2024 07:55:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NTBi6eRP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C045810E180
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 07:55:30 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3787f30d892so434418f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 00:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726214129; x=1726818929; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=4F47Y0ZqCWvW1BKyuPVAeIWPAa8pt/mVlnZt3/WuCck=;
 b=NTBi6eRPsRPWzDd5oHDHf2UJYo/8DIVG4RnFARD0n0oVMhe17HjJcjCfUYtVmqbRIs
 SaEWNr8fePKVNGE8dYkYMbhNpTdiRFQXFmGvMELnyPqPxE3OYVdNhohMPzcj3roVvRHI
 cs0GGWHfY7VJXqC/r4svcwlaKJyL//UOy+qbdFscs59auodtDQe02pMzhc7jKeDLe38G
 7lm8ufmx4DgkxR+U26ZCSOeWnr/qIl9lfHsYZxH06iDj3LcVCUc7nBf1I+X9XE0ZCNuv
 oRkNmJp4zYujKt3Yd1yY7wDpC7i+2g/ioOjT2flsqiiqwO45uc7KjPlEsO5/U0c2ElqT
 QRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726214129; x=1726818929;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4F47Y0ZqCWvW1BKyuPVAeIWPAa8pt/mVlnZt3/WuCck=;
 b=u1pmDLP5fJEufgN83YG/FvHF4LXUa+MxqV90M59AlqdewTG1oc2QGADysrpsq1hYUt
 DfmRxYJZ3wF0lEnxpLS6IIpeiI6lKLH2CyAbneUHKPLgLW2UtFWzRuSE/DSAMAwrQSpp
 sTnV3s5jpcXZPdjWSvuIMAyMAwrHuur1/LKiqxcgSQLw0rOyIQat8ZMkMCwGmUfvI2o7
 e9AM8cxNyuxn8crJuYzFp/fXZiL+mDrG/p19GA0ZwgmnJZlABA6+KJpiks/gDX2ECvqH
 QGKcL23Nf/yxLSlIlUPYbS+xZg2AcV79hQ2JVfnx/NxtjFcUspuD5+wjtrqjwTgkfJKk
 RGrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDRgQfhUBg/hBSLLDbx6N9IK11fd09yKnLiEwzVo/bCcbNcmmJ0AFBMj7nyUL5O+wuvTwvELSd4WM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxemRssPkltIoJ1xLxNtwWzzU4MjxJbAltvhwGbQOmyFaJ3lhS7
 3sXvx78Z7kukufhfliy80tlYYRE/S9j1675EoiFNC9p5IEgnmQiliHCh87scDEc=
X-Google-Smtp-Source: AGHT+IFWCJ/6kVaBdFU6S4UaLYSM5aXgd7sHJI8AFELv8kzA9BpSNDQLlguwkKv+WU3rzncuwMzl9g==
X-Received: by 2002:a5d:46cb:0:b0:371:c518:6f54 with SMTP id
 ffacd0b85a97d-378d61f1276mr892538f8f.29.1726214128842; 
 Fri, 13 Sep 2024 00:55:28 -0700 (PDT)
Received: from [192.168.7.202] ([212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895676117sm16006632f8f.60.2024.09.13.00.55.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 00:55:28 -0700 (PDT)
Message-ID: <d9fe0fd3-c494-4c93-8f86-98dbb6fea4f3@linaro.org>
Date: Fri, 13 Sep 2024 09:55:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] drm/bridge: dw-hdmi: Move vmalloc PCM buffer
 management into the driver
To: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20240807152725.18948-1-tiwai@suse.de>
 <20240807152725.18948-2-tiwai@suse.de>
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
In-Reply-To: <20240807152725.18948-2-tiwai@suse.de>
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

On 07/08/2024 17:27, Takashi Iwai wrote:
> The dw-hdmi drm bridge driver is the only one who still uses the ALSA
> vmalloc helper API functions.  A previous attempt to change the way of
> buffer management wasn't taken for this legacy stuff, as we had little
> chance for test and some risk of major breaking.
> Instead, this patch moves the vmalloc buffer stuff into the dw-hdmi
> driver code itself, so that we can drop them from ALSA core code
> afterwards.
> 
> There should be no functional changes.
> 
> Link: https://lore.kernel.org/20191210154536.29819-1-tiwai@suse.de
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   .../drm/bridge/synopsys/dw-hdmi-ahb-audio.c   | 30 ++++++++++++++++---
>   1 file changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
> index 67b8d17a722a..221e9a4edb40 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
> @@ -8,6 +8,7 @@
>   #include <linux/interrupt.h>
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
> +#include <linux/vmalloc.h>
>   #include <drm/bridge/dw_hdmi.h>
>   #include <drm/drm_edid.h>
>   
> @@ -388,15 +389,36 @@ static int dw_hdmi_close(struct snd_pcm_substream *substream)
>   
>   static int dw_hdmi_hw_free(struct snd_pcm_substream *substream)
>   {
> -	return snd_pcm_lib_free_vmalloc_buffer(substream);
> +	struct snd_pcm_runtime *runtime = substream->runtime;
> +
> +	vfree(runtime->dma_area);
> +	runtime->dma_area = NULL;
> +	return 0;
>   }
>   
>   static int dw_hdmi_hw_params(struct snd_pcm_substream *substream,
>   	struct snd_pcm_hw_params *params)
>   {
> +	struct snd_pcm_runtime *runtime = substream->runtime;
> +	size_t size = params_buffer_bytes(params);
> +
>   	/* Allocate the PCM runtime buffer, which is exposed to userspace. */
> -	return snd_pcm_lib_alloc_vmalloc_buffer(substream,
> -						params_buffer_bytes(params));
> +	if (runtime->dma_area) {
> +		if (runtime->dma_bytes >= size)
> +			return 0; /* already large enough */
> +		vfree(runtime->dma_area);
> +	}
> +	runtime->dma_area = vzalloc(size);
> +	if (!runtime->dma_area)
> +		return -ENOMEM;
> +	runtime->dma_bytes = size;
> +	return 1;
> +}
> +
> +static struct page *dw_hdmi_get_page(struct snd_pcm_substream *substream,
> +				     unsigned long offset)
> +{
> +	return vmalloc_to_page(substream->runtime->dma_area + offset);
>   }
>   
>   static int dw_hdmi_prepare(struct snd_pcm_substream *substream)
> @@ -515,7 +537,7 @@ static const struct snd_pcm_ops snd_dw_hdmi_ops = {
>   	.prepare = dw_hdmi_prepare,
>   	.trigger = dw_hdmi_trigger,
>   	.pointer = dw_hdmi_pointer,
> -	.page = snd_pcm_lib_get_vmalloc_page,
> +	.page = dw_hdmi_get_page,
>   };
>   
>   static int snd_dw_hdmi_probe(struct platform_device *pdev)

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
