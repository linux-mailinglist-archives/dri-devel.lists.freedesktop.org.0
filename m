Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D628B2DFC
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 02:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2789811A8F7;
	Fri, 26 Apr 2024 00:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="GPla/KCn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B89911A8F7
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 00:26:19 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-617e42a3f94so17860197b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 17:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1714091178; x=1714695978;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+gLDDz9kHojOBTxe6bjGKOCEMWiVncximTkDuPbQk1s=;
 b=GPla/KCnvCTK0yV4YO3Hx3zJxFXkxQmDF16pbjY3pLDx7K6xa1rIyYHyzQIN8PT4I8
 Da1SVZ6bSfyG2jy3IsEOuSju2uz2W40WeiJWP+ZXxNxLyWTOfPeH45zh+8NumnnehUTz
 YDM1rDS+XfL9A3Mj3QPRL8HYLOuT0+kNC2Iyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714091178; x=1714695978;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+gLDDz9kHojOBTxe6bjGKOCEMWiVncximTkDuPbQk1s=;
 b=ulmJXrQmvWUEuEwYPagvEQKZ2mCkEzL92G8J09IeIo+srz1sx/WZDZ2Y+sHZMFYSdn
 vMzqj7mEA+sIYzgHuN+aYjJraoZMD/TDQ7tPa1nNP3SQM46Olm2GofALH0DihtGb0QzY
 BFlS1NzKIRdU6f7WP6fsbz4qL9WRBYWBWo8TbtjMsRLhbJRDoaPkbV6evy+qYAt7P4IT
 H7xAr+vIO5eEvgW0U34hl+zoPNi2BQaD5Xj9GDkLULLV9Fs0RpI5YqGyvC2NUZX0uA+2
 9sMsHqODne644oX3LWEFjB8WovqUojK/71nzum1kTRGexKuo48d+iLxmmCpwozWq0QwM
 LZ1Q==
X-Gm-Message-State: AOJu0Ywn1DSeIrUwEzpUnncGYPWZwYrLvwyEwoEZbAQMlvix2c4tpz2H
 SeFZq/rkoEd2wmPjdO5dQXk+Jt6bUHf6fWl55kMdmShU6yKtdbN10vo+l6c+kL+insRJenv4pay
 u9nDw43y4ROtiPQNncLJr999oGMuiUP4oKT3B
X-Google-Smtp-Source: AGHT+IGwMaQUYW9Qv1c3OVtpCl65/4lstbZl43wEeWu3OnGJg5CBIEd0KD/um1P+8JdzIj9pkBSJrwvVKQJyNOOpOFI=
X-Received: by 2002:a05:690c:6184:b0:61b:12:a587 with SMTP id
 hj4-20020a05690c618400b0061b0012a587mr1446577ywb.3.1714091178137; Thu, 25 Apr
 2024 17:26:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240425200700.24403-1-ian.forbes@broadcom.com>
In-Reply-To: <20240425200700.24403-1-ian.forbes@broadcom.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Thu, 25 Apr 2024 20:26:07 -0400
Message-ID: <CABQX2QOeMqWWYarm=SPmudSDpiCQn97nO6GnS6-Fs8gPRNwm3Q@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Fix Legacy Display Unit
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com, 
 stable@vger.kernel.org
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

On Thu, Apr 25, 2024 at 4:07=E2=80=AFPM Ian Forbes <ian.forbes@broadcom.com=
> wrote:
>
> Legacy DU was broken by the referenced fixes commit because the placement
> and the busy_placement no longer pointed to the same object. This was lat=
er
> fixed indirectly by commit a78a8da51b36c7a0c0c16233f91d60aac03a5a49
> ("drm/ttm: replace busy placement with flags v6") in v6.9.
>
> Fixes: 39985eea5a6d ("drm/vmwgfx: Abstract placement selection")
> Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
> Cc: <stable@vger.kernel.org> # v6.4+
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/=
vmwgfx_bo.c
> index 2bfac3aad7b7..98e73eb0ccf1 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> @@ -204,6 +204,7 @@ int vmw_bo_pin_in_start_of_vram(struct vmw_private *d=
ev_priv,
>                              VMW_BO_DOMAIN_VRAM,
>                              VMW_BO_DOMAIN_VRAM);
>         buf->places[0].lpfn =3D PFN_UP(bo->resource->size);
> +       buf->busy_places[0].lpfn =3D PFN_UP(bo->resource->size);
>         ret =3D ttm_bo_validate(bo, &buf->placement, &ctx);
>
>         /* For some reason we didn't end up at the start of vram */

Looks great. I'll push it through drm-misc-fixes.
Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>

z
