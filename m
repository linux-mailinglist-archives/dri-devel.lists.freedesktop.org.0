Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 272D39580D7
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 10:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3BBF10E0C9;
	Tue, 20 Aug 2024 08:23:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IBfvEiqP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8B910E0C9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 08:23:30 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-367990aaef3so3226871f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 01:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724142208; x=1724747008; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=g06wDPeU9MjglcJ+z2m0ltRmTby8o0NBa3/IUMX4o7g=;
 b=IBfvEiqPfBs3aQtSCRzKM7X8rAAwmIFwwGPOSE9AlBoEixUIgaMnJNhZch+AScu47D
 ugE2W8sYyfIKdkCwpQS/AXd0P99nw1FZ77twAt8ldmFyv6eOENCTp9oYTHLl6OloqaEl
 46/Og2nLq24T3Jl0uswu4tnNiRtgwsqtivdMnDlU1i77LCbC8XqGAKdsLcJ2qPkmlPKG
 RUrscpjagZnx3z1Qp+O14Jnx0UTa288YteyTuPubIguyD4JJ7qfP9YbWxWkaOY+fY+Ud
 OhcfGVripVEVwB7xxKtOOO/b+BEmgLLAf6GI6eY6U65I13fFPR/+EfBCQ028ERYTd1Lb
 PIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724142208; x=1724747008;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=g06wDPeU9MjglcJ+z2m0ltRmTby8o0NBa3/IUMX4o7g=;
 b=XF0/vZhte+mpZS99MqBNuBKHtZM2c2IF9W0s+zGMk/s8ECLfJQ9fvcX9taxZ7yC3zw
 nATGv0Vgg/IdliepKbR2bbAIE9hSkt7IJEetJkbaoFfS4GlbZVD2+vQ1kNCmtc2/6S1x
 i5GrHaiLv+Ez93p4JDz1yv9e0uJEcnm11rEEwzuiHcXshJ2Pa7kWn/NbzkTs0xTnLbvi
 aFnXFU1kFuCjx4MNlkg8haBZBWTZbT2Rja3q9ZY4nnLJsuqoIdpTjS9EOqWbrPvnIrLk
 I12EX+2Vc0sKunif21Y3phMHvNR2wEqjoYAJZAVCAGa1lm7jigSlw5lX+YeNOOhYLLUC
 LAdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcpx8MRaBWBycHU3N+r+mV4cu9tCCe7cmcfPw57SWP1mbRYtjY8lGDH66whM+7rxUOJShxqnr829tJiyyueKY6Vn/sQdRKFHIIFd508sxN
X-Gm-Message-State: AOJu0YxAF17WwBJOZX5wNv+RHonP4bQvWGfdz6xll5jYMc/EMKLSN2vC
 gzI7TZFTkvCY6RJHeD67crtVHOEMPTn88sXPQj9UwPwJGUnTLXny3bgA14Xzf0U=
X-Google-Smtp-Source: AGHT+IFakWknGdMxRWi3g0r4IjYM0bu/R3OkJs3pCdC6FIiuXXQwaNsN80cLj+C8v1Pj3hYfWLpd7g==
X-Received: by 2002:adf:9bd9:0:b0:368:4b61:7197 with SMTP id
 ffacd0b85a97d-37194453122mr7643625f8f.24.1724142207730; 
 Tue, 20 Aug 2024 01:23:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ebdf:8de4:37af:6aad?
 ([2a01:e0a:982:cbb0:ebdf:8de4:37af:6aad])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-371898497ffsm12435438f8f.27.2024.08.20.01.23.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2024 01:23:27 -0700 (PDT)
Message-ID: <5dc32819-a794-40b4-95bd-ee05c0c395e9@linaro.org>
Date: Tue, 20 Aug 2024 10:23:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] drm/panel: ili9341: Add comments for registers in
 ili9341_config()
To: Abhishek Tamboli <abhishektamboli9@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org,
 skhan@linuxfoundation.org, rbmarliere@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
References: <20240819175122.33176-1-abhishektamboli9@gmail.com>
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
In-Reply-To: <20240819175122.33176-1-abhishektamboli9@gmail.com>
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

On 19/08/2024 19:51, Abhishek Tamboli wrote:
> Add detail comments for registers definitions in struct ili9341_config().
> Replace TODO with comment for each registers.
> 
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> ---
> Changes in v2:
> - Rephrased the commit message.
> 
>   drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> index 775d5d5e828c..1fbc5d433d75 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> @@ -121,19 +121,19 @@ struct ili9341_config {
>   	const struct drm_display_mode mode;
>   	/* ca: TODO: need comments for this register */
>   	u8 ca[ILI9341_CA_LEN];
> -	/* power_b: TODO: need comments for this register */
> +	/* power_b: Power control B (CFh) */
>   	u8 power_b[ILI9341_POWER_B_LEN];
> -	/* power_seq: TODO: need comments for this register */
> +	/* power_seq: Power on sequence control (EDh) */
>   	u8 power_seq[ILI9341_POWER_SEQ_LEN];
> -	/* dtca: TODO: need comments for this register */
> +	/* dtca: Driver timing control A (E8h) */
>   	u8 dtca[ILI9341_DTCA_LEN];
> -	/* dtcb: TODO: need comments for this register */
> +	/* dtcb: Driver timing control B (EAh) */
>   	u8 dtcb[ILI9341_DTCB_LEN];
> -	/* power_a: TODO: need comments for this register */
> +	/* power_a: Power control A (CBh) */
>   	u8 power_a[ILI9341_POWER_A_LEN];
>   	/* frc: Frame Rate Control (In Normal Mode/Full Colors) (B1h) */
>   	u8 frc[ILI9341_FRC_LEN];
> -	/* prc: TODO: need comments for this register */
> +	/* prc: Pump ratio control (F7h) */
>   	u8 prc;
>   	/* dfc_1: B6h DISCTRL (Display Function Control) */
>   	u8 dfc_1[ILI9341_DFC_1_LEN];
> @@ -147,7 +147,7 @@ struct ili9341_config {
>   	u8 vcom_2;
>   	/* address_mode: Memory Access Control (36h) */
>   	u8 address_mode;
> -	/* g3amma_en: TODO: need comments for this register */
> +	/* g3amma_en: Enable 3G (F2h) */
>   	u8 g3amma_en;
>   	/* rgb_interface: RGB Interface Signal Control (B0h) */
>   	u8 rgb_interface;
> --
> 2.34.1
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
