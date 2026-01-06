Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFBFCFA640
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 19:58:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C14D10E062;
	Tue,  6 Jan 2026 18:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h1olxfWt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2465E10E00E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 18:58:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E501160007;
 Tue,  6 Jan 2026 18:58:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22A77C116C6;
 Tue,  6 Jan 2026 18:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767725912;
 bh=dteLAuPeiPBWW8kkocE2625W6VB6o7exUkkm763cNEw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=h1olxfWtE44wfANysJisvsi1fvQg/NAOCH/hELzwst8kZJbZslazNZF39EeXHNfKx
 IrLhMxGJquWA2SD/92dkaFUmKk5JwF+OCEufzLWnMNSCAH1AxI1PlZ+Wm5S6eI5KuD
 dFqBki6OuCeTcMTNw2E+lr7VGYsnrRaRbhcnmy5f5Cki+rKt+0rPUkSjzlYAkNXhlL
 MGfteiP2IvGM6papsMNT1qtRjaRNe+pzFs59LPE+3PKa3tFz2ecisZkfR6aQ8F1hFH
 VscdCYiJeADgfDIDyGGjbb6mMokogXXiU6ob9dDfrz/YOgDNZabeRJGNdrODsV6DQX
 9TgEHh+vKmWoA==
Message-ID: <894581a9-2a30-428d-ab94-34697147d68e@kernel.org>
Date: Tue, 6 Jan 2026 12:58:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 1/3] drm: client: add splash client
To: Francesco Valla <francesco@valla.it>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-embedded@vger.kernel.org
References: <20260106-drm_client_splash-v2-0-6e86a7434b59@valla.it>
 <20260106-drm_client_splash-v2-1-6e86a7434b59@valla.it>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <20260106-drm_client_splash-v2-1-6e86a7434b59@valla.it>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/6/2026 8:25 AM, Francesco Valla wrote:
> Add a DRM client that draws a simple splash, with possibility to show:
> 
>    - a colored background;
>    - a static BMP image (loaded as firmware);
>    - the logo provided by EFI BGRT.

That's cool, thanks for implementing my suggestion!

> 
> The client is not meant to replace a full-featured bootsplash, but
> rather to remove some complexity (and hopefully boot time) on small
> embedded platforms or on systems with a limited scope (e.g: recovery
> or manufacturing images).

In theory when using EFI BGRT you could:
* have the BIOS show the BGRT
* bootloader not show anything
* kernel overwrite the framebuffer containing the BIOS BGRT with the 
exact same image (should be invisible to the user)
* regular bootsplash like plymouth overwrite the framebuffer again with 
the same BGRT but then also add progress bar/distro logo etc.

