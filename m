Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01ABA27FA5A
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 09:34:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B0E6E85F;
	Thu,  1 Oct 2020 07:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B40126E85F
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 07:34:51 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id a13so1662312otl.13
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Oct 2020 00:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M3t5u/IjN/gL/P8pqhUlq/SfjEUTm2EjDpkRAYR6c4w=;
 b=OgYNuEdlKW5kR4E3Kl27GKjVoAUIqv4sfGNlXKtrnJ10S71KPcWuNCjLQ7Fied+JNf
 cZdZHZdTDQ00beyWvwvbCjpM+sjMVo5quw7mCGqpNrp9rXnYqKX4sUnjILwuqK79R1Ai
 mUSaAkd08MFs5rIuZ+HLZ4PIk1v/qivyRF9HM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M3t5u/IjN/gL/P8pqhUlq/SfjEUTm2EjDpkRAYR6c4w=;
 b=Efca+yGHOvq9uOj2mMlfPPXEKo4Xh6zDDn17IY/aN/thMZ9ZIO4KqkXCS4M1/d0oDx
 isbwJbDNBA52ChsDwHArbPafIousA6xRnrIUJVnIV8TkHqIs1K6WhtQ21oPtwbn7NFsy
 LDywo12/9NepMJcNgR074ARE1NxHdWsEMeKcB/0lkI1dUuNRm+IdmKp+QcI7Widoziq1
 QWMDuyXErX3zoRvIEz8oERV9JsEuJfJ5xsT2JqhFHDhQePAIiVKnp0mjkDPp3SRX0FsB
 eNEflC3stC2KGvoHt3qpjARGGFthjVYevq4fIqI7VVVjhN7wIXWJ4e1rMc2OiAEEFpXW
 g7QQ==
X-Gm-Message-State: AOAM533M1nE7XS87bAPYMJeB9jAglRy/qC+iE/J0nrpbyDFqpgzUouge
 m/YmAmUWRqtOWMuT/aDt5BneDmgN3dm5hc0C97jhsQ==
X-Google-Smtp-Source: ABdhPJzNKn7MWzVeCzvOTyEtg5692fYCLDg8orn/WbAG8JFhrvHF5qSLNs3chJx9zv9MdA1mCI0h5fCjmJtLNwIAVjE=
X-Received: by 2002:a05:6830:1e56:: with SMTP id
 e22mr3855933otj.303.1601537691033; 
 Thu, 01 Oct 2020 00:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <20201001042012.13114-1-airlied@gmail.com>
In-Reply-To: <20201001042012.13114-1-airlied@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 1 Oct 2020 09:34:40 +0200
Message-ID: <CAKMK7uGzb7ovFnMnFy72i_TkehWmccBHtuRk1A5mrhmhT4Q1pg@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: fix regression in thp code due to ttm init
 refactor.
To: Dave Airlie <airlied@gmail.com>
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
Cc: Roland Scheidegger <sroland@vmware.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 1, 2020 at 6:20 AM Dave Airlie <airlied@gmail.com> wrote:
>
> From: Dave Airlie <airlied@redhat.com>
>
> When I refactored this code with the new init paths, I failed to
> set the funcs back up properly, this caused a failure to bringup
> gdm properly.
>
> Fixes: 252f8d7b9174 ("drm/vmwgfx/ttm: convert vram mm init to new code paths")
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Indeed, I missed that that got lost.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_thp.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> index 63fe7da4cbf4..c158e672b762 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> @@ -26,6 +26,8 @@ static struct vmw_thp_manager *to_thp_manager(struct ttm_resource_manager *man)
>         return container_of(man, struct vmw_thp_manager, manager);
>  }
>
> +static const struct ttm_resource_manager_func vmw_thp_func;
> +
>  static int vmw_thp_insert_aligned(struct drm_mm *mm, struct drm_mm_node *node,
>                                   unsigned long align_pages,
>                                   const struct ttm_place *place,
> @@ -132,6 +134,7 @@ int vmw_thp_init(struct vmw_private *dev_priv)
>         ttm_resource_manager_init(&rman->manager,
>                                   dev_priv->vram_size >> PAGE_SHIFT);
>
> +       rman->manager.func = &vmw_thp_func;
>         drm_mm_init(&rman->mm, 0, rman->manager.size);
>         spin_lock_init(&rman->lock);
>
> @@ -171,7 +174,7 @@ static void vmw_thp_debug(struct ttm_resource_manager *man,
>         spin_unlock(&rman->lock);
>  }
>
> -const struct ttm_resource_manager_func vmw_thp_func = {
> +static const struct ttm_resource_manager_func vmw_thp_func = {
>         .alloc = vmw_thp_get_node,
>         .free = vmw_thp_put_node,
>         .debug = vmw_thp_debug
> --
> 2.20.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
