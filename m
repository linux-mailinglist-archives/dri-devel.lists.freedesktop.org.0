Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E7FC83DE8
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 09:03:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C4B10E36B;
	Tue, 25 Nov 2025 08:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="Z8ra6Tyt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0093510E1F2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 09:28:57 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-477a1c28778so44835515e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 01:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1763976536; x=1764581336; darn=lists.freedesktop.org; 
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:date:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qSUd6Iu5swY1yI3rOZ1kFsJAdObQXxI7F4AS/dEiKfI=;
 b=Z8ra6Tytyt3ewzTdtj0rgy8AOltsIuBX8nro+acecMlyRSTw3hYBaylOqu7gwa2kYo
 h7JeWRJTHgS8/wIbZckP1Z3bHiaT9dYOff+DK1MnmkkebZnSkUrTvxDiwahgJTA1kRxu
 8b4a/jbFyw5h+A3VFhCgM+h17eo3wwxJy/W8dtXf/ZUmI3135jntXG1hSlgK1cSLv5md
 au9uy1oKrYlIACEhC1XLsDeiI10l5RTeMewKOMVO8PCw2FCs+IDaZWkxHwVCcVBmmlbB
 QD2rS8TFjVEBi0vSaFCoDhc6KXiYvPTUZNELfkGyz6/jwMIT5v04+n1yAZZh3jf18vsS
 ayAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763976536; x=1764581336;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qSUd6Iu5swY1yI3rOZ1kFsJAdObQXxI7F4AS/dEiKfI=;
 b=OlbwYXk3uOKeJkVJ6Lzsh7raF/6Vw4wmgun1FICnsa/cxKnyl0is2fJ51poB/Cupa4
 wobDAGunG+y64NpLuWSNqFmZ9gRBQO/agXuEVRzom8e1p8CB2hiusbP2LI9XexW1a+vK
 6hRgEZ0k32JNmu87vlo93uL/mPdik9Z9S0CgCybn+ohZ9og/cCpTuknYeRTXoEB6gtnP
 0Sv1Enw2kaVIHpyROhR6H/6uoUL1eP67YFeKelVMamvj9ZRAdT2QTwEpdQJbqMOjI77I
 S6TFyiMky278/pKrwUocNNqJ/22IXSEiLTMbWiVjR6Qla6/cn6sHl2e8pGUneA8ztpbh
 yWZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXo6BqmQ5T5QgLj1+y9WHHItUFRmOq14L4BebWySHxJunHaRWi8GfybXLBYVjoSddWV3ABwj+dEUK8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyK4B9aVeKlx3BFGun3L4tedhsk35n7n4ggIWnHEr8wQhzZID/p
 aQsVsVH1pTRldLPSc1tPnJkNeAg2zXe0TqwyOW+5ricizILSm2M8yu3Aw+vtNfriibg=
X-Gm-Gg: ASbGncuMBDSyR3Owm5joIgc444MFhakK1gFL7pkbb9wOLk5WOHn0xF8ifRyakGAp70b
 FP4vOVL1Klz84LvwnPRw0Yyf97ZQwXJalS+oqu3zUh2wBfENfN26zeUGoO+K9y8AiSN+ZzWGnZp
 cgCFdrOzTWK/XU+IJnV36DkfD85p7QwsfEDHKT8Enr+S6K+8FWww7HBDvzrZGiB4WkCvI/Fbk6+
 YG0PLn/VFi1jT4ReHdebVCqncmXlhjnyEpMKji3R8Rl+rDnQ1ATtY64tPSa88E2pBIxnH8D3qdt
 +D+JeXLyN4Blqqlf03ZvhXTOqQTIB5yTVEbiNnLh9NmxNNY44ZS8xfrnyk0H0Mw4mWbWYaARfOq
 6FdAzgQordjyepZKvsS8+183HGcxWoQ8Jg1NcTOTUqlT5YrDBvajgF/vlfhpTtmSXpMAqYWirLu
 co5s1eylPGZu5mbOqhJHszr3ybWx3JNgL2kTonUuTe