> 
> The background color can be set either at build time from a dedicated
> config option or at runtime through the drm_client_lib.splash_color
> command line parameter. Any color in RGB888 format can be used.
> 
> If enabled, the static BMP image is loaded using the kernel firmware
> infrastructure; a valid BMP image with 24bpp color and no compression
> is expected. The name of the image can be set through the
> drm_client_lib.splash_bmp kernel command line parameter, with the
> default being 'drm_splash.bmp'.
> 
> Just like the existing DRM clients, the splash can be enabled from the
> kernel command line using drm_client_lib.active=splash.
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>   drivers/gpu/drm/clients/Kconfig               |  79 ++-
>   drivers/gpu/drm/clients/Makefile              |   1 +
>   drivers/gpu/drm/clients/drm_client_internal.h |   9 +
>   drivers/gpu/drm/clients/drm_client_setup.c    |   8 +
>   drivers/gpu/drm/clients/drm_splash.c          | 883 ++++++++++++++++++++++++++
>   5 files changed, 979 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/clients/Kconfig b/drivers/gpu/drm/clients/Kconfig
> index 6096c623d9d5b1a3d4a40d986c45aad2f8277767..dd8cd6cacd1166932eb3890dd816b9ae2d26330f 100644
> --- a/drivers/gpu/drm/clients/Kconfig
> +++ b/drivers/gpu/drm/clients/Kconfig
> @@ -12,6 +12,7 @@ config DRM_CLIENT_LIB
>   config DRM_CLIENT_SELECTION
>   	tristate
>   	depends on DRM
> +	select DRM_CLIENT_LIB if DRM_CLIENT_SPLASH
>   	select DRM_CLIENT_LIB if DRM_CLIENT_LOG
>   	select DRM_CLIENT_LIB if DRM_FBDEV_EMULATION
>   	help
> @@ -85,10 +86,79 @@ config DRM_CLIENT_LOG
>   	  If you only need logs, but no terminal, or if you prefer userspace
>   	  terminal, say "Y".
>   
> +config DRM_CLIENT_SPLASH
> +	bool "Display graphic splash"
> +	depends on DRM_CLIENT_SELECTION
> +	select DRM_CLIENT
> +	select DRM_CLIENT_SETUP
> +	select DRM_DRAW
> +	help
> +	  This enables a splash drm client, able to display either a plain
> +	  color or a static image until the userspace is ready to take over.
> +	  The splash will be displayed on all screens available at boot, if
> +	  any, or on the ones part of the first hotplug event.
> +
> +config DRM_CLIENT_SPLASH_BACKGROUND_COLOR
> +	hex "Splash background color"
> +	depends on DRM_CLIENT_SPLASH
> +	default 0x000000
> +	help
> +	  The default splash background color, in RGB888 format.
> +
> +	  The color can be overridden through the drm_client_lib.splash_color
> +	  kernel command line parameter.
> +
> +config DRM_CLIENT_SPLASH_BMP_SUPPORT
> +	bool
> +
> +choice
> +	prompt "Splash source"
> +	depends on DRM_CLIENT_SPLASH
> +	default DRM_CLIENT_SPLASH_SRC_COLOR
> +	help
> +	  Selects the source for the splash graphic.
> +
> +config DRM_CLIENT_SPLASH_SRC_COLOR
> +	bool "Solid color"
> +	help
> +	  Use a solid color as splash. The color is selected through the
> +	  DRM_CLIENT_SPLASH_BACKGROUND_COLOR config option.
> +
> +	  The image will be loaded using the firmware loading facility the
> +	  kernel provides.
> +
> +config DRM_CLIENT_SPLASH_SRC_BMP
> +	bool "BMP image"
> +	select DRM_CLIENT_SPLASH_BMP_SUPPORT
> +	select FW_LOADER
> +	help
> +	  Use a BMP (bitmap) image as splash. If the image is smaller than the
> +	  display(s), it will be centered and the color specified through the
> +	  DRM_CLIENT_SPLASH_BACKGROUND_COLOR config option will be used as
> +	  background.
> +
> +	  The image will be loaded using the firmware loading facility the
> +	  kernel provides; it shall use 24 bits per pixel and shall not be
> +	  compressed. The name of the file can be set through the
> +	  drm_client_lib.splash_bmp command line parameter, with the default
> +	  being 'drm_splash.bmp'.
> +
> +config DRM_CLIENT_SPLASH_SRC_BGRT
> +	bool "EFI BGRT"
> +	select DRM_CLIENT_SPLASH_BMP_SUPPORT
> +	depends on EFI
> +	help
> +	  Use the BGRT image provided by the EFI bootloader. If the image is
> +	  smaller than the display(s), it will be centered and the color
> +	  specified through the DRM_CLIENT_SPLASH_BACKGROUND_COLOR config
> +	  option will be used as background.
> +
> +endchoice
> +
>   choice
>   	prompt "Default DRM Client"
>   	depends on DRM_CLIENT_SELECTION
> -	depends on DRM_FBDEV_EMULATION || DRM_CLIENT_LOG
> +	depends on DRM_FBDEV_EMULATION || DRM_CLIENT_LOG || DRM_CLIENT_SPLASH
>   	default DRM_CLIENT_DEFAULT_FBDEV
>   	help
>   	  Selects the default drm client.
> @@ -111,6 +181,12 @@ config DRM_CLIENT_DEFAULT_LOG
>   	  screen, but doesn't implement a full terminal. For that you will need
>   	  a userspace terminal using drm/kms.
>   
> +config DRM_CLIENT_DEFAULT_SPLASH
> +	bool "splash"
> +	depends on DRM_CLIENT_SPLASH
> +	help
> +	  Use splash as default drm client.
> +
>   endchoice
>   
>   config DRM_CLIENT_DEFAULT
> @@ -118,6 +194,7 @@ config DRM_CLIENT_DEFAULT
>          depends on DRM_CLIENT
>          default "fbdev" if DRM_CLIENT_DEFAULT_FBDEV
>          default "log" if DRM_CLIENT_DEFAULT_LOG
> +       default "splash" if DRM_CLIENT_DEFAULT_SPLASH

Whitespace off by a character?

>          default ""
>   
>   endmenu
> diff --git a/drivers/gpu/drm/clients/Makefile b/drivers/gpu/drm/clients/Makefile
> index c16addbc327f09572aa3142cbf0d1d13f172a9e9..3df02d10cd18a47d7e8d7cee70163b0ef0129b51 100644
> --- a/drivers/gpu/drm/clients/Makefile
> +++ b/drivers/gpu/drm/clients/Makefile
> @@ -5,4 +5,5 @@ subdir-ccflags-y += -I$(src)/..
>   drm_client_lib-y := drm_client_setup.o
>   drm_client_lib-$(CONFIG_DRM_CLIENT_LOG) += drm_log.o
>   drm_client_lib-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fbdev_client.o
> +drm_client_lib-$(CONFIG_DRM_CLIENT_SPLASH) += drm_splash.o
>   obj-$(CONFIG_DRM_CLIENT_LIB) += drm_client_lib.o
> diff --git a/drivers/gpu/drm/clients/drm_client_internal.h b/drivers/gpu/drm/clients/drm_client_internal.h
> index 6dc078bf6503b902cbb3267b64ea42d9f1c23375..48ee0c1c2529882b2bf5dc786788390823e25cd6 100644
> --- a/drivers/gpu/drm/clients/drm_client_internal.h
> +++ b/drivers/gpu/drm/clients/drm_client_internal.h
> @@ -22,4 +22,13 @@ void drm_log_register(struct drm_device *dev);
>   static inline void drm_log_register(struct drm_device *dev) {}
>   #endif
>   
> +#ifdef CONFIG_DRM_CLIENT_SPLASH
> +void drm_splash_register(struct drm_device *dev,
> +			 const struct drm_format_info *format);
> +#else
> +static inline void drm_splash_register(struct drm_device *dev,
> +				       const struct drm_format_info *format)
> +{}
> +#endif
> +
>   #endif
> diff --git a/drivers/gpu/drm/clients/drm_client_setup.c b/drivers/gpu/drm/clients/drm_client_setup.c
> index 515aceac22b18161a14bd60be4acedc1ddd05bc5..c19498938ee3ba442f7502b27a9c33dfff45a203 100644
> --- a/drivers/gpu/drm/clients/drm_client_setup.c
> +++ b/drivers/gpu/drm/clients/drm_client_setup.c
> @@ -56,6 +56,14 @@ void drm_client_setup(struct drm_device *dev, const struct drm_format_info *form
>   		return;
>   	}
>   #endif
> +
> +#ifdef CONFIG_DRM_CLIENT_SPLASH
> +	if (!strcmp(drm_client_default, "splash")) {
> +		drm_splash_register(dev, format);
> +		return;
> +	}
> +#endif
> +
>   	if (strcmp(drm_client_default, ""))
>   		drm_warn(dev, "Unknown DRM client %s\n", drm_client_default);
>   }
> diff --git a/drivers/gpu/drm/clients/drm_splash.c b/drivers/gpu/drm/clients/drm_splash.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..204a5256ef03b6edb81e5dc8c49b5929cb51ff92
> --- /dev/null
> +++ b/drivers/gpu/drm/clients/drm_splash.c
> @@ -0,0 +1,883 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +/*
> + * Copyright (c) 2025-2026 Francesco Valla <francesco@valla.it>
> + *
> + */
> +
> +#include <linux/atomic.h>
> +#include <linux/device.h>
> +#include <linux/efi-bgrt.h>
> +#include <linux/firmware.h>
> +#include <linux/init.h>
> +#include <linux/iosys-map.h>
> +#include <linux/kthread.h>
> +#include <linux/module.h>
> +#include <linux/types.h>
> +
> +#include <drm/drm_client.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_framebuffer.h>
> +#include <drm/drm_plane.h>
> +#include <drm/drm_print.h>
> +
> +#include "drm_client_internal.h"
> +#include "drm_draw_internal.h"
> +#include "drm_internal.h"
> +
> +/**
> + * DOC: overview
> + *
> + * This is a simple graphic bootsplash, able to display either a plain color or
> + * a static image.
> + */
> +
> +static unsigned int splash_color = CONFIG_DRM_CLIENT_SPLASH_BACKGROUND_COLOR;
> +module_param(splash_color, uint, 0400);
> +MODULE_PARM_DESC(splash_color, "Splash background color (RGB888)");

