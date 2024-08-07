Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D34DA94A430
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 11:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C638810E489;
	Wed,  7 Aug 2024 09:21:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Xt7vRE6+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85B2610E489
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 09:21:46 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-52f015ea784so232333e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2024 02:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1723022505; x=1723627305; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=csTQ5lzWeBnp5eIjH7VLphXMmU8kPz61RnyRjyaBL1U=;
 b=Xt7vRE6+Ck5rYElwfHaZCCG1k//crSX3PZLPjQlsrDNTRC8r2sAg9uvgh1qvyc155H
 dulhzs94GxkNpDl7IjbtzqEKBAnkr5Gt2G7de2rpX2twUfA8DnApHB1gDqku7ZMbMBGK
 l+8PzLswOF8u1DwNSCApQBp4d+eQdcE0Ap8Yw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723022505; x=1723627305;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=csTQ5lzWeBnp5eIjH7VLphXMmU8kPz61RnyRjyaBL1U=;
 b=InX9BWx9uHjsAgqSgEe3EgvlJu7+jJMKCDDxy5J48ODSzxSKn0+K7PYlC4JvZ99vx7
 gXQdM+oScCbRjrjW+hv8BbN+xZztOcWfPS2j1uCPWObh1vq4Nl5neSpBGaxT79hfHy7N
 QZKb79z3gfoyEZM89PkrEYFx2UqVR0kxdsTNTIyu257kRVeCHPGxJSQuPb/hbe+UAxWm
 tBrd9k4EZm7wz/nR7hlr0bRz2hf3/KXPF4lZEtgF8UwrqxaVe+FTxdUTfJCey1G38q45
 7IjIViqmubTIBeYb4r8tze8XiUvBo68IWbiLUvLf8Av61/R4Prt7dQGhzv8dmgiZxxuk
 6B1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzeDj1/VszLgOjqxOMxJpnIcX4QrRWgGddJR7tHfNJRJpipDuIWaIVMgisgrc1marcsfQ4hmlWfFWnbeww+jTBHp8os2s+QmA7mo42d3PR
X-Gm-Message-State: AOJu0YxBPrFwAKVS0W+acisy1dnx5cMhOOQBZ6kTrCNyK4soWu86iJ/g
 h8C477Ij0P78OF5VB/CIH7whOYTndvFZC0TvawEg5+OIaN3jw3O7KIZBgMSJ2W4=
X-Google-Smtp-Source: AGHT+IEaC42IZ2HCN0jOXunyHG89KcVpyF9mDwfqXhf/t9k4wLWFE3F0EKfhDREPX+P/CVptMekzjw==
X-Received: by 2002:a05:6512:b2a:b0:52f:e5:3765 with SMTP id
 2adb3069b0e04-530bb39dc4fmr7234972e87.6.1723022504231; 
 Wed, 07 Aug 2024 02:21:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9d89d2bsm619179666b.158.2024.08.07.02.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 02:21:43 -0700 (PDT)
Date: Wed, 7 Aug 2024 11:21:41 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 5/5] drm/panic: Add panic description
Message-ID: <ZrM8pT0TCCV-GpQU@phenom.ffwll.local>
References: <20240723091553.286844-1-jfalempe@redhat.com>
 <20240723091553.286844-6-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723091553.286844-6-jfalempe@redhat.com>
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

On Tue, Jul 23, 2024 at 11:11:34AM +0200, Jocelyn Falempe wrote:
> Now that kmsg dump callback has the description parameter, use it in
> the user panic screen.
> This is the string passed to panic(), like "VFS: Unable to mount root
> fs on xxx" or "Attempted to kill init! exitcode=0xxxx".
> It gives a hint on why the panic occurred, without being too cryptic.
> 
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/drm_panic.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 2efede7fa23a..fb283695f50e 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -81,6 +81,8 @@ static struct drm_panic_line panic_msg[] = {
>  	PANIC_LINE("KERNEL PANIC!"),
>  	PANIC_LINE(""),
>  	PANIC_LINE("Please reboot your computer."),
> +	PANIC_LINE(""),
> +	PANIC_LINE(""), /* will be replaced by the panic description */
>  };
>  
>  static const struct drm_panic_line logo_ascii[] = {
> @@ -633,7 +635,20 @@ static void draw_panic_dispatch(struct drm_scanout_buffer *sb)
>  	}
>  }
>  
> -static void draw_panic_plane(struct drm_plane *plane)
> +static void drm_panic_set_description(const char *description)
> +{
> +	u32 len;
> +	if (description) {

#define PANIC_REASON_LINE ARRAY_SIZE(panic_msg)

instead of open coding a magic for.

> +		panic_msg[4].txt = description;
> +		len = strlen(description);
> +		/* ignore the last newline character */
> +		if (len && description[len - 1] == '\n')
> +			len -= 1;
> +		panic_msg[4].len = len;
> +	}
> +}
> +
> +static void draw_panic_plane(struct drm_plane *plane, const char *description)
>  {
>  	struct drm_scanout_buffer sb = { };
>  	int ret;
> @@ -642,6 +657,8 @@ static void draw_panic_plane(struct drm_plane *plane)
>  	if (!drm_panic_trylock(plane->dev, flags))
>  		return;
>  
> +	drm_panic_set_description(description);

I think a drm_panic_clear_description at the end of this function would be
good, so we don't leve dangling pointers around (the passed-in line might
be dynamically generated and stack allocated).

> +
>  	ret = plane->helper_private->get_scanout_buffer(plane, &sb);
>  
>  	if (!ret && drm_panic_is_format_supported(sb.format)) {
> @@ -662,7 +679,7 @@ static void drm_panic(struct kmsg_dumper *dumper, struct kmsg_dump_detail *detai
>  	struct drm_plane *plane = to_drm_plane(dumper);
>  
>  	if (detail->reason == KMSG_DUMP_PANIC)
> -		draw_panic_plane(plane);
> +		draw_panic_plane(plane, detail->description);
>  }
>  
>  
> @@ -682,7 +699,7 @@ static ssize_t debugfs_trigger_write(struct file *file, const char __user *user_
>  	if (kstrtobool_from_user(user_buf, count, &run) == 0 && run) {
>  		struct drm_plane *plane = file->private_data;
>  
> -		draw_panic_plane(plane);
> +		draw_panic_plane(plane, "Test from debugfs");

Hm, should we make this line intentionally very long, to make sure we
exercise the overflow logic for too long lines? Like so long that even on
a 4k panel with a small font it will overflow. I worry otherwise that
there will be a bug in that logic, taking down the machine at the worst
possible moment ...

Reminds me, I think a bunch of kunit testcases to make sure the drm panic
code is absolutely solid (there's a bunch of math in there after all)
would be really good to add.

Cheers, Sima

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
