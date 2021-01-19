Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 637A22FC017
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 20:36:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F060899A3;
	Tue, 19 Jan 2021 19:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 220CC6E0CE
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 19:36:16 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id v1so2891549ott.10
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 11:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sgs09Sw/1sCsQxCz/h8O5GpoQOeuMF8vjb508+o0XdE=;
 b=Jc1vHoNVYzdRdMU8IiGecmossdDmDwr8Xca9hPcXR1rn48MAt+rXXh9OnY1sm/e3zw
 kFE42QZmmAlb7DxYxhofQnXpF8l99WIyKvrAtBUj3qsbhpqz3tMGHFsq5zZYZkXyYvZV
 rTNtd1g0QO0mdtXt1p5E9z5hK9rYC1NVYKFR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sgs09Sw/1sCsQxCz/h8O5GpoQOeuMF8vjb508+o0XdE=;
 b=VmrcKO/IlNxmNlHXUEYNXCZFO691bPc/PXAZ6UIFsImduZc3b1Bna0YBVLeB511t38
 eSY4k7HIxw56oOdYMN4yeBkAX/HrgvUoTudB4kB4SwcAKJZFhYkVARSvvZc0heEm5BYM
 OBGC7hidi63SpdC5UESa70jbli7HkekmQJyW9DJ8xGm7DQz+OH0+K0fCqjAC5OU48565
 PAhu07/hsewDFmjqhxnTo8F6CMvoekpVJZxrgz+KYPZUeuFbTANG3ZlzFDMMpd5Y1iEp
 Y6tnn/4p17LLgISfkxYhPD8xjrhxEc5m6PzQzVXd0AGtNd8c7FWNWA5Cp/OAMKw5rEBL
 POEQ==
X-Gm-Message-State: AOAM530b1Pq0tGa436Xnjn8FaXZrwjD72uiIGJOaeeIRenbz9b7wOC5e
 lJxQ1gEPnpj52/oQEDiK8+TU/1VsgW2cp0feC64HFw==
X-Google-Smtp-Source: ABdhPJzuMMWYWpxIYU/BysQ04vtDc+mfOlwjDqbycXYspLxA7s50NtgXqzzs9pak/kvUjQdyIX5m9Owt0+V5IkokEgQ=
X-Received: by 2002:a9d:ea6:: with SMTP id 35mr4540205otj.188.1611084975475;
 Tue, 19 Jan 2021 11:36:15 -0800 (PST)
MIME-Version: 1.0
References: <20210119193102.505691-1-zackr@vmware.com>
 <CAKMK7uG7g3zPpgyxN5oR1dXqw8ExjsrQvwMLa4R9wnoJwwrAzQ@mail.gmail.com>
In-Reply-To: <CAKMK7uG7g3zPpgyxN5oR1dXqw8ExjsrQvwMLa4R9wnoJwwrAzQ@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 19 Jan 2021 20:36:04 +0100
Message-ID: <CAKMK7uHwJ_JV26_FNsGNbe7Eik2R=_v0X=5gqcqeimUGh10HRA@mail.gmail.com>
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

On Tue, Jan 19, 2021 at 8:35 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Jan 19, 2021 at 8:31 PM Zack Rusin <zackr@vmware.com> wrote:
> >
> > We were not correctly unpinning no longer needed buffers. In particular
> > vmw_buffer_object, which is internally often pinned on creation wasn't
> > unpinned on destruction and none of the internal MOB buffers were
> > unpinned before being put back. Technically this existed for a
> > long time but 57fcd550eb15bce14a7154736379dfd4ed60ae81 introduced

Also this one should be replaced by the output of dim cite <sha1>, but
I think dim doesn't check for these.
-Daniel

> > a WARN_ON which was filling up the kernel logs rather quickly.
> >
> > Quite frankly internal usage of vmw_buffer_object and in general
> > pinning needs to be refactored in vmwgfx but for now this makes
> > it work.
> >
> > Signed-off-by: Zack Rusin <zackr@vmware.com>
> > Reviewed-by: Martin Krastev <krastevm@vmware.com>
> > Reviewed-by: Roland Scheidegger <sroland@vmware.com>
> > Fixes: 57fcd550eb15bce14a7154736379dfd4ed60ae81
>
> dim will balk on this (or should at least)
>
> $ dim fixes <sha1>
>
> should give you the recommend thing.
> -Daniel
>
> > ---
> >  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h | 2 ++
> >  drivers/gpu/drm/vmwgfx/vmwgfx_mob.c | 4 ++++
> >  2 files changed, 6 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> > index b45becbb00f8..73225ab691e6 100644
> > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> > @@ -1554,6 +1554,8 @@ static inline void vmw_bo_unreference(struct vmw_buffer_object **buf)
> >
> >         *buf = NULL;
> >         if (tmp_buf != NULL) {
> > +               if (tmp_buf->base.pin_count > 0)
> > +                       ttm_bo_unpin(&tmp_buf->base);
> >                 ttm_bo_put(&tmp_buf->base);
> >         }
> >  }
> > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c b/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
> > index 7f95ed6aa224..3c6e69f36767 100644
> > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
> > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
> > @@ -277,6 +277,7 @@ static int vmw_otable_batch_setup(struct vmw_private *dev_priv,
> >                                                  &batch->otables[i]);
> >         }
> >
> > +       ttm_bo_unpin(batch->otable_bo);
> >         ttm_bo_put(batch->otable_bo);
> >         batch->otable_bo = NULL;
> >         return ret;
> > @@ -342,6 +343,7 @@ static void vmw_otable_batch_takedown(struct vmw_private *dev_priv,
> >         vmw_bo_fence_single(bo, NULL);
> >         ttm_bo_unreserve(bo);
> >
> > +       ttm_bo_unpin(batch->otable_bo);
> >         ttm_bo_put(batch->otable_bo);
> >         batch->otable_bo = NULL;
> >  }
> > @@ -528,6 +530,7 @@ static void vmw_mob_pt_setup(struct vmw_mob *mob,
> >  void vmw_mob_destroy(struct vmw_mob *mob)
> >  {
> >         if (mob->pt_bo) {
> > +               ttm_bo_unpin(mob->pt_bo);
> >                 ttm_bo_put(mob->pt_bo);
> >                 mob->pt_bo = NULL;
> >         }
> > @@ -643,6 +646,7 @@ int vmw_mob_bind(struct vmw_private *dev_priv,
> >  out_no_cmd_space:
> >         vmw_fifo_resource_dec(dev_priv);
> >         if (pt_set_up) {
> > +               ttm_bo_unpin(mob->pt_bo);
> >                 ttm_bo_put(mob->pt_bo);
> >                 mob->pt_bo = NULL;
> >         }
> > --
> > 2.27.0
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