Does this really need to be a module parameter(s) in addition to the 
kconfig option(s)?  Just wondering what the use case you envisioned is. 
In my mind I was thinking in an embedded system manufacturing flow maybe 
you would set it to red in the case of a hardware test failure on the 
line or something.

> +
> +#if IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_SRC_BMP)
> +#define DEFAULT_SPLASH_BMP "drm_splash.bmp"
> +static char *splash_bmp = DEFAULT_SPLASH_BMP;
> +module_param(splash_bmp, charp, 0400);
> +MODULE_PARM_DESC(splash_bmp, "Name of splash image (default: \"" DEFAULT_SPLASH_BMP "\")");
> +#endif // CONFIG_DRM_CLIENT_SPLASH_SRC_BMP
> +
> +#if IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_BMP_SUPPORT)
> +#define BMP_FILE_MAGIC_ID 0x4d42
> +
> +/* BMP header structures copied from drivers/video/fbdev/efifb.c */
> +struct bmp_file_header {
> +	u16 id;
> +	u32 file_size;
> +	u32 reserved;
> +	u32 bitmap_offset;
> +} __packed;
> +
> +struct bmp_dib_header {
> +	u32 dib_header_size;
> +	s32 width;
> +	s32 height;
> +	u16 planes;
> +	u16 bpp;
> +	u32 compression;
> +	u32 bitmap_size;
> +	u32 horz_resolution;
> +	u32 vert_resolution;
> +	u32 colors_used;
> +	u32 colors_important;
> +} __packed;
> +#endif // CONFIG_DRM_CLIENT_SPLASH_BMP_SUPPORT
> +
> +typedef int (*drm_splash_data_get_func_t)(void *priv, const u8 **data, size_t *size);
> +typedef void (*drm_splash_data_release_func_t)(void *priv);
> +
> +struct drm_splash_scanout {
> +	int id;
> +	u32 format;
> +	unsigned int width;
> +	unsigned int height;
> +	struct drm_client_buffer *buffer;
> +	bool bg_drawn;
> +};
> +
> +struct drm_splash {
> +	struct drm_client_dev client;
> +	u32 preferred_format;
> +	struct device dev;
> +
> +	struct task_struct *thread;
> +	atomic_t pending;
> +
> +	struct mutex hotplug_lock;
> +	bool initialized;
> +
> +	u32 n_scanout;
> +	struct drm_splash_scanout *scanout;
> +
> +	spinlock_t data_lock;
> +	drm_splash_data_get_func_t data_get;
> +	drm_splash_data_release_func_t data_release;
> +	void *data_priv;
> +};
> +
> +static struct drm_splash *client_to_drm_splash(struct drm_client_dev *client)
> +{
> +	return container_of_const(client, struct drm_splash, client);
> +}
> +
> +static void __maybe_unused
> +drm_splash_data_source_push(struct drm_splash *splash,
> +			    drm_splash_data_get_func_t get,
> +			    drm_splash_data_release_func_t release,
> +			    void *priv)
> +{
> +	guard(spinlock)(&splash->data_lock);
> +
> +	/* Release previous data */
> +	if (splash->data_release)
> +		splash->data_release(splash->data_priv);
> +
> +	splash->data_get = get;
> +	splash->data_release = release;
> +	splash->data_priv = priv;
> +}
> +
> +static void drm_splash_data_source_pop(struct drm_splash *splash,
> +				       drm_splash_data_get_func_t *get,
> +				       drm_splash_data_release_func_t *release,
> +				       void **priv)
> +{
> +	guard(spinlock)(&splash->data_lock);
> +
> +	*get = splash->data_get;
> +	splash->data_get = NULL;
> +
> +	*release = splash->data_release;
> +	splash->data_release = NULL;
> +
> +	*priv = splash->data_priv;
> +	splash->data_priv = NULL;
> +}
> +
> +static struct drm_splash_scanout *
> +get_scanout_from_tile_group(struct drm_splash *splash, int id)
> +{
> +	int j;
> +
> +	for (j = 0; j < splash->n_scanout; j++)
> +		if (splash->scanout[j].id == id)
> +			return &splash->scanout[j];
> +
> +	return NULL;
> +}
> +
> +static u32 drm_splash_find_usable_format(struct drm_plane *plane,
> +					 u32 preferred_format)
> +{
> +	int i;
> +
> +	/* Check if the preferred format can be used */
> +	for (i = 0; i < plane->format_count; i++)
> +		if (plane->format_types[i] == preferred_format)
> +			return preferred_format;
> +
> +	/* Otherwise, find the first format that can be converted from XRGB8888 */
> +	for (i = 0; i < plane->format_count; i++)
> +		if (drm_draw_color_from_xrgb8888(0xffffffff, plane->format_types[i]) != 0)
> +			return plane->format_types[i];
> +
> +	return DRM_FORMAT_INVALID;
> +}
> +
> +static void drm_splash_fill(struct iosys_map *map, unsigned int dst_pitch,
> +			    unsigned int height, unsigned int width,
> +			    u32 px_width, u32 color)
> +{
> +	switch (px_width) {
> +	case 2:
> +		drm_draw_fill16(map, dst_pitch, height, width, color);
> +		break;
> +	case 3:
> +		drm_draw_fill24(map, dst_pitch, height, width, color);
> +		break;
> +	case 4:
> +		drm_draw_fill32(map, dst_pitch, height, width, color);
> +		break;
> +	default:
> +		WARN_ONCE(1, "Can't fill with pixel width %d", px_width);
> +	}
> +}
> +
> +static int drm_splash_fill_solid_color(struct drm_client_buffer *buffer, u32 color)
> +{
> +	struct drm_client_dev *client = buffer->client;
> +	struct drm_framebuffer *fb = buffer->fb;
> +	struct drm_rect r = DRM_RECT_INIT(0, 0, fb->width, fb->height);
> +	u32 px_width = fb->format->cpp[0];
> +	struct iosys_map map;
> +	int ret;
> +
> +	ret = drm_client_buffer_vmap_local(buffer, &map);
> +	if (ret) {
> +		drm_err(client->dev, "splash: cannot vmap buffer: %d", ret);
> +		return ret;
> +	}
> +
> +	drm_splash_fill(&map, fb->pitches[0], drm_rect_height(&r),
> +			drm_rect_width(&r), px_width, color);
> +
> +	drm_client_buffer_vunmap_local(buffer);
> +
> +	return drm_client_buffer_flush(buffer, &r);
> +}
> +
> +#if IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_BMP_SUPPORT)
> +static void drm_splash_blit_pix16(struct iosys_map *map, unsigned int dpitch,
> +				  unsigned int x_pad, unsigned int y_pad,
> +				  const u8 *sbuf8, unsigned int spitch,
> +				  unsigned int width, unsigned int height,
> +				  bool invert_y, u32 format)
> +{
> +	unsigned int x, y, src_offset, dst_offset;
> +	u32 scolor, dcolor, wr_off;
> +
> +	for (y = 0; y < height; y++) {
> +		src_offset = (invert_y ? (height - y - 1) : y) * spitch;
> +		dst_offset = (y_pad + y) * dpitch;
> +
> +		for (x = 0; x < width; x++) {
> +			scolor = *(const u32 *)(&sbuf8[src_offset + 3 * x]);
> +			dcolor = drm_draw_color_from_xrgb8888(scolor, format);
> +			wr_off = dst_offset + (x_pad + x) * sizeof(u16);
> +
> +			iosys_map_wr(map, wr_off, u16, dcolor);
> +		}
> +	}
> +}
> +
> +static void drm_splash_blit_pix24(struct iosys_map *map, unsigned int dpitch,
> +				  unsigned int x_pad, unsigned int y_pad,
> +				  const u8 *sbuf8, unsigned int spitch,
> +				  unsigned int width, unsigned int height,
> +				  bool invert_y, u32 format)
> +{
> +	unsigned int x, y, src_offset, dst_offset;
> +	u32 scolor, dcolor, wr_off;
> +
> +	for (y = 0; y < height; y++) {
> +		src_offset = (invert_y ? (height - y - 1) : y) * spitch;
> +		dst_offset = (y_pad + y) * dpitch;
> +
> +		for (x = 0; x < width; x++) {
> +			scolor = *(const u32 *)(&sbuf8[src_offset + 3 * x]);
> +			dcolor = drm_draw_color_from_xrgb8888(scolor, format);
> +			wr_off = dst_offset + (x_pad + x) * 3;
> +
> +			iosys_map_wr(map, wr_off, u8, (dcolor & 0x000000FF) >> 0);
> +			iosys_map_wr(map, wr_off + 1, u8, (dcolor & 0x0000FF00) >> 8);
> +			iosys_map_wr(map, wr_off + 2, u8, (dcolor & 0x00FF0000) >> 16);
> +		}
> +	}
> +}
> +
> +static void drm_splash_blit_pix32(struct iosys_map *map, unsigned int dpitch,
> +				  unsigned int x_pad, unsigned int y_pad,
> +				  const u8 *sbuf8, unsigned int spitch,
> +				  unsigned int width, unsigned int height,
> +				  bool invert_y, u32 format)
> +{
> +	unsigned int x, y, src_offset, dst_offset;
> +	u32 scolor, dcolor, wr_off;
> +
> +	for (y = 0; y < height; y++) {
> +		src_offset = (invert_y ? (height - y - 1) : y) * spitch;
> +		dst_offset = (y_pad + y) * dpitch;
> +
> +		for (x = 0; x < width; x++) {
> +			scolor = *(const u32 *)(&sbuf8[src_offset + 3 * x]);
> +			dcolor = drm_draw_color_from_xrgb8888(scolor, format);
> +			wr_off = dst_offset + (x_pad + x) * sizeof(u32);
> +
> +			iosys_map_wr(map, wr_off, u32, dcolor);
> +		}
> +	}
> +}
> +
> +static void drm_splash_blit_rgb888(struct iosys_map *map, unsigned int dpitch,
> +				   unsigned int x_pad, unsigned int y_pad,
> +				   const u8 *sbuf8, unsigned int spitch,
> +				   unsigned int width, unsigned int height,
> +				   bool invert_y)
> +{
> +	unsigned int y, src_offset, dst_offset;
> +
> +	for (y = 0; y < height; y++) {
> +		src_offset = (invert_y ? (height - y - 1) : y) * spitch;
> +		dst_offset = (y_pad + y) * dpitch + x_pad * 3;
> +
> +		iosys_map_memcpy_to(map, dst_offset, &sbuf8[src_offset], width * 3);
> +	}
> +}
> +
> +static int drm_splash_bmp_to_scanout(struct drm_splash_scanout *scanout,
> +				     const u8 *data, size_t data_len)
> +
> +{
> +	struct drm_client_buffer *buffer = scanout->buffer;
> +	struct drm_client_dev *client = buffer->client;
> +	struct drm_framebuffer *fb = buffer->fb;
> +	u32 px_width = fb->format->cpp[0];
> +	const struct bmp_file_header *file_header;
> +	const struct bmp_dib_header *dib_header;
> +	u32 bmp_width, bmp_height, bmp_pitch;
> +	bool bmp_invert_y;
> +	unsigned int x_pad, y_pad;
> +	const u8 *image_data;
> +	struct iosys_map map;
> +	struct drm_rect r;
> +	int ret;
> +
> +	if (data_len < (sizeof(*file_header) + sizeof(*dib_header))) {
> +		drm_err(client->dev, "splash: BMP file too short");
> +		return -EINVAL;
> +	}
> +
> +	file_header = (const struct bmp_file_header *)data;
> +	if (file_header->id != BMP_FILE_MAGIC_ID) {
> +		drm_err(client->dev, "splash: invalid BMP magic 0x%04X",
> +			file_header->id);
> +		return -EINVAL;
> +	}
> +
> +	dib_header = (const struct bmp_dib_header *)(data + sizeof(*file_header));
> +
> +	/* Restrict supported format to uncompressed, 24bit RGB888 */
> +	if (dib_header->dib_header_size != 40 || dib_header->width < 0 ||
> +	    dib_header->planes != 1 || dib_header->compression != 0 ||
> +	    dib_header->bpp != 24) {
> +		drm_err(client->dev, "splash: invalid BMP format");
> +		return -EINVAL;
> +	}
> +
> +	bmp_width = dib_header->width;
> +	bmp_height = abs(dib_header->height);
> +	bmp_pitch = round_up(3 * bmp_width, 4);
> +	bmp_invert_y = (dib_header->height > 0);
> +
> +	if ((file_header->bitmap_offset + bmp_pitch * bmp_height) > data_len) {
> +		drm_err(client->dev, "splash: invalid BMP size");
> +		return -EINVAL;
> +	}
> +
> +	if (bmp_width > scanout->width || bmp_height > scanout->height) {
> +		drm_err(client->dev, "splash: BMP image is too big for the screen");
> +		return -EINVAL;
> +	}
> +
> +	image_data = data + file_header->bitmap_offset;
> +
> +	ret = drm_client_buffer_vmap_local(buffer, &map);
> +	if (ret) {
> +		drm_err(client->dev, "splash: cannot vmap buffer: %d", ret);
> +		return ret;
> +	}
> +
> +	/* Center X and Y */
> +	x_pad = (scanout->width - bmp_width) / 2;
> +	y_pad = (scanout->height - bmp_height) / 2;
> +	r = DRM_RECT_INIT(x_pad, y_pad, bmp_width, bmp_height);
> +
> +	/* In case the target format is RGB888, source data can be copied to
> +	 * the video buffer line by line, avoiding some overhead.
> +	 */
> +	if (scanout->format == DRM_FORMAT_RGB888) {
> +		drm_splash_blit_rgb888(&map, fb->pitches[0], x_pad, y_pad,
> +				       image_data, bmp_pitch, bmp_width,
> +				       bmp_height, bmp_invert_y);
> +	} else {
> +		switch (px_width) {
> +		case 2:
> +			drm_splash_blit_pix16(&map, fb->pitches[0], x_pad,
> +					      y_pad, image_data, bmp_pitch,
> +					      bmp_width, bmp_height,
> +					      bmp_invert_y, scanout->format);
> +			break;
> +		case 3:
> +			drm_splash_blit_pix24(&map, fb->pitches[0], x_pad,
> +					      y_pad, image_data, bmp_pitch,
> +					      bmp_width, bmp_height,
> +					      bmp_invert_y, scanout->format);
> +			break;
> +		case 4:
> +			drm_splash_blit_pix32(&map, fb->pitches[0], x_pad,
> +					      y_pad, image_data, bmp_pitch,
> +					      bmp_width, bmp_height,
> +					      bmp_invert_y, scanout->format);
> +			break;
> +		default:
> +			drm_warn_once(client->dev,
> +				      "splash: can't blit with pixel width %d",
> +				      px_width);
> +		}
> +	}
> +
> +	drm_client_buffer_vunmap_local(buffer);
> +
> +	return drm_client_buffer_flush(buffer, &r);
> +}
> +#else
> +static inline int drm_splash_bmp_to_scanout(struct drm_splash_scanout *scanout,
> +					    const u8 *data, size_t data_len)
> +{
> +	return -EOPNOTSUPP;
> +}
> +#endif
> +
> +static int drm_splash_draw_scanout(struct drm_splash *splash,
> +				   struct drm_splash_scanout *scanout,
> +				   const u8 *data, size_t data_len)
> +{
> +	if (!scanout->buffer)
> +		return -ENODEV;
> +
> +	if (!scanout->bg_drawn) {
> +		u32 color = drm_draw_color_from_xrgb8888(splash_color,
> +							 scanout->format);
> +		drm_splash_fill_solid_color(scanout->buffer, color);
> +		scanout->bg_drawn = true;
> +	}
> +
> +	if (data != NULL) {
> +		/* Ignore the return value, since the solid color has already
> +		 * been drawn to screen.
> +		 */
> +		drm_splash_bmp_to_scanout(scanout, data, data_len);
> +	}
> +
> +	return 0;
> +}
> +
> +static int drm_splash_render_thread(void *data)
> +{
> +	struct drm_splash *splash = data;
> +	struct drm_client_dev *client = &splash->client;
> +
> +	while (!kthread_should_stop()) {
> +		unsigned int draw_count = 0;
> +		drm_splash_data_get_func_t get_fn = NULL;
> +		drm_splash_data_release_func_t release_fn = NULL;
> +		void *priv = NULL;
> +		const u8 *img_data = NULL;
> +		size_t img_data_len = 0;
> +		int i, ret;
> +
> +		drm_splash_data_source_pop(splash, &get_fn, &release_fn, &priv);
> +
> +		if (get_fn) {
> +			ret = get_fn(priv, &img_data, &img_data_len);
> +			if (ret) {
> +				drm_err(client->dev,
> +					"splash: failed to get image data: %d",
> +					ret);
> +			}
> +		}
> +
> +		for (i = 0; i < splash->n_scanout; i++) {
> +			ret = drm_splash_draw_scanout(splash,
> +						      &splash->scanout[i],
> +						      img_data, img_data_len);
> +			if (ret) {
> +				drm_err(client->dev,
> +					"splash: failed to fill scanout %d: %d",
> +					i, ret);
> +				continue;
> +			}
> +
> +			draw_count++;
> +		}
> +
> +		if (release_fn)
> +			release_fn(priv);
> +
> +		if (draw_count > 0) {
> +			ret = drm_client_modeset_commit(client);
> +			/* If commit returns EBUSY, another master showed up.
> +			 * This means that the splash is no more required.
> +			 */
> +			if (ret == -EBUSY) {
> +				drm_info(client->dev,
> +					"splash: not master anymore, exiting");
> +				break;
> +			}
> +		}
> +
> +		/* If no changes arrived in the mean time, wait to be awaken,
> +		 * e.g.by a firmware callback.
> +		 */
> +		if (atomic_xchg(&splash->pending, 0) == 0)
> +			set_current_state(TASK_UNINTERRUPTIBLE);
> +
> +		schedule();
> +	}
> +
> +	return 0;
> +}
> +
> +static inline void drm_splash_wake_render_thread(struct drm_splash *splash)
> +{
> +	atomic_set(&splash->pending, 1);
> +	wake_up_process(splash->thread);
> +}
> +
> +#if IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_SRC_BMP)
> +static int drm_splash_fw_get(void *priv, const u8 **data, size_t *size)
> +{
> +	const struct firmware *fw = priv;
> +
> +	if (!fw)
> +		return -ENODATA;
> +
> +	*data = fw->data;
> +	*size = fw->size;
> +
> +	return 0;
> +}
> +
> +static void drm_splash_fw_release(void *priv)
> +{
> +	const struct firmware *fw = priv;
> +
> +	if (fw)
> +		release_firmware(fw);
> +}
> +
> +static void drm_splash_fw_callback(const struct firmware *fw, void *context)
> +{
> +	struct drm_splash *splash = context;
> +	struct drm_client_dev *client = &splash->client;
> +
> +	if (!fw || !fw->data) {
> +		drm_err(client->dev, "splash: no firmware");
> +		return;
> +	}
> +
> +	drm_splash_data_source_push(splash, drm_splash_fw_get,
> +				    drm_splash_fw_release, (void *)fw);
> +
> +	/* Wake the render thread */
> +	drm_dbg(client->dev, "splash: firmware loaded, wake up drawing thread");
> +	drm_splash_wake_render_thread(splash);
> +}
> +
> +static int drm_splash_fw_request_bmp(struct drm_splash *splash)
> +{
> +	struct drm_client_dev *client = &splash->client;
> +
> +	drm_info(client->dev, "splash: request %s as firmware", splash_bmp);
> +
> +	return request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
> +				       splash_bmp, client->dev->dev, GFP_KERNEL,
> +				       splash, drm_splash_fw_callback);
> +}
> +#else
> +static inline int drm_splash_fw_request_bmp(struct drm_splash *splash)
> +{
> +	return -EOPNOTSUPP;
> +}
> +#endif // CONFIG_DRM_CLIENT_SPLASH_SRC_BMP
> +
> +#if IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_SRC_BGRT)
> +static int drm_splash_bgrt_get_data(void *priv, const u8 **data, size_t *size)
> +{
> +	void *bgrt_image = priv;
> +
> +	*data = bgrt_image;
> +	*size = bgrt_image_size;
> +
> +	return 0;
> +}
> +
> +static void drm_splash_bgrt_release(void *priv)
> +{
> +	void *bgrt_image = priv;
> +
> +	if (bgrt_image)
> +		memunmap(bgrt_image);
> +}
> +
> +static int drm_splash_bgrt_load(struct drm_splash *splash)
> +{
> +	struct drm_client_dev *client = &splash->client;
> +	void *bgrt_image = NULL;
> +
> +	drm_info(client->dev, "splash: using EFI BGRT");
> +
> +	if (!bgrt_tab.image_address) {
> +		drm_info(client->dev, "splash: no BGRT found");
> +		return -ENOENT;
> +	}
> +
> +	if (bgrt_tab.status & 0x06) {
> +		drm_info(client->dev, "splash: BGRT rotation bits set, skipping");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	drm_dbg(client->dev, "splash: BGRT image is at 0x%016llx, size=%zX",
> +		bgrt_tab.image_address, bgrt_image_size);
> +
> +	bgrt_image = memremap(bgrt_tab.image_address, bgrt_image_size,
> +			      MEMREMAP_WB);
> +	if (!bgrt_image) {
> +		drm_warn(client->dev, "splash: failed to map BGRT image memory");
> +		return -ENOMEM;
> +	}
> +
> +	drm_splash_data_source_push(splash, drm_splash_bgrt_get_data,
> +				    drm_splash_bgrt_release, bgrt_image);
> +
> +	drm_splash_wake_render_thread(splash);
> +
> +	return 0;
> +}
> +#else
> +static inline int drm_splash_bgrt_load(struct drm_splash *splash)
> +{
> +	return -EOPNOTSUPP;
> +}
> +#endif // CONFIG_DRM_CLIENT_SPLASH_SRC_BGRT
> +
> +static int drm_splash_init_client(struct drm_splash *splash)
> +{
> +	struct drm_client_dev *client = &splash->client;
> +	struct drm_mode_set *modeset;
> +	unsigned int modeset_mask = 0;
> +	unsigned int fb_count = 0;
> +	int j;
> +
> +	if (drm_client_modeset_probe(client, 0, 0))
> +		return -1;
> +
> +	j = 0;
> +	drm_client_for_each_modeset(modeset, client) {
> +		struct drm_splash_scanout *tmp;
> +		struct drm_splash_scanout *scanout;
> +		u32 format;
> +		int id = -1;
> +
> +		/* Skip modesets without a mode */
> +		if (!modeset->mode)
> +			continue;
> +
> +		if (modeset->connectors[0]->has_tile) {
> +			struct drm_splash_scanout *tiled;
> +			int new_id = modeset->connectors[0]->tile_group->id;
> +
> +			/* Tiled modesets contribute to a single framebuffer,
> +			 * check if this tiled group has already been seen.
> +			 */
> +			tiled = get_scanout_from_tile_group(splash, new_id);
> +			if (tiled != NULL) {
> +				if (!modeset->x)
> +					tiled->width += modeset->mode->vdisplay;
> +				if (!modeset->y)
> +					tiled->height += modeset->mode->hdisplay;
> +				modeset->fb = tiled->buffer->fb;
> +				continue;
> +			}
> +
> +			/* New tile group, save its ID for later */
> +			id = new_id;
> +		}
> +
> +		format = drm_splash_find_usable_format(modeset->crtc->primary,
> +						       splash->preferred_format);
> +		if (format == DRM_FORMAT_INVALID) {
> +			drm_warn(client->dev,
> +				 "splash: can't find a usable format for modeset");
> +			continue;
> +		}
> +
> +		tmp = krealloc(splash->scanout,
> +			       (splash->n_scanout + 1) * sizeof(*splash->scanout),
> +			       GFP_KERNEL);
> +		if (!tmp) {
> +			drm_warn(client->dev,
> +				 "splash: can't reallocate the scanout array");
> +			break;
> +		}
> +
> +		splash->scanout = tmp;
> +		scanout = &splash->scanout[splash->n_scanout];
> +		splash->n_scanout++;
> +
> +		memset(scanout, 0, sizeof(*scanout));
> +		scanout->id = id;
> +		scanout->format = format;
> +		scanout->width = modeset->mode->hdisplay;
> +		scanout->height = modeset->mode->vdisplay;
> +
> +		modeset_mask |= BIT(j);
> +		j++;
> +	}
> +
> +	/* Now that all sensible modesets have been collected, allocate buffers */
> +	j = 0;
> +	drm_client_for_each_modeset(modeset, client) {
> +		struct drm_splash_scanout *scanout;
> +
> +		if (!(modeset_mask & BIT(j)))
> +			continue;
> +
> +		scanout = &splash->scanout[j];
> +		j++;
> +
> +		scanout->buffer = drm_client_buffer_create_dumb(client,
> +								scanout->width,
> +								scanout->height,
> +								scanout->format);
> +		if (IS_ERR(scanout->buffer)) {
> +			drm_warn(client->dev,
> +				 "splash: can't create dumb buffer %d %d %p4cc",
> +				 scanout->width, scanout->height, &scanout->format);
> +			continue;
> +		}
> +
> +		drm_info(client->dev, "splash: created dumb buffer %d %d %p4cc",
> +			 scanout->width, scanout->height, &scanout->format);
> +
> +		modeset->fb = scanout->buffer->fb;
> +		fb_count++;
> +	}
> +
> +	return (fb_count == 0) ? -ENODEV : 0;
> +}
> +
> +static void drm_splash_free_scanout(struct drm_client_dev *client)
> +{
> +	struct drm_splash *splash = client_to_drm_splash(client);
> +	int i;
> +
> +	if (splash->n_scanout) {
> +		for (i = 0; i < splash->n_scanout; i++)
> +			drm_client_buffer_delete(splash->scanout[i].buffer);
> +
> +		splash->n_scanout = 0;
> +		kfree(splash->scanout);
> +		splash->scanout = NULL;
> +	}
> +}
> +
> +static int drm_splash_client_hotplug(struct drm_client_dev *client)
> +{
> +	struct drm_splash *splash = client_to_drm_splash(client);
> +	int ret;
> +
> +	guard(mutex)(&splash->hotplug_lock);
> +
> +	/* The modesets that get a splash are defined at first hotplug event */
> +	if (splash->initialized)
> +		return 0;
> +
> +	ret = drm_splash_init_client(splash);
> +	if (ret == -ENODEV) {
> +		drm_info(client->dev, "splash: no modeset found");
> +		return 0;
> +	} else if (ret) {
> +		drm_err(client->dev,
> +			"splash: failed to init client: %d", ret);
> +		return ret;
> +	}
> +
> +	/* Create the render thread, waken later */
> +	splash->thread = kthread_create(drm_splash_render_thread,
> +					splash, "drm_splash_%s",
> +					client->dev->unique);
> +	if (IS_ERR(splash->thread)) {
> +		ret = PTR_ERR(splash->thread);
> +		drm_err(client->dev, "splash: failed to create render thread: %d", ret);
> +		drm_splash_free_scanout(client);
> +		return ret;
> +	}
> +
> +	if (IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_SRC_BMP))
> +		ret = drm_splash_fw_request_bmp(splash);
> +	else if (IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_SRC_BGRT))
> +		ret = drm_splash_bgrt_load(splash);

