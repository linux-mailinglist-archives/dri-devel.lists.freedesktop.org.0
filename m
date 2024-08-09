Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D54D94CCC4
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 10:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C851B10E0BB;
	Fri,  9 Aug 2024 08:56:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="GBED+yQJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5DA10E0BB
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 08:56:09 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5a4d5b2c295so165159a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Aug 2024 01:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1723193768; x=1723798568; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Zf0eSUCz8oCrEZ7Xk4wx1Lt79O0otqHkMl3ZHIbErRw=;
 b=GBED+yQJPj1/z1gl+un/EZoMbBSlOwKkjWyy/zP5UNpZ7DPmU4hid75Tzu5Sbzi8C8
 bHBeSoBpJ4hDRFfOS+mc4BZTVm1vO9uxagvgHaq6Kq6tL7c9sC8FCtqMHz7Yt99lsuJ+
 kqypUjM6sxcXR91bSeJ9Ov+m49PZdRTPsTuuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723193768; x=1723798568;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zf0eSUCz8oCrEZ7Xk4wx1Lt79O0otqHkMl3ZHIbErRw=;
 b=K4taa4B1Iu6LKo7TUgQvRZ2IRYZ4gVYbRSL1b0w2J6l/rQWIW19ZSW3UnZiMgj9yEI
 eEl/mugHEruEcZPr9KZNR2KFBhZKmrMiMYinyDO4un/9MtSWZJfsPdMPc+yQGRv3krk4
 dniPUqrn8A7Syqk3Y/0X7oH00Ef8OepaglGEIA+pZB6uh1Vk4hYf5fjDS5KyN+oR0Vig
 tH6up30ySlizKR+HunzO5qrAIUbweFlSKYffwbF3+SmtUjCqmY/9s6+TE//35DkGumLY
 pgeukmqaog6rmSQ94AL+eY/2qLz+BKA33wFSIhyRzoAQ2XEJFI1AmS4sLNzeFmERCEtn
 CL2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXayEpdN1VhkUqM65Zr+UCvhZRUwveCNynaAKZvomiUSCNmSsa4B5okRRhFwFvfUIRv7gniBZnLOFcYEfQxHxKymes2RGtMVpFC0rUNlwT7
X-Gm-Message-State: AOJu0Yzy6iUmw3HjARonAnjYsKItnZpecsVG9I3ROXyPzSEWsXYjay28
 8HW2rIzO69HJiTKLAxZM14IRXMGpSwV14uGbZzHxKSz58DK+dHWN02WdBSWmylI=
X-Google-Smtp-Source: AGHT+IGqTC/nx/+XFtpktSWyuxoXIw3nWTqCFBcUX9ii1KnVPn/gT5QRdlqDKdTWwPprB86JbOi8kg==
X-Received: by 2002:a05:6402:2791:b0:582:4465:8b27 with SMTP id
 4fb4d7f45d1cf-5bd0a66af4fmr413692a12.4.1723193767591; 
 Fri, 09 Aug 2024 01:56:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bbb2e5ef39sm1355009a12.91.2024.08.09.01.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 01:56:07 -0700 (PDT)
Date: Fri, 9 Aug 2024 10:56:05 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 5/5] drm/panic: Add panic description
Message-ID: <ZrXZpZWl4BGC1BvA@phenom.ffwll.local>
References: <20240807134902.458669-1-jfalempe@redhat.com>
 <20240807134902.458669-6-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807134902.458669-6-jfalempe@redhat.com>
X-Operating-System: Linux phenom 6.9.10-amd64 
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

