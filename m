Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2825F999B00
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 05:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A043810EA1F;
	Fri, 11 Oct 2024 03:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="T0bFkIzo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D4A10EA1F
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 03:11:31 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-e29218d34f8so98366276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 20:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1728616290; x=1729221090;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yfg3IT3RP0Jj2YAEw7pMI16TcSZXqOO49FYHCoqTWD0=;
 b=T0bFkIzoDXOLT69a1T9MZUqwuiEY4hTDl7pGDERCrQstQw8ys4h4OyHaa0GY2Y9sXX
 i0QteqwHf+j46+e+wSiw4EcsbHQJLmRSuRP7sYCOM08ATkOUxjxxNgLOfOt5WWlTNX3j
 Ds/8L+bu+aE6HWo+PS3JOv28CldHgLrNcofDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728616290; x=1729221090;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yfg3IT3RP0Jj2YAEw7pMI16TcSZXqOO49FYHCoqTWD0=;
 b=AXmSq7lAWHEG73Al2ey8QOPcpjuyvUi+iAW+KkKCGewx3G1KtybeQeLq55qOAyCZSV
 BFto4E+NIQ4yqhMmfLgU6+4BxgYffsVuHtp0FkhxxU1wjieMPXinp9/OEUHPelpMZKBj
 kQNmiH9R1uQRyOgCKstH7nDEZ81XiWviSz6IQ3eq3qup9D6yhBNBgcksayfteyRhdOG7
 dtTl5/yVxxBaVfPrvqLRaA2oSH+iC/P1amX08UzoEHercuI6glgTOu65ucUi3MgTxu3S
 0CwHHnQO/l4XEZLuQHqAvTe7VvzHNoTOwS8FnqNpO5gxybUVff5q8hIywpIWNmnHqEOv
 RjOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfFHTv2iZNhdv08U37dasAvFqa1/3TiXQd4DBVw3BXrvROdkE34+akovOrYtjxlRnp9Imy0qSipyA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziyCL6WJu9wwIfgt9pLwIi3xsOrsr9wP6Ge6yIM114AMyn0VH0
 1AYKtCf6wg9qBbPyo1/G3y4ulnzRLIeixsnbztJvTVrDmXaIwNEqYnSDoqXQj8Y7OEOtTkcKp+0
 U2v8u5UnXulzDFCts8KcMD1hvc/AUOeQmbiEC
X-Google-Smtp-Source: AGHT+IGKQvRqFgFQgz5sVkkkF+gNST5d53tOFeDyfCOSYPBwKNzEG6F1tBZI5gfWRc+y9JbypuiGU/gb8sDi758pHPw=
X-Received: by 2002:a05:6902:2742:b0:e29:e15:25da with SMTP id
 3f1490d57ef6-e2918412aa8mr1131559276.23.1728616290371; Thu, 10 Oct 2024
 20:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <20241007115131.1811-3-thorsten.blum@linux.dev>
In-Reply-To: <20241007115131.1811-3-thorsten.blum@linux.dev>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Thu, 10 Oct 2024 23:11:19 -0400
Message-ID: <CABQX2QP5HdCkfffiLGHUm16OT3_c_5LOzwfNv-gxs0ZxZVyGmQ@mail.gmail.com>
Subject: Re: [RESEND PATCH] drm/vmwgfx: Remove unnecessary NULL checks before
 kvfree()
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Mon, Oct 7, 2024 at 7:52=E2=80=AFAM Thorsten Blum <thorsten.blum@linux.d=
ev> wrote:
>
> Since kvfree() already checks if its argument is NULL, an additional
> check before calling kvfree() is unnecessary and can be removed.
>
> Remove both and the following Coccinelle/coccicheck warnings reported by
> ifnullfree.cocci:
>
>   WARNING: NULL check before some freeing functions is not needed
>   WARNING: NULL check before some freeing functions is not needed
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_blit.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c b/drivers/gpu/drm/vmwgf=
x/vmwgfx_blit.c
> index 890a66a2361f..64bd7d74854e 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> @@ -635,10 +635,8 @@ int vmw_bo_cpu_blit(struct vmw_bo *vmw_dst,
>                 kunmap_atomic(d.src_addr);
>         if (d.dst_addr)
>                 kunmap_atomic(d.dst_addr);
> -       if (src_pages)
> -               kvfree(src_pages);
> -       if (dst_pages)
> -               kvfree(dst_pages);
> +       kvfree(src_pages);
> +       kvfree(dst_pages);
>
>         return ret;
>  }
> --
> 2.46.2
>

Thank you. Looks good. I went ahead and pushed it to drm-misc-fixes.

z
