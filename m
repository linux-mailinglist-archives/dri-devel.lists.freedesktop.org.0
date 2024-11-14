Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC229C8419
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 08:40:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2852B10E7AC;
	Thu, 14 Nov 2024 07:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="d/nuba/J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2D010E7B3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 07:40:44 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-e33a8c84b9aso346417276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 23:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1731570043; x=1732174843;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YpC7dQHdBRjf1YY0/1FpJk3Da91k9SyijSVmI4hpRQQ=;
 b=d/nuba/Jye3/Jv66lMTeg6WAkhKPt+5Sf5Icq0XSlDMwslzhNGcY0tN3niNiBYnLhy
 H1LJC93vi/iJkBp4JtSxRzkzCZuttqKbltmA2dZxUKHYG5UeNeMuZ6CFAIioxEEx9ABs
 DWxsWYO9J6Yv4DvDNKD00CqMbHTKtVSaiizs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731570043; x=1732174843;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YpC7dQHdBRjf1YY0/1FpJk3Da91k9SyijSVmI4hpRQQ=;
 b=RU1LRkwEMESPvUAB8B1ab5TIevPKUDL3LRCL1FcUZ4pSEAbLxCiu+eSqvlOPuxjtYx
 MEq21gBr4/IY+qtMe9yM2N3zEF7MnliVIR6xJs46Jdvq5USHA7D1X4MAy3Gj4meCwAId
 5+mQIt34sZlztfpDe69jPgZPnFfbTQj9Q2HY2pvurwtS10zY8PxLc9hc+++6+3eoMxvU
 439TYEvgpLUNXtpOS9Vq59oKGU460ppwbQgUkYQxvuJZrVK1YQD3wqJlDE5yevyEfPU/
 kku5YUtEeu9QKwd77oPcB9Of1kDwSufLCZbbX7YS0Fuvw4M36Vang+U7/sh77Ba/7pvb
 VV5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUH81zOkSmsjMLPz9T9Y7Lrt0hn4PN7tNs8Cwnta8hfJcqxj2Tbk/qEmwcjIcOtL9uVV+K73KKnnQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHCMfbjBw8w2yoPWw4WLWWXu9Oy0WYV3Z4c1nHsaDC7fL2hLo0
 T07RhMSiKh9q77anwsV/YEvWylLjie+ioIbvtgP6MIehdmKi98tFyNlaixD4jZhXitDUwsvjl7B
 yKaI5MujQvGpK9o4TyPMflgFwxf97Voi8JXBB
X-Google-Smtp-Source: AGHT+IENgiDPFP0I/9pp3wxIpHtzjT2OXh+RNCVpHFFVo+uAuIkpgnnFChEgBkHMvoJwxr6nt/SMqWXsmcOBVNJqBxI=
X-Received: by 2002:a05:6902:10c2:b0:e26:afc:7af4 with SMTP id
 3f1490d57ef6-e35ecf0b7d7mr5347529276.28.1731570043385; Wed, 13 Nov 2024
 23:40:43 -0800 (PST)
MIME-Version: 1.0
References: <20241029083429.1185479-1-chenridong@huaweicloud.com>
In-Reply-To: <20241029083429.1185479-1-chenridong@huaweicloud.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Thu, 14 Nov 2024 02:40:32 -0500
Message-ID: <CABQX2QO4VtP0Vf7hGyTzi++Ee+WZ-3AQ1o-r=BQhzQ8tsNe7NA@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: avoid null_ptr_deref in
 vmw_framebuffer_surface_create_handle
To: Chen Ridong <chenridong@huaweicloud.com>
Cc: bcm-kernel-feedback-list@broadcom.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 maaz.mombasawala@broadcom.com, martin.krastev@broadcom.com, 
 dri-devel@lists.freedesktop.org, chenridong@huawei.com, 
 wangweiyang2@huawei.com
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

On Tue, Oct 29, 2024 at 4:43=E2=80=AFAM Chen Ridong <chenridong@huaweicloud=
.com> wrote:
>
> From: Chen Ridong <chenridong@huawei.com>
>
> The 'vmw_user_object_buffer' function may return NULL with incorrect
> inputs. To avoid possible null pointer dereference, add a check whether
> the 'bo' is NULL in the vmw_framebuffer_surface_create_handle.
>
> Fixes: d6667f0ddf46 ("drm/vmwgfx: Fix handling of dumb buffers")
> Signed-off-by: Chen Ridong <chenridong@huawei.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_kms.c
> index f39bf992364d..8db38927729b 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -1265,6 +1265,8 @@ static int vmw_framebuffer_surface_create_handle(st=
ruct drm_framebuffer *fb,
>         struct vmw_framebuffer_surface *vfbs =3D vmw_framebuffer_to_vfbs(=
fb);
>         struct vmw_bo *bo =3D vmw_user_object_buffer(&vfbs->uo);
>
> +       if (WARN_ON(!bo))
> +               return -EINVAL;
>         return drm_gem_handle_create(file_priv, &bo->tbo.base, handle);
>  }
>
> --
> 2.34.1
>

Thank you. I pushed it to drm-misc-fixes.

z
