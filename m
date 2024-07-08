Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F24D92A2EC
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 14:38:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E8710E04C;
	Mon,  8 Jul 2024 12:38:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="j3XgzGaN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B33710E04C
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 12:38:37 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-42573d3f7e4so26739105e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 05:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720442316; x=1721047116; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=KaJW3HvKxNqVBLDwr+Z97qDaSgrCG2UbGmzOpX1s2SM=;
 b=j3XgzGaNQjIj8RmS6pm/RwjmwMaJp4Fol0ZAkeAwQuyLvKPoDe8EA59r7rZHSs1sgE
 skD5SjK4fTgh6q6t5U6pnzcF/Uw/HyUsiCmV2ocRGQ9n9sBdOLPrJWpb6Qqs9iXVQmtR
 efWdmhHrGWkQGMfKmeeJO/DWmL1FaKD+KuXY9YWB62YGsPNsrAl8YKmWL4MIG4c2JGY/
 X23sxJDlG6ufES4J5r78phbJgqPqhzTICGU8CIIQptWZnuD3vHYj3kLNAxPneAavAecx
 eKC9kOFsJakYr8J3/+R0BBRzJ8nNPnbe/pG6hR4GF985D4pbvVRo0JH6guXqz8zrxAvm
 /sbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720442316; x=1721047116;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=KaJW3HvKxNqVBLDwr+Z97qDaSgrCG2UbGmzOpX1s2SM=;
 b=lKGTZ5kx/PP1hsVvcQOAZf4Xgxk10ZLbiTJpOmXxKUyqdW/jpukNEkRPJkkugQt1z3
 Oa/7tFgIDIoIHFQO2axTcrN2lLFLObMKGKgjA25OFnL2GkcCuhZbKi4rcWhkYXGhEkzX
 DHcHYEovdQKYM8TOk910QX7b5Q+SCHemHnTtevkxaz8VlW9rd0+EA1k6pfkNW1ikLOph
 DVbRt4T506GDMLvFRb8p5dJzOlxr0rATOm8SnZ2ErYi0wlqFjQHJCfXKV5xWoTaYQwkK
 AblGNEAEQ8eMQS6PaDvX8k9RssRzLgLgFyeMKMZm3de0jS9fRzLCTrOZPz5AEk8mDkYw
 w4mg==
X-Gm-Message-State: AOJu0Yz6msgzvpmYNVHosZ10o6uNnECve2z2y4Pa94eSYh3hwr+vfyQB
 QVloXPGXfJnDXYs27QK+iCE2ULDZDoEN/O0DBkBQS1dJ7Ix/fLuH3WYQBGW88jI=
