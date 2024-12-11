Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAAB9ED2E2
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 17:57:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE6E10E3FC;
	Wed, 11 Dec 2024 16:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DcGQy7so";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A8710E3FC
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 16:57:29 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-435f8f29f8aso13384815e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 08:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733936247; x=1734541047; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=0m9l5oOp01vcv+9ToOizO+wEqix55Pyi80seUL6dtBo=;
 b=DcGQy7soTCWP7uUcrPxmVbJqPZ24yCTY/yni0VDMeEUEz7Pw8ZHH99AgcwimGX0hZy
 u1Funn0uWARzPMCCWeR0slinlNsaSuZQmD9YNyXKUW2qRBjV7WChgAIyuUhsx7MUXuTS
 N/kA74xyHE/4LtbeLfKrn//3M/emr5kpQwMa9GXKqzQhEXhjzjsuXX17ysVs7PgKiqm5
 LmKC/hNpAaaUMlSe62Y2AYPsrd6Cd9b7DptaQEroHGae4l92jRd/HjQYB8T/NUPbl9SV
 0ofYEMDWjGnIc3ME4bspUHYSA8KD2dvsjY4jYIm6QLYyeu7iDZy2TNBVaeJJ1vfcJOdF
 s2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733936247; x=1734541047;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0m9l5oOp01vcv+9ToOizO+wEqix55Pyi80seUL6dtBo=;
 b=AoyClsXfvDq5phlbP/pOYXoZiBHW7rztMLA3G+VeGOqKCEE2wRdL0l/cR0t6VSj/pG
 2vI8OJQla3S4mY9BAdilHZr+B8RZJhBSZqa0CcKDgsKq/Vq7wyGdDTyoOodlKenwTEc7
 mfxqeux8GRSv4afTpcWBW4yPE+YTWrn2NBMMWFGw7VaQqkXlfHknBLOQCArYNOmwgsZc
 rcn2V7GvF4hD9+KT6uicFm6M3bU7SyWv9rd+dhCVCFCJSIqtFGryaVvBh2gI6xHLB4/w
 VQP/0GocnabOpf9xVeWrbPAMXXR60C5VVl2ySKxUDBGP/CCciVFjR+9+kIcc9ReunlCT
 xS+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCURnHkYyIVU5687wSKIbYMtNkCv2LJYU5zKyFGGJTmxSNRH4MSdvFaiym7oOzEQIVU2AqB6PThSMis=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZ+ZUQaAke3C25JGWDfPpNpe3RmXbA7m7gbPD/+Ch6el8sVB9D
 9JbZh4bW15FlTmpIen1g4syTRDAXucfpdlopOiEwUEmTlb1UAJDAAQ5+CTysvWI=
X-Gm-Gg: ASbGncugaFjgUauqswbzlHpqqkRLuopoQeqDI4lzdYMTNZSDGNXcHq+ZYs+gDC8EmY0
 bDctwGXbd9KNi0iFJ38vt9MhqwIOBRr21U8Tme28YSxmXSWWH9KqXr5YXSdVQHmaCE+W6V1qZWa
 8XJv2b5wDXl0/Flu0/8ZyFuoqrygGQmUA/yws6Od2sSfg3KIe5QZoMvo93EKr/c1Y/24VpAFN+m
 OdxM2i//7i/U1RfkuLqk+bqaS/KHqdNs/6TZKGM16HuL2qcUDY36h2VBuXjguwejWXWh4KgGqQ8
 JdJDQd0M6GrWjbB4mqwNdjXwxMLdWpc=
X-Google-Smtp-Source: AGHT+IENx0NcRopIXx3SdVXYZNoSpCbTptpp3hxvIhVQS3f47TcSS/8i3UaxgjzRtqPiK5pkEZ+nig==
X-Received: by 2002:a05:600c:1d20:b0:431:55c1:f440 with SMTP id
 5b1f17b1804b1-4361c431298mr32914025e9.30.1733936247337; 
 Wed, 11 Dec 2024 08:57:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:d426:8f10:1673:5657?
 ([2a01:e0a:982:cbb0:d426:8f10:1673:5657])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4361ec87bc3sm14005935e9.1.2024.12.11.08.57.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 08:57:26 -0800 (PST)
Message-ID: <1b3d37ce-a362-4846-bb7f-7cbe4c28608b@linaro.org>
Date: Wed, 11 Dec 2024 17:57:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel-lvds: Add compatible
 for AUO G084SN05 V9
To: Fabio Estevam <festevam@gmail.com>, shawnguo@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
References: <20241210105705.116116-1-festevam@gmail.com>
 <yujvdu3s6v7z7th2lrdscqfxocx2zy2u4owakisvnjppz2udqv@5ok2rcf4exd4>
 <CAOMZO5B3810+4RJsPUtL3ASxqpDd+UmC=GcY6t8-ad7NZXZLjQ@mail.gmail.com>
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
In-Reply-To: <CAOMZO5B3810+4RJsPUtL3ASxqpDd+UmC=GcY6t8-ad7NZXZLjQ@mail.gmail.com>
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

Hi,

On 11/12/2024 17:29, Fabio Estevam wrote:
> Hi Neil,
> 
> On Wed, Dec 11, 2024 at 6:31 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On Tue, Dec 10, 2024 at 07:57:04AM -0300, Fabio Estevam wrote:
>>> From: Fabio Estevam <festevam@denx.de>
>>>
>>> The AUO G084SN05 V9 is an 8.4" 800x600 LVDS display.
>>>
>>> Add a compatible entry for this LVDS display model.
>>>
>>> Signed-off-by: Fabio Estevam <festevam@denx.de>
>>> ---
>>> Changes since v1:
>>> - Added devicetree@vger.kernel.org on Cc.
>>>
>>>   Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
>>>   1 file changed, 2 insertions(+)
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Would it be OK for you if Shawn applies both patches via his i.MX ARM tree?

I don't think it's a good idea, there's no build dependency so I'd
rather apply patch 1 via drm-misc

Neil
