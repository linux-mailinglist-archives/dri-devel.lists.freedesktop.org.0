Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB208AD2BA
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 18:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50B710F753;
	Mon, 22 Apr 2024 16:51:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="n2CKcUWf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64EFD10F753
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 16:51:40 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-417e327773cso31410245e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 09:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713804698; x=1714409498; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=EJE4rl1eEAUqGfBZC2SJPu8F2JMT82hT5pkxBZ1KzUY=;
 b=n2CKcUWflfYqtXCxExUkqxPMIIi8PUir5Gdky/mQZH9XlEOT2ydG24yZUE8EY9MZ0S
 eCN953ICBZueDoIMDRzpA6BCNWA/xs/g56v7ULmVzYyZJQZf2+JUv9Dawb+Ykw0P98Rf
 4O8lUU+a783n0MTsmDU3TlrINMag9+LMelxkkATZc8ULu4QTBZ+LQuha8YpA1wg8aez8
 N0A2W4JAv0DkUJC+/49Ltbv1xCa/YaYqm5AKemd9Q6ehEioXMu24wAxXW10kxCRmaWOp
 8hf3qBnjQ3dAsMTInnEC2qEPHZ48mQ12lM9rSduZV+kddiYuouX+OFX5d44dwCcrjq0s
 tu7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713804698; x=1714409498;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=EJE4rl1eEAUqGfBZC2SJPu8F2JMT82hT5pkxBZ1KzUY=;
 b=gNPxj1rkuaz8PiP/uzphF8o33JkRX/s6BfjMqUQk5zxOK08vWn9J7o16PYDe0r+zFf
 qonblAw3PDvf1YGoqcHxK24ZLEWD9n/P6WNMd2ZFsTTvNNHA96RVvmbI8zwQbUbIHn85
 P/S837WOzswbz3iTSWJSad2HOS1aNBWSqU74xJ+gHwgBcKNs9tLspQlK9jFRF9z1L1dM
 Th3fU50hWgJtF3xMlG6iQusUUV5Uw+Tt3/p1ojNsM2c0HqvqD4Y57EazJbWjZ+FO0aOO
 MfjrAYRErpbIIMSwfLpF9YXj9lun7CJH5/sPLA2bTgvXd8S0OHSCTT16oT7hWZvGOWGR
 VEBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVBt5PxEuWL573cJY545pCvWGqKBC2xuezSKRnMRNW/FFDfo/zHfEC0thtIYcfphg+v0TVYLttmsJRdcQvZYOlaUd0+R9mpLkUgQQo4sLf
X-Gm-Message-State: AOJu0Ywp9eidxzj/lKlCUL0LGRop0kRSw80MNjrzncl+85da5lasnClF
 6E5C2Mvea+dxnEf4cehEADR6D9N9hRjpECFFIAD1Ki50Is+uTT3xn3+NyItFgpc=
X-Google-Smtp-Source: AGHT+IEnfwfQbwhcjAOciihqlrDnokk0wOxDOpXOkMdC9cD5R08X2KCDBWIiDoP1zJiRjjvC/4n74g==
X-Received: by 2002:a05:600c:a05:b0:41a:5d49:97e9 with SMTP id
 z5-20020a05600c0a0500b0041a5d4997e9mr157502wmp.9.1713804698013; 
 Mon, 22 Apr 2024 09:51:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e5e5:892f:e81f:7cad?
 ([2a01:e0a:982:cbb0:e5e5:892f:e81f:7cad])
 by smtp.gmail.com with ESMTPSA id
 fc14-20020a05600c524e00b004161af729f4sm17228944wmb.31.2024.04.22.09.51.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 09:51:37 -0700 (PDT)
Message-ID: <ee095697-d3b9-40b5-84a5-6d20ff14ca0f@linaro.org>
Date: Mon, 22 Apr 2024 18:51:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v12 4/7] drm/meson: gate px_clk when setting rate
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jagan Teki <jagan@amarulasolutions.com>, Nicolas Belin
 <nbelin@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
