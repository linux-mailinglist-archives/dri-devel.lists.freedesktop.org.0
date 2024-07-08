Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 912B492A2FB
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 14:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CBFE10E251;
	Mon,  8 Jul 2024 12:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="z22KA5p7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F1710E33D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 12:39:45 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-42665be6916so7496185e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 05:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720442384; x=1721047184; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=mMnzgQzbLnKBd86eXIXGNAPcyZsn83VkPZ3CDQuP6FI=;
 b=z22KA5p7Oas7DI88WaDxCpBsQVvki0Q0twUzFSOam+fySrumQO4m2f+wCrwvPLVbVY
 m/h8Y836soV7uSf8y8oh1cjSCxEfHge3Q8ZhmF/L6s1E1u3EfklC0X4DM5JRMdWzcrbp
 6BDuCBdR0MJ0x8TNS2E8n02mwbeBDnk1yTvovlx8mxF4vkdML56dbfm5oAgENk6c7qBz
 VCoqnsKku0v3z48m4AqICJFFm5k6oRW4lzVmgrtK4tRe9hRrVA5BCs49/ebqzQludUaT
 YBMAb91TvmWNZMddHfU/GVglaoqngrHQOZAxBo0orTv7a2Skk34FTRyAMD/zTPx7q1g8
 BCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720442384; x=1721047184;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=mMnzgQzbLnKBd86eXIXGNAPcyZsn83VkPZ3CDQuP6FI=;
 b=WVOBXiVTWIPBwa2idsvOVfoRjM5SY6qk8cWK/eNruuA01pmZzAVLy6O8kX6uih54mk
 wlQg63Sx+BfOFJXc02VSmOUiTHxX4xK7KzSJJCwLBIepOlI0ZB21IiJMGlH4oIRNAaHN
 vuneWbRfp72SCYgKSev9zinZT/zXrFdFzpL51PmWv8C1Sm/OYIjbQQRn3fOzINgAx1/U
 rIJ8v7KW7uhwlFVWP4fjUMc5GXhI6crp6uMCJe696vFyx347HZMd3O2XVO7ypdFuF+gS
 gxIFZzpA89W+b/SIeB63XuMN4Td979DsJqzTpw/KyxfbrmE4zctLSf/NEFTcsaoJhR1r
 UmAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqoNz4rr6wOKjBH/VTcb9lLzDCycp+OdlQPBnrfRjmc9gt9s2uGiTEkJzN5AXGE7v0XxB/W5pDUBO/CSuN2DYYTQ2HpVKdC69aCyFAzCA3
X-Gm-Message-State: AOJu0Yy9OORfACcJLPHmBcy0SqcJ+tQlRa6FVddjwxz7MQ/nOjNz4kTZ
 3HYHNxtdFIKysVD0MVwuxn0LM+Fk0iaYMCY6muY4SVEgrEFuWZA5m855ihIkvy0=
