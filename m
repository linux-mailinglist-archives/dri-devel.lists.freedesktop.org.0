Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 814E4B0D75A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 12:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE44710E650;
	Tue, 22 Jul 2025 10:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O199kb5K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8619D10E650;
 Tue, 22 Jul 2025 10:29:22 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3a52874d593so3945659f8f.0; 
 Tue, 22 Jul 2025 03:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753180161; x=1753784961; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fxZUVGACW46ROFRrurwhfL/bIVT9DSzn+Z7eP3oj7pY=;
 b=O199kb5KgmLkOOxU/JeRvW7KbRIzqrefocFrahXNFxhW3f7te0qPGCLCkGLk6PX1Mk
 Jpw816fDZbzEk34+U1XSRGjIVEcn94jEk4C1me4Ykr6N3KzwDF36BvO057L+wu5L3oiR
 6tUeLqM4My44ybROCRtVXpFQRA/0I/9PWUfNvyVOomT34jOhWb/7b6aEdSBLa0m59K9C
 +ORgOUaxCeNLq/oyYz66qSjVVcG9HSrZZtiMsB2AqQPp7eQnJz3djEn4rwFETxj9uKJc
 jN3Ja9mTkPW0CbuTsj5Xb39qQbyDAjoRHfYWfTdRNr+x5p9wiz9kUwYSp7251kiws1eQ
 Arsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753180161; x=1753784961;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fxZUVGACW46ROFRrurwhfL/bIVT9DSzn+Z7eP3oj7pY=;
 b=i92RmpZBkVf5bt9mHUVugpKaUuZV2oUOh7TGRCzKShuQZWIRpgdVcjkrswXdWm0Mic
 rrBj5nryPf6x9US1AiwFKyka6L94FdemA3ASNIPvbz3HwDez5BFNo2z+s+C0ATJtJy1e
 7UcIhh346ViHwPzqxPhyZk97MWAfh2DZL11aXwBgLdKJcwg1XtOm4fUo9L6uHGNi+Yku
 eY4EZG+haeLHeEn/eDugl4eM10FSWppApfFCfEYGzUmwBS7kj5wyeqPswXftiu2UdR/o
 tqQMoUXhSADsM/d+TnvqJ3zUFgVNpCl7+Us7LxT9MLV8Nu8/BGEIclzZy59ROIZPVmMl
 9pKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVf5iiuQz1hKjqupW1OiEjlCUG7f1GR9WZvYeu2ovbUsHkNUZbKAu2SqqMDzWTq1s9+ZmiaMXnaoQ==@lists.freedesktop.org,
 AJvYcCXeyOjbYTMiDVlM81UWTa/H+NPuFlF+boA+PyC+PWfWxx2N4bXLTJ6WnYKSsbWoAe0T2hybODGMLoA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7EyTBXzm6kV4HDyMIviYiSD9lpGcXEfUeG9B5sFW/IdSy70d+
 JeMpk/HUQ5T/uozGH/+q+nUK52jWSpyjnWZazDiOhT9kNJn1ovJwO4/c
X-Gm-Gg: ASbGncu/UC7ZzobldYAVXRxDlskqComagNE7LCgvN8cCbCAa/Vw2cpK4qgsDdDowEm8
 V7t0ZKx9KAkJMc0lq/+J2PbVnJV1YhSP4pAHACb7Jk3CA12m0mTNkeGfBrMEHlx4bGdB6Mpx0Jc
 4s7+bYVM9NnbVl7T1snJo4atz6f9JlCR9oSCLQztESAhPRiuLKhFw92DaeU6Ur1CGQAGh+rxRQc
 BhlA5AlA2AyNCKR4tSF9LbsBZ4gRlzh3TQBHpAPqG+XAc5x4ikGZyc0SP7QZMx9bSTTvxLubgkV
 DI/41eHOkSWF4U+WrA5raXcktWDfESU153xk/jt1qY11ENl9fX/fV1INq6fd2DJFroSqW7Hit1m
 fuFUunXQRN19cE75ua0vAsg76k7wnK5I=
