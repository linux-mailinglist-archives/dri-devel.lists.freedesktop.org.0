Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A5D2FC014
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 20:35:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A15746E10E;
	Tue, 19 Jan 2021 19:35:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A345C6E10E
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 19:35:39 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id i30so8034315ota.6
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 11:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rc8y8wPAvXLXWRTJFyYoWjJGf2nfA3+Yhs6HsQyFnc0=;
 b=RGP5cSUjzSf5mikVmpRpHgJjwmFlYWzXvkW8MO77wV2i06jk8Hi1Qy14E3iFSvhjqC
 XMYH68t5kC06wnOODnIN5U2hMgFFG7aMCXvP9MfQoglAGtYSY0R3ptObAKi+JvlOXWO8
 wbPWJ9IOZFjXYcUuCJQsmVoRhJOTYobZZvieU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rc8y8wPAvXLXWRTJFyYoWjJGf2nfA3+Yhs6HsQyFnc0=;
 b=JZsbIJ23EDGmDGli5A1NiiurUI0vH8bCyua5Ltryh7VcHLCnMgDUFqfFI0EYG+QP2R
 p3f1vHuAxkioCv4wLewP4SG2jo5+CI6+5gVeyEmyjeV+RQPJh2OTkKEGS+Mqg+o0OE1k
 SmNT3AAdUMCOorx/SBaocdFaktLOU2UtKf467EmQo+MHwsJocR5C9YR4SpBX9p7UjQ8p
 F0Hfx3orErDkahk3/Am8YNJGiwLXXkPpRxsjK+lZ7kdY4tplnWGTLrFp1KvS2lIXACMk
 hTbX6iux57o3eKtdcj2SAKqz7W/zeV8cKeGkqcWYMA9F8WhJVg3eaOmPnLcOUwmmb+3e
 sr0Q==
X-Gm-Message-State: AOAM530lNFUT+q5blzin/J4DJAiriKOQlsnGV5uQZtTdlJFHh6vCfIQu
 Io0upSS1gOkwBdseFDUmiaAYJOiUM9b4/thsZliWvGY2K1w=
X-Google-Smtp-Source: ABdhPJw69nYjpjplRnleedvq9p/wc+ohuhW4MKyxdUV4eqVEr8bNnXBj8ljU4ZkxDXGdgxMqbFeiNJFyhMjjuUaAtFA=
X-Received: by 2002:a9d:ea6:: with SMTP id 35mr4538746otj.188.1611084939021;
 Tue, 19 Jan 2021 11:35:39 -0800 (PST)
MIME-Version: 1.0
References: <20210119193102.505691-1-zackr@vmware.com>
In-Reply-To: <20210119193102.505691-1-zackr@vmware.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 19 Jan 2021 20:35:28 +0100
Message-ID: <CAKMK7uG7g3zPpgyxN5oR1dXqw8ExjsrQvwMLa4R9wnoJwwrAzQ@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Make sure we unpin no longer needed buffers
To: Zack Rusin <zackr@vmware.com>
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
Cc: Martin Krastev <krastevm@vmware.com>,
 Roland Scheidegger <sroland@vmware.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 19, 2021 at 8:31 PM Zack Rusin <zackr@vmware.com> wrote:
>
> We were not correctly unpinning no longer needed buffers. In particular
> vmw_buffer_object, which is internally often pinned on creation wasn't
> unpinned on destruction and none of the internal MOB buffers were
> unpinned before being put back. Technically this existed for a
> long time but 57fcd550eb15bce14a7154736379dfd4ed60ae81 introduced
> a WARN_ON which was filling up the kernel logs rather quickly.
>
> Quite frankly internal usage of vmw_buffer_object and in general
> pinning needs to be refactored in vmwgfx but for now this makes
> it work.
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Reviewed-by: Martin Krastev <krastevm@vmware.com>
> Reviewed-by: Roland Scheidegger <sroland@vmware.com>
> Fixes: 57fcd550eb15bce14a7154736379dfd4ed60ae81

dim will balk on this (or should at least)

$ dim fixes <sha1>

should give you the recommend thing.
-Daniel

> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h | 2 ++
>  drivers/gpu/drm/vmwgfx/vmwgfx_mob.c | 4 ++++
>  2 files changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> index b45becbb00f8..73225ab691e6 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -1554,6 +1554,8 @@ static inline void vmw_bo_unreference(struct vmw_buffer_object **buf)
>
>         *buf = NULL;
>         if (tmp_buf != NULL) {
> +               if (tmp_buf->base.pin_count > 0)
> +                       ttm_bo_unpin(&tmp_buf->base);
>                 ttm_bo_put(&tmp_buf->base);
>         }
>  }
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c b/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
> index 7f95ed6aa224..3c6e69f36767 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
> @@ -277,6 +277,7 @@ static int vmw_otable_batch_setup(struct vmw_private *dev_priv,
>                                                  &batch->otables[i]);
>         }
>
> +       ttm_bo_unpin(batch->otable_bo);
>         ttm_bo_put(batch->otable_bo);
>         batch->otable_bo = NULL;
>         return ret;
> @@ -342,6 +343,7 @@ static void vmw_otable_batch_takedown(struct vmw_private *dev_priv,
>         vmw_bo_fence_single(bo, NULL);
>         ttm_bo_unreserve(bo);
>
> +       ttm_bo_unpin(batch->otable_bo);
>         ttm_bo_put(batch->otable_bo);
>         batch->otable_bo = NULL;
>  }
> @@ -528,6 +530,7 @@ static void vmw_mob_pt_setup(struct vmw_mob *mob,
>  void vmw_mob_destroy(struct vmw_mob *mob)
>  {
>         if (mob->pt_bo) {
> +               ttm_bo_unpin(mob->pt_bo);
>                 ttm_bo_put(mob->pt_bo);
>                 mob->pt_bo = NULL;
>         }
> @@ -643,6 +646,7 @@ int vmw_mob_bind(struct vmw_private *dev_priv,
>  out_no_cmd_space:
>         vmw_fifo_resource_dec(dev_priv);
>         if (pt_set_up) {
> +               ttm_bo_unpin(mob->pt_bo);
>                 ttm_bo_put(mob->pt_bo);
>                 mob->pt_bo = NULL;
>         }
> --
> 2.27.0
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
