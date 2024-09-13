Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB06977A76
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 10:02:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6757A10ECA9;
	Fri, 13 Sep 2024 08:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KDv8ZXub";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06EC610ECA9
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 08:02:16 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-374b25263a3so450264f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 01:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726214534; x=1726819334; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=KAjUdoyXPSNHLiRF/5bnxLG0wpq4kPs9TC2hjddZOXw=;
 b=KDv8ZXub53OPTQ4nQAdRPs0oTfLYlr6JGmQQ7hlUZ69BR6Yd9Rcx1meu4x+VDSVUST
 yZCh1tIPZS1igidcs6lx+luTdeOVBy5CKULe+k2xzose1F95Q+7ngCCamjjR6AFb002w
 7yGXqAELcnZs74I+ICztazjlXlUxfh9skdEIR8EmpNMllLXU2jKLJLtz1vqMyK5bsaO/
 2X8hVLNyfH6pcbceIKlKF70JflDuj21+WNRl0lKzp4QNbej7G7Tv4Uv9nHQT1j5J0nQX
 67dBkO23TuibQy0/32G+dbYtb4fxM/38Mtt8DG5xGT03/pkho+PRx2nCFWVdjoIUdM5s
 Ds3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726214534; x=1726819334;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=KAjUdoyXPSNHLiRF/5bnxLG0wpq4kPs9TC2hjddZOXw=;
 b=GS/6fAReHo208IB3ETW+rw8EOJBpB34lc15sxQX4SBt0xCrVNo2Lln0vkLPWlX+DPe
 pdjlaVCvI5Z+Miy1PxgqDfRq3ZyFEMA7T+dDTZbb3XyBOlK/PP+jkb4iLrf8GRYwmqFm
 6wDsCNQiSePydlzvJOFZ+gBSEmDDfNiU1OIBppJyfjebRADWTtlaMlFXc1JULJabxQLa
 5Usq4/hP8zSMRxQibSCTzlZlhPU5zuoYFVIbniJUx/DByHJihcF47o9kIwRY+S7EAoBu
 1OfRYN797fzO6DvTE5CfYVMgSsu5CKwZN2h9x6ltB76ML822v5fcEG6NkLh5En2/u8ko
 +Whg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUViEhxcELD7Z7ZR8DoZjq/RfjS2dVsf0OH6ujOj+HmzZpBlAKQVCWjOShZnngLUG0bZEeG8WWUiAI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHudlBTVWiFm/4Ujkz2T7EpuPs4JifkrLFlAKsMa63fqxWw3C8
 8JL07rmr2Tdbn3q9EHeLFSBfMiMGBWvGfqtAwX2rX6XfztQzDxNBODsA5S5/O8w=
X-Google-Smtp-Source: AGHT+IFqhk+bK1ONAFkVcGqoWxYXj5S5OT3U3eVNN4v3VLfYwyLCWyCWI1nrQX0GDWFegfWc7EvPkg==
X-Received: by 2002:adf:f045:0:b0:374:c101:32 with SMTP id
 ffacd0b85a97d-378d623c027mr995199f8f.46.1726214533967; 
 Fri, 13 Sep 2024 01:02:13 -0700 (PDT)
Received: from [192.168.7.202] ([212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895665108sm16057316f8f.28.2024.09.13.01.02.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 01:02:13 -0700 (PDT)
Message-ID: <4bc6a5e6-f2cf-43ab-8555-4f8aaf9f2cd0@linaro.org>
Date: Fri, 13 Sep 2024 10:02:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 09/10] drm: bridge: dw_hdmi: Update EDID during hotplug
 processing
To: Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Christopher Obbard <chris.obbard@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240908132823.3308029-1-jonas@kwiboo.se>
 <20240908132823.3308029-10-jonas@kwiboo.se>
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
In-Reply-To: <20240908132823.3308029-10-jonas@kwiboo.se>
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

On 08/09/2024 15:28, Jonas Karlman wrote:
> Update successfully read EDID during hotplug processing to ensure the
> connector diplay_info is always up-to-date.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> v2: No change
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index c19307120909..7bd9f895f03f 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2457,6 +2457,18 @@ dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
>   
>   	status = dw_hdmi_detect(hdmi);
>   
> +	/* Update EDID during hotplug processing (force=false) */
> +	if (status == connector_status_connected && !force) {
> +		const struct drm_edid *drm_edid;
> +
> +		drm_edid = dw_hdmi_edid_read(hdmi, connector);
> +		if (drm_edid)
> +			drm_edid_connector_update(connector, drm_edid);
> +		cec_notifier_set_phys_addr(hdmi->cec_notifier,
> +			connector->display_info.source_physical_address);
> +		drm_edid_free(drm_edid);
> +	}
> +
>   	if (status == connector_status_disconnected)
>   		cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
>   

I wonder why we should read edid at each dw_hdmi_connector_detect() call,
AFAIK it should only be when we have HPD pulses

Neil