X-Google-Smtp-Source: AGHT+IGqX87Liusvu8VA+P6vAK2NQvQqKGFS75x4fPSdpk7QAnEFO6Q86alRxbuZVhECcom6UWrp6g==
X-Received: by 2002:a05:600c:1c0c:b0:46e:7e22:ff6a with SMTP id
 5b1f17b1804b1-477c018a099mr145588045e9.15.1763976536416; 
 Mon, 24 Nov 2025 01:28:56 -0800 (PST)
Received: from r1chard (220-129-146-231.dynamic-ip.hinet.net.
 [220.129.146.231]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-345b03c7515sm9757191a91.5.2025.11.24.01.28.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 01:28:56 -0800 (PST)
From: Richard Lyu <richard.lyu@suse.com>
X-Google-Original-From: Richard Lyu <r1chard@r1chard>
Date: Mon, 24 Nov 2025 17:28:49 +0800
To: Thomas Zimmermann <tzimmermann@suse.de>, ardb@kernel.org,
 javierm@redhat.com, arnd@arndb.de
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 1/6] efi: earlycon: Reduce number of references to global
 screen_info
Message-ID: <aSQlUVPfQrEwXPWm@r1chard>
References: <20251121135624.494768-1-tzimmermann@suse.de>
 <20251121135624.494768-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121135624.494768-2-tzimmermann@suse.de>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Mailman-Approved-At: Tue, 25 Nov 2025 08:03:45 +0000
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

Reviewed-by: Richard Lyu <richard.lyu@suse.com>