On Wed, Aug 07, 2024 at 03:36:14PM +0200, Jocelyn Falempe wrote:
> Now that kmsg dump callback has the description parameter, use it in
> the user panic screen.
> This is the string passed to panic(), like "VFS: Unable to mount root
> fs on xxx" or "Attempted to kill init! exitcode=0xxxx".
> It gives a hint on why the panic occurred, without being too cryptic.
> 
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
> 
> v2:
>  * Use a macro PANIC_MSG_LINES, instead of directly using the indice in drm_panic_set_description() (Sima)
>  * Add drm_panic_clear_description() to make sure the stack allocated pointer won't be used. (Sima)
>  * use the macro PANIC_MSG_LINES also in draw_panic_static_user()

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
>  drivers/gpu/drm/drm_panic.c | 56 ++++++++++++++++++++++++++++---------
>  1 file changed, 43 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 2efede7fa23a..c7d9f3a9e30d 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -81,7 +81,10 @@ static struct drm_panic_line panic_msg[] = {
>  	PANIC_LINE("KERNEL PANIC!"),
>  	PANIC_LINE(""),
>  	PANIC_LINE("Please reboot your computer."),
> +	PANIC_LINE(""),
> +	PANIC_LINE(""), /* will be replaced by the panic description */
>  };
> +#define PANIC_MSG_LINES ARRAY_SIZE(panic_msg)
>  
>  static const struct drm_panic_line logo_ascii[] = {
>  	PANIC_LINE("     .--.        _"),
> @@ -92,6 +95,7 @@ static const struct drm_panic_line logo_ascii[] = {
>  	PANIC_LINE(" /'\\_   _/`\\    (_)"),
>  	PANIC_LINE(" \\___)=(___/"),
>  };
> +#define PANIC_LOGO_LINES ARRAY_SIZE(logo_ascii)
>  
>  #if defined(CONFIG_LOGO) && !defined(MODULE)
>  static const struct linux_logo *logo_mono;
> @@ -487,13 +491,12 @@ static void draw_txt_rectangle(struct drm_scanout_buffer *sb,
>  
>  static void draw_panic_static_user(struct drm_scanout_buffer *sb)
>  {
> -	size_t msg_lines = ARRAY_SIZE(panic_msg);
> -	size_t logo_ascii_lines = ARRAY_SIZE(logo_ascii);
>  	u32 fg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR, sb->format->format);
>  	u32 bg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_BACKGROUND_COLOR, sb->format->format);
>  	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
>  	struct drm_rect r_screen, r_logo, r_msg;
>  	unsigned int logo_width, logo_height;
> +	unsigned int msg_width, msg_height;
>  
>  	if (!font)
>  		return;
> @@ -504,14 +507,14 @@ static void draw_panic_static_user(struct drm_scanout_buffer *sb)
>  		logo_width = logo_mono->width;
>  		logo_height = logo_mono->height;
>  	} else {
> -		logo_width = get_max_line_len(logo_ascii, logo_ascii_lines) * font->width;
> -		logo_height = logo_ascii_lines * font->height;
> +		logo_width = get_max_line_len(logo_ascii, PANIC_LOGO_LINES) * font->width;
> +		logo_height = PANIC_LOGO_LINES * font->height;
>  	}
> -
>  	r_logo = DRM_RECT_INIT(0, 0, logo_width, logo_height);
> -	r_msg = DRM_RECT_INIT(0, 0,
> -			      min(get_max_line_len(panic_msg, msg_lines) * font->width, sb->width),
> -			      min(msg_lines * font->height, sb->height));
> +
> +	msg_width = min(get_max_line_len(panic_msg, PANIC_MSG_LINES) * font->width, sb->width);
> +	msg_height = min(PANIC_MSG_LINES * font->height, sb->height);
> +	r_msg = DRM_RECT_INIT(0, 0, msg_width, msg_height);
>  
>  	/* Center the panic message */
>  	drm_rect_translate(&r_msg, (sb->width - r_msg.x2) / 2, (sb->height - r_msg.y2) / 2);
> @@ -525,10 +528,10 @@ static void draw_panic_static_user(struct drm_scanout_buffer *sb)
>  			drm_panic_blit(sb, &r_logo, logo_mono->data, DIV_ROUND_UP(logo_width, 8),
>  				       fg_color);
>  		else
> -			draw_txt_rectangle(sb, font, logo_ascii, logo_ascii_lines, false, &r_logo,
> +			draw_txt_rectangle(sb, font, logo_ascii, PANIC_LOGO_LINES, false, &r_logo,
>  					   fg_color);
>  	}
> -	draw_txt_rectangle(sb, font, panic_msg, msg_lines, true, &r_msg, fg_color);
> +	draw_txt_rectangle(sb, font, panic_msg, PANIC_MSG_LINES, true, &r_msg, fg_color);
>  }
>  
>  /*
> @@ -633,7 +636,31 @@ static void draw_panic_dispatch(struct drm_scanout_buffer *sb)
>  	}
>  }
>  
> -static void draw_panic_plane(struct drm_plane *plane)
> +static void drm_panic_set_description(const char *description)
> +{
> +	u32 len;
> +
> +	if (description) {
> +		struct drm_panic_line *desc_line = &panic_msg[PANIC_MSG_LINES - 1];
> +
> +		desc_line->txt = description;
> +		len = strlen(description);
> +		/* ignore the last newline character */
> +		if (len && description[len - 1] == '\n')
> +			len -= 1;
> +		desc_line->len = len;
> +	}
> +}
> +
> +static void drm_panic_clear_description(void)
> +{
> +	struct drm_panic_line *desc_line = &panic_msg[PANIC_MSG_LINES - 1];
> +
> +	desc_line->len = 0;
> +	desc_line->txt = NULL;
> +}
> +
> +static void draw_panic_plane(struct drm_plane *plane, const char *description)
>  {
>  	struct drm_scanout_buffer sb = { };
>  	int ret;
> @@ -642,6 +669,8 @@ static void draw_panic_plane(struct drm_plane *plane)
>  	if (!drm_panic_trylock(plane->dev, flags))
>  		return;
>  
> +	drm_panic_set_description(description);
> +
>  	ret = plane->helper_private->get_scanout_buffer(plane, &sb);
>  
>  	if (!ret && drm_panic_is_format_supported(sb.format)) {
> @@ -649,6 +678,7 @@ static void draw_panic_plane(struct drm_plane *plane)
>  		if (plane->helper_private->panic_flush)
>  			plane->helper_private->panic_flush(plane);
>  	}
> +	drm_panic_clear_description();
>  	drm_panic_unlock(plane->dev, flags);
>  }
>  
> @@ -662,7 +692,7 @@ static void drm_panic(struct kmsg_dumper *dumper, struct kmsg_dump_detail *detai
>  	struct drm_plane *plane = to_drm_plane(dumper);
>  
>  	if (detail->reason == KMSG_DUMP_PANIC)
> -		draw_panic_plane(plane);
> +		draw_panic_plane(plane, detail->description);
>  }
>  
>  
> @@ -682,7 +712,7 @@ static ssize_t debugfs_trigger_write(struct file *file, const char __user *user_
>  	if (kstrtobool_from_user(user_buf, count, &run) == 0 && run) {
>  		struct drm_plane *plane = file->private_data;
>  
> -		draw_panic_plane(plane);
> +		draw_panic_plane(plane, "Test from debugfs");
>  	}
>  	return count;
>  }
> -- 
> 2.45.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
