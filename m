Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FFFB16291
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 16:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2FE10E370;
	Wed, 30 Jul 2025 14:21:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WFrqESd8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD3910E370
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 14:21:47 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3b783ea5014so2413316f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 07:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753885306; x=1754490106; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=wl6QWGFqf/eD1ZaqoeecpKgPsEHgZ0O15WgFpZqHFQ0=;
 b=WFrqESd8ncy+/7XF0x20+8As8pDDqlz8z6oicnAAXI5+OUwMjPtmEWbrfnf1xa6DiT
 4JViMIlrz63ehTIong+T8CbgOMc8iTEbf/ab4h98kbOE+wd5m5R45Qep4wEmoWhtKRmc
 9Yej7fly5OnybUQ8sfWrmyE9cxOqfbvFykJ1GmoLbQ7pGk4kMAh2Oksa6XO8Qs7BVbpX
 adBGmUGeoGXoeX6sRdO079yizkixANRzv/4p12EBnNLY3UsziO2KTcwGUqJlImpUWwSa
 uxLAm7R73kPSVDltsGeuaFDEF9a3JJlW07FkIOUeu9D1cUHNATXov3I6HcFH2uxwMLnl
 aqRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753885306; x=1754490106;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=wl6QWGFqf/eD1ZaqoeecpKgPsEHgZ0O15WgFpZqHFQ0=;
 b=UzNmlmqwCoRDA+TZ4UTI58fsUka2qCbb2CevvcnPZmw41QvpGKBbcPUJtHaCzZ06P8
 +5nQDWDuOgd7o7ibKDJ6hEDIi36HFQBaA+6qaqTBojah8pinCoW9FqkT6+iazc+bRDDT
 szvZKVmbrBPXep+L6uGtXcWYeol3bchDK66UGo/UIWA6cmGX4N3B1jq3PuqkvlLHxqKW
 6irkIm/xvH7TUADz9dX2rluhMpkDz3bB9yTVGE85Tii7WyFWbHdRGeAxoNLIjQSTlsmP
 X+qPBbVOVZb+x7Atinv96pCums7FaeC0VnYKL1nLqWHwsLx4oFhpeGYXSRBodqmJyJLM
 /0tA==
X-Gm-Message-State: AOJu0Ywi3WzmLe94dI5lSF4Equ7gluupH5abVL/DaeyMjXt1eb6Z4vPT
 qN2iW/omRTdRgBIFihPSEKbWwUAqt0qFF8tm1+b3RE7nxMN53ntoOi0DBdBaIa05y90=
X-Gm-Gg: ASbGncv+yBQGVrCEEFI9KIVWs1SL9Pv5dCDyJu97+i2uOyztK2sVb/79Y59pXLBfvzb
 Bs2bwjAIyxp7sJgL2e09IqgxThi97ms6pWprOLrPX8m+cJgeNVm7ucW8txbn+EPIbdPknCrJdNk
 D4EoN9WO17/fZCE6C9/p9QyEnc+IdSd3z7vw8K2KsCnje1vCBtxFy61HCArmgBZ5bx4kXA67pPh
 8AiiBf59zHwcq4WsLXBhhpd2VcTC4t+waZ2owkkaajHiecKnLwdBekpkouG44mbxogXCjhd2NZw
 qPrKX1rj+Cdk+A/LavX+IoExgSgn4PshwCFdBEA8jflEQKu9H03H1Bq51rb5Y1QDXUOcpXYB9km
 29inlVH0v+HPfoUPb0VHi6OxKd4hxRjTTEFXQvY7G8YoNeIG53cE5QnR2/6EFzfaxY0HikZZFtc
 k=
X-Google-Smtp-Source: AGHT+IFA5qYlm5bEqedLiGYvfasaSXHztZvhGiNg4RG0SNJu3GimE97Yr6qXPi7PsXOCZn+S+k7M/Q==
X-Received: by 2002:a05:6000:26c6:b0:3b7:8362:fed8 with SMTP id
 ffacd0b85a97d-3b794fc19dfmr3050534f8f.2.1753885305784; 
 Wed, 30 Jul 2025 07:21:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:5cc9:639a:a021:88ef?
 ([2a01:e0a:3d9:2080:5cc9:639a:a021:88ef])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b7883228dasm11024541f8f.50.2025.07.30.07.21.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 07:21:45 -0700 (PDT)
Message-ID: <1a961543-76ff-4c22-a18b-b679923fbcca@linaro.org>
Date: Wed, 30 Jul 2025 16:21:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 2/2 RESEND] drm: bridge: Add support for Solomon
 SSD2825 RGB/DSI bridge
To: Svyatoslav Ryhel <clamor95@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Heidelberg <david@ixit.cz>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250730055424.6718-1-clamor95@gmail.com>
 <20250730055424.6718-3-clamor95@gmail.com>
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
In-Reply-To: <20250730055424.6718-3-clamor95@gmail.com>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/07/2025 07:54, Svyatoslav Ryhel wrote:
> SSD2825 is a cost-effective MIPI Bridge Chip solution targeting mainly
> smartphones. It can convert 24bit RGB interface into 4-lane MIPI-DSI
> interface to drive display modules of up to 800 x 1366, while supporting
> AMOLED, a-si LCD or LTPS panel technologies for smartphone applications.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>   drivers/gpu/drm/bridge/Kconfig   |  13 +
>   drivers/gpu/drm/bridge/Makefile  |   1 +
>   drivers/gpu/drm/bridge/ssd2825.c | 775 +++++++++++++++++++++++++++++++
>   3 files changed, 789 insertions(+)
>   create mode 100644 drivers/gpu/drm/bridge/ssd2825.c
> 

<snip>

LGTM

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
