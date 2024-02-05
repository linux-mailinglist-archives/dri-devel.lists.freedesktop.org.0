Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B7D849889
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 12:11:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B2FD10FE8D;
	Mon,  5 Feb 2024 11:11:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CLogTxyA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 906A410FE8D
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 11:11:46 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-40fdb18ffc7so7294825e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Feb 2024 03:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707131505; x=1707736305; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=R9cDwsecDZ0LscY/WGOk3mCsJ2V/32lETeX606TMcXk=;
 b=CLogTxyALjwQ+bh+w2bpxk62s4Xq1zX4ssKGu4ms/bdx3/oHxluCLDoZ5D0xoulrPO
 CKCyZpcw9ENN/xS6GquwlcEZ0ruZFnc2BqIxDNLtW81YAfHO2Nw7QWcaYeghmvqaZcnm
 B/Ni3FcbE0XnGYcA6ezQlTN4f+IIUl1T0fVBnL8h5QPb7Ud1N84hI0bsJ8t05ONGMkdR
 taVB/Cza9W+NmR/1H6ON68Ch4So7FEuKRTTStwEP1iIIKYd49iXm4Ar5cKg28glCE+Ud
 tmtVPbnVZxXJ+tofAWrJKk9f5AkNbAZ/1uyMJZshsEV+vNjxagN5qxVXZ03d2As9oFkC
 y+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707131505; x=1707736305;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=R9cDwsecDZ0LscY/WGOk3mCsJ2V/32lETeX606TMcXk=;
 b=Lvewi0zoA7qUzEZGsYUk84I7aZ8n0REx3vLJawlJgYh2CrUQhRmlO/VE8BErPML0i2
 wu+HShpxk1vMMBtvIlb9LBk06+nGFZJRs1VSjOZz/Bddddj6IcqVpWW1U/EJwgbZrkl/
 Pw0eTyYEMz9RGCiJ/lmo4GwUkn/kqYe2ptTJJbxnkTd/UFVaM4/5PIMep08a/ct4LhH1
 BF9b/hsyBvstiIBoELtoya+I5GDnjUdmhAC8eGrZFNgrdLXmOKyf2d4IqYSXEfi51OJI
 OjSXsH/osBgjMgP2kpgao8gPFkWWdVNT/NueX1NlVTSsVekBjMzFUk2zwya6F6Cjob/8
 dpgg==
X-Gm-Message-State: AOJu0Yz3M33YF8u+X4acxCY07kTAElx1Es2O8t66sznPqyD/T6IWEWAt
 G0myldFKXaH+JZipWAjCJwszHMdeSIZganHeW3aPsYubOcSKWFfTxFSePgru138=
