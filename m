Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 934637175C4
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 06:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C7010E469;
	Wed, 31 May 2023 04:39:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D3DE10E469
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 04:39:33 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-2564ced644bso801025a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 21:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685507972; x=1688099972;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KVic8ZozVX5AlLBxJqcr+ixPM2ET/77wx3a5l9yrvTA=;
 b=YdkgddUdmRbj6JnRhb0cOb/hkVpjC4ma1FBFF7MmudnlBD7T6ZzdyBwlBbmmKS7mAE
 fPOTVp0kyePChrSuNNq4RexORKiiWGKe6BNknVFN4gmM0Vaz2IN8v1B2xwtRDUFpYR2E
 W5Jos/s/M4bIEJnxNy/Awl8gVHim40jo/ndGy49Jr3VuvK3lRYFAn4tiQkxFqLYC6tSU
 FJGTiSExcjsmUbbNTNtjpF/totbZJkwi8xRFycX7IzRQ/6loY2yAgSJXEFaW7z/6tEI4
 7prr879NFKF5qzYCgXQkb1fGDkK2vJhkXUYT5UiWASWnNbv/Cp/H36Mh82zRPSX9NOwT
 6xpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685507972; x=1688099972;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KVic8ZozVX5AlLBxJqcr+ixPM2ET/77wx3a5l9yrvTA=;
 b=SouAOwfYU5KC1WutU57yVhYyunkxisV/Zj47cwkDpI5NtJP5LnprEJPJo8YwreFivx
 3yX0UvPdYdkcro14KQnt6xmvB6F1d/38xdAObPK8uVJvwGm8m15xcv2It+rgvcuJtvdV
 3ncM3WMMsWm1ytJ2Esny14gtxuNFI1bu2kqbuY1BcrJg0mEMeC84DjDnJVybMYVfYS0s
 q6x0HQ8rTtfQE2kVx8ojDUxFFL3ma94iYxDA0UNW2sSXfja36VCd2BEEY8SiUwoOg0ht
 3IyEgjJSVDB9BaFVy9frAAvm/of813XG+K/tsLi3Xu3CuE3j+JOMrfkebOfl3GL0ew6p
 bC2A==
X-Gm-Message-State: AC+VfDy06HsmnVEufo/xsHdRlz8xB1Co1DvHOKUly5vyTw8eMtvI3jUb
 GYm1V5bqrDxAFXMYZ/w3UlmCmwtB99d5PLRM7eU=
X-Google-Smtp-Source: ACHHUZ7TQ+bwgry6OeU5ofjgd1i5pr0uySNoEw1Qia05YkABxpVcHW04AhtbBXo36TYZBu0rojShIeGrV14pmdoWRiQ=
X-Received: by 2002:a17:90b:4b83:b0:256:9095:a368 with SMTP id
 lr3-20020a17090b4b8300b002569095a368mr993241pjb.4.1685507972065; Tue, 30 May
 2023 21:39:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230526130131.16521-1-lm0963hack@gmail.com>
 <20230530222150.24oogloda6wtvpvm@intel.intel>
In-Reply-To: <20230530222150.24oogloda6wtvpvm@intel.intel>
From: lm0963 <lm0963hack@gmail.com>
Date: Wed, 31 May 2023 12:39:20 +0800
Message-ID: <CAAgLYK7FNrAYFRp7C3LDtqevFENQLw8YYAFR2Pk9wdfQ5RKVeg@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: fix race condition UAF in
 exynos_g2d_exec_ioctl
To: Andi Shyti <andi.shyti@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-samsung-soc@vger.kernel.org, alim.akhtar@samsung.com,
 sw0312.kim@samsung.com, krzysztof.kozlowski@linaro.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andi,

On Wed, May 31, 2023 at 6:21=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org> =
wrote:
>
> Hi Min,
>
> On Fri, May 26, 2023 at 09:01:31PM +0800, Min Li wrote:
> > If it is async, runqueue_node is freed in g2d_runqueue_worker on anothe=
r
> > worker thread. So in extreme cases, if g2d_runqueue_worker runs first, =
and
> > then executes the following if statement, there will be use-after-free.
> >
> > Signed-off-by: Min Li <lm0963hack@gmail.com>
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_g2d.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/=
exynos/exynos_drm_g2d.c
> > index ec784e58da5c..414e585ec7dd 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> > @@ -1335,7 +1335,7 @@ int exynos_g2d_exec_ioctl(struct drm_device *drm_=
dev, void *data,
> >       /* Let the runqueue know that there is work to do. */
> >       queue_work(g2d->g2d_workq, &g2d->runqueue_work);
> >
> > -     if (runqueue_node->async)
> > +     if (req->async)
>
> did you actually hit this? If you did, then the fix is not OK.

No, I didn't actually hit this. I found it through code review. This
is only a theoretical issue that can only be triggered in extreme
cases.

>
> Andi
>
> >               goto out;
> >
> >       wait_for_completion(&runqueue_node->complete);
> > --
> > 2.34.1
> >



--=20
Min Li
