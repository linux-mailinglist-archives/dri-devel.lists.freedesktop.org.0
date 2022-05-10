Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DF0522311
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 19:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 299FA10E420;
	Tue, 10 May 2022 17:46:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21E510E420
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 17:46:03 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id j2so32128594ybu.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 10:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=USKL8Y19KqC+rb8HxxibZ/ziwBl0bjEQ9bCbRDbs4dY=;
 b=Na6mrteQccHCP7U30nd7OtddNhTuGW0K47wW1pKjMGoecxxqIzG44JSq2j5t4OsRTN
 9gzGvVxFHArI4Bf3+xa6A81h/WJOXt/sLBa6eWnbgJS5qcDJUrB7yRUmcEYXm4LBXBs6
 WhC1cBxlIsZ9Txh8uVegN+fd4LgdxrfqhZQ45tgFiHOkWwUBI6IiBqCo4DhePU3cTgMC
 QhM8CWzfrly2xXw9mKc0hJsG5YuziBwShFkv0+M3EZz7PCV2HK8dSGmAP0SZbn1cNTEb
 oR8h6JCwGeyhSsbu4q+SZ6TYNQdRid09212wts6XVO6vgtcFBW7dYoSwMEV9yXeO7wE6
 60vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=USKL8Y19KqC+rb8HxxibZ/ziwBl0bjEQ9bCbRDbs4dY=;
 b=d6Y3TilIgRWHGPmJVrh7VVfW2WFhcy7vtEJFoq+sjo6mD3yg1UiV9X2QAIBs3+mDj5
 nTJft2vNKutn9lrvLmHcdNjTzBjf9ISOf1OOZEDiqJHB2318I1znBo0tFtzggOzF4kM3
 SyBnHyaNSpcJRSfOHL8Gr1bABMnRVdrSSjT938KhWYCnJe+mp2KS9/fZaLkJHb9/bcVM
 +PreB/6siv/2EUTFBK1uUURUthXQ1VNPVBmxW8tFHAYzsGvJTxq+Mvbg/7pbbeEQmMfe
 DPoTqxQd+ns0Dh7aWY8saV5mcv8ay39qLt0xzV/RXxVeLDyBC31Pg9xhRxgVHvqYJPSx
 Kdgg==
X-Gm-Message-State: AOAM530PirXwhNKz1gOtEUv5xoSL9AN0YOqB6BYG4jlL86Ed6jxqjTO/
 wX5eLpPfW/MgMRQeuPDcn5g0utqJLHLUhXl26MI1KQ==
X-Google-Smtp-Source: ABdhPJxSrH6rUPLDlUdWCz3K2tIpkc7vtxnvQU1l092FHrC6aIIK41/xPVl/NXH/I/PIq3Snct+s+fgKx3qBZxqVW3g=
X-Received: by 2002:a25:b4d:0:b0:64b:11cb:2e43 with SMTP id
 74-20020a250b4d000000b0064b11cb2e43mr4127229ybl.175.1652204762789; Tue, 10
 May 2022 10:46:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220510165216.3577068-1-robdclark@gmail.com>
In-Reply-To: <20220510165216.3577068-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 10 May 2022 20:45:51 +0300
Message-ID: <CAA8EJprS_Jk_Wowz-nK1nnYF1UUb-4SYUPhsF_qB4rL4GUPygA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix fb plane offset calculation
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 10 May 2022 at 19:52, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> The offset got dropped by accident.
>
> Fixes: d413e6f97134 ("drm/msm: Drop msm_gem_iova()")
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/msm_fb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
> index 362775ae50af..4269da268a4a 100644
> --- a/drivers/gpu/drm/msm/msm_fb.c
> +++ b/drivers/gpu/drm/msm/msm_fb.c
> @@ -118,7 +118,7 @@ uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb,
>                 struct msm_gem_address_space *aspace, int plane)
>  {
>         struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
> -       return msm_fb->iova[plane];
> +       return msm_fb->iova[plane] + fb->offsets[plane];

Nit: can we push fb->offsets handling into msm_framebuffer_prepare()
instead? Then the msm_framebuffer_iova() would become trivial?

>  }
>
>  struct drm_gem_object *msm_framebuffer_bo(struct drm_framebuffer *fb, int plane)
> --
> 2.35.1
>


-- 
With best wishes
Dmitry
