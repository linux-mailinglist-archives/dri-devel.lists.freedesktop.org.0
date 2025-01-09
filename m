Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4686A06FED
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 09:26:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DCB710ED0C;
	Thu,  9 Jan 2025 08:26:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KA+s1e/v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F0610ED0C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 08:26:38 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-3003c0c43c0so5472191fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 00:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736411137; x=1737015937; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=SDburU8EM+cyhb0IOZ8ZAadXRNXnF/xp0rz1w6CgrGM=;
 b=KA+s1e/vSdhMsiloSNrcUp46drg3SSKTKXxHoFvWM3XhSJn9N7ZV/olAeupg7F3xBM
 GKwO1TvvFXYh6f5nhNubj2HsdcdslUZxb7nDS8fLvY5TSk9aBTwVH6mfu28Ph723Adgs
 s6BSEiADIoVkhoa9zLtAVrU5FgCc4mnK9pq/syUz4kvQo5JwdkeOBbKrc4XFcSQleitk
 yexCMIMmX2kYIee0b2iMonMextJHrvSRAQNAFAs2dkD1BbAqJiq1oMJ6u7D7G2aj0/vA
 uzH9UuL/4fMQ/sEMLIuVoLxc4TvOEb0BnQrpajprWyrr7nS5vMOtqK+2IvhCRd5Mj+V6
 4iXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736411137; x=1737015937;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=SDburU8EM+cyhb0IOZ8ZAadXRNXnF/xp0rz1w6CgrGM=;
 b=KCpH7bkfcMRIErH/CBdMuOp82EiWcHERTK+deusKOnYUJWHmrHCF7qfhjAkqJF7H6E
 /AAMIMWuQcPObbKl0lG18akg4jXRiOB7vkcM17RuhHZC051cGX7iFMNNOB176ZaHAwKt
 QKLmVtqUy5FsETOiSvHv5glo1kKVHRAVRChcdjAqWQ6ByK4DkN/Fkr29tly7qxLI4s1z
 GRQFhBPgj463TRBfiUQ36CMkgD/Q7NwvDY5DYu/OSlzEPXJ5fSYe145FiXDQL/U1H4dw
 Xs+B/LKg9eW6yosWF2RzcmFmRVGCKa6BBqZQaI1GSlp5/JsAAeQzhTD/FgYMxyt/d2Pe
 n0vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVccBb2w5FafeaWAs3GznRy7nVzCFI4NawyhR6iXkTf1C2dwwDne3aw6BezprKRPV8pae0atgQZlyE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGHiHZQQu6Yhobo1u24VTWIZnkhkKt1uGeOCA2dQvjikGSvFCF
 AlO6clYZUsADtccG6/SA6VDasvayMJh8LP0VyWmEoG26+TqMR9q98d0YhAMQ3dYCnbcsv2R5O0x
 m
X-Gm-Gg: ASbGncv8hyffdJIbZBx6YzBD42rpGmFOzzQxDw720/bcRxGUCiUD68owBUAJotIs8vm
 ZW6+RWmyREeUbdxU35hChS8hoipwkvpeiWoGARB+btO7F1auYwlDa4lqWnsGCKaDeQPuOXNyIDR
 ozhvV8DOTwprlmOi/N37qv24yNgzu+ii4WZkFaMd4pDtwn7TFWVXsS+UM6WNQEadde+pO9DOyzt
 RwYEI1y2ljCNouFd0uxnTBzMzjZiWz3TviydwgPKeTz37PGCkpqM9LeAfJy+2oE1QCCFqZ68CzJ
 SbwaRllIMsgDji8NMXSYuTyzEqyvIct0GQ==
X-Google-Smtp-Source: AGHT+IEGs+msZPIsIgrCbfJ6qv2MxuOOnLjQWHB0A0O0rUMX53v5jVSSQQyb1v/1WHGX+P63OGrEFA==
X-Received: by 2002:a05:600c:46d5:b0:434:ffd7:6fd2 with SMTP id
 5b1f17b1804b1-436e26aeb4emr47286725e9.7.1736409263961; 
 Wed, 08 Jan 2025 23:54:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:688f:e09e:ce30:f1b2?
 ([2a01:e0a:982:cbb0:688f:e09e:ce30:f1b2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2da6271sm45823095e9.9.2025.01.08.23.54.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2025 23:54:23 -0800 (PST)
Message-ID: <00a01ba3-8b03-4a41-a8a0-650aaf661f12@linaro.org>
Date: Thu, 9 Jan 2025 08:54:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 2/7] drm/msm/a6xx: Increase HFI response timeout
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250109-gpu-acd-v4-0-08a5efaf4a23@quicinc.com>
 <20250109-gpu-acd-v4-2-08a5efaf4a23@quicinc.com>
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
In-Reply-To: <20250109-gpu-acd-v4-2-08a5efaf4a23@quicinc.com>
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

On 08/01/2025 21:39, Akhil P Oommen wrote:
> When ACD feature is enabled, it triggers some internal calibrations
> which result in a pretty long delay during the first HFI perf vote.
> So, increase the HFI response timeout to match the downstream driver.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> index 3c183c1c6266..7d04b242363c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -108,7 +108,7 @@ static int a6xx_hfi_wait_for_ack(struct a6xx_gmu *gmu, u32 id, u32 seqnum,
>   
>   	/* Wait for a response */
>   	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO, val,
> -		val & A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ, 100, 5000);
> +		val & A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ, 100, 1000000);
>   
>   	if (ret) {
>   		DRM_DEV_ERROR(gmu->dev,
> @@ -725,7 +725,7 @@ static int a6xx_hfi_enable_acd(struct a6xx_gmu *gmu)
>   	}
>   
>   	/* Send ACD table to GMU */
> -	ret = a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_ACD, &msg, sizeof(msg), NULL, 0);
> +	ret = a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_ACD, acd_table, sizeof(*acd_table), NULL, 0);
>   	if (ret) {
>   		DRM_DEV_ERROR(gmu->dev, "Unable to ACD table (%d)\n", ret);
>   		return ret;
> 

Ok it's here, this should be on previous patch!

Neil
