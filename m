Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3829603E43
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 11:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3075C10F1B2;
	Wed, 19 Oct 2022 09:12:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1294610EAB9
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 09:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666170722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PzoUhWIK85kptE51uwz51om5WE1Ga9wjKYqu8XEkG+g=;
 b=fx1jHj6a/j1icAJWakAJPmx25W7EJ4u4hVYt2cQn1cPVBBc1qxoGs7k7T3SM+M9drBJHaF
 EC5pnh20G1uexMzdBq5D7YXhs+G/nGXs2sHqtmiLzwtBvYdPA0b5TYDKiCVG3tspuo5iNi
 pU6rynl+haIqoL5u9eTobhyZ+mmaUg0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-599-q3JX5g_VOqaM-gGnVl2oMw-1; Wed, 19 Oct 2022 05:11:56 -0400
X-MC-Unique: q3JX5g_VOqaM-gGnVl2oMw-1
Received: by mail-wm1-f69.google.com with SMTP id
 i5-20020a1c3b05000000b003c47c8569easo12655702wma.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 02:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PzoUhWIK85kptE51uwz51om5WE1Ga9wjKYqu8XEkG+g=;
 b=oitzIcvghMGp1n7R20KX9mpQJ6eCBHroW0lLTeuljJSziLYIMiZ1zyoyfiZV/Yn8Py
 i1zKABOncacLtuo5MgId5YVi2OloNCwDKFo/7kPL7UeLkH7RbzQ+25Npk0eTzEbfzfGN
 UwIqptLRn9lYYXa6r/suxAvOMmro4AHDzBxvjltOML2smKr2OKPcfo+KyBDQxHEEo1fa
 saRlHZRvVa9/iVbStmKrngchCdVmQ+qDeR7nhgLWcmCTn+UYbJcSUwrbolKtWmyoBV1u
 6Ncx5Lc0XKFZKEvTFxCtNqZjtPncYdzWANbFA7RdsV7f6gbMOrQ4EN0Odd9u8JtcdPDV
 Oi8g==
X-Gm-Message-State: ACrzQf07usqM/fOd9efQzI4yiiRNxcsEUROkp5KmqWWxBOm6ueplH0vV
 Pn8e+kCf6B0BPEXDl+hUc9PJ16aZmalxoA/M7Axm9sGmk0DHpOB6diVvVrcZceA2q9EBcH0E+ed
 ZfqWnbLKoZLqb/LZv+CPPwnr6E629
X-Received: by 2002:a05:6000:61b:b0:231:1b8:172 with SMTP id
 bn27-20020a056000061b00b0023101b80172mr4512254wrb.372.1666170714594; 
 Wed, 19 Oct 2022 02:11:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM68dtRViiZRaJ2Mw/iENBUTiMMftQBXt+Pg2pPJCiTsXdeAp5L34FEE/x++Dw8oYYL5ADnIEg==
X-Received: by 2002:a05:6000:61b:b0:231:1b8:172 with SMTP id
 bn27-20020a056000061b00b0023101b80172mr4512236wrb.372.1666170714206; 
 Wed, 19 Oct 2022 02:11:54 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b10-20020a5d550a000000b0022860e8ae7csm12939391wrv.77.2022.10.19.02.11.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 02:11:53 -0700 (PDT)
Message-ID: <845a6797-d71b-33b3-5ee4-358d227e19d6@redhat.com>
Date: Wed, 19 Oct 2022 11:11:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 2/2] drm/tiny: add support for tft displays based on
 ilitek, ili9488
To: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
References: <20221018164532.1705215-1-tommaso.merciai@amarulasolutions.com>
 <20221018164532.1705215-3-tommaso.merciai@amarulasolutions.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221018164532.1705215-3-tommaso.merciai@amarulasolutions.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: kamlesh.gurudasani@gmail.com, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 michael@amarulasolutions.com, linuxfancy@googlegroups.com,
 linux-amarula@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Tommaso,

On 10/18/22 18:45, Tommaso Merciai wrote:

[...]

> +config TINYDRM_ILI9488
> +	tristate "DRM support for ILI9488 display panels"
> +	depends on DRM && SPI
> +	select DRM_KMS_HELPER
> +	select DRM_GEM_CMA_HELPER
> +	select DRM_MIPI_DBI
> +	select BACKLIGHT_CLASS_DEVICE
> +	help
> +	  DRM driver for the following Ilitek ILI9488 panels:
> +	  * LCD 3.5" 320x480 TFT (Waveshare Pico-ResTouch-LCD-3.5")
> +
> +	  If M is selected the module will be called ili9486.
> +

Typo here, should be ili9488.

[...]

> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_damage_helper.h>
> +#include <drm/drm_framebuffer.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_mipi_dbi.h>
> +#include <drm/drm_modeset_helper.h>
> +

Please sort these alphabetically

> +
> +static void ili9488_rgb565_to_rgb666_line(u8 *dst, u16 *sbuf,
> +					  unsigned int pixels)
> +{
> +	unsigned int x;
> +
> +	for (x = 0; x < pixels; x++) {
> +		*dst++ = ((*sbuf & 0xF800) >> 8);
> +		*dst++ = ((*sbuf & 0x07E0) >> 3);
> +		*dst++ = ((*sbuf & 0x001F) << 3);
> +		sbuf++;
> +	}
> +}
> +

