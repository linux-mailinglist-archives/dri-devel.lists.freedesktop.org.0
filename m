Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F4688B5DA
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 01:13:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD2610EBAE;
	Tue, 26 Mar 2024 00:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="AGVu1HxR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DBF910E00F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 22:38:18 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-431347c6c99so48741cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 15:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1711406297; x=1712011097;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VGxpwjKqErz/WL1ZU+CEUoKvbb2jqoUW3asVbdp7yTQ=;
 b=AGVu1HxRcP0tE+93kfWeY0fENx9atVcCrex2w3dDBSKTGYeJe+G9hsD4xBtQNPKK/6
 bPJJ5OO5XxN+HE+sUMuNZKn+ce5AEgXcNhOqV0PbZcreCLuZdaSdcx4u1MD8sYn8zCqC
 f1W9J0o74nxd3ju6x56mhTVvhoI3L7jnfDe/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711406297; x=1712011097;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VGxpwjKqErz/WL1ZU+CEUoKvbb2jqoUW3asVbdp7yTQ=;
 b=QOEGRiuBId+oteqOPQX/iisCLE2+SGS/dHZxDpnoZQjjpfuxmtSwRxOCZt+UcUzFIe
 nzBthU/nre1S0cj+M80kiB3rZX7//+SfIc16bO47HMGrYvUuBAUKrIB8+ZnZcwkwOqnm
 ch5HL2IMJdL722B0+vyFRNcL/revspk7/Se9oSyuEWuhCUEdfnigozMspGYB+ILPbKin
 7W4KApGEWqFSfxAOtVuZa21+VE7UTkaAiOingxA6wBNIK6j1lYGHjpKCZVexRBR0bJex
 dsX9KNUtOD637ZfJFhhLRL9jd3HJcPuG9ActJImXMe8Z/tGfOJsU1nPZXb7dFQo8u2pS
 ZIlg==
X-Gm-Message-State: AOJu0YyqXMYwS0zrtrxRwmhnfyavYH4ix+5SXmHy7zUlzpYtuW8OXxo9
 vCRoMByNohT9aCwpwnPJ1cXIgAdT9uuf38GJU+6Dj4OPB+7FwcaU9vI+oGO79RLh+8oVDrVOgNG
 U6ygKo8CkG8vXJ6a1lalCe8b5xhufe87feCmK
X-Google-Smtp-Source: AGHT+IG52mKa+pnbbYX3Ox0jW5wzGRU3wSOiDtmpILVDdI7DL6SUQE9Rf8+tGIrIV07xI4B507o9Zmf6GRIhYZTuXXw=
X-Received: by 2002:a05:622a:1b0f:b0:430:a5df:a3af with SMTP id
 bb15-20020a05622a1b0f00b00430a5dfa3afmr575qtb.5.1711406297215; Mon, 25 Mar
 2024 15:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240322214801.319975-1-robdclark@gmail.com>
In-Reply-To: <20240322214801.319975-1-robdclark@gmail.com>
From: Dominik Behr <dbehr@chromium.org>
Date: Mon, 25 Mar 2024 15:38:06 -0700
Message-ID: <CABUrSUBTz7n6Yg_4wvGR+W__AKn5Vj4aWuLg5p3bDWye-PwExg@mail.gmail.com>
Subject: Re: [PATCH] drm/prime: Unbreak virtgpu dma-buf export
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
 Dominik Behr <dbehr@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simon Ser <contact@emersion.fr>, open list <linux-kernel@vger.kernel.org>, 
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linux-media@vger.kernel.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 26 Mar 2024 00:13:32 +0000
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

It also fixes importing virtgpu blobs into real hardware, for instance
amdgpu for DRI_PRIME rendering.


On Fri, Mar 22, 2024 at 2:48=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> From: Rob Clark <robdclark@chromium.org>
>
> virtgpu "vram" GEM objects do not implement obj->get_sg_table().  But
> they also don't use drm_gem_map_dma_buf().  In fact they may not even
> have guest visible pages.  But it is perfectly fine to export and share
> with other virtual devices.
>
> Reported-by: Dominik Behr <dbehr@chromium.org>
> Fixes: 207395da5a97 ("drm/prime: reject DMA-BUF attach when get_sg_table =
is missing")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/drm_prime.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 7352bde299d5..64dd6276e828 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -582,7 +582,12 @@ int drm_gem_map_attach(struct dma_buf *dma_buf,
>  {
>         struct drm_gem_object *obj =3D dma_buf->priv;
>
> -       if (!obj->funcs->get_sg_table)
> +       /*
> +        * drm_gem_map_dma_buf() requires obj->get_sg_table(), but driver=
s
> +        * that implement their own ->map_dma_buf() do not.
> +        */
> +       if ((dma_buf->ops->map_dma_buf =3D=3D drm_gem_map_dma_buf) &&
> +           !obj->funcs->get_sg_table)
>                 return -ENOSYS;
>
>         return drm_gem_pin(obj);
> --
> 2.44.0
>
