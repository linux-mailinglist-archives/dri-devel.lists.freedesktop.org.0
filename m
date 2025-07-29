Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C47B14AFC
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 11:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A0710E03F;
	Tue, 29 Jul 2025 09:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QK0ug/lh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C96510E03F
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 09:17:13 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-45600581226so53307955e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 02:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753780632; x=1754385432; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=d60OURvTslskqUGqUM8qPLgQLo0x++CgR9duN5Eh1VM=;
 b=QK0ug/lhpGqLAugkn0XdSce3Zwz15q9fo0diqt76FFceopHa/tX3WaxBFLeVi1uVwm
 JuPll2PhQIzt5DVIQl3HAyu+vOqFzqWQPbmb/7Eh7Q53YNMRnjjXzUmuU9hTN1uc/rNi
 74tP2Fc8t5aHPPYE/Q8UxTUo0LFUbm2Z72VQTB8EtQ8bm7ZgusBAkYQn0wnSyhLCZY4o
 1ktYpvF4Xbz53aQ/hwZnlJZ9Fk85UUOldgTwwf7P1olBgVmCC0wg65A7lTfkdGpFsaW/
 Jdi11MqRM/hDGtt/ePQ7B4+bITZ4pE7SPLXP2t3WWkomXSO011e3prr2ivPdNpvLWFFt
 QWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753780632; x=1754385432;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=d60OURvTslskqUGqUM8qPLgQLo0x++CgR9duN5Eh1VM=;
 b=iot3LhB3A3ISFYm+9mGUNe4jbbnsgYoJKk3YUGGdgmZmhPNhEorUa4giJBsCjdBK/Q
 TWbYbpLNAAPqK+xgpsFZNVPY+ILdkIgKc36Ub7c69M8X8eC2pHuW1yL/AP7i20OerX1P
 NCWvyX1jfcPrwIYOU83gq+dhUOUsxLMZ/qMZ6ZtbtR+9HCnV5xI+WpoTfv73a8ntiTi7
 GsmD5VgtqCkb4IqFl2/Bu9isQ17mG1AxcupnWFoTuIR6djBuAyLF2JAnnq484tAKAsxL
 yUmUSeSbNpyxZRRf5jWbXtNwxu4cVMqOqaJRHBVH5CHT4pLbH4NVO7o7bal08zIrdYhF
 2cKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6WzjpIU7reT1ugfVEpR4jbaf9OH/5FC3UOi8AEDUsFk67Go2fXkXfYCHyH7vxyudS1VnTMhAkQKM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxozRzvTb6G4aYWzmryOYggw9F9iOfK6dV0HVezfg09hKJrqWdF
 oDvosjY/nM7BLYNR6mWvMkWXuwjaQsrXPrLcky0NfweneCwdndQjdOG8w5tvlmK3/Lw=
X-Gm-Gg: ASbGnctSkxxBJDiuRsgyhm4wXuSCEb/3zXYZy51xiQ9ourTYiUBujEDatTQW4zHpZMz
 G2Bwbbr0vlpa+JU8dmE8BxLavfEVw92znicb40TQXoOPVK917TGB1k8LWNDPaHOk2zDm+zAoN4W
 C8dx92kGKsygI57ayem7HYg3Tqf6uDyqHa28JCOOh3zvROkZBYKp9OlOGAdVMrCmNj6/1Rj6UWc
 pDArVA2NVe5Oo8QrfI/BohIXnNVKFWjl7SehVTLZKvVDkxertOhICWyfrH1HnkcPobyYmYoMwb7
 ZCp4u7cc1vVTjCCq9uLTeaX+iU+9IE6N6o50IYMaXou95gWMsC6yuBBuY+lINT6ptJpyfL0XQcA
 JCFiyxp8Os3J/7HnyGx4uZrUC+4iLdR3aJJdJf0C+Ndi0eooNwonP3m5Z3X8KjOK8PLVgo56q
X-Google-Smtp-Source: AGHT+IHy8IlF5EsVFcN+ZeaLeXgccCzDTIMzFkralNzOHDs6W5E1jDZ+/O6pm9Q3S5ZwVCt98dtyVw==
X-Received: by 2002:a05:600c:1c07:b0:456:2397:817 with SMTP id
 5b1f17b1804b1-4587c530cc4mr82620185e9.13.1753780632006; 
 Tue, 29 Jul 2025 02:17:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3ae8:20b:c783:9328?
 ([2a01:e0a:3d9:2080:3ae8:20b:c783:9328])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458705376d2sm187799235e9.3.2025.07.29.02.17.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 02:17:11 -0700 (PDT)
Message-ID: <8cbbf5f8-84b4-43af-89b9-0ee4bc0a2591@linaro.org>
Date: Tue, 29 Jul 2025 11:17:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 1/3] drm/panel: novatek-nt35560: Fix invalid return
 value
To: Brigham Campbell <me@brighamcampbell.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linus.walleij@linaro.org,
 jessica.zhang@oss.qualcomm.com, sam@ravnborg.org
Cc: dianders@chromium.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250729054435.1209156-1-me@brighamcampbell.com>
 <20250729054435.1209156-2-me@brighamcampbell.com>
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
In-Reply-To: <20250729054435.1209156-2-me@brighamcampbell.com>
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

On 29/07/2025 07:44, Brigham Campbell wrote:
> Fix bug in nt35560_set_brightness() which causes the function to
> erroneously report an error. mipi_dsi_dcs_write() returns either a
> negative value when an error occurred or a positive number of bytes
> written when no error occurred. The buggy code reports an error under
> either condition.
> 
> Fixes: 7835ed6a9e86 ("drm/panel-sony-acx424akp: Modernize backlight handling")
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>   drivers/gpu/drm/panel/panel-novatek-nt35560.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35560.c b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
> index 98f0782c8411..17898a29efe8 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt35560.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
> @@ -161,7 +161,7 @@ static int nt35560_set_brightness(struct backlight_device *bl)
>   		par = 0x00;
>   		ret = mipi_dsi_dcs_write(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY,
>   					 &par, 1);
> -		if (ret) {
> +		if (ret < 0) {
>   			dev_err(nt->dev, "failed to disable display backlight (%d)\n", ret);
>   			return ret;
>   		}

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
