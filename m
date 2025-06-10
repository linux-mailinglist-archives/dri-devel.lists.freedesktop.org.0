Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F23AD2E92
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 09:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB0F610E46F;
	Tue, 10 Jun 2025 07:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SWXGRSNz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40E510E46F
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 07:24:18 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-450cfb79177so24587045e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 00:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749540257; x=1750145057; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=4Ct5DaGbTXHB6VLZbLZ+n7DCJpYObNUiN7xrzDYEfiU=;
 b=SWXGRSNzKMWiEalQ6Zr+jqi+beDbdYWeJ7gglgystWmRCl1YH8/Bztq3Jfr2FyFr26
 9YIMuUGqMLYWjS2hBLVRKgbTy23kEVHCv8ynIm8/VW28CGEY+tIRUx0uiaDhUtyFxCOx
 Nx4IcL/HS8vF5S+5f6Drj7NV2vUBcExcv/P54inOh6A/82JX6a9cxUigvTnrjkTT6NnR
 /vUXt0peYboPHtwN3LRCw9GV+LbZmJZDyihW7gB61qOSU1GGecsE96G4PS0KAtA5tG+c
 R9i+pA+srSTzBVwWAdKHtLMxN6/Dw1+URFc8eX0OIM3gZW6HrIJTaxWQF9qOvJUiqfTh
 q5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749540257; x=1750145057;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4Ct5DaGbTXHB6VLZbLZ+n7DCJpYObNUiN7xrzDYEfiU=;
 b=Y98epfSb6iZol+g2aptGjXqaVfyTGyLg7fGTqEpzZoYYlQEnpdv0tqouP4lfco38+l
 JNKTsubbk8iat8ej/zIFd6YnM6PkNfTtJMTzy75jZBX8Il24aKemGMw4my4qhAeAplRT
 8eiDjg4D9gxr+G8LxhTYIWGp7gEGV1kfXmYa8bUp4eI/rGFhT/0KCABwkfXJOHkbYR4R
 3RnDtu52fqkGq9Isl8hMpgTjb5wl/O7yftP9yclsyNK7GbZTS+KE6lnpqxT7eBBtfJi3
 iT2Mp2m9o+ezuwvhzKxT5EPG21FKeWyTsAwKi1e6dxwRED3mOBu66BW9MjSezmNYaNK3
 KhdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5MiR/hC7r+q/RE+pghRYnjhDycLshcJlVNvill2Qpq08X8TZ8F9lokP6ddqw0g1rJUb52Q2A7bGY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywxd16BzEJy0i+ub+HfM0T4wMx2eUeTonQlofQETNxomSvVEJwZ
 /YLsjRUsQBwEiZTjEcv7JbLxHqmaRd7jzP28xK1G5mEGYPOmHjOaoKRf7f6QxOycVAk=
X-Gm-Gg: ASbGncuu128QRtcP9hD7B77EG7/pmpXPWjrcUBdEmEOpQ5dLBoBG/X5L+Y/pCVHjmcN
 /OcDx8mzbmSPf+gZLX59yKnH/bEBmNLCVOafvl2PjutSUsyLoR4vcRR+issiX/j3+bs+elUOPXi
 Tx/HzAExy6QxvM4yskhfcjJGqWDBL6wyuzHJJK3ADHdIYgAGh7XfghD3lzA7Hzn61SJ4yU08U+L
 6J9IhakzyDLk3g81fQots7RHkmjrerj54nJTmFI5SLvVwnDBEeu8L3KrGk2YOJenscLoBqh2WCZ
 ZrXpbrC8ABpv4gN5KtJGB40eZ9SIhq3+h6QE9jD+Vi0HaurzVTXC/aQPQE5NoKoNUSBgWh5np59
 Hfzoy8EVdXRTOwSTZaxzFEif9niNbxaiiDIEw
X-Google-Smtp-Source: AGHT+IE97eN6z8mBDxazJcIb+pUGWiJccU812o6mz4Mu1DHe08c1zOSsXFyvGRxaycOwNGTiw2NDdg==
X-Received: by 2002:a05:600c:530d:b0:43c:efed:732c with SMTP id
 5b1f17b1804b1-452014b384cmr104907225e9.28.1749540257306; 
 Tue, 10 Jun 2025 00:24:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f0b:a9b6:d508:9d14?
 ([2a01:e0a:3d9:2080:f0b:a9b6:d508:9d14])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4531fe8526bsm4156705e9.0.2025.06.10.00.24.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 00:24:17 -0700 (PDT)
