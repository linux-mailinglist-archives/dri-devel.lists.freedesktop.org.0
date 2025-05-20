Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DDCABD173
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 10:06:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A6E10E41B;
	Tue, 20 May 2025 08:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Y4KXpCcI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6648B10E40C
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 08:06:12 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3a36f26584bso1128671f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 01:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747728371; x=1748333171; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=f53RxOyUNbfIYGKYJrh6m3a+cJ+2EHowRMXuSk1JA5w=;
 b=Y4KXpCcI47SX0fMBPRdWFFXxu9Q1iVr6YsQTZ+mtEbKZZUp6zQPJIWzmAvRAVCtbsS
 pyJAgzhRAzWMsjctoCmFq7ycotnXxob8aQOd1w5ny1DVA/WBrfkjD9v8cD8SHN6lYd5d
 qIse7LD2GrYHpr+UcujppT8R6Cp7O/rMc64Lc9CfqNMLUCuqYAqPsaIN36TB4Ou9aOWz
 XBRgCdhMcAoIuRnn57BsIN1fKX2YihtBkqJtHd15fUOWW41YD4q9r4IXqIhpeHWBem0X
 5yRJbrweoX8tyy0Z3LHPX8er0pwgZVzT83s6uEGDSZfDpvK8GScAk9ytgF0hp08V+fvn
 dS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747728371; x=1748333171;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=f53RxOyUNbfIYGKYJrh6m3a+cJ+2EHowRMXuSk1JA5w=;
 b=AjpuhorrO976at/ok0N7WyH4U2znua2jiG5L7S3dNh6kvni3JWQprYdertT/TMYWX2
 oom4nodmQMCQYRfHLs6Htf2Z2o5e6GfR0SBTWqFW4QrGEZE0KfzCYN1ujggbrbIdu0xM
 bmlfLWsEKj0ZEiyntytxetAi8PNuEkhhBncg4qtXcI0600gCYvaSf+XhdDLJOE5dGioQ
 BQEEpAEF3nmHwKz45bb3QFvlsrnOGQ0OJkHW8Aasd9xlEruuF6prnUBN0R356/rBJXQd
 QPhTDgu0KFpfc7ZDqQBg6d2cr9pcYIs8EIQLBfSKkKOrjMhIEUevLPfKtu2KASn8b2lK
 ZOJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMh9wFXzTMwqAILWDxTtCqU4EsLXr0DGMhwwTV9qPV3lLK52WLCOoPvsDQiZgXF8f2PNSYFSWVGAM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyT027LJA909SWltcuyMd2pBhmgOUf8v8xfM9hfIqOnAu4y6Ptn
 4L/RPtPyNh7yMwMqcwHXtD8FpMWIxLHTE4oKSpqeKgNpFSSBaZ+hpZgiR6YwTE9dciA=
X-Gm-Gg: ASbGncuwGg3zM2c6zSj2Tq0h02acSUldZ6qjKWsP0LDG7ITFxylfYekmtoSEweQyTQn
 kmWacs3s8hHFAWIZNMDnySvkrn0NDj4j2nZ6e6nTPuO4QYrWQvMTxZoR61brJE3gyJby5UQYtNM
 TWinIEuR0RSwH0pTAihz1sfgW6yhBx6k5eQRGp2P3ttuX5dBWWXraXBh8bOAGBRqXURigg4uQbw
 xEyyQirUxptowaVy/2Iib3ptMkERdWNIVJoE/pYLSr0Iy5DBudc8G/CT0m3LonWVZAUJAiJvgPc
 hslMG/mEjcDuYVeIHWUw1WTfMK/3aDCfkb+Gc8/wQJA03R2ujymsYRRJKCpwTYjAfaNESKc5kGG
 yNhlJ7bQQzj+Wo/mFjzH7qqyG8TI7
X-Google-Smtp-Source: AGHT+IFU/KqkjaZqWA96xVqbCJbAg44BaTwi9c9qATMvcmY51YXkMbr1hDQrWO7pjZhFY+VTnRD6RQ==
X-Received: by 2002:a05:6000:4284:b0:3a3:5da4:d80b with SMTP id
 ffacd0b85a97d-3a3601db731mr12950882f8f.49.1747728370901; 
 Tue, 20 May 2025 01:06:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68?
 ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f23bfdd9sm20643995e9.18.2025.05.20.01.06.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 01:06:10 -0700 (PDT)
Message-ID: <193195a8-1e84-4ec6-aa3e-a02d00bd142c@linaro.org>
Date: Tue, 20 May 2025 10:06:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 05/30] drm/msm/dpu: inline _setup_dspp_ops()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-5-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-5-6c5e88e31383@oss.qualcomm.com>
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
> Inline the _setup_dspp_ops() function, it makes it easier to handle
> different conditions involving DSPP configuration.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c | 10 ++--------
>   1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> index 829ca272873e45b122c04bea7da22dc569732e10..0f5a74398e66642fba48c112db41ffc75ae2a79f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> @@ -63,13 +63,6 @@ static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
>   	DPU_REG_WRITE(&ctx->hw, base, PCC_EN);
>   }
>   
> -static void _setup_dspp_ops(struct dpu_hw_dspp *c,
> -		unsigned long features)
> -{
> -	if (test_bit(DPU_DSPP_PCC, &features))
> -		c->ops.setup_pcc = dpu_setup_dspp_pcc;
> -}
> -
>   /**
>    * dpu_hw_dspp_init() - Initializes the DSPP hw driver object.
>    * should be called once before accessing every DSPP.
> @@ -97,7 +90,8 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(struct drm_device *dev,
>   	/* Assign ops */
>   	c->idx = cfg->id;
>   	c->cap = cfg;
> -	_setup_dspp_ops(c, c->cap->features);
> +	if (test_bit(DPU_DSPP_PCC, &c->cap->features))
> +		c->ops.setup_pcc = dpu_setup_dspp_pcc;
>   
>   	return c;
>   }
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
