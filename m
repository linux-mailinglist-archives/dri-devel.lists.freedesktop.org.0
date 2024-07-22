Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F1A93906B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 16:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A25D10E0D2;
	Mon, 22 Jul 2024 14:15:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="eyPpRZUT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D0510E0D2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 14:15:56 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-426659ff58bso5017395e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 07:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1721657754; x=1722262554; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kx0TDuI5m4f7x9Raak4pwIhIi0qr9N6AUQbyBu7jk58=;
 b=eyPpRZUTsAKqeUv0DR7mejJXEYCN9zCU6/yPSzuE+hT8xSBb79OVxGvUQ0FvtbFHbY
 dVwhpV+A9cGe0W1xgbe1qATAsOZXqm2wCj/pOHuquGX9tQI6bvtbtVNJMvzj8CGcHqKl
 gSNPJbYQua4PYGgmpRNojD9dwY1W1agTOhOjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721657754; x=1722262554;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kx0TDuI5m4f7x9Raak4pwIhIi0qr9N6AUQbyBu7jk58=;
 b=UwLr3yG5MjsnxExpkcLekez8i4vrAmQn6L6HWYs5rXfjwe8mGh0Wn1paylrVjhTdaE
 /Dg2pW0bzq5+q3sFIUrZ0YniCN0HQ5aGlthX59T8E4F2xWLzrrbGpRaqpE44LevDxKJQ
 6RKDgFv59hL47yc94AAbV9o2/p4gB/72+Z5Kl7X8l7iQdX8eqN6z1X9PYc3Q5CzFmFMW
 nQ8Z2VDcA0cHFtYwT5kzZzY7ZWeMRWv03bfbmrxSOUud0QJi5v/sM80TCuoDG+XUT55H
 E76nKrUFlmMRnQGRPdgfm+/TjPcgmxROsv0x6Pb/HJ2rcnHV0hc4Ce6UsonLiOpN4J4D
 sKkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlhn2N5+MjxvlgoeqgBQ86QyZOzQOK3ImcPsdTER9KdpMXyISK3goIEp3HW2ocHrb6R26TDGEZ7tRAWdFMJ66TC/yRa0WT2QtmKlIADDDs
X-Gm-Message-State: AOJu0YxsWOwSYqm9vAiuY3OqPSLt0jLfcCKp8/OiFQuRjXbj4YAy86I7
 LodLPZb+XWXao+f6hYDc9GmaqgLnQeIl+fHtLWS7/ltrjzKQwyzQY6zRtVaBHJ4=
X-Google-Smtp-Source: AGHT+IEzv1gd5cKrmvegzH0V6jzWs76B0Fz3js/yNH+DTr8Mw5A+t9aAP9Md+Wa9gE0EqI3ymSu7Cw==
X-Received: by 2002:a05:6000:2a1:b0:367:4d9d:56a6 with SMTP id
 ffacd0b85a97d-369b6750465mr3248168f8f.1.1721657754218; 
 Mon, 22 Jul 2024 07:15:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3687868b5fdsm8596021f8f.38.2024.07.22.07.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 07:15:53 -0700 (PDT)
Date: Mon, 22 Jul 2024 16:15:51 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: lkp@intel.com, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] fbcon: Use oops_in_progress instead of panic_cpu
Message-ID: <Zp5pl4kcu9q6FWTP@phenom.ffwll.local>
References: <202407210203.2ISiIC9m-lkp@intel.com>
 <20240722114800.174558-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722114800.174558-1-jfalempe@redhat.com>
X-Operating-System: Linux phenom 6.9.7-amd64 
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

On Mon, Jul 22, 2024 at 01:47:51PM +0200, Jocelyn Falempe wrote:
> Panic_cpu is not exported, so it can't be used if fbcon is used as
> a module. Use oops_in_progress in this case, but non-fatal oops won't
> be printed.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202407210203.2ISiIC9m-lkp@intel.com/
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>

Yeah it's not great but gets the job done.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Cheers, Sima

> ---
>  drivers/video/fbdev/core/fbcon.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index 498d9c07df80..2e093535884b 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -64,6 +64,8 @@
>  #include <linux/console.h>
>  #include <linux/string.h>
>  #include <linux/kd.h>
> +#include <linux/panic.h>
> +#include <linux/printk.h>
>  #include <linux/slab.h>
>  #include <linux/fb.h>
>  #include <linux/fbcon.h>
> @@ -272,7 +274,14 @@ static int fbcon_get_rotate(struct fb_info *info)
>  
>  static bool fbcon_skip_panic(struct fb_info *info)
>  {
> +/* panic_cpu is not exported, and can't be used if built as module. Use
> + * oops_in_progress instead, but non-fatal oops won't be printed.
> + */
> +#if defined(MODULE)
> +	return (info->skip_panic && unlikely(oops_in_progress));
> +#else
>  	return (info->skip_panic && unlikely(atomic_read(&panic_cpu) != PANIC_CPU_INVALID));
> +#endif
>  }
>  
>  static inline int fbcon_is_inactive(struct vc_data *vc, struct fb_info *info)
> 
> base-commit: 7e33fc2ff6754b5ff39b11297f713cd0841d9962
> -- 
> 2.45.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
