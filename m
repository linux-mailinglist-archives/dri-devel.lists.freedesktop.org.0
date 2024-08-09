Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 513B594CC88
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 10:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D2210E144;
	Fri,  9 Aug 2024 08:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="HfKIy2xj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994A010E113
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 08:45:03 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a7a9f831d47so20847066b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Aug 2024 01:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1723193102; x=1723797902; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0WBytM7wTzhcJvPtcOmfU4gEIFq5KXn99Y+uSV4J+Qg=;
 b=HfKIy2xjOHzbs35TaXT3pSbIZMuSdLa9Rwd3mwnkvKOD72two9cirkJudr2w8i/Owk
 2iK5KCwv4ysqildXoT1dV6Wr4zWieQQ/+TL0x5VZsYEl9QbEb/ppMClpdYqXniq7YuBk
 TZ33VCK+w9/92eGpJkN7z6qOh+2VwVtwGEc1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723193102; x=1723797902;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0WBytM7wTzhcJvPtcOmfU4gEIFq5KXn99Y+uSV4J+Qg=;
 b=QBsKBAufnjlstS++4TwWiDp+3TH47ciHNqg+5vWnLFxE0aMlW87OCGmCmZKZM+YR15
 /X/dJ1L+UAcfwVfmJ+Na13uDVVJn+ePSnEbd6Tq9Ys+LCmZvFjVoQA7+9Hum+QeqBspg
 GnSBXOQFqUZmNWazxDPub9bSiGbDEzZXWLBKLJ2y8DbniVu91cNATmMM5kqifWuwhqlD
 T7R8HFAsHUv60lEbryt4dH9kdpE3/5quKt6VbwujALikMzwDFegYnjxkqScRZMBd6N6Y
 2q4M5iZOvl2YL4pLaQF0iM+FRfbTJVJiBQX5Ys1PHLOehANv6gwpJ+GNtf5ZNZIH6vfp
 J8zA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWB9AztxJukDA4XtEKDUnuiVaPNDcAu2MipPd/JTHa58fk3R7CJfZ+zYoooxqb01ym6hp2PMyIb9K4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyomcAzgLsswQ1em4NhAx81ZQj25kGCahyWYlcTlbMj1aCIC5sP
 XGWPE0pFmL/vNNrECPbBBqz7HjtbOaToLLjPw+qkxMjbiw2A3KHrwKGVC6LjHps=
X-Google-Smtp-Source: AGHT+IGCRut9FWqfZ7C0QLGHRt+8oBGMHo6MzHx1/mYIiCCd2plQ8yWa0/xYu+IH/8DHvY1nJCE9Qg==
X-Received: by 2002:a17:907:7242:b0:a7a:a3ad:6007 with SMTP id
 a640c23a62f3a-a80aa677686mr35616366b.8.1723193101599; 
 Fri, 09 Aug 2024 01:45:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9d43777sm814854366b.136.2024.08.09.01.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 01:45:01 -0700 (PDT)
Date: Fri, 9 Aug 2024 10:44:58 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH 1/8] drm/fbdev-helper: Do delayed switcheroo in lastclose
 helper
Message-ID: <ZrXXCkyIrUDu0qVr@phenom.ffwll.local>
References: <20240807084539.304014-1-tzimmermann@suse.de>
 <20240807084539.304014-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807084539.304014-2-tzimmermann@suse.de>
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

On Wed, Aug 07, 2024 at 10:41:33AM +0200, Thomas Zimmermann wrote:
> Amdgpu and nouveau call vga_switcheroo_process_delayed_switch() from
> their lastclose callbacks. Call it from the fbdev lastclose helper,
> so that the driver functions can finally be removed.
> 
> The fbdev call is part of all lastclose handling that restores the
> DRM fbcon terminal. Only PCI devices with enabled switcheroo do the
> delayed switching. The call has no effect on other drivers.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_fb_helper.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 3f7da78849e4..f6667dfba8a2 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -2009,6 +2009,10 @@ EXPORT_SYMBOL(drm_fb_helper_hotplug_event);
>  void drm_fb_helper_lastclose(struct drm_device *dev)
>  {
>  	drm_fb_helper_restore_fbdev_mode_unlocked(dev->fb_helper);
> +
> +	if (dev_is_pci(dev->dev))
> +		vga_switcheroo_process_delayed_switch();

I think if you want to move this, it needs to be in drm core. Otherwise
the vgaswitcheroo delayed switching stops working if you disable fbdev
support. Which doesn't make much sense.
-Sima

> +
>  }
>  EXPORT_SYMBOL(drm_fb_helper_lastclose);
>  
> -- 
> 2.46.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
