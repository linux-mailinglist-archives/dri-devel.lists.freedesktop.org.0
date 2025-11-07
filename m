Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 672E3C3F72E
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 11:30:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED5510EA6E;
	Fri,  7 Nov 2025 10:30:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JJ6l5huu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBBE410EA6D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 10:30:30 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-477563bcbbcso2663865e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 02:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762511429; x=1763116229; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:reply-to:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=JdXi1VUn5WnebblzEeFtNSpH8JjcIBHUGIXhJ5CQTgk=;
 b=JJ6l5huuAOE2b8ByVJvJkh9AnKJZwdfgA+B1oOOp6yl3wP4pZ8XkACh/H6+ZPhOR1m
 fNfGbsSyONiAzGjpm1XV+qEmVpAcrlhHZcxOVOuqeNKKvYo5JcrprmhytfnPZvStvYWi
 Mvp37zbMZFbbHHtnrfZe8/8RSabafwx1JU/tR2sfEupsE3C6M4fgOD1exvFMIAzYTDBr
 Nx+xashlBeb8Tunad0o3Xn9cCSIqVpnA7X42PrXRHMU68GbBU71h4dxR6jc8d8tTE2Sp
 OnsWL31yIjHt890S1bAvyy7W4mM7ZN2EpyFY32hrO4Il9eYAjOtQ5MMOSnHIgGqr8pdC
 fDoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762511429; x=1763116229;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:reply-to:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JdXi1VUn5WnebblzEeFtNSpH8JjcIBHUGIXhJ5CQTgk=;
 b=bv6G71dJXqEC2Eog+S5ONRme63F24xNCYrCYuSkcf/GqbXhykj+3U5vABEY7qc8719
 YWyquEjPvr6ds5gBGNZ47BkOXiLS3T+W30N6A5Sdtl9ZUsYsBwtHqWmf4unRp9XQc4Fi
 YPskexofF1ljd+93zRwcls9BxBdCBndKxM8YLa8A6opSyGXC32OzinmLSrxGnSr+Aeu7
 T/YxbTM5cgWIX8ycVSLtYWBpcOjMF8JqojZKc/VWyTkNH5i4c72sOWXQ8OD2QKYljSt5
 0rsRrzVepa7+5dsOKuAkE0TiE601b0QxgVGm/PMXWK/Ege1uO+xJnU8t6zrvzVbCUmUQ
 x4KA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2zlvq3or262Cro5bI6yKaJGNCBjUjJ6MfpiAdnp9X9KSkgXXGwDhQk+AqJGgCNjbmtGjGqgY9jlM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+kHNlnoqU8Bm56xaKfyDNZ40r2SPHcMIsMNULiiOM3xJzRHfO
 FGz9oggx/m2Xyl25F7Fprf2k6y/53aT9mAzXSHwZOle232VmoljmZzXzCua9xOL0qdI=
X-Gm-Gg: ASbGnct6ty1JFz76wA5jZaDj7Lt4QBOevemypTKPOj/bF4YKL9Tv8C8Ul9WGG5apw3x
 HxmfEytJoGG6E4tnG96Mbcv/oBIy4VSXODmIK0vTXJCnLZgPrkUblfMkCW0tICul4o65pbeh3bP
 rXH6SgDDaqFwQIDe02D4t7YI5IskpUbDYG9XBpY1VYjeFJRjXwb8IcGJQmhU2iSRFbLEMI/uCun
 GdkMtbJePRwqPbQvfPzDOwqfc/D07b2MtXhIgunEy4k77Lwo9iln2MbNNu/BFk+hLVjRxC1WXRu
 nnvEpWCIVbe9ZQEnJk2Y5t53BMIlEHZmWejaMO6KYjYhFXycmjQ67Smz4sQW9etvbiJUWXbtnHD
 jdbRL/X1BHi747CP4s/UL0z6skej2bow2ASm8QN8Ngmxmy8npMIbDqHc4ho4jwHqJQyBPCdJWyd
 x74MsfU/wBIG99t4QXA5Dj5yl3WnZd084xzw==
X-Google-Smtp-Source: AGHT+IE6wGGrTa2Of4J6WHqQuB5miuumaX9005ll7uHOZgbpYuJ46LLqftJ0moP7xlPSeD3ujFGq5g==
X-Received: by 2002:a05:600c:35d0:b0:477:6d96:b3e7 with SMTP id
 5b1f17b1804b1-4776d96b678mr16427785e9.33.1762511429427; 
 Fri, 07 Nov 2025 02:30:29 -0800 (PST)
Received: from [192.168.27.65] (home.rastines.starnux.net. [82.64.67.166])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4776bcdd8e3sm39799555e9.10.2025.11.07.02.30.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Nov 2025 02:30:29 -0800 (PST)
Message-ID: <e928b078-ad35-461e-8aaf-d5ec036ac4db@linaro.org>
Date: Fri, 7 Nov 2025 11:30:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add Akhil as a reviewer for the Adreno driver
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20251104220245.240480-1-robin.clark@oss.qualcomm.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20251104220245.240480-1-robin.clark@oss.qualcomm.com>
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

On 11/4/25 23:02, Rob Clark wrote:
> Akhil should be getting tagged to review GPU patches.
> 
> Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1083598bb2b6..033675aab0d0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7880,6 +7880,7 @@ DRM DRIVER for Qualcomm Adreno GPUs
>   M:	Rob Clark <robin.clark@oss.qualcomm.com>
>   R:	Sean Paul <sean@poorly.run>
>   R:	Konrad Dybcio <konradybcio@kernel.org>
> +R:	Akhil P Oommen <akhilpo@oss.qualcomm.com>
>   L:	linux-arm-msm@vger.kernel.org
>   L:	dri-devel@lists.freedesktop.org
>   L:	freedreno@lists.freedesktop.org

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