Message-ID: <a51e20d9-8fd2-4c59-9586-f87e984616e1@linaro.org>
Date: Tue, 10 Jun 2025 09:24:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/3] drm/panel: ilitek-ili9881c: Add configuration for 7"
 Raspberry Pi 720x1280
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250608142908.54121-1-marek.vasut+renesas@mailbox.org>
 <20250608142908.54121-3-marek.vasut+renesas@mailbox.org>
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
In-Reply-To: <20250608142908.54121-3-marek.vasut+renesas@mailbox.org>
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

On 08/06/2025 16:28, Marek Vasut wrote:
> Add configuration for the 7" Raspberry Pi 720x1280 DSI panel
> based on ili9881.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Based on https://github.com/raspberrypi/linux 0d7ac78a3dd9 ("Extending ili9881c driver support for nwe080 panel")
> by Dave Stevenson <dave.stevenson@raspberrypi.com> and others
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 219 ++++++++++++++++++
>   1 file changed, 219 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> index 2f5ae69148cc..06c5ef9a4946 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> @@ -1224,6 +1224,199 @@ static const struct ili9881c_instr am8001280g_init[] = {
>   	ILI9881C_COMMAND_INSTR(MIPI_DCS_WRITE_POWER_SAVE, 0x00),
>   };
>   
> +static const struct ili9881c_instr rpi_7inch_init[] = {
> +	ILI9881C_SWITCH_PAGE_INSTR(3),
> +	ILI9881C_COMMAND_INSTR(0x01, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x02, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x03, 0x73),
> +	ILI9881C_COMMAND_INSTR(0x04, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x05, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x06, 0x0a),
> +	ILI9881C_COMMAND_INSTR(0x07, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x08, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x09, 0x61),
> +	ILI9881C_COMMAND_INSTR(0x0a, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x0b, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x0c, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x0d, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x0e, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x0f, 0x61),
> +	ILI9881C_COMMAND_INSTR(0x10, 0x61),
> +	ILI9881C_COMMAND_INSTR(0x11, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x12, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x13, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x14, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x15, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x16, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x17, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x18, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x19, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x1a, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x1b, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x1c, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x1d, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x1e, 0x40),
> +	ILI9881C_COMMAND_INSTR(0x1f, 0x80),
> +	ILI9881C_COMMAND_INSTR(0x20, 0x06),
> +	ILI9881C_COMMAND_INSTR(0x21, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x22, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x23, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x24, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x25, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x26, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x27, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x28, 0x33),
> +	ILI9881C_COMMAND_INSTR(0x29, 0x03),
> +	ILI9881C_COMMAND_INSTR(0x2a, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x2b, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x2c, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x2d, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x2e, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x2f, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x30, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x31, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x32, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x33, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x34, 0x04),
> +	ILI9881C_COMMAND_INSTR(0x35, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x36, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x37, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x38, 0x3c),
> +	ILI9881C_COMMAND_INSTR(0x39, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3a, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3b, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3c, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3d, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3e, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3f, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x40, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x41, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x42, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x43, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x44, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x50, 0x10),
> +	ILI9881C_COMMAND_INSTR(0x51, 0x32),
> +	ILI9881C_COMMAND_INSTR(0x52, 0x54),
> +	ILI9881C_COMMAND_INSTR(0x53, 0x76),
> +	ILI9881C_COMMAND_INSTR(0x54, 0x98),
> +	ILI9881C_COMMAND_INSTR(0x55, 0xba),
> +	ILI9881C_COMMAND_INSTR(0x56, 0x10),
> +	ILI9881C_COMMAND_INSTR(0x57, 0x32),
> +	ILI9881C_COMMAND_INSTR(0x58, 0x54),
> +	ILI9881C_COMMAND_INSTR(0x59, 0x76),
> +	ILI9881C_COMMAND_INSTR(0x5a, 0x98),
> +	ILI9881C_COMMAND_INSTR(0x5b, 0xba),
> +	ILI9881C_COMMAND_INSTR(0x5c, 0xdc),
> +	ILI9881C_COMMAND_INSTR(0x5d, 0xfe),
> +	ILI9881C_COMMAND_INSTR(0x5e, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x5f, 0x0e),
> +	ILI9881C_COMMAND_INSTR(0x60, 0x0f),
> +	ILI9881C_COMMAND_INSTR(0x61, 0x0c),
> +	ILI9881C_COMMAND_INSTR(0x62, 0x0d),
> +	ILI9881C_COMMAND_INSTR(0x63, 0x06),
> +	ILI9881C_COMMAND_INSTR(0x64, 0x07),
> +	ILI9881C_COMMAND_INSTR(0x65, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x66, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x67, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x68, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x69, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x6a, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x6b, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x6c, 0x15),
> +	ILI9881C_COMMAND_INSTR(0x6d, 0x14),
> +	ILI9881C_COMMAND_INSTR(0x6e, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x6f, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x70, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x71, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x72, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x73, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x74, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x75, 0x0e),
> +	ILI9881C_COMMAND_INSTR(0x76, 0x0f),
> +	ILI9881C_COMMAND_INSTR(0x77, 0x0c),
> +	ILI9881C_COMMAND_INSTR(0x78, 0x0d),
> +	ILI9881C_COMMAND_INSTR(0x79, 0x06),
> +	ILI9881C_COMMAND_INSTR(0x7a, 0x07),
> +	ILI9881C_COMMAND_INSTR(0x7b, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x7c, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x7d, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x7e, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x7f, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x80, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x81, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x82, 0x14),
> +	ILI9881C_COMMAND_INSTR(0x83, 0x15),
> +	ILI9881C_COMMAND_INSTR(0x84, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x85, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x86, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x87, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x88, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x89, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x8A, 0x02),
> +	ILI9881C_SWITCH_PAGE_INSTR(4),
> +	ILI9881C_COMMAND_INSTR(0x6C, 0x15),
> +	ILI9881C_COMMAND_INSTR(0x6E, 0x2A),
> +	ILI9881C_COMMAND_INSTR(0x6F, 0x33),
> +	ILI9881C_COMMAND_INSTR(0x3B, 0x98),
> +	ILI9881C_COMMAND_INSTR(0x3a, 0x94),
> +	ILI9881C_COMMAND_INSTR(0x8D, 0x14),
> +	ILI9881C_COMMAND_INSTR(0x87, 0xBA),
> +	ILI9881C_COMMAND_INSTR(0x26, 0x76),
> +	ILI9881C_COMMAND_INSTR(0xB2, 0xD1),
> +	ILI9881C_COMMAND_INSTR(0xB5, 0x06),
> +	ILI9881C_COMMAND_INSTR(0x38, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x39, 0x00),
> +	ILI9881C_SWITCH_PAGE_INSTR(1),
> +	ILI9881C_COMMAND_INSTR(0x22, 0x0A),
> +	ILI9881C_COMMAND_INSTR(0x31, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x53, 0x7d),
> +	ILI9881C_COMMAND_INSTR(0x55, 0x8f),
> +	ILI9881C_COMMAND_INSTR(0x40, 0x33),
> +	ILI9881C_COMMAND_INSTR(0x50, 0x96),
> +	ILI9881C_COMMAND_INSTR(0x51, 0x96),
> +	ILI9881C_COMMAND_INSTR(0x60, 0x23),
> +	ILI9881C_COMMAND_INSTR(0xA0, 0x08),
> +	ILI9881C_COMMAND_INSTR(0xA1, 0x1d),
> +	ILI9881C_COMMAND_INSTR(0xA2, 0x2a),
> +	ILI9881C_COMMAND_INSTR(0xA3, 0x10),
> +	ILI9881C_COMMAND_INSTR(0xA4, 0x15),
> +	ILI9881C_COMMAND_INSTR(0xA5, 0x28),
> +	ILI9881C_COMMAND_INSTR(0xA6, 0x1c),
> +	ILI9881C_COMMAND_INSTR(0xA7, 0x1d),
> +	ILI9881C_COMMAND_INSTR(0xA8, 0x7e),
> +	ILI9881C_COMMAND_INSTR(0xA9, 0x1d),
> +	ILI9881C_COMMAND_INSTR(0xAA, 0x29),
> +	ILI9881C_COMMAND_INSTR(0xAB, 0x6b),
> +	ILI9881C_COMMAND_INSTR(0xAC, 0x1a),
> +	ILI9881C_COMMAND_INSTR(0xAD, 0x18),
> +	ILI9881C_COMMAND_INSTR(0xAE, 0x4b),
> +	ILI9881C_COMMAND_INSTR(0xAF, 0x20),
> +	ILI9881C_COMMAND_INSTR(0xB0, 0x27),
> +	ILI9881C_COMMAND_INSTR(0xB1, 0x50),
> +	ILI9881C_COMMAND_INSTR(0xB2, 0x64),
> +	ILI9881C_COMMAND_INSTR(0xB3, 0x39),
> +	ILI9881C_COMMAND_INSTR(0xC0, 0x08),
> +	ILI9881C_COMMAND_INSTR(0xC1, 0x1d),
> +	ILI9881C_COMMAND_INSTR(0xC2, 0x2a),
> +	ILI9881C_COMMAND_INSTR(0xC3, 0x10),
> +	ILI9881C_COMMAND_INSTR(0xC4, 0x15),
> +	ILI9881C_COMMAND_INSTR(0xC5, 0x28),
> +	ILI9881C_COMMAND_INSTR(0xC6, 0x1c),
> +	ILI9881C_COMMAND_INSTR(0xC7, 0x1d),
> +	ILI9881C_COMMAND_INSTR(0xC8, 0x7e),
> +	ILI9881C_COMMAND_INSTR(0xC9, 0x1d),
> +	ILI9881C_COMMAND_INSTR(0xCA, 0x29),
> +	ILI9881C_COMMAND_INSTR(0xCB, 0x6b),
> +	ILI9881C_COMMAND_INSTR(0xCC, 0x1a),
> +	ILI9881C_COMMAND_INSTR(0xCD, 0x18),
> +	ILI9881C_COMMAND_INSTR(0xCE, 0x4b),
> +	ILI9881C_COMMAND_INSTR(0xCF, 0x20),
> +	ILI9881C_COMMAND_INSTR(0xD0, 0x27),
> +	ILI9881C_COMMAND_INSTR(0xD1, 0x50),
> +	ILI9881C_COMMAND_INSTR(0xD2, 0x64),
> +	ILI9881C_COMMAND_INSTR(0xD3, 0x39),
> +};
> +
>   static inline struct ili9881c *panel_to_ili9881c(struct drm_panel *panel)
>   {
>   	return container_of(panel, struct ili9881c, panel);
> @@ -1450,6 +1643,23 @@ static const struct drm_display_mode am8001280g_default_mode = {
>   	.height_mm	= 151,
>   };
>   
> +static const struct drm_display_mode rpi_7inch_default_mode = {
> +	.clock          = 83330,
> +
> +	.hdisplay	= 720,
> +	.hsync_start	= 720 + 239,
> +	.hsync_end	= 720 + 239 + 33,
> +	.htotal		= 720 + 239 + 33 + 50,
> +
> +	.vdisplay	= 1280,
> +	.vsync_start	= 1280 + 20,
> +	.vsync_end	= 1280 + 20 + 2,
> +	.vtotal		= 1280 + 20 + 2 + 30,
> +
> +	.width_mm	= 90,
> +	.height_mm	= 151,
> +};
> +
>   static int ili9881c_get_modes(struct drm_panel *panel,
>   			      struct drm_connector *connector)
>   {
> @@ -1613,6 +1823,14 @@ static const struct ili9881c_desc am8001280g_desc = {
>   		      MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
>   };
>   
> +static const struct ili9881c_desc rpi_7inch_desc = {
> +	.init = rpi_7inch_init,
> +	.init_length = ARRAY_SIZE(rpi_7inch_init),
> +	.mode = &rpi_7inch_default_mode,
> +	.mode_flags =  MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM,
> +	.lanes = 2,
> +};
> +
>   static const struct of_device_id ili9881c_of_match[] = {
>   	{ .compatible = "bananapi,lhr050h41", .data = &lhr050h41_desc },
>   	{ .compatible = "feixin,k101-im2byl02", .data = &k101_im2byl02_desc },
> @@ -1620,6 +1838,7 @@ static const struct of_device_id ili9881c_of_match[] = {
>   	{ .compatible = "tdo,tl050hdv35", .data = &tl050hdv35_desc },
>   	{ .compatible = "wanchanglong,w552946aba", .data = &w552946aba_desc },
>   	{ .compatible = "ampire,am8001280g", .data = &am8001280g_desc },
> +	{ .compatible = "raspberrypi,dsi-7inch", &rpi_7inch_desc },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, ili9881c_of_match);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
