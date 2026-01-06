Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A78E7CF75F9
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 09:56:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0569910E4BB;
	Tue,  6 Jan 2026 08:56:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YU4RYoYb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3DA810E4BB
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 08:56:31 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id
 5b1f17b1804b1-47d3ffb0f44so4465405e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 00:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767689790; x=1768294590; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=6IZeLqj+ruvOseCJfQqbCMgkS4X67AcGqRU1gJ/WVx0=;
 b=YU4RYoYbWTOI7q97FxBKvIWAwL2tr1Ka3tbwhomdILh8+BejjT1RTnq/wAVeVZhZtK
 1Yp0YPrz6kxpLw3tkZGYcVQXb/yiSg/IySEnaxOpLWQ8eJrpFs3FviSatV/KrL7tJY5p
 Lb2UP0DeDoMKfXfTECaDJmHEHimhNRDuaw0NwciFoi1dJT4rEwmQVcL74MnLX8QD1d9g
 FdlQmcg/rRVchQ8OqopFht6za0r6yw42SCxY4s1qc9zUGwV8E88AwGDyXdUxmt5y4ZX2
 YY9ScygS2SLT6rN7FzMEVUJMpZwJEgHVqjPsHb5nmjE4YY+5c/gFYTIFaJJk7by8XUJ1
 iX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767689790; x=1768294590;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6IZeLqj+ruvOseCJfQqbCMgkS4X67AcGqRU1gJ/WVx0=;
 b=Nwm39nFATXEQTBN4SoJqZqYtEkD8qI+HPpybMLjtPMFJPOudVRZXOcvNa3dARpdTcC
 H4zTEL1G6OFUS0aqG49EUKzAAe14ZCWQea0kNMSPefttWTHgZsYuQQhx/x7EDofBBLIw
 MjzNgVynoVK7zcCij9lMpFuSOfB82bvXD9MOE5mQ+xmRbUBLiDBH3vJ9NRDc9zFqu9HF
 N0TNx4OM3mSju7EAk7Xvq/rSfN9XHnjzeCAbEwH8xIHVSW/SvSvlEQ4uJpvaOtZHprw6
 WqYBFwD+8XSHkEWowGPbFm4OL5VzKdRMm4h5jc0ccE8q0gY6650efUWm0hF82zidgDaA
 FghQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2JEwXmxeRspMhF8HCbGJrKoXn5yQoLwBKRxjG99JsJnYWU65i2Iuy2xAjoWcFLOWpGiW7NMB7Nmg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLq9S4NZNlWYPg/vNBBWXZfc7z0HSGu61dqCT373xvXGadyGip
 GOVFUQKAtngg0Y5OvX8dYfMWiK27tm3m4B7tqN+vBvcF2dlKzRtMV5rH+x+kYagp5YU=
X-Gm-Gg: AY/fxX4oqJFn2Mqa9ucWfC5ngd3KSzCCxoy+qrMrDoLO2O5v7iG4Uh8Zq2VXjXrQKVq
 efjvTEn2If8chFEYOJhH2inYiyDEnhhlexQrA8evF2IinMvtimxe5kZ03Ma5ETkSu8NnVM/6jr2
 WpT/KvVkPo8WVXzHbQNv7GFePqyrFTTxw1I0Q3PkrWYsjqlVn/eexCiugBxsyMayTJgmLPqMLXa
 6oK9SUNXlUdKM8tGurFqik3AWM/EB2IEQ4vIlaM+1l/k3R4KEMlgcMNb4v4AP3RCeldqN73Ui7f
 g2YXeWipdHXTSvfNzZCkXYTu9AtmXE/QPNbK6y2iCb2S8NX2kTJ/iXd7/7rcJnl+z9pJHAjQkfA
 UIXZcOSdxccsD5j48ZfBEUahMK3p0GOvNV8GOVFff6GtQ6PWHrxIH/N1+VL8IeDmUT7VsJqKPOc
 nY65AaL8MryxOWfh0HUdls9nXW9+pB9iAVQXM1jGSIzpcG2e/oKKudr91Q7a3UcMA=