References: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
 <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-4-99ecdfdc87fc@linaro.org>
 <CAFBinCChEc+GH+tdmByWDM=Gs_BUpDh=6S=ch3QbGUt501_Ejw@mail.gmail.com>
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
In-Reply-To: <CAFBinCChEc+GH+tdmByWDM=Gs_BUpDh=6S=ch3QbGUt501_Ejw@mail.gmail.com>
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Martin,

On 10/04/2024 21:34, Martin Blumenstingl wrote:
> Hi Neil,
> 
> On Wed, Apr 3, 2024 at 9:46 AM Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>
>> Disable the px_clk when setting the rate to recover a fully
>> configured and correctly reset VCLK clock tree after the rate
>> is set.
>>
>> Fixes: 77d9e1e6b846 ("drm/meson: add support for MIPI-DSI transceiver")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
>> index a6bc1bdb3d0d..a10cff3ca1fe 100644
>> --- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
>> +++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
>> @@ -95,6 +95,7 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
>>                  return ret;
>>          }
>>
>> +       clk_disable_unprepare(mipi_dsi->px_clk);
> nit-pick: clk_disable(mipi_dsi->px_clk); should be enough here as my
> understanding is that we only need to {un,}prepare a clock once.
> 
>>          ret = clk_set_rate(mipi_dsi->px_clk, mipi_dsi->mode->clock * 1000);
>>
>>          if (ret) {
>> @@ -103,6 +104,12 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
>>                  return ret;
>>          }
>>
>> +       ret = clk_prepare_enable(mipi_dsi->px_clk);
>> +       if (ret) {
>> +               dev_err(mipi_dsi->dev, "Failed to enable DSI Pixel clock (ret %d)\n", ret);
>> +               return ret;
> If we ever hit this error case then there will be a lot of additional
> errors in the kernel log:
> - initially the clock is prepared and enabled in
> meson_dw_mipi_dsi_probe() by calling devm_clk_get_enabled()
> - we then disable the clock above (generally disabling a clock is
> expected to always succeed)
> - if the clock can NOT be re-enabled here we just log the error
> - in case a user tries to rmmod the driver (to modprobe it again) to
> try and recover from an error the automatic disabling of the pix_clk
> (based on devm_clk_get_enabled() where it was enabled initially) there
> will be a splat because the clock is already disabled (and enabled
> count is zero, so it cannot be disabled any further)
> 
> For the 32-bit SoC video clocks I keep track of them being enabled or
> disabled, see [0], [1] and [2].
> In my case this is important because we can run into cases where the
> PLL doesn't lock (I am not sure how likely this is for your case).
> 
> It *seems* like we need to do something similar as
> dw_mipi_dsi_phy_init() can be called when changing the display
> resolution (or whenever drm_bridge_funcs.atomic_pre_enable) is called.
> To illustrate what I have in mind I attached a diff (it's based on
> this patch) - it's compile tested only as I have no DSI hardware.
> In case dw_mipi_dsi_phy_init() is called only once per device
> lifecycle things may get easier.
> 
> PS: I'm so happy that we don't need any clock notifiers for this!
> So: good work with the clock driver bits.

I checked and tested your patches and it doesn't work because the pc_clk
needs to be disabled & prepared in order to correctly reset and setup again
the video clock tree.

dw_mipi_dsi_phy_init() is called at each DSI mode change, but it requires a
full clock tree recalc and reset, so it's safer to keep the current design.

I'll try to send a change to better handle the disable_unprepare() failure, but
definitely only calling clk_disable() wasn't enough.

Thanks,
Neil

> 
> 
> Let me know what you think,
> Martin
> 
> 
> [0] https://github.com/xdarklight/linux/blob/meson-mx-integration-6.9-20240323/drivers/gpu/drm/meson/meson_vclk.c#L1177-L1179
> [1] https://github.com/xdarklight/linux/blob/meson-mx-integration-6.9-20240323/drivers/gpu/drm/meson/meson_vclk.c#L1077
> [2] https://github.com/xdarklight/linux/blob/meson-mx-integration-6.9-20240323/drivers/gpu/drm/meson/meson_vclk.c#L1053

