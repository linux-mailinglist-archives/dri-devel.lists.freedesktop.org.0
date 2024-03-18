Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C575E87E55A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 10:01:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA5B10F4CE;
	Mon, 18 Mar 2024 09:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zZS5zypA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C370A10F4CE
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 09:01:40 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-41413f7b2dfso1668425e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 02:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710752499; x=1711357299; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=2gULtKUS8fx5juUHYeaIl+QplRjpdITgHYagcovp62Q=;
 b=zZS5zypAuH8cQqEy9EMJLfQNHRVAtrFEyKPB9gih7yFbK1WOLsvLxqDl+k7LKdOLlO
 ogJrd2Vst3I1iRfu66ijnBsOjur45p5APfl4WrXgYZcb7vOAifr1krTD83RRHB2V3PBq
 qI47/rImycxbNn5TWxcI0HwoAiGI5MkpKKcb8ws44TaIXihyGOjwdGmbLajhGtj4DGn6
 FOw3g/sEBnClrQQjeteOjblsw6+a7QJ9DqHLSGvSjfmPQLKSsaZx2Ge7qtM3K1kS6lNW
 fWI6A+T7KOGmkqJx4amiQxOFzkeBNgzAX46/wETYyQv3Dyrt5oqZdrVQMLm/CpgMFc0e
 YICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710752499; x=1711357299;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=2gULtKUS8fx5juUHYeaIl+QplRjpdITgHYagcovp62Q=;
 b=UxZI33q7EJaY2iv4aYwrVVt6+Fs/os/woPWY6XtdGs83yxHBQrUwLv5BlY1mLn5FQl
 9uR+sOtDHAGyw1ynmwet7VibmFsaw8TZi3vmPe1tkMVp5m4hoWymBo1XPHcVMV+t62E4
 Xs+Ft5X36n9xupqS/MTrt1AtCvpSwfZgOpdMTutQGOHqHYUOM/DCLKh0D+lRldNtD4xP
 LsRQNjtSn3yJPHI1/M9LppusLj+WrdjH83cpCDlyHCGuxCCq8HBMnRHl93Uxd9vRNWsG
 mF6kVXz6xBp4LZqOan+Q97tdYE8edWGhYrWjDR+VJJA21Xaol9bwVC9yBbTDC9pACbAZ
 p8jQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVAXC87GK/DXySDGOYAtUVmQs1MbMkT4ZfmCJV7bWQ1oaxE4YlHW5qSLjbrqMr8M0FriOox4gAYctmSL4BQY/XKeOC2+I97x+BGZV+agJA
X-Gm-Message-State: AOJu0YwiBG0jfMWVwKo1giXnnnluExzhZul1Q0j9XkZQtUR39p4PU2QI
 xwROdq3/RtyP+aewFbrQExqCeSsfBZ7SCHikW2uPQcwqd06Y1sPmXfBLI44+8AA=
X-Google-Smtp-Source: AGHT+IGMo6jgBi9PkbRliQ2ogEexFAeVvbC/mcVH1I5DnSGfomh2YtAXhnEbvnkfyA+PVvh/h6YEDA==
X-Received: by 2002:a05:600c:6b11:b0:414:132e:b485 with SMTP id
 jn17-20020a05600c6b1100b00414132eb485mr701623wmb.27.1710752498881; 
 Mon, 18 Mar 2024 02:01:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ad2b:a316:59d9:3dbc?
 ([2a01:e0a:982:cbb0:ad2b:a316:59d9:3dbc])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a05600c474900b0041408af4b34sm6722459wmo.10.2024.03.18.02.01.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 02:01:38 -0700 (PDT)
Message-ID: <3f1f54ac-cb4a-463d-b930-dbd9eaac43c5@linaro.org>
Date: Mon, 18 Mar 2024 10:01:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel: ilitek-ili9881c: Add Startek
 KD050HDFIA020-C020A support
Content-Language: en-US, fr
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg
 <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240317155746.23034-1-laurent.pinchart@ideasonboard.com>
 <20240317155746.23034-3-laurent.pinchart@ideasonboard.com>
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
Organization: Linaro Developer Services
In-Reply-To: <20240317155746.23034-3-laurent.pinchart@ideasonboard.com>
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

