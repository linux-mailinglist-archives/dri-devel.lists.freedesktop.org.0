Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EE19C5B86
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 16:12:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77AA210E5FF;
	Tue, 12 Nov 2024 15:12:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="inm5HEZC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B0D10E5FF;
 Tue, 12 Nov 2024 15:12:29 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-2e9a5ee0384so75394a91.3; 
 Tue, 12 Nov 2024 07:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731424349; x=1732029149; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DwDYmG+bOkgGjW//EMa6gyjvey1nh9nUwejsH/c3GqU=;
 b=inm5HEZC2S7zouhh+2dkViftKAlAElCnrkmwQdHl6T0DOyksDSD1KBRB+IgVxIrq2o
 Ra3Yt8w7Ary7JlZ0UyWr79GYgu9Ufd9CZ5ZZsgKocxKQuv7LCkDbe2d9nhSZAvUZxrEF
 WQGhboluheBLk9+wUtAJba96Wxt1VbhzNY7C808M3rIWP4duRrdQAVvcD6W3pW5rWhD6
 tzLl7KgRz8l1qS9mDOH11zWp25+ihIu8P7QHKJAF16kFcb7bO82lqNgJr8avfQVj/hRs
 7zWTvHE/biaCLYC5iwPo9diFnG+ChGFMSP8HrB5VpV6Gl2E5IX+eGwNPzvnvkaka/dTn
 Wh2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731424349; x=1732029149;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DwDYmG+bOkgGjW//EMa6gyjvey1nh9nUwejsH/c3GqU=;
 b=M+0Bs4+5Wz1JHFUI0gG+F3SsBTsLgmbVwU23WgeItB8j6HBKUNpVGAv/A49Vam1j+m
 zhzq4r7RI6UaqxN7AvbhF8orXWg7TQ4yjmvKfQbdc/jH3r0RlH9OpU85xhATkpjjTpP2
 ubhFdG9U00Ze5or7TH/b9vvUCqwYUIrfKIr5sBKWyGdbxjaJFoL9YUNz691OiaWX9V3k
 dODscXCbccY1xQSoDciPFQGmcDZ56tHvAmau5Z4HcEIJ6cK9QtWtZ4oE5YXTvNeTYmjJ
 LE/u0/QeVJMzpdktl0BMhyBD26AOIytUoUY+ayYxZWKWqRGR9zP3X9Ngn3fa1zm0mP9a
 loKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1s/ZtfXh4EcjX7G683lbAOXuKzv5KSrjgOVlum08dKqiyQbTIeiDymxcL1hOqRgmiM1nvTeHI@lists.freedesktop.org,
 AJvYcCUmQuwb7RjMyVySEc5mk49Ivudiq+CD3K/fyQRgE2D4AC6vlDTYxy34dbHdcsrYdEX6QE0wOgTLonS7@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdK0gn6/EaTHKFFzGk/abGDNpFbQ0gTGglA0RK+9FcBIL6FcwF
 xC54l9Spu+TJpQYLLOY4O45Qm9fIisK/crHMGIDpeHmBc6icBTfiJU3FkKG4w3RnzfMb/cuuqeX
 8VscsRPeAr3Emu8CpXLda/8LH7z9RHTN3
X-Google-Smtp-Source: AGHT+IEuOIyoqr3peFBCEcEA7x1qmkP8FjNe0h58I/h1ElTZXHgVr3FdhTzee+8DmN0bJEq4eHpb6EMkaDhuoDTVU6c=
X-Received: by 2002:a17:90b:4b43:b0:2e2:cd5e:b25 with SMTP id
 98e67ed59e1d1-2e9b1680927mr9218243a91.6.1731424348790; Tue, 12 Nov 2024
 07:12:28 -0800 (PST)
MIME-Version: 1.0
References: <20240604160503.43359-1-christian.koenig@amd.com>
 <20240604160503.43359-4-christian.koenig@amd.com>
In-Reply-To: <20240604160503.43359-4-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Nov 2024 10:12:17 -0500
Message-ID: <CADnq5_NB2WZx_HEh3GOM87i45AsuUjkfkhr3V9makfpwu8VbzQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm/amdgpu: enable GTT fallback handling for dGPUs
 only
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: tursulin@ursulin.net, friedrich.vock@gmx.de, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Jun 4, 2024 at 12:12=E2=80=AFPM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> That is just a waste of time on APUs.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3704
Fixes: 216c1282dde3 ("drm/amdgpu: use GTT only as fallback for VRAM|GTT")

and pushed.

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_object.c
> index 8d8c39be6129..f7b534c55c43 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -180,7 +180,8 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo=
 *abo, u32 domain)
>                  * When GTT is just an alternative to VRAM make sure that=
 we
>                  * only use it as fallback and still try to fill up VRAM =
first.
>                  */
> -               if (domain & abo->preferred_domains & AMDGPU_GEM_DOMAIN_V=
RAM)
> +               if (domain & abo->preferred_domains & AMDGPU_GEM_DOMAIN_V=
RAM &&
> +                   !(adev->flags & AMD_IS_APU))
>                         places[c].flags |=3D TTM_PL_FLAG_FALLBACK;
>                 c++;
>         }
> --
> 2.34.1
>
