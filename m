Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1179752B1C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 21:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A106610E77C;
	Thu, 13 Jul 2023 19:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823CF10E77C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 19:40:26 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6b7206f106cso863521a34.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 12:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689277225; x=1689882025;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DX1Gj8EBXXoZzKq8yFIL6/gLwQcq/eP050VPNOLcr5k=;
 b=d+3IoseYtGQOjFRFOIFKJ45KID+DSbVNElMv9SN/sZUvkets/C0mMbJPNt2jEV+nqt
 8OSNRc8l1e30bLkl764W0+juLXJbCATuVKHzTRi5rEHQJGXBD0rPWCu9UCyWH5pC3dbP
 OH/0pO/+PJQzdX5aKdLJE7EovJ6J9GR5Kb2WfYPfWJkL+E6pKAwC8GTo2NiWw7mtdB4T
 feQuRxNNlhSpsHd2I66mlyU/xVgiwYE2bj/0MNxIycMqJG0M5kusYNwJgMihPICVbYBG
 924Oghoi3zDnaYR51nBWkfyMBk5YbwOkSPXYXYERRaHUA2wje7cR7NBnXP/DvVP+g53N
 62mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689277225; x=1689882025;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DX1Gj8EBXXoZzKq8yFIL6/gLwQcq/eP050VPNOLcr5k=;
 b=lOxSsVEoYKaYMHey3IBXYis42ZQiJgatCQJx9Zbhan9v9qMAv5I8Dpz7BxslFbnkbX
 2asJ8B5f5kAEmZkBxIU1ZrqJZDaPrAWoBz0jLBKZM9tvHZy6Epc/ywdihlCXq2B6mzDi
 Ocr+GFpo0vKjzJ0148TajKy9Q5MvBS8zWZgq2kRBEAMvdPDuCL/zSdSRsr4Fq/QmVzC6
 jIXO3Ozuw0mNRCRh2yDxC0No3y+NYra19OLZ9FC8XMXxLQ4YBeGB9cV5QAIJ/J6Zb5CI
 9BfbFznaduaKjtO0awq9NKLmV9wAYedaPpJVnXzQraVIC+kJW+6uQ7DnGBPpRq17A9L0
 pfwQ==
X-Gm-Message-State: ABy/qLamuZTSgDEpp1hDqk9atf10eJshdhgDwOryJiToO493aFvUrN7z
 DQIIt0C7GRwEjkWOmNAqU81WMerVLBr1ncbDa1gByw==
X-Google-Smtp-Source: APBJJlE4geAWgF/c1eSajBp9xhwr1InENP1uaHmvwsBe5xFcZ1TuvNARD6AuNScP0D+MkTip7O/mXlKTUD7UcVFFl1k=
X-Received: by 2002:a9d:6a50:0:b0:6b9:9288:613c with SMTP id
 h16-20020a9d6a50000000b006b99288613cmr3086600otn.13.1689277225502; Thu, 13
 Jul 2023 12:40:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230713020556.1956639-1-cuigaosheng1@huawei.com>
 <20230713020556.1956639-3-cuigaosheng1@huawei.com>
 <gk5ttqzmz6psggq6xybpsmad63gimlwj6bsbpkhvqfd3htcddc@zveituq6siwa>
In-Reply-To: <gk5ttqzmz6psggq6xybpsmad63gimlwj6bsbpkhvqfd3htcddc@zveituq6siwa>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Jul 2023 22:40:14 +0300
Message-ID: <CAA8EJpou=nm54hETj3m3c75Vq9nhTdCKVviXi4C3-PGv7J8s6g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/msm: Fix IS_ERR() vs NULL check in
 a5xx_submit_in_rb()
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
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
Cc: sean@poorly.run, neil.armstrong@linaro.org, quic_eberman@quicinc.com,
 sam@ravnborg.org, quic_gurus@quicinc.com, g@akhilpo-linux.qualcomm.com,
 linux-arm-msm@vger.kernel.org, a39.skl@gmail.com, liviu.dudau@arm.com,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 james.qian.wang@arm.com, angelogioacchino.delregno@somainline.org,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org,
 Gaosheng Cui <cuigaosheng1@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 13 Jul 2023 at 22:08, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> On Thu, Jul 13, 2023 at 10:05:55AM +0800, Gaosheng Cui wrote:
> >
> > The msm_gem_get_vaddr() returns an ERR_PTR() on failure, we should
> > use IS_ERR() to check the return value.
> >
> > Fixes: 6a8bd08d0465 ("drm/msm: add sudo flag to submit ioctl")
> > Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> > Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > index a99310b68793..a499e3b350fc 100644
> > --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > @@ -89,7 +89,7 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit
> >                        * since we've already mapped it once in
> >                        * submit_reloc()
> >                        */
> > -                     if (WARN_ON(!ptr))
> > +                     if (WARN_ON(IS_ERR(ptr)))
> nit: can we make this IS_ERR_OR_NULL() check to retain the current
> validation? A null is catastrophic here. Yeah, I see that the current
> implementation of ...get_vaddr() doesn't return a NULL.

I generally dislike IS_ERR_OR_NULL, as it is always (incorrectly)
paired with PTR_ERR. But in the case of void return it would be a
perfect fit.

>
> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>
> -Akhil
>
> >                               return;
> >
> >                       for (i = 0; i < dwords; i++) {
> > --
> > 2.25.1
> >



-- 
With best wishes
Dmitry
