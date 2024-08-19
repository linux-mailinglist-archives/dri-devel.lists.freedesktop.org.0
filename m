Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B187957084
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 18:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E591A10E0C3;
	Mon, 19 Aug 2024 16:38:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nMcWhzIR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC63710E0C3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 16:38:12 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4281ca54fd3so36325275e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 09:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724085491; x=1724690291; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=aupRQCxcZMoqMsFi03uVwOSnlXLz7pPIGDry2b1gMKQ=;
 b=nMcWhzIRbcq34W6g9WaI9goDppRgAVmEPJSEQd8GjeczncekDIvLXoOEAOwB2ckm/v
 BQbU1wWojkFkhNbxfE1RHyyGHvfB/V0EAIA+w+t5CO1G7vCNS+WGnBh4fCgHa5F4p/Kc
 cI5K8Tsbb+CN5TfcMNZxkPv3WilvBuLoNXq6uAJ98G2BIEiiO/kK8m9JLfB1xCITgKb3
 ft8hV6GQn/PZC9nn3v7qgbdM+Yv7q/g8+fWrpwd1wto2sFGeCOm5htX+DjIltev07N/9
 yfT+Mot6H6UYsNFLfuSxFTAIKHx3LBdv33P7mq9GN8qE47HP/NHOroz6urTKoOBY/y1L
 RUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724085491; x=1724690291;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=aupRQCxcZMoqMsFi03uVwOSnlXLz7pPIGDry2b1gMKQ=;
 b=Wc887gDS8sLTM9p2GHjRB4qa4wdtrRnXuc9MP5FDPuEepbZUpcOxGHc7voSOIXDur3
 0uPNbSEsNWP1JtgJaZKHPq38XeEMLIbGzIAokm7yq6FRXk9dehvbA6XBNMBVVCaN0JSf
 WR01LgAo8QlR8EJ0jBkPInbHORHNQqs+4zScMyva75FKH6r4qYUswH43RUrYiT4dXxL5
 vjavzZao59124NJspF+09z/FQVz6rf5apF6Via0y2w9WDd8VvUCDIkcatCDeOJDR7N3o
 b/FN/4Ha2yuZex3h9//I9atp9YL3LNye/wZL978FP/W5ikkqoDL/LfPwR2UK7cXGiHEQ
 N5Zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLKAdOlUxyR2Ghl2F1tXzXCC+68MVbtCcYPVKTzOP8MA6ESbXfGdd+IhKR+hxZpsb+D8cdS9fH5vEAoPCGh86ZEwT+LvZAi2t6Lbne+sPB
X-Gm-Message-State: AOJu0YwdPIbQExUOjY1/Zj/4/0nlDY0xiJHqMNzTFHi6rArwiMT7bV15
 U7RJJBwcCjf6k4RSLGPlH+zF97netU9upcfUfs1YCvYM9HKRdl4t41W4xPSoYys=
X-Google-Smtp-Source: AGHT+IEOi2c8Np43tIFaYFeLdEU1i/a/0IyaAUgdSgqN9G16XNKD+O79mVMUDPMQcvXI9JJg4uhoPA==
X-Received: by 2002:a05:600c:1547:b0:426:62c5:4742 with SMTP id
 5b1f17b1804b1-429ed785661mr71311075e9.7.1724085490334; 
 Mon, 19 Aug 2024 09:38:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f54e:4b0a:5175:5727?
 ([2a01:e0a:982:cbb0:f54e:4b0a:5175:5727])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ded36a95sm166423825e9.28.2024.08.19.09.38.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 09:38:09 -0700 (PDT)
Message-ID: <f868cbd6-11f2-4fb1-beae-639aaa1bb0d1@linaro.org>
Date: Mon, 19 Aug 2024 18:38:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/panel: mantix-mlaf057we51: transition to mipi_dsi
 wrapped functions
To: Doug Anderson <dianders@chromium.org>
Cc: Tejas Vipin <tejasvipin76@gmail.com>, agx@sigxcpu.org, kernel@puri.sm,
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240818072356.870465-1-tejasvipin76@gmail.com>
 <4be2f1d1-534c-4c99-a35e-f354c75c88b4@linaro.org>
 <CAD=FV=UaYCW3hDp-eV9Wio-3iB2-PViy5Jj9VZxPEK2j+PPLkA@mail.gmail.com>
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
In-Reply-To: <CAD=FV=UaYCW3hDp-eV9Wio-3iB2-PViy5Jj9VZxPEK2j+PPLkA@mail.gmail.com>
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

On 19/08/2024 18:14, Doug Anderson wrote:
> Hi,
> 
> On Mon, Aug 19, 2024 at 8:36 AM <neil.armstrong@linaro.org> wrote:
>>
>> Hi,
>>
>> On 18/08/2024 09:23, Tejas Vipin wrote:
>>> Changes the mantix-mlaf057we51 panel to use multi style functions for
>>> improved error handling.
>>>
>>> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
>>> ---
>>>    .../gpu/drm/panel/panel-mantix-mlaf057we51.c  | 79 +++++++------------
>>>    1 file changed, 27 insertions(+), 52 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
>>> index ea4a6bf6d35b..4db852ffb0f6 100644
>>> --- a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
>>> +++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
>>> @@ -23,7 +23,7 @@
>>>
>>>    /* Manufacturer specific Commands send via DSI */
>>>    #define MANTIX_CMD_OTP_STOP_RELOAD_MIPI 0x41
>>> -#define MANTIX_CMD_INT_CANCEL           0x4C
>>> +#define MANTIX_CMD_INT_CANCEL           0x4c
>>
>> Please move cleanups to separate patches
> 
> LOL, in a previous patch series I had the upper-to-lowercase in a
> separate patch and someone yelled at me to do the opposite and squash
> it together [1]. It doesn't really matter too much to me, but given
> the previous feedback I've just been suggesting that Tejas squash it
> together with his conversions. I'm OK either way, though.

Yeah it heavily depends on the rename, but I guess here it's fine to be applied as-is!

Neil

> 
> [1] https://lore.kernel.org/r/CAA8EJpo4WzMPNjpnkHt-_GJe2TAF_i_G+eTaJrGipMEzppc3rQ@mail.gmail.com
> 
> -Doug

