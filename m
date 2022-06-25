Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 668E855AA4D
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 15:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0080612B6E8;
	Sat, 25 Jun 2022 13:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B107112B6E8
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 13:03:35 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id z11so6937405edp.9
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 06:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6iZZ7vb8HcEclFbDefWv18SEXCTkKAWPzBSVLelIquE=;
 b=UBpQsJdQuBZF3cvPGaLHk6leljCnA04lkmNNRyvk0G3d9Bl6WG5ZiIL0LB4p9SZuu3
 5VQIYOC+r2VaPb9yKd9sj674XlhWIXLc5jl90nGv6sph5eftwmDx4hqCBFPmIZqPfsKw
 XwzNirZyxqJFewfmhGBBHxAILcew7ZCD8Wd4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6iZZ7vb8HcEclFbDefWv18SEXCTkKAWPzBSVLelIquE=;
 b=mlCTZMulCWMXncjVFdgpkwPtsxPHLUeBWtrPmrlj8lyXBbOWPfrfSHlAyUEvVbdVlR
 CN6RW5seasp2tVM2JcJryF3eRf94vKFnZfgQi2koxhHs4bmGwOXnhPr1FmM98+479ODW
 uRckjGr0dVnXEuspb12POP5DYXKK8l74KsRAeu89KYg77zEmpg3JXq/L8L7BE580EzWX
 1AZx2UBh4dK8kt5sQ496j2IcuOZOF2xFTM3lLK28aXNyXYYo1YQy6542jX5o/PfymuOa
 lAEwQ/cwAubGuvDUXCApsL4zW9GKrduqhxZeNE/jhJLVDhe/gT+EvdUms/CQo9/53fha
 fu+g==
X-Gm-Message-State: AJIora+cp9E98KBven4j/FZy3U/XjLwWZHFR4cRNOZw4KtKzqWYPOkNP
 fwKcs+SdPbBHNznV/3hCMv6CyA==
X-Google-Smtp-Source: AGRyM1uVnMKCKS1HZvDVMswZ6auQuPGJdfTvzPlFdW+2PYBnqkccdaaS3FXem8EGY9KlnhJkYTma9w==
X-Received: by 2002:aa7:c352:0:b0:435:7fbd:90b9 with SMTP id
 j18-20020aa7c352000000b004357fbd90b9mr5032745edr.139.1656162213948; 
 Sat, 25 Jun 2022 06:03:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 op23-20020a170906bcf700b0070aaad0a173sm2586212ejb.192.2022.06.25.06.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jun 2022 06:03:33 -0700 (PDT)
Date: Sat, 25 Jun 2022 15:03:31 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v2 4/4] fbmem: Catch possible driver bugs regarding too
 small virtual screen size
Message-ID: <YrcHo5dEaROdWMjo@phenom.ffwll.local>
References: <20220625122502.68095-1-deller@gmx.de>
 <20220625122502.68095-5-deller@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220625122502.68095-5-deller@gmx.de>
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

On Sat, Jun 25, 2022 at 02:25:02PM +0200, Helge Deller wrote:
> Make sure that we catch, report and fix up fbdev and drm graphic drivers which
> got the virtual screen resolution smaller than the physical screen resolution.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> Cc: stable@vger.kernel.org # v5.4+

No cc: stable for this, it's not fixing any bugs just helps validate
driver code.

Also if you just move the check from the ioctl code to here we don't need
to duplicate anything (and drivers which don't check their set_var are
kinda busted no matter what).
-Daniel

> ---
>  drivers/video/fbdev/core/fbmem.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 50fb66b954d6..6d262e341023 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1006,6 +1006,12 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
>  	if (var->xres < 8 || var->yres < 8)
>  		return -EINVAL;
> 
> +	/* make sure virtual resolution >= physical resolution */
> +	if (WARN_ON(var->xres_virtual < var->xres))
> +		var->xres_virtual = var->xres;
> +	if (WARN_ON(var->yres_virtual < var->yres))
> +		var->yres_virtual = var->yres;
> +
>  	/* Too huge resolution causes multiplication overflow. */
>  	if (check_mul_overflow(var->xres, var->yres, &unused) ||
>  	    check_mul_overflow(var->xres_virtual, var->yres_virtual, &unused))
> --
> 2.35.3
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
