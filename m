Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38715B592BE
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 11:52:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A44A10E763;
	Tue, 16 Sep 2025 09:52:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dLJCgKwm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8074410E6F8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 09:52:50 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-45cb5e5e71eso32489495e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 02:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758016369; x=1758621169; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=qVcKrDPxSicv5bcVvghAcm8ufs/BxpJvXcyfbDYCDIk=;
 b=dLJCgKwmtrpn//twXk9F6znbM1RUBXUoRqKXkXU8yzjKfBR42KLkcpVImDpM0/aXcr
 G7kRwxHEZLmNVdLylDasiYIp1+Lf8RFdlI3sNSDQNYkiMSX4Ury71GLNOygEZZyfg/m5
 xOjv3q0wx46CCAGGKyf6YyzeUeecyRtoDaPSvtXKYxTnHI9cjzrFB9JR5DQuDOSkb5HO
 SknHSDHho7XxdgD85xUFMYA6fouLNoh7DEXMluWMfEpIlEYlyiyklXPOn5UZeQo1nI9o
 uDXqrJxMmX0VlOz6cFl+W1VmvUjaT2PdgehYPRRPkb10XjCMXpubb10Wdf6uZYFd1mdE
 lPiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758016369; x=1758621169;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qVcKrDPxSicv5bcVvghAcm8ufs/BxpJvXcyfbDYCDIk=;
 b=CjzsiC2z6o+yPNOy5XMOULRh9bqTIz4J0nPLXQo9JpPdUMEpehH4DjdLtx4JKnt+E0
 bv68hH/CNt+L6LZv/EvCXl5avsQQ+dYIEuOhxvgzXXsog521wHUP5cVumRkyI5K0/Wcl
 OIa1RkEOsYNDlgBr+6mVLauG3tT4lYL2gdcNiAbW5k890gsQwfvVF9rLL4ps+IPFhexn
 wY4f9ktRLuSQkcFYplNN0ge2V18GT4gQUKRZpfwoOlAUP3aFd+rJbinDgK2LgM2nKE/Q
 SGIR5M/pA1Zq+aausG8KasP7CwVK/WEqbxgrdEnBS2siS4MoA0qGG+XWcYw4AQzYBxwQ
 M5Jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC5WArl6omDH3uscy3HlFIv+TyRfqYVo3DiPAelPhPoGhdhU828I1GGjtBwCkXtDIGQmLklDZU5ZU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3H6VqOv2URWml8+JAdb+Lgpfij2mmQyf06IkV92/TjG7Ql6TZ
 5MRSWTivviest5JhtbPEygPTns2osuBCIuxaoc+SCqsQvrFPnX4es+e0l3kjEAwp1fk=
X-Gm-Gg: ASbGncty9qnw8HyvXDUuJtoLrKH9MxTsV6kSFgw/RnPW9TcjwaFtUEx4OskvAasNvNw
 JfMr9TSF0ZQlaEnaBHIaXZB3xbejwUa+jIJnairlVh2ZvB3RY5hosqg5BW3IbWhtZRGQe4TW02p
 fQ+juwuS8DGD/4LgapBDdMyJRJNSzZdxKj9dPGJ45jbuVv8xmJnq2OTX1frNHjRjPGCJhTaGnkh
 DroUhuZuKZFzlfOxSNjzVCmxbBG7c2xX6M20C4PST9UDGVFC0S0EGIfFLsMkfIQsuwGHkK1mLKT
 Yh/Vv77kIOCYv0OXTH3ozREhlT+suOr8292C13O0Dx+sLnKRmsOb3A15+KGLXXKUTwHGZ+m0Na6
 1RmHopS3bKD5W1R6/RuQ041ZuqBleBRo4wa1jimsJRTo5aH4ABDcs3djGNnJhIrk9Yzr2al8Jcw
 zd4Xpmti8f3g==
X-Google-Smtp-Source: AGHT+IHoGh7uOixtjP/Er8JY12tPRLMSq1z9p+zy1uk+XBUoXsGMeyDeXqq+QheTUXeal7boEvKehg==
X-Received: by 2002:a05:600c:3b25:b0:45d:d50e:20c3 with SMTP id
 5b1f17b1804b1-45f21200c82mr130407845e9.29.1758016368885; 
 Tue, 16 Sep 2025 02:52:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:bcbd:bbe2:a1be:30ec?
 ([2a01:e0a:3d9:2080:bcbd:bbe2:a1be:30ec])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e82f647b83sm14364300f8f.20.2025.09.16.02.52.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Sep 2025 02:52:48 -0700 (PDT)
Message-ID: <004e4b73-b695-4e37-b484-4fbc340701ea@linaro.org>
Date: Tue, 16 Sep 2025 11:52:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] dt-bindings: ili9881c: Allow port subnode
To: Marek Vasut <marek.vasut@mailbox.org>, dri-devel@lists.freedesktop.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250904200130.168263-1-marek.vasut+renesas@mailbox.org>
 <a0d85f06-a87b-40f6-a74a-27b148f309fd@linaro.org>
 <5b152739-6b1d-4742-8163-bb6e6b39822a@mailbox.org>
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
In-Reply-To: <5b152739-6b1d-4742-8163-bb6e6b39822a@mailbox.org>
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

On 16/09/2025 10:15, Marek Vasut wrote:
> On 9/5/25 9:51 AM, Neil Armstrong wrote:
>> On 04/09/2025 22:01, Marek Vasut wrote:
>>> The ILI9881C is a DSI panel, which can be tied to a DSI controller
>>> using OF graph port/endpoint. Allow the port subnode in the binding.
>>>
>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>> ---
>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>> Cc: David Airlie <airlied@gmail.com>
>>> Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Maxime Ripard <mripard@kernel.org>
>>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: Simona Vetter <simona@ffwll.ch>
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: devicetree@vger.kernel.org
>>> Cc: dri-devel@lists.freedesktop.org
>>> Cc: linux-renesas-soc@vger.kernel.org
>>> ---
>>>   .../devicetree/bindings/display/panel/ilitek,ili9881c.yaml       | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/panel/ ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/ panel/ilitek,ili9881c.yaml
>>> index 434cc6af9c954..cf0aa996e072d 100644
>>> --- a/Documentation/devicetree/bindings/display/panel/ ilitek,ili9881c.yaml
>>> +++ b/Documentation/devicetree/bindings/display/panel/ ilitek,ili9881c.yaml
>>> @@ -30,6 +30,7 @@ properties:
>>>       maxItems: 1
>>>     backlight: true
>>> +  port: true
>>>     power-supply: true
>>>     reset-gpios: true
>>>     rotation: true
>>
>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Would it be OK to pick this one up via drm-misc (and possibly also the other ili9881c RPi 5" Display 2 patches), or shall I wait a bit longer ?

yes it's ok to pick via drm-misc, bit it's too late for v6.18.

Neil
