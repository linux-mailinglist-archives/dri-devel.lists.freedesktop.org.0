Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 423A48B3228
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 10:19:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623A310E9EA;
	Fri, 26 Apr 2024 08:19:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="BSoE0xrI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5CD10E9EA
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 08:19:29 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id
 e9e14a558f8ab-36b375ceb9bso8254075ab.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 01:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1714119568; x=1714724368;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zVTNWL0BuMu8uA8a1pgzyKd4N6HpuLQOL7QqW6GZ6D0=;
 b=BSoE0xrI5CuflLJwO0eK1khgg+hdGxiESOt3J8Iu6LU1c3znxUz9aBgxUbAlNYs2lQ
 TzoW6jm6ZMXQOUaiLVwoLcQtzV8Ieu5ylauyft2JeSfuN3xIvmgTJKU6kzmgChxC4pxe
 1hjjQZyXOQZC/kax7vDB/2teml+Kg7yJY4ido=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714119568; x=1714724368;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zVTNWL0BuMu8uA8a1pgzyKd4N6HpuLQOL7QqW6GZ6D0=;
 b=HFsSdOdEiAIGyNZa67vIS287s9k5jqwhsP3o/lwjT1wtXezsgDiqLwPi8VHoKvldpc
 bh8ud/8w8Q3Xi+h5qAXtQ5jKGQnRUDed6KVtoL9R3lJ0XRz1sFv4FeJsBXKQHpRqiCaL
 qZaGrbZa7QmOGe4C4Kt/YvqoOog6Sx56qdwqcKt4u6n55l9CD6friUNUsYP5JB9Ce17V
 USGyPapYDlT7bKEZ0YwMFz2gWnxeIk45/xo/IpBSVyBhnvBN7smgQz+SKkqGT5Rv7Cx5
 kLf5xd5sQElvoRzzZFHNErQjXgDlbOaULevDofvgy1RwamEtv8ZbVzVlqmZB+qZbPS3J
 cXSg==
X-Gm-Message-State: AOJu0Yx4zyGvCtwv22UHdsGFYtbyQsV85wNSDJcfCVZrEIHF5NfuTFRo
 ZWD8H8MdWOWcV29ymcWEi4myW3Aiu7sCxVqeKVBuk2dI2lHa0MDBjlWyAQucEr46XH9PuqiZNTD
 fM2sl9i0vwFqKFcVuAWkt4fo+oLBu4ORQosQm
X-Google-Smtp-Source: AGHT+IH66STbBXSU8C3ldVui5J0UyWaCbJ6riDX7win3IEC0TBhjCR4f79MirfLPReAHHSS0djaP5B3ccQpC2bLbfX4=
X-Received: by 2002:a92:cda6:0:b0:36b:85e:7cdb with SMTP id
 g6-20020a92cda6000000b0036b085e7cdbmr2283627ild.28.1714119568457; Fri, 26 Apr
 2024 01:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240425200700.24403-1-ian.forbes@broadcom.com>
In-Reply-To: <20240425200700.24403-1-ian.forbes@broadcom.com>
From: Martin Krastev <martin.krastev@broadcom.com>
Date: Fri, 26 Apr 2024 11:19:17 +0300
Message-ID: <CAKLwHdXmzEcHUDqCoK_6eMP8WFJm4ZQA8k3F4EW-_Ci11gfeuQ@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Fix Legacy Display Unit
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 zack.rusin@broadcom.com, maaz.mombasawala@broadcom.com, 
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

Good catch!

Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>

Regards,
Martin

On Thu, Apr 25, 2024 at 11:07=E2=80=AFPM Ian Forbes <ian.forbes@broadcom.co=
m> wrote:
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
> --
> 2.34.1
>
