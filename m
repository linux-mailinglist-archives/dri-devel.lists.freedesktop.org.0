Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 092B2B1A5A0
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 17:16:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF3410E566;
	Mon,  4 Aug 2025 15:16:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PwMqqowu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B33010E566
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 15:16:34 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-459d62184c9so8602865e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 08:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754320592; x=1754925392; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=OSZPvv7Tv/o6wrsadccULFFTeGgqWHvCCUhxjgSXGeU=;
 b=PwMqqowuCgZUH15RnrGyfwlJywvRa4argpNiQ+4QfbYb5wsuCkdTDZyjhbrvAzyZ5v
 uBEW1IaFnSL9UBtdujmUvBbCXWB//lk8jJvDfpTDCj38jDwXKikUe9kT+6eb00kKkC9d
 +Ym5Qy99gtEfYeTE6Rhl3LqtBYHVYd+u4/9WPHBKuUzYzHuz+1luULPcpngkhtK6J17P
 eYVO114GaUFAy5jcTQfkSfwtfp/RWS21myatNkqu5emZ6pYl5RbhpU2fUSk6wZCZWvx2
 c2IzZrBHAbPeAtBqeDrXZU4CkCUCSiUKLSLwD5Exq2+tU8l+DA2GTE5S2+fEzuUi0hHc
 IU1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754320592; x=1754925392;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=OSZPvv7Tv/o6wrsadccULFFTeGgqWHvCCUhxjgSXGeU=;
 b=MFgEAuJzZw2HGRHXpXJWNFEFMuxYGDlPGBAowzdxqTgc+Pb27MZmjeY8NrETL1ahTG
 ww+R5/e7zkXozPsrp2P9DyZNQSnCpPKlcG4Q8R7DyvWQDaLMaXfIffxibToNcFqPGhpR
 j8DiNA6bUJm7+IshVdlv4E8KcA+RKgfF7s3nzHDNqKAMPYiNKpnFj4gpZ1ygGXCnh5SK
 emIAc1NTG7FwY8bKpng1181zYzR2ZYDja/+ZszDxIVlBjTX+fN59NbcuUsd/tQymT7Lz
 /X5j+2TkgynnpQBmjNGSkUZgm9blqb842ktrh5MMapDljLH+2RECwUSiHDmd+RvuZRgf
 mQCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlX0tG/9OhoNdAjm+Lt/mD62l6uctGkDRC0nq7PoXLnZjb6ZeVLfBzuUbnWYRlQWeE5IvigJy0ViA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0sgrnnWenOEyfwPAlfJsHi1vvUTYUKRzu2JCG2QA9G1edziTy
 y6bcLl9HWuMMZTBTSi/qHFoMnum0ryBdSFpVy6fCo2EWJyUSVjBU2CKZc/xnlWxjyTQ=
X-Gm-Gg: ASbGncuVO2Yftpy3IGxKhj8THKj9o1M+93uBXXjKPNpzo9vdjl2I5SlkYu2wu3t0D9w
 0MMI2qT0UKPLXAn95F1CkRScqgCD7ykupSshMVBHw0i8whbnUWDhxH5ms9Uid1je+8MeWPKaZXf
 W9fU0p4n1/wIV76BElU3nxA7V7gQBaBC/JIhxm+DjrZA2/eUGiHHSVEjNPA4DRymPlLom5zTLe3
 RtUuVDHAPRXE7vRoG5+AK2G66XlGEvVXPayZk7cBFZjuy5Qs85G0DiszZfFzZzMwJHc+JfWWiSK
 tLAhuJ+gKNG+DlG6KGlF6Stp0hZUdNqc8r749pARS+BPR4RmLm2i5ag0R5Wy5UMWHKARxvNbROF
 YiLKSFp525w4EH8QE90itdGITHCzTscdfxFGcAvwk0wTRiGVMZymwKII/9JFS5P+R2BIK2Bzl+q
 I=
