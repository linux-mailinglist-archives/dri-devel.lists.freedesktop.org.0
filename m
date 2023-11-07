Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBF97E4392
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 16:36:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2794210E073;
	Tue,  7 Nov 2023 15:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [IPv6:2607:f8b0:4864:20::92f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A76D10E0A3
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 15:35:59 +0000 (UTC)
Received: by mail-ua1-x92f.google.com with SMTP id
 a1e0cc1a2514c-7b6e1770519so1572007241.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 07:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699371358; x=1699976158; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BZqwEk90H97hbODv9brPBFZE2JhJMU7rcldMtR9zCqM=;
 b=o+EqWpLJXasRZJSCHQlvxSN0AyAu5WL4er+qyH0zmoK3XzFL15KZqExXbIq16d4doU
 6MiqK11vTpB+0YJ7YFIq/aB/hpqtb34NgEnXirbqJuiZuk2OYt9GPAdBxoApkA3hbT02
 UVAg/bzqJ2g9aS1F4GdjeGIm+oaTzAU7fZHnyV0GSuNPVHObAeMtWogvbllrk71Xow5S
 BC6KCTYjbahaxWOU22NltH1XGPyFUtMywWHgrrP07QEHb+rWKlUgSzBU1D6e2Ov7FRO3
 zgh0yA/sAYx8RiLZkzfimvhyG7ma03VdO5jI8hmwt00JHiAmqQ6FHB/hM9u5VPjQXpFW
 9zGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699371358; x=1699976158;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BZqwEk90H97hbODv9brPBFZE2JhJMU7rcldMtR9zCqM=;
 b=vkb7Nw20H9sEFLOoyNrYcSP4lkANLnMRvJh0kQEc86lI3t0K7XWhnLACxORLwAzpfu
 dLePRUonn05+XLuxLNGP9FJC8yRQZLPh0H90ZqYRRwMGo3Qqb3IthD9faiLDAhmfZuen
 fZGInDUFiVj+e8PoujCDammRg6hlnC9+qaAVU22xylOj7eohKpURJWPCk7Cs0Bd54d18
 FxEfWsycTzaWyfOg50JyFxMH1fsOyjNdph8jxYcnlN5Kx2xamMhsqL24cgTJc/M0HEQ6
 UhFn3G1ZcXs6JVq1A4M0r3TCxBnAhx/lxCOJ6Tule3P2NAKBA7cycADWhhtv1WVQuSki
 +vkw==
X-Gm-Message-State: AOJu0YzVuyv6mmlqpq7e+cNjwadBkNdZHbxMMNka9dV+ov7ZUfzhxoOI
 uzmnUq/HyDKW9Nnu8XoX1ldMw9acje0fd9dq73egAw==
X-Google-Smtp-Source: AGHT+IG5CuPEbzlo2z0WKHJQCgqgKd0wyQ+rtlhDVzsghymOYbe8ervp6lWqf1FTSQbV4tPEGP0CprIm0yVbUDYzT7I=
X-Received: by 2002:a05:6102:5493:b0:45f:3b30:9c93 with SMTP id
 bk19-20020a056102549300b0045f3b309c93mr5361920vsb.22.1699371358609; Tue, 07
 Nov 2023 07:35:58 -0800 (PST)
MIME-Version: 1.0
References: <20231031175453.1383422-1-alexander.deucher@amd.com>
In-Reply-To: <20231031175453.1383422-1-alexander.deucher@amd.com>
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 7 Nov 2023 15:35:47 +0000
Message-ID: <CANgGJDrGb3_jnRySPMqkjyRWC3PmWTM=ucAD6-EDpWQew1ZYzQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: don't put MQDs in VRAM on ARM | ARM64
To: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 31 Oct 2023 at 17:55, Alex Deucher <alexander.deucher@amd.com> wrote:
>
> Issues were reported with commit 1cfb4d612127
> ("drm/amdgpu: put MQDs in VRAM") on an ADLINK Ampere
> Altra Developer Platform (AVA developer platform).
>
> Various ARM systems seem to have problems related
> to PCIe and MMIO access.  In this case, I'm not sure
> if this is specific to the ADLINK platform or ARM
> in general.  Seems to be some coherency issue with
> VRAM.  For now, just don't put MQDs in VRAM on ARM.
>
> Link: https://lists.freedesktop.org/archives/amd-gfx/2023-October/100453.html
> Fixes: 1cfb4d612127 ("drm/amdgpu: put MQDs in VRAM")
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Cc: alexey.klimov@linaro.org

Thanks for the patch! Can you please give me day or two to test it a
little bit more? I am still trying ti figure out if page faults in GPU
depend on this patch or not. I can provide Tested-by tag then.

Also, FWIW maybe you can add Reported-by tag.

Thanks,
Alexey


> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> index c92e0aba69e1..a2a29dcb2422 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> @@ -385,9 +385,11 @@ int amdgpu_gfx_mqd_sw_init(struct amdgpu_device *adev,
>         struct amdgpu_ring *ring = &kiq->ring;
>         u32 domain = AMDGPU_GEM_DOMAIN_GTT;
>
> +#if !defined(CONFIG_ARM) && !defined(CONFIG_ARM64)
>         /* Only enable on gfx10 and 11 for now to avoid changing behavior on older chips */
>         if (amdgpu_ip_version(adev, GC_HWIP, 0) >= IP_VERSION(10, 0, 0))
>                 domain |= AMDGPU_GEM_DOMAIN_VRAM;
> +#endif
>
>         /* create MQD for KIQ */
>         if (!adev->enable_mes_kiq && !ring->mqd_obj) {
> --
> 2.41.0
>
