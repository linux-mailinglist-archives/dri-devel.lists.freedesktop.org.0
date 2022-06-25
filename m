Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB4155AA34
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 14:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A9711A939;
	Sat, 25 Jun 2022 12:56:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85FB711A939
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 12:56:46 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id cf14so6929569edb.8
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 05:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hkKJBvAKbR3BnoO9kk6/tqR9cWYvLJ3iSW/K1h/KF1E=;
 b=RHHKT+fXGjhwpRyX6AHgXDATSzGDIT/vgxg9YVeJMXQ8IxgLGuE7q6B46HZpw0a2eA
 tJgQyWkMzLxUfMEtcKcmYGM3QwwsTeH0jSTcnY7OvSn3EOxZhCHluRGy+za/ipDRWk3M
 628rBJifSeraDGtLOaqu8EGctLUsfAoCgS3qE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hkKJBvAKbR3BnoO9kk6/tqR9cWYvLJ3iSW/K1h/KF1E=;
 b=q9yawtdFe/EQz/CzoV1WyH9L10pJIK7AiLX5bRcuBz1LQEd3Q1Tw6ZNTqGML6I2x7i
 Q+f0HxtVF2A1Wg18jdThV1PVSHrZWRlektmr7saTHj4Iww/Mfo0RMGMnx0mbVx4BfbHO
 G2b4lsU9umApOEqXnRQPe4PbFIguNRgbirC/6ExMhO+PYZgxsQnC9Gb7rF9Ggux5MDOC
 Xw/ebrdlD55vZe53lz6KNHSMsF2Slqs4GH8YtlB+qq/JHV9DbIBKBdpZutZiJKsPdLKc
 9VNtEuRlqGM3+16w7sCail64SNQcebgC40h9ksuhbseog+RTdt7I0dLT8MK8ffkKV/lQ
 90bQ==
X-Gm-Message-State: AJIora/E3k8CrSH3PiTNVGdWNplnPHWV9WZ5YecPcemowEFiFVa+1VFY
 2DjA1zUh1w4Q9Znv0CXw6rcfaA==
X-Google-Smtp-Source: AGRyM1uSAAamV4LD6qgErK2aTyULcJd7bFHRZNBzNi3jWmOUJzxiN5iHdDWB45PCqN31cGuZ0fu2kQ==
X-Received: by 2002:a05:6402:4244:b0:437:726c:e1a with SMTP id
 g4-20020a056402424400b00437726c0e1amr2257718edb.107.1656161805069; 
 Sat, 25 Jun 2022 05:56:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a170906235200b006fee16142b9sm2568993eja.110.2022.06.25.05.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jun 2022 05:56:44 -0700 (PDT)
Date: Sat, 25 Jun 2022 14:56:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v2 3/4] fbmem: Fix input parameter checks for
 user-provided screen resolution changes
Message-ID: <YrcGCkHuWHv3I6Fx@phenom.ffwll.local>
References: <20220625122502.68095-1-deller@gmx.de>
 <20220625122502.68095-4-deller@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220625122502.68095-4-deller@gmx.de>
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
Cc: daniel.vetter@ffwll.ch, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 25, 2022 at 02:25:01PM +0200, Helge Deller wrote:
> Enhance the checks in the FBIOPUT_VSCREENINFO ioctl handler to verify
> the user-provided new screen size for:
> 
> a) virtual screen size >= physical screen size, and
> 
> b) new screen size is bigger than currently configured console font size.
> 
> Return -EINVAL on invalid input.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> Cc: stable@vger.kernel.org # v5.4+

Imo squash this into the previous one please. Doesn't make sense to split
the patch which adds a function from it's callsite.
-Daniel

> ---
>  drivers/video/fbdev/core/fbmem.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index afa2863670f3..50fb66b954d6 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1106,7 +1106,13 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
>  			return -EFAULT;
>  		console_lock();
>  		lock_fb_info(info);
> -		ret = fb_set_var(info, &var);
> +		if (var.xres_virtual < var.xres ||
> +		    var.yres_virtual < var.yres)
> +			ret = -EINVAL;
> +		if (!ret)
> +			ret = fbcon_modechange_possible(info, &var);
> +		if (!ret)
> +			ret = fb_set_var(info, &var);
>  		if (!ret)
>  			fbcon_update_vcs(info, var.activate & FB_ACTIVATE_ALL);
>  		unlock_fb_info(info);
> --
> 2.35.3
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
