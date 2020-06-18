Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5601FE70B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 04:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A46216E0AC;
	Thu, 18 Jun 2020 02:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 206626E0AC;
 Thu, 18 Jun 2020 02:38:42 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id s28so3628076edw.11;
 Wed, 17 Jun 2020 19:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fn1oTj1MrOMqfg06EDKwAoYxj2Z3VWdebP8hXUOa11U=;
 b=tVzXDIaw2NKS50gVeUXfTpB8tddn0VcobFGhMm9eW4rWh53jLNluzEtW2Ye4XHjQCS
 kauGt+ouda2dca8jgapjjNZ2xaQ3fyM6h95VX/sKcOPrEq3Ahr7UHqjxX+3SUugDzKIN
 jvSCgNBduyixkI8ID3xdsETMLX87i30zgGTWVZmwCsNRSLZdrX0/6g17gipF/fFokvWe
 aUGi3WOtioAdevo+TTeg6PJvGKk7uRgzRn6eFQrieovVKFwBpHzcaZrJlWnaXgSyz/5A
 pUkPBdTWrI+9tv+3azvnVTTJe+Q5JOh0KI2M6RiK12ZW1un3uFGu/nwB6zBMXBAUq2JE
 sNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fn1oTj1MrOMqfg06EDKwAoYxj2Z3VWdebP8hXUOa11U=;
 b=FClsy7rjCHAXESViD1Ts0kiACOnsNnkQ2l6agnBiM/2uIrkYM6AuwQtCJrcTlL94xy
 puybuJk6NLXi8HYtZhbkh4Sd+BuRNQCMxx0idx2wurTnLaCp7l+IIt2tNzP8GRJyEgzi
 Zg5Q8Oz4jKUxQngcX/Kg9YW05anUMoqOEHRDRzs17HgVndpiFH0/I3J5/HhSsc0DGnTU
 ogvveG7DWL37k6E3+RQt/x1vjMeaXD/V/+pqlJMeSrUQ7pRBLjXWMHDqTVC7aZCwiqc6
 qsaY3vtPEAXjulPMF9uHzVJ4POeMbK3cPBM49TqjIi0h6LKXlC9PuDZ9JhiTPOmvCc65
 FXsA==
X-Gm-Message-State: AOAM531zJpE5r6at/Ta8SgihG5qr0rmuvxLXRD/5hgTi5IbmeKYM9oqQ
 Svwo4TaU9QfoZe20ZzdwtxTE44VvQlWSNkOjwF0=
X-Google-Smtp-Source: ABdhPJwHVmIzvsNJeU6cQ52qJLQTS+rkoE2LIe9n+nnNDPP/fDkExgJg3wMLxUOIqWX8Y9YnQTQ0DkMuOdCUjA5NOUI=
X-Received: by 2002:aa7:da14:: with SMTP id r20mr2030808eds.7.1592447920293;
 Wed, 17 Jun 2020 19:38:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200617205310.2183722-1-eric@anholt.net>
In-Reply-To: <20200617205310.2183722-1-eric@anholt.net>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 17 Jun 2020 19:39:08 -0700
Message-ID: <CAF6AEGu1jV+SWg8apDdq5QghGUvr1wKV38R8XwTL97VXfVUmdQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm: Fix address space size after refactor.
To: Eric Anholt <eric@anholt.net>
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
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 17, 2020 at 1:53 PM Eric Anholt <eric@anholt.net> wrote:
>
> Previously the address space went from 16M to ~0u, but with the
> refactor one of the 'f's was dropped, limiting us to 256MB.
> Additionally, the new interface takes a start and size, not start and
> end, so we can't just copy and paste.
>
> Fixes regressions in dEQP-VK.memory.allocation.random.*
>
> Fixes: ccac7ce373c1 ("drm/msm: Refactor address space initialization")
> Signed-off-by: Eric Anholt <eric@anholt.net>


rebased on https://patchwork.freedesktop.org/series/78281/ (which
fixed half of the problem) and pushed this and 2/2 to msm-next so it
should show up in linux-next shortly..

planning to wait a short time more to see if we find any other issues
and then send a -fixes PR

BR,
-R


> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 89673c7ed473..5db06b590943 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -194,7 +194,7 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
>         struct msm_gem_address_space *aspace;
>
>         aspace = msm_gem_address_space_create(mmu, "gpu", SZ_16M,
> -               0xfffffff);
> +               0xffffffff - SZ_16M);
>
>         if (IS_ERR(aspace) && !IS_ERR(mmu))
>                 mmu->funcs->destroy(mmu);
> --
> 2.26.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
