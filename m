Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 568DDB8A0E5
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 16:45:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24CB410EA1F;
	Fri, 19 Sep 2025 14:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="u63hrbzZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BACED10EA1F
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 14:45:19 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-45dfb8e986aso19396715e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 07:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758293118; x=1758897918; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=EJj1y8HqXNnf98ADR5kQhDmwOZyt1Xf4VxjtZZ9P8no=;
 b=u63hrbzZHajvk3lZ0n48xRWCPl5r903VQz4cmJX20tG7ODxOsufg8uzNlQcrFwW+q/
 l3fwF+uC4iMyocb9907fNRke3f0F1fSXXbubbn9trOO8g2+Ch+iKzaGKsXDS2g8D9hUs
 PAjCyQ0AF6g26kr8S2ORgRUR5faEBXUyVreJTyiLrIDjQaqI4rURikE84CS5V9eJE63u
 Pzq9gxfDcLmsTQnoAWpHtHhvrKPjvMjQUC8TIRgmAtg2idK37L/ad375CltkHV5P/z5S
 UIIE6pN58ddKDnLKwdGShjW4zWs/A5slZQQNzuDHnudgjco/+hOKBoYPUccMbQYt7Reg
 dlww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758293118; x=1758897918;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=EJj1y8HqXNnf98ADR5kQhDmwOZyt1Xf4VxjtZZ9P8no=;
 b=FcASgW1GMCaBsoqgxSq8ZHjMgQB9t/Rf4De3WedYhJHcEHTtzFCcUEDDKjKb7he8pZ
 Sni74eYbjSvL0AnQFpz/pa33cZRVECCSyinFqSqHRuO2702VN46o8p9h9OAbXkzETJIF
 F6Uwn92huCsCYjTQKYn2QzvtLMUThJjih7i83mEtN0HaHnsBRcA0XjHVKr4p8ELQHWWJ
 7DVBckrqa/1L4DWcpWb3CuUPkEhcIl5FHvONkAp6g2t6kdAYC1jWaH0dcYG4VYSEHnwq
 d3tngUSF8p3tXi95yMOyu+5NE94bke/4FCMNPpoYN+tXm5cdUJNwWlIfFBF/HOT54h9l
 ifiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxEDOg/Kp2xm9bXGDLIi5hDzJrTcD4CFbzUdln2dAqI2BmbB28dhYmoM4rlxEScA9yG5fajRY7oD8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yypuq3jJuMfYdJcfMwqdt8cPoncwzX2XODzMmY+/Hf1VAmA3TE8
 FK9czAdO1E5YOQQHTExMlX36QPq5FjmH/EH9ce/BScjBPB0xmK29EL+KaFRKxB1g7O0=
X-Gm-Gg: ASbGncuy+2HeatjGlW1Nnc/AmVzI71R9AQX2VMM1FoKorZo2/XYgDatERIAW+7UiFM3
 BoKLxA1u96526yPToGkTBxzD2zLojEqAxnHxlPuw2lQgTpoTmc/fCrGAlqPn1JD+SlvhGxXwNPg
 01O+IqcDKL35+Itzao4t2Cs8S7VnHcIpL4SAMK/r4279s/NhFkAFMBvWcqy3gU/jwIKgZEYQkx1
 wOi2b4nb2KS463KgT+jax3gz87NC20YnWRXIGyoj6GfpcFIpMjQceoJwiEro+I0dmRqQj5nFkgl
 o5RS1hlY1DvyLGJDBhQpV9HT+AkkARIl/fuEPoLLahSWero9W0ErM2Atjy7FmG1BE5sYUxmRzUU
 /hX2ZJN2l3bZty7oEXfka3GkYDBtCa/T5uSUkKTLp8cDSVqSFeiD0t/x3YFbE8dzwlAG5OLP6
X-Google-Smtp-Source: AGHT+IFxWL+PQqZanQNlYmC61Jl0EglExICuzzye9odcz+14oOJKf1NTLs6pstSwIMChvW2GI7XGEw==
X-Received: by 2002:a05:600c:468a:b0:45d:e326:96e7 with SMTP id
 5b1f17b1804b1-467eaa86e42mr31110285e9.29.1758293118114; 
 Fri, 19 Sep 2025 07:45:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:77b3:66a:b2a0:c20f?
 ([2a01:e0a:3d9:2080:77b3:66a:b2a0:c20f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee073f3d73sm8046942f8f.8.2025.09.19.07.45.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Sep 2025 07:45:17 -0700 (PDT)
Message-ID: <272d8cd6-e151-4bab-b8fb-438182a575be@linaro.org>
Date: Fri, 19 Sep 2025 16:45:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 0/3] Add LG SW49410 Panel Driver
To: Paul Sajna <sajattack@postmarketos.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, David Heidelberg <david@ixit.cz>,
 phone-devel@vger.kernel.org, Amir Dahan <system64fumo@protonmail.com>
References: <20250915-judyln-panel-v2-0-01ab2199fea5@postmarketos.org>
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
In-Reply-To: <20250915-judyln-panel-v2-0-01ab2199fea5@postmarketos.org>
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

On 16/09/2025 04:32, Paul Sajna wrote:
> This patch series adds a drm panel driver for the LG SW49410 panel found
> in the LG G7 ThinQ (codename judyln).
> 
> The basic driver skeleton was generated by https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
> from the vendor device-tree.
> 
> The panel driver works but during testing we noticed sometimes the
> display goes blank. Source of this problem is unknown but seems to be external.
> i.e. It could be a conflict with another driver or an issue with
> aftermarket panels.
> 
> Comments were added explaining magic numbers, and devicetree
> documentation was also added
> 
> Once this patch has been accepted, I'll follow up with
> a devicetree update for sdm845-lg-judyln
> that includes this driver, along with several other improvements
> 
> Co-authored-by: Amir Dahan <system64fumo@protonmail.com>
> Signed-off-by: Amir Dahan <system64fumo@protonmail.com>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
> Changes in v2:
> - use "multi" versions of functions
> - remove DRM_DISPLAY_DP_HELPER
> - change dt-bindings to panel-simple
> - Link to v1: https://lore.kernel.org/r/20250910-judyln-panel-v1-0-825c74403bbb@postmarketos.org
> 
> ---
> Amir Dahan (1):
>        drm: panel: Add LG SW49410 Panel
> 
> Paul Sajna (2):
>        Update MAINTAINERS for lg,sw49410

This patch hasn't been reviewed, and anyway the subject is wrong, it should start with MAINTAINERS:
please fix ans send a v3.

Thanks,
Neil

>        dt-bindings: display: panel: panel-simple: Add lg,sw49410 compatible
> 
>   .../bindings/display/panel/panel-simple.yaml       |   2 +
>   MAINTAINERS                                        |   5 +
>   drivers/gpu/drm/panel/Kconfig                      |  13 +
>   drivers/gpu/drm/panel/Makefile                     |   1 +
>   drivers/gpu/drm/panel/panel-lg-sw49410.c           | 502 +++++++++++++++++++++
>   5 files changed, 523 insertions(+)
> ---
> base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
> change-id: 20250910-judyln-panel-948f177c5c5c
> 
> Best regards,