X-Google-Smtp-Source: AGHT+IEHBlNbQ1YPEWSxQJSYPHljQ9UoaZeqhCRzRGrQ0XzA5BTAIrm5I1v2Kds708E89K2m5lCgjg==
X-Received: by 2002:a05:6000:4b17:b0:3a4:e1e1:7779 with SMTP id
 ffacd0b85a97d-3b60e50ff22mr18202349f8f.32.1753180160588; 
 Tue, 22 Jul 2025 03:29:20 -0700 (PDT)
Received: from debian.local ([81.78.104.57]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4563b75de26sm125434925e9.33.2025.07.22.03.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 03:29:20 -0700 (PDT)
Date: Tue, 22 Jul 2025 11:29:17 +0100
From: Chris Bainbridge <chris.bainbridge@gmail.com>
To: Satadru Pramanik <satadru@gmail.com>
Cc: Arnd Bergmann <arnd@kernel.org>, airlied@gmail.com, airlied@redhat.com,
 arnd@arndb.de, bskeggs@nvidia.com, bskeggs@redhat.com,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org,
 simona@ffwll.ch, ttabi@nvidia.com, Thomas Zimmermann <tzimmermann@suse.de>,
 regressions@lists.linux.dev
Subject: Re: [PATCH] drm/nouveau: check ioctl command codes better
Message-ID: <aH9n_QGMFx2ZbKlw@debian.local>
References: <CAFrh3J85tsZRpOHQtKgNHUVnn=EG=QKBnZTRtWS8eWSc1K1xkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFrh3J85tsZRpOHQtKgNHUVnn=EG=QKBnZTRtWS8eWSc1K1xkA@mail.gmail.com>
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

On Mon, Jul 21, 2025 at 08:22:48AM -0400, Satadru Pramanik wrote:
> Hello all,
> 
> I suspect this commit in 6.16-rc7 has broken acceleration with Mesa's
> nouveau drivers on my machine.
> 
> glxinfo -B reports that I'm using llvmpipe.
> 
> Reverting this in 6.16-rc7 restores nouveau acceleration, and glxinfo
> then reports: "OpenGL renderer string: NVE7"
> 
> inxi -G
> Graphics:
>   Device-1: NVIDIA GK107M [GeForce GT 750M Mac Edition] driver: nouveau
>     v: kernel
>   Display: wayland server: X.Org v: 24.1.8 with: Xwayland v: 24.1.8
>     compositor: gnome-shell v: 48.0 driver: X: loaded: modesetting
>     unloaded: fbdev,vesa dri: nouveau gpu: nouveau resolution: 2880x1800~60Hz
>   API: EGL v: 1.5 drivers: nouveau,swrast
>     platforms: gbm,wayland,x11,surfaceless,device
>   API: OpenGL v: 4.5 compat-v: 4.3 vendor: mesa
>     v: 25.2.0~rc1+git2507191056.03f67b52319~p~mesarc0 renderer: NVE7
>   API: Vulkan v: 1.4.304 drivers: N/A surfaces: xcb,xlib,wayland
>   Info: Tools: api: eglinfo, glxinfo, vulkaninfo x11: xdriinfo, xdpyinfo,
>     xprop, xrandr
> 
> Best,
> Satadru Pramanik

I also bisected an issue to this commit. On my laptop, this commit
results in an intermittent desktop crash (Xorg segfault) when changing
display scale, which can be more reliably reproduced with:

for x in {1..100}; do
  xrandr --output eDP-1 --mode 2560x1600 --scale 0.5 --filter nearest
  xrandr --output eDP-1 --mode 2560x1600 --scale 1 --filter nearest
done

I also see the same glxinfo llvmpipe change that Satadru reported.
Reverting the commit fixes my scale test case, and also the glxinfo
renderer.

#regzbot introduced: e5478166dffb51fa64e76cdbb5c24421f22f2d43 ^
#regzbot title: nouveau hardware acceleration broken
