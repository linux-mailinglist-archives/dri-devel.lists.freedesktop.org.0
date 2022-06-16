Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF9F54DA77
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 08:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B162811203E;
	Thu, 16 Jun 2022 06:22:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3FA10E824
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 06:22:08 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id i19so830009qvu.13
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 23:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AwX2v3GvBjCHxv3HpGCZJrlA5KGiCGxp7JG111T+eG8=;
 b=kvC2oU/9J03LQcOkHpQte/q21niXGnkWJQm9SLMJlHr0YM+7mNbm001k1PqoPeCLoy
 F2nxiF4fVFdl7bFykZU+vppRWPVJEA0HCHEvFmUcGLNQ3DdPP6j611t2imYANbszBAgr
 lZFkjsJ+w0bg0lhbhhaAQpO7AM8FRGqpn5icP77rU2+QK89o4i8YM8LCSR5Jn9GLDBJT
 c6Bds9s2pIQB1DK2+np9H1ZB1xquZAjWMiKE1P5E0ODmBHj1vPutnNvWCWF+hd5F7SB4
 ZD0B9UmV18AaNX+eiiaXGwuPre9prv35h2CFzBnPaNwy3mpOimunFDbvjkUPJ5VJLeoW
 A3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AwX2v3GvBjCHxv3HpGCZJrlA5KGiCGxp7JG111T+eG8=;
 b=Ji6B1ajoKtHGbf/gmTOAvdXvCSBMb+Aw/NK0wD1z8I0YG5FUgAKNRSHuUJR4MaTK98
 CbXCrGu+9tAEkSHUP7U3zpOzypns5jTYIAT4zXhuaTRGiZDPHO1md4gbyXWXgfas12zF
 GOL2w5lxm6REbet7HMd7i5o7MOhODS0ONYAq/Qg/+6Jlv4x42GyrUZrtdF41LAVNW3Gm
 stNrfPdu0zOK3X2bLe3HnFz9+eaa8daIO7JaYQT4OYCr5t8qgRDujnnRjU0vZcHYpye7
 Nc7f/y1lPFhZd4Q7Oh008o2YlkDjgLGUbOTJ+K1s21VqrX+4vBjM4UqfpOPvNnWVEwwp
 KWNg==
X-Gm-Message-State: AJIora9PIxk27xvHgHyqbGkGd1GZxwmZFcYDbFqJm8UgVLnWbk1umBBN
 ShXB6gxSKedG/8/lEZK1b3KN8FcUkyk5qpF0TFESuA==
X-Google-Smtp-Source: AGRyM1u2NnNuO0ojKmmx4K0NcVBebrNp0mvUgGFCu1QuYBA5uXhb7SJvKSRoJnwBGWK4c4XxvET3c17qIkemc3mMhjc=
X-Received: by 2002:a05:6214:5488:b0:46b:b272:f7d1 with SMTP id
 lg8-20020a056214548800b0046bb272f7d1mr2706585qvb.73.1655360527384; Wed, 15
 Jun 2022 23:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <1655235140-16424-1-git-send-email-quic_abhinavk@quicinc.com>
 <82b09d4d-1985-519e-3657-0d15e07ccc2f@linaro.org>
 <5b35ee5a-ed94-1440-cdc2-909a82c3aa61@quicinc.com>
 <CAE-0n50gNX6XP2O9FJVJB135YUGhi5e8Gqb1FAxj20YQSvumuQ@mail.gmail.com>
In-Reply-To: <CAE-0n50gNX6XP2O9FJVJB135YUGhi5e8Gqb1FAxj20YQSvumuQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 16 Jun 2022 09:21:56 +0300
Message-ID: <CAA8EJpq1Td71FwBP5saYTAnS5zK28om+2C79aMPii06ui2JR+w@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/msm/dpu: move intf and wb assignment to
 dpu_encoder_setup_display()
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, quic_jesszhan@quicinc.com, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Jun 2022 at 09:18, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Abhinav Kumar (2022-06-15 22:59:25)
> > Hi Dmitry
> >
> > On 6/15/2022 10:55 PM, Dmitry Baryshkov wrote:
> > > On 14/06/2022 22:32, Abhinav Kumar wrote:
> > >> intf and wb resources are not dependent on the rm global
> > >> state so need not be allocated during dpu_encoder_virt_atomic_mode_set().
> > >>
> > >> Move the allocation of intf and wb resources to
> > >> dpu_encoder_setup_display()
> > >> so that we can utilize the hw caps even during atomic_check() phase.
> > >>
> > >> Since dpu_encoder_setup_display() already has protection against
> > >> setting invalid intf_idx and wb_idx, these checks can now
> > >> be dropped as well.
> > >>
> > >> Fixes: e02a559a720f ("make changes to dpu_encoder to support virtual
> > >> encoder")
> > >
> > > Please adjust the Fixes tags in all three commits. I didn't notice this
> > > beforehand and Stephen has complained.
>
> I think Stephen is Stephen Rothwell.

Ugh, yes. Please excuse me. My brain didn't kick in to notice the name
aliasing issue.

> > Is something wrong with the tag? Format and hash looked right to me.
>
>         $ git config pretty.fixes
>         Fixes: %h ("%s")
>         $ git help fixes
>         'fixes' is aliased to 'show -s --pretty=fixes'
>         $ git fixes e02a559a720f
>         Fixes: e02a559a720f ("drm/msm/dpu: make changes to dpu_encoder to
> support virtual encoder")
>
> it's missing the drm/msm/dpu prefix.

I have more or less the same setup using a longer format and using the
git-log instead of git-show. This way I can just do a git fixes
drivers/gpu/drm/msm and spot the commit in question.

[pretty]
        fixes = %C(auto)commit %H%Creset%nFixes: %h (\"%s\")%nAuthor:
%aN <%aE>%nDate: %aD%nComitter-Date: %cD%n%n%w(0,4,4)%b

-- 
With best wishes
Dmitry
