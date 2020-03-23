Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC29418F389
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 12:14:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ECCD89F77;
	Mon, 23 Mar 2020 11:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8097B89F77
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 11:14:34 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id e138so8431226vsc.11
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 04:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MAiWRKEXAyRQFJfsxR6WCAQNazeZOJnLHhtRsQi0so0=;
 b=XLTlSXcnZvLStMq6xWIjt7gUqpgyShU3l1jhj7uyo4W/EBeJptZafYXL+55Ot1jRh6
 2raRYIB+jzyrYe5pT7oN6pOz+yfE7FB8nevJc5VpN+GIQQu0mVAVyGmrsICGFv7fNmlZ
 TMxQVO3sBKSZqit2wKMSpTkwKqM+3fZlfiAkWmRrXIrnjfY7E76JYZG3kqRjmKagOjl6
 mwh2OY9B+RSMvmCFW5RbcGiK4Si6k6Uy3EGiWf8VtcrrcCG0vs0iiqkLPJRHdwYJ29vF
 yhHUkIk6KZTnOJM0iPBQMVpQD6Qyf2mSEUP4HaQjQnnE6G9WxgbYDxiu2UxNUgB8s2Nh
 g9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MAiWRKEXAyRQFJfsxR6WCAQNazeZOJnLHhtRsQi0so0=;
 b=pswGmbsIIpEhgVt8WYQQ7M2gbk0WyShUDorhLSdGbVsYELjxWCNSxi2xU46zyHS7CV
 mJouAiEMI+uNMRoe6pY+DZ4EGWg3a/M8AFNb5fXWCbZ6RMgPNJIkLSaafAfLVX5sX8pM
 NZTGKXpVLF7xym46UcEaV8dWBjjuFQ3yoKTo0MXY9T2fI5OKE7Ore/k7YfBpl16nxtoz
 FrNzpbck02tTdUmNZA8kd5VxdlmDkKjMhX4VUo0ZvstLmSxBSRKY3/bD41aBuMu+8yXT
 gm7rjZ/hviFQ9LBXAe8spjonk33hUMwUKeSbgCF69XN9Rna/pu0q/AEUHzayBTapCQLj
 VKLA==
X-Gm-Message-State: ANhLgQ1lk+nHNcZFTx4bY0dCpnPVgSsaZVISJ24q/BOcv94iaskqw/WS
 Hv/IUsaSaFvKEEG3/UcGU2TIeECnvWmdno1WyME=
X-Google-Smtp-Source: ADFU+vutlzdjUedg8us2quK3xm80fTCg+xe4TNgGIZ30332v3xwKq5807/piYycyJZIc7WTTFhQjRRsNJzmeghhbo9g=
X-Received: by 2002:a67:c592:: with SMTP id h18mr5351236vsk.118.1584962073626; 
 Mon, 23 Mar 2020 04:14:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200320132334.GC95012@mwanda>
In-Reply-To: <20200320132334.GC95012@mwanda>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 23 Mar 2020 11:13:22 +0000
Message-ID: <CACvgo51xwgF2hJPOESWGpJ16WittQSVixdd+62KwFsZaHO-Dpg@mail.gmail.com>
Subject: Re: [PATCH] drm/gem: Fix a leak in drm_gem_objects_lookup()
To: Dan Carpenter <dan.carpenter@oracle.com>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dan,

On Fri, 20 Mar 2020 at 13:23, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> If the "handles" allocation or the copy_from_user() fails then we leak
> "objs".  It's supposed to be freed in panfrost_job_cleanup().
>
> Fixes: c117aa4d8701 ("drm: Add a drm_gem_objects_lookup helper")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/drm_gem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index a9e4a610445a..f28724f2eb69 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -710,6 +710,8 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
>         if (!objs)
>                 return -ENOMEM;
>
> +       *objs_out = objs;
> +
>         handles = kvmalloc_array(count, sizeof(u32), GFP_KERNEL);
>         if (!handles) {
>                 ret = -ENOMEM;
> @@ -723,8 +725,6 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
>         }
>
>         ret = objects_lookup(filp, handles, count, objs);
> -       *objs_out = objs;
> -
>  out:
>         kvfree(handles);
>         return ret;

It seems that this will return error to the caller, mangle the output
pointer and effectively still leak the objs.

Better option IMHO is to:
- move the __user/copy_from_user into the caller
Removes a silly kvmalloc_array(1,...) in ~90+ users and drops the "out" label.
Extra bonus, this is the only instance in drm_gem with __user -
consistency is nice.
- add "err" or similar label, where the objs is freed before returning an error.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
