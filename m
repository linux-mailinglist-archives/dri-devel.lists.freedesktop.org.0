Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9B53FB24D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 10:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 341F2894DC;
	Mon, 30 Aug 2021 08:16:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF444894C9
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 08:16:26 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id s25so20437488edw.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 01:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=4V8zQGj1Gqf1F2tUDyAxGYR3CqJxPsTeRp5ZOBqSIDQ=;
 b=TuRY2sKW4BSfhJDjqVGbNRktK9LKQd2XLWSD40j4bkwxZWVIoWgb227dKGlbXTtTY5
 AEV0TuIGQPvrFZ6iy4MYEhgyGjzIMrilibmAUyqrwhDs4+AVxXMienXkDEGlpbaRnTFh
 hTFf9cDd5j+dozZN/drbUiSS0HawPZce23FDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=4V8zQGj1Gqf1F2tUDyAxGYR3CqJxPsTeRp5ZOBqSIDQ=;
 b=NC2Qo1eVaqED50yq2U859cKVqppEyzv8BrNe4wv5Qimq6GuR4anmISz50bV7iSu9mD
 xQqaspSqyf/i/Q42JSQKdkczBvlfRexrTofCYytDR8qp7iJNL1VXita9vMcy6CI1ELSz
 Nixh41V3TRoVcLWcOD8h9NAop5jmfsB5AzTqOmms8+ZX091vwmQ7TxTjXUlz+Us1ryht
 9qTRwFNMsLKefgBHNDYDDszeDrkfAIL6jTuZv7+HyiKQ8rUK1WCe3W0IXSwWzsdtTySR
 u8it41FCW5Rf+rZBwY+a3EjTgzWjM/ZzGAIUzZZVI6wDtMNOXrE9CPbHVBKqtz7bIw9P
 biUw==
X-Gm-Message-State: AOAM531kN21jdHX9xe3hM3jGgCwD4H1NPM/aMpEWjYxX9GnCE11Hhghy
 tklJ3vwUflRF1q9/YLbx2GYLUurRTVlnTw==
X-Google-Smtp-Source: ABdhPJzrm65vrU6FbeDHBqEE0r78ZCI76NdXsgPcErghrJZM0wZPOGz21FvSxt91jZIRA0bIPWz8rg==
X-Received: by 2002:a50:998f:: with SMTP id m15mr22603150edb.193.1630311385540; 
 Mon, 30 Aug 2021 01:16:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q5sm7275049edt.50.2021.08.30.01.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 01:16:25 -0700 (PDT)
Date: Mon, 30 Aug 2021 10:16:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: tcs.kernel@gmail.com
Cc: daniel.vetter@ffwll.ch, willy@infradead.org, george.kennedy@oracle.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org, penguin-kernel@i-love.sakura.ne.jp,
 Haimin Zhang <tcs_kernel@tencent.com>
Subject: Re: [PATCH V4] fbcon: fix fbcon out-of-bounds write in sys_imageblit
Message-ID: <YSyTzlUEhrxD7rU4@phenom.ffwll.local>
Mail-Followup-To: tcs.kernel@gmail.com, willy@infradead.org,
 george.kennedy@oracle.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org,
 penguin-kernel@i-love.sakura.ne.jp,
 Haimin Zhang <tcs_kernel@tencent.com>
References: <1630294223-7225-1-git-send-email-tcs_kernel@tencent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1630294223-7225-1-git-send-email-tcs_kernel@tencent.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Mon, Aug 30, 2021 at 11:30:23AM +0800, tcs.kernel@gmail.com wrote:
> From: Haimin Zhang <tcs_kernel@tencent.com>
> 
> yres and vyres can be controlled by user mode parameters, and cause
> p->vrows to become a negative value. While this value be passed to real_y
> function, the ypos will be out of screen range.This is an out-of-bounds
> write bug.
> some driver will check xres and yres in fb_check_var callback,but some not
> so we add a common check after that callback.
> 
> Signed-off-by: Haimin Zhang <tcs_kernel@tencent.com>
> Signed-off-by: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>

Does this fix a syzbot crash or how was this discovered?
-Daniel

> ---
>  drivers/video/fbdev/core/fbmem.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 1c85514..5599372 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1013,6 +1013,10 @@ static int fb_check_caps(struct fb_info *info, struct fb_var_screeninfo *var,
>  	if (ret)
>  		return ret;
>  
> +	/* virtual resolution cannot be smaller than visible resolution. */
> +	if (var->yres_virtual < var->yres || var->xres_virtual < var->xres)
> +		return -EINVAL;
> +
>  	if ((var->activate & FB_ACTIVATE_MASK) != FB_ACTIVATE_NOW)
>  		return 0;
>  
> -- 
> 1.8.3.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
