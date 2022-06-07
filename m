Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBCC540C16
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 20:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BDD10EE43;
	Tue,  7 Jun 2022 18:33:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770E110EE43;
 Tue,  7 Jun 2022 18:33:47 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 w19-20020a9d6393000000b0060aeb359ca8so13492344otk.6; 
 Tue, 07 Jun 2022 11:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=riYxWgnfyEpcIgAiDw0L5BFc6QRBMqAyo9RFEVz4Ltg=;
 b=XBkzcn57gKjDBu71hUDF7cAVJFALVJI4Nv/Ffo3O1uQTQ2qw8JOcs/hc4yUu1NHNCp
 +KgXAx7OYD6YxbzeZPvOozEqWsVq4hSzGeh3c/xROn+dyTt8DboZkCw/Tl+RdhY6OEAu
 iX4P2GFeZ0wH6Iz5JajX+2AbV6wdBs5eqCa1Bh0/vGpZlUO0C328blVHX9R6iQUOi2co
 FT58XcbsAP3L3EfnAg3UOvZT9e5p4dfMHJMekbq1peYgPGsbMsGw8uBfHFskrXtrc2Um
 i0j85cQnTjMaDHcg5FH6wBHKFitjvV95aXQj81nT/B3ysWsJ6ujEayv7pAdT1Y8Y8JP/
 Vnhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=riYxWgnfyEpcIgAiDw0L5BFc6QRBMqAyo9RFEVz4Ltg=;
 b=KNCRElzxRaBCOH08NpzBNPITm1kDYmN21S9IIVCFD168tPnOcw9Nb9oOj3LEUTz0A0
 XhtrMd6m3t2qJyLYsy+7MDv6dufnq0rlZP8GaLCMF3WeY1qFXbCVbI/uPiuOsh1ew0a3
 lVizTV6iGYfYyh76VVew5BjcS/IIItAv1esFwrwumrUbBa/VljTIpuJYTb2tiPRSmDeT
 dk1a3h9T0bqMrhfjXteESoiPxRvOywr/1c4PGf4Hc2ZkeyntIbLRKzwfOStaOWL6FRF6
 gBSbZ/x5zUImW6EeiiDfkzog1cp7/2fP2cd2dL2A7tojJZ4u24oK9dv4MWkDqr7T7YCj
 +FIA==
X-Gm-Message-State: AOAM530/TeRJflLoJqKKJG0OAe0R3nEyZyiCsy09eeXX1R0B3M1VOl5q
 qZcwvNI+ag7pOaaGVnOuAH2D8NFG0r9gnIlQDBUynkjj
X-Google-Smtp-Source: ABdhPJzCFqUJwteu4cxYpuQ2hYA5XaObaQJO5AY5u27Jnfmp15v1BHMqqwy3pR5lplBBUEgCdfoXCvfF1xZCEOYJgmI=
X-Received: by 2002:a9d:5f9c:0:b0:60b:f3e3:4658 with SMTP id
 g28-20020a9d5f9c000000b0060bf3e34658mr6776825oti.200.1654626826726; Tue, 07
 Jun 2022 11:33:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220607153631.7885-1-xiaohuizhang@ruc.edu.cn>
In-Reply-To: <20220607153631.7885-1-xiaohuizhang@ruc.edu.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 7 Jun 2022 14:33:35 -0400
Message-ID: <CADnq5_Nwf_bDVmT3fXTHFcxwfK1qzBP2Bi3mfYdSAHD5q9G=CQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/radeon: integer overflow in
 radeon_mode_dumb_create()
To: Xiaohui Zhang <xiaohuizhang@ruc.edu.cn>
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
Cc: David Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, Jun 7, 2022 at 12:05 PM Xiaohui Zhang <xiaohuizhang@ruc.edu.cn> wrote:
>
> Similar to the handling of amdgpu_mode_dumb_create in commit 54ef0b5461c0
> ("drm/amdgpu: integer overflow in amdgpu_mode_dumb_create()"),
> we thought a patch might be needed here as well.
>
> args->size is a u64.  arg->pitch and args->height are u32.  The
> multiplication will overflow instead of using the high 32 bits as
> intended.
>
> Signed-off-by: Xiaohui Zhang <xiaohuizhang@ruc.edu.cn>
> ---
>  drivers/gpu/drm/radeon/radeon_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
> index 8c01a7f0e027..84843b3b3aef 100644
> --- a/drivers/gpu/drm/radeon/radeon_gem.c
> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> @@ -833,7 +833,7 @@ int radeon_mode_dumb_create(struct drm_file *file_priv,
>
>         args->pitch = radeon_align_pitch(rdev, args->width,
>                                          DIV_ROUND_UP(args->bpp, 8), 0);
> -       args->size = args->pitch * args->height;
> +       args->size = (u64)args->pitch * args->height;
>         args->size = ALIGN(args->size, PAGE_SIZE);
>
>         r = radeon_gem_object_create(rdev, args->size, 0,
> --
> 2.17.1
>
