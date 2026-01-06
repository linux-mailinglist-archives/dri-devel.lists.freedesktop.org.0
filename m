Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B61CF8DA0
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 15:47:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C1C10E50A;
	Tue,  6 Jan 2026 14:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X8sHDySV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335B510E50A
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 14:47:50 +0000 (UTC)
Received: by mail-dl1-f51.google.com with SMTP id
 a92af1059eb24-11ddccf4afdso21034c88.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 06:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767710869; x=1768315669; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lGFocwYcUO10lAdaXraGl5kbq7qJfVKH2xOcweaicaY=;
 b=X8sHDySVCkyexJsz2TCMqmVl7pjSAU+6eWS4czL3xwx/h65nsy8kbpGYvlZrgZH/Xj
 AbpeeFT8DFSzstFWTmD2gfv0aETCj5I7a3JPT+kykRhxQSY4fb/UVPSTvk4y2Q/cU2fr
 YJzEu5G3sGNJ035qiu7uGNpl1VLL7Qy4QjRwIvQMCXbJlM3P+5V+yEBV0Uu+zejgjfOy
 TgtAaZcc0M75gZsahmPQnbwuqxsORs8N4vH7rU7W6KEqfNEr3yRzv+KdlR7C6eY74nmL
 k10Z7S/zSkxLf5mISRB/NBREo7crNXjHTq7Oz5Ydadm3N23U/Qt4QsgP+V2VzNrnGFyr
 cJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767710869; x=1768315669;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lGFocwYcUO10lAdaXraGl5kbq7qJfVKH2xOcweaicaY=;
 b=wnGMJXyJmF7gsM2rDRagB/1V8OvHXLnPLmKMuF3J605lhjeZoGlpqqonjc4O6ChFlA
 oRfhq7G9J4mdFGVhlMb0O+4aUKeiY3yR5qi8x+66H/lp8xSKi+0z/Nz4CkGzhLmlvkG4
 LpwbELVGpwlZiKFHAMyFo3TPA1FPONE5r+B1k9EVa6QZThqakHAT9M3v67seCxjxwnFV
 wrQCznKpZoqYvM39zAM8a9DW/ore61uq8rdyx/9SBgm/fERxjCv4oO0wkomD4ASDHJrU
 esf0IFJp6KUnJkHXOk63+94M07dcwZUJ4faQzvenqryhTVjC9SV0j3i2Hi5DPSPFawqC
 9chg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEMpTD06pRs+3zjc13NRPCFU6aGXFBHuYrqvFbV3tlpI95lBgeXEBhblq/n3qGdvDp5BmLRD6/x/U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzj08BFXssM+DkQ4pQmzZkB7cIZL2XfOs78b9U1Sex2ZVXc04YO
 EXwmQeVVCTam4tY0KmyU7CVbSw0dTFTJMDJ+1D97PZ1h9h4a80DWqwf76Z5+cxamAActSe/pQAh
 /VuJ9viDPMVn1ZHgrLRyQG4d6vnk4Zq4=
X-Gm-Gg: AY/fxX5VkFIggxN/1ySSTOCQPjGzK8pSGYTfGDVK8+qFu6+3kZfZi+bImnqa3xjyHiw
 E0EEZEyivnZLhzjrbbOeZeU5z9AZ1L3mQAC0pVlpcSz2fTcaScSWKosOg21XdHFGvaUrEPfIStk
 dIUgSQKMlZZSlVf/zmorxpUOaSIu6YCI6P0zassQR+MkdYP/Eyl9mvgf72vM4wRlqxrK7Wdvrzq
 keFDqGLyTebZIESM3k1PhfAs2Hbl/kdkjvk/Wzy5aTAa3FQuo/OkuWqa8FmNwDhZ1gkptvw
X-Google-Smtp-Source: AGHT+IEeTUiuD7kCf6JvD92QT3fvl/RpMs7KXHBBTDvwNHDOFoemydUJ2WuNt3K41sWhVgVvtnjJ7fUHLLutaCZ5vd8=
X-Received: by 2002:a05:7301:1446:b0:2a4:3593:2c0a with SMTP id
 5a478bee46e88-2b16f864435mr979958eec.3.1767710869195; Tue, 06 Jan 2026
 06:47:49 -0800 (PST)
MIME-Version: 1.0
References: <20260106023712.54546-1-yaolu@kylinos.cn>
In-Reply-To: <20260106023712.54546-1-yaolu@kylinos.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 6 Jan 2026 09:47:37 -0500
X-Gm-Features: AQt7F2p9ChaNCsLSPwYIOt2PgtwTnPPeqDb16LJopLTt5PzQrlbAse8IKAMpwY8
Message-ID: <CADnq5_Oh5iJirX57cJskcTyKixsLFGeDBaTgc-r15UjFt8fWVA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix drm panic null pointer when driver not
 support atomic
To: yaolu@kylinos.cn
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Applied.  Thanks!

On Mon, Jan 5, 2026 at 9:37=E2=80=AFPM <yaolu@kylinos.cn> wrote:
>
> From: Lu Yao <yaolu@kylinos.cn>
>
> When driver not support atomic, fb using plane->fb rather than
> plane->state->fb.
>
> Fixes: fe151ed7af54 ("drm/amdgpu: add generic display panic helper code")
> Signed-off-by: Lu Yao <yaolu@kylinos.cn>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_display.c
> index b5d34797d606..52bc04452812 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -1880,7 +1880,12 @@ int amdgpu_display_get_scanout_buffer(struct drm_p=
lane *plane,
>                                       struct drm_scanout_buffer *sb)
>  {
>         struct amdgpu_bo *abo;
> -       struct drm_framebuffer *fb =3D plane->state->fb;
> +       struct drm_framebuffer *fb;
> +
> +       if (drm_drv_uses_atomic_modeset(plane->dev))
> +               fb =3D plane->state->fb;
> +       else
> +               fb =3D plane->fb;
>
>         if (!fb)
>                 return -EINVAL;
> --
> 2.25.1
>