I'm not sure this logic will actually work in this order.
CONFIG_DRM_CLIENT_SPLASH_SRC_BGRT selects
CONFIG_DRM_CLIENT_SPLASH_SRC_BMP

So won't the BGRT path never run?

> +	else
> +		ret = 0;
> +
> +	if (ret) {
> +		drm_err(client->dev, "splash: failed to kick image load: %d", ret);
> +		kthread_stop(splash->thread);
> +		drm_splash_free_scanout(client);
> +		return ret;
> +	}
> +
> +	/* Wake the render thread to show initial contents */
> +	drm_splash_wake_render_thread(splash);
> +
> +	splash->initialized = true;
> +
> +	return 0;
> +}
> +
> +static int drm_splash_client_restore(struct drm_client_dev *client, bool force)
> +{
> +	int ret;
> +
> +	if (force)
> +		ret = drm_client_modeset_commit_locked(client);
> +	else
> +		ret = drm_client_modeset_commit(client);
> +
> +	return ret;
> +}
> +
> +static void drm_splash_client_unregister(struct drm_client_dev *client)
> +{
> +	struct drm_splash *splash = client_to_drm_splash(client);
> +
> +	kthread_stop(splash->thread);
> +	drm_splash_free_scanout(client);
> +	drm_client_release(client);
> +
> +	if (splash->data_release)
> +		splash->data_release(splash->data_priv);
> +}
> +
> +static void drm_splash_client_free(struct drm_client_dev *client)
> +{
> +	struct drm_splash *splash = client_to_drm_splash(client);
> +	struct drm_device *dev = client->dev;
> +
> +	mutex_destroy(&splash->hotplug_lock);
> +	kfree(splash);
> +
> +	drm_dbg(dev, "Unregistered with drm splash");
> +}
> +
> +static const struct drm_client_funcs drm_splash_client_funcs = {
> +	.owner		= THIS_MODULE,
> +	.hotplug	= drm_splash_client_hotplug,
> +	.restore	= drm_splash_client_restore,
> +	.unregister	= drm_splash_client_unregister,
> +	.free		= drm_splash_client_free,
> +};
> +
> +/**
> + * drm_splash_register() - Register a drm device to drm_splash
> + * @dev: the drm device to register.
> + * @format: drm device preferred format.
> + */
> +void drm_splash_register(struct drm_device *dev,
> +			 const struct drm_format_info *format)
> +{
> +	struct drm_splash *splash;
> +
> +	splash = kzalloc(sizeof(*splash), GFP_KERNEL);
> +	if (!splash)
> +		goto err_warn;
> +
> +	mutex_init(&splash->hotplug_lock);
> +	spin_lock_init(&splash->data_lock);
> +
> +	if (format && format->num_planes == 1)
> +		splash->preferred_format = format->format;
> +	else
> +		splash->preferred_format = DRM_FORMAT_RGB888;
> +
> +	if (drm_client_init(dev, &splash->client, "drm_splash",
> +			    &drm_splash_client_funcs))
> +		goto err_free;
> +
> +	drm_client_register(&splash->client);
> +	drm_dbg(dev, "Registered with drm splash");
> +
> +	return;
> +
> +err_free:
> +	kfree(splash);
> +err_warn:
> +	drm_warn(dev, "Failed to register with drm splash");
> +}
> 

