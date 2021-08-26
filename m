Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F22F3F8B98
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 18:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4CAE6E876;
	Thu, 26 Aug 2021 16:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18B76E876;
 Thu, 26 Aug 2021 16:12:06 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id h4so5920829wro.7;
 Thu, 26 Aug 2021 09:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uZ53UOKVhNxUEqdLAScZpn5ZbV6gR216PXDvBMoDsJ0=;
 b=FTuQ4TU+juAyIcRny/G1exFlpJiou+bhDGu9lDO0DsIG8Pv4LReFqqIHyXYNBeR/Pc
 6k1dG0Hluz/fL0MLCGRJI2sYwA2VdretaZHB+641Si/ETUZwYBal3rYJ8/6V4XAkcvF5
 EbSE8EbSa9ntTlglXYu1UWzsLszkJI95ARuNlq6A8fb+fxrdf3cA5f5iGmu8hck7tDI2
 pAlHxmEcU8U+QpfSB9Iag7Nst1IXgJZ8UOi1NDM3E+ZDWYTacMgW2svKRNdmQ8Amo14W
 M315/luizhsKfyNUztVjbGuJgaEKnNv5VlhfJIPwAUItvERKNQ5TX8aRgBxfpr9+yE4z
 SLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uZ53UOKVhNxUEqdLAScZpn5ZbV6gR216PXDvBMoDsJ0=;
 b=WP2Fin5pYrXcK7aUWGthKSicahlMbAYfkLS54rGVREosSBUz4TSfyhU0PwCMpIIVeK
 aDlSm4w0+bkG7ipWD0wDhu0PRjG592plyrktvZIrptGiT4gSVLjfAwYHG4x6rCOgjYrh
 rmHpKZXqOPfaQP/TAI0wlW2G7b46KMdNblSKV6sJE/o2J6MNgmcUHnFVM6lQaWkgVfBG
 6ZRhu6/wJRabD2KHAFoaBt9yv2lBa18Z6I5s6p93tfUtY7vpWK/3SWvzUHDV0syIamXT
 wkDFiFneITgsXDhQBwoL/wMjiq5/lSRQQcv+fEWqbfe/7vM5tpKVp8jbPIBHgfWKN54g
 qC/Q==
X-Gm-Message-State: AOAM530YY1LNMW9xI1YT/SjpjB7tm68HilaQfveSe8ZHn/J3+2cfgsrS
 vJLLz48xF2BXixrCHWbtfWvEgXmSk9Y1nr3Zvps=
X-Google-Smtp-Source: ABdhPJxtood4/saSsE3z1EPvPnriWX3qaYlwDGqg0m3wLUTQQRZKkRwFi0JmiIBPKuJnv+vtCJJGXz/Xf04g9we/GkE=
X-Received: by 2002:adf:f60e:: with SMTP id t14mr5026798wrp.83.1629994325591; 
 Thu, 26 Aug 2021 09:12:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
 <20210805104705.862416-17-daniel.vetter@ffwll.ch>
In-Reply-To: <20210805104705.862416-17-daniel.vetter@ffwll.ch>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 26 Aug 2021 09:16:25 -0700
Message-ID: <CAF6AEGtSM_TfCKvHh48WFX4DvhdrWLLi3oCMPz1x2_pCZwbPCQ@mail.gmail.com>
Subject: Re: [PATCH v5 16/20] drm/msm: Don't break exclusive fence ordering
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Lucas Stach <l.stach@pengutronix.de>, 
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>
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

On Thu, Aug 5, 2021 at 3:47 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> There's only one exclusive slot, and we must not break the ordering.
>
> Adding a new exclusive fence drops all previous fences from the
> dma_resv. To avoid violating the signalling order we err on the side of
> over-synchronizing by waiting for the existing fences, even if
> userspace asked us to ignore them.
>
> A better fix would be to us a dma_fence_chain or _array like e.g.
> amdgpu now uses, but
> - msm has a synchronous dma_fence_wait for anything from another
>   context, so doesn't seem to care much,
> - and it probably makes sense to lift this into dma-resv.c code as a
>   proper concept, so that drivers don't have to hack up their own
>   solution each on their own.
>
> v2: Improve commit message per Lucas' suggestion.
>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org

a-b

> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index fb5a2eab27a2..66633dfd58a2 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -330,7 +330,8 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
>                                 return ret;
>                 }
>
> -               if (no_implicit)
> +               /* exclusive fences must be ordered */
> +               if (no_implicit && !write)
>                         continue;
>
>                 ret = drm_sched_job_add_implicit_dependencies(&submit->base,
> --
> 2.32.0
>