X-Google-Smtp-Source: AGHT+IFxuKH+nNMu2qV/i2wzQSOCFyQkJpi9CB3eOzRm6JIcvPsDKvvXkV75j7SnV7Bgq8DJnSJ4Yg==
X-Received: by 2002:a05:600c:3145:b0:43d:42b:e186 with SMTP id
 5b1f17b1804b1-458b69dd41cmr74958475e9.8.1754320592365; 
 Mon, 04 Aug 2025 08:16:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3030:f63e:fedd:700f?
 ([2a01:e0a:3d9:2080:3030:f63e:fedd:700f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4589ee57c18sm171568985e9.28.2025.08.04.08.16.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 08:16:32 -0700 (PDT)
Message-ID: <6053afaa-b7eb-4be3-8c57-717c40465bda@linaro.org>
Date: Mon, 4 Aug 2025 17:16:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 06/13] drm/panel: ilitek-ili9881c: Add Bestar
 BSD1218-A101KL68 support
To: Heiko Stuebner <heiko@sntech.de>
Cc: quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, hjc@rock-chips.com,
 andy.yan@rock-chips.com, andyshrk@163.com, nicolas.frattaroli@collabora.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20250707164906.1445288-1-heiko@sntech.de>
 <20250707164906.1445288-7-heiko@sntech.de>
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
In-Reply-To: <20250707164906.1445288-7-heiko@sntech.de>
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

On 07/07/2025 18:48, Heiko Stuebner wrote:
> Add support for the Bestar BSD1218-A101KL68 panel.
> 
> The init table comes from the Firefly BSP ([1]).
> 
> [1] https://gitlab.com/firefly-linux/kernel/-/blob/rk3588/firefly/arch/arm64/boot/dts/rockchip/aio-3588l-mipi101-BSD1218-A101KL68.dtsi
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 220 ++++++++++++++++++
>   1 file changed, 220 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> index 154eea5f4d77..3095a8bd1ebf 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> @@ -1223,6 +1223,200 @@ static const struct ili9881c_instr am8001280g_init[] = {
>   	ILI9881C_COMMAND_INSTR(MIPI_DCS_WRITE_POWER_SAVE, 0x00),
>   };
>   
> +static const struct ili9881c_instr bsd1218_a101kl68_init[] = {
> +	ILI9881C_SWITCH_PAGE_INSTR(3),
> +	ILI9881C_COMMAND_INSTR(0x01, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x02, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x03, 0x55),
> +	ILI9881C_COMMAND_INSTR(0x04, 0x55),
> +	ILI9881C_COMMAND_INSTR(0x05, 0x03),
> +	ILI9881C_COMMAND_INSTR(0x06, 0x06),
> +	ILI9881C_COMMAND_INSTR(0x07, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x08, 0x07),
> +	ILI9881C_COMMAND_INSTR(0x09, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x0a, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x0b, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x0c, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x0d, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x0e, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x0f, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x10, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x11, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x12, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x13, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x14, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x15, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x16, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x17, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x18, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x19, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x1a, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x1b, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x1c, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x1d, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x1e, 0xc0),
> +	ILI9881C_COMMAND_INSTR(0x1f, 0x80),
> +	ILI9881C_COMMAND_INSTR(0x20, 0x04),
> +	ILI9881C_COMMAND_INSTR(0x21, 0x03),
> +	ILI9881C_COMMAND_INSTR(0x22, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x23, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x24, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x25, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x26, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x27, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x28, 0x33),
> +	ILI9881C_COMMAND_INSTR(0x29, 0x33),
> +	ILI9881C_COMMAND_INSTR(0x2a, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x2b, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x2c, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x2d, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x2e, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x2f, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x30, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x31, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x32, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x33, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x34, 0x04),
> +	ILI9881C_COMMAND_INSTR(0x35, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x36, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x37, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x38, 0x3c),
> +	ILI9881C_COMMAND_INSTR(0x39, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3a, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3b, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3c, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3d, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3e, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3f, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x40, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x41, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x42, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x43, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x44, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x50, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x51, 0x11),
> +	ILI9881C_COMMAND_INSTR(0x52, 0x44),
> +	ILI9881C_COMMAND_INSTR(0x53, 0x55),
> +	ILI9881C_COMMAND_INSTR(0x54, 0x88),
> +	ILI9881C_COMMAND_INSTR(0x55, 0xab),
> +	ILI9881C_COMMAND_INSTR(0x56, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x57, 0x11),
> +	ILI9881C_COMMAND_INSTR(0x58, 0x22),
> +	ILI9881C_COMMAND_INSTR(0x59, 0x33),
> +	ILI9881C_COMMAND_INSTR(0x5a, 0x44),
> +	ILI9881C_COMMAND_INSTR(0x5b, 0x55),
> +	ILI9881C_COMMAND_INSTR(0x5c, 0x66),
> +	ILI9881C_COMMAND_INSTR(0x5d, 0x77),
> +	ILI9881C_COMMAND_INSTR(0x5e, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x5f, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x60, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x61, 0x0a),
> +	ILI9881C_COMMAND_INSTR(0x62, 0x09),
> +	ILI9881C_COMMAND_INSTR(0x63, 0x08),
> +	ILI9881C_COMMAND_INSTR(0x64, 0x13),
> +	ILI9881C_COMMAND_INSTR(0x65, 0x12),
> +	ILI9881C_COMMAND_INSTR(0x66, 0x11),
> +	ILI9881C_COMMAND_INSTR(0x67, 0x10),
> +	ILI9881C_COMMAND_INSTR(0x68, 0x0f),
> +	ILI9881C_COMMAND_INSTR(0x69, 0x0e),
> +	ILI9881C_COMMAND_INSTR(0x6a, 0x0d),
> +	ILI9881C_COMMAND_INSTR(0x6b, 0x0c),
> +	ILI9881C_COMMAND_INSTR(0x6c, 0x06),
> +	ILI9881C_COMMAND_INSTR(0x6d, 0x07),
> +	ILI9881C_COMMAND_INSTR(0x6e, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x6f, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x70, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x71, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x72, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x73, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x74, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x75, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x76, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x77, 0x0a),
> +	ILI9881C_COMMAND_INSTR(0x78, 0x06),
> +	ILI9881C_COMMAND_INSTR(0x79, 0x07),
> +	ILI9881C_COMMAND_INSTR(0x7a, 0x10),
> +	ILI9881C_COMMAND_INSTR(0x7b, 0x11),
> +	ILI9881C_COMMAND_INSTR(0x7c, 0x12),
> +	ILI9881C_COMMAND_INSTR(0x7d, 0x13),
> +	ILI9881C_COMMAND_INSTR(0x7e, 0x0c),
> +	ILI9881C_COMMAND_INSTR(0x7f, 0x0d),
> +	ILI9881C_COMMAND_INSTR(0x80, 0x0e),
> +	ILI9881C_COMMAND_INSTR(0x81, 0x0f),
> +	ILI9881C_COMMAND_INSTR(0x82, 0x09),
> +	ILI9881C_COMMAND_INSTR(0x83, 0x08),
> +	ILI9881C_COMMAND_INSTR(0x84, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x85, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x86, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x87, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x88, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x89, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x8a, 0x02),
> +
> +	ILI9881C_SWITCH_PAGE_INSTR(4),
> +	ILI9881C_COMMAND_INSTR(0x6e, 0x2a),
> +	ILI9881C_COMMAND_INSTR(0x6f, 0x37),
> +	ILI9881C_COMMAND_INSTR(0x3a, 0x24),
> +	ILI9881C_COMMAND_INSTR(0x8d, 0x19),
> +	ILI9881C_COMMAND_INSTR(0x87, 0xba),
> +	ILI9881C_COMMAND_INSTR(0xb2, 0xd1),
> +	ILI9881C_COMMAND_INSTR(0x88, 0x0b),
> +	ILI9881C_COMMAND_INSTR(0x38, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x39, 0x00),
> +	ILI9881C_COMMAND_INSTR(0xb5, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x31, 0x25),
> +	ILI9881C_COMMAND_INSTR(0x3b, 0x98),
> +
> +	ILI9881C_SWITCH_PAGE_INSTR(1),
> +	ILI9881C_COMMAND_INSTR(0x22, 0x0a),
> +	ILI9881C_COMMAND_INSTR(0x31, 0x0c),
> +	ILI9881C_COMMAND_INSTR(0x53, 0x40),
> +	ILI9881C_COMMAND_INSTR(0x55, 0x45),
> +	ILI9881C_COMMAND_INSTR(0x50, 0xb7),
> +	ILI9881C_COMMAND_INSTR(0x51, 0xb2),
> +	ILI9881C_COMMAND_INSTR(0x60, 0x07),
> +	ILI9881C_COMMAND_INSTR(0xa0, 0x22),
> +	ILI9881C_COMMAND_INSTR(0xa1, 0x3f),
> +	ILI9881C_COMMAND_INSTR(0xa2, 0x4e),
> +	ILI9881C_COMMAND_INSTR(0xa3, 0x17),
> +	ILI9881C_COMMAND_INSTR(0xa4, 0x1a),
> +	ILI9881C_COMMAND_INSTR(0xa5, 0x2d),
> +	ILI9881C_COMMAND_INSTR(0xa6, 0x21),
> +	ILI9881C_COMMAND_INSTR(0xa7, 0x22),
> +	ILI9881C_COMMAND_INSTR(0xa8, 0xc4),
> +	ILI9881C_COMMAND_INSTR(0xa9, 0x1b),
> +	ILI9881C_COMMAND_INSTR(0xaa, 0x25),
> +	ILI9881C_COMMAND_INSTR(0xab, 0xa7),
> +	ILI9881C_COMMAND_INSTR(0xac, 0x1a),
> +	ILI9881C_COMMAND_INSTR(0xad, 0x19),
> +	ILI9881C_COMMAND_INSTR(0xae, 0x4b),
> +	ILI9881C_COMMAND_INSTR(0xaf, 0x1f),
> +	ILI9881C_COMMAND_INSTR(0xb0, 0x2a),
> +	ILI9881C_COMMAND_INSTR(0xb1, 0x59),
> +	ILI9881C_COMMAND_INSTR(0xb2, 0x64),
> +	ILI9881C_COMMAND_INSTR(0xb3, 0x3f),
> +	ILI9881C_COMMAND_INSTR(0xc0, 0x22),
> +	ILI9881C_COMMAND_INSTR(0xc1, 0x48),
> +	ILI9881C_COMMAND_INSTR(0xc2, 0x59),
> +	ILI9881C_COMMAND_INSTR(0xc3, 0x15),
> +	ILI9881C_COMMAND_INSTR(0xc4, 0x15),
> +	ILI9881C_COMMAND_INSTR(0xc5, 0x28),
> +	ILI9881C_COMMAND_INSTR(0xc6, 0x1c),
> +	ILI9881C_COMMAND_INSTR(0xc7, 0x1e),
> +	ILI9881C_COMMAND_INSTR(0xc8, 0xc4),
> +	ILI9881C_COMMAND_INSTR(0xc9, 0x1c),
> +	ILI9881C_COMMAND_INSTR(0xca, 0x2b),
> +	ILI9881C_COMMAND_INSTR(0xcb, 0xa3),
> +	ILI9881C_COMMAND_INSTR(0xcc, 0x1f),
> +	ILI9881C_COMMAND_INSTR(0xcd, 0x1e),
> +	ILI9881C_COMMAND_INSTR(0xce, 0x52),
> +	ILI9881C_COMMAND_INSTR(0xcf, 0x24),
> +	ILI9881C_COMMAND_INSTR(0xd0, 0x2a),
> +	ILI9881C_COMMAND_INSTR(0xd1, 0x58),
> +	ILI9881C_COMMAND_INSTR(0xd2, 0x68),
> +	ILI9881C_COMMAND_INSTR(0xd3, 0x3f),
> +};
> +
>   static inline struct ili9881c *panel_to_ili9881c(struct drm_panel *panel)
>   {
>   	return container_of(panel, struct ili9881c, panel);
> @@ -1418,6 +1612,23 @@ static const struct drm_display_mode am8001280g_default_mode = {
>   	.height_mm	= 151,
>   };
>   
> +static const struct drm_display_mode bsd1218_a101kl68_default_mode = {
> +	.clock		= 70000,
> +
> +	.hdisplay	= 800,
> +	.hsync_start	= 800 + 40,
> +	.hsync_end	= 800 + 40 + 20,
> +	.htotal		= 800 + 40 + 20 + 20,
> +
> +	.vdisplay	= 1280,
> +	.vsync_start	= 1280 + 20,
> +	.vsync_end	= 1280 + 20 + 4,
> +	.vtotal		= 1280 + 20 + 4 + 20,
> +
> +	.width_mm	= 120,
> +	.height_mm	= 170,
> +};
> +
>   static int ili9881c_get_modes(struct drm_panel *panel,
>   			      struct drm_connector *connector)
>   {
> @@ -1576,8 +1787,17 @@ static const struct ili9881c_desc am8001280g_desc = {
>   		      MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
>   };
>   
> +static const struct ili9881c_desc bsd1218_a101kl68_desc = {
> +	.init = bsd1218_a101kl68_init,
> +	.init_length = ARRAY_SIZE(bsd1218_a101kl68_init),
> +	.mode = &bsd1218_a101kl68_default_mode,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +		      MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
> +};
> +
>   static const struct of_device_id ili9881c_of_match[] = {
>   	{ .compatible = "bananapi,lhr050h41", .data = &lhr050h41_desc },
> +	{ .compatible = "bestar,bsd1218-a101kl68", .data = &bsd1218_a101kl68_desc },
>   	{ .compatible = "feixin,k101-im2byl02", .data = &k101_im2byl02_desc },
>   	{ .compatible = "startek,kd050hdfia020", .data = &kd050hdfia020_desc },
>   	{ .compatible = "tdo,tl050hdv35", .data = &tl050hdv35_desc },

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
