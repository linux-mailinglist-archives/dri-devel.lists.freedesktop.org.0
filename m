Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7243E486400
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 12:57:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50FEC10E311;
	Thu,  6 Jan 2022 11:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0524710E311
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 11:57:41 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id k18so4232637wrg.11
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 03:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ENdPYturLMBQCNNgwpLTjTkeuQD5zIfYK76z8GCeMs8=;
 b=QrEzROtO9x8lTVKieSna3jaRQXjuPgDwBLWEhKfh4L8ttXdrTTd7Q9cVxuDtLKtsxB
 Yka7a4cY80IRmxdfxR0pxZbmksiXwn98KVcTgf5RwRolMDrjaVE83Td/1Z3dR3mLx3++
 ccY8ns9EGt8IELLfZifP8ZsLDiXfL0eE9W+Wkb+hjWnVDGZzKO0ZW1vSVK567duYJoso
 cp4DEv3T6GECbzCSzeS4kDVaNbXy+ssOJlda3kFnDwJhOHDmtPhp1fH5jpgtarC6dT8/
 dgknFdtAipFPvLA3gELHhv6WTGiJew+UCLKOTy6dQMIZPHBUJ+b+g0OmeGzH7HHJ1Zjj
 EnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ENdPYturLMBQCNNgwpLTjTkeuQD5zIfYK76z8GCeMs8=;
 b=vd75tEMzYK1+IA5odn8a7M45i4unbmPE10NRYucjBhpKxccdlvdaDFBXeBnXmM/223
 xuCU8X0w353ZNo1gOAOuUVxSR+ncHZ6s2ossJ3wo70JNdSkkGgjo49zALtmBMEYMeXbC
 5InguxTINu4mTBQbFK2WROOOXHe5EgZ8gq++dtLKJ/pdQklkEhNYlCS4eQeAgtc1Y91R
 P/Z1gk1jHJQn0dBhCfE1cRXBozJtEu6eG47P8dMtHguqahcZmL9G1gC7SnOpsLC+4pgE
 DyANZRpJa+WalmtDu9dDwJf5q3DIapguCKhosgEywLC4l7SR20rKb6xzSjTNQMELbCZ2
 VEmw==
X-Gm-Message-State: AOAM531p1jc/J0wgj66iFOWeEHnw87GEoYLWrcv9ezgjq57V3N8nwXqz
 fWKmjgWiPEaLKFsv5xlpGkQvVYzTTb28vaYHmQkQkA==
X-Google-Smtp-Source: ABdhPJxZiF9wtSKnHcMfpyfw/zQHz3JTYsQ07e9gVX4ncIx5ryzekJ7/fQULWO53DEaQnfYTWkiDwsODW7Y10guZBSg=
X-Received: by 2002:a05:6000:156b:: with SMTP id
 11mr51162670wrz.261.1641470260494; 
 Thu, 06 Jan 2022 03:57:40 -0800 (PST)
MIME-Version: 1.0
References: <20220105120442.14418-1-linmq006@gmail.com>
In-Reply-To: <20220105120442.14418-1-linmq006@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 6 Jan 2022 11:57:23 +0000
Message-ID: <CAPY8ntAdknutH=OmV1dWPbez1ZqLgaOj-BoQQkZAu0WbhbE6nQ@mail.gmail.com>
Subject: Re: [PATCH] drm/v3d: Fix PM disable depth imbalance in
 v3d_platform_drm_probe
To: Miaoqian Lin <linmq006@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Eric Anholt <eric@anholt.net>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Emma Anholt <emma@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for the patch.

On Wed, 5 Jan 2022 at 12:04, Miaoqian Lin <linmq006@gmail.com> wrote:
>
> The pm_runtime_enable will increase power disable depth.
> If the probe fails, we should use pm_runtime_disable() to balance
> pm_runtime_enable().
>
> Fixes: 57692c9 ("drm/v3d: Introduce a new DRM driver for Broadcom V3D V3.x+")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  drivers/gpu/drm/v3d/v3d_drv.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
> index bd46396a1ae0..4f293aa733b8 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -300,6 +300,8 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
>         v3d_gem_destroy(drm);
>  dma_free:
>         dma_free_wc(dev, 4096, v3d->mmu_scratch, v3d->mmu_scratch_paddr);
> +pm_disable:
> +       pm_runtime_disable(dev);

The dma_alloc_wc is done before the pm_runtime_enable, so the cleanup
should be in the opposite order.
Functionally it makes minimal difference in this case as
pm_runtime_enable can't fail, but could cause confusion/errors should
any other initialisation step be added between the two.

The pm_disable label is also unused so not necessary, however if
reversing the order then renaming dma_free to pm_disable would be
sensible.

  Dave

>         return ret;
>  }

>
> --
> 2.17.1
>