On 2025/11/21 14:36, Thomas Zimmermann wrote:
> Replace usage of global screen_info with local pointers. This will
> later reduce churn when screen_info is being moved.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/firmware/efi/earlycon.c | 40 ++++++++++++++++-----------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/firmware/efi/earlycon.c b/drivers/firmware/efi/earlycon.c
> index d18a1a5de144..fac3a295c57f 100644
> --- a/drivers/firmware/efi/earlycon.c
> +++ b/drivers/firmware/efi/earlycon.c
> @@ -32,12 +32,13 @@ static void *efi_fb;
>   */
>  static int __init efi_earlycon_remap_fb(void)
>  {
> +	const struct screen_info *si = &screen_info;
> +
>  	/* bail if there is no bootconsole or it was unregistered already */
>  	if (!earlycon_console || !console_is_registered(earlycon_console))
>  		return 0;
>  
> -	efi_fb = memremap(fb_base, screen_info.lfb_size,
> -			  fb_wb ? MEMREMAP_WB : MEMREMAP_WC);
> +	efi_fb = memremap(fb_base, si->lfb_size, fb_wb ? MEMREMAP_WB : MEMREMAP_WC);
>  
>  	return efi_fb ? 0 : -ENOMEM;
>  }
> @@ -71,12 +72,12 @@ static __ref void efi_earlycon_unmap(void *addr, unsigned long len)
>  	early_memunmap(addr, len);
>  }
>  
> -static void efi_earlycon_clear_scanline(unsigned int y)
> +static void efi_earlycon_clear_scanline(unsigned int y, const struct screen_info *si)
>  {
>  	unsigned long *dst;
>  	u16 len;
>  
> -	len = screen_info.lfb_linelength;
> +	len = si->lfb_linelength;
>  	dst = efi_earlycon_map(y*len, len);
>  	if (!dst)
>  		return;
> @@ -85,7 +86,7 @@ static void efi_earlycon_clear_scanline(unsigned int y)
>  	efi_earlycon_unmap(dst, len);
>  }
>  
> -static void efi_earlycon_scroll_up(void)
> +static void efi_earlycon_scroll_up(const struct screen_info *si)
>  {
>  	unsigned long *dst, *src;
>  	u16 maxlen = 0;
> @@ -99,8 +100,8 @@ static void efi_earlycon_scroll_up(void)
>  	}
>  	maxlen *= 4;
>  
> -	len = screen_info.lfb_linelength;
> -	height = screen_info.lfb_height;
> +	len = si->lfb_linelength;
> +	height = si->lfb_height;
>  
>  	for (i = 0; i < height - font->height; i++) {
>  		dst = efi_earlycon_map(i*len, len);
> @@ -120,7 +121,8 @@ static void efi_earlycon_scroll_up(void)
>  	}
>  }
>  
> -static void efi_earlycon_write_char(u32 *dst, unsigned char c, unsigned int h)
> +static void efi_earlycon_write_char(u32 *dst, unsigned char c, unsigned int h,
> +				    const struct screen_info *si)
>  {
>  	const u32 color_black = 0x00000000;
>  	const u32 color_white = 0x00ffffff;
> @@ -145,13 +147,12 @@ static void efi_earlycon_write_char(u32 *dst, unsigned char c, unsigned int h)
>  static void
>  efi_earlycon_write(struct console *con, const char *str, unsigned int num)
>  {
> -	struct screen_info *si;
> +	const struct screen_info *si = &screen_info;
>  	u32 cur_efi_x = efi_x;
>  	unsigned int len;
>  	const char *s;
>  	void *dst;
>  
> -	si = &screen_info;
>  	len = si->lfb_linelength;
>  
>  	while (num) {
> @@ -174,7 +175,7 @@ efi_earlycon_write(struct console *con, const char *str, unsigned int num)
>  			x = efi_x;
>  
>  			while (n-- > 0) {
> -				efi_earlycon_write_char(dst + x*4, *s, h);
> +				efi_earlycon_write_char(dst + x*4, *s, h, si);
>  				x += font->width;
>  				s++;
>  			}
> @@ -207,10 +208,10 @@ efi_earlycon_write(struct console *con, const char *str, unsigned int num)
>  			cur_line_y = (cur_line_y + 1) % max_line_y;
>  
>  			efi_y -= font->height;
> -			efi_earlycon_scroll_up();
> +			efi_earlycon_scroll_up(si);
>  
>  			for (i = 0; i < font->height; i++)
> -				efi_earlycon_clear_scanline(efi_y + i);
> +				efi_earlycon_clear_scanline(efi_y + i, si);
>  		}
>  	}
>  }
> @@ -226,22 +227,21 @@ void __init efi_earlycon_reprobe(void)
>  static int __init efi_earlycon_setup(struct earlycon_device *device,
>  				     const char *opt)
>  {
> -	struct screen_info *si;
> +	const struct screen_info *si = &screen_info;
>  	u16 xres, yres;
>  	u32 i;
>  
>  	fb_wb = opt && !strcmp(opt, "ram");
>  
> -	if (screen_info.orig_video_isVGA != VIDEO_TYPE_EFI) {
> +	if (si->orig_video_isVGA != VIDEO_TYPE_EFI) {
>  		fb_probed = true;
>  		return -ENODEV;
>  	}
>  
> -	fb_base = screen_info.lfb_base;
> -	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
> -		fb_base |= (u64)screen_info.ext_lfb_base << 32;
> +	fb_base = si->lfb_base;
> +	if (si->capabilities & VIDEO_CAPABILITY_64BIT_BASE)
> +		fb_base |= (u64)si->ext_lfb_base << 32;
>  
> -	si = &screen_info;
>  	xres = si->lfb_width;
>  	yres = si->lfb_height;
>  
> @@ -266,7 +266,7 @@ static int __init efi_earlycon_setup(struct earlycon_device *device,
>  
>  	efi_y -= font->height;
>  	for (i = 0; i < (yres - efi_y) / font->height; i++)
> -		efi_earlycon_scroll_up();
> +		efi_earlycon_scroll_up(si);
>  
>  	device->con->write = efi_earlycon_write;
>  	earlycon_console = device->con;
> -- 
> 2.51.1
> 
> 
