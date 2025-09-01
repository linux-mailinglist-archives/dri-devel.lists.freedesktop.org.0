Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC3EB3E5D2
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 15:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C8210E0FB;
	Mon,  1 Sep 2025 13:44:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="UlUsYZ8c";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PIS+5WP5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZoZODmfP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vcUFOO0u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE0C10E0FB
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 13:44:15 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id ED6FA2118A;
 Mon,  1 Sep 2025 13:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756734254; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Q0XA9r1bjc9lskBCDG5Cey5wNu3IOSlvD3/sZjy+xKo=;
 b=UlUsYZ8cF30MBfn3hjk3C8r94crCZdbrrPHCHfMaHchu7hjIYCYdIc02t7hAqwpKWxgTv/
 tXgUeZxux/7HUZfHk/WoMdU7+vy5A/T+7VMQmpZLEcB5W83zm62z+GSo6ElxTcMgUiep4s
 ObyKsy9iQj7gm9b6qy5c3//4MM9t1us=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756734254;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Q0XA9r1bjc9lskBCDG5Cey5wNu3IOSlvD3/sZjy+xKo=;
 b=PIS+5WP5hDbs/hQ8J1w1r26UoLnoopmsLytFNKvN2tay5sWpXtEAMjSuZRk18D7pRCGA4E
 c9nKtHS3B7wEHEAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756734253; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Q0XA9r1bjc9lskBCDG5Cey5wNu3IOSlvD3/sZjy+xKo=;
 b=ZoZODmfP3mn7ieBUX6Td+bZwHVpRRRPu5hIMq6E9S56xL8LliBoM4QlNZIUh/+idRZFKa8
 soIJPzPPSz91HlvCZKdsJskxPrcHx6o83au4xZ2V9vSk3ZsL0SqM8uLrsGbOAFfrjcXItD
 /ekTiggeJqOrk34ockB9G/MvEu3vC6A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756734253;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Q0XA9r1bjc9lskBCDG5Cey5wNu3IOSlvD3/sZjy+xKo=;
 b=vcUFOO0uic9HBiUTtX5GhAN+Gb55gqTgzMPOt46ZYRJUtsVFKC/ulnkuHkJ9HMvRNPpWbs
 ywdaG+J75bIyGrBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 939C91378C;
 Mon,  1 Sep 2025 13:44:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cfiOIi2jtWiKQgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 01 Sep 2025 13:44:13 +0000
Message-ID: <84ce2039-3a45-4790-886d-9ce854b4a1e8@suse.de>
Date: Mon, 1 Sep 2025 15:44:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm: Add driver for Sitronix ST7920 LCD displays
To: Iker Pedrosa <ikerpedrosam@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20250806-st7920-v1-0-64ab5a34f9a0@gmail.com>
 <20250806-st7920-v1-1-64ab5a34f9a0@gmail.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20250806-st7920-v1-1-64ab5a34f9a0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 TAGGED_RCPT(0.00)[dt]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_TWELVE(0.00)[12];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,ffwll.ch,redhat.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80
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

Hi,

thanks for the driver. Review is below.

