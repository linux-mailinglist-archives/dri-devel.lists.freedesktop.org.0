Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E858653543E
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 22:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF70D10E404;
	Thu, 26 May 2022 20:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E62C510E404
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 20:08:12 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id p190so4652888ybg.4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 13:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=91qa2V3ADLkVZ93Ejl4u/cWja6JFjs7BLRXshFe5jJU=;
 b=yp1JaNWo4BgiZLOAe9Ihy2/d/xZc+8TE1uwEwXii0dvjY7Y/DrwgAoxXI7YRF18Hds
 VaOVF/Kb59Q34eYLiQwzUv//B1PDfBtXhfp57HNtXmOlFr0n4tJsUCZnydx0+far551T
 ynAsAn/h62i8bnXHl0ZD3IfRgcC4eTMMfzwSLlFDSNJEu6e8cbsTvDZkFEOVwo1wdzPW
 kqrsI2m13WR/FFckcIc9MKl95kNHwIs1t5/qhk077rgSUfbesvJEVVTyDgyvlK2rZN/J
 YWy89TD07BAVCS5UAW/GbFNVpAsJBrhPLi8fw4YZbIz7/S0ThGNJywbEktsF+c7up1Ui
 5hMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=91qa2V3ADLkVZ93Ejl4u/cWja6JFjs7BLRXshFe5jJU=;
 b=N+szm5jAuh0ASvj3GbWI1HOcAS7jvSfu/Ob5HHmy/x15vF2Mode1mhiOa3799wPk+A
 l8PfWMtohURyTj3PjXXA+4KdXXOFf1s757YRXnCmM+nGkUl0fD6sbbxFDZX2HK7+TZN9
 JfFjRmLJabw7hP1p6hAe1bYyWvnjYb1de/18aLKiq2QwiG4IOfbfTn/mJUCDKvznwGgl
 aiQldK562W7dXMifZbRfXqru2hXuuAPPs/2qvdUBl/NfXtJt7c5uCWHkzewVnKsA81Pc
 eEnlFk1aKgZa8VYLrb3SHQRSZZUOXL6k0xfsxCRaD/qx773pIok0O/245jDJ+lK6v066
 DiGw==
X-Gm-Message-State: AOAM533xmWV6bVNAiXP/OLmMtYB/8e/tpsXs7HK3HRsCp/bLb69XTGKp
 I0fSNya4zMIqL141dJbyksGQSxy/o7PLpE1IGAn6+L7CyxOeVQ==
X-Google-Smtp-Source: ABdhPJxW1KNzu0HAhdfeemIAiUAhc/ZiQ1/1QtGNgn22Gl7C2oKqOUbL9SvfnLyiD2fJCfw6Cx2mlZrP2o8bp1rpp9E=
X-Received: by 2002:a05:6902:704:b0:64d:f270:22b0 with SMTP id
 k4-20020a056902070400b0064df27022b0mr36943301ybt.626.1653595692147; Thu, 26
 May 2022 13:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220506123246.21788-1-yuehaibing@huawei.com>
 <CACRpkdZUwfVNZyS6RgcupJ+TRUZVM+1_3ABj_-f_3+v+wNE6mg@mail.gmail.com>
 <CACRpkdaKrk+cj9Yvpe3kmR1iJFczi-yckHiKeLGu9F=hRFiU9w@mail.gmail.com>
 <CAA8EJpq7_V7mZbN+G5fZdK0a4kTcxROAd_bGJtQ5mhzdYr6pNQ@mail.gmail.com>
In-Reply-To: <CAA8EJpq7_V7mZbN+G5fZdK0a4kTcxROAd_bGJtQ5mhzdYr6pNQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 26 May 2022 22:08:00 +0200
Message-ID: <CACRpkdYATkP2ONCxHq6+XsWM8949tXxd5r=OKM36dgwWp3Sxgg@mail.gmail.com>
Subject: Re: [PATCH v2 -next] drm/display: Fix build error without CONFIG_OF
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
Cc: airlied@linux.ie, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 25, 2022 at 3:36 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> On Mon, 23 May 2022 at 15:55, Linus Walleij <linus.walleij@linaro.org> wrote:

> > Nope, failed:
> >
> > $ dim push-branch drm-misc-next
> > dim: ac890b9eeb9b ("drm/display: Fix build error without CONFIG_OF"):
> > Fixes: SHA1 in not pointing at an ancestor:
> > dim:     f5d01644921b ("drm/msm: select DRM_DP_AUX_BUS for the AUX bus support")
> > dim: ERROR: issues in commits detected, aborting
> >
> > I don't know what to do with this, sorry. The other committers are maybe better
> > with this kind of situations. I think it is designed to stop me from
> > shooting myself
> > in the foot.
>
> Linus, can we get an ack from you (or anybody else from DRM core) to
> merge it through drm/msm tree?

Acked-by: Linus Walleij <linus.walleij@linaro.org>

> After a second thought, I think the patch contains wrong Fixes tag. It
> should be:
>
> Fixes: 1e0f66420b13 ("drm/display: Introduce a DRM display-helper module")
>
> With that in place would we be able to merge it through drm-misc? Does
> it needs to be resubmitted?

But it doesn't apply to drm-misc... that's my problem :/

Yours,
Linus Walleij
