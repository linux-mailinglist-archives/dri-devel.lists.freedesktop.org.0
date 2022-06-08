Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D8D543884
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 18:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B7991128AC;
	Wed,  8 Jun 2022 16:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2951128C0
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 16:12:57 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id a10so8620947wmj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 09:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=n+Pp6leHahzsRX/bjpWot1i7bHMvU8Jw6pimNZGVd9s=;
 b=U1ceR5ZcHswI2Sd6KQrOPHJiGYKs46BbN5DhWHhymN8bn24CnHFEv9h4pok5hPGD3w
 jtbZsEEyfsWZkzAq2XX3Bt58jMt/PkaYTxuKlstiuZETjCajfneQsnM2NAVdVMotDp4T
 l0/Xi4zqdZhrzd/qm6KINqX3L7yIQExgk80nY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=n+Pp6leHahzsRX/bjpWot1i7bHMvU8Jw6pimNZGVd9s=;
 b=KoR14qB12Qf1YKw1etP+eQLCIsqex6m/7+fQZORJFyj8PTqUyUwlPzCVYKt0u+aTtV
 TT9FpM6M9qetX7OWMh62+JinvigTIwUflb8YmCD3LonRN18gBgXMJGPYpO/JBM+Y8qLk
 3qZFQss9AszB84lBc7CnZLSs5025U8iyzJQ6YwNfXFfyGTk0UlWtrgQOl7eqyJK9+A34
 yzYQ21Ps4GcI7QCYEkweURttZco4PoupwibQoL2hrU4r6BeXSfhYgHqGBK7Iq75jBp1P
 lcsK5UA4DjVpau2kBa8+ACIlabuC5EF8PeBuq9pwsZY6b6muIsgQ+yH95iU7v3NxaXxh
 Otag==
X-Gm-Message-State: AOAM531ANiRJ1cZNlB76zOKFU/nW1YrRxkKjzvCdh/scSl67SPBvEbh1
 nWmlQXN2Us0rizIatLxf8E3YmA==
X-Google-Smtp-Source: ABdhPJyJ1hMy6o1A7TSEc2gTjfLM3QKvFpOpwuorCz0WhSKILm+zibt0P8DOxJq7tYRjUCVn59zhfA==
X-Received: by 2002:a7b:c341:0:b0:37b:c619:c9f4 with SMTP id
 l1-20020a7bc341000000b0037bc619c9f4mr64819074wmj.38.1654704776193; 
 Wed, 08 Jun 2022 09:12:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a5d4309000000b002102af52a2csm27095440wrq.9.2022.06.08.09.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 09:12:54 -0700 (PDT)
Date: Wed, 8 Jun 2022 18:12:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] fbcon: Fix accelerated fbdev scrolling while logo is
 still shown
Message-ID: <YqDKhRwXoLKhsqzC@phenom.ffwll.local>
References: <YpkYxk7wsBPx3po+@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YpkYxk7wsBPx3po+@p100>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 02, 2022 at 10:08:38PM +0200, Helge Deller wrote:
> There is no need to directly skip over to the SCROLL_REDRAW case while
> the logo is still shown.
> 
> When using DRM, this change has no effect because the code will reach
> the SCROLL_REDRAW case immediately anyway.
> 
> But if you run an accelerated fbdev driver and have
> FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION enabled, console scrolling is
> slowed down by factors so that it feels as if you use a 9600 baud
> terminal.
> 
> So, drop those unnecessary checks and speed up fbdev console
> acceleration during bootup.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> Cc: stable@vger.kernel.org

I'm not entirely sure this is 100% perfect, but I don't think it'll make
anything worse, so

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I'm assuming you'll push this to drm-misc-fixes? I pinged drm-misc
maintainers to make sure that tree is forwarded to -rc1.
-Daniel

> 
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index c2f9e5711c39..8eb5b73e98bc 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -1706,8 +1706,6 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
>  	case SM_UP:
>  		if (count > vc->vc_rows)	/* Maximum realistic size */
>  			count = vc->vc_rows;
> -		if (logo_shown >= 0)
> -			goto redraw_up;
>  		switch (fb_scrollmode(p)) {
>  		case SCROLL_MOVE:
>  			fbcon_redraw_blit(vc, info, p, t, b - t - count,
> @@ -1796,8 +1794,6 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
>  	case SM_DOWN:
>  		if (count > vc->vc_rows)	/* Maximum realistic size */
>  			count = vc->vc_rows;
> -		if (logo_shown >= 0)
> -			goto redraw_down;
>  		switch (fb_scrollmode(p)) {
>  		case SCROLL_MOVE:
>  			fbcon_redraw_blit(vc, info, p, b - 1, b - t - count,

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