X-Google-Smtp-Source: AGHT+IGJ0wnPGPW00Hz/cr3B39knS1brYR02EbUfCMF4OGLAjfR0Wgck5I6r+I7MtVCkDKL8M/cT9w==
X-Received: by 2002:a05:600c:524b:b0:426:622d:9e6b with SMTP id
 5b1f17b1804b1-426622d9ea8mr33176545e9.23.1720442315561; 
 Mon, 08 Jul 2024 05:38:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:f482:8fc6:e8d0:6d7c?
 ([2a01:e0a:cad:2140:f482:8fc6:e8d0:6d7c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266c3650f4sm24577855e9.1.2024.07.08.05.38.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 05:38:35 -0700 (PDT)
Message-ID: <c8daf725-5558-460b-8d52-5a69d4895a9d@linaro.org>
Date: Mon, 8 Jul 2024 14:38:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v5 3/5] drm/panel: boe-th101mb31ig002: use wrapped MIPI
 DCS functions
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>,
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 airlied@gmail.com, daniel@ffwll.ch, mripard@kernel.org, dianders@google.com,
 hsinyi@google.com, awarnecke002@hotmail.com, quic_jesszhan@quicinc.com,
 dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240704072958.27876-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240704072958.27876-4-lvzhaoxiong@huaqin.corp-partner.google.com>
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
In-Reply-To: <20240704072958.27876-4-lvzhaoxiong@huaqin.corp-partner.google.com>
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

On 04/07/2024 09:29, Zhaoxiong Lv wrote:
> Remove conditional code and always use mipi_dsi_dcs_*multi() wrappers to
> simplify driver's init/enable/exit code.
> 
> Convert the hex in init_code from UPPERCASE to lowercase.
> 
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> ---
>   .../drm/panel/panel-boe-th101mb31ig002-28a.c  | 143 ++++++++----------
>   1 file changed, 63 insertions(+), 80 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
> index 9f225c15b21c..736bfba607cf 100644
> --- a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
> +++ b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
> @@ -17,11 +17,13 @@
>   #include <drm/drm_modes.h>
>   #include <drm/drm_panel.h>
>   
> +struct boe_th101mb31ig002;
> +
>   struct panel_desc {
>   	const struct drm_display_mode *modes;
>   	unsigned long mode_flags;
>   	enum mipi_dsi_pixel_format format;
> -	const struct panel_init_cmd *init_cmds;
> +	int (*init)(struct boe_th101mb31ig002 *ctx);
>   	unsigned int lanes;
>   };
>   
> @@ -49,74 +51,61 @@ static void boe_th101mb31ig002_reset(struct boe_th101mb31ig002 *ctx)
>   	usleep_range(5000, 6000);
>   }
>   
> -static int boe_th101mb31ig002_enable(struct drm_panel *panel)
> +static int boe_th101mb31ig002_enable(struct boe_th101mb31ig002 *ctx)
>   {
> -	struct boe_th101mb31ig002 *ctx = container_of(panel,
> -						      struct boe_th101mb31ig002,
> -						      panel);
> -	struct mipi_dsi_device *dsi = ctx->dsi;
> -	struct device *dev = &dsi->dev;
> -	int ret;
> -
> -	mipi_dsi_dcs_write_seq(dsi, 0xE0, 0xAB, 0xBA);
> -	mipi_dsi_dcs_write_seq(dsi, 0xE1, 0xBA, 0xAB);
> -	mipi_dsi_dcs_write_seq(dsi, 0xB1, 0x10, 0x01, 0x47, 0xFF);
> -	mipi_dsi_dcs_write_seq(dsi, 0xB2, 0x0C, 0x14, 0x04, 0x50, 0x50, 0x14);
> -	mipi_dsi_dcs_write_seq(dsi, 0xB3, 0x56, 0x53, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, 0xB4, 0x33, 0x30, 0x04);
> -	mipi_dsi_dcs_write_seq(dsi, 0xB6, 0xB0, 0x00, 0x00, 0x10, 0x00, 0x10,
> -				    0x00);
> -	mipi_dsi_dcs_write_seq(dsi, 0xB8, 0x05, 0x12, 0x29, 0x49, 0x48, 0x00,
> -				    0x00);
> -	mipi_dsi_dcs_write_seq(dsi, 0xB9, 0x7C, 0x65, 0x55, 0x49, 0x46, 0x36,
> -				    0x3B, 0x24, 0x3D, 0x3C, 0x3D, 0x5C, 0x4C,
> -				    0x55, 0x47, 0x46, 0x39, 0x26, 0x06, 0x7C,
> -				    0x65, 0x55, 0x49, 0x46, 0x36, 0x3B, 0x24,
> -				    0x3D, 0x3C, 0x3D, 0x5C, 0x4C, 0x55, 0x47,
> -				    0x46, 0x39, 0x26, 0x06);
> -	mipi_dsi_dcs_write_seq(dsi, 0x00, 0xFF, 0x87, 0x12, 0x34, 0x44, 0x44,
> -				    0x44, 0x44, 0x98, 0x04, 0x98, 0x04, 0x0F,
> -				    0x00, 0x00, 0xC1);
> -	mipi_dsi_dcs_write_seq(dsi, 0xC1, 0x54, 0x94, 0x02, 0x85, 0x9F, 0x00,
> -				    0x7F, 0x00, 0x54, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, 0xC2, 0x17, 0x09, 0x08, 0x89, 0x08, 0x11,
> -				    0x22, 0x20, 0x44, 0xFF, 0x18, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, 0xC3, 0x86, 0x46, 0x05, 0x05, 0x1C, 0x1C,
> -				    0x1D, 0x1D, 0x02, 0x1F, 0x1F, 0x1E, 0x1E,
> -				    0x0F, 0x0F, 0x0D, 0x0D, 0x13, 0x13, 0x11,
> -				    0x11, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, 0xC4, 0x07, 0x07, 0x04, 0x04, 0x1C, 0x1C,
> -				    0x1D, 0x1D, 0x02, 0x1F, 0x1F, 0x1E, 0x1E,
> -				    0x0E, 0x0E, 0x0C, 0x0C, 0x12, 0x12, 0x10,
> -				    0x10, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, 0xC6, 0x2A, 0x2A);
> -	mipi_dsi_dcs_write_seq(dsi, 0xC8, 0x21, 0x00, 0x31, 0x42, 0x34, 0x16);
> -	mipi_dsi_dcs_write_seq(dsi, 0xCA, 0xCB, 0x43);
> -	mipi_dsi_dcs_write_seq(dsi, 0xCD, 0x0E, 0x4B, 0x4B, 0x20, 0x19, 0x6B,
> -				    0x06, 0xB3);
> -	mipi_dsi_dcs_write_seq(dsi, 0xD2, 0xE3, 0x2B, 0x38, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, 0xD4, 0x00, 0x01, 0x00, 0x0E, 0x04, 0x44,
> -				    0x08, 0x10, 0x00, 0x00, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, 0xE6, 0x80, 0x01, 0xFF, 0xFF, 0xFF, 0xFF,
> -				    0xFF, 0xFF);
> -	mipi_dsi_dcs_write_seq(dsi, 0xF0, 0x12, 0x03, 0x20, 0x00, 0xFF);
> -	mipi_dsi_dcs_write_seq(dsi, 0xF3, 0x00);
> -
> -	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> -		return ret;
> -	}
> -
> -	msleep(120);
> -
> -	ret = mipi_dsi_dcs_set_display_on(dsi);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to set panel on: %d\n", ret);
> -		return ret;
> -	}
> -
> -	return 0;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0xab, 0xba);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe1, 0xba, 0xab);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb1, 0x10, 0x01, 0x47, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb2, 0x0c, 0x14, 0x04, 0x50, 0x50, 0x14);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb3, 0x56, 0x53, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb4, 0x33, 0x30, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb6, 0xb0, 0x00, 0x00, 0x10, 0x00, 0x10,
> +					       0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb8, 0x05, 0x12, 0x29, 0x49, 0x48, 0x00,
> +					       0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb9, 0x7c, 0x65, 0x55, 0x49, 0x46, 0x36,
> +					       0x3b, 0x24, 0x3d, 0x3c, 0x3d, 0x5c, 0x4c,
> +					       0x55, 0x47, 0x46, 0x39, 0x26, 0x06, 0x7c,
> +					       0x65, 0x55, 0x49, 0x46, 0x36, 0x3b, 0x24,
> +					       0x3d, 0x3c, 0x3d, 0x5c, 0x4c, 0x55, 0x47,
> +					       0x46, 0x39, 0x26, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0xff, 0x87, 0x12, 0x34, 0x44, 0x44,
> +					       0x44, 0x44, 0x98, 0x04, 0x98, 0x04, 0x0f,
> +					       0x00, 0x00, 0xc1);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc1, 0x54, 0x94, 0x02, 0x85, 0x9f, 0x00,
> +					       0x7f, 0x00, 0x54, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc2, 0x17, 0x09, 0x08, 0x89, 0x08, 0x11,
> +					       0x22, 0x20, 0x44, 0xff, 0x18, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc3, 0x86, 0x46, 0x05, 0x05, 0x1c, 0x1c,
> +					       0x1d, 0x1d, 0x02, 0x1f, 0x1f, 0x1e, 0x1e,
> +					       0x0f, 0x0f, 0x0d, 0x0d, 0x13, 0x13, 0x11,
> +					       0x11, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc4, 0x07, 0x07, 0x04, 0x04, 0x1c, 0x1c,
> +					       0x1d, 0x1d, 0x02, 0x1f, 0x1f, 0x1e, 0x1e,
> +					       0x0e, 0x0e, 0x0c, 0x0c, 0x12, 0x12, 0x10,
> +					       0x10, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc6, 0x2a, 0x2a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc8, 0x21, 0x00, 0x31, 0x42, 0x34, 0x16);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xca, 0xcb, 0x43);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcd, 0x0e, 0x4b, 0x4b, 0x20, 0x19, 0x6b,
> +					       0x06, 0xb3);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd2, 0xe3, 0x2b, 0x38, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd4, 0x00, 0x01, 0x00, 0x0e, 0x04, 0x44,
> +					       0x08, 0x10, 0x00, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe6, 0x80, 0x01, 0xff, 0xff, 0xff, 0xff,
> +					       0xff, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x12, 0x03, 0x20, 0x00, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf3, 0x00);
> +
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +
> +	return dsi_ctx.accum_err;
>   }
>   
>   static int boe_th101mb31ig002_disable(struct drm_panel *panel)
> @@ -124,21 +113,15 @@ static int boe_th101mb31ig002_disable(struct drm_panel *panel)
>   	struct boe_th101mb31ig002 *ctx = container_of(panel,
>   						      struct boe_th101mb31ig002,
>   						      panel);
> -	struct mipi_dsi_device *dsi = ctx->dsi;
> -	struct device *dev = &dsi->dev;
> -	int ret;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
>   
> -	ret = mipi_dsi_dcs_set_display_off(dsi);
> -	if (ret < 0)
> -		dev_err(dev, "Failed to set panel off: %d\n", ret);
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
>   
> -	msleep(120);
> +	mipi_dsi_msleep(&dsi_ctx, 120);
>   
> -	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> -	if (ret < 0)
> -		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
>   
> -	return 0;
> +	return dsi_ctx.accum_err;
>   }
>   
>   static int boe_th101mb31ig002_unprepare(struct drm_panel *panel)
> @@ -201,7 +184,7 @@ static const struct panel_desc boe_th101mb31ig002_desc = {
>   	.mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
>   			  MIPI_DSI_MODE_NO_EOT_PACKET |
>   			  MIPI_DSI_MODE_LPM,
> -	.init_cmds = boe_th101mb31ig002_enable,
> +	.init = boe_th101mb31ig002_enable,
>   };
>   
>   static int boe_th101mb31ig002_get_modes(struct drm_panel *panel,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