X-Google-Smtp-Source: AGHT+IGpwEG2fx535CE8Gc+38MfusB782VlMzKPFNHzCyvdpz9UxmXG0MElN+t/AxvRZDv0A/tLT4w==
X-Received: by 2002:adf:e292:0:b0:33a:d2d4:959 with SMTP id
 v18-20020adfe292000000b0033ad2d40959mr9302147wri.11.1707131504859; 
 Mon, 05 Feb 2024 03:11:44 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWxkTrOp4DywLkemB+bNdcX5wUPhxKOBtY45i8Kobm46Vhwt1JNWRl4pA18WSGKP4/82Cd9u3fthD72/QerfzoKx2Ykr/Y53+00yHaT0QgAq8v+xyJDgRqsPPwM3azMv37Sf6IMqwPQIOZFFE/iRHXUG+IvB/P0GRrsiYNnxgSUFFwJJErdBB2ReUtkvLKq0VA1Jn/2nWNXmogZz2sXBIiZkEiFkCz3Hk6zPk0LTIIFblIo2VsxGP3FHhmup0JoMiTjAGFrfA2dqQY74/woWSLsJFOxDUYauVAWcrCVDL/cJ3RmobkLhkpcLU/Sks0C8MrYgl+KDjT4YymxdfAgecgksxSt3NmtK8cNhk4J/0M5W+TPbnBUGKLcjA7Uv9SYiazauuGtVEetqEO07LI9KO9ff8fw27lYx9wpC44fUAx1/cEIdjD+VKiS7fjw3O3HYsKNih4zmcH6TPxISAVeZZcbru6Zl+lh0vhfchniNRXMP/uSaBfZD8JNQMkbl+442AJ5SyEojMwrWO5Iy9U+yY2mskBlpN3n7yigQdrSalDSnz3RprCsDtTXfgQepCgxkVVoSCmHAnctAvdd5VcCJ1B0j5euRUYrr6JhEiB9267qJgpdQy6SgtQwgHHjSivZfATzWxZBcFbK4qZ0BPqvKtipCV7ikM5yz+2tjcvA0HrwcPT9yaVRgVUdFkJManR38PFdXX91XVMQ1XQP33YcO+nhjAI89phG4+QeQAsxW7Q4Ltnpn0oGJWWvfO/qG4c/wEBPBkhj9xJXfPse9CLYuGVUDDOL1nnjMJ1zXGtpTU6n+HbQQ4nCjdEHm1xl4Ty5v3LnCBs4F4l4PQvTWchadLtCk7FxMD1SORQmxDRTI15ryU/SWZbDR0UKP6uDC/6ZMGscwbc3Noxd7fbsjmdHOMQfw46XrIq7/ZF+TBPa+Glrg/oq5lLRPdANZ88i0xT0fdGEpm
 N2tXumIOBX
Received: from ?IPV6:2a01:e0a:982:cbb0:bbd9:ac3e:db1d:9662?
 ([2a01:e0a:982:cbb0:bbd9:ac3e:db1d:9662])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a5d45c1000000b0033b28a784dcsm5799075wrs.114.2024.02.05.03.11.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 03:11:44 -0800 (PST)
Message-ID: <9be17c88-4bf7-4340-8aef-9d5cac4e0f0d@linaro.org>
Date: Mon, 5 Feb 2024 12:11:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [linux][PATCH v2 3/4] MAINTAINERS: add SAM9X7 SoC's LVDS
 controller
Content-Language: en-US, fr
To: Dharma Balasubiramani <dharma.b@microchip.com>, andrzej.hajda@intel.com,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, geert+renesas@glider.be, arnd@arndb.de,
 hari.prasathge@microchip.com, Jason@zx2c4.com, rientjes@google.com,
 rdunlap@infradead.org, vbabka@suse.cz, manikandan.m@microchip.com
References: <20240205110609.217022-1-dharma.b@microchip.com>
 <20240205110609.217022-4-dharma.b@microchip.com>
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
In-Reply-To: <20240205110609.217022-4-dharma.b@microchip.com>
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

On 05/02/2024 12:06, Dharma Balasubiramani wrote:
> Add the newly added LVDS controller for the SAM9X7 SoC to the existing
> MAINTAINERS entry.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
> Changelog
> v1 -> v2
> - No Changes.
> ---
>   MAINTAINERS | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a7c4cf8201e0..24a266d20df6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14230,6 +14230,14 @@ S:	Supported
>   F:	Documentation/devicetree/bindings/power/reset/atmel,sama5d2-shdwc.yaml
>   F:	drivers/power/reset/at91-sama5d2_shdwc.c
>   
> +MICROCHIP SAM9x7-COMPATIBLE LVDS CONTROLLER
> +M:	Manikandan Muralidharan <manikandan.m@microchip.com>
> +M:	Dharma Balasubiramani <dharma.b@microchip.com>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Supported
> +F:	Documentation/devicetree/bindings/display/bridge/microchip,sam9x7-lvds.yaml
> +F:	drivers/gpu/drm/bridge/microchip-lvds.c
> +
>   MICROCHIP SOC DRIVERS
>   M:	Conor Dooley <conor@kernel.org>
>   S:	Supported

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
