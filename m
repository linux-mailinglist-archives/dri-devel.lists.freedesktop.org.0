Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABECC69B4F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 14:50:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B82710E4B4;
	Tue, 18 Nov 2025 13:50:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gxJXT2RR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF25D10E4B2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 13:50:40 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-42b3d7c1321so3980219f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 05:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763473839; x=1764078639; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=dY87Qd6K9FmYpUIN2v9FDUk/qdoG5fxW/x7OSqsCn3w=;
 b=gxJXT2RRaBrm/UUlmzCaho+OuiAS6eZ7y1dxqGBBaqmcYvyKXXaMKZgW5E5HMrrew0
 zRDvF2P4hihy0kDLploky7u8gJIBA7P3O8Eca7NjG1Ofh7BkbjvCbwADthximqIPII/1
 n6+qhtK116yaaR+QDZne56VHU5KXOTeqZ9qqmzIz8MwG1X+VhcgBIW57rAIr6WDvjvDY
 xmjBG9O9pfZXu/meYdZ7L5J7W4qrEdJNuxeKK2tIj+G1iRFYUoihefTB2WWoq4AeuLU1
 PiW8ZKbNZ648Z/fMNCcEW1ebB6Dgu/QJchXTz0NL1rtDZA8Hz+fuWsf4XqiznyDr0tMJ
 OeIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763473839; x=1764078639;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dY87Qd6K9FmYpUIN2v9FDUk/qdoG5fxW/x7OSqsCn3w=;
 b=HMectYqK8b+u/D5RmNdb9dFqtoBuq2vGmh2l+gyRKV7AzNran0/gW/lhY02oFYVTSe
 9yTxq9PWiRBHq89OezAmd/53jNTmwemj4wMOjYpCTaBeuLGsZLCF9lp0squ1pvebTbhB
 IdeZqVRsJAbQ4wfkedLC3yqNgE6Pm3I6rrAOl4vLB2OjMLpDONB5/yNeT4zVfIHCRIeZ
 jag1/mSpx71CiBgbPAL1u9H0lsD1KdVkbTuIMJD8sh8QOrmqGUTUeEPzAsm9CYc1qmI4
 O6TS5PsSG/LBoIXNm+Zrcw6ZojldmOgiQUjwLtfvFNHJtCFzd4tn6/uyJX/Kiq7DAdge
 IeDA==
X-Gm-Message-State: AOJu0YxkiTzM5xXM8WvDKCteZokPoehXbfxw2Qu/Y1HHmrmQ4g9r7kNe
 pW/647Wfw5AAm8kMnflXKQT2kSlWue+m3/klJziXwydzRMBK8TZi909JsljOJuoF6Sg=
X-Gm-Gg: ASbGncsnr1VcgQ4q8BTpOX4QOHD3KofUdOHM++SCoGCtwUAsWvJjZP1eZplQKtnLFE3
 KIX2rH+2wvC0gpykHXFf215Fno39hFfmWCKFbQyYu244YgfcGCQ/dvKQSFY/OhtICmvNHuWSIKe
 27pApIi0X3H86vZAre2WIwpMLSewSQ6i4FY3ym6Voswhq9/PNInl9HPj/QxAAUw6JEWAvfODad8
 RKkaoUNg99ncOlseoRRnXKZ8PdA3wySgzVYuvsOcpWkRlnYzjVQNJaVOpCE389X3ITMZAVlNz4H
 Ttbt0PEODkfr8p44VGXahJkF54aQLD5/9Ucz5oKmkhvGyvXFWQMocBjtxGLkvX3O2cnWCMDlB+w
 dE50tBII9T+zAcLK9sUcrBf2b/dCdGc10ltSvZjbkdXnGFau/p74u6YAmzNCcZzgJk/UgJzQwK9
 omBVIUeSbQeH01pfpXT7sr8V0xw4mjqt9UecunVK5PMBAq1rha1+NqMhzKCtH+J0M=
X-Google-Smtp-Source: AGHT+IHO7NgHAvMoNL+Vwr0gsrbLBbRzB68mfS+LYvq/Q1H/ixopITAemFG2PunekaEBn/eSbVurMg==
X-Received: by 2002:a05:6000:24c7:b0:428:52c7:feae with SMTP id
 ffacd0b85a97d-42b593869b1mr16288107f8f.32.1763473839029; 
 Tue, 18 Nov 2025 05:50:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:366e:5264:fffe:1c49?
 ([2a01:e0a:3d9:2080:366e:5264:fffe:1c49])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53e85e6fsm32359458f8f.18.2025.11.18.05.50.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 05:50:38 -0800 (PST)
