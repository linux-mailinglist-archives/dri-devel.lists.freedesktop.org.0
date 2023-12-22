Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B4081C739
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 10:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0F310E780;
	Fri, 22 Dec 2023 09:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B15A10E780
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 09:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1703236679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rxx12Ow8etcgTYo8TFhIqtSHwFWel53/NDvAae+ByFo=;
 b=cQ2QgA/p4N7WdXa5VrTj/v+AtSEMbHX5ypIkYKGrfjQ0z2IGpmaHyNw6Af3TqSXVEQdvnG
 G87QMbyAjaytO6m4tvU51Srj+KZjKg3EA3VCr0TxMrcA11BBsF/ltG4+SteWO6yxgo5wC7
 N2S9tBRno/hZiQeFi+0dXg2Q/YA33n8=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-481-vsHZM-PDMhazK45Nuhf8LA-1; Fri, 22 Dec 2023 04:17:58 -0500
X-MC-Unique: vsHZM-PDMhazK45Nuhf8LA-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-50bfae5b114so1506978e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 01:17:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703236676; x=1703841476;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rxx12Ow8etcgTYo8TFhIqtSHwFWel53/NDvAae+ByFo=;
 b=RHUWga3d1R7C3ll46JIoqRd/fbCLgKRRRp1C3j+RssiKDmbqVgWemMIDojqLgFtwub
 bnNrO068Ni23+ryEwxe/zPd/BpSmHNUmn/ipeScULt9rwm2Av/LvKqtxWUi5/DF7DCNe
 KnIq04lhVtqpYuI1enLwkNFOk7x6N193qNm4KXWavVN96HIvlGR/UvzuPiKLFo4dYhSo
 Xjw8Cm28ZRTin/Pq27HLiRAcUw/dk6DVov+q5uuilBymPeOImUiFp8JJUGrDX30AGvqM
 wMSsQfMyfHlKUgzSq0RDvp5RKvAjwnxFnamKYtIrUmA319sdKn/hI7VFv4f2GZShtMeR
 Ibzw==
X-Gm-Message-State: AOJu0Yzg1aEMHqaeWyVm1TNQzkZSo84EPZcLd0GQJFMtHYQdP2U/LMtA
 Ps7XIzVmbOsAO7Ny2i6HjpImwxnVoD5tR4CFlQO1kSAvxztM+Vh354MjM+IsmwkjMujX4GDx5jr
 P0W42aD1XvXKNzspxskz+srKmGNAroeO9eTUY
X-Received: by 2002:a05:6512:3c8c:b0:50e:2b22:f8ef with SMTP id
 h12-20020a0565123c8c00b0050e2b22f8efmr350485lfv.157.1703236676317; 
 Fri, 22 Dec 2023 01:17:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFn8NUoimj6n/dd+ekFd81vZ/XTq0jBGFQgQTvFGu/QMWaOUIvd6dP4AxJep+XdpkG0AC/Rw==
X-Received: by 2002:a05:6512:3c8c:b0:50e:2b22:f8ef with SMTP id
 h12-20020a0565123c8c00b0050e2b22f8efmr350467lfv.157.1703236675823; 
 Fri, 22 Dec 2023 01:17:55 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a5d6744000000b00336710ddea0sm3827890wrw.59.2023.12.22.01.17.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Dec 2023 01:17:55 -0800 (PST)
Message-ID: <01cc7bd1-25d8-43ad-a305-05fcc81bfd22@redhat.com>
Date: Fri, 22 Dec 2023 10:17:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] drm/ssd130x: Add support for the SSD133x OLED
 controller family
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20231219203416.2299702-1-javierm@redhat.com>
 <20231219203416.2299702-5-javierm@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20231219203416.2299702-5-javierm@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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
Cc: Conor Dooley <conor@kernel.org>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 19/12/2023 21:34, Javier Martinez Canillas wrote:
> The Solomon SSD133x controllers (such as the SSD1331) are used by RGB dot
> matrix OLED panels, add a modesetting pipeline to support the chip family.
> 
> The SSD133x controllers support 256 (8-bit) and 65k (16-bit) color depths
> but only the former is implemented for now. This is because the 256 color
> depth format matches a fourcc code already present in DRM (RGB8), but the
> 65k pixel format does not match the existing RG16 fourcc code format.
> 
> Instead of a R:G:B 5:6:5, the controller expects the 16-bit pixels to be
> R:G:B 6:5:6, and so a new fourcc needs to be added to support this format.