Am 06.08.25 um 14:48 schrieb Iker Pedrosa:
> This adds a functional DRM driver for ST7920 that communicates with the
> display via the SPI bus.
>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---
>   drivers/gpu/drm/sitronix/Kconfig  |  10 +
>   drivers/gpu/drm/sitronix/Makefile |   1 +
>   drivers/gpu/drm/sitronix/st7920.c | 869 ++++++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/sitronix/st7920.h |  55 +++
>   4 files changed, 935 insertions(+)
>
> diff --git a/drivers/gpu/drm/sitronix/Kconfig b/drivers/gpu/drm/sitronix/Kconfig
> index 6de7d92d9b74c72746915b945869dba91f161d2b..68f792dda14e83f457579ae7c240f4cc6a469d33 100644
> --- a/drivers/gpu/drm/sitronix/Kconfig
> +++ b/drivers/gpu/drm/sitronix/Kconfig
> @@ -40,3 +40,13 @@ config DRM_ST7735R
>   
>   	  If M is selected the module will be called st7735r.
>   
> +config DRM_ST7920
> +	tristate "DRM support for Sitronix ST7920 LCD displays"
> +	depends on DRM && SPI
> +	select DRM_GEM_SHMEM_HELPER
> +	select DRM_KMS_HELPER
> +	select REGMAP_SPI
> +	help
> +	  DRM driver for the ST7920 Sitronix LCD controllers.
> +
> +	  If M is selected the module will be called st7920.
> diff --git a/drivers/gpu/drm/sitronix/Makefile b/drivers/gpu/drm/sitronix/Makefile
> index bd139e5a6995fa026cc635b3c29782473d1efad7..2f064a518121bfee3cca73acd42589e8c54cd4d7 100644
> --- a/drivers/gpu/drm/sitronix/Makefile
> +++ b/drivers/gpu/drm/sitronix/Makefile
> @@ -1,3 +1,4 @@
>   obj-$(CONFIG_DRM_ST7571_I2C)		+= st7571-i2c.o
>   obj-$(CONFIG_DRM_ST7586)		+= st7586.o
>   obj-$(CONFIG_DRM_ST7735R)		+= st7735r.o
> +obj-$(CONFIG_DRM_ST7920))		+= st7920.o
> diff --git a/drivers/gpu/drm/sitronix/st7920.c b/drivers/gpu/drm/sitronix/st7920.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..c3226f352e39c626e3654250631521d07edf6784
> --- /dev/null
> +++ b/drivers/gpu/drm/sitronix/st7920.c
> @@ -0,0 +1,869 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * DRM driver for Sitronix ST7920 LCD displays
> + *
> + * Copyright 2025 Iker Pedrosa <ikerpedrosam@gmail.com>
> + *
> + */
> +
> +#include <linux/bitrev.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <linux/spi/spi.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_client_setup.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_damage_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fbdev_shmem.h>
> +#include <drm/drm_framebuffer.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_plane.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include "st7920.h"
> +
> +#define DRIVER_NAME	"sitronix_st7920"
> +#define DRIVER_DESC	"DRM driver for Sitronix ST7920 LCD displays"
> +#define DRIVER_DATE	"20250723"
> +#define DRIVER_MAJOR	1
> +#define DRIVER_MINOR	0
> +
> +/* Display organization */
> +#define WIDTH_BYTES		16
> +#define HEIGHT_IN_PIXELS	64
> +#define BYTES_IN_DISPLAY	(WIDTH_BYTES * HEIGHT_IN_PIXELS)
> +#define BYTES_IN_SEGMENT	2
> +#define PIXELS_IN_SEGMENT	(BYTES_IN_SEGMENT * 8)
> +
> +/* Sync sequence */
> +#define SYNC_BITS			0xF8
> +#define RW_HIGH				0x04
> +#define RS_HIGH				0x02
> +
> +/* Commands */
> +#define SET_DISPLAY_ON			0x0C
> +#define SET_DISPLAY_OFF			0x08
> +#define SET_DISPLAY_CLEAR		0x01
> +#define SET_BASIC_INSTRUCTION_SET	0x30
> +#define SET_EXT_INSTRUCTION_SET		0x34
> +#define SET_GRAPHICS_DISPLAY		0x36
> +#define SET_GDRAM_ADDRESS		0x80
> +#define SET_GDRAM_DATA			0xFF /* Driver internal command */
> +
> +/* Masks */
> +#define HIGH_DATA_MASK			0xF0
> +#define LOW_DATA_MASK			0x0F
> +#define TOP_VERTICAL_ADDRESS		0x80
> +#define BOTTOM_VERTICAL_ADDRESS		0x60
> +#define TOP_HORIZONTAL_ADDRESS		0x00
> +#define BOTTOM_HORIZONTAL_ADDRESS	0x80
> +
> +#define CMD_SIZE			35
> +
> +const struct st7920_deviceinfo st7920_variants[] = {
> +	[ST7920_ID] = {
> +		.default_width = 128,
> +		.default_height = 64,
> +		.family_id = ST7920_FAMILY,
> +	}
> +};
> +EXPORT_SYMBOL_NS_GPL(st7920_variants, DRM_ST7920);
> +
> +struct st7920_plane_state {
> +	struct drm_shadow_plane_state base;
> +	/* Intermediate buffer to convert pixels from XRGB8888 to HW format */
> +	u8 *buffer;
> +};
> +
> +struct st7920_crtc_state {
> +	struct drm_crtc_state base;
> +	/* Buffer to store pixels in HW format and written to the panel */
> +	u8 *data_array;
> +};
> +
> +static inline struct st7920_plane_state *to_st7920_plane_state(struct drm_plane_state *state)
> +{
> +	return container_of(state, struct st7920_plane_state, base.base);
> +}
> +
> +static inline struct st7920_crtc_state *to_st7920_crtc_state(struct drm_crtc_state *state)
> +{
> +	return container_of(state, struct st7920_crtc_state, base);
> +}
> +
> +static inline struct st7920_device *drm_to_st7920(struct drm_device *drm)
> +{
> +	return container_of(drm, struct st7920_device, drm);
> +}
> +
> +static int st7920_spi_write(struct spi_device *spi, int cmd, const void *data, size_t size)

Many calls to this helper looks like

ret = st7920_spi_write()
if (ret)
    return ret
udelay()


I suggest to internalize this pattern in the helper, like this

struct spi7920_error{
   int errno;
}

spi7920_spi_write(  delay_us, struct spi7920_error *err)
{
     if (err->errno)
       return errno;

     /* no do current spi_write() */

   ret  = spi_write()
   if (ret) {
     err->errno = ret
     return ret;
   }

   if (delay_us)
     udelay(delay_us)

   return ret;
}

This way, you can make multiple calls in a row and only test after the 
final final call for an error. That makes the caller side much nicer to 
read.


