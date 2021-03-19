Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAE3341FEE
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 15:44:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2E26EA32;
	Fri, 19 Mar 2021 14:44:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 561E96EA33;
 Fri, 19 Mar 2021 14:44:49 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id t9so9357135wrn.11;
 Fri, 19 Mar 2021 07:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aoA5tf0GuXXI+tYehfknPh/CinyOHHXvGycSwmOWV6U=;
 b=SE6jiw6/KOeKjqbFrwXeOcbFgAIAeL20+UhrXgkSZwYcieoXo7X/q//43L48nDoQln
 j48/V+x0E4hLlO8V7ZS/YCtmvsh60EVI7AEek6nK6Ffyz0GkFeSF+ER+0zZy06/vAF8e
 d853rMAvzi5sp61lUG6vGFhPR5iuRooCya6LuVpEKjuhZ1YHzkQnsyxmyicQxoLj0ort
 PdOAiXlaOBlK4buQrtQtf38QTE+BFdLXcnKgQaZqJGBdeqD8UegJvj/F7sDRTWHysuoV
 X+sUCJw7YjF9xAyqN0sych61qoaTfwhtuF9AAAJ4QYdJse8MsTI19CBrxvtsQ/dn1J3N
 u2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aoA5tf0GuXXI+tYehfknPh/CinyOHHXvGycSwmOWV6U=;
 b=EpmNXVnsZpCFYhXPagC/uLpPoyOH5QHSVkjiGPWLhO/nosyW+nRolgvtXCXH0te385
 oQ05wDrKkPP6tYtQsNi7XBVnJWck51t96+YBrCFVRHJ8MhuMK4BHtE0RgBkoU929Qk3G
 wsLKtYHd4VZCTGimYH2k8MfwxGSh3ZPxuOpO8xWGaSSkqZ3EKsO0naNiIzHumqmafgHI
 Pddrtwcc/MaiiF6J0OoWoznb0+UOu/WyMobf9MUnvWFm4e2AsuDb6BDZW4p7qkOA5gO4
 7BaNtur5mkKf45Dm4tWjESrgai7QTeaRDkLoc/vxz/X8BJwXbDMsZ3CRJP+o3+dgiagH
 XojQ==
X-Gm-Message-State: AOAM530QrXtsbzts8F8/NebHJFEY+f/mLSLcXwrkQbLA9fDdRLxngUiH
 XSzt5t7m+XVvSA5L4UjSemjVWg8aZ2SbEApsftw=
X-Google-Smtp-Source: ABdhPJwF/ZP1XE3jOliuzyxtyE+s2gp3DriuVOeO6ryYMPBGwclLGu7uPtr4UPvtTrHfi2aafpOocaR4c9e3ATavNEo=
X-Received: by 2002:adf:f587:: with SMTP id f7mr4928235wro.147.1616165087988; 
 Fri, 19 Mar 2021 07:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210301214152.1805737-1-dmitry.baryshkov@linaro.org>
 <CAOMZO5Br85sf+ndiOWzeG7DgpqVHpXtnNGZLsVMOpBC5eVE2Aw@mail.gmail.com>
In-Reply-To: <CAOMZO5Br85sf+ndiOWzeG7DgpqVHpXtnNGZLsVMOpBC5eVE2Aw@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 19 Mar 2021 07:47:59 -0700
Message-ID: <CAF6AEGtYJegOPt4dju5wyzp+WEhXdKyeUbkoO-oDzSC2aR_9ZQ@mail.gmail.com>
Subject: Re: [PATCH] gpu/drm/msm: fix shutdown hook in case GPU components
 failed to bind
To: Fabio Estevam <festevam@gmail.com>
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 19, 2021 at 5:09 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Dmitry,
>
> On Mon, Mar 1, 2021 at 6:41 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>
> > diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> > index 6a326761dc4a..2fd0cf6421ad 100644
> > --- a/drivers/gpu/drm/msm/msm_atomic.c
> > +++ b/drivers/gpu/drm/msm/msm_atomic.c
> > @@ -207,7 +207,12 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
> >         struct msm_kms *kms = priv->kms;
> >         struct drm_crtc *async_crtc = NULL;
> >         unsigned crtc_mask = get_crtc_mask(state);
> > -       bool async = kms->funcs->vsync_time &&
> > +       bool async;
> > +
> > +       if (!kms)
> > +               return;
> > +
> > +       async = kms->funcs->vsync_time &&
> >                         can_do_async(state, &async_crtc);
>
> I also see the same issue on a i.MX53:
> https://lists.freedesktop.org/archives/freedreno/2021-January/009369.html
>
> Then I got a different suggestion from Rob. Please check:
>
> https://www.spinics.net/lists/dri-devel/msg286648.html
> and
> https://www.spinics.net/lists/dri-devel/msg286649.html
>
> Does this series fix the issue in your platform too?

I think that might not help if something fails to probe due to (for
example) a missing dependency, so !priv->kms is probably a better
check to cover both cases.  But the 2nd patch makes a good point, that
the suspend/resume path probably needs the same treatment

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
