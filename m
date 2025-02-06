Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE17DA2A2AD
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 08:54:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EFDB10E7E4;
	Thu,  6 Feb 2025 07:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="z4I9+xIh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63DF710E7E4
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 07:54:10 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-43626213fffso9980155e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2025 23:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738828449; x=1739433249; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Q+U3GhEYNSJGMFlCgGumTWq6/ff6zdU5LVaoQovoEL0=;
 b=z4I9+xIhDy1HD5ecvdnnBKDekTcmKpASA/4JUhZRsCFf0b41ayOLSZDeosB007vv4z
 faaxGFfuGUbgsBnSn4ez4K7sGLKTfackNLsYfOJ6Cu7YWUFoB8cxteM3gBDoAXfWWjb4
 2IGpuOjstk/tLtIK/VcEpqcdO6hgVyQgK47ISJWQZ6ZiMpJGLLZD5hPkdae5fhUh01Yh
 CZvZ3UcNwyoNt6+DcOj8uLjG1wSqaGR49dEYfea4a3OMYmbvkhnhz8W+x73qTcNVuk7q
 X8Ze1WhA8RR7Nd1Mq86pabOHaFF/JFD4M/YlN3iHcBBQRMvrBtrZa9uZx2alfxRdSVAM
 b0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738828449; x=1739433249;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Q+U3GhEYNSJGMFlCgGumTWq6/ff6zdU5LVaoQovoEL0=;
 b=M53qVJTDJcdQ8sbmsU27JG+x/ME9v6vNLf/jTGo1hrRLwS2adkrf90IQsc8/g+YHcH
 rpkLA41RAmHKOWZYW+iMnclyYLCL90blxk7skEZm8IdxooxBID2Ry+jtm4d+PEzO30xI
 6WhdDxq2Geu5xtYQxSgRy5PAwewr2D9ow147COYgyGuV+swmznARlQB040N1L8nrPcKt
 3VA3mJqAVY6gooFxX1racJXUaY2gZbgHA0ZD12snh/gWOSLq82MOGEy28bYCfPdrM1k6
 dJ9oLO8OjsHBfSrq0Tj37DONcuOa1tm4CDvEhK5UizPRZJzMNwAi1RcQ61HBX8MpE7eh
 LIWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSgpG4uyigpmwLfo/TCKb9r/7fVz9aA5si5Fazh/n75zQfZhrvo9A71XCYl4EtKC5LfkZ+36pj2dQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3ZAEgnTPB8fdJkDEiyrIUBcvuyx34BsxXgvL3I6y7tLomfHLQ
 MvHRmfLsltVLB5csjnCyb41v3PMwzzllJxGuyKbZ73NhDeIma9ydzclFhAlWqIE=
X-Gm-Gg: ASbGncsQu/1EvbGZliUjkpzxGHHw7TQOZqFa7qPA5iepAAUdUKWzx0ARS2fd2s9e9mF
 fpX55vqkYu4dXX/ErkGViSyOxFc3C4Mbl3dP38d1iO+icYhmfM2+p3GklxTlPEkHYmT0Dg/I60o
 d4fWLYSrKzGy/xXH5QPT4jVYidFH6Ryg8WHqnH0NYeQbu7jOqCw9ilYPzfg5TaNQ12fYYKme/9g
 HZU+gto8DgkMfLll2carfiqssCg8ov6dtGAiJc3NZSfImXKF3fms4vXmnL54r6h+hiqLmBuPvmB
 9nDQXnmsegAkgTaAs//dloIFC+O9K80ZTelec4YxwQHD/RG4/e3wzuhJARPMbsWo92A0
X-Google-Smtp-Source: AGHT+IGrzW1LdzySmLH3XUvU+ruX4SLesnotJf/9MZ7S4Ul1OkUGYV9PvZdjXAlQoh8a/JyV5GRRkQ==
X-Received: by 2002:a05:600c:4703:b0:436:185f:dfae with SMTP id
 5b1f17b1804b1-43912d1510emr13458025e9.6.1738828448157; 
 Wed, 05 Feb 2025 23:54:08 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4972:46a2:e0cb:c0a6?
 ([2a01:e0a:982:cbb0:4972:46a2:e0cb:c0a6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc050d688sm522181f8f.24.2025.02.05.23.54.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 23:54:07 -0800 (PST)
Message-ID: <9db01455-f3e9-474b-b87a-30f934ff6a02@linaro.org>
Date: Thu, 6 Feb 2025 08:54:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 0/5] Driver for pre-DCP apple display controller.
To: fnkl.kernel@gmail.com, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alyssa Ross <hi@alyssa.is>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Janne Grunau <j@jannau.net>, Nick Chan <towinchenmi@gmail.com>
References: <20250205-adpdrm-v5-0-4e4ec979bbf2@gmail.com>
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
In-Reply-To: <20250205-adpdrm-v5-0-4e4ec979bbf2@gmail.com>
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

On 05/02/2025 23:10, Sasha Finkelstein via B4 Relay wrote:
> Hi.
> 
> This patch series adds support for a secondary display controller
> present on Apple M1/M2 chips and used to drive the display of the
> "touchbar" touch panel present on those.
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---

LGTM should patches 1, 2, 3 & 5 go via drm-misc ?

Neil