Message-ID: <e21760e8-4eaf-4181-a328-5d0d205b7ae0@linaro.org>
Date: Tue, 18 Nov 2025 14:50:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5/9] drm/panel: ilitek-ili9881d: Add support for
 Wanchanglong W552946AAA panel
To: Chaoyi Chen <kernel@airkyi.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
References: <20251106020632.92-1-kernel@airkyi.com>
 <20251106020632.92-6-kernel@airkyi.com>
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
In-Reply-To: <20251106020632.92-6-kernel@airkyi.com>
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

On 11/6/25 03:06, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> W552946AAA is a panel by Wanchanglong. This panel utilizes the
> Ilitek ILI9881D controller.
> 
> W552946AAA is similar to W552946ABA, but the W552946AAA only
> uses 2 lanes.
> 
> Tested on rk3506g-evb1-v10.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 225 ++++++++++++++++++
>   1 file changed, 225 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> index ad4993b2f92a..9b3e9450808d 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> @@ -820,6 +820,204 @@ static const struct ili9881c_instr tl050hdv35_init[] = {
>   	ILI9881C_COMMAND_INSTR(0xd3, 0x39),
>   };
>   
> +static const struct ili9881c_instr w552946aaa_init[] = {
> +	ILI9881C_SWITCH_PAGE_INSTR(3),
> +	ILI9881C_COMMAND_INSTR(0x01, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x02, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x03, 0x53),
> +	ILI9881C_COMMAND_INSTR(0x04, 0x53),
> +	ILI9881C_COMMAND_INSTR(0x05, 0x13),
> +	ILI9881C_COMMAND_INSTR(0x06, 0x04),
> +	ILI9881C_COMMAND_INSTR(0x07, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x08, 0x02),
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
> +	ILI9881C_COMMAND_INSTR(0x15, 0x08),
> +	ILI9881C_COMMAND_INSTR(0x16, 0x10),
> +	ILI9881C_COMMAND_INSTR(0x17, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x18, 0x08),
> +	ILI9881C_COMMAND_INSTR(0x19, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x1a, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x1b, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x1c, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x1d, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x1e, 0xc0),
> +	ILI9881C_COMMAND_INSTR(0x1f, 0x80),
> +	ILI9881C_COMMAND_INSTR(0x20, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x21, 0x09),
> +	ILI9881C_COMMAND_INSTR(0x22, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x23, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x24, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x25, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x26, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x27, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x28, 0x55),
> +	ILI9881C_COMMAND_INSTR(0x29, 0x03),
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
> +	ILI9881C_COMMAND_INSTR(0x35, 0x05),
> +	ILI9881C_COMMAND_INSTR(0x36, 0x05),
> +	ILI9881C_COMMAND_INSTR(0x37, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x38, 0x3c),
> +	ILI9881C_COMMAND_INSTR(0x39, 0x35),
> +	ILI9881C_COMMAND_INSTR(0x3a, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3b, 0x40),
> +	ILI9881C_COMMAND_INSTR(0x3c, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3d, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3e, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3f, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x40, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x41, 0x88),
> +	ILI9881C_COMMAND_INSTR(0x42, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x43, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x44, 0x1f),
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
> +	ILI9881C_COMMAND_INSTR(0x5e, 0x03),
> +	ILI9881C_COMMAND_INSTR(0x5f, 0x14),
> +	ILI9881C_COMMAND_INSTR(0x60, 0x15),
> +	ILI9881C_COMMAND_INSTR(0x61, 0x0c),
> +	ILI9881C_COMMAND_INSTR(0x62, 0x0d),
> +	ILI9881C_COMMAND_INSTR(0x63, 0x0e),
> +	ILI9881C_COMMAND_INSTR(0x64, 0x0f),
> +	ILI9881C_COMMAND_INSTR(0x65, 0x10),
> +	ILI9881C_COMMAND_INSTR(0x66, 0x11),
> +	ILI9881C_COMMAND_INSTR(0x67, 0x08),
> +	ILI9881C_COMMAND_INSTR(0x68, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x69, 0x0a),
> +	ILI9881C_COMMAND_INSTR(0x6a, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x6b, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x6c, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x6d, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x6e, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x6f, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x70, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x71, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x72, 0x06),
> +	ILI9881C_COMMAND_INSTR(0x73, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x74, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x75, 0x14),
> +	ILI9881C_COMMAND_INSTR(0x76, 0x15),
> +	ILI9881C_COMMAND_INSTR(0x77, 0x0f),
> +	ILI9881C_COMMAND_INSTR(0x78, 0x0e),
> +	ILI9881C_COMMAND_INSTR(0x79, 0x0d),
> +	ILI9881C_COMMAND_INSTR(0x7a, 0x0c),
> +	ILI9881C_COMMAND_INSTR(0x7b, 0x11),
> +	ILI9881C_COMMAND_INSTR(0x7c, 0x10),
> +	ILI9881C_COMMAND_INSTR(0x7d, 0x06),
> +	ILI9881C_COMMAND_INSTR(0x7e, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x7f, 0x0a),
> +	ILI9881C_COMMAND_INSTR(0x80, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x81, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x82, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x83, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x84, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x85, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x86, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x87, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x88, 0x08),
> +	ILI9881C_COMMAND_INSTR(0x89, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x8a, 0x02),
> +	ILI9881C_SWITCH_PAGE_INSTR(4),
> +	ILI9881C_COMMAND_INSTR(0x00, 0x80),
> +	ILI9881C_COMMAND_INSTR(0x70, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x71, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x66, 0xfe),
> +	ILI9881C_COMMAND_INSTR(0x82, 0x15),
> +	ILI9881C_COMMAND_INSTR(0x84, 0x15),
> +	ILI9881C_COMMAND_INSTR(0x85, 0x15),
> +	ILI9881C_COMMAND_INSTR(0x3a, 0x24),
> +	ILI9881C_COMMAND_INSTR(0x32, 0xac),
> +	ILI9881C_COMMAND_INSTR(0x8c, 0x80),
> +	ILI9881C_COMMAND_INSTR(0x3c, 0xf5),
> +	ILI9881C_COMMAND_INSTR(0x88, 0x33),
> +	ILI9881C_SWITCH_PAGE_INSTR(1),
> +	ILI9881C_COMMAND_INSTR(0x22, 0x0a),
> +	ILI9881C_COMMAND_INSTR(0x31, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x53, 0x78),
> +	ILI9881C_COMMAND_INSTR(0x55, 0x7b),
> +	ILI9881C_COMMAND_INSTR(0x60, 0x20),
> +	ILI9881C_COMMAND_INSTR(0x61, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x62, 0x0d),
> +	ILI9881C_COMMAND_INSTR(0x63, 0x00),
> +	ILI9881C_COMMAND_INSTR(0xa0, 0x00),
> +	ILI9881C_COMMAND_INSTR(0xa1, 0x10),
> +	ILI9881C_COMMAND_INSTR(0xa2, 0x1c),
> +	ILI9881C_COMMAND_INSTR(0xa3, 0x13),
> +	ILI9881C_COMMAND_INSTR(0xa4, 0x15),
> +	ILI9881C_COMMAND_INSTR(0xa5, 0x26),
> +	ILI9881C_COMMAND_INSTR(0xa6, 0x1a),
> +	ILI9881C_COMMAND_INSTR(0xa7, 0x1d),
> +	ILI9881C_COMMAND_INSTR(0xa8, 0x67),
> +	ILI9881C_COMMAND_INSTR(0xa9, 0x1c),
> +	ILI9881C_COMMAND_INSTR(0xaa, 0x29),
> +	ILI9881C_COMMAND_INSTR(0xab, 0x5b),
> +	ILI9881C_COMMAND_INSTR(0xac, 0x26),
> +	ILI9881C_COMMAND_INSTR(0xad, 0x28),
> +	ILI9881C_COMMAND_INSTR(0xae, 0x5c),
> +	ILI9881C_COMMAND_INSTR(0xaf, 0x30),
> +	ILI9881C_COMMAND_INSTR(0xb0, 0x31),
> +	ILI9881C_COMMAND_INSTR(0xb1, 0x32),
> +	ILI9881C_COMMAND_INSTR(0xb2, 0x00),
> +	ILI9881C_COMMAND_INSTR(0xb1, 0x2e),
> +	ILI9881C_COMMAND_INSTR(0xb2, 0x32),
> +	ILI9881C_COMMAND_INSTR(0xb3, 0x00),
> +	ILI9881C_COMMAND_INSTR(0xb6, 0x02),
> +	ILI9881C_COMMAND_INSTR(0xb7, 0x03),
> +	ILI9881C_COMMAND_INSTR(0xc0, 0x00),
> +	ILI9881C_COMMAND_INSTR(0xc1, 0x10),
> +	ILI9881C_COMMAND_INSTR(0xc2, 0x1c),
> +	ILI9881C_COMMAND_INSTR(0xc3, 0x13),
> +	ILI9881C_COMMAND_INSTR(0xc4, 0x15),
> +	ILI9881C_COMMAND_INSTR(0xc5, 0x26),
> +	ILI9881C_COMMAND_INSTR(0xc6, 0x1a),
> +	ILI9881C_COMMAND_INSTR(0xc7, 0x1d),
> +	ILI9881C_COMMAND_INSTR(0xc8, 0x67),
> +	ILI9881C_COMMAND_INSTR(0xc9, 0x1c),
> +	ILI9881C_COMMAND_INSTR(0xca, 0x29),
> +	ILI9881C_COMMAND_INSTR(0xcb, 0x5b),
> +	ILI9881C_COMMAND_INSTR(0xcc, 0x26),
> +	ILI9881C_COMMAND_INSTR(0xcd, 0x28),
> +	ILI9881C_COMMAND_INSTR(0xce, 0x5c),
> +	ILI9881C_COMMAND_INSTR(0xcf, 0x30),
> +	ILI9881C_COMMAND_INSTR(0xd0, 0x31),
> +	ILI9881C_COMMAND_INSTR(0xd1, 0x2e),
> +	ILI9881C_COMMAND_INSTR(0xd2, 0x32),
> +	ILI9881C_COMMAND_INSTR(0xd3, 0x00),
> +	ILI9881C_SWITCH_PAGE_INSTR(0),
> +};
> +
>   static const struct ili9881c_instr w552946ab_init[] = {
>   	ILI9881C_SWITCH_PAGE_INSTR(3),
>   	ILI9881C_COMMAND_INSTR(0x01, 0x00),
> @@ -1772,6 +1970,23 @@ static const struct drm_display_mode tl050hdv35_default_mode = {
>   	.height_mm	= 110,
>   };
>   
> +static const struct drm_display_mode w552946aaa_default_mode = {
> +	.clock		= 65000,
> +
> +	.hdisplay	= 720,
> +	.hsync_start	= 720 + 52,
> +	.hsync_end	= 720 + 52 + 8,
> +	.htotal		= 720 + 52 + 8 + 48,
> +
> +	.vdisplay	= 1280,
> +	.vsync_start	= 1280 + 16,
> +	.vsync_end	= 1280 + 16 + 6,
> +	.vtotal		= 1280 + 16 + 6 + 15,
> +
> +	.width_mm	= 68,
> +	.height_mm	= 121,
> +};
> +
>   static const struct drm_display_mode w552946aba_default_mode = {
>   	.clock		= 64000,
>   
> @@ -1983,6 +2198,15 @@ static const struct ili9881c_desc tl050hdv35_desc = {
>   	.default_address_mode = 0x03,
>   };
>   
> +static const struct ili9881c_desc w552946aaa_desc = {
> +	.init = w552946aaa_init,
> +	.init_length = ARRAY_SIZE(w552946aaa_init),
> +	.mode = &w552946aaa_default_mode,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +		      MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
> +	.lanes = 2,
> +};
> +
>   static const struct ili9881c_desc w552946aba_desc = {
>   	.init = w552946ab_init,
>   	.init_length = ARRAY_SIZE(w552946ab_init),
> @@ -2023,6 +2247,7 @@ static const struct of_device_id ili9881c_of_match[] = {
>   	{ .compatible = "feixin,k101-im2byl02", .data = &k101_im2byl02_desc },
>   	{ .compatible = "startek,kd050hdfia020", .data = &kd050hdfia020_desc },
>   	{ .compatible = "tdo,tl050hdv35", .data = &tl050hdv35_desc },
> +	{ .compatible = "wanchanglong,w552946aaa", .data = &w552946aaa_desc },
>   	{ .compatible = "wanchanglong,w552946aba", .data = &w552946aba_desc },
>   	{ .compatible = "ampire,am8001280g", .data = &am8001280g_desc },
>   	{ .compatible = "raspberrypi,dsi-7inch", &rpi_7inch_desc },

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
