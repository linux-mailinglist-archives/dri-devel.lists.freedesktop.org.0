Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1B9B3E2A4
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 14:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D6EA10E0A4;
	Mon,  1 Sep 2025 12:24:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="R0akGs4r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E11E10E0A4
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 12:24:51 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-45b86157e18so9937735e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 05:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756729490; x=1757334290; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=MfkhISYvBMEAQlL6pZ3jPBacsMMEIifm78tAx7TD2ao=;
 b=R0akGs4rAotAzb2ZSRlVv5oLyYB1505Cimwdo6E/pThrqidic5Sx3sngNyi/HRjNiM
 +r+xxMrR2lb3fDd9K7tbRp5e1SFhNAZ/kvKpROT8CILxf2wvMXqzFq83I1op79/8j1Sl
 UI8AYteKEIYLcfbWnxjD2e41gtBCSEMDOYqnCaerW/tWvyt3Wo9TN2n+OVfUIXLGOvxo
 nrgD00vdEdbErpRdzOsCa++VsoomPunR8pAVObATS26zdOwgq3MC8MksC/PElsVjNPf+
 S/MHrTlt44yvX/qnorGJU8mYC3EWNSucJK1qhXziVaSbUjoVEVAfW7a0pslb32UP6f26
 bsdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756729490; x=1757334290;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=MfkhISYvBMEAQlL6pZ3jPBacsMMEIifm78tAx7TD2ao=;
 b=HM1kdTNbCisvbjWpKGIlwrDcEXVYruazK9Z1mNmL2JKslO4NqqK8Qr8DnP0z/CCnVA
 9vgviXbHo8hpEVFqZRSb9sRFIsAWwt0Bd1GPvQGO1gooB7CiAlqlB35ESS4WoEvRS0QC
 5sK5ePELNGfZ3EFKyizxIA0s9xnE+J+fSmbUjiheaT9wtOWQ40JFdpnoRbfdZg5McBrF
 et8HRaGAmTk5c2dWHz50R7UzGmPy3daVtWB6e2w/1dUDAJimznlpjz+WLjzpDLgLP5up
 VFUB6AfRMMnQZmf/gpFu/q+Al1FTgV8ug38FShGh1yBUAM4Zlg6SvKZHCLcAcICEvUtU
 ygVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZHoi/Rc/kTZ74Hw4dY2F+qQLm0qz+0T0cAraAf9RTQd6xUSCb6N4i0+MH2ZF+oOVpfGPzrVdG4pM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytQdP9Iw8w5m4Xxx9tk5j0InhoTGyz+jL92+H4SI0pZFrhBVdv
 RVIAxYVtKTqU9dh4pJrpOGhHYWIue0JzrflHyo8H1W4F9WAJ2zU8+vb5MqRmP2eYVyQ=
X-Gm-Gg: ASbGncvvh3XZKRJeIQgNKI9CawQZNaOf8k0u4gq93Hbh5KiwiUTh8XdGFlFQ77nmoQJ
 mlniG8Bwj4FO2yuE7MsKFUfJ28msqVhOXa3XB1ZSQUy8RHkhMj8dYBan6M/bEZ1X1YGxyfOlKaz
 eEKY9TW6lRRWJpGCS2+HmiKg+NMGhTyfmyakLdtQG6dAI1XpksVEJXA7rr55DdTbLIddHfMMyKc
 sdeWRoNOfQm6cI2pJO4G/Ur2tu3HL9czpWwfiFl2t6DwGSGYa7EJM7SXDBXBZ1CCbrCZG7VuYcH
 UK1dGNz7oyqsa7K8vl867UaJ0l0uk7dslm1xhJOfYGtdcBBMtdpWXa5HK4TsqhEkKRRQ1epfQYp
 Iox5PhBbN7aKm+6yDapnBTTPmIEBkYnxNA3NSaBL830emMrQhvxL7APYIvO+Xfq+dWjsXS/ZzgB
 fURLRcrHc=
X-Google-Smtp-Source: AGHT+IFGT8W3UAxgtuIxzCjUXqI2nE78D/VdHvOwHMOvAuiM4y3wWCDkvebLIQeC9Id+0fTq3AN6+Q==
X-Received: by 2002:a5d:5888:0:b0:3ce:46d8:5e11 with SMTP id
 ffacd0b85a97d-3d1dfa19456mr6338946f8f.34.1756729489776; 
 Mon, 01 Sep 2025 05:24:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:881c:7d0e:ad0a:d9a?
 ([2a01:e0a:3d9:2080:881c:7d0e:ad0a:d9a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d2250115fdsm9738932f8f.40.2025.09.01.05.24.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 05:24:49 -0700 (PDT)
Message-ID: <e92049c6-1d90-482f-ad4f-0c88bb96989e@linaro.org>
Date: Mon, 1 Sep 2025 14:24:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: visionox-rm69299: Fix clock frequency for
 SHIFT6mq
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Casey Connolly <casey.connolly@linaro.org>, phone-devel@vger.kernel.org
References: <e975da213c1f8030db50d66ec1c9597f59f25e35.1756567474.git.agx@sigxcpu.org>
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
In-Reply-To: <e975da213c1f8030db50d66ec1c9597f59f25e35.1756567474.git.agx@sigxcpu.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/08/2025 17:29, Guido Günther wrote:
> Make the clock frequency match what the sdm845 downstream kernel
> uses. Otherwise we're seeing timeouts like
> 
> ```
> msm_dsi ae94000.dsi: [drm:dsi_cmds2buf_tx] *ERROR* wait for video done timed out
> dsi_cmds2buf_tx: cmd dma tx failed, type=0x5, data0=0x28, len=4, ret=-110
> panel-visionox-rm69299 ae94000.dsi.0: sending DCS SET_DISPLAY_OFF failed: -110
> ```
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
>   drivers/gpu/drm/panel/panel-visionox-rm69299.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> index 909c280eab1fb..e65697ce6f51c 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> @@ -247,7 +247,7 @@ static const struct drm_display_mode visionox_rm69299_1080x2248_60hz = {
>   };
>   
>   static const struct drm_display_mode visionox_rm69299_1080x2160_60hz = {
> -	.clock = 158695,
> +	.clock = 149360,
>   	.hdisplay = 1080,
>   	.hsync_start = 1080 + 26,
>   	.hsync_end = 1080 + 26 + 2,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
