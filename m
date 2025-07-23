Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53403B0EBF0
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 09:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 424F210E763;
	Wed, 23 Jul 2025 07:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IaH6d5wz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6F910E763
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 07:31:57 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3a6cdc27438so4921242f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 00:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753255916; x=1753860716; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=tsMQjx0LxGiew+0kejpLbcOVNd/QskKUIRO4t/3V5tc=;
 b=IaH6d5wzXtGLvnuTtfCPVXRpIBg8tv6G0XYPlxK9yESUqLKEN0pZOP+bylmDQWXJms
 7QLXeN7teZ0d/JG44QqRxANdj1Bhafr8dXRaTneXG2DLmCgBJUvqdpRVaibDNTE1vcPW
 UaTv1RwaCeD6W8mk/mdKnzYg9tExH31vGiHOvE9eyVzcwkis65T5kSEBstK5k4fEXghV
 Lx44vfyJ25VzBAm0KQNhBze9ZKGZ5yIm1Qg6/C5iXIoJcUIbbGjfPkv09MEPMLEJuSYV
 IepmvYutfu4Nonew9PG1ETkcTVnf3OqWIC9CTE7pZnd8neA+73PlWz30pDdmJn7WrI8O
 LAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753255916; x=1753860716;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=tsMQjx0LxGiew+0kejpLbcOVNd/QskKUIRO4t/3V5tc=;
 b=XSZMQmzmWAeCWKbvcPQPYQdf/f/FTDGUVKpRSx04DT639tUc0veLuA5zrQox2dT5Tn
 9jl3CBh2GzY2diWq8QvGlUti0cyBiQGxrbR2TL1o+fZKE53h/eS8WUNhbzQKbbgtjwJO
 ab2vaX7DFCzLsv4R5DKAeF2NE2khVXTc1qAGD9xm5hh16gpA65/06f15qbvmF0oyn7gn
 Zpm1jtq7P2H197wSOz5iIn0JulIFEf+D2FAZIdqo2XaWtCKn82hYTp8/nbqNtOyX2DNR
 DmsF0r+eoFVBqH/NweEqAehJFnZTxfBwerNu332mfvaIL2KQDt3OZZIDvKWcoOm82UJ1
 XYYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsp9A+NmMKkr+PR9N8A1okGHEAzs7rWJUi8im4J3pLwqriXtqbK1m8HGFiU2MQ5jUV17FwusxGwok=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLbnJehJjPUaCRGdSoALF9zHeSvoGvAwaojP085LUcwCyVWCfZ
 1GNfrbC5FmGItztzQ2wEdVlfWDUEIbb1E/jAqiyxbBCwF2nX59Q/ErIGFqOjpQpX+jY=
X-Gm-Gg: ASbGncuNYmM5prqszxQwQ+QDuCTcn+cTy84pC8oy0XRAMciEOH287YHqttQa9lcBL3Z
 +amrVjjv2WN9sR+PVjZ+XsjM7fFuBjJ0OlF+b2R77i3WfZl9leEXBzYpAS8TSRYOBBRgVP978En
 qVZfFXyw5y15/bj6mY7QtnZcb4yp1G5RgVTpzqoHz9aNxepHafcp98uetscx3LGNFQmEuhRBfWq
 9U4R2L1dSC21My0J/x6YZNvNJJecsX5TdizEHVWk4ozS6xSQfZuxQ8F1Ikpq3tlKqEUaFUDOJzU
 5xQDIfHQsS9r8hYMtDkZc5Jk58bKky5KRtAauK2S3XIjGzbSudR7Zsuuf5o7Lt+sE17P/ISPRWq
 SkwF+csvq+kzcQOv6xXtUkbQbtCF0JC7ZXTpj+GoRz5DJJqO+005PPBIXV9Op2Pwym8BY8C8fqv
 Y=
X-Google-Smtp-Source: AGHT+IEnTNf5B70Qm5PHVrXvXMMmuSQu9ZW3WQXoalvSypYkFRNdLXjfNz5NQe9X9fAdbT+v/+bFzQ==
X-Received: by 2002:a05:6000:26c6:b0:3b6:2f9:42b1 with SMTP id
 ffacd0b85a97d-3b768eedb05mr1434526f8f.13.1753255915643; 
 Wed, 23 Jul 2025 00:31:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:8813:2f0d:f9e0:5294?
 ([2a01:e0a:3d9:2080:8813:2f0d:f9e0:5294])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca2bb96sm15602630f8f.30.2025.07.23.00.31.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 00:31:55 -0700 (PDT)
Message-ID: <c36f3ae4-8bd1-45fe-ae98-253b45b158a9@linaro.org>
Date: Wed, 23 Jul 2025 09:31:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 0/3] Add support for OLED panel used on Snapdragon
 Lenovo T14s Gen6
To: Johan Hovold <johan@kernel.org>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
 Christopher Obbard <christopher.obbard@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
 <aCw9pYehCdfXXeiR@hovoldconsulting.com>
 <aG-QyF12rGY55gcG@hovoldconsulting.com>
 <d431435b-4ac0-44aa-922d-0bde126ca563@linaro.org>
 <DBIMQO2CS0I3.17XLZPKPCVW2S@linaro.com>
 <e9c63414-8434-4e35-a159-66df1864f9f3@linaro.org>
 <aICO0CXxp4Vu331u@hovoldconsulting.com>
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
In-Reply-To: <aICO0CXxp4Vu331u@hovoldconsulting.com>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/07/2025 09:27, Johan Hovold wrote:
> On Wed, Jul 23, 2025 at 08:51:22AM +0200, Neil Armstrong wrote:
>> On 22/07/2025 15:48, Rui Miguel Silva wrote:
>>> On Tue Jul 22, 2025 at 2:01 PM WEST, Neil Armstrong wrote:
>>>> On 10/07/2025 12:07, Johan Hovold wrote:
> 
>>>>> Neil, do you have the OLED version now?
>>>>
>>>> I'm not sure, how do I determine that ? Is there something specific in the type number ?
>>>
>>> Yes, yours is the OLED version, the exact models stated above.
>>
>> Ack thx, I'll test and re-spin this patchset then.
> 
> Thanks. Note that this depends on this series as well which also needs a
> minor update:
> 
> 	https://lore.kernel.org/all/20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org/
> 
> Can you respin that one as well?

Sure

> 
> Johan