X-Google-Smtp-Source: AGHT+IF+xVRbezrp3kHSmQCXaAZQyFu7mLcep9GiVcMts+AxUpGWFZOBcV+iFf4PCOWhSjZs+97Zbg==
X-Received: by 2002:a05:600c:510b:b0:426:686f:7ad with SMTP id
 5b1f17b1804b1-426686f09a5mr27390275e9.10.1720442383908; 
 Mon, 08 Jul 2024 05:39:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:f482:8fc6:e8d0:6d7c?
 ([2a01:e0a:cad:2140:f482:8fc6:e8d0:6d7c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a2518f9sm165059635e9.31.2024.07.08.05.39.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 05:39:43 -0700 (PDT)
Message-ID: <a64fdf95-9b9c-4ee5-878a-21a71a2dd5ad@linaro.org>
Date: Mon, 8 Jul 2024 14:39:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 3/3] drm/panel: himax-hx8394: Add Support for Microchip
 AC40T08A MIPI Display Panel
To: Manikandan Muralidharan <manikandan.m@microchip.com>, megi@xff.cz,
 javierm@redhat.com, quic_jesszhan@quicinc.com, sam@ravnborg.org,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240701085837.50855-1-manikandan.m@microchip.com>
 <20240701085837.50855-4-manikandan.m@microchip.com>
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
In-Reply-To: <20240701085837.50855-4-manikandan.m@microchip.com>
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

On 01/07/2024 10:58, Manikandan Muralidharan wrote:
> Add support for the Microchip AC40T08A MIPI Display panel. This panel uses
> a Himax HX8394 display controller and requires a vendor provided init
> sequence. The display resolution is 720x1280@60Hz with width and height
> of 76mm and 132mm respectively.
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>   drivers/gpu/drm/panel/panel-himax-hx8394.c | 151 +++++++++++++++++++++
>   1 file changed, 151 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
> index d0e44f1f85d9..bf6bac5d5c12 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
> @@ -339,6 +339,156 @@ static const struct hx8394_panel_desc powkiddy_x55_desc = {
>   	.init_sequence = powkiddy_x55_init_sequence,
>   };
>   
> +static int mchp_ac40t08a_init_sequence(struct hx8394 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> +
> +	/* DCS commands do not seem to be sent correclty without this delay */
> +	msleep(20);
> +
> +	/* 5.19.8 SETEXTC: Set extension command (B9h) */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETEXTC,
> +			       0xff, 0x83, 0x94);
> +
> +	/* 5.19.9 SETMIPI: Set MIPI control (BAh) */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETMIPI,
> +			       0x63, 0x03, 0x68, 0x6b, 0xb2, 0xc0);
> +
> +	/* 5.19.2 SETPOWER: Set power (B1h) */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETPOWER,
> +			       0x48, 0x12, 0x72, 0x09, 0x32, 0x54,
> +			       0x71, 0x71, 0x57, 0x47);
> +
> +	/* 5.19.3 SETDISP: Set display related register (B2h) */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETDISP,
> +			       0x00, 0x80, 0x64, 0x0c, 0x0d, 0x2f);
> +
> +	/* 5.19.4 SETCYC: Set display waveform cycles (B4h) */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETCYC,
> +			       0x73, 0x74, 0x73, 0x74, 0x73, 0x74,
> +			       0x01, 0x0c, 0x86, 0x75, 0x00, 0x3f,
> +			       0x73, 0x74, 0x73, 0x74, 0x73, 0x74,
> +			       0x01, 0x0c, 0x86);
> +
> +	/* 5.19.5 SETVCOM: Set VCOM voltage (B6h) */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETVCOM,
> +			       0x6e, 0x6e);
> +
> +	/* 5.19.19 SETGIP0: Set GIP Option0 (D3h) */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP0,
> +			       0x00, 0x00, 0x07, 0x07, 0x40, 0x07,
> +			       0x0c, 0x00, 0x08, 0x10, 0x08, 0x00,
> +			       0x08, 0x54, 0x15, 0x0a, 0x05, 0x0a,
> +			       0x02, 0x15, 0x06, 0x05, 0x06, 0x47,
> +			       0x44, 0x0a, 0x0a, 0x4b, 0x10, 0x07,
> +			       0x07, 0x0c, 0x40);
> +
> +	/* 5.19.20 Set GIP Option1 (D5h) */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP1,
> +			       0x1c, 0x1c, 0x1d, 0x1d, 0x00, 0x01,
> +			       0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
> +			       0x08, 0x09, 0x0a, 0x0b, 0x24, 0x25,
> +			       0x18, 0x18, 0x26, 0x27, 0x18, 0x18,
> +			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
> +			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
> +			       0x18, 0x18, 0x20, 0x21, 0x18, 0x18,
> +			       0x18, 0x18);
> +
> +	/* 5.19.21 Set GIP Option2 (D6h) */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP2,
> +			       0x1c, 0x1c, 0x1d, 0x1d, 0x07, 0x06,
> +			       0x05, 0x04, 0x03, 0x02, 0x01, 0x00,
> +			       0x0b, 0x0a, 0x09, 0x08, 0x21, 0x20,
> +			       0x18, 0x18, 0x27, 0x26, 0x18, 0x18,
> +			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
> +			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
> +			       0x18, 0x18, 0x25, 0x24, 0x18, 0x18,
> +			       0x18, 0x18);
> +
> +	/* 5.19.25 SETGAMMA: Set gamma curve related setting (E0h) */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGAMMA,
> +			       0x00, 0x0a, 0x15, 0x1b, 0x1e, 0x21,
> +			       0x24, 0x22, 0x47, 0x56, 0x65, 0x66,
> +			       0x6e, 0x82, 0x88, 0x8b, 0x9a, 0x9d,
> +			       0x98, 0xa8, 0xb9, 0x5d, 0x5c, 0x61,
> +			       0x66, 0x6a, 0x6f, 0x7f, 0x7f, 0x00,
> +			       0x0a, 0x15, 0x1b, 0x1e, 0x21, 0x24,
> +			       0x22, 0x47, 0x56, 0x65, 0x65, 0x6e,
> +			       0x81, 0x87, 0x8b, 0x98, 0x9d, 0x99,
> +			       0xa8, 0xba, 0x5d, 0x5d, 0x62, 0x67,
> +			       0x6b, 0x72, 0x7f, 0x7f);
> +
> +	/* Unknown command, not listed in the HX8394-F datasheet (C0H) */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN1,
> +			       0x1f, 0x73);
> +
> +	/* Set CABC control (C9h)*/
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETCABC,
> +			       0x76, 0x00, 0x30);
> +
> +	/* 5.19.17 SETPANEL (CCh) */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETPANEL,
> +			       0x0b);
> +
> +	/* Unknown command, not listed in the HX8394-F datasheet (D4h) */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN3,
> +			       0x02);
> +
> +	/* 5.19.11 Set register bank (BDh) */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
> +			       0x02);
> +
> +	/* 5.19.11 Set register bank (D8h) */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN4,
> +			       0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +			       0xff, 0xff, 0xff, 0xff, 0xff, 0xff);
> +
> +	/* 5.19.11 Set register bank (BDh) */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
> +			       0x00);
> +
> +	/* 5.19.11 Set register bank (BDh) */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
> +			       0x01);
> +
> +	/* 5.19.2 SETPOWER: Set power (B1h) */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETPOWER,
> +			       0x00);
> +
> +	/* 5.19.11 Set register bank (BDh) */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
> +			       0x00);
> +
> +	/* Unknown command, not listed in the HX8394-F datasheet (C6h) */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN2,
> +			       0xed);
> +
> +	return 0;
> +}
> +
> +static const struct drm_display_mode mchp_ac40t08a_mode = {
> +	.hdisplay    = 720,
> +	.hsync_start = 720 + 12,
> +	.hsync_end   = 720 + 12 + 24,
> +	.htotal	     = 720 + 12 + 12 + 24,
> +	.vdisplay    = 1280,
> +	.vsync_start = 1280 + 13,
> +	.vsync_end   = 1280 + 14,
> +	.vtotal	     = 1280 + 14 + 13,
> +	.clock	     = 60226,
> +	.flags	     = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +	.width_mm    = 76,
> +	.height_mm   = 132,
> +};
> +
> +static const struct hx8394_panel_desc mchp_ac40t08a_desc = {
> +	.mode = &mchp_ac40t08a_mode,
> +	.lanes = 4,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.init_sequence = mchp_ac40t08a_init_sequence,
> +};
> +
>   static int hx8394_enable(struct drm_panel *panel)
>   {
>   	struct hx8394 *ctx = panel_to_hx8394(panel);
> @@ -556,6 +706,7 @@ static void hx8394_remove(struct mipi_dsi_device *dsi)
>   static const struct of_device_id hx8394_of_match[] = {
>   	{ .compatible = "hannstar,hsd060bhw4", .data = &hsd060bhw4_desc },
>   	{ .compatible = "powkiddy,x55-panel", .data = &powkiddy_x55_desc },
> +	{ .compatible = "microchip,ac40t08a-mipi-panel", .data = &mchp_ac40t08a_desc },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, hx8394_of_match);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