> +{
> +	u8 reg[CMD_SIZE] = {0};
> +	int i = 0, j = 0;
> +	int ret;
> +
> +	/*
> +	 * First the sync bits are sent: 11111WS0.
> +	 * Where W is the read/write (RW) bit and S is the register/data (RS) bit.
> +	 * Then, every 8 bits instruction/data will be separated into 2 groups.
> +	 * Higher 4 bits (DB7~DB4) will be placed in the first section followed by
> +	 * 4 '0's. And lower 4 bits (DB3~DB0) will be placed in the second section
> +	 * followed by 4 '0's.
> +	 */
> +	if (cmd == SET_GDRAM_ADDRESS) {

It's much nicer to write a single function for each branch than to put 
everything into a single helper with the in-transparent, non-typesafe 
data arguments.

> +		const u8 y_addr = *(const u8 *)data;
> +		bool bottom_screen = (y_addr >= 32);
> +
> +		reg[i++] = SYNC_BITS;
> +		/* Set vertical address */
> +		if (!bottom_screen)
> +			reg[i++] = TOP_VERTICAL_ADDRESS + (*(uint8_t *)data & HIGH_DATA_MASK);
> +		else
> +			reg[i++] = BOTTOM_VERTICAL_ADDRESS + (*(uint8_t *)data & HIGH_DATA_MASK);
> +
> +		reg[i++] = *(uint8_t *)data << 4;
> +		/* Set horizontal address */
> +		reg[i++] = SET_GDRAM_ADDRESS;
> +		if (!bottom_screen)
> +			reg[i++] = TOP_HORIZONTAL_ADDRESS;
> +		else
> +			reg[i++] = BOTTOM_HORIZONTAL_ADDRESS;
> +	} else if (cmd == SET_GDRAM_DATA) {
> +		const u8 *line_data = data;
> +
> +		reg[i++] = SYNC_BITS | RS_HIGH;
> +
> +		for (j = 0; j < 16; j++) {
> +			reg[i++] = line_data[j] & 0xF0;
> +			reg[i++] = (line_data[j] << 4) & 0xF0;
> +		}
> +	} else {
> +		reg[i++] = SYNC_BITS;
> +		reg[i++] = cmd & HIGH_DATA_MASK;
> +		reg[i++] = (cmd & LOW_DATA_MASK) << 4;
> +	}
> +
> +	ret = spi_write(spi, reg, i);
> +
> +	return ret;
> +}
> +
> +static const struct regmap_config st7920_spi_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +};
> +
> +static const struct of_device_id st7920_of_match[] = {
> +	/* st7920 family */
> +	{
> +		.compatible = "sitronix,st7920",
> +		.data = &st7920_variants[ST7920_ID],
> +	},
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, st7920_of_match);
> +
> +/*
> + * The SPI core always reports a MODALIAS uevent of the form "spi:<dev>", even
> + * if the device was registered via OF. This means that the module will not be
> + * auto loaded, unless it contains an alias that matches the MODALIAS reported.
> + *
> + * To workaround this issue, add a SPI device ID table. Even when this should
> + * not be needed for this driver to match the registered SPI devices.
> + */
> +static const struct spi_device_id st7920_spi_id[] = {
> +	/* st7920 family */
> +	{ "st7920",  ST7920_ID },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(spi, st7920_spi_id);
> +
> +static int st7920_power_on(struct st7920_device *st7920)
> +{
> +	int ret;
> +
> +	ret = st7920_spi_write(st7920->spi, SET_DISPLAY_ON, NULL, 0);
> +	if (ret < 0)
> +		return ret;
> +	udelay(72);
> +
> +	return ret;
> +}
> +
> +static int st7920_power_off(struct st7920_device *st7920)
> +{
> +	int ret;
> +
> +	ret = st7920_spi_write(st7920->spi, SET_DISPLAY_CLEAR, NULL, 0);
> +	udelay(1600);
> +	ret = st7920_spi_write(st7920->spi, SET_DISPLAY_OFF, NULL, 0);
> +	udelay(72);
> +
> +	return ret;
> +}
> +
> +static int st7920_init(struct st7920_device *st7920)
> +{
> +	int ret;
> +
> +	ret = st7920_spi_write(st7920->spi, SET_BASIC_INSTRUCTION_SET, NULL, 0);
> +	if (ret < 0)
> +		return ret;
> +	udelay(72);
> +
> +	ret = st7920_power_on(st7920);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = st7920_spi_write(st7920->spi, SET_GRAPHICS_DISPLAY, NULL, 0);
> +	if (ret < 0)
> +		return ret;
> +	udelay(72);
> +
> +	ret = st7920_spi_write(st7920->spi, SET_DISPLAY_CLEAR, NULL, 0);
> +	if (ret < 0)
> +		return ret;
> +	udelay(1600);
> +
> +	return 0;
> +}
> +
> +static int st7920_update_rect(struct st7920_device *st7920,
> +			       struct drm_rect *rect, u8 *buf,
> +			       u8 *data_array)
> +{
> +	u32 array_idx = 0;
> +	int i, j;
> +	int ret;
> +
> +	/*
> +	 * The screen is divided in 64(Y)x8(X) segments and each segment is
> +	 * further divided in 2 bytes (D15~D0).
> +	 *
> +	 * Segment 0x0 is in the top-right corner, while segment 63x15 is in the
> +	 * bottom-left. They would be displayed in the screen in the following way:
> +	 * 0x0  0x1  0x2  ... 0x15
> +	 * 1x0  1x1  1x2  ... 1x15
> +	 * ...
> +	 * 63x0 63x1 63x2 ... 63x15
> +	 *
> +	 * The data in each byte is big endian.
> +	 */
> +
> +	for (i = 0; i < HEIGHT_IN_PIXELS; i++) {
> +		u8 *line_start = buf + (i * WIDTH_BYTES);
> +		u8 line_buffer[WIDTH_BYTES];
> +
> +		for (j = 0; j < WIDTH_BYTES; j++) {
> +			line_buffer[j] = bitrev8(line_start[j]);
> +			data_array[array_idx++] = line_buffer[j];
> +		}
> +
> +		ret = st7920_spi_write(st7920->spi, SET_GDRAM_ADDRESS, &i, 1);
> +		if (ret < 0)
> +			return ret;
> +		udelay(72);
> +
> +		ret = st7920_spi_write(st7920->spi, SET_GDRAM_DATA, line_buffer, WIDTH_BYTES);
> +		if (ret < 0)
> +			return ret;
> +		udelay(72);
> +	}
> +
> +	return ret;
> +}
> +
> +static void st7920_clear_screen(struct st7920_device *st7920, u8 *data_array)
> +{
> +	memset(data_array, 0, BYTES_IN_DISPLAY);
> +
> +	st7920_spi_write(st7920->spi, SET_DISPLAY_CLEAR, NULL, 0);
> +	udelay(1600);
> +}
> +
> +static int st7920_fb_blit_rect(struct drm_framebuffer *fb,
> +				const struct iosys_map *vmap,
> +				struct drm_rect *rect,
> +				u8 *buf, u8 *data_array,
> +				struct drm_format_conv_state *fmtcnv_state)
> +{
> +	struct st7920_device *st7920 = drm_to_st7920(fb->dev);
> +	struct iosys_map dst;
> +	unsigned int dst_pitch;
> +	int ret = 0;
> +
> +	/* Align y to display page boundaries */
> +	rect->y1 = round_down(rect->y1, PIXELS_IN_SEGMENT);
> +	rect->y2 = min_t(unsigned int, round_up(rect->y2, PIXELS_IN_SEGMENT), st7920->height);
> +
> +	dst_pitch = DIV_ROUND_UP(drm_rect_width(rect), 8);
> +
> +	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
> +	if (ret)
> +		return ret;

Please call this in st7920_primary_plane_atomic_update() after 
drm_dev_enter().


> +
> +	iosys_map_set_vaddr(&dst, buf);
> +	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_state);
> +


> +	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);

