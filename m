Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B33E24668DB
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 18:10:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 916FC6FC3D;
	Thu,  2 Dec 2021 17:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C856FBF1;
 Thu,  2 Dec 2021 17:10:23 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 a23-20020a9d4717000000b0056c15d6d0caso456385otf.12; 
 Thu, 02 Dec 2021 09:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3WayNfqfYACfpbERzCtZCuTnUQRk8ktnSw63UP5xFjE=;
 b=a618i81ZV9JVXx+IZ/d1w1zmAk/IeXGu0wUb929VY3G5KhUufp3jFW+XuYZaZ6OSEb
 lv0QzOCVZjSimWE6x5anfaeHNQQhQZn8z3zGMJhuO6JdRJNY7Hb+UJDiAioOT5Z6pWJL
 TY9hSVTI8z+8e33sEYOAnkMydqNJS6U2rOxE7EfIiF8FSb4IuXsfTfF8ERspEtnlwSaI
 prlS8r83NORVHQEaFJKepdgLWZOIdC1K/mr9nxSovltq3qSAR4/HIS+o72vKjHpCiWUY
 +VN83ksIjGI/K/QbG3sGct7jEt6qlIpyHojzwZN6FYNLNa9Z+H5l+AyFAZcBPGaga/6x
 ZI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3WayNfqfYACfpbERzCtZCuTnUQRk8ktnSw63UP5xFjE=;
 b=TTGNVrQ7YXjdAQElNifAumINLbo95OuQxsujBh16vi8ZZiaucAyv+VcZAgeJvHsihi
 QhEALtYs0uDEILBNQewaFcAvPcCZTeOGUcg24PFbDy31eRgfyzRQy7gWjq4RMqJ1wtb0
 tSF+TIaUn/K8XRBH/6BMIhXbHxhSwT9aMrRdJxDKQ8+yZ9+7PXPly6yLZrCp0vw0TWJO
 YNp5qbwrkvjeBXBRiHjy73hO6whswA4+08/ByjQsoNbbdfa8l1b0hDfpv7EZWDRStu6m
 v9jLV8xR8A0gZgepu+vYncvsmsmATQdr4i+7mfXtZIMEF3UhgahfMK9MkVIT8Xx284ms
 vDFA==
X-Gm-Message-State: AOAM530e+QarO3o2FFnSjsMK6EaAcqxQPqRSPae0xKowyL2h+T7QAzdr
 FQSezdlefahhPzF2wQCe2vX9yTbtjJmMvo+KbCY=
X-Google-Smtp-Source: ABdhPJzrkUf5R3KYcTa3CesqJov61lKyaXuCS3yOQezyTdB0qn7VhnDLKacPNbFj0iU++cfMWNRw3m/BkkFN/2qFF6A=
X-Received: by 2002:a9d:67c1:: with SMTP id c1mr12454183otn.299.1638465022218; 
 Thu, 02 Dec 2021 09:10:22 -0800 (PST)
MIME-Version: 1.0
References: <CADnq5_P8amQK60zD-2tkVWBneZCoLENe5KY_S6eqoAAyOieatg@mail.gmail.com>
 <20211202161738.79176-1-zhou1615@umn.edu>
In-Reply-To: <20211202161738.79176-1-zhou1615@umn.edu>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 2 Dec 2021 12:10:10 -0500
Message-ID: <CADnq5_OZkc9oCFut1cmX+-RaJreVxH7T94seCdgKSgq2xyaSnw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu: Fix a NULL pointer dereference in
 amdgpu_connector_lcd_native_mode()
To: Zhou Qingyang <zhou1615@umn.edu>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Jammy Zhou <Jammy.Zhou@amd.com>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Kangjie Lu <kjlu@umn.edu>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 hongao <hongao@uniontech.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Dec 2, 2021 at 11:17 AM Zhou Qingyang <zhou1615@umn.edu> wrote:
>
> In amdgpu_connector_lcd_native_mode(), the return value of
> drm_mode_duplicate() is assigned to mode, and there is a dereference
> of it in amdgpu_connector_lcd_native_mode(), which will lead to a NULL
> pointer dereference on failure of drm_mode_duplicate().
>
> Fix this bug add a check of mode.
>
> This bug was found by a static analyzer. The analysis employs
> differential checking to identify inconsistent security operations
> (e.g., checks or kfrees) between two code paths and confirms that the
> inconsistent operations are not recovered in the current function or
> the callers, so they constitute bugs.
>
> Note that, as a bug found by static analysis, it can be a false
> positive or hard to trigger. Multiple researchers have cross-reviewed
> the bug.
>
> Builds with CONFIG_DRM_AMDGPU=m show no new warnings, and
> our static analyzer no longer warns about this code.
>
> Fixes: d38ceaf99ed0 ("drm/amdgpu: add core driver (v4)")
> Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
> ---
> Changes in v2:
>   -  Fix the similar bug in else clause
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> index 0de66f59adb8..df1f9b88a53f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> @@ -387,6 +387,9 @@ amdgpu_connector_lcd_native_mode(struct drm_encoder *encoder)
>             native_mode->vdisplay != 0 &&
>             native_mode->clock != 0) {
>                 mode = drm_mode_duplicate(dev, native_mode);
> +               if (!mode)
> +                       return NULL;
> +
>                 mode->type = DRM_MODE_TYPE_PREFERRED | DRM_MODE_TYPE_DRIVER;
>                 drm_mode_set_name(mode);
>
> @@ -401,6 +404,9 @@ amdgpu_connector_lcd_native_mode(struct drm_encoder *encoder)
>                  * simpler.
>                  */
>                 mode = drm_cvt_mode(dev, native_mode->hdisplay, native_mode->vdisplay, 60, true, false, false);
> +               if (!mode)
> +                       return NULL;
> +
>                 mode->type = DRM_MODE_TYPE_PREFERRED | DRM_MODE_TYPE_DRIVER;
>                 DRM_DEBUG_KMS("Adding cvt approximation of native panel mode %s\n", mode->name);
>         }
> --
> 2.25.1
>
