Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E709D861D
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 14:16:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E9B10E650;
	Mon, 25 Nov 2024 13:16:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KqgtU9BQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB5E10E650
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 13:16:11 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4349e4e252dso10211235e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 05:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732540570; x=1733145370; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=rNSe8A4X72eX+krq9irFan2BInCT8GLtodoqFddP0BY=;
 b=KqgtU9BQwhDxh9374rfnHD950wqLz9NzU7Chu5mmJ+vI9NvnTt0xPLd3fbtbj1o+vg
 ycDPI9jD56HUV1mTvmzvfQMXzCWsu7mxR3WQQTwxdixQcJIP+nQ07aVO3+oT3ppAEnc4
 vpfvUJEygT4SLIP8QbvmhSAiquC1jaPLA2RWBU2SIVFnCJN13+stTPuxPrrfMyQDLftP
 V0ELud+tAwgtZopE2qy0wo9d4ENoB31vwHZpi+NZGMOOMxVVS1mSILKu2oWZkze2tBWJ
 R0IZ4oHmZTYeNgTzPJxb+w5HQp9l/xEpPnh18XgiTl1gm6OjoeNfGWPjb3t+fcE0lW/U
 NmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732540570; x=1733145370;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=rNSe8A4X72eX+krq9irFan2BInCT8GLtodoqFddP0BY=;
 b=ekG9YBao2L9f44tM5tL5FagoteWFDBz9p5XS+Q7F+4DWj/GuvXTczZq7CyxIGVdUnv
 NdwC2mIFtx9utNp/y+uArHaBsH+bcK5YCa8lvej3dQRBpTXAldK4KprvQtmVdKtJRQxs
 +bMeJwdc/Hs1lDApXwOsDsNeExqJ5SpTq6pQUQZCupsd8laH0Tp1nuLpAgN4pB3ZeKhC
 vS+PhlZl6uU/sSljfA0t/RJusqo/wsJj5XpldM3iufYXm0GMQyz1KXlSdOSWgj2eQJFw
 kz7NkTcZRi26Wk9vS9b7OCQQzcA1NDrG+e3yIyK491e34dcuLufmix8c2UPSxcRUS0Dv
 yTUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmTtMgVhlyqwQ7ImgATddjwrsWg808o3jswK9OLqBsklUvcMYmanaOpSe/vddq5kXjFCWvWoq2urc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yznk/fPMHAglKqDVwqJZlPy9f7dJZTRosn03XKcyLolDIYKVv5u
 Gb04hH21CkUq6+JvEGJ+i4E4HuY4vV0CBnky/+c2yJLe3IGnxk1Rpq/fh6IKaOI=
X-Gm-Gg: ASbGncsO3nk9uivWxdnN7xcCgFaMADNAHNdSXaIyiLbTe2wBUqxZBYwKWiApkfIhSnG
 gh9gD5Yk+E1Ex72+3f/00+/hXw6FbGx1StcatZnQs9uR3NB5lbLefNX8hvpX//eUO9kp0gntt84
 ntNKNMDC37kBEW0NVEmTGisVXop/8O3z3A4NnDab8iR05fE0vIS2LGqyQi6z90aad3hAOjpnI0p
 VAK8QRIii0ldB5+8huDFQxuIR2Ryg1FUkUbZ6a0jvBVYZx4yf2yxKYo5g7eKhSm6KnlpN4cAjIT
 mxkxpGYfNTgWGAcGNhkNNrcfyhg=
X-Google-Smtp-Source: AGHT+IEW90vTWXzKP0+A5/PY4aSbYc0IFzHeJgOYo0pEkGOlAkr3IdZEHYei+L9Azyi/uj4duLGLyA==
X-Received: by 2002:a05:6000:2102:b0:382:3419:46e6 with SMTP id
 ffacd0b85a97d-38260be1efcmr8739174f8f.52.1732540569999; 
 Mon, 25 Nov 2024 05:16:09 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:9dc0:6c46:415c:5f8b?
 ([2a01:e0a:982:cbb0:9dc0:6c46:415c:5f8b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fad60c3sm10632716f8f.2.2024.11.25.05.16.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 05:16:09 -0800 (PST)
Message-ID: <81e46854-13e1-426f-8e0c-549a36ab5b3d@linaro.org>
Date: Mon, 25 Nov 2024 14:16:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/5] gpu: drm: adp: Add Apple Display Pipe driver
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Janne Grunau <j@jannau.net>
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-2-3191d8e6e49a@gmail.com>
 <10d0aa88-de2e-4856-a137-301519e58b2d@linaro.org>
 <CAMT+MTRWZWj=3AP7wyooXr49-W4vcm0ZbAoqPyEuNkQBMOaJfw@mail.gmail.com>
 <c6b0273f-16f3-4469-a4b8-9564f7355400@linaro.org>
 <CAMT+MTS3Nmy=RzsE4wUf=jHBsu8ghyyqpXWPyB8qoR+W3EUscw@mail.gmail.com>
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
In-Reply-To: <CAMT+MTS3Nmy=RzsE4wUf=jHBsu8ghyyqpXWPyB8qoR+W3EUscw@mail.gmail.com>
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

On 25/11/2024 14:14, Sasha Finkelstein wrote:
> On Mon, 25 Nov 2024 at 13:57, <neil.armstrong@linaro.org> wrote:
>>
>> On 25/11/2024 12:24, Sasha Finkelstein wrote:
>>> On Mon, 25 Nov 2024 at 09:50, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>>>
>>>> So this controller only supports a single mode ???????
>>>>
>>> Most likely. On all devices it is connected to a single built-in display.
>>>
>>> Ack on all other changes, will be fixed for v2.
>>
>> OK, so instead make the panel driver return this single mode
>> and from the display driver just filter out anything that's
>> not ADP_SCREEN_VSIZE & ADP_SCREEN_HSIZE.
> 
> Not sure i follow, you want the mode hardcoded in the panel driver
> and the controller driver to fetch and return that?

Yes, like a classic panel driver.

Neil
