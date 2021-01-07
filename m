Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 690B52ED54B
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 18:18:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 672546E4B6;
	Thu,  7 Jan 2021 17:18:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 103846E4B6;
 Thu,  7 Jan 2021 17:18:12 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id a12so6373023wrv.8;
 Thu, 07 Jan 2021 09:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xFzg996wZghRDMljRiUDGgbxiUKBLaZNfvfWsKyW/2c=;
 b=O/R+YVTkjwuKfy5YWvgsyEfgiPoH29vHtCLfdXluhXXDQMecR7hA02HYW+phgP5FYf
 +rsTzDsrfDY8eQYb8LyKk+xV1LNc0tuVEWT3KNzaBp/CW3BTRimzApYGGgUuzM6BGc9h
 xKdBo+utOMeFzYJ5tSOuZBPdMvi52ufJHp/ZThMp8s4n6yF2Qd6kwtUIgbP+z6lX3nrD
 1/zvka84oezzVer77cNZY8C4+JnWxPovPfjxWvghOMBGpNAEvKplFCuuX0sScDxFtIAo
 jeTOwCiMe/CJ+56CMrh121XfXrV76LIggms0SkQS4SvrdJdJnqkgo6oydFaT5d0H19o5
 BJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xFzg996wZghRDMljRiUDGgbxiUKBLaZNfvfWsKyW/2c=;
 b=WcuYnWp1p0zkOu72KZqU3h5YrbASX2dzyd/vOwGhjH8/x1k3+n3TKx4YlrM26ijwfJ
 4artW7+S8g4r7RZL2DQRHim1NFohnntWeIel2gjUTMsleYuzSkIztyR7OhBpRNvy7DMo
 nNJ5DW1klcKzpTDraN854mwF5/0SGG4iLbwfowEvzl9c6Yr0xn1+ziVIfb4gVyNxqy9z
 w1XBijJqSRpl+k+DlftHdatHI/NST7ESThl3tX0WkOVuQGt8Op3PWG635i/bM7mscO0Z
 yrwVLFiRAKXQJUiJdkG3o9r6b4FTe+s3SPVUVtTmrQvZ8XflW3kh2JKowzfBKbCHYSPd
 M1Ow==
X-Gm-Message-State: AOAM533ESvl6GwhpLgF4o1lD2iGpJRUsKgcFcONVnNvdBAOmorkmD97l
 RIPUdrPZyRs5wPUuGQqib9npLtvSkv2L/5DwcpU=
X-Google-Smtp-Source: ABdhPJz/iMez31ElhUqyL+2r7iU5UeEAm0l66rJM1+cGzIhU1tpyYXo3Hi1iqH1RN+pFBNtJxM9eBcIe2Kge97Aq9S0=
X-Received: by 2002:a5d:54cc:: with SMTP id x12mr10040275wrv.132.1610039890761; 
 Thu, 07 Jan 2021 09:18:10 -0800 (PST)
MIME-Version: 1.0
References: <20210102202437.1630365-1-iskren.chernev@gmail.com>
In-Reply-To: <20210102202437.1630365-1-iskren.chernev@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 7 Jan 2021 09:20:29 -0800
Message-ID: <CAF6AEGt868msEPdZwJTB3YQppwNLaavSsDm1mGznCu1jsSPxCQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix MSM_INFO_GET_IOVA with carveout
To: Iskren Chernev <iskren.chernev@gmail.com>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 2, 2021 at 12:26 PM Iskren Chernev <iskren.chernev@gmail.com> wrote:
>
> The msm_gem_get_iova should be guarded with gpu != NULL and not aspace
> != NULL, because aspace is NULL when using vram carveout.
>
> Fixes: 933415e24bd0d ("drm/msm: Add support for private address space instances")
>
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index c5e61cb3356df..c1953fb079133 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -775,9 +775,10 @@ static int msm_ioctl_gem_info_iova(struct drm_device *dev,
>                 struct drm_file *file, struct drm_gem_object *obj,
>                 uint64_t *iova)
>  {
> +       struct msm_drm_private *priv = dev->dev_private;
>         struct msm_file_private *ctx = file->driver_priv;
>
> -       if (!ctx->aspace)
> +       if (!priv->gpu)
>                 return -EINVAL;

Does this actually work?  It seems like you would hit a null ptr deref
in msm_gem_init_vma().. and in general I think a lot of code paths
would be surprised by a null address space, so this seems like a risky
idea.

Maybe instead we should be creating an address space for the vram carveout?

BR,
-R


>         /*
> --
> 2.29.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