small typo here, R:G:B 6:5:6 => that's 17 bits

other than that, it looks good to me, feel free to add:
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
> (no changes since v1)
> 
>   drivers/gpu/drm/solomon/ssd130x-i2c.c |   5 +
>   drivers/gpu/drm/solomon/ssd130x-spi.c |   7 +
>   drivers/gpu/drm/solomon/ssd130x.c     | 370 ++++++++++++++++++++++++++
>   drivers/gpu/drm/solomon/ssd130x.h     |   5 +-
>   4 files changed, 386 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/solomon/ssd130x-i2c.c b/drivers/gpu/drm/solomon/ssd130x-i2c.c
> index f2ccab9c06d9..a047dbec4e48 100644
> --- a/drivers/gpu/drm/solomon/ssd130x-i2c.c
> +++ b/drivers/gpu/drm/solomon/ssd130x-i2c.c
> @@ -105,6 +105,11 @@ static const struct of_device_id ssd130x_of_match[] = {
>   		.compatible = "solomon,ssd1327",
>   		.data = &ssd130x_variants[SSD1327_ID],
>   	},
> +	/* ssd133x family */
> +	{
> +		.compatible = "solomon,ssd1331",
> +		.data = &ssd130x_variants[SSD1331_ID],
> +	},
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, ssd130x_of_match);
> diff --git a/drivers/gpu/drm/solomon/ssd130x-spi.c b/drivers/gpu/drm/solomon/ssd130x-spi.c
> index 84e035a7ab3f..84bfde31d172 100644
> --- a/drivers/gpu/drm/solomon/ssd130x-spi.c
> +++ b/drivers/gpu/drm/solomon/ssd130x-spi.c
> @@ -142,6 +142,11 @@ static const struct of_device_id ssd130x_of_match[] = {
>   		.compatible = "solomon,ssd1327",
>   		.data = &ssd130x_variants[SSD1327_ID],
>   	},
> +	/* ssd133x family */
> +	{
> +		.compatible = "solomon,ssd1331",
> +		.data = &ssd130x_variants[SSD1331_ID],
> +	},
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, ssd130x_of_match);
> @@ -166,6 +171,8 @@ static const struct spi_device_id ssd130x_spi_table[] = {
>   	{ "ssd1322", SSD1322_ID },
>   	{ "ssd1325", SSD1325_ID },
>   	{ "ssd1327", SSD1327_ID },
> +	/* ssd133x family */
> +	{ "ssd1331", SSD1331_ID },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(spi, ssd130x_spi_table);
> diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
> index bef293922b98..447d0c7c88c6 100644
> --- a/drivers/gpu/drm/solomon/ssd130x.c
> +++ b/drivers/gpu/drm/solomon/ssd130x.c
> @@ -119,6 +119,26 @@
>   #define SSD130X_SET_VCOMH_VOLTAGE		0xbe
>   #define SSD132X_SET_FUNCTION_SELECT_B		0xd5
>   
> +/* ssd133x commands */
> +#define SSD133X_SET_COL_RANGE			0x15
> +#define SSD133X_SET_ROW_RANGE			0x75
> +#define SSD133X_CONTRAST_A			0x81
> +#define SSD133X_CONTRAST_B			0x82
> +#define SSD133X_CONTRAST_C			0x83
> +#define SSD133X_SET_MASTER_CURRENT		0x87
> +#define SSD132X_SET_PRECHARGE_A			0x8a
> +#define SSD132X_SET_PRECHARGE_B			0x8b
> +#define SSD132X_SET_PRECHARGE_C			0x8c
> +#define SSD133X_SET_DISPLAY_START		0xa1
> +#define SSD133X_SET_DISPLAY_OFFSET		0xa2
> +#define SSD133X_SET_DISPLAY_NORMAL		0xa4
> +#define SSD133X_SET_MASTER_CONFIG		0xad
> +#define SSD133X_POWER_SAVE_MODE			0xb0
> +#define SSD133X_PHASES_PERIOD			0xb1
> +#define SSD133X_SET_CLOCK_FREQ			0xb3
> +#define SSD133X_SET_PRECHARGE_VOLTAGE		0xbb
> +#define SSD133X_SET_VCOMH_VOLTAGE		0xbe
> +
>   #define MAX_CONTRAST 255
>   
>   const struct ssd130x_deviceinfo ssd130x_variants[] = {
> @@ -180,6 +200,12 @@ const struct ssd130x_deviceinfo ssd130x_variants[] = {
>   		.default_width = 128,
>   		.default_height = 128,
>   		.family_id = SSD132X_FAMILY,
> +	},
> +	/* ssd133x family */
> +	[SSD1331_ID] = {
> +		.default_width = 96,
> +		.default_height = 64,
> +		.family_id = SSD133X_FAMILY,
>   	}
>   };
>   EXPORT_SYMBOL_NS_GPL(ssd130x_variants, DRM_SSD130X);
> @@ -589,6 +615,117 @@ static int ssd132x_init(struct ssd130x_device *ssd130x)
>   	return 0;
>   }
>   
> +static int ssd133x_init(struct ssd130x_device *ssd130x)
> +{
> +	int ret;
> +
> +	/* Set color A contrast */
> +	ret = ssd130x_write_cmd(ssd130x, 2, SSD133X_CONTRAST_A, 0x91);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Set color B contrast */
> +	ret = ssd130x_write_cmd(ssd130x, 2, SSD133X_CONTRAST_B, 0x50);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Set color C contrast */
> +	ret = ssd130x_write_cmd(ssd130x, 2, SSD133X_CONTRAST_C, 0x7d);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Set master current */
> +	ret = ssd130x_write_cmd(ssd130x, 2, SSD133X_SET_MASTER_CURRENT, 0x06);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Set column start and end */
> +	ret = ssd130x_write_cmd(ssd130x, 3, SSD133X_SET_COL_RANGE, 0x00, ssd130x->width - 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Set row start and end */
> +	ret = ssd130x_write_cmd(ssd130x, 3, SSD133X_SET_ROW_RANGE, 0x00, ssd130x->height - 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * Horizontal Address Increment
> +	 * Normal order SA,SB,SC (e.g. RGB)
> +	 * COM Split Odd Even
> +	 * 256 color format
> +	 */
> +	ret = ssd130x_write_cmd(ssd130x, 2, SSD13XX_SET_SEG_REMAP, 0x20);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Set display start and offset */
> +	ret = ssd130x_write_cmd(ssd130x, 2, SSD133X_SET_DISPLAY_START, 0x00);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ssd130x_write_cmd(ssd130x, 2, SSD133X_SET_DISPLAY_OFFSET, 0x00);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Set display mode normal */
> +	ret = ssd130x_write_cmd(ssd130x, 1, SSD133X_SET_DISPLAY_NORMAL);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Set multiplex ratio value */
> +	ret = ssd130x_write_cmd(ssd130x, 2, SSD13XX_SET_MULTIPLEX_RATIO, ssd130x->height - 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Set master configuration */
> +	ret = ssd130x_write_cmd(ssd130x, 2, SSD133X_SET_MASTER_CONFIG, 0x8e);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Set power mode */
> +	ret = ssd130x_write_cmd(ssd130x, 2, SSD133X_POWER_SAVE_MODE, 0x0b);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Set Phase 1 and 2 period */
> +	ret = ssd130x_write_cmd(ssd130x, 2, SSD133X_PHASES_PERIOD, 0x31);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Set clock divider */
> +	ret = ssd130x_write_cmd(ssd130x, 2, SSD133X_SET_CLOCK_FREQ, 0xf0);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Set pre-charge A */
> +	ret = ssd130x_write_cmd(ssd130x, 2, SSD132X_SET_PRECHARGE_A, 0x64);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Set pre-charge B */
> +	ret = ssd130x_write_cmd(ssd130x, 2, SSD132X_SET_PRECHARGE_B, 0x78);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Set pre-charge C */
> +	ret = ssd130x_write_cmd(ssd130x, 2, SSD132X_SET_PRECHARGE_C, 0x64);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Set pre-charge level */
> +	ret = ssd130x_write_cmd(ssd130x, 2, SSD133X_SET_PRECHARGE_VOLTAGE, 0x3a);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Set VCOMH voltage */
> +	ret = ssd130x_write_cmd(ssd130x, 2, SSD133X_SET_VCOMH_VOLTAGE, 0x3e);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
>   static int ssd130x_update_rect(struct ssd130x_device *ssd130x,
>   			       struct drm_rect *rect, u8 *buf,
>   			       u8 *data_array)
> @@ -753,6 +890,47 @@ static int ssd132x_update_rect(struct ssd130x_device *ssd130x,
>   	return ret;
>   }
>   
> +static int ssd133x_update_rect(struct ssd130x_device *ssd130x,
> +			       struct drm_rect *rect, u8 *data_array,
> +			       unsigned int pitch)
> +{
> +	unsigned int x = rect->x1;
> +	unsigned int y = rect->y1;
> +	unsigned int columns = drm_rect_width(rect);
> +	unsigned int rows = drm_rect_height(rect);
> +	int ret;
> +
> +	/*
> +	 * The screen is divided in Segment and Common outputs, where
> +	 * COM0 to COM[N - 1] are the rows and SEG0 to SEG[M - 1] are
> +	 * the columns.
> +	 *
> +	 * Each Segment has a 8-bit pixel and each Common output has a
> +	 * row of pixels. When using the (default) horizontal address
> +	 * increment mode, each byte of data sent to the controller has
> +	 * a Segment (e.g: SEG0).
> +	 *
> +	 * When using the 256 color depth format, each pixel contains 3
> +	 * sub-pixels for color A, B and C. These have 3 bit, 3 bit and
> +	 * 2 bits respectively.
> +	 */
> +
> +	/* Set column start and end */
> +	ret = ssd130x_write_cmd(ssd130x, 3, SSD133X_SET_COL_RANGE, x, columns - 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Set row start and end */
> +	ret = ssd130x_write_cmd(ssd130x, 3, SSD133X_SET_ROW_RANGE, y, rows - 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Write out update in one go since horizontal addressing mode is used */
> +	ret = ssd130x_write_data(ssd130x, data_array, pitch * rows);
> +
> +	return ret;
> +}
> +
>   static void ssd130x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
>   {
>   	unsigned int pages = DIV_ROUND_UP(ssd130x->height, SSD130X_PAGE_HEIGHT);
> @@ -805,6 +983,22 @@ static void ssd132x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
>   	ssd130x_write_data(ssd130x, data_array, columns * height);
>   }
>   
> +static void ssd133x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
> +{
> +	const struct drm_format_info *fi = drm_format_info(DRM_FORMAT_RGB332);
> +	unsigned int pitch;
> +
> +	if (!fi)
> +		return;
> +
> +	pitch = drm_format_info_min_pitch(fi, 0, ssd130x->width);
> +
> +	memset(data_array, 0, pitch * ssd130x->height);
> +
> +	/* Write out update in one go since horizontal addressing mode is used */
> +	ssd130x_write_data(ssd130x, data_array, pitch * ssd130x->height);
> +}
> +
>   static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb,
>   				const struct iosys_map *vmap,
>   				struct drm_rect *rect,
> @@ -866,6 +1060,36 @@ static int ssd132x_fb_blit_rect(struct drm_framebuffer *fb,
>   	return ret;
>   }
>   
> +static int ssd133x_fb_blit_rect(struct drm_framebuffer *fb,
> +				const struct iosys_map *vmap,
> +				struct drm_rect *rect, u8 *data_array,
> +				struct drm_format_conv_state *fmtcnv_state)
> +{
> +	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
> +	const struct drm_format_info *fi = drm_format_info(DRM_FORMAT_RGB332);
> +	unsigned int dst_pitch;
> +	struct iosys_map dst;
> +	int ret = 0;
> +
> +	if (!fi)
> +		return -EINVAL;
> +
> +	dst_pitch = drm_format_info_min_pitch(fi, 0, drm_rect_width(rect));
> +
> +	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
> +	if (ret)
> +		return ret;
> +
> +	iosys_map_set_vaddr(&dst, data_array);
> +	drm_fb_xrgb8888_to_rgb332(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_state);
> +
> +	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
> +
> +	ssd133x_update_rect(ssd130x, rect, data_array, dst_pitch);
> +
> +	return ret;
> +}
> +
>   static int ssd130x_primary_plane_atomic_check(struct drm_plane *plane,
>   					      struct drm_atomic_state *state)
>   {
> @@ -964,6 +1188,29 @@ static int ssd132x_primary_plane_atomic_check(struct drm_plane *plane,
>   	return 0;
>   }
>   
> +static int ssd133x_primary_plane_atomic_check(struct drm_plane *plane,
> +					      struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct drm_crtc *crtc = plane_state->crtc;
> +	struct drm_crtc_state *crtc_state = NULL;
> +	int ret;
> +
> +	if (crtc)
> +		crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +
> +	ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
> +						  DRM_PLANE_NO_SCALING,
> +						  DRM_PLANE_NO_SCALING,
> +						  false, false);
> +	if (ret)
> +		return ret;
> +	else if (!plane_state->visible)
> +		return 0;
> +
> +	return 0;
> +}
> +
>   static void ssd130x_primary_plane_atomic_update(struct drm_plane *plane,
>   						struct drm_atomic_state *state)
>   {
> @@ -1034,6 +1281,39 @@ static void ssd132x_primary_plane_atomic_update(struct drm_plane *plane,
>   	drm_dev_exit(idx);
>   }
>   
> +static void ssd133x_primary_plane_atomic_update(struct drm_plane *plane,
> +						struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
> +	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
> +	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, plane_state->crtc);
> +	struct ssd130x_crtc_state *ssd130x_crtc_state =  to_ssd130x_crtc_state(crtc_state);
> +	struct drm_framebuffer *fb = plane_state->fb;
> +	struct drm_atomic_helper_damage_iter iter;
> +	struct drm_device *drm = plane->dev;
> +	struct drm_rect dst_clip;
> +	struct drm_rect damage;
> +	int idx;
> +
> +	if (!drm_dev_enter(drm, &idx))
> +		return;
> +
> +	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
> +	drm_atomic_for_each_plane_damage(&iter, &damage) {
> +		dst_clip = plane_state->dst;
> +
> +		if (!drm_rect_intersect(&dst_clip, &damage))
> +			continue;
> +
> +		ssd133x_fb_blit_rect(fb, &shadow_plane_state->data[0], &dst_clip,
> +				     ssd130x_crtc_state->data_array,
> +				     &shadow_plane_state->fmtcnv_state);
> +	}
> +
> +	drm_dev_exit(idx);
> +}
> +
>   static void ssd130x_primary_plane_atomic_disable(struct drm_plane *plane,
>   						 struct drm_atomic_state *state)
>   {
> @@ -1082,6 +1362,30 @@ static void ssd132x_primary_plane_atomic_disable(struct drm_plane *plane,
>   	drm_dev_exit(idx);
>   }
>   
> +static void ssd133x_primary_plane_atomic_disable(struct drm_plane *plane,
> +						 struct drm_atomic_state *state)
> +{
> +	struct drm_device *drm = plane->dev;
> +	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
> +	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct drm_crtc_state *crtc_state;
> +	struct ssd130x_crtc_state *ssd130x_crtc_state;
> +	int idx;
> +
> +	if (!plane_state->crtc)
> +		return;
> +
> +	crtc_state = drm_atomic_get_new_crtc_state(state, plane_state->crtc);
> +	ssd130x_crtc_state = to_ssd130x_crtc_state(crtc_state);
> +
> +	if (!drm_dev_enter(drm, &idx))
> +		return;
> +
> +	ssd133x_clear_screen(ssd130x, ssd130x_crtc_state->data_array);
> +
> +	drm_dev_exit(idx);
> +}
> +
>   /* Called during init to allocate the plane's atomic state. */
>   static void ssd130x_primary_plane_reset(struct drm_plane *plane)
>   {
> @@ -1144,6 +1448,12 @@ static const struct drm_plane_helper_funcs ssd130x_primary_plane_helper_funcs[]
>   		.atomic_check = ssd132x_primary_plane_atomic_check,
>   		.atomic_update = ssd132x_primary_plane_atomic_update,
>   		.atomic_disable = ssd132x_primary_plane_atomic_disable,
> +	},
> +	[SSD133X_FAMILY] = {
> +		DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> +		.atomic_check = ssd133x_primary_plane_atomic_check,
> +		.atomic_update = ssd133x_primary_plane_atomic_update,
> +		.atomic_disable = ssd133x_primary_plane_atomic_disable,
>   	}
>   };
>   
> @@ -1214,6 +1524,33 @@ static int ssd132x_crtc_atomic_check(struct drm_crtc *crtc,
>   	return 0;
>   }
>   
> +static int ssd133x_crtc_atomic_check(struct drm_crtc *crtc,
> +				     struct drm_atomic_state *state)
> +{
> +	struct drm_device *drm = crtc->dev;
> +	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
> +	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +	struct ssd130x_crtc_state *ssd130x_state = to_ssd130x_crtc_state(crtc_state);
> +	const struct drm_format_info *fi = drm_format_info(DRM_FORMAT_RGB332);
> +	unsigned int pitch;
> +	int ret;
> +
> +	if (!fi)
> +		return -EINVAL;
> +
> +	ret = drm_crtc_helper_atomic_check(crtc, state);
> +	if (ret)
> +		return ret;
> +
> +	pitch = drm_format_info_min_pitch(fi, 0, ssd130x->width);
> +
> +	ssd130x_state->data_array = kmalloc(pitch * ssd130x->height, GFP_KERNEL);
> +	if (!ssd130x_state->data_array)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
>   /* Called during init to allocate the CRTC's atomic state. */
>   static void ssd130x_crtc_reset(struct drm_crtc *crtc)
>   {
> @@ -1275,6 +1612,10 @@ static const struct drm_crtc_helper_funcs ssd130x_crtc_helper_funcs[] = {
>   		.mode_valid = ssd130x_crtc_mode_valid,
>   		.atomic_check = ssd132x_crtc_atomic_check,
>   	},
> +	[SSD133X_FAMILY] = {
> +		.mode_valid = ssd130x_crtc_mode_valid,
> +		.atomic_check = ssd133x_crtc_atomic_check,
> +	},
>   };
>   
>   static const struct drm_crtc_funcs ssd130x_crtc_funcs = {
> @@ -1337,6 +1678,31 @@ static void ssd132x_encoder_atomic_enable(struct drm_encoder *encoder,
>   	ssd130x_power_off(ssd130x);
>   }
>   
> +static void ssd133x_encoder_atomic_enable(struct drm_encoder *encoder,
> +					  struct drm_atomic_state *state)
> +{
> +	struct drm_device *drm = encoder->dev;
> +	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
> +	int ret;
> +
> +	ret = ssd130x_power_on(ssd130x);
> +	if (ret)
> +		return;
> +
> +	ret = ssd133x_init(ssd130x);
> +	if (ret)
> +		goto power_off;
> +
> +	ssd130x_write_cmd(ssd130x, 1, SSD13XX_DISPLAY_ON);
> +
> +	backlight_enable(ssd130x->bl_dev);
> +
> +	return;
> +
> +power_off:
> +	ssd130x_power_off(ssd130x);
> +}
> +
>   static void ssd130x_encoder_atomic_disable(struct drm_encoder *encoder,
>   					   struct drm_atomic_state *state)
>   {
> @@ -1358,6 +1724,10 @@ static const struct drm_encoder_helper_funcs ssd130x_encoder_helper_funcs[] = {
>   	[SSD132X_FAMILY] = {
>   		.atomic_enable = ssd132x_encoder_atomic_enable,
>   		.atomic_disable = ssd130x_encoder_atomic_disable,
> +	},
> +	[SSD133X_FAMILY] = {
> +		.atomic_enable = ssd133x_encoder_atomic_enable,
> +		.atomic_disable = ssd130x_encoder_atomic_disable,
>   	}
>   };
>   
> diff --git a/drivers/gpu/drm/solomon/ssd130x.h b/drivers/gpu/drm/solomon/ssd130x.h
> index 075c5c3ee75a..a4554018bb2a 100644
> --- a/drivers/gpu/drm/solomon/ssd130x.h
> +++ b/drivers/gpu/drm/solomon/ssd130x.h
> @@ -25,7 +25,8 @@
>   
>   enum ssd130x_family_ids {
>   	SSD130X_FAMILY,
> -	SSD132X_FAMILY
> +	SSD132X_FAMILY,
> +	SSD133X_FAMILY
>   };
>   
>   enum ssd130x_variants {
> @@ -39,6 +40,8 @@ enum ssd130x_variants {
>   	SSD1322_ID,
>   	SSD1325_ID,
>   	SSD1327_ID,
> +	/* ssd133x family */
> +	SSD1331_ID,
>   	NR_SSD130X_VARIANTS
>   };
>   

