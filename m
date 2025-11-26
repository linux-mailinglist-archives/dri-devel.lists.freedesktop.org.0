Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 876F2C889B3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 09:19:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2CD010E525;
	Wed, 26 Nov 2025 08:18:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RJx7Ount";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87CC10E525
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 08:18:57 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-477b91680f8so50251415e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 00:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764145136; x=1764749936; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=3/sh9hfHUl1Es5gQqKqLYMYmlFm7mD+qXXYV9A8fhF0=;
 b=RJx7OuntmFIC3ndA6e6H+UpK2FS+N9Cc/Dq8d1y5LpkhxgBsYe06q3kzD2RhGK4SQn
 30oUeJUyn8m9bgQRgZUFORAvIbjJulwt/IZpU3uWu+ao4LkMTgt+E/7N2rrB5dY+P5U1
 u49Nf8nZilKdbCzMEF6hVv+fIILKWIVVpGwp3BZUZaqIOhK0OrupipIiZQxw8YYupa64
 KskJCFzeJZCaCFQcp27b4qriJ/KwwpsY4EMtCR0r3w/rUiLvQEFHRZh87E7o3AczOvOk
 wFCrJl4MwNb2JUcoJp6pPcjJcaKt9P7X2mRTgTRbLtS06FBwLXZAHf+//6xm+r7QT8du
 oPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764145136; x=1764749936;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3/sh9hfHUl1Es5gQqKqLYMYmlFm7mD+qXXYV9A8fhF0=;
 b=RaeJ9oVd8Pe6Qba7haMUgljUgrOyxPJ5PP8dQO4MrABszVp7/Cj5N+4Ajwlnm2yMtP
 fB6vdx/15qigBi6HjbJbWYpB5eVxd/bRdGMIKYy542/qi+Iy9qG7/CqKmuMfQZvnUmix
 MQhdLwtrjJ7lsMZ6TXBSBSlwX3u7N8mmZFd0XqBNc+i3Ta0rZ8hUAAhRUy0/E00gEgy3
 i3h1RszdvdVpXCc//vcD0hGIfOrc7gcCn2Fm4sJY/8t11OAfjIsIRNRq5v9Z1oZSYPx9
 jx3AbKrzIAMrWCuRH3iemKO1Do7BoPXw8yJ4FnujNCMjODiNVq4rM3Ok+kwgymqWYUj5
 WK1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYojiW0Vcy6B9FSpsqQDXDnvA0Uw8318BLzPpq7yc94BgtMtjCv2j+9n7hovvyWo+6pIS6jUmOXUc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZbekNhoxhS36NLPdm0YCBFQ2UeLCCN5pAUXRzVJbMcSsxsCb6
 dOgz3DJhMGD4aXuEbyjZA+v+0N0aABAS3o0gRDUeTR2/PMa5enkcchycNXBCHPutzZM=
X-Gm-Gg: ASbGncurQUbQQr/astBBRtjFHHnJQlcOSdYQtkZl4x3EBQzoG9nJ1bL2fWeQ5MSVszb
 ZeIC/NzvTzuswzN5yUSpMt7w3HC4Ma/C9PuoQu85BYWm96anEA9MKqBnHjZ0EDoZZI3m0+D9gEE
 N75LnWneBXTqHRKwAGlT2AUdoO5aeTS7RprVd7OxArgGtnP0i2Wj5YMfciZ8meFOWP3bWwzWUvj
 EZwrrmnP9MdTnfF7JDw2tcuSg7z7m6Nplt6LSHQXjcLCe4vdiK0dLeu2zD3M2PAi2N3nvou9/Zj
 0QQNc5OKh7kp2BtUi/uss7S4A19hjro11AW1vFAzfTuJ9lkFdSl10d7qgAurqBhhNXWNtHYM7Tv
 l0N0CbDDSyN/vhuHAahWV+IIpvY7th1WlQY1GGo17s7ydc/pbUh4S8Y58c0iK+39rstniEKEb4f
 /TxnL5E4QEUulSV3RBmimwQp+UubyMojFA7epo1N+/4C3PQXf5mRYue6KWoFth
X-Google-Smtp-Source: AGHT+IEbmiiAOqqQgkV8vV4rPnRbUXsu9iSAZuXeYSomG92JLEZJtI+1XjF6BMkPvH5pGRIrKPnfBw==
X-Received: by 2002:a05:600c:a01:b0:477:7b72:bf9a with SMTP id
 5b1f17b1804b1-477c112f5c2mr177030035e9.28.1764145136159; 
 Wed, 26 Nov 2025 00:18:56 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:91ba:3a5e:334:4534?
 ([2a01:e0a:3d9:2080:91ba:3a5e:334:4534])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790add608bsm29959795e9.5.2025.11.26.00.18.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 00:18:55 -0800 (PST)
Message-ID: <2fdd5660-e25e-4c29-95da-1e342feb424d@linaro.org>
Date: Wed, 26 Nov 2025 09:18:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/2] drm/panel: panel-simple: Add Sharp LQ070Y3LG05
To: Daniel Schultz <d.schultz@phytec.de>, Maxime Ripard <mripard@kernel.org>
Cc: jessica.zhang@oss.qualcomm.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, thierry.reding@gmail.com,
 sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 upstream@lists.phytec.de
References: <20251124123938.936521-1-d.schultz@phytec.de>
 <ehhdijawntxsaguhygczk5vrb2quqg3ep5eer25auh7rrq5f3x@pvcaxa7n5ybm>
 <4989e0fa-7251-4f2b-b1b1-0bd534a585b1@phytec.de>
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
In-Reply-To: <4989e0fa-7251-4f2b-b1b1-0bd534a585b1@phytec.de>
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

On 11/24/25 14:53, Daniel Schultz wrote:
> On 11/24/25 13:51, Maxime Ripard wrote:
>> On Mon, Nov 24, 2025 at 04:39:37AM -0800, Daniel Schultz wrote:
>>> Add the Sharp LQ070Y3LG05 7" WVGA lanscape LVDS RGB TFT-LCD panel.
>>>
>>> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
>>> ---
>>>   drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
>>>   1 file changed, 28 insertions(+)
>> Any reason to use panel-simple over panel-lvds?
> 
> I didn't know panel-lvds exist. I just convert these timings to panel-lvds and works fine, too. Thanks!
> 
> I don't plan to send my device-tree with the new timings included in the near future. Should or can I already add this panel as compatible to panel-simple.yaml?

Any reason why it won't fit in Documentation/devicetree/bindings/display/panel/panel-lvds.yaml ?

Neil

> 
> - Daniel
> 
>>
>> Maxime

