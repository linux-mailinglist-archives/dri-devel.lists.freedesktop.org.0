Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A33BC6F72E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 15:55:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F251C898F5;
	Wed, 19 Nov 2025 14:55:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ya7vbsfQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 160B389F27
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 14:55:22 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-477632d45c9so50565485e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 06:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763564120; x=1764168920; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=AG2Ivm3gxxeIGO2S2nN8YgMONCoL1ktp5mhPJvGMAXs=;
 b=ya7vbsfQR3hUoG2vMFRQwUM3EbfggyyVzZLbC+VuXcQK7fDILOx+4/GUgd6fB6nFwW
 Tz38bD87TWOhN53cfuzLVHJxrIkPpaZnkXbnwAQfpW9oXjSY94UJrtiGY4dEfX1Po2GO
 J0l/pBAYvsHDALLDr9MQ3hUbcouTuBIIVvjkSWKXSGz1Ah1QRc2jIESE72Bboan2IOon
 kX0fHMsffWK5jDVX8vFhaVCEo0WKOdWWOUtuQyRf3kHMavEDT62TOOVUprFYiG3q+ZEL
 F1+MlU8rHXhNgvvT5CAseor6xoRY0T9HIWl8LWX0FJUH77WTi97ZDk2fWj443MK6Uufh
 F1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763564120; x=1764168920;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AG2Ivm3gxxeIGO2S2nN8YgMONCoL1ktp5mhPJvGMAXs=;
 b=hjSC9HOvCTHrvYDc39oxYcSllWT1nEWxK9soNuIY58AM1E1HsfEs6wvJK3RNXOPtH9
 HpZsE6J+yz3Q9yif2dzrqWqViroxJ9pdSfBAKhY3Ki+D6wVL+q7NoivHboAL8OYuZSVu
 c2MJUzfTNQ/Sjr7xBSIL5mImomg5OQz2FgyfiqmXuWDdKbJWwU7XtKCcpoYimdNpcX76
 5nlcVznSD3UDOup9cjT940LQQ/dguF6AwtKxl5VjMH+oKxly3xFw0jkriOPDRpN+MD84
 kH3FFI8NaklvPWfxL76jLmXF1PEkwCKWyJgn5jfUI8Ez2FVWYtAYqXtJPjL+toMOs3Pd
 64Xg==
X-Gm-Message-State: AOJu0YygMXclOkI7ORZV0DNqc9GWuyLz9gFQ70unwPEHFS3Bb9HJPVFl
 DmTwKpFVXQBRVMRmrI2QvwMx4Dhsjlevalb2mSRdSOOjZ01aIjhgsNVVRH+067HKWkU=
X-Gm-Gg: ASbGnctuwleVetaHbQ0bStnUBEcrJaGzziJD3pgYOP071FCrhAe+thVszVdnSI5ZDq+
 SXGLT9/qck8XMfiBq15KEAJeIUbQqJ0Xu9Ef89UrmWnEIjperTXvgIqziJN1ltS/YskskH3mh9K
 8gvqoA42GVYSRUNIaKOG/jD/m7lJR529ErivlUJh5QKLWf9fjKujVKGTnLneZV25o6rne1Ajkhk
 Wna4q72rWU10TL0twmrR/RBWPyuPJSSG3FNfn0i6+hSRwaVHRR9atb2CHvL5SUhd9kV4nsvpvBj
 4Kv9wALYVQ3qAchctESYLOpu+5BUxA/ujdMwiYHL8Nc3XyJhE/8ajVLz/H+cmumHmPgYKtedSC/
 6WSnNGPJuctzSShumd4m0TYKSSpJGqOYGv7pBt0IDVzIY0APzQqkD76gyQV0UTXjpp0+jEQLZav
 sExnB9c2iTAundHM6036G3hzenGtYnJp8oQsyPJzZ0RZauvZ/HyiQ+J5sDccB/v7c=