X-Google-Smtp-Source: AGHT+IG80cOu+UYpaSS69Js4IGq8lZkxpoi0TpsqqXRYJFgEZTRy7wjNDpSqoquo9LkYuW0Gnc5yGQ==
X-Received: by 2002:a05:6000:4301:b0:432:b951:ea00 with SMTP id
 ffacd0b85a97d-432bca5470amr2758228f8f.51.1767689790219; 
 Tue, 06 Jan 2026 00:56:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d283:7a7e:4c57:678d?
 ([2a01:e0a:3d9:2080:d283:7a7e:4c57:678d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e19bfsm3231120f8f.18.2026.01.06.00.56.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 00:56:29 -0800 (PST)
Message-ID: <4573ac2e-795b-42d7-a30b-892bb932aed4@linaro.org>
Date: Tue, 6 Jan 2026 09:56:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: panasonic-vvx10f034n00: transition to mipi_dsi
 wrapped functions
To: Avinal Kumar <avinal.xlvii@gmail.com>
Cc: jessica.zhang@oss.qualcomm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251127161337.396531-1-avinal.xlvii@gmail.com>
 <2a9f7c54-3669-4f8b-b46b-b7e01712a1b8@linaro.org>
 <CAJ9xu4wb1W08ds7f4y+5tzcpAxsNLvKDMAxpjjigsG9ipWREGQ@mail.gmail.com>
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
In-Reply-To: <CAJ9xu4wb1W08ds7f4y+5tzcpAxsNLvKDMAxpjjigsG9ipWREGQ@mail.gmail.com>
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

On 1/6/26 09:53, Avinal Kumar wrote:
> Hello Neil,
> 
> Unlike mipi_dsi_turn_on_peripheral, mipi_dsi_shutdown_peripheral isn't marked deprecated, and no multi function available yet. And I wanted to keep it simple for the first patch.
> 
> If it is okay, I can:
> - Create another patch or update this patch, to add a mipi_dsi_shutdown_peripheral_multi() function and deprecate the normal function.
> - Update the remaining function in this patch.
> 
> Please let me know. Thank you

Yes please do that, first patch introduce mipi_dsi_shutdown_peripheral_multi(), then second patch switch to multi
for wuxga_nt_panel_on() and wuxga_nt_panel_disable().

Thanks,
Neil

> 
> 
> On Tue, Jan 6, 2026 at 1:51 PM <neil.armstrong@linaro.org <mailto:neil.armstrong@linaro.org>> wrote:
> 
>     Hi,
> 
>     On 11/27/25 17:08, Avinal Kumar wrote:
>      > Changes the panasonic-vvx10f034n00 panel to multi
>      > style functions for improved error handling.
>      >
>      > Signed-off-by: Avinal Kumar <avinal.xlvii@gmail.com <mailto:avinal.xlvii@gmail.com>>
>      > ---
>      > Here is the todo list for reference: https://www.kernel.org/doc/html/latest/gpu/todo.html#transition-away-from-using-deprecated-mipi-dsi-functions <https://www.kernel.org/doc/html/latest/gpu/todo.html#transition-away-from-using-deprecated-mipi-dsi-functions>
>      >
>      > This is my first patch in Linux Kernel :)
>      >
>      >   drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c | 7 ++++++-
>      >   1 file changed, 6 insertions(+), 1 deletion(-)
>      >
>      > diff --git a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
>      > index 3c3308fc55df..03c87c02fb57 100644
>      > --- a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
>      > +++ b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
>      > @@ -44,7 +44,12 @@ static inline struct wuxga_nt_panel *to_wuxga_nt_panel(struct drm_panel *panel)
>      >
>      >   static int wuxga_nt_panel_on(struct wuxga_nt_panel *wuxga_nt)
>      >   {
>      > -     return mipi_dsi_turn_on_peripheral(wuxga_nt->dsi);
>      > +     struct mipi_dsi_multi_context dsi_ctx = {
>      > +             .dsi = wuxga_nt->dsi
>      > +     };
>      > +
>      > +     mipi_dsi_turn_on_peripheral_multi(&dsi_ctx);
>      > +     return dsi_ctx.accum_err;
>      >   }
>      >
>      >   static int wuxga_nt_panel_disable(struct drm_panel *panel)
> 
>     Why didn't you also update wuxga_nt_panel_disable() ?
> 
>     Thanks,
>     Neil
> 

