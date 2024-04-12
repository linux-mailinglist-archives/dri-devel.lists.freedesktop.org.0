Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BBC8A2EBD
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 15:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11FF310EB01;
	Fri, 12 Apr 2024 13:03:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="p9TRalUN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7308110EB01
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 13:03:29 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2d485886545so13127181fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 06:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712927007; x=1713531807; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Nm8LSvH+A0aysY1LVMvbC5kt2UeJVTw7St9EkLFip3k=;
 b=p9TRalUN7u/LCWSGArEL8e7YpsLu9lbfoV0os9Vx7zmIQAEYOKxEA+qmO+9HslGp/O
 rWu46uAguuvayNUTiOeAAq2tUUR8GHdGTdKIPlGa5+zuxkioz4TblhmfIMipWPLWSW7K
 Z79EiXMjuursn2kAKcmhBMnY2u7Uw9vMEtt9hjA5XjuvorVLAk2FsWE+HxeFZ8GgsFU1
 LVZ5l6HudRjah9G856MWamszumGQGaROlwtfOriMkSMA4FTXBzWQXqxF4RoSP5GmBh1o
 aYltqLn7WJ8WLVgOzYUbCWmjQjA7g6vDNfXEJdNx9u1yjv1/qS02BWXu3e18EUjuy3xP
 UJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712927007; x=1713531807;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Nm8LSvH+A0aysY1LVMvbC5kt2UeJVTw7St9EkLFip3k=;
 b=GS77Jr5ZiokLI6ZN7ys4pZvz/1iREJWHALKFa/aP7Bl/E3DRaOta2icHALx8Hf9rV4
 0E4NdZrulHZedHTSmvCj55VxucGCQrdRENdw+XLZKzF2WXfiDQRtFkUGMkmk6Rvg7Yn+
 mSViRKY7SvVEHl7l07XLM5xXX5I858FVloN7ghPsToMg2KiHdYUFu9MgapDkgx0bSYwJ
 QISD1dSNeEfrduc2IX3/izc1mfn3akqahkmpkZZRvRBUp/F/xcIMLQ61a897iWbBvmn3
 BaBH3J3xj7jf8EBH6nIryA6OXKmrJHw0/KnKTNojqrX+qYbcBeobdCio4jTdeiqmOgta
 FOxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbjio4pCO+/j2shzW6uQ+MTBZ20IOXi0KarxEJZV3T9Syk4B68e5deMDGwdX6+Iyq9t0fXxSa/7ef3TpUxDqaCEfnhMCxjrX7nvL2VMhpI
X-Gm-Message-State: AOJu0Yww39qL4Yi503LcjuQtGwusTRU/2YLsPTUnLqSYBi/qr3o20Wf3
 PlWPNBUOGjCxI57gce7o/VCXmv+9V3oxwlT9as5I0E9tJHt8CrSiDoqbPWV4tcg=
X-Google-Smtp-Source: AGHT+IHK4CQtsJnkc980vV5S8swNBkt4lBLxARVMCpXsWDOLaK3XIHiJ4ubaGIkNoNRiom/1KZvtjQ==
X-Received: by 2002:a2e:a545:0:b0:2d8:58b6:c10d with SMTP id
 e5-20020a2ea545000000b002d858b6c10dmr2214877ljn.18.1712927006961; 
 Fri, 12 Apr 2024 06:03:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:986c:54c:12ce:a121?
 ([2a01:e0a:982:cbb0:986c:54c:12ce:a121])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a05651c000900b002d2697570fcsm502800lja.93.2024.04.12.06.03.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Apr 2024 06:03:26 -0700 (PDT)
Message-ID: <00b0e513-bb8a-4db7-aa8e-57632add4752@linaro.org>
Date: Fri, 12 Apr 2024 15:03:22 +0200
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

Indeed your scheme looks good, I'll try it since indeed we only need
to prepare it once in the lifetime of the driver.

> 
> PS: I'm so happy that we don't need any clock notifiers for this!
> So: good work with the clock driver bits.

Thx !

> 
> 
> Let me know what you think,
> Martin
> 
> 
> [0] https://github.com/xdarklight/linux/blob/meson-mx-integration-6.9-20240323/drivers/gpu/drm/meson/meson_vclk.c#L1177-L1179
> [1] https://github.com/xdarklight/linux/blob/meson-mx-integration-6.9-20240323/drivers/gpu/drm/meson/meson_vclk.c#L1077
> [2] https://github.com/xdarklight/linux/blob/meson-mx-integration-6.9-20240323/drivers/gpu/drm/meson/meson_vclk.c#L1053

