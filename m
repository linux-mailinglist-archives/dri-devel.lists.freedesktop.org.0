Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D391B928513
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 11:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E0F10E8BF;
	Fri,  5 Jul 2024 09:25:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="SdqIy2Vw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C384510E8C7
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 09:25:08 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-52ea5185ba7so30376e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2024 02:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1720171507; x=1720776307; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0LofcLSsp7M2vWIlVjbmMUO0qt28mhWGkIFJ9iz04Kg=;
 b=SdqIy2VwazOH1lVIPHszO3eRR+Y/ZW0LJaOy+GaedpEkNIxmA2VnoEYwIbYDi6je9F
 M+j1+ePKGMr2nRTh/E0LAtZ94Sab8BIsThZUr0h+ZYov6PfXMiTzpeIRvyqFEKYc/Biv
 NFQDRwiFxY7NwRa6G605+BM9qZZolt6WzKK/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720171507; x=1720776307;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0LofcLSsp7M2vWIlVjbmMUO0qt28mhWGkIFJ9iz04Kg=;
 b=R+tmlHg3KNCcSevC+/VOEDe0IRgBl2Y9wH2rBVxXS9YlZE/rVDGd8KABvaSINKudLr
 G7Mt1tXiDisMQ+bf4290cmHe86TbW6Bxue5MmtnAepOj+u8bb3fe9k5RCyHjKdCvzZ46
 VrFUQ8hBs93W7m4P56MJAO7Qga4ppohN4VD/pQw8pwYpECsF3OD+m/m8fRNeRmdulejy
 OciGTHFODKNmp6t0hm03KQyffM+JqMRvkFJ3kq4X6CQBgq7533TWbVaBTZ1hmrgKERZH
 vc7zixdo87vALuQ0bggKcyQyqD7EfVwzIvEEnzT/FD5GLMMQD7+QUoP1osIphfeZqh0p
 6FSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjpA4NNWwKoVtlUJifNo7eE2ytU3ihIJwMVuejg8Yzyu2XusTdYi/gOEiioT03xUc2pGjQCW2p+6vXV/OiLn9ssx/kejpqpnarU4ONR/ik
X-Gm-Message-State: AOJu0YwncyA/zmkqBDG6gkaFnR7oAoxTzbkp7RTafAEFNA4hP2DdRzBZ
 zSIloEPVuFpUW18BasLMChWZYrT7wqsJ1QbSFcW5dRMyR0c7E1/epIV9Dv0gnEU=
X-Google-Smtp-Source: AGHT+IG9WLIjGrPIKZw7awcUYj3mj1cCFYqezpsQI9ScJ9txg2x0yGyZwADoFivFBKIB1nKx/Oq4bQ==
X-Received: by 2002:ac2:46db:0:b0:52c:d805:e8c9 with SMTP id
 2adb3069b0e04-52ea0457d19mr2480287e87.0.1720171506765; 
 Fri, 05 Jul 2024 02:25:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a1d509asm53809865e9.8.2024.07.05.02.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 02:25:06 -0700 (PDT)
Date: Fri, 5 Jul 2024 11:25:04 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Inki Dae <inki.dae@samsung.com>
Cc: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-samsung-soc@vger.kernel.org
Subject: Re: [GIT PULL] exynos-drm-next
Message-ID: <Zoe78NeXT8cp72gq@phenom.ffwll.local>
References: <20240703075912.37106-1-inki.dae@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703075912.37106-1-inki.dae@samsung.com>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Wed, Jul 03, 2024 at 04:59:12PM +0900, Inki Dae wrote:
> Hi Dave and Daniel,
>    
>    Just three cleanup patches to Exynos Virtual Display driver
>    for improved management.
> 
> Please kindly let me know if there is any problem.
> 
> Thanks,
> Inki Dae
> 
> 
> The following changes since commit fb625bf6187d97c3cd28d680b14bf80f84207e5a:
> 
>   Merge tag 'drm-habanalabs-next-2024-06-23' of https://github.com/HabanaAI/drivers.accel.habanalabs.kernel into drm-next (2024-06-28 09:41:04 +1000)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v6.11
> 
> for you to fetch changes up to 2210093478443cd57cff5950379fec31ee8a5f79:
> 
>   drm/exynos/vidi: convert to struct drm_edid (2024-07-03 13:00:16 +0900)

Pulled, thanks.
-Sima

> 
> ----------------------------------------------------------------
> Some cleanups to Exynos Virtual Display driver
> - Use drm_edid_duplicate() instead of kmemdup().
> - Replace existing EDID handling with struct drm_edid functions
>   for improved management.
> - Keep an allocated raw_edid or NULL and handle fake_edid_info in get_modes().
> 
> ----------------------------------------------------------------
> Inki Dae (1):
>       Merge tag 'exynos-drm-fixes-for-v6.10-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into exynos-drm-next
> 
> Jani Nikula (4):
>       drm/exynos/vidi: fix memory leak in .get_modes()
>       drm/exynos/vidi: use drm_edid_duplicate()
>       drm/exynos/vidi: simplify fake edid handling
>       drm/exynos/vidi: convert to struct drm_edid
> 
> Krzysztof Kozlowski (1):
>       drm/exynos: dp: drop driver owner initialization
> 
> Marek Szyprowski (1):
>       drm/exynos: hdmi: report safe 640x480 mode as a fallback when no EDID found
> 
>  drivers/gpu/drm/exynos/exynos_dp.c       |  1 -
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c | 83 ++++++++++++++------------------
>  drivers/gpu/drm/exynos/exynos_hdmi.c     |  7 ++-
>  3 files changed, 42 insertions(+), 49 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
