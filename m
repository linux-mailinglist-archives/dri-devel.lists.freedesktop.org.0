Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE42D91461F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 11:20:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7EBB10E3C9;
	Mon, 24 Jun 2024 09:20:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="I4SIB/su";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DBF310E3CA
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 09:20:02 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-36226e98370so2481310f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 02:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719220800; x=1719825600; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=1rzhBjyz5jjvgMNRRPFm2knRSqWyQzc3/BQBCba6JkY=;
 b=I4SIB/suxVU+8tXbpA67dXjzYdpIC4m5csfwmJgAEjRZOVGR65YM8nHhqHJO1Jw92q
 Wwc5zI7ApL1AiO3My4cFwg1EDs174s/xdl/K9ao1PaWQ2HJ4f9ejcUcWLWAiyOYtNyRx
 eaqB8CztiC52pHZtapRICVFJrWoPdUJk/TZ9OBkKvsOkbUQnd/A0U7OhDV15zeuNldps
 M1RHO2NsfK/LwPr7OY60JMmtnmzgsdm/SDrm90+iL+PC2PqCw/BsiinL9cLth9grKY62
 zgCc2Iz9zYGp2a1pdn6YayHqQfxwMiUVGA5efDEDHFQPMXvZ7OscD6iBktw29coV17XV
 TTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719220800; x=1719825600;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=1rzhBjyz5jjvgMNRRPFm2knRSqWyQzc3/BQBCba6JkY=;
 b=rZzVFYNTar04nN4T9Wfg1vzkC1cPOI5c+/jUTDTZSg7UNuavkWgqI9gH02XtB3yTQj
 REbT8Eqt4pzng0f6EovqApvFgQwbbFFVfS6oQUWWD1Bo0I1ZnV4Vlxl+1OuoKaydu60u
 j5uY0DxtsGdjlGIIBe0V3drt6aCF+b1H6BSwctsPoRvUzcJlTJ4Q1EuR/TfnliFdbeKO
 iml6oB1G176Wtu4336OwQu3Hn6cgHNjdRQVA0TyB2047TPg+JAIWK46myaH3WWE/gmoE
 dVnCR5jxZ3xXd2oEcMr4t7xWNPd3ILAgtjG2Dfd0GKQzMpbI9FvHhz05JsQuTl0Exam4
 opZQ==
X-Gm-Message-State: AOJu0YyOVu6CTYKhuLb2SzYlM7DRfBRjH+dRVg6d4rpLWc+7Kll9Hm3k
 +9Yl/ilCaXm/n8Fop0SAVMlTnvMkHEXsONcUQ1iSaaiKKeTX4IH8zJRSx8SLm0I=
X-Google-Smtp-Source: AGHT+IHRZ1tAaFSNfK8/s7Iexd9ivbkvRD5s+vKV1yQwTPEUSZoY/5RFg7cefOTs7oZfhcoSVW3q1g==
X-Received: by 2002:a5d:5745:0:b0:364:81e7:3917 with SMTP id
 ffacd0b85a97d-366e946480fmr3098589f8f.3.1719220800019; 
 Mon, 24 Jun 2024 02:20:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:cf01:774b:55fd:ab74?
 ([2a01:e0a:982:cbb0:cf01:774b:55fd:ab74])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3663a8c7befsm9477398f8f.95.2024.06.24.02.19.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 02:19:59 -0700 (PDT)
Message-ID: <a3a645a0-2d2f-4b6c-9878-f02764b686c1@linaro.org>
Date: Mon, 24 Jun 2024 11:19:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5/8] drm: bridge: dw_hdmi: Invalidate CEC phys addr from
 connector detect
To: Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240611155108.1436502-1-jonas@kwiboo.se>
 <20240611155108.1436502-6-jonas@kwiboo.se>
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
In-Reply-To: <20240611155108.1436502-6-jonas@kwiboo.se>
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

On 11/06/2024 17:50, Jonas Karlman wrote:
> Wait until the connector detect ops is called to invalidate CEC phys
> addr instead of doing it directly from the irq handler.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 18 +++++++++++-------
>   1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 9ecf038f551e..0814ca181f04 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2455,7 +2455,17 @@ dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
>   {
>   	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
>   					     connector);
> -	return dw_hdmi_detect(hdmi);
> +	enum drm_connector_status status;
> +
> +	status = dw_hdmi_detect(hdmi);
> +
> +	if (status == connector_status_disconnected) {
> +		mutex_lock(&hdmi->cec_notifier_mutex);
> +		cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
> +		mutex_unlock(&hdmi->cec_notifier_mutex);
> +	}
> +
> +	return status;
>   }
>   
>   static int dw_hdmi_connector_get_modes(struct drm_connector *connector)
> @@ -3066,12 +3076,6 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
>   				       phy_stat & HDMI_PHY_HPD,
>   				       phy_stat & HDMI_PHY_RX_SENSE);
>   
> -		if ((phy_stat & (HDMI_PHY_RX_SENSE | HDMI_PHY_HPD)) == 0) {
> -			mutex_lock(&hdmi->cec_notifier_mutex);
> -			cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
> -			mutex_unlock(&hdmi->cec_notifier_mutex);
> -		}
> -
>   		if (phy_stat & HDMI_PHY_HPD)
>   			status = connector_status_connected;
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
