Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F937486FB4
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 02:27:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76B410E73A;
	Fri,  7 Jan 2022 01:27:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 281EA10E740
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 01:27:43 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 g79-20020a9d12d5000000b0058f08f31338so5080222otg.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 17:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=js8atf22LZ2E5jC1JSawXeSntda/NKccufPc65krxtY=;
 b=mEC7vPS5TCGs6eV1fpNRUln7/hyrdk36yWS/g33sqDr4/XwyVkqxbXGSd9fKIdAfMd
 ASWLNeX7JfjF9ehKRCeDDu966GIdoq9EgIvQjqemqQ2YQEVMdPbGdo09Y3SOzAftRR+Z
 IWFM0iZ8hKS29BHp4Y4WgrgRFSs5MjXzl3wXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=js8atf22LZ2E5jC1JSawXeSntda/NKccufPc65krxtY=;
 b=SzjEZBz3mb/U2svz7qQT/AjPaAYSFbGneTSZK+SUOSnF+ZKyaulhsf9R/d8sVk3xTr
 hU+matbINttwrSHfICzoPd7RYU/8N14vEzT4WVXqCuWUizZHS0UmXROW5Br7DncxiDeX
 5RVlRwKtC/iivtXfFJQcvsDOvitQHkqrK7Kcac9Iv73ufeOpoyAYhOs47NvNpQA5cjA1
 ebmygoVVWfSi0MHBFZCd/mU07S4RaURLI+eegE+DzFcfUaI3etUXyGjpaOC9LcuWcsUk
 vrM3oC9CJqBYSmHMjM9zO+CzoVr+mjgXde6XVmMUBxZcynseANVr9aAia1Gxf/a4iJSk
 Vr0A==
X-Gm-Message-State: AOAM532oO1iq2erZTM0eYjg5HTOq0FbyMvyXnQrKpit9LbF6BtuWA2Q9
 aEospzAdWQjkqL5Wg2eAsbWYm2Q9R6bDd3ViP4eV6w==
X-Google-Smtp-Source: ABdhPJwKfFHMBlJIJaY2hsxyem1OasEe1YK5DAXLA5bYWAjzbIzZYfCNh/D+Sq9/WeskQdSq2rBFMT/L0TS4FZx/DOg=
X-Received: by 2002:a9d:2243:: with SMTP id o61mr43194959ota.126.1641518862462; 
 Thu, 06 Jan 2022 17:27:42 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Jan 2022 17:27:42 -0800
MIME-Version: 1.0
In-Reply-To: <20220105231031.436020-6-dmitry.baryshkov@linaro.org>
References: <20220105231031.436020-1-dmitry.baryshkov@linaro.org>
 <20220105231031.436020-6-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 6 Jan 2022 17:27:42 -0800
Message-ID: <CAE-0n505KAiLvza2WTRfk8w9qcAH-Z2W6kLMtrOxTNRbUnSJig@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] drm/msm/dpu: move VBIF blocks handling to dpu_rm
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-01-05 15:10:31)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index bf4d72356a12..2301ac114920 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -78,6 +78,10 @@ int dpu_rm_destroy(struct dpu_rm *rm)
>                 if (rm->hw_intf[i])
>                         dpu_hw_intf_destroy(rm->hw_intf[i]);
>         }
> +       for (i = 0; i < ARRAY_SIZE(rm->hw_vbif); i++) {
> +               if (rm->hw_vbif[i])
> +                       dpu_hw_vbif_destroy(rm->hw_vbif[i]);

Maybe drop this check and pass NULL to dpu_hw_vbif_destroy() sometimes?
Then the check can be omitted and the braces dropped

> +       }
>
>         return 0;
>  }
> @@ -212,6 +216,23 @@ int dpu_rm_init(struct dpu_rm *rm,
>                 rm->dspp_blks[dspp->id - DSPP_0] = &hw->base;
>         }
>
> +       for (i = 0; i < cat->vbif_count; i++) {
> +               struct dpu_hw_vbif *hw;
> +               const struct dpu_vbif_cfg *vbif = &cat->vbif[i];
> +
> +               if (vbif->id < VBIF_0 || vbif->id >= VBIF_MAX) {
> +                       DPU_ERROR("skip vbif %d with invalid id\n", vbif->id);
> +                       continue;
> +               }
> +               hw = dpu_hw_vbif_init(vbif->id, mmio, cat);
> +               if (IS_ERR_OR_NULL(hw)) {
> +                       rc = PTR_ERR(hw);
> +                       DPU_ERROR("failed vbif object creation: err %d\n", rc);
> +                       goto fail;

If it's NULL then rc will be 0 and fail will return 0. Is that
intentional?

> +               }
> +               rm->hw_vbif[vbif->id - VBIF_0] = hw;
> +       }
> +
>         return 0;
>
>  fail:
