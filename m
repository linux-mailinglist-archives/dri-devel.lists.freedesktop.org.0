Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B139A0599
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 11:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1012710E6E1;
	Wed, 16 Oct 2024 09:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dDN3gUpo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C6710E6E2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 09:34:00 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-37d518f9abcso3526014f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 02:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729071239; x=1729676039; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=XLRDJqmc8NcjOXjuLn9jZfnD6cz1I/JFtxl7/dfAntk=;
 b=dDN3gUporBKgCQEe2tya1MhomCYM4HM02mu99aSv19WqlwR5vwefSmNVmT3CarpRve
 yqrl+9giRRd0A6UVfZczdjul2LfOKVaiJ6TsmMI3bSKRZ0Jrfu5dUvREbtpE3zcTE5MV
 pxyU+hfpCLErO5/U76WvneYQ2ihjRoL2VSLYFiX4kMIucBhzPaTNjz0mlU6MGg/6kDAB
 5bltzJC9Aabjiy5dsVCgDVePbYVi86aJ1pb5wQeWgvaVwdyWvoOdDDm9g2jEN1Zmn+T+
 aoOYGD6opw3RjlXzj5UDU9Khyan4cBlL/EbAXwg4pHy7YnPD9Ili7cBIOfzG7y+xHlnB
 9nzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729071239; x=1729676039;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=XLRDJqmc8NcjOXjuLn9jZfnD6cz1I/JFtxl7/dfAntk=;
 b=DzLKXmshIJBdaXM3UNHu0mt+hdflrI51hB2+kaIhGN5JQ43FBlkraBxZNs2IVMm1J9
 TqybdAXmXhaRbuUfSrR5VdTIvCQ4lxBpffGbP4lW75psjAeUkjW7in+mbCl6vjU91Dge
 xS9+zjrVsJn+nlj0BnJz4KysrbYYp9DmN/rexywtRjD1MkK0NyWZJaRnwpNp/p0vohsZ
 xjQBL9xRs+r8wgDFnwerRHhc4gzng/SeHPH9Ape+yLUcPLuRoYBTVCPldteR/WbxyvFk
 gPEf/HfiDEyjwosUnWavC1rjMVJhu03s0TOKDzHxOBw6rVv3s0PVu/ODg/hOEJmqN4DH
 mRgQ==
X-Gm-Message-State: AOJu0YzJov2ViYbbyRRLjGyHvzrO6QdhGFCvSQK4zcvYnrXPp4D4A9Xt
 1n8KIcC9cQSl8+iunFI+iOCldddCJwtQsfsQ+Di2X5nHeWm7Ukv8GNJIqz25a/E=
X-Google-Smtp-Source: AGHT+IEjx0bAQBULzMRzu0eBnsQdvpo5K1moOj6IEzGHg+hhl+5pioKjTTT18L//SlgMpxd9yrtcmQ==
X-Received: by 2002:adf:ce83:0:b0:376:37e:2729 with SMTP id
 ffacd0b85a97d-37d86bda505mr2299518f8f.31.1729071238800; 
 Wed, 16 Oct 2024 02:33:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:fd09:f78e:726a:6fa2?
 ([2a01:e0a:982:cbb0:fd09:f78e:726a:6fa2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d7fbf8567sm3831076f8f.76.2024.10.16.02.33.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Oct 2024 02:33:58 -0700 (PDT)
Message-ID: <f682fe47-cee4-4f65-b787-995eed1bb74c@linaro.org>
Date: Wed, 16 Oct 2024 11:33:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5/6] drm/panel: panel-samsung-s6e63m0: Include
 <linux/property.h>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20241011144632.90434-1-tzimmermann@suse.de>
 <20241011144632.90434-6-tzimmermann@suse.de>
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
In-Reply-To: <20241011144632.90434-6-tzimmermann@suse.de>
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

On 11/10/2024 16:41, Thomas Zimmermann wrote:
> Include <linux/property.h> directly to get device_property_read_u32().
> Avoids the proxy include via <linux/backlight.h>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/panel/panel-samsung-s6e63m0.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
> index a0e5698275a5..6917ffda5b2b 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
> @@ -15,6 +15,7 @@
>   #include <linux/delay.h>
>   #include <linux/gpio/consumer.h>
>   #include <linux/module.h>
> +#include <linux/property.h>
>   #include <linux/regulator/consumer.h>
>   #include <linux/media-bus-format.h>
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
