Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 622D3ABC7C4
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 21:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD69310E2BD;
	Mon, 19 May 2025 19:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fD54OPvx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11DE10E22B
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 19:27:10 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso35420075e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 12:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747682829; x=1748287629; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=zUIbMIX0qpjZAfI2726nQo87F32yjlrtrT1+wU7Wsio=;
 b=fD54OPvx4YJi7DV7aL2ZcmttWkznyH6DdMtF2fGn7v/tYFCyryWiQjuLTXE3qGraSj
 W3iHyr5S0B2M3a9pvg53wOx1rNb8VMuHkPrwAKC+Sj3zX7Wb8xDIla3cNu0BmefjaoEL
 tkNh43P4R93g2Ffid5to8I4OYOcEKyRhLzjKvvJzZRQiKYzcXAdqpX72sacRJKUUTfuh
 ffDjLYuRuvuvfcwLG2sy+cNRaHpE8ppAoFJv/SQQQ/IC6uCGgn4m3411tZU3RzgqCoZa
 3P2uHCN0uvI9vBCHiH77p7jh9Kf8f4rhMga4uP4ybYN4ezhVh4baYxW9QF+e6HcWSYQo
 iQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747682829; x=1748287629;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=zUIbMIX0qpjZAfI2726nQo87F32yjlrtrT1+wU7Wsio=;
 b=oPUxNc4nO6vqFmrMGfDVbMCmsqntWQX89rw7rXxowUUPUU3smKbh6eNWhDnVRJgYlp
 WAlhT1+izzFa2aHN0+q/rmqGqZlCmvHGovqNXL1f7tma0GL1cC9CA6z21+wLjvfKF0bJ
 Vz0gSWxHZWa26A9Dqt7flU+pfcsGNCrefYiFfnttSAoLSPXBu+o3kM9uN36/LXxkxSrg
 1yiJiGn2tIssnxrOkSrK6LJ/LEHSYjJSbgozv/K4tlzKWJAiMJSXJOEdbcuH4PdaxQ1P
 Xbl0Ql2DAR3TmF6ihqTtXTzkWg5QVieM1pbx6mupy7O5sF6WddWsocOMtP4fusP3quJY
 00gQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5Vv32ZLVmMIAiFIvFZFVLRQd7SGBZMOcvWmQM2G5gcxUHW95B/IS+hPUjMTQJEzGOLit5w+NvNvg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkwnGrRibuedhR7VsM6LFa52fVhL2s5LRd7rlibx/GeJMi4O6D
 2AlPpq8T58okvKEpivnFm2ZcYrF8v/Bq9dMKGKVvn0jkhepWtrEv7mKy64d38Glc/fw=
X-Gm-Gg: ASbGncsY/3Lwso6iQLjGETH48bpM96byKfis0/XdItIrRkBSbmAfG5O0L8UK3Oq2/cy
 cUwpHfPg6QkJ5Ui1UvDV96u1dTqzrC5GUklK9Wg+HkjfWdtA5QVWLc0o8vw7VQ81bx4KGF/g9xS
 fzkRSKJitFRjzK8JfPI+/A62P6uiPTJmZTm65akT0aDut9jvlPVPptIPx81tZ4SNJxyRJzjyrWI
 R6mPW4+BS5iPXCO92ypeTngtFZxMb8TgzS2BLLBz9UCUwIP5q4Pg/RooosZRJcnvHq17w8j4mMC
 KP4GzJxYpAG6f4fGnqPyzEa1M3qrgr2mVbIapyV9pYpbErvNG5mx+Bb2D2WJmmFPnGbStlhyGGe
 zvU64ZZcXqsKmHXyBGnCcfk/VROHytxF3Ij7Q/d4=
X-Google-Smtp-Source: AGHT+IGsfWglEaW0FESElW+HxWiqJEQe+UHwGwKsQ751zC2k/504E1anuJnCDgJIM+AhaqlWgfCb6Q==
X-Received: by 2002:a05:600c:64c5:b0:43c:ea1a:720a with SMTP id
 5b1f17b1804b1-442fefdad81mr123501575e9.1.1747682829460; 
 Mon, 19 May 2025 12:27:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:ce80:58bb:54b7:ad18?
 ([2a01:e0a:3d9:2080:ce80:58bb:54b7:ad18])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca5a79asm13616611f8f.25.2025.05.19.12.27.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 12:27:08 -0700 (PDT)
Message-ID: <4fb3b14d-e20b-4e0d-9b1f-a0a714240c42@linaro.org>
Date: Mon, 19 May 2025 21:27:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 04/30] drm/msm/dpu: inline _setup_dsc_ops()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-4-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-4-6c5e88e31383@oss.qualcomm.com>
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

On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Inline the _setup_dsc_ops() function, it makes it easier to handle
> different conditions involving DSC configuration.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 17 ++++++-----------
>   1 file changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> index cec6d4e8baec4d00282465cfd2885d365f835976..c7db917afd27e3daf1e8aad2ad671246bf6c8fbf 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> @@ -181,16 +181,6 @@ static void dpu_hw_dsc_bind_pingpong_blk(
>   	DPU_REG_WRITE(c, dsc_ctl_offset, mux_cfg);
>   }
>   
> -static void _setup_dsc_ops(struct dpu_hw_dsc_ops *ops,
> -			   unsigned long cap)
> -{
> -	ops->dsc_disable = dpu_hw_dsc_disable;
> -	ops->dsc_config = dpu_hw_dsc_config;
> -	ops->dsc_config_thresh = dpu_hw_dsc_config_thresh;
> -	if (cap & BIT(DPU_DSC_OUTPUT_CTRL))
> -		ops->dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
> -};
> -
>   /**
>    * dpu_hw_dsc_init() - Initializes the DSC hw driver object.
>    * @dev:  Corresponding device for devres management
> @@ -213,7 +203,12 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
>   
>   	c->idx = cfg->id;
>   	c->caps = cfg;
> -	_setup_dsc_ops(&c->ops, c->caps->features);
> +
> +	c->ops.dsc_disable = dpu_hw_dsc_disable;
> +	c->ops.dsc_config = dpu_hw_dsc_config;
> +	c->ops.dsc_config_thresh = dpu_hw_dsc_config_thresh;
> +	if (c->caps->features & BIT(DPU_DSC_OUTPUT_CTRL))
> +		c->ops.dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
>   
>   	return c;
>   }
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
