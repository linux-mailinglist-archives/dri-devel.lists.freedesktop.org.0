Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5959A5015B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 15:06:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6218310E2A1;
	Wed,  5 Mar 2025 14:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YUI0Djyd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64AF10E2A1
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 14:06:24 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-43bcf9612f4so11821385e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Mar 2025 06:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741183583; x=1741788383; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=11RIqpJbRMk0CP7kEnER3o/kKEhmLuNrxSq821K075U=;
 b=YUI0Djyd979DNTvyt9ICfDj1ARcKzmbf7uEiNm9onjJ8p/H+H1C3oQwfBbVD2RwnTE
 VYv0UeHW6+slMFrOzh7GsqKwCJZnkjvZSxn8mr1lD6scArLNudfXpmb5m1pUb7/YjgZA
 fTg9J1m9kQFh80ZNz6tXk+2UZjhkNCK21wEUzx+KyBndv1lq0NbkL/xV94uUmMlfLPDx
 shc9QIVIagnbkqERtJt7wrVx9k1kVaRLpP3vOgUIfmH3ezr3K3+c1dsgiROB2hHoB7mb
 mO3SXWkT9DN4nZuL9QXcVb9mbuKyV8SopZ+e1deVk/QLV5WZGKaOZSzU0v5r+FCsnKPj
 DEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741183583; x=1741788383;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=11RIqpJbRMk0CP7kEnER3o/kKEhmLuNrxSq821K075U=;
 b=XD3L1cvBXtw9PpouByg4dN/oItixLWJtD2aP/W+EXNPwnD/6ee6cFQIByCQUpEg3o3
 oRzSFB92r2vxOamsE/krJCS5zdgmU0a8jYhcyCJukZVj1qnrvzXQjfPWHjrB3CAlo5G+
 xBL1FJhixnoUjAlrIbdO89YG78ra5nozFKAOmyVVhlAhAOah5j3irowGvUPRLWkvehSQ
 mBEirfq4zPE+JkPwKFI/QuKtHKLB270szCE+H8IiNGbWPIUu9+WXokIYFIyTaYbiJZ8z
 49rc1BrqpnNTwF8vvLS7O9tySkBfHvTdf80MeJxsYiULTKswhFWjDhQUfeKE0NYgKqw0
 dn6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwJROntx8lZNGNux7/Cr7FnSm2OikDEKIB1+WO0pZN+/mSMkcfs/j3iwIIkiwYS6kiU8jjNwErHZY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhyDpXscikr5zusaJ9xpiJVOgn/ZjVIH8kxyrmW18ehrvZIEIE
 xdqFcE0yJ57ahiWIOutfqQ8aXl38+Ty7ou5eXQgeR4An9zIzqZ0R9+2aFxOeA48=
X-Gm-Gg: ASbGncu4SzYNsEo8eX7qIFVqU8oK7R8/XZyTbLAKBYgYM1HOfwNiYDiv1qJg/Q2o2iv
 p3Ss5rCNP109BL/ushVCF+mf3oCb29tQaMYAn/53n9MhiueUpqt57XtTo8hlYRTfc1p4Ngxru1e
 OWmcf1TB9Bdg1Yz75IrQUyT6YiI7otHLOr2h9Dp6yCxOrNETG98krwB48y6gnijbsTRSmpY6x7/
 A8QML7125fu5ccQfsgZdvCUozMDO76O6jXM4GBpGrFhNo8gCs59SyRZg9JegT3pEAdGmC95I+Mu
 TZ8aWwrOTeAXR52iWwfrbT6WqqsmgJup4GSXVeYMOMT0o6v+MLcvUGiQvmia3gau4Ir7U8JNexX
 oR23vc4kIgaYDPlTSfP2kHw==
X-Google-Smtp-Source: AGHT+IGw9gdZ+AWcZBF3A5Ecs3XaYdWNI4WSu4gKkjkQYxmSQUUfbmDB8IcIt65GvIVbdvbiREsQiQ==
X-Received: by 2002:a5d:64a6:0:b0:391:c3a:b8ae with SMTP id
 ffacd0b85a97d-3911f74dac3mr3468091f8f.23.1741183582872; 
 Wed, 05 Mar 2025 06:06:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:d001:4ab2:d11a:658b?
 ([2a01:e0a:982:cbb0:d001:4ab2:d11a:658b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39121d7d866sm2079199f8f.39.2025.03.05.06.06.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 06:06:22 -0800 (PST)
Message-ID: <18f9658f-f2ca-4fd9-809c-ec4d198072be@linaro.org>
Date: Wed, 5 Mar 2025 15:06:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v8 0/5] Driver for pre-DCP apple display controller.
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Hector Martin
 <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev,
 Janne Grunau <j@jannau.net>, Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alyssa Ross <hi@alyssa.is>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Neal Gompa <neal@gompa.dev>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Nick Chan <towinchenmi@gmail.com>
References: <20250224-adpdrm-v8-0-cccf96710f0f@gmail.com>
 <174118223158.156873.6982508045942987984.b4-ty@rosenzweig.io>
 <Z8hZKW_F-HtzYm-w@blossom>
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
In-Reply-To: <Z8hZKW_F-HtzYm-w@blossom>
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

On 05/03/2025 15:01, Alyssa Rosenzweig wrote:
> Er... I only applied 1, 2, and 5. Patch 3 was already merged, and patch
> 4 is going in via arm soc. I am, new to b4, sorry!

Yeah it's because you applied the whole patchset, and discarded/skipped
patch 3 & 4 afterwards, so b4 gets confused.

Next time specify which patch you want to apply with -P 1,2,5
and b4 with know which patch you applied and generate a good ty patch.

Neil

> 
> Le Wed, Mar 05, 2025 at 08:43:51AM -0500, Alyssa Rosenzweig a écrit :
>>
>> On Mon, 24 Feb 2025 12:02:15 +0100, Sasha Finkelstein wrote:
>>> This patch series adds support for a secondary display controller
>>> present on Apple M1/M2 chips and used to drive the display of the
>>> "touchbar" touch panel present on those.
>>>
>>>
>>
>> Applied, thanks!
>>
>> [1/5] dt-bindings: display: Add Apple pre-DCP display controller
>>        commit: 7a108b930a84e71be71c3370eef6dd96fbb8f618
>> [2/5] drm: adp: Add Apple Display Pipe driver
>>        commit: 332122eba628d537a1b7b96b976079753fd03039
>> [3/5] drm: panel: Add a panel driver for the Summit display
>>        (no commit info)
>> [4/5] arm64: dts: apple: Add touchbar screen nodes
>>        (no commit info)
>> [5/5] MAINTAINERS: Add entries for touchbar display driver
>>        commit: 4d2a877cc0efefa815648f1ed5f5b2b796f55bab
>>
>> Best regards,
>> -- 
>> Alyssa Rosenzweig <alyssa@rosenzweig.io>
>>
>>