If these format conversions helpers are really needed, they need to be
added as helpers to drivers/gpu/drm/drm_format_helper.c instead.

> +static void ili9488_rgb565_to_rgb666(u8 *dst, void *vaddr,
> +				     struct drm_framebuffer *fb,
> +				     struct drm_rect *rect)
> +{
> +	unsigned long linepixels = drm_rect_width(rect);
> +	unsigned long lines = drm_rect_height(rect);
> +	size_t dst_len = linepixels * 3;
> +	size_t src_len = linepixels * fb->format->cpp[0];
> +	unsigned int y;
> +	u16 *sbuf;
> +
> +	/*
> +	 * The cma memory is write-combined so reads are uncached.
> +	 * Speed up by fetching one line at a time.
> +	 */
> +	sbuf = kmalloc(src_len, GFP_KERNEL);
> +	if (!sbuf)
> +		return;

This will cause an extra copy even when CMA isn't used. Please take a look
how the format helpers do this. You should pass a struct iosys_map param
and internally use the drm_fb_xfrm() helper that would handle both the I/O
mem and system memory cases.

> +static int ili9488_buf_copy(void *dst, struct drm_framebuffer *fb,
> +			    struct drm_rect *rect)
> +{
> +	struct drm_gem_cma_object *cma_obj = drm_fb_cma_get_gem_obj(fb, 0);
> +	void *src = cma_obj->vaddr;
> +	int ret = 0;
> +
> +	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
> +	if (ret)
> +		return ret;
> +

If you rebase on top of the "[PATCH 0/5] drm: Add new plane helpers to
begin/end FB access" series then an explicit CPU access to GEM BOs sync
isn't needed anymore:

https://lore.kernel.org/dri-devel/20221017111510.20818-1-tzimmermann@suse.de/


> +	switch (fb->format->format) {
> +	case DRM_FORMAT_RGB565:
> +		ili9488_rgb565_to_rgb666(dst, src, fb, rect);

This is the biggest issue I see with this driver. The exported format is
RGB565 but RGB666 is used. I believe the policy is for the driver to expose
the native format to user-space.

I know that there isn't a DRM_FORMAT_RGB666 in neither DRM nor mesa, but
still I think that adding it should be part of this series. If you also
want to expose DRM_FORMAT_RGB565 for compatibility reasons, then I guess
that's OK but as mentioned the format helpers need to be in the DRM core.

[...]

> +static void ili9488_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect)
> +{

This looks very similar, if not the same than the mipi_dbi_fb_dirty() helper.

[...]

> +static void ili9488_pipe_update(struct drm_simple_display_pipe *pipe,
> +			       struct drm_plane_state *old_state)
> +{

And same for this, it's basically mipi_dbi_pipe_update() if you end using the
mipi_dbi_fb_dirty() helper instead of a custom ili9488_fb_dirty() handler.

> +	struct drm_plane_state *state = pipe->plane.state;
> +	struct drm_rect rect;
> +
> +	if (!pipe->crtc.state->active)
> +		return;
> +
> +	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
> +		ili9488_fb_dirty(state->fb, &rect);

I see that most MIPI DBI drivers use this function to merge all the damage clips
into a big rectangle. Is there a reason why this is done in this way rather than
just iterating over all the damage areas and update them one by one?

Since for example there are multiple damage clips that aren't close to each other,
the resulting rectangle could be quite big.

[...]

> +DEFINE_DRM_GEM_CMA_FOPS(ili9488_fops);
> +

Do you really need CMA for this? Can't you just use DEFINE_DRM_GEM_FOPS() instead?

> +static struct drm_driver ili9488_driver = {
> +	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> +	.fops			= &ili9488_fops,
> +	DRM_GEM_CMA_DRIVER_OPS_VMAP,

	DRM_GEM_SHMEM_DRIVER_OPS, ?

> +	.debugfs_init		= mipi_dbi_debugfs_init,
> +	.name			= "ili9488",
> +	.desc			= "Ilitek ILI9488",
> +	.date			= "20221017",
> +	.major			= 1,
> +	.minor			= 0,
> +};
> +
> +static const struct of_device_id ili9488_of_match[] = {
> +	{ .compatible = "waveshare,pico-rt-lcd-35" },
> +	{ }
> +};

Do you really need to make the compatible that specific? I would just have an entry
for "ilitek,ili9488".

> +MODULE_DEVICE_TABLE(of, ili9488_of_match);
> +
> +static const struct spi_device_id ili9488_id[] = {
> +	{ "ili9488", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(spi, ili9488_id);
> +

The fact that this doesn't match the OF compatible string would break module auto
loading. Because the SPI core doesn't report an OF module alias, but always a SPI
alias regardless whether the device was registered using Device Trees or not.

[...]

> +	dbi->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(dbi->reset)) {
> +		DRM_DEV_ERROR(dev, "Failed to get gpio 'reset'\n");
> +		return PTR_ERR(dbi->reset);
> +	}

You could use dev_err_probe() instead. And same in other places.

> +static void ili9488_remove(struct spi_device *spi)
> +{
> +	struct drm_device *drm = spi_get_drvdata(spi);
> +
> +	drm_dev_unplug(drm);
> +	drm_atomic_helper_shutdown(drm);

I believe drm_atomic_helper_shutdown() isn't needed here since is done already
in ili9488_shutdown().

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