On 17/03/2024 16:57, Laurent Pinchart wrote:
> Add support for the Startek KD050HDFIA020-C020A panel.
> 
> The init table comes from the Compulab BSP ([1]).
> 
> [1] https://github.com/compulab-yokneam/meta-bsp-imx8mp/blob/ucm-imx8m-plus-r1.1/recipes-kernel/linux/compulab/imx8mp/0000-compulab-imx8m-plus-Add-boards-support.patch
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 222 ++++++++++++++++++
>   1 file changed, 222 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> index 2ffe5f68a890..80b386f91320 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> @@ -455,6 +455,202 @@ static const struct ili9881c_instr k101_im2byl02_init[] = {
>   	ILI9881C_COMMAND_INSTR(0xD3, 0x3F), /* VN0 */
>   };
>   
> +static const struct ili9881c_instr kd050hdfia020_init[] = {
> +	ILI9881C_SWITCH_PAGE_INSTR(3),
> +	ILI9881C_COMMAND_INSTR(0x01, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x02, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x03, 0x72),
> +	ILI9881C_COMMAND_INSTR(0x04, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x05, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x06, 0x09),
> +	ILI9881C_COMMAND_INSTR(0x07, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x08, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x09, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x0a, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x0b, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x0c, 0x01),
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
> +	ILI9881C_COMMAND_INSTR(0x1e, 0x40),
> +	ILI9881C_COMMAND_INSTR(0x1f, 0x80),
> +	ILI9881C_COMMAND_INSTR(0x20, 0x05),
> +	ILI9881C_COMMAND_INSTR(0x20, 0x05),
> +	ILI9881C_COMMAND_INSTR(0x21, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x22, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x23, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x24, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x25, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x26, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x27, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x28, 0x33),
> +	ILI9881C_COMMAND_INSTR(0x29, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x2a, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x2b, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x2c, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x2d, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x2e, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x2f, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x30, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x31, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x32, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x32, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x33, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x34, 0x04),
> +	ILI9881C_COMMAND_INSTR(0x35, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x36, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x37, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x38, 0x3C),
> +	ILI9881C_COMMAND_INSTR(0x39, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3a, 0x40),
> +	ILI9881C_COMMAND_INSTR(0x3b, 0x40),
> +	ILI9881C_COMMAND_INSTR(0x3c, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3d, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3e, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3f, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x40, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x41, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x42, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x43, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x44, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x50, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x51, 0x23),
> +	ILI9881C_COMMAND_INSTR(0x52, 0x45),
> +	ILI9881C_COMMAND_INSTR(0x53, 0x67),
> +	ILI9881C_COMMAND_INSTR(0x54, 0x89),
> +	ILI9881C_COMMAND_INSTR(0x55, 0xab),
> +	ILI9881C_COMMAND_INSTR(0x56, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x57, 0x23),
> +	ILI9881C_COMMAND_INSTR(0x58, 0x45),
> +	ILI9881C_COMMAND_INSTR(0x59, 0x67),
> +	ILI9881C_COMMAND_INSTR(0x5a, 0x89),
> +	ILI9881C_COMMAND_INSTR(0x5b, 0xab),
> +	ILI9881C_COMMAND_INSTR(0x5c, 0xcd),
> +	ILI9881C_COMMAND_INSTR(0x5d, 0xef),
> +	ILI9881C_COMMAND_INSTR(0x5e, 0x11),
> +	ILI9881C_COMMAND_INSTR(0x5f, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x60, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x61, 0x15),
> +	ILI9881C_COMMAND_INSTR(0x62, 0x14),
> +	ILI9881C_COMMAND_INSTR(0x63, 0x0E),
> +	ILI9881C_COMMAND_INSTR(0x64, 0x0F),
> +	ILI9881C_COMMAND_INSTR(0x65, 0x0C),
> +	ILI9881C_COMMAND_INSTR(0x66, 0x0D),
> +	ILI9881C_COMMAND_INSTR(0x67, 0x06),
> +	ILI9881C_COMMAND_INSTR(0x68, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x69, 0x07),
> +	ILI9881C_COMMAND_INSTR(0x6a, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x6b, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x6c, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x6d, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x6e, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x6f, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x70, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x71, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x72, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x73, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x74, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x75, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x76, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x77, 0x14),
> +	ILI9881C_COMMAND_INSTR(0x78, 0x15),
> +	ILI9881C_COMMAND_INSTR(0x79, 0x0E),
> +	ILI9881C_COMMAND_INSTR(0x7a, 0x0F),
> +	ILI9881C_COMMAND_INSTR(0x7b, 0x0C),
> +	ILI9881C_COMMAND_INSTR(0x7c, 0x0D),
> +	ILI9881C_COMMAND_INSTR(0x7d, 0x06),
> +	ILI9881C_COMMAND_INSTR(0x7e, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x7f, 0x07),
> +	ILI9881C_COMMAND_INSTR(0x80, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x81, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x83, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x84, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x85, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x86, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x87, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x88, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x89, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x8A, 0x02),
> +	ILI9881C_SWITCH_PAGE_INSTR(0x4),
> +	ILI9881C_COMMAND_INSTR(0x6C, 0x15),
> +	ILI9881C_COMMAND_INSTR(0x6E, 0x2A),
> +	ILI9881C_COMMAND_INSTR(0x6F, 0x33),
> +	ILI9881C_COMMAND_INSTR(0x3A, 0x94),
> +	ILI9881C_COMMAND_INSTR(0x8D, 0x15),
> +	ILI9881C_COMMAND_INSTR(0x87, 0xBA),
> +	ILI9881C_COMMAND_INSTR(0x26, 0x76),
> +	ILI9881C_COMMAND_INSTR(0xB2, 0xD1),
> +	ILI9881C_COMMAND_INSTR(0xB5, 0x06),
> +	ILI9881C_SWITCH_PAGE_INSTR(0x1),
> +	ILI9881C_COMMAND_INSTR(0x22, 0x0A),
> +	ILI9881C_COMMAND_INSTR(0x31, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x53, 0x90),
> +	ILI9881C_COMMAND_INSTR(0x55, 0xA2),
> +	ILI9881C_COMMAND_INSTR(0x50, 0xB7),
> +	ILI9881C_COMMAND_INSTR(0x51, 0xB7),
> +	ILI9881C_COMMAND_INSTR(0x60, 0x22),
> +	ILI9881C_COMMAND_INSTR(0x61, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x62, 0x19),
> +	ILI9881C_COMMAND_INSTR(0x63, 0x10),
> +	ILI9881C_COMMAND_INSTR(0xA0, 0x08),
> +	ILI9881C_COMMAND_INSTR(0xA1, 0x1A),
> +	ILI9881C_COMMAND_INSTR(0xA2, 0x27),
> +	ILI9881C_COMMAND_INSTR(0xA3, 0x15),
> +	ILI9881C_COMMAND_INSTR(0xA4, 0x17),
> +	ILI9881C_COMMAND_INSTR(0xA5, 0x2A),
> +	ILI9881C_COMMAND_INSTR(0xA6, 0x1E),
> +	ILI9881C_COMMAND_INSTR(0xA7, 0x1F),
> +	ILI9881C_COMMAND_INSTR(0xA8, 0x8B),
> +	ILI9881C_COMMAND_INSTR(0xA9, 0x1B),
> +	ILI9881C_COMMAND_INSTR(0xAA, 0x27),
> +	ILI9881C_COMMAND_INSTR(0xAB, 0x78),
> +	ILI9881C_COMMAND_INSTR(0xAC, 0x18),
> +	ILI9881C_COMMAND_INSTR(0xAD, 0x18),
> +	ILI9881C_COMMAND_INSTR(0xAE, 0x4C),
> +	ILI9881C_COMMAND_INSTR(0xAF, 0x21),
> +	ILI9881C_COMMAND_INSTR(0xB0, 0x27),
> +	ILI9881C_COMMAND_INSTR(0xB1, 0x54),
> +	ILI9881C_COMMAND_INSTR(0xB2, 0x67),
> +	ILI9881C_COMMAND_INSTR(0xB3, 0x39),
> +	ILI9881C_COMMAND_INSTR(0xC0, 0x08),
> +	ILI9881C_COMMAND_INSTR(0xC1, 0x1A),
> +	ILI9881C_COMMAND_INSTR(0xC2, 0x27),
> +	ILI9881C_COMMAND_INSTR(0xC3, 0x15),
> +	ILI9881C_COMMAND_INSTR(0xC4, 0x17),
> +	ILI9881C_COMMAND_INSTR(0xC5, 0x2A),
> +	ILI9881C_COMMAND_INSTR(0xC6, 0x1E),
> +	ILI9881C_COMMAND_INSTR(0xC7, 0x1F),
> +	ILI9881C_COMMAND_INSTR(0xC8, 0x8B),
> +	ILI9881C_COMMAND_INSTR(0xC9, 0x1B),
> +	ILI9881C_COMMAND_INSTR(0xCA, 0x27),
> +	ILI9881C_COMMAND_INSTR(0xCB, 0x78),
> +	ILI9881C_COMMAND_INSTR(0xCC, 0x18),
> +	ILI9881C_COMMAND_INSTR(0xCD, 0x18),
> +	ILI9881C_COMMAND_INSTR(0xCE, 0x4C),
> +	ILI9881C_COMMAND_INSTR(0xCF, 0x21),
> +	ILI9881C_COMMAND_INSTR(0xD0, 0x27),
> +	ILI9881C_COMMAND_INSTR(0xD1, 0x54),
> +	ILI9881C_COMMAND_INSTR(0xD2, 0x67),
> +	ILI9881C_COMMAND_INSTR(0xD3, 0x39),
> +	ILI9881C_SWITCH_PAGE_INSTR(0),
> +	ILI9881C_COMMAND_INSTR(0x35, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3A, 0x7),
> +};
> +
>   static const struct ili9881c_instr tl050hdv35_init[] = {
>   	ILI9881C_SWITCH_PAGE_INSTR(3),
>   	ILI9881C_COMMAND_INSTR(0x01, 0x00),
> @@ -1177,6 +1373,23 @@ static const struct drm_display_mode k101_im2byl02_default_mode = {
>   	.height_mm	= 217,
>   };
>   
> +static const struct drm_display_mode kd050hdfia020_default_mode = {
> +	.clock		= 62000,
> +
> +	.hdisplay	= 720,
> +	.hsync_start	= 720 + 10,
> +	.hsync_end	= 720 + 10 + 20,
> +	.htotal		= 720 + 10 + 20 + 30,
> +
> +	.vdisplay	= 1280,
> +	.vsync_start	= 1280 + 10,
> +	.vsync_end	= 1280 + 10 + 10,
> +	.vtotal		= 1280 + 10 + 10 + 20,
> +
> +	.width_mm	= 62,
> +	.height_mm	= 110,
> +};
> +
>   static const struct drm_display_mode tl050hdv35_default_mode = {
>   	.clock		= 59400,
>   
> @@ -1345,6 +1558,14 @@ static const struct ili9881c_desc k101_im2byl02_desc = {
>   	.mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
>   };
>   
> +static const struct ili9881c_desc kd050hdfia020_desc = {
> +	.init = kd050hdfia020_init,
> +	.init_length = ARRAY_SIZE(kd050hdfia020_init),
> +	.mode = &kd050hdfia020_default_mode,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> +		      MIPI_DSI_MODE_LPM,
> +};
> +
>   static const struct ili9881c_desc tl050hdv35_desc = {
>   	.init = tl050hdv35_init,
>   	.init_length = ARRAY_SIZE(tl050hdv35_init),
> @@ -1372,6 +1593,7 @@ static const struct ili9881c_desc am8001280g_desc = {
>   static const struct of_device_id ili9881c_of_match[] = {
>   	{ .compatible = "bananapi,lhr050h41", .data = &lhr050h41_desc },
>   	{ .compatible = "feixin,k101-im2byl02", .data = &k101_im2byl02_desc },
> +	{ .compatible = "startek,kd050hdfia020", .data = &kd050hdfia020_desc },
>   	{ .compatible = "tdo,tl050hdv35", .data = &tl050hdv35_desc },
>   	{ .compatible = "wanchanglong,w552946aba", .data = &w552946aba_desc },
>   	{ .compatible = "ampire,am8001280g", .data = &am8001280g_desc },

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
