Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A5C436934
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 19:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361CC6E48C;
	Thu, 21 Oct 2021 17:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4BA6E48C;
 Thu, 21 Oct 2021 17:40:27 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id b12so1216645qtq.3;
 Thu, 21 Oct 2021 10:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I45tHvRhBR1Xd2DWp8DNP1Tfl+2o48Hp46kS93VgYVs=;
 b=H7t0Oi9h2XXWVJvYEW9zxwB0XXf0eRqpKW+c0jXfpa/dftpQCCnaO9jUJOacdIkIaA
 sT/+TiPI5QHvXdE8QfsqLjBgSYG7QeIjoSw+1eL67C+FMmLdBwGdUAYVf0JECxit1par
 yO43EpnjHQz4rPEKeoAX/LmfqawLPXxntavZfc9bjygFOwsr0OVKEg19moiV19O4PMnm
 T4VlSjvS2XRYtIs5ILPMgI3ubtPbWIZIsa8Et+9VOh3vi8YWaW0sDx4BAlBxbLVRIZ43
 BPl9KIG9e8G6zVf2Ze9nNGp6VwKf66NVokx/YyyiV9LTbEXWg2fKhVmW3ZzzFPCbmG7Q
 gT/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I45tHvRhBR1Xd2DWp8DNP1Tfl+2o48Hp46kS93VgYVs=;
 b=HgphCvFKODwS2Gj/sw4Lihd+uqHEmLPVqKaRJGz1IPkZpNQFcmxFCvSeY6ock6y0BY
 PPpjBWyfErQr1OW3TmQAavR8FIp1JI7Z79RlYJ2GkFbfwC3mNth+zeuEZU7LfTF3XnGt
 G8eaVTGaE8OLawhMa6lWYe4E+Hnbei+3Jr5xXCHJJt6zpay9NzajhdTDBHWRGaJscQLi
 LgTyaNO8pqVOorcn5DFv1+cNmFzyvbYF0k6mJxRqX9s+SqkjiVyOaz5LQteEBoUR1dCn
 epKzys57aTR2bF/5Y0sOYH5iDnpRk3mFdxUqC/6XngJY6JsRDgQnZWBlSQHNuEFtfUpV
 Hr6A==
X-Gm-Message-State: AOAM5329Dq2ZMr2hV923Ks7tgkugzdwITKWeTtKbWa2Ru0fT37bnFeXJ
 u012Snh64JCwahioJvWsZkjBwul/5N1Y9JQP1X0=
X-Google-Smtp-Source: ABdhPJzAdKeOHexgFqC9KSth+ez/CVJ67Zxj4cqb20u5KsZCkUyFIpbdTu5W2fTslC4oAv0+tkMAURfcy4mHBdI7g3Y=
X-Received: by 2002:a05:622a:1209:: with SMTP id
 y9mr7870919qtx.13.1634838026422; 
 Thu, 21 Oct 2021 10:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
 <20211021103605.735002-14-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211021103605.735002-14-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 21 Oct 2021 18:39:58 +0100
Message-ID: <CAM0jSHMUZwzWQxyECrO7Ak9O3P_UmCFjUqQHMHOezKrY4ZzuYQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 14/28] drm/i915: Take object lock in
 i915_ggtt_pin if ww is not set
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 21 Oct 2021 at 11:37, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> i915_vma_wait_for_bind needs the vma lock held, fix the caller.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/i915_vma.c | 40 +++++++++++++++++++++++----------
>  1 file changed, 28 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index bacc8d68e495..2877dcd62acb 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -1348,23 +1348,15 @@ static void flush_idle_contexts(struct intel_gt *gt)
>         intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
>  }
>
> -int i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
> -                 u32 align, unsigned int flags)
> +static int __i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
> +                          u32 align, unsigned int flags)
>  {
>         struct i915_address_space *vm = vma->vm;
>         int err;
>
> -       GEM_BUG_ON(!i915_vma_is_ggtt(vma));
> -
> -#ifdef CONFIG_LOCKDEP
> -       WARN_ON(!ww && dma_resv_held(vma->obj->base.resv));
> -#endif
> -
>         do {
> -               if (ww)
> -                       err = i915_vma_pin_ww(vma, ww, 0, align, flags | PIN_GLOBAL);
> -               else
> -                       err = i915_vma_pin(vma, 0, align, flags | PIN_GLOBAL);
> +               err = i915_vma_pin_ww(vma, ww, 0, align, flags | PIN_GLOBAL);
> +
>                 if (err != -ENOSPC) {
>                         if (!err) {
>                                 err = i915_vma_wait_for_bind(vma);
> @@ -1383,6 +1375,30 @@ int i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>         } while (1);
>  }
>
> +int i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
> +                 u32 align, unsigned int flags)
> +{
> +       struct i915_gem_ww_ctx _ww;
> +       int err;
> +
> +       GEM_BUG_ON(!i915_vma_is_ggtt(vma));
> +
> +       if (ww)
> +               return __i915_ggtt_pin(vma, ww, align, flags);
> +
> +#ifdef CONFIG_LOCKDEP
> +       WARN_ON(dma_resv_held(vma->obj->base.resv));

Hmm, so this can't trigger, say if shrinker grabs the lock, or some
other concurrent user?

> +#endif
> +
> +       for_i915_gem_ww(&_ww, err, true) {
> +               err = i915_gem_object_lock(vma->obj, &_ww);
> +               if (!err)
> +                       err = __i915_ggtt_pin(vma, &_ww, align, flags);
> +       }
> +
> +       return err;
> +}
> +
>  static void __vma_close(struct i915_vma *vma, struct intel_gt *gt)
>  {
>         /*
> --
> 2.33.0
>
