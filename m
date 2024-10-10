Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1CE99932C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 21:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A69310E9BF;
	Thu, 10 Oct 2024 19:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="AGBl/TLy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113EB10E9BF
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 19:52:21 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-e02c4983bfaso1418266276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 12:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1728589941; x=1729194741;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H0yQGGhTqw9cUKWuDIB0GQqeru7Zb3BCIasRnoNpl7I=;
 b=AGBl/TLyT6vtso9R2FF0KjnM/eJ3MQ9B6YA9uIygh2/uR/PBNCbfLxYePy3az6+7wA
 UMWDi8ASVQmtgN9IyNRx377wj/3+WBrtFj3nIRtbEDnGQNYxPFRs6L+cTVl5MmhntTdz
 3+W6CGhqbtvewQ0g9fkdIrwDEVlWGsZDInr/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728589941; x=1729194741;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H0yQGGhTqw9cUKWuDIB0GQqeru7Zb3BCIasRnoNpl7I=;
 b=f9BZWbvs+ohx5KbQAL3z3bV1K05k1AvatTBnYe9mQ2DfrrIoG0e07ExI8+4eTStgC7
 vJGUjkryTZLOBuGhIC37MM+cyDQtxdinZiEzFEE3gQDAa4Ew3bz/7A7x9F+eUpp95o8A
 z6qI8hVQ0ySJu8GrLgK27INRVraI88XZX8b80gUToXDJm4YqQYX9dgxUdjKnCiF90mI3
 BaZsDtTbYYI3Z2nBSBEBxeq9I/dG61+GGTxJYQcomE5g+sUKcToIZigzDLfMVF5LzAto
 UBLBnPP+4uldFXlXkhFPb0I6EQvcW6xo4xjGxDIZH8Ad7C6z738TYN3Uv6AQaXmPS1yP
 Xwsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDpVVveqO68eQcbcVN4ltZFKaU5NQEgAsw+k720xWP9dMEq5uXtZhRGJeEXGCykAIZlQ+oSGeES1w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuaOiTr5+mG/P2UqQFdpKJLwt8pU3CJJTuGobeWnGdflQa9eor
 1FeYZTjuYvYxncGDUk7FtynzDenrUt6EDpXkhXJ5doRCcmTNBX9RxnfdLgzLNQuIal6sF/HRw5p
 9557taYefixcy25j9TrgaEDEUNm19FW4nDGQORiEGD3JgZqU=
X-Google-Smtp-Source: AGHT+IFWC5y7eMICyQT90+3RF+9SJuIQFBfyId6svCfqtZ8VV8P2OhLGTFKN0YGn+Iylgx5+atjoJZzkAL3VP4f/CE0=
X-Received: by 2002:a05:6902:1589:b0:e28:30f5:f33 with SMTP id
 3f1490d57ef6-e2919dadd2amr106480276.28.1728589940760; Thu, 10 Oct 2024
 12:52:20 -0700 (PDT)
MIME-Version: 1.0
References: <20241002122429.1981822-1-kniv@yandex-team.ru>
In-Reply-To: <20241002122429.1981822-1-kniv@yandex-team.ru>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Thu, 10 Oct 2024 15:52:10 -0400
Message-ID: <CABQX2QNVpaTqBDzBnwDgW=2fi4QxeywXZRsbhywLkph3JgAmjQ@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Handle surface check failure correctly
To: Nikolay Kuratov <kniv@yandex-team.ru>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 stable@vger.kernel.org, lvc-project@linuxtesting.org, 
 bcm-kernel-feedback-list@broadcom.com, Sinclair Yeh <syeh@vmware.com>, 
 Thomas Hellstrom <thellstrom@vmware.com>, Simona Vetter <simona@ffwll.ch>
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

On Wed, Oct 2, 2024 at 8:26=E2=80=AFAM Nikolay Kuratov <kniv@yandex-team.ru=
> wrote:
>
> Currently if condition (!bo and !vmw_kms_srf_ok()) was met
> we go to err_out with ret =3D=3D 0.
> err_out dereferences vfb if ret =3D=3D 0, but in our case vfb is still NU=
LL.
>
> Fix this by assigning sensible error to ret.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE
>
> Signed-off-by: Nikolay Kuratov <kniv@yandex-team.ru>
> Cc: stable@vger.kernel.org
> Fixes: 810b3e1683d0 ("drm/vmwgfx: Support topology greater than texture s=
ize")
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_kms.c
> index 288ed0bb75cb..752510a11e1b 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -1539,6 +1539,7 @@ static struct drm_framebuffer *vmw_kms_fb_create(st=
ruct drm_device *dev,
>                 DRM_ERROR("Surface size cannot exceed %dx%d\n",
>                         dev_priv->texture_max_width,
>                         dev_priv->texture_max_height);
> +               ret =3D -EINVAL;
>                 goto err_out;
>         }
>
> --
> 2.34.1
>

Thank you. I pushed it to drm-misc-fixes.

z