X-Google-Smtp-Source: AGHT+IGVWrCliuxc+g4cZNa9BoI6eCTMQ+YEhvBOCZ461rA/CFjIgL3GjXC2pMqZRX0mGHfaueAfPQ==
X-Received: by 2002:a05:600c:c4aa:b0:475:e09c:960e with SMTP id
 5b1f17b1804b1-4778fe88fefmr173211085e9.32.1763564120379; 
 Wed, 19 Nov 2025 06:55:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:263d:925b:a11f:ae36?
 ([2a01:e0a:3d9:2080:263d:925b:a11f:ae36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477b103db28sm65817575e9.14.2025.11.19.06.55.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Nov 2025 06:55:20 -0800 (PST)
Message-ID: <0dbb931f-5b62-4f37-a314-3c9696b5149e@linaro.org>
Date: Wed, 19 Nov 2025 15:55:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 00/12] Make Samsung SOFEF00 DDIC and panel work
To: david@ixit.cz, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20251119-sofef00-rebuild-v3-0-6cd55471e84e@ixit.cz>
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
In-Reply-To: <20251119-sofef00-rebuild-v3-0-6cd55471e84e@ixit.cz>
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

On 11/19/25 15:21, David Heidelberg via B4 Relay wrote:
> This DDIC is essential for panels used in OnePlus 6 and Pixel 3a XL
> (SDC variant). With proper support, all downstream patches in
> sdm845-mainline and sdm670-mainline can be dropped.
> 
> The mainline driver was broken so far, and with my recent introduction
> of S6E3FC2X01 driver, I had to "break it even more" due to OnePlus 6
> common device-tree changes which defined all the regulators and
> corrected properties.
> 
> At this moment the first version of the patchset will not include
> Pixel 3a XL (SDC) as no testers yet volunteered.
> 
> The code, including the Pixel 3a XL enhancement can be found at
>    https://gitlab.com/sdm845/sdm845-next/-/commits/b4%252Fsofef00-rebuild
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Changes in v3:
> - Drop arch prefix from the commit. (Bjorn)
> - Added Casey into MAINTAINERS file. (Casey)
> - Moved compatible legacy comment inline.
> - Link to v2: https://lore.kernel.org/r/20251113-sofef00-rebuild-v2-0-e175053061ec@ixit.cz
> 
> Changes in v2:
> - General fixes to device-tree binding (Krzysztof)
> - Add myself as a maintainer
> - Updated commits wording
> - Link to v1: https://lore.kernel.org/r/20251104-sofef00-rebuild-v1-0-dfcfa17eb176@ixit.cz
> 
> ---
> Casey Connolly (2):
>        drm/panel: sofef00: Add prepare_prev_first flag to drm_panel
>        drm/panel: sofef00: Initialise at 50% brightness
> 
> David Heidelberg (10):
>        dt-bindings: panel: Convert Samsung SOFEF00 DDIC into standalone yaml
>        arm64: qcom: sdm845-enchilada: Specify panel name within the compatible
>        drm/panel: sofef00: Clean up panel description after s6e3fc2x01 removal
>        drm/panel: sofef00: Handle all regulators
>        drm/panel: sofef00: Split sending commands to the enable/disable functions
>        drm/panel: sofef00: Introduce page macro
>        drm/panel: sofef00: Introduce compatible which includes the panel name
>        drm/panel: sofef00: Simplify get_modes
>        drm/panel: sofef00: Mark the LPM mode always-on
>        drm/panel: sofef00: Non-continuous mode and video burst are supported
> 
>   .../bindings/display/panel/panel-simple-dsi.yaml   |  25 +----
>   .../bindings/display/panel/samsung,sofef00.yaml    |  79 ++++++++++++++++
>   MAINTAINERS                                        |   7 ++
>   .../boot/dts/qcom/sdm845-oneplus-enchilada.dts     |   4 +-
>   drivers/gpu/drm/panel/Kconfig                      |   7 +-
>   drivers/gpu/drm/panel/panel-samsung-sofef00.c      | 105 +++++++++++++--------
>   6 files changed, 163 insertions(+), 64 deletions(-)
> ---
> base-commit: fe4d0dea039f2befb93f27569593ec209843b0f5
> change-id: 20251104-sofef00-rebuild-04cfc6e68e71
> 
> Best regards,

For the serie:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
