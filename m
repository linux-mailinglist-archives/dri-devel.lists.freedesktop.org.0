Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4849747FC2
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 10:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B4810E33A;
	Wed,  5 Jul 2023 08:34:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3574B10E33A
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 08:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688546080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MUOdZ4jqa/jKVAp7tf5tIQFJQKaJ8W9OX/5MST4+nx0=;
 b=WMq01wB/n4y/LeGf/yxaEOBLJrUnqIDRduv6wturpL0HDoMZLinl8MvgNYYhGBzxHgletn
 1vvNtY3eEqFQ0E7KgJWN9Y2c+A0CvEYVzHQ5vo3T2jERZHpX3sWvg5QgfPoPaxF1ygKBGy
 hHfXaXbkn3i3uo70AfGgOq8zdpDKa+s=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-rU1rr9QZP5mUt6aR3eBHyw-1; Wed, 05 Jul 2023 04:34:39 -0400
X-MC-Unique: rU1rr9QZP5mUt6aR3eBHyw-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-4fb9c4b7020so5473680e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jul 2023 01:34:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688546077; x=1691138077;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MUOdZ4jqa/jKVAp7tf5tIQFJQKaJ8W9OX/5MST4+nx0=;
 b=Jcz4UmZYEG4cpKE+Lc8b5IRDTVaOUwkRZF/WneX6ihuZA4gwjLRDb5FFFlvimE/a5P
 SkO+c0/XLZH6/XTWBg9SEtZ1CKIqALpXoNTnVshuydbZxl+v5F6imVQZee10iwulURQ4
 evz58q0evMa1yeFWGS3v7TFUUrC1rrQeld2rgQT36k5/6L/ZAq7m/nVutEwzmxMJvy4U
 usAXDYUep9gPYAoT5/Y8JNZCFmXyGYGxI3HBZ6XbWuDh9jpdOpl1G8+Ib9xFaOyJfDUq
 rvssfbZ9Jk+CZ0QhnHi0seQvvUVWF6OPlUyX9wBgG9T7cj08c5gOvOsU3orMWJXvLJjq
 30gQ==
X-Gm-Message-State: ABy/qLadeqji8XjdWJZ5IsQki0JhGYtknSCl6B6LLB9A5sRhA4hZpTy2
 gobDBWchg2mJAsfNG655/YMrb7lR4R+GzM0iU18QWn68eXwzTjNX2n39Penf0f95Styy1XIjQQy
 OutMxsj1YZ/KzCa3NwAHd+A9c1ptg+EtzsTb9
X-Received: by 2002:a19:5012:0:b0:4f9:567a:7a59 with SMTP id
 e18-20020a195012000000b004f9567a7a59mr12555435lfb.30.1688546076853; 
 Wed, 05 Jul 2023 01:34:36 -0700 (PDT)
X-Google-Smtp-Source: APBJJlExsFBiiX6bb3J4q5RqDUoq+KcMvZbY+mbCkL7JfUUF8owQK16V9ABMtujWwpj0RBMM4IyVjA==
X-Received: by 2002:a19:5012:0:b0:4f9:567a:7a59 with SMTP id
 e18-20020a195012000000b004f9567a7a59mr12555416lfb.30.1688546076566; 
 Wed, 05 Jul 2023 01:34:36 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 a15-20020adffacf000000b0031434c08bb7sm8537215wrs.105.2023.07.05.01.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 01:34:36 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: Re: [PATCH 04/10] drm/tegra: Set fbdev flags
In-Reply-To: <20230704160133.20261-5-tzimmermann@suse.de>
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-5-tzimmermann@suse.de>
Date: Wed, 05 Jul 2023 10:34:35 +0200
Message-ID: <87wmzerc2s.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Set fbdev default flags FBNFO_DEFAULT and mark the framebuffer with
> FBINFO_VIRTFB. The framebuffer range is in DMA-able memory and should
> be accessed with the CPU's regular memory ops.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/fbdev.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/tegra/fbdev.c b/drivers/gpu/drm/tegra/fbdev.c
> index 82577b7c88da..8074430c52f1 100644
> --- a/drivers/gpu/drm/tegra/fbdev.c
> +++ b/drivers/gpu/drm/tegra/fbdev.c
> @@ -103,6 +103,8 @@ static int tegra_fbdev_probe(struct drm_fb_helper *helper,
>  		return PTR_ERR(info);
>  	}
>  
> +	info->flags = FBINFO_DEFAULT;
> +
>  	fb = tegra_fb_alloc(drm, &cmd, &bo, 1);
>  	if (IS_ERR(fb)) {
>  		err = PTR_ERR(fb);
> @@ -132,6 +134,7 @@ static int tegra_fbdev_probe(struct drm_fb_helper *helper,
>  		}
>  	}
>  
> +	info->flags |= FBINFO_VIRTFB;

I see that all fbdev drivers just do: info->flags = FBINFO_FLAG_DEFAULT | FBINFO_VIRTFB

Guess you are doing in two assignments to be consistent with drm_fbdev_dma.c ?
I was just curious about the rationale for setting the flags in two steps.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

