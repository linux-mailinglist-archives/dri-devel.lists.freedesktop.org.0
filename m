Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A26B22075
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 10:15:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058A010E0D6;
	Tue, 12 Aug 2025 08:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JrwFnDM9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB9F10E0D6
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 08:15:04 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-459d44d286eso26469835e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 01:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754986502; x=1755591302; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=pN57oXTQNN+kWgs2rlbAODPtdDkSVmlBgQUqiBVeU2s=;
 b=JrwFnDM96qMaTToa3BTL0y/eqrtlzqpJXWNxetdRavyfMx5IdeWKQ6jMGqTdOuz33Y
 NhP8FPzv/5m+3j/xnuzJ3PI/FCvuMjthiC1mj/PwqIDJ8+r0WLg5pH0hJKEmid45HAQw
 wIkstuMRVeYH8h1C8pbqwwOUbdiZgB0dfy/aqtXFKKO2ESpUcUQcdDWWWep+K9PUzihI
 OMC2GBLfuIWqFt4B1byIOmQV8VUgwgxFyNGCkTl3e9DI46yIvGsysUKRB6eHJDvAR0sv
 d+AU/DoAeG7JOKyksrFC9f0pURHE0u+xz6I7SwIR92Q+bZMsjMALGih+cBPcuWtVO33v
 b/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754986502; x=1755591302;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=pN57oXTQNN+kWgs2rlbAODPtdDkSVmlBgQUqiBVeU2s=;
 b=oFmfsWN04Aeq34tDHZgnXYksdns61Ahww6p9gs/6ov3cPw5t5i5CRuUaZKVYTBoQMy
 tyhoE0hZIwKQpS+cGTuaNE6N2JC6QIVhVIzkZjIevAbG65tZCAfxwcH2gd7zneQJ2Ca6
 0enIU/B6hhtHWG2rukGjnoaXwKAQexHDVwN8U/48bsdhMCwbfYg3uN6gBo8BWTdM/Spi
 u7kJXazPztN41QtEid3tU6rR+2PanvvBovl0NjuuQELypTCH19vDeU+X15Vn2oECx/iq
 rQd16cHoKkQBOYOLKaY7MErxYZiAJDVtI759aTEzPdO6JRICZQ95Fr1NF/D2Y3St575o
 t8Rg==
X-Gm-Message-State: AOJu0Yy1DOHEMpBIRt3zbsdsoBA9uc7wjisvtDHlaBZRYwxXwWkMFf3g
 hkYXT6/GBwvpeY/3294FFLai4/BsXOBVAB+5rGLeNpkgIZOrhl3dDHgyzFPS2Rrbze0=
X-Gm-Gg: ASbGncu3cRqzUcWhejeI6q3ezA7zlTsscfPGNyAVjn6PWrruwoeak4tkMKHOs2HQiT6
 gdUcU9ey0mGuTcjaF1q3e4uFU4PiX7SGBXeiGwUGx7IU1S61um5J2RJnRDzdvXPYpr69BsthSm5
 5ITwPbuvSBFM1c0YK6zt6MlJDXKepiqwgC2BlX6tDbN28Qx9ZKqs4+vMTEMzedc428aYQKvCeeS
 g54XGyNYFWqygewrpYKkjwTZFde9kFyAEja5BvLE3BEEv4CRpB+tnsyLqc5w0QO4VtU9w2bR1AP
 QSTfkwPjHBJI2UH7EU4l7m+cpIz1QCQ8u5hbvX2w2FrQoHM8omJSFILN0zGZMtu6auMTBBC3SPS
 FryPEvi7kXqNguF3N0Ylb0QvuurObBg48KquMvJ2DxvAW+Ft2TTr+Lret8fkb/xyrvNlhwcOYh/
 k=
X-Google-Smtp-Source: AGHT+IGgL3yyDAPzmefnqKSQ970dNNvT0Hxvtv7jPpY0F6pR5ILZMIzabFQsn92mA6VAuKY5oUkySA==
X-Received: by 2002:a05:6000:310f:b0:3b7:775d:e923 with SMTP id
 ffacd0b85a97d-3b91113c85emr1895776f8f.4.1754986502258; 
 Tue, 12 Aug 2025 01:15:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:9086:bd36:16a7:1f8b?
 ([2a01:e0a:3d9:2080:9086:bd36:16a7:1f8b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e585586esm303982875e9.13.2025.08.12.01.15.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 01:15:01 -0700 (PDT)
Message-ID: <787d1e5d-dd4a-4bb4-b224-588ad132a9f1@linaro.org>
Date: Tue, 12 Aug 2025 10:15:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/panel: panel-summit: Include <linux/property.h> and
 <linux/mod_devicetable.h>
To: Thomas Zimmermann <tzimmermann@suse.de>, fnkl.kernel@gmail.com,
 j@jannau.net, jessica.zhang@oss.qualcomm.com, robh@kernel.org
Cc: dri-devel@lists.freedesktop.org, asahi@lists.linux.dev
References: <20250812081118.221103-1-tzimmermann@suse.de>
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
In-Reply-To: <20250812081118.221103-1-tzimmermann@suse.de>
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

On 12/08/2025 10:10, Thomas Zimmermann wrote:
> Include <linux/property.h> to declare device_property_read_u32() and
> <linux/mod_devicetable.h> to declare struct of_device_id. Avoids the
> dependency on the backlight header to include it.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
> Based on an earlier patch reviewed at [1].
> 
> [1] https://patchwork.freedesktop.org/patch/664115/?series=150454&rev=3
> ---
>   drivers/gpu/drm/panel/panel-summit.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-summit.c b/drivers/gpu/drm/panel/panel-summit.c
> index 4854437e2899..6d40b9ddfe02 100644
> --- a/drivers/gpu/drm/panel/panel-summit.c
> +++ b/drivers/gpu/drm/panel/panel-summit.c
> @@ -1,6 +1,8 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   
>   #include <linux/backlight.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/property.h>
>   #include <drm/drm_device.h>
>   #include <drm/drm_mipi_dsi.h>
>   #include <drm/drm_mode.h>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
