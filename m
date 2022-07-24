Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2533157F6C6
	for <lists+dri-devel@lfdr.de>; Sun, 24 Jul 2022 22:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB8C112183;
	Sun, 24 Jul 2022 20:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F1D38BFE9
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jul 2022 20:10:34 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id mn11so2719481qvb.9
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jul 2022 13:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9NQyh2bs88XAyOOdXIMOFXmDnOwmGl1o/0rUMi4/QHQ=;
 b=PTRW02txEXSRXk8Xo1Q2TayCDLjbCuulOWRBmQ5t7Qi4FjCMoPit1qMWO0hbUeK56c
 E64UPS1q/n68EwFHdAiCJyjc0At5jFUT4KhA6iRj6vQXkW6SGSGmU6wqFlcjqppswMx6
 D5L1diBp31p8SEVf5tD7KLA2sOMQBmlTkWpj+3xA1MEySDiFWsc1koRhLM18/EQn5dk6
 DYdZUug9O7n5Kso9Uxz6878taL42QEbsQxBW36fflVmEqBfd5rmLTTmqWGUyyiMR93vd
 rYsZus7SMgWJsypemqb6MYdM/EW9zEt4PzrK41q4LXNfXv2cqF9PhI/PiSFw2i+H9bv1
 I/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9NQyh2bs88XAyOOdXIMOFXmDnOwmGl1o/0rUMi4/QHQ=;
 b=6VJNt8yNpKw7HBVBY4KTWNMgW/3uNCeGXEjTzKyZ+zT1CuwGS+cz9OhSuk2FEktDMJ
 PP/aSOi8GC0/JZr0Uqv8BMoQ8JnE0j6lycn3hKHm2/DUkrLb9z+RMr470aEwYpVwK2+A
 Ds7jBjUOaseJvsHJCJeV/I/BLk+OLvMayWoyr22BEcHWkbkgNMQdsSecngJRlnAAi+TB
 eAt7CeXvKEnpooITwtyD1oKiGctignL75Dt5AE6x3y86wAlo+Gk853JDP6qQNdFbW1et
 Z7trbj99FoYQuyLKIrRSpvElNld4hYX3eBib1dw7Aw2jGcSgq+e2S5vniQEqpi0Kgllx
 gDsg==
X-Gm-Message-State: AJIora/aaIda2O4l2oYQSV7Djc3YP5EprdPZO71W1qspRY7+fcnmlJ+l
 jAyf17fLO48r69wvZ1dVVKcI8fIxJgzwvwAcSV7ZCg==
X-Google-Smtp-Source: AGRyM1v7WhO0L7GbCrccVmyoYUn068LyDJDUELP+QZpK71QGYLNkxFlkoRfB9mBp1JKXkq9msK6IFtm0la5TZjy7Rus=
X-Received: by 2002:a0c:8ecc:0:b0:473:2fa4:df7c with SMTP id
 y12-20020a0c8ecc000000b004732fa4df7cmr7835949qvb.55.1658693433038; Sun, 24
 Jul 2022 13:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220724111327.1195693-1-javierm@redhat.com>
 <CAA8EJppEpPe4nfZ_kvNen6shSvgyUoL3adSQfhhCGCS2VmVZhQ@mail.gmail.com>
 <6b3f98db-83bf-41cd-b23d-79b455a06ebd@redhat.com>
 <630a6654-0305-f3a8-e062-f13a0074d35a@redhat.com>
In-Reply-To: <630a6654-0305-f3a8-e062-f13a0074d35a@redhat.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 24 Jul 2022 23:10:21 +0300
Message-ID: <CAA8EJpr1xf9mkfT-FhK9M58syMnWCFXozWHH9L_gxtXOqgh0yw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: Make .remove and .shutdown HW shutdown
 consistent
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 24 Jul 2022 at 22:51, Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> On 7/24/22 20:47, Javier Martinez Canillas wrote:
> > Hello Dmitry,
>
> [...]
>
> >> Now there is no point in having this as a separate function. Could you
> >
> > The only reason why I kept this was to avoid duplicating the same comment
> > in two places. I thought that an inline function would be better than that.
> >
> >> please inline it?
> >>
>
> Or do you mean inline it as dropping the wrapper helper and just call to
> drm_atomic_helper_shutdown() in both callbacks ? I'm OK with that but as
> mentioned then we should probably have to duplicate the comment.
>
> Since is marked as inline anyways, the resulting code should be the same.

Yes, I'd like for you to drop the wrapper. I'm fine with duplicating
the comment, since it will be in place where it matters (before
checking ddev->registered) rather than just stating the contract for
the wrapper (which can be easily ignored).

(And yes, I do read patches and commit messages before commenting.)

-- 
With best wishes
Dmitry
