Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61001A54654
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 10:30:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3244710E927;
	Thu,  6 Mar 2025 09:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IK1a5jPk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4851B10E924
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 09:30:29 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43bd03ed604so3482825e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 01:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741253428; x=1741858228; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=3ncB2tuQORatDJdRGujzDM4Ip4LmUwzu5C0be3bbhYo=;
 b=IK1a5jPkCD5IEVpDpV78UgFhDlYBx3iPYkzIbbT297626M+FIriq/JiLnVP7ElNRFR
 3XivZVhPPnXQZT8XKOOZxzAeCKWWakYLM1rYhK22S54K+fK+wgPtyW2jknR6r8363EGu
 XqRqtEKFV5EnSCSTS3W90/Skc7JWPvPZIv+Kg4iwff7aGgK+Icc0K2EO++4rmAqELCF+
 imUgeomD17vydbOLzfFG9YEX4W7Xtw6lv6KRfClLkBPhUbH6GhWab3u2j7ygJ2MyiLTt
 DTP7R7SFWxE/rUhx6+6j6xvM9yspnFJioyo/Gw79gxMPizlEH9snPU1jsHJe+8WjmUKF
 DTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741253428; x=1741858228;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3ncB2tuQORatDJdRGujzDM4Ip4LmUwzu5C0be3bbhYo=;
 b=fUEssmBIbp+qjhsm7ctsWJlKPeI4XIIwkfEbRg3eYb3ZO0S66iZCWNjF0XF6tzOvyO
 LTksNYQihVLzExvqiLLQsiWhz+A2otwaWH2PWFLy8Lgr7P5DVzy0eK+mIcPjtB4H6M/8
 EohF43jZiCB993F2nkmAxvlgdcfXLbjpbkTSPM/iVLCr8j8lPKbFxOkw656jmKvYTQOO
 oHAgiNDAVbzqu+9N9PrAm8N1iB+slv+9iaokOR1BdnSigAlnvaBn8pZ+imFanR5uDWTx
 K4T0yB706ejg9hX/Q16bXR4o7VSO8HB4+LYUwGaDOOMYpdOHMEOIZNl/fni/kTd3/x+5
 V/Sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrSgG1hqIKpVTjF8cNwZm3KKbzREutrwA0v4C3DCuMsWxZWfdtVOTDcyz1goEGdcCxIhNk/0SObTg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1yOY9B9RQj63aeisWj1QumiZN7k6HVbz4Gv+A2t50dLgKQj3y
 HySskjESV5kI+IVPP8yHY8M4TcEzfWgwpdnhPTCdaGqgouDUUT9j02J+fJYP6x8=
X-Gm-Gg: ASbGncuaiCLvEW3aZ8d/Q7N9zg8rr1dEpVxhK+WfAhpfBjAnTCFaeBP10P4IxDUDWBf
 6ZAzZeFJMdUg5Uf92+YqNNLCNYPCgMtlYEmysxzqUMvCNGtlDQO+7bb/r6kP3aJRsVPgwMG7ebU
 9qkRd/hJWJEG8P8oM16NCCapSKEdNvpFZgqga7Bp78y39stgNbB7zCDZS3cKN913QiWRyKGn0kf
 o/8UYajP34TtOnltuL4XoOe2DOWFnWS0mxOfTnYo//whOtkMXcRZeH+16BNGsDfWh3KUbub1g4b
 B4D4fWV407o4M14/JJ4FxudB8Y76J2xyOxt15TM0fZp+Wm9r463ylTnt
X-Google-Smtp-Source: AGHT+IEyknlGy0vVxl7IFJZZCVesAcPmZtefHHgNNLbDgMorbZ9ZZYO+JvFG/OeIm1Ql1Pr2uoj2Wg==
X-Received: by 2002:a05:600c:35c2:b0:439:8bc3:a698 with SMTP id
 5b1f17b1804b1-43bd293f637mr53469645e9.6.1741253427697; 
 Thu, 06 Mar 2025 01:30:27 -0800 (PST)
Received: from [192.168.1.101] ([37.167.199.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c0e2b8bsm1440616f8f.64.2025.03.06.01.30.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 01:30:27 -0800 (PST)
Message-ID: <3cb174c1-ef1f-4578-b5b0-b82366d02ebb@linaro.org>
Date: Thu, 6 Mar 2025 10:30:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/2] MAINTAINERS: use kernel.org alias
To: Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250306-update-email-v1-0-9a231571e905@kernel.org>
 <20250306-update-email-v1-1-9a231571e905@kernel.org>
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
In-Reply-To: <20250306-update-email-v1-1-9a231571e905@kernel.org>
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

On 05/03/2025 23:44, Dmitry Baryshkov wrote:
> My Linaro email will stop working soon. Use @kernel.org email instead.
> 
> Signed-off-by: Dmitry Baryshkov <lumag@kernel.org>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 29e1a423eee5bcf9df7938aaffe5bd3e2f6a2bbe..b3a67e278a839fa14d1329a249ecf4bbec00c26c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7459,7 +7459,7 @@ F:	include/uapi/drm/msm_drm.h
>   DRM DRIVER for Qualcomm display hardware
>   M:	Rob Clark <robdclark@gmail.com>
>   M:	Abhinav Kumar <quic_abhinavk@quicinc.com>
> -M:	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +M:	Dmitry Baryshkov <lumag@kernel.org>
>   R:	Sean Paul <sean@poorly.run>
>   R:	Marijn Suijten <marijn.suijten@somainline.org>
>   L:	linux-arm-msm@vger.kernel.org
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
