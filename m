Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C75E6BFFE98
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 10:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D98010E8D8;
	Thu, 23 Oct 2025 08:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uVNHDPOj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C116110E8D6
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:27:28 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-47106fc51faso7875525e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 01:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761208047; x=1761812847; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=o5NAC18QJKswT+g7496Z32PVkkCkiTwCQISpflqfju0=;
 b=uVNHDPOj7l+r7wjVxk8dKTmotkwxywm+Pm1tz4oDkl1ayv6CkDhGbApmXxNij19Sf6
 TqE0OwbYxBMI2kekkfvlkyFRDx/c3MgAh2lWI9JjpubF94vhxJUAcWo+4m/HgoTohEL8
 pAHrzsnb8mxioMelKvunmmWAmbRTe5kWrutmQtlCWufZIF5eflt+ffr8yXN+97mM3Z+0
 VNrlZZfLr1Xs2hkDuc+GaiEwA1Etvaa62e56b0I+sbUTm4MthyaNQDqYcnwYoWmyg8Xq
 +d0UQ4lk+3Vy89hCBm6XvY5t0reFUTa4grWZ0zwn6HlA0hTA2IOvvcbOXqT4KRGzbGkq
 kDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761208047; x=1761812847;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=o5NAC18QJKswT+g7496Z32PVkkCkiTwCQISpflqfju0=;
 b=WbDABEnokD3dAm3jolACXmbm8063insCSLGmL+JtX19nkbg4RjP+Q/9oeZnLBjnelG
 BoRYKnGAtj1xCDNV4YEn7aOOgXzdJ3ADzB5Hm6cJ7EO9spV60DC/EUrllei4iPg32ap6
 AgK4cHLafym6440nmtUxQj8pCRHaczLmCCk842HH1H8KUBEbhTHJbeZM1psubYxihylw
 kmL3BXEHWlRZ6jxQgMMXbT57+gBqH/iQtLdLyjxB1vyQhzwnmo1EulDudfaMwdkXSKCN
 3S8/u5oSdYbz4Z+vDEPfDe2LpGFo4oN38UhugXuGLkTRtdjSjVhq9PWdPZmprPtLZRIR
 sMAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYGxxJ5lLblexHD3j/H0GmZWVewZ41RvpGwHdPx+tsdbJ6YIkxruKctbM6LqvBtGL9NTIT+TiOGhg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSQKfG8acECQlygC7cSQ+oYhv7DwiaaI4yebyX80yUxEYl7irg
 CbpEB/rjWbbXJoztBBEe37nlQs1nKElpxDzE1+b55lOVg6smWwwpoH/G2Nej/CqFWxs=
X-Gm-Gg: ASbGncvLZOgDlpwNxzHcjOC+BuWoZTTLr+i+KKhYgAlQvIjNXHUzyAKQFe+IAcmdNqB
 wdIxqDLoxkXrtKLrMWWonwa/+EUklhAe1z11qI7CSJhDRpDZQu9oiRT4Sx1muMmgD6M4vNUzt5T
 nACXHrZfphEBre3CVaJc468QWEYfUTdqfm6oGPG1PaXKk4Km5soS7q8uYulhMF+nJJolOi2LAEZ
 nccqbZaT7NQUCSkY+sVQ6GLxE+ObQ3wX3hjQSnIuLowGUZLoIaIs4vKO9QVdzo4/lKe9oQGf9V8
 Mh4IwPyl9UHKQtARLSR4KeSmF87M2L9vRmfIhcHEEwIJKHGZm0CxhB9xBccbYwDYmPfBN3Wouf+
 UzXTFQfcDIf/+sMtwNJjnyCOwuSYROm92wm1E5rzrfNNk/dNvd5vZCjQrXlyRKzg+Ldnld36xS4
 FB9H8QZ3DqqOpNY7sliRSduI5acBbJvDdAgkWqwnm5WvBlIUVXwl/Y
X-Google-Smtp-Source: AGHT+IEKr8axP45C8SAm3blZ9SD+S+XPhWTl1Qvfzhwa2h5mIngdJ9Be+l1Fru99wJnFHQOsUb8UpQ==
X-Received: by 2002:a05:600c:34d0:b0:46d:cfc9:1d0f with SMTP id
 5b1f17b1804b1-471179067e6mr179978285e9.19.1761208047113; 
 Thu, 23 Oct 2025 01:27:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:4c73:a2de:56f0:4bfe?
 ([2a01:e0a:3d9:2080:4c73:a2de:56f0:4bfe])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c428ece8sm85423635e9.7.2025.10.23.01.27.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 01:27:26 -0700 (PDT)
Message-ID: <25e829f8-60b2-4b69-8d57-ded846b5206a@linaro.org>
Date: Thu, 23 Oct 2025 10:27:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC RFT] drm/msm: adreno: attach the GMU device to a driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
 <5d6e7303-cc57-4a50-a9ad-b45d3c89d045@oss.qualcomm.com>
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
In-Reply-To: <5d6e7303-cc57-4a50-a9ad-b45d3c89d045@oss.qualcomm.com>
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

On 10/22/25 19:09, Konrad Dybcio wrote:
> On 10/22/25 2:44 PM, Neil Armstrong wrote:
>> Due to the sync_state is enabled by default in pmdomain & CCF since v6.17,
>> the GCC and GPUCC sync_state would stay pending, leaving the resources in
>> full performance:
>> gcc-x1e80100 100000.clock-controller: sync_state() pending due to 3d6a000.gmu
>> gpucc-x1e80100 3d90000.clock-controller: sync_state() pending due to 3d6a000.gmu
> 
> Does this *actually* cause any harm, by the way?

?

> 
> For example on x1e, GMU refers to 2 GPU_CC GDSCs, GPU_CC refers
> to a pair of GCC clocks and GCC refers to VDD_CX
> 
> and I see these prints, yet:
> 
> /sys/kernel/debug/pm_genpd/gpu_cx_gdsc/current_state:off-0
> /sys/kernel/debug/pm_genpd/gpu_gx_gdsc/current_state:off-0
> 
> /sys/kernel/debug/pm_genpd/cx/current_state:on
> /sys/kernel/debug/pm_genpd/cx/perf_state:256 # because of USB3 votes
> 
> I'm not super sure where that sync_state comes from either (maybe
> dev_set_drv_sync_state in pmdomain/core?)

The way we handle the GMU so far is wrong, it abuses the driver model.

And this is a symptom, whatever the impact it has, it needs to be fixed
in a proper way.

The sync_state is retained because the gmu device is never probed but
has some clocks and power domains attached to it, which is clearly wrong.

Neil

> 
> Konrad

