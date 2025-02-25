Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A02A44933
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 18:59:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0916D10E1A7;
	Tue, 25 Feb 2025 17:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="E+lPlky9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E88410E1A7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 17:59:29 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso60205415e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 09:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740506368; x=1741111168; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=hjDMnEpfyvE0/n/R7fglBpQPZZ2H1kPvQ+lYLuofLIk=;
 b=E+lPlky9VPMMkhl7IJ16j8FTC0dUQWH18gfKC6dobG6hHuPuRIPy0hGlwlXaaZHL0N
 QCSz2DutAODZqegQKTJanuIWdHL1Up9mXOIvM3WboqVk+0+5K0q3Pwa2sn8h4TlCSPff
 yoso+Xks5qSR9tTirkGNJxbBp2xfQQrI2oqk4bdRHWCrT0gersh1YwMK2KYn3O3vXgXc
 r5dj+ThSeaPrxnB1bEXkkjuJ92maH5oVUqOawkIQpBi20N5fOCBllZQgMsyFFpnIYiRC
 uetjHeJSq1Mxq1CvbIRjeSHymVlTPLNu7Jrg8xG/gytCswMSjDKAci1UGjlCOTMDI10d
 qNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740506368; x=1741111168;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=hjDMnEpfyvE0/n/R7fglBpQPZZ2H1kPvQ+lYLuofLIk=;
 b=DP3FyCJ95aUadTIqexTlBV4hCrUwcgWROag1ND4MMFHdgWNmU4ponoYKEaxMw20MuQ
 eza8YZukDrpWtB8M65LkYOJCdYb8ERJPEtuvB599WGNwFNEqUukGcADzUyAr1j6ftnxw
 d9enWYZGRykbKtcHp0jDUzNj1YYdYjaqdD93TL9RdjHXsk4LSFH2dgFTjob2FBaqOh8p
 7DPgCBO4gAWUDPDBpY2sZcI2KJCIeB8w9NcVPHHsCE22xqNQfjf8SdC8z3RBM2ps4AOe
 2wiEbO/TCMimd11SLMRFHiZVfgplCsUGLDwGtwc42g170CnLrUku803CkHQF6buw6qEZ
 iJtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBwfCZ5LgLU6RudBi5gPL4MadhVrYsiu74ylLyEvEUYL/G0EHAjZJLY3D0agVuGwTBc7Ll60rKeVw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzh5OIl0R/zDsmiuXQyy+0WxtkN1ReFnU9Bq4R91BQS8zv2bNtq
 uWXow3ieNkB4h4F3PxBW59FoDAuAI/ZCbrUWDe7V8jnr0SGF6dQXZAOd1rK1ELg=
X-Gm-Gg: ASbGncsxnQTi1L3ia2UuND8rl9EDbc9sEs3gBVNDScss4nrL7ev25xlTrmS9eQSAZmw
 Y7yW5/3hW7u07Dylre1Ujq0h4ZuyrCDoDpn/6P6A4a3PwDVxfms+zP0fw0ZCGgcCesjil6Tz4kP
 tNuD+M0hBY/3xvJ365Gz09Z4TsKxnAXuImZb8+jOQlnATGeaLs8YN5hS39W1AEkz0Hrc7chDTBz
 tPFDXucNe/a2ZayRw7s61fk1Z2xbltku11HCfGAPTMOLUvtwuELHiYIN54fivkRARGYDZHoSeVt
 jqxYeFntELgGZSrbme12sPLGJCPPm1qK8OGPMTnCtopMFmNyO+zsdN9bEdPhX3hob3fyP0/ZVH5
 yTaM=
X-Google-Smtp-Source: AGHT+IHtZcIoQJsi5dScv1l8X9lcH5/APbnkiDicrQKXKhdO2SowhVhMLSTlVqGJk0pL3x+gu1om+g==
X-Received: by 2002:a05:600c:1f90:b0:439:8544:1903 with SMTP id
 5b1f17b1804b1-43ab0f64430mr41996155e9.20.1740506368036; 
 Tue, 25 Feb 2025 09:59:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:23a1:f1ec:7a08:3a2b?
 ([2a01:e0a:982:cbb0:23a1:f1ec:7a08:3a2b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab2c50dcfsm21371065e9.0.2025.02.25.09.59.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 09:59:27 -0800 (PST)
Message-ID: <2d51cb9e-b8c5-4cf1-bd7a-751fb633275c@linaro.org>
Date: Tue, 25 Feb 2025 18:59:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: (subset) [PATCH v7 0/5] Driver for pre-DCP apple display
 controller.
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev,
 Janne Grunau <j@jannau.net>, Sasha Finkelstein <fnkl.kernel@gmail.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alyssa Ross <hi@alyssa.is>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Neal Gompa <neal@gompa.dev>, Nick Chan <towinchenmi@gmail.com>
References: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
 <174047913824.2131221.6545389561298332217.b4-ty@linaro.org>
 <CAA8EJpqM8ZQ-ScEtEBXaUF2Nargtp_TBAyMYvbJ49PGbwPWjaQ@mail.gmail.com>
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
In-Reply-To: <CAA8EJpqM8ZQ-ScEtEBXaUF2Nargtp_TBAyMYvbJ49PGbwPWjaQ@mail.gmail.com>
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

On 25/02/2025 12:37, Dmitry Baryshkov wrote:
> On Tue, 25 Feb 2025 at 12:25, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>
>> Hi,
>>
>> On Mon, 17 Feb 2025 12:39:30 +0100, Sasha Finkelstein wrote:
>>> This patch series adds support for a secondary display controller
>>> present on Apple M1/M2 chips and used to drive the display of the
>>> "touchbar" touch panel present on those.
>>>
>>>
>>
>> Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)
>>
>> [3/5] drm: panel: Add a panel driver for the Summit display
>>        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/40115947b59f2ca361a47615304dff0a2b69a2b4
> 
> Without the bindings?!
> 

Bindings will be funneled with the rest of the ADP driver, the panel driver can be applied individually.

Neil
