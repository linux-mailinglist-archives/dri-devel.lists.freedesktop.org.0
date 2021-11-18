Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D53E4565DA
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 23:45:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257566E1D8;
	Thu, 18 Nov 2021 22:45:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C776E1D8;
 Thu, 18 Nov 2021 22:45:50 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id e71so22625898ybh.10;
 Thu, 18 Nov 2021 14:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Drrxg0bait9D2hSu5Rb+lqByc8pviUXeN3/NBO2Mdw0=;
 b=ALelaSYbC0JAGYqDK1XiIqBleMj2mT/SaxMSw+/uyDrnimujzZtPhY0VtYFsUEqaXg
 mm/OIiSTamkgkCAyipQRGpRKcuZzigaaVhPUlGRailSg2QJTWJhHdCoeWjvLxS20SHRH
 MnPT2HsDkPxXMJoHb8O/VXSjN9BcJtZ4sHdihnpPwUo9NaxD2nb+25F+DljhM4n3frHW
 sYys5igeVfB3WFLjkCb44UuoqLV0cu7TknknwZWHXTD2UePVXD4orSxxEC8rNxyxNN/n
 +Ck60VdaF8aV0NEHFVw7d0/Vu3c0omHgS4nnbRsF5PtuMivM7iiNFmlZhhvvfM0SS1QH
 4Ayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Drrxg0bait9D2hSu5Rb+lqByc8pviUXeN3/NBO2Mdw0=;
 b=ZZmfDOhhGUFl8JR2JIl/qkCAt2eNtLDpdLfYHpyazJXrfcqC47pMXvgpjuLMkXr7nb
 j5Od12y/d+Y1wSYBZbNYCRv877buH+AHMgMvPeXGohhJ+X8RcLti1lICqO3LCCrirSw+
 1/WdKyF46/Rw90GiuLge6csRJvsB15ornjsd2uFeOTqLlgYWu83onikfLi3LnBMKc40d
 qZYxKkDc/VABKFsJURzLp4GbBnHHjUTTvggEwdweDWnCXTyMDiis+st2sCaJqJ1FOKrN
 hZEJrAhXqbzAvHzKNAQ/Qeo0PU94fysG1Kj3zs/PjHMcpZur58R9lT2+E2uPeUhmVHvd
 4yBQ==
X-Gm-Message-State: AOAM532rLRbY5k1JIEV0Gc9SED7m6pdnpPjckpHNH7OuycrS9+rXYnKK
 hLaoDn3icpTk3/mfhQQdKPeS7r9eq+RFpPjMawe1l2Zs
X-Google-Smtp-Source: ABdhPJz4F3+J1gbdCBhQ0sBG5pFrqOoaVWVM1MOWWO5ipi7oqJGxkL204p7x7LR7PkF1BEm0c3jhfkDCgRf8F3yERwU=
X-Received: by 2002:a25:378c:: with SMTP id
 e134mr30130496yba.474.1637275549921; 
 Thu, 18 Nov 2021 14:45:49 -0800 (PST)
MIME-Version: 1.0
References: <20211118111314.GB1147@kili>
In-Reply-To: <20211118111314.GB1147@kili>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Fri, 19 Nov 2021 08:45:38 +1000
Message-ID: <CACAvsv5jiOo+4hvO-G1ojAvrwZDALX7VfAV8-SHnzYak-3mFDA@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau/acr: fix a couple NULL vs IS_ERR()
 checks
To: Dan Carpenter <dan.carpenter@oracle.com>
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
Cc: David Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 18 Nov 2021 at 21:13, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The nvkm_acr_lsfw_add() function never returns NULL.  It returns error
> pointers on error.
>
> Fixes: 22dcda45a3d1 ("drm/nouveau/acr: implement new subdev to replace "secure boot"")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>

> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c | 6 ++++--
>  drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.c | 6 ++++--
>  2 files changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c
> index cdb1ead26d84..82b4c8e1457c 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c
> @@ -207,11 +207,13 @@ int
>  gm200_acr_wpr_parse(struct nvkm_acr *acr)
>  {
>         const struct wpr_header *hdr = (void *)acr->wpr_fw->data;
> +       struct nvkm_acr_lsfw *lsfw;
>
>         while (hdr->falcon_id != WPR_HEADER_V0_FALCON_ID_INVALID) {
>                 wpr_header_dump(&acr->subdev, hdr);
> -               if (!nvkm_acr_lsfw_add(NULL, acr, NULL, (hdr++)->falcon_id))
> -                       return -ENOMEM;
> +               lsfw = nvkm_acr_lsfw_add(NULL, acr, NULL, (hdr++)->falcon_id);
> +               if (IS_ERR(lsfw))
> +                       return PTR_ERR(lsfw);
>         }
>
>         return 0;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.c
> index fb9132a39bb1..fd97a935a380 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.c
> @@ -161,11 +161,13 @@ int
>  gp102_acr_wpr_parse(struct nvkm_acr *acr)
>  {
>         const struct wpr_header_v1 *hdr = (void *)acr->wpr_fw->data;
> +       struct nvkm_acr_lsfw *lsfw;
>
>         while (hdr->falcon_id != WPR_HEADER_V1_FALCON_ID_INVALID) {
>                 wpr_header_v1_dump(&acr->subdev, hdr);
> -               if (!nvkm_acr_lsfw_add(NULL, acr, NULL, (hdr++)->falcon_id))
> -                       return -ENOMEM;
> +               lsfw = nvkm_acr_lsfw_add(NULL, acr, NULL, (hdr++)->falcon_id);
> +               if (IS_ERR(lsfw))
> +                       return PTR_ERR(lsfw);
>         }
>
>         return 0;
> --
> 2.20.1
>