And this call belongs before drm_dev_exit().

> +
> +	st7920_update_rect(st7920, rect, buf, data_array);
> +
> +	return ret;
> +}
> +
> +static int st7920_primary_plane_atomic_check(struct drm_plane *plane,
> +					      struct drm_atomic_state *state)
> +{
> +	struct drm_device *drm = plane->dev;
> +	struct st7920_device *st7920 = drm_to_st7920(drm);
> +	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct st7920_plane_state *st7920_state = to_st7920_plane_state(plane_state);
> +	struct drm_shadow_plane_state *shadow_plane_state = &st7920_state->base;
> +	struct drm_crtc *crtc = plane_state->crtc;
> +	struct drm_crtc_state *crtc_state = NULL;
> +	const struct drm_format_info *fi;
> +	unsigned int pitch;
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
> +	fi = drm_format_info(DRM_FORMAT_R1);
> +	if (!fi)
> +		return -EINVAL;
> +
> +	pitch = drm_format_info_min_pitch(fi, 0, st7920->width);
> +
> +	if (plane_state->fb->format != fi) {
> +		void *buf;
> +
> +		/* format conversion necessary; reserve buffer */
> +		buf = drm_format_conv_state_reserve(&shadow_plane_state->fmtcnv_state,
> +						    pitch, GFP_KERNEL);
> +		if (!buf)
> +			return -ENOMEM;
> +	}
> +
> +	st7920_state->buffer = kcalloc(pitch, st7920->height, GFP_KERNEL);
> +	if (!st7920_state->buffer)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +static void st7920_primary_plane_atomic_update(struct drm_plane *plane,
> +						struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
> +	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
> +	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, plane_state->crtc);
> +	struct st7920_crtc_state *st7920_crtc_state =  to_st7920_crtc_state(crtc_state);
> +	struct st7920_plane_state *st7920_plane_state = to_st7920_plane_state(plane_state);
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
> +		st7920_fb_blit_rect(fb, &shadow_plane_state->data[0], &dst_clip,
> +				     st7920_plane_state->buffer,
> +				     st7920_crtc_state->data_array,
> +				     &shadow_plane_state->fmtcnv_state);
> +	}
> +
> +	drm_dev_exit(idx);
> +}
> +
> +static void st7920_primary_plane_atomic_disable(struct drm_plane *plane,
> +						 struct drm_atomic_state *state)
> +{
> +	struct drm_device *drm = plane->dev;
> +	struct st7920_device *st7920 = drm_to_st7920(drm);
> +	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct drm_crtc_state *crtc_state;
> +	struct st7920_crtc_state *st7920_crtc_state;
> +	int idx;
> +
> +	if (!plane_state->crtc)
> +		return;
> +
> +	crtc_state = drm_atomic_get_new_crtc_state(state, plane_state->crtc);
> +	st7920_crtc_state = to_st7920_crtc_state(crtc_state);
> +
> +	if (!drm_dev_enter(drm, &idx))
> +		return;
> +
> +	st7920_clear_screen(st7920, st7920_crtc_state->data_array);
> +
> +	drm_dev_exit(idx);
> +}
> +
> +/* Called during init to allocate the plane's atomic state. */
> +static void st7920_primary_plane_reset(struct drm_plane *plane)
> +{
> +	struct st7920_plane_state *st7920_state;
> +
> +	WARN_ON(plane->state);

Please use drm_WARN_ON_ONCE()

> +
> +	st7920_state = kzalloc(sizeof(*st7920_state), GFP_KERNEL);
> +	if (!st7920_state)
> +		return;
> +
> +	__drm_gem_reset_shadow_plane(plane, &st7920_state->base);
> +}
> +
> +static struct drm_plane_state *st7920_primary_plane_duplicate_state(struct drm_plane *plane)
> +{
> +	struct drm_shadow_plane_state *new_shadow_plane_state;
> +	struct st7920_plane_state *old_st7920_state;
> +	struct st7920_plane_state *st7920_state;
> +
> +	if (WARN_ON(!plane->state))
> +		return NULL;

dmr_WARN_ON_ONCE()

> +
> +	old_st7920_state = to_st7920_plane_state(plane->state);
> +	st7920_state = kmemdup(old_st7920_state, sizeof(*st7920_state), GFP_KERNEL);
> +	if (!st7920_state)
> +		return NULL;
> +
> +	/* The buffer is not duplicated and is allocated in .atomic_check */
> +	st7920_state->buffer = NULL;
> +
> +	new_shadow_plane_state = &st7920_state->base;
> +
> +	__drm_gem_duplicate_shadow_plane_state(plane, new_shadow_plane_state);
> +
> +	return &new_shadow_plane_state->base;
> +}
> +
> +static void st7920_primary_plane_destroy_state(struct drm_plane *plane,
> +						struct drm_plane_state *state)
> +{
> +	struct st7920_plane_state *st7920_state = to_st7920_plane_state(state);
> +
> +	kfree(st7920_state->buffer);
> +
> +	__drm_gem_destroy_shadow_plane_state(&st7920_state->base);
> +
> +	kfree(st7920_state);
> +}
> +
> +static const struct drm_plane_helper_funcs st7920_primary_plane_helper_funcs[] = {
> +	[ST7920_FAMILY] = {
> +		DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> +		.atomic_check = st7920_primary_plane_atomic_check,
> +		.atomic_update = st7920_primary_plane_atomic_update,
> +		.atomic_disable = st7920_primary_plane_atomic_disable,
> +	}
> +};
> +
> +static const struct drm_plane_funcs st7920_primary_plane_funcs = {
> +	.update_plane = drm_atomic_helper_update_plane,
> +	.disable_plane = drm_atomic_helper_disable_plane,
> +	.reset = st7920_primary_plane_reset,
> +	.atomic_duplicate_state = st7920_primary_plane_duplicate_state,
> +	.atomic_destroy_state = st7920_primary_plane_destroy_state,
> +	.destroy = drm_plane_cleanup,
> +};
> +
> +static enum drm_mode_status st7920_crtc_mode_valid(struct drm_crtc *crtc,
> +						    const struct drm_display_mode *mode)
> +{
> +	struct st7920_device *st7920 = drm_to_st7920(crtc->dev);
> +
> +	if (mode->hdisplay != st7920->mode.hdisplay &&
> +	    mode->vdisplay != st7920->mode.vdisplay)
> +		return MODE_ONE_SIZE;
> +	else if (mode->hdisplay != st7920->mode.hdisplay)
> +		return MODE_ONE_WIDTH;
> +	else if (mode->vdisplay != st7920->mode.vdisplay)
> +		return MODE_ONE_HEIGHT;

Please call drm_crtc_helper_mode_valid_fixed() to do this test for you.

> +
> +	return MODE_OK;
> +}
> +
> +static int st7920_crtc_atomic_check(struct drm_crtc *crtc,
> +				     struct drm_atomic_state *state)
> +{
> +	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +	struct st7920_crtc_state *st7920_state = to_st7920_crtc_state(crtc_state);
> +	int ret;
> +
> +	ret = drm_crtc_helper_atomic_check(crtc, state);
> +	if (ret)
> +		return ret;
> +
> +	st7920_state->data_array = kmalloc(BYTES_IN_DISPLAY, GFP_KERNEL);
> +	if (!st7920_state->data_array)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +/* Called during init to allocate the CRTC's atomic state. */
> +static void st7920_crtc_reset(struct drm_crtc *crtc)
> +{
> +	struct st7920_crtc_state *st7920_state;
> +
> +	WARN_ON(crtc->state);
> +
> +	st7920_state = kzalloc(sizeof(*st7920_state), GFP_KERNEL);
> +	if (!st7920_state)
> +		return;
> +
> +	__drm_atomic_helper_crtc_reset(crtc, &st7920_state->base);
> +}
> +
> +static struct drm_crtc_state *st7920_crtc_duplicate_state(struct drm_crtc *crtc)
> +{
> +	struct st7920_crtc_state *old_st7920_state;
> +	struct st7920_crtc_state *st7920_state;
> +
> +	if (WARN_ON(!crtc->state))
> +		return NULL;
> +
> +	old_st7920_state = to_st7920_crtc_state(crtc->state);
> +	st7920_state = kmemdup(old_st7920_state, sizeof(*st7920_state), GFP_KERNEL);
> +	if (!st7920_state)
> +		return NULL;
> +
> +	/* The buffer is not duplicated and is allocated in .atomic_check */
> +	st7920_state->data_array = NULL;
> +
> +	__drm_atomic_helper_crtc_duplicate_state(crtc, &st7920_state->base);
> +
> +	return &st7920_state->base;
> +}
> +
> +static void st7920_crtc_destroy_state(struct drm_crtc *crtc,
> +						struct drm_crtc_state *state)
> +{
> +	struct st7920_crtc_state *st7920_state = to_st7920_crtc_state(state);
> +
> +	kfree(st7920_state->data_array);
> +
> +	__drm_atomic_helper_crtc_destroy_state(state);
> +
> +	kfree(st7920_state);
> +}
> +
> +/*
> + * The CRTC is always enabled. Screen updates are performed by
> + * the primary plane's atomic_update function. Disabling clears
> + * the screen in the primary plane's atomic_disable function.
> + */
> +static const struct drm_crtc_helper_funcs st7920_crtc_helper_funcs[] = {
> +	[ST7920_FAMILY] = {

Are there other chips to support here? Because there's otherwise no 
point in using this additional array element.

> +		.mode_valid = st7920_crtc_mode_valid,
> +		.atomic_check = st7920_crtc_atomic_check,
> +	}
> +};
> +
> +static const struct drm_crtc_funcs st7920_crtc_funcs = {
> +	.reset = st7920_crtc_reset,
> +	.destroy = drm_crtc_cleanup,
> +	.set_config = drm_atomic_helper_set_config,
> +	.page_flip = drm_atomic_helper_page_flip,
> +	.atomic_duplicate_state = st7920_crtc_duplicate_state,
> +	.atomic_destroy_state = st7920_crtc_destroy_state,
> +};
> +
> +static void st7920_encoder_atomic_enable(struct drm_encoder *encoder,
> +						struct drm_atomic_state *state)
> +{
> +	struct drm_device *drm = encoder->dev;
> +	struct st7920_device *st7920 = drm_to_st7920(drm);
> +	int ret;
> +
> +	ret = st7920_init(st7920);
> +	if (ret)
> +		goto power_off;
> +
> +	return;
> +
> +power_off:
> +	st7920_power_off(st7920);
> +}
> +
> +static void st7920_encoder_atomic_disable(struct drm_encoder *encoder,
> +					struct drm_atomic_state *state)
> +{
> +	struct drm_device *drm = encoder->dev;
> +	struct st7920_device *st7920 = drm_to_st7920(drm);
> +
> +	st7920_power_off(st7920);
> +}
> +
> +static const struct drm_encoder_helper_funcs st7920_encoder_helper_funcs[] = {
> +	[ST7920_FAMILY] = {
> +		.atomic_enable = st7920_encoder_atomic_enable,
> +		.atomic_disable = st7920_encoder_atomic_disable,
> +	}
> +};
> +
> +static const struct drm_encoder_funcs st7920_encoder_funcs = {
> +	.destroy = drm_encoder_cleanup,
> +};
> +
> +static int st7920_connector_get_modes(struct drm_connector *connector)
> +{
> +	struct st7920_device *st7920 = drm_to_st7920(connector->dev);
> +	struct drm_display_mode *mode;
> +	struct device *dev = st7920->dev;
> +
> +	mode = drm_mode_duplicate(connector->dev, &st7920->mode);
> +	if (!mode) {
> +		dev_err(dev, "Failed to duplicated mode\n");
> +		return 0;
> +	}
> +
> +	drm_mode_probed_add(connector, mode);
> +	drm_set_preferred_mode(connector, mode->hdisplay, mode->vdisplay);

Please use drm_connector_helper_get_modes_fixed() to do this work for you.


> +
> +	/* There is only a single mode */
> +	return 1;
> +}
> +
> +static const struct drm_connector_helper_funcs st7920_connector_helper_funcs = {
> +	.get_modes = st7920_connector_get_modes,
> +};
> +
> +static const struct drm_connector_funcs st7920_connector_funcs = {
> +	.reset = drm_atomic_helper_connector_reset,
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = drm_connector_cleanup,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static const struct drm_mode_config_funcs st7920_mode_config_funcs = {
> +	.fb_create = drm_gem_fb_create_with_dirty,
> +	.atomic_check = drm_atomic_helper_check,
> +	.atomic_commit = drm_atomic_helper_commit,
> +};
> +
> +static const uint32_t st7920_formats[] = {
> +	DRM_FORMAT_XRGB8888,
> +};
> +
> +DEFINE_DRM_GEM_FOPS(st7920_fops);
> +
> +static const struct drm_driver st7920_drm_driver = {
> +	DRM_GEM_SHMEM_DRIVER_OPS,
> +	DRM_FBDEV_SHMEM_DRIVER_OPS,
> +	.name			= DRIVER_NAME,
> +	.desc			= DRIVER_DESC,
> +	.date			= DRIVER_DATE,
> +	.major			= DRIVER_MAJOR,
> +	.minor			= DRIVER_MINOR,
> +	.driver_features = DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
> +	.fops			= &st7920_fops,
> +};
> +
> +static int st7920_init_modeset(struct st7920_device *st7920)
> +{
> +	enum st7920_family_ids family_id = st7920->device_info->family_id;
> +	struct drm_display_mode *mode = &st7920->mode;
> +	struct device *dev = st7920->dev;
> +	struct drm_device *drm = &st7920->drm;
> +	unsigned long max_width, max_height;
> +	struct drm_plane *primary_plane;
> +	struct drm_crtc *crtc;
> +	struct drm_encoder *encoder;
> +	struct drm_connector *connector;
> +	int ret;
> +
> +	/*
> +	 * Modesetting
> +	 */
> +
> +	ret = drmm_mode_config_init(drm);
> +	if (ret) {
> +		dev_err(dev, "DRM mode config init failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	mode->type = DRM_MODE_TYPE_DRIVER;
> +	mode->clock = 1;
> +	mode->hdisplay = mode->htotal = st7920->device_info->default_width;

Only single assignments per line.  I know it's all made up, but htotal 
does very likely include every horizontal line; not just hdisplay.  Same 
for vtotal.

> +	mode->hsync_start = mode->hsync_end = st7920->device_info->default_width;
> +	mode->vdisplay = mode->vtotal = st7920->device_info->default_height;
> +	mode->vsync_start = mode->vsync_end = st7920->device_info->default_height;
> +	mode->width_mm = 27;
> +	mode->height_mm = 27;

> +
> +	max_width = max_t(unsigned long, mode->hdisplay, DRM_SHADOW_PLANE_MAX_WIDTH);
> +	max_height = max_t(unsigned long, mode->vdisplay, DRM_SHADOW_PLANE_MAX_HEIGHT);
> +
> +	drm->mode_config.min_width = mode->hdisplay;
> +	drm->mode_config.max_width = max_width;
> +	drm->mode_config.min_height = mode->vdisplay;
> +	drm->mode_config.max_height = max_height;
> +	drm->mode_config.preferred_depth = 24;
> +	drm->mode_config.funcs = &st7920_mode_config_funcs;
> +
> +	/* Primary plane */
> +
> +	primary_plane = &st7920->primary_plane;
> +	ret = drm_universal_plane_init(drm, primary_plane, 0, &st7920_primary_plane_funcs,
> +				    st7920_formats, ARRAY_SIZE(st7920_formats),
> +				    NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
> +	if (ret) {
> +		dev_err(dev, "DRM primary plane init failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	drm_plane_helper_add(primary_plane, &st7920_primary_plane_helper_funcs[family_id]);
> +
> +	drm_plane_enable_fb_damage_clips(primary_plane);
> +
> +	/* CRTC */
> +
> +	crtc = &st7920->crtc;
> +	ret = drm_crtc_init_with_planes(drm, crtc, primary_plane, NULL,
> +					&st7920_crtc_funcs, NULL);
> +	if (ret) {
> +		dev_err(dev, "DRM crtc init failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	drm_crtc_helper_add(crtc, &st7920_crtc_helper_funcs[family_id]);
> +
> +	/* Encoder */
> +
> +	encoder = &st7920->encoder;
> +	ret = drm_encoder_init(drm, encoder, &st7920_encoder_funcs,
> +			       DRM_MODE_ENCODER_NONE, NULL);
> +	if (ret) {
> +		dev_err(dev, "DRM encoder init failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	drm_encoder_helper_add(encoder, &st7920_encoder_helper_funcs[family_id]);
> +
> +	encoder->possible_crtcs = drm_crtc_mask(crtc);
> +
> +	/* Connector */
> +
> +	connector = &st7920->connector;
> +	ret = drm_connector_init(drm, connector, &st7920_connector_funcs,
> +				 DRM_MODE_CONNECTOR_Unknown);
> +	if (ret) {
> +		dev_err(dev, "DRM connector init failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	drm_connector_helper_add(connector, &st7920_connector_helper_funcs);
> +
> +	ret = drm_connector_attach_encoder(connector, encoder);
> +	if (ret) {
> +		dev_err(dev, "DRM attach connector to encoder failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	drm_mode_config_reset(drm);
> +
> +	return 0;
> +}
> +
> +static int st7920_probe(struct spi_device *spi)
> +{
> +	struct st7920_device *st7920;
> +	struct regmap *regmap;
> +	struct device *dev = &spi->dev;
> +	struct drm_device *drm;
> +	int ret;
> +
> +	regmap = devm_regmap_init_spi(spi, &st7920_spi_regmap_config);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	st7920 = devm_drm_dev_alloc(dev, &st7920_drm_driver,
> +				    struct st7920_device, drm);
> +	if (IS_ERR(st7920))
> +		return dev_err_probe(dev, PTR_ERR(st7920),
> +							 "Failed to allocate DRM device\n");
> +
> +	drm = &st7920->drm;
> +
> +	st7920->dev = dev;
> +	st7920->regmap = regmap;
> +	st7920->spi = spi;
> +	st7920->device_info = device_get_match_data(dev);
> +	st7920->width = st7920->device_info->default_width;
> +	st7920->height = st7920->device_info->default_height;
> +
> +	ret = st7920_init_modeset(st7920);
> +	if (ret)
> +		return ret;
> +
> +	ret = drm_dev_register(drm, 0);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "DRM device register failed\n");
> +
> +	drm_client_setup(drm, NULL);
> +

> +	spi_set_drvdata(spi, st7920);
> +
> +	st7920_init(st7920);

Those two calls need to go much earlier. After drm_dev_register(), your 
driver is available to the world. drm_client_setup() is in fact the 
first user.

> +
> +	return 0;
> +}
> +
> +static void st7920_remove(struct spi_device *spi)
> +{
> +	struct st7920_device *st7920 = spi_get_drvdata(spi);
> +
> +	drm_dev_unplug(&st7920->drm);
> +	drm_atomic_helper_shutdown(&st7920->drm);
> +}
> +
> +static void st7920_shutdown(struct spi_device *spi)
> +{
> +	struct st7920_device *st7920 = spi_get_drvdata(spi);
> +
> +	drm_atomic_helper_shutdown(&st7920->drm);
> +}
> +
> +static struct spi_driver st7920_spi_driver = {
> +	.driver = {
> +		.name = DRIVER_NAME,
> +		.of_match_table = st7920_of_match,
> +	},
> +	.id_table = st7920_spi_id,
> +	.probe = st7920_probe,
> +	.remove = st7920_remove,
> +	.shutdown = st7920_shutdown,
> +};
> +module_spi_driver(st7920_spi_driver);
> +
> +MODULE_DESCRIPTION(DRIVER_DESC);
> +MODULE_AUTHOR("Iker Pedrosa <ipedrosam@gmail.com>");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/gpu/drm/sitronix/st7920.h b/drivers/gpu/drm/sitronix/st7920.h

Is there another user of this header? No extra header otherwise, please.

Best regards
Thomas

> new file mode 100644
> index 0000000000000000000000000000000000000000..83032baa7e82c2718deeb943fc564cc132c416a3
> --- /dev/null
> +++ b/drivers/gpu/drm/sitronix/st7920.h
> @@ -0,0 +1,55 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Header file for:
> + * DRM driver for Sitronix ST7920 LCD displays
> + *
> + * Copyright 2025 Iker Pedrosa <ikerpedrosam@gmail.com>
> + *
> + * Based on drivers/video/fbdev/ssd130x.c
> + * Copyright 2022 Red Hat Inc.
> + */
> +
> +#ifndef __ST7920_H__
> +#define __ST7920_H__
> +
> +#include <drm/drm_connector.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_encoder.h>
> +
> +enum st7920_family_ids {
> +	ST7920_FAMILY
> +};
> +
> +enum st7920_variants {
> +	/* st7920 family */
> +	ST7920_ID
> +};
> +
> +struct st7920_deviceinfo {
> +	u32 default_dclk_div;
> +	u32 default_dclk_frq;
> +	u32 default_width;
> +	u32 default_height;
> +
> +	enum st7920_family_ids family_id;
> +};
> +
> +struct st7920_device {
> +	struct drm_device drm;
> +	struct device *dev;
> +	struct drm_display_mode mode;
> +	struct drm_plane primary_plane;
> +	struct drm_crtc crtc;
> +	struct drm_encoder encoder;
> +	struct drm_connector connector;
> +	struct spi_device *spi;
> +
> +	struct regmap *regmap;
> +
> +	const struct st7920_deviceinfo *device_info;
> +
> +	u32 height;
> +	u32 width;
> +};
> +
> +#endif /* __ST7920_H__ */
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


