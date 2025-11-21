Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 561D4C7A324
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 15:36:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A2310E88D;
	Fri, 21 Nov 2025 14:36:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VcPRlhOB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77E310E88E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 14:36:39 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-42b3377aaf2so1216256f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 06:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763735798; x=1764340598; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=tGloELWCAwNOjaOVPrzD6GUKQKA52qfEmJpK3JJ0W/0=;
 b=VcPRlhOBPNDTwEemfrqxO7z1YBp3HKEKtWAdvIrazUAAB1dMpalycwcWIdef5TvzAy
 Qk4281a/ZfztdUyHWvfVTYQVdXid4QnPWirrifZHwvJ5J+k3G4D+vZOgy9O1Lz+ZEnYC
 C48j1FzntdF+EulkM2q8pwBGi0wtPsdvuH4hEgOEpXaE/DVPtOtAPkehw62Xathpwnob
 wQj1OrTKwfJl70dhhRxw7h4ELy4Fqw0fBnf2fXBoihTeo9wvSZ+EJA1qJuUHIgydmNJf
 xI46Fpsc3+ulVPcbfdRMkTXbqaFhPFeMkGfilSlYkD8aAyKiG3KkN0bI0Ons2ZQNW7/7
 oCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763735798; x=1764340598;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tGloELWCAwNOjaOVPrzD6GUKQKA52qfEmJpK3JJ0W/0=;
 b=fQE4SaqK14Emd8VtYCLh09tSZ92ETHfzNDZjF9Q5zwaqWcx01P943C4T6jziPiUHT8
 yUPEZpDyIc3RPlBTNrCRC/Ug6LEdFa314M5FApvm5fj5eDJ6+EP/Em3io+uHp4kLEwCR
 MSMBh6TnIrfUcASk1j5fRs1aihbgA2iTyGNlTHNVjnVWIWbXr7n0+40HEStpAAM34G4Y
 FIu9+YZdfdbZJRUgDdTFNUWr1nT8iNykX6X4mN7QqJpv3rN+W6DjKR53jKzYvdHMLD4b
 NLFpkbG9eTLB/oQpBPVO+5HVFaNhxzlS4sssTNQczAVdTEWNqqIX23H37RxSSwIj9Gxc
 qqSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLuR2EIQU9gGdMFwhKbBrckkdzKGqX/FUHetsbAKxswcGgMhQCBnpe41+5e2Ih55vJ1lVw1p8Hkvc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxaf46XuywDBhYD/J3G+zkh4GmI7Gj11RZkPSUsQOqsxEm61N9r
 YLjO7G/bcaoUlagVfuMhEM9QN0Ql6CP9GYdaVIY0bvFPB/ked29yxehBc6T9lqe5krQ=
X-Gm-Gg: ASbGncsLDuxSuO+EwIRZH3k8UdpUjbd62XTwuo6qO8iSGiBsK5nJHyMh/t4ff8Xlv+S
 Xg5hYUvGUfPkWVMuEWwmAPrcdy9CNw6z+djXbYglhZ4XgqOiA2qhFEk07RyoAJ/fdFk9rBYWxyL
 jfDq5vqF/VLTYVWhoemi20g2MffiRowfsg/i/WKuADNZXOGn33lhe0fEVLXWvryMcZrW/fN7Q21
 nDcEQnPfnjWpvWELufY/kz+k/QrZHTQbGUevl/rRm56SDKDF7h0hVKRC+VqJJr46DA0bDy9PpAG
 sanxeAtl9Ol3DdnfINeH4dPBSNJYNCfcVGJJiSPSQnC4ndCVB/mIDHPPraRsOrU9uzRdY/VlLII
 EsH1ClZFiQ6dthTGpldiB4kKhiEf+mboU8c2pyd60FtpnCEeBnu+PVO04mSNdH1oLPYM9eeSCll
 QGWPM+Q/iFycP/nWo7OIzAQx8G56LZRGEDblzKs3iiDUZkP3l6ga0SnuU3w9ALLhY=
X-Google-Smtp-Source: AGHT+IGX6jCo5Ujy+ZFfRgTfhbHhSPg87C4QJY43bF2bspYbetMdvSgII7RsO5EeWRYFbRFDg/CPNg==
X-Received: by 2002:a05:6000:2c09:b0:426:d54d:224d with SMTP id
 ffacd0b85a97d-42cc1d0cea3mr2595141f8f.27.1763735797644; 
 Fri, 21 Nov 2025 06:36:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:159f:1839:bb92:1eca?
 ([2a01:e0a:3d9:2080:159f:1839:bb92:1eca])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fa3a6bsm11383702f8f.28.2025.11.21.06.36.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Nov 2025 06:36:37 -0800 (PST)
Message-ID: <01cc15f4-6e62-47b8-b7dd-39f990d23801@linaro.org>
Date: Fri, 21 Nov 2025 15:36:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 3/7] drm/bridge: simple: add ASL CS5263 DP-to-HDMI
 bridge
To: Georg Gottleuber <ggo@tuxedocomputers.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>,
 Srinivas Kandagatla <srini@kernel.org>, stefan.schmidt@linaro.org,
 stephan.gerhold@linaro.org, wse@tuxedocomputers.com, cs@tuxedo.de,
 dri-devel@lists.freedesktop.org
References: <20251121142623.251118-1-ggo@tuxedocomputers.com>
 <20251121142623.251118-4-ggo@tuxedocomputers.com>
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
In-Reply-To: <20251121142623.251118-4-ggo@tuxedocomputers.com>
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

On 11/21/25 15:26, Georg Gottleuber wrote:
> From: Ettore Chimenti <ettore.chimenti@linaro.org>
> 
> Add support for the transparent ASL CS5263 DP-to-HDMI bridge.
> 
> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
> Signed-off-by: Georg Gottleuber <ggo@tuxedocomputers.com>
> ---
>   drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
> index e4d0bc2200f8..94aba5a9c9b9 100644
> --- a/drivers/gpu/drm/bridge/simple-bridge.c
> +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> @@ -261,6 +261,11 @@ static const struct of_device_id simple_bridge_match[] = {
>   			.timings = &default_bridge_timings,
>   			.connector_type = DRM_MODE_CONNECTOR_VGA,
>   		},
> +	}, {
> +		.compatible = "asl-tek,cs5263",
> +		.data = &(const struct simple_bridge_info) {
> +			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
> +		},
>   	}, {
>   		.compatible = "radxa,ra620",
>   		.data = &(const struct simple_bridge_info) {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
