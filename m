Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D440C8B1C21
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 09:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF7A10E28F;
	Thu, 25 Apr 2024 07:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="y3NTjX2X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CBB10E28F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 07:47:36 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-41b5e74f7d1so492805e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 00:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714031255; x=1714636055; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=wPJqdD/Tzg33ESGXWGEoqq776wvQs8gtsYLZyLqRGzk=;
 b=y3NTjX2XJEhNDyPjmzx3cUwAUnLFC64A52OCNMwsRQt59aKkuY/7Ots0hgl/z1ZtZD
 fl4dBr/kAQ7Jt6dzwy9Qu7isK2Y4c5uPTxIv+czm6iVoYTy1/HS+rZMkmpABz9zbWq7E
 gm/HV51e1OEzeKlZI3Ix5hu4JUpGisbih4d3kXBEn1Yg1XOBmCphH0oMScqgkfAJY336
 MzyXGWQY4ke9YfLj+PQLcLpd4UTbweDKcMtCsxpBusy0i4op8V6D+l6plr4lUd9Tx8U0
 fvCzE8xXZebYW8nXLzKtAIwOe2MWNunSKqvoTNIUSYK453jSmRC4pHgp1Jpu8JnybXE7
 lk0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714031255; x=1714636055;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=wPJqdD/Tzg33ESGXWGEoqq776wvQs8gtsYLZyLqRGzk=;
 b=p9MzOWUIx23uvGY+Eqx+c7JprWpvPo0CBISYWF2onfGIDTxTNc6jnVcfkURKEhZ5lg
 k+X0pvroDVPiBuPwR9sb/thI6/1ILhAv7G7O0kB0njF1p9eYiJjTEoGSpEv/tSx0MuzI
 j+zCSR5/UsXnYRHf1UV78dTGeLp2Fig/JnyFjPC2O0BjN/Dzc15cQoMtnt1jwXG9CnVc
 0OWUiHiJ1dC3UlsACoS78n+IGkPMlxRAh4mtysi+yeogKhBatAhVaIffk0Whqc8bxR7o
 K7VhERUX3g2IgbJNxyme78Fapuqoz98qpBTwIOlAZc1pkgTxfYSR3DI3R1wOcDtp+gZd
 c0tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/VcDC6Dsm31GLW5PEfeQPr1pu1EKWLodxA/msncAo/g3HWhGcx4NdaHk1/ikdZO0Sy6t/AyWBlLtjgSYno47wXegstAkhUzNUN6sjx24A
X-Gm-Message-State: AOJu0YzgwaNMOcpCUDDe4xWjtlTfatNgMdfTl50ZOPy5tQhI5sDlRs3p
 1M53NcAmq8V4p8TFkA6JBjQiOKHl87w0sAVtyzrJrs+qlKJazdJ06QutY0AUkTM=
X-Google-Smtp-Source: AGHT+IGttzD9sok4hMZTxcAKeLHuq311JK4wtR4ABqpIEMGOh2yM6/pg2BssKk4024XY4L3VCE4gqA==
X-Received: by 2002:a05:600c:3b8e:b0:41a:aa6:b68c with SMTP id
 n14-20020a05600c3b8e00b0041a0aa6b68cmr3882881wms.6.1714031254803; 
 Thu, 25 Apr 2024 00:47:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:15c7:bd9c:c500:ed62?
 ([2a01:e0a:982:cbb0:15c7:bd9c:c500:ed62])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a05600c4e4600b0041b43e301e8sm1384692wmq.42.2024.04.25.00.47.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 00:47:34 -0700 (PDT)
Message-ID: <16de57e6-39c1-4528-b9a7-8b8af2ec6880@linaro.org>
Date: Thu, 25 Apr 2024 09:47:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] drm/bridge: chipone-icn6211: drop driver owner
 assignment
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240330202741.83867-1-krzysztof.kozlowski@linaro.org>
 <ul5vzz54kppxo6zkr7k6seejmmlgp3d4dqfzjlj5la3e5ltolo@ug5dtoknkibu>
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
In-Reply-To: <ul5vzz54kppxo6zkr7k6seejmmlgp3d4dqfzjlj5la3e5ltolo@ug5dtoknkibu>
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

Hi Dmitry,

On 24/04/2024 11:12, Dmitry Baryshkov wrote:
> On Sat, Mar 30, 2024 at 09:27:40PM +0100, Krzysztof Kozlowski wrote:
>> Core in mipi_dsi_driver_register() already sets the .owner, so driver
>> does not need to.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>   drivers/gpu/drm/bridge/chipone-icn6211.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> 

I tried to apply them but you already applied them... could you make sure to notify the list when applying ?

Thanks,
Neil
