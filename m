Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E116E696BCD
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 18:34:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6D410E935;
	Tue, 14 Feb 2023 17:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C60510E0ED;
 Tue, 14 Feb 2023 17:34:48 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 14-20020a9d010e000000b0068bdddfa263so4874635otu.2; 
 Tue, 14 Feb 2023 09:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=quw4WERq0qtsQq8yz2KJlgOpPpt3pCQr7AJgZ9gs9bs=;
 b=bAXZ/atYkTz7tSYeqI6xy/QoS/duSLwMmMA9ve5lqoV/KKLzbv7kN44Pmy1DN/RO91
 t3qr5gD+5mh/aKbciaun41iUX1V27VRbm8ntkE5vcZvYVC4gfQzOK/pwwwvQink2b54m
 aLEoX/Ns6L1r5Yb8YDmVrZ4vrwqOK5ElVtYDE9S0yt3eIq3Jt4a8Voftn/T1F2GjEDm7
 yu1jYTGkRLIwK6kTBVnf7OBugIQrgf40cFAe0cWfovvM0OahMWgdlt+r35JCaIQTv/JP
 KN+JyAafeUJJhi6D6yA1omEvTNl6CX+bAUQ5ZSLbPKlHo77RmexBC9sGLLw72MLiCdVD
 MctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=quw4WERq0qtsQq8yz2KJlgOpPpt3pCQr7AJgZ9gs9bs=;
 b=an62b5hpHI6bzBRJjR0UbJxD089YMcAtMrgRI7kR7i/KnaZX/cUT8gk+XtxNOh0DRE
 XV38iXa8uB6ghatIeJqURSkB7TUxmCLiciiaENLh58lez3JeAh3wWc8SwD7BMOE1Dn3C
 KSs09qULnzBMN6S6PQYcJ5UuSyeX54Tz47IsRuY+5QdM08aolE8hOkodSiyCZtqt2O8V
 tahe1AKuaQMIwfWsFR+ue+DMBrcYvqxf6DkhSPVxQ35GcKnu3eC1wTq5ULHkxOESlEZu
 fFweEU28mxvNKxvIjEN5KJvWSIwvMJr+PbJ/P8GSTRr326Fz1OTPQoQCLNy8/SW0B8Ki
 nrLQ==
X-Gm-Message-State: AO0yUKWHU0DmLvOmQbJI7/SFDpaDAaWtsTPn80Fw5fJqKPRcDWGH5pMC
 IxtgDtDvmiqamlI0LpzWOUDC7zMKGGswByfpsRo=
X-Google-Smtp-Source: AK7set+vDYIH90pdNzC/mL976gQIxoSspEFrcyzWfPMG3tzTnF1uXRIxi7C3oM70Jt3grRiebofLGoAPVamFDDOqh+c=
X-Received: by 2002:a9d:6f83:0:b0:66c:5685:5415 with SMTP id
 h3-20020a9d6f83000000b0066c56855415mr146769otq.125.1676396087727; Tue, 14 Feb
 2023 09:34:47 -0800 (PST)
MIME-Version: 1.0
References: <20230214020956.164473-1-dmitry.baryshkov@linaro.org>
 <20230214020956.164473-5-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230214020956.164473-5-dmitry.baryshkov@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 14 Feb 2023 09:35:02 -0800
Message-ID: <CAF6AEGvW5qJ1q83a7Ny-BMq9BOt88h9+Kfs6DGEBPnO+1iQazA@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/msm/a5xx: fix context faults during ring switch
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Yassine Oudjana <y.oudjana@protonmail.com>,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Jami Kettunen <jami.kettunen@protonmail.com>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 13, 2023 at 6:10 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The rptr_addr is set in the preempt_init_ring(), which is called from
> a5xx_gpu_init(). It uses shadowptr() to set the address, however the
> shadow_iova is not yet initialized at that time. Move the rptr_addr
> setting to the a5xx_preempt_hw_init() which is called after setting the
> shadow_iova, getting the correct value for the address.
>
> Fixes: 8907afb476ac ("drm/msm: Allow a5xx to mark the RPTR shadow as privileged")

Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/7555

> Suggested-by: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> index 7e0affd60993..f58dd564d122 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> @@ -207,6 +207,7 @@ void a5xx_preempt_hw_init(struct msm_gpu *gpu)
>                 a5xx_gpu->preempt[i]->wptr = 0;
>                 a5xx_gpu->preempt[i]->rptr = 0;
>                 a5xx_gpu->preempt[i]->rbase = gpu->rb[i]->iova;
> +               a5xx_gpu->preempt[i]->rptr_addr = shadowptr(a5xx_gpu, gpu->rb[i]);
>         }
>
>         /* Write a 0 to signal that we aren't switching pagetables */
> @@ -257,7 +258,6 @@ static int preempt_init_ring(struct a5xx_gpu *a5xx_gpu,
>         ptr->data = 0;
>         ptr->cntl = MSM_GPU_RB_CNTL_DEFAULT | AXXX_CP_RB_CNTL_NO_UPDATE;
>
> -       ptr->rptr_addr = shadowptr(a5xx_gpu, ring);
>         ptr->counter = counters_iova;
>
>         return 0;
> --
> 2.30.2
>
