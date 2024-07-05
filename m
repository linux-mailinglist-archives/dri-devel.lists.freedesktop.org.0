Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7508792875E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 12:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D7EE10EA92;
	Fri,  5 Jul 2024 10:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="bdQNp2SQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA5610EAC7
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 10:58:47 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-42650d13148so428935e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2024 03:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1720177126; x=1720781926; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8ARE4QJzgYSmcORTtwUB8Wm+tdpAU8tdk3BScv/JHGs=;
 b=bdQNp2SQsGILW+Jd2ZePi+IPWmlHpjfhfQ6nnUMk/XXdwqRrPH3fi1g3oId4mDDXqh
 9LYkEIXu05GwSI6gYE+qnjVBLv0Xx/DzNmEMDD5aSOa8u0K28GZj5OvAEkGGVfM7cuZN
 DjJXJ6MXKwJfdaQOd0tBgPJ4IPvWrpX5dM+Zs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720177126; x=1720781926;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ARE4QJzgYSmcORTtwUB8Wm+tdpAU8tdk3BScv/JHGs=;
 b=nOD5H56jlFnakNh6Hqsh9Un/myyLODQTW6g/kxuSPZlLPmELw/aNEjWujLmoAgwl4G
 nXCrgn5Gu4y/GXzNhnB6jbT+9sEC0sj6k/0mj/w4E9ZGYLwxrLuIExjkdDgbhpomq7Oy
 CXko9nE0E7XUe8vm9q5Fs5ImS5wIvm8BJ6CaLB/o/1vpk42iYULeMXAFRQ0BGjaeNkxn
 XYm9Isnj/GtPBQYb5O9Saj9BypCE0PRk/KlroBl5QHG1OyxVzyGEqVgRUUieB4QutjEQ
 CWITBOg2NfuHJT0g8nxkWVVfjnGVFDsjUGP6JNkgyGs0RoFvkvLHYjjKyF6l67SqpDnO
 GbAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUk4PT0kglMOvGxBZIYVIwTPJFoiydH7qRmthG2M38p1mQ2+7DtVAtcMtNYpz82JOqyqeP/9LXr0yTnB+iTe3pUwp+xXTjy9/bO3l4oXFiz
X-Gm-Message-State: AOJu0Yzw4BmVAvSRO2pGXTbmyfcd3uIlLWhrefgsbYRbwUFvzO/GDiFJ
 TfYGqvnW6q0GsjITJBoFnR7x3njpY4jjMqU84zUmhIy5iOEcZnfMChIkdbq3jyw=
X-Google-Smtp-Source: AGHT+IH+TcL/ZdSOPs2l6kIeWBHH+UDk+ZBf4629oUZaZDmXwBQLc4Q9p3rqq+s1+21GLCrX2kiP7A==
X-Received: by 2002:a5d:5988:0:b0:367:9505:73e2 with SMTP id
 ffacd0b85a97d-3679dd62d9emr3194419f8f.4.1720177125827; 
 Fri, 05 Jul 2024 03:58:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36791d7a93bsm6658987f8f.81.2024.07.05.03.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 03:58:45 -0700 (PDT)
Date: Fri, 5 Jul 2024 12:58:43 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: Re: [pull] amdgpu, radeon drm-fixes-6.10
Message-ID: <ZofR4znVEPn5fjPL@phenom.ffwll.local>
References: <20240703184723.1981997-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703184723.1981997-1-alexander.deucher@amd.com>
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

On Wed, Jul 03, 2024 at 02:47:23PM -0400, Alex Deucher wrote:
> Hi Dave, Sima,
> 
> Fixes for 6.10.
> 
> The following changes since commit 22a40d14b572deb80c0648557f4bd502d7e83826:
> 
>   Linux 6.10-rc6 (2024-06-30 14:40:44 -0700)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.10-2024-07-03
> 
> for you to fetch changes up to d0417264437a8fa05f894cabba5a26715b32d78e:
> 
>   drm/amdgpu/atomfirmware: silence UBSAN warning (2024-07-02 18:34:05 -0400)

Pulled, thanks.

Also I noticed you have some cherry-picks from -next in here, would be
good to add a cherry-pick from annotation like drm-intel/xe does (or dim
cherry-pick does).

It doesn't help to prevent Greg KH from getting confused, but it does help
everyone else since cherry-picks tend to cause confusing conflicts.

Cheers, Sima
> 
> ----------------------------------------------------------------
> amd-drm-fixes-6.10-2024-07-03:
> 
> amdgpu:
> - Freesync fixes
> - DML1 bandwidth fix
> - DCN 3.5 fixes
> - DML2 fix
> - Silence an UBSAN warning
> 
> radeon:
> - GPUVM fix
> 
> ----------------------------------------------------------------
> Alex Deucher (1):
>       drm/amdgpu/atomfirmware: silence UBSAN warning
> 
> Alvin Lee (1):
>       drm/amd/display: Account for cursor prefetch BW in DML1 mode support
> 
> Fangzhi Zuo (1):
>       drm/amd/display: Update efficiency bandwidth for dcn351
> 
> Pierre-Eric Pelloux-Prayer (1):
>       drm/radeon: check bo_va->bo is non-NULL before using it
> 
> Roman Li (1):
>       drm/amd/display: Fix array-index-out-of-bounds in dml2/FCLKChangeSupport
> 
> Tom Chung (3):
>       drm/amd/display: Reset freesync config before update new state
>       drm/amd/display: Add refresh rate range check
>       drm/amd/display: Fix refresh rate range for some panel
> 
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 53 +++++++++++++++++++++-
>  .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |  3 ++
>  .../amd/display/dc/dml2/dml2_translation_helper.c  |  1 +
>  drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c   |  2 +-
>  drivers/gpu/drm/amd/include/atomfirmware.h         |  2 +-
>  drivers/gpu/drm/radeon/radeon_gem.c                |  2 +-
>  6 files changed, 59 insertions(+), 4 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
