Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 160E14465B7
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 16:29:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338B86E8C2;
	Fri,  5 Nov 2021 15:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FFB46E8C2
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 15:29:38 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id k1so9805400ilo.7
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Nov 2021 08:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/UkXJV0OUTVeSB3ZWIvuOW6MEyDXb/nfPaZn/YUVDEM=;
 b=I+rltgFifRvQNsNZIVeUD++Ek0yxbA4Jl5XK/KgCoQHB3uXJ8aLeXftGBqi9z/1Kuq
 MrjVCYOIOTp1QVbJQjt9kamQzE5JQsSUgT9ZljMvlaMnRakZuA3oNlpOPB30kGsPPok2
 fCU4eyoVqWvjDFsRlugQxg0PBjBNFQMCQoCjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/UkXJV0OUTVeSB3ZWIvuOW6MEyDXb/nfPaZn/YUVDEM=;
 b=bFRe1uW7i62hsl+mfuXxOmCo3jfEaBZTwuR+1gWS+zaa4/ojPK3KYtDkn/1Yt3BnCa
 WTYaeyyhSOyrRASbDVdkSpKeLWJhy9QvrYrqgQkjRW59vdDoXK5DA7UT8A0zLqE98mFR
 s1o5vGqVX7ASPT9Sf1TLHt6NSU5VX3JCXI5fXLM+IVgnDSIKcmA13EaqW+KbNewp5zGV
 TxxatqphuKqnWIkqV3rEM006kah7F2tWajVTS6giqiQJUaxIYRFJgFYmu9+tvkRB1QUI
 v8DmNY3aJunqqWcZGHhGyzFnT/ckaRoQqssJRggJjZZByYfSSsrQjet1hqoKbHKAYIha
 ACkA==
X-Gm-Message-State: AOAM531QUyiCS/Nko6zeGYuKVMxgQNrPrNW6SNFN1TtAe8o5IEAtNzov
 I2p9uuz+jQzcR71ElXhKu4xnVedZledZsw==
X-Google-Smtp-Source: ABdhPJw8i2fN+qccdij2zjHDeBwShXmHSHjeO1/cPaazseynUBUxW8UnAbep80/dkN2kN8FWVypfOw==
X-Received: by 2002:a05:6e02:1521:: with SMTP id
 i1mr24665010ilu.101.1636126177213; 
 Fri, 05 Nov 2021 08:29:37 -0700 (PDT)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com.
 [209.85.166.48])
 by smtp.gmail.com with ESMTPSA id i4sm5059888ilm.9.2021.11.05.08.29.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 08:29:35 -0700 (PDT)
Received: by mail-io1-f48.google.com with SMTP id c206so9618762iof.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Nov 2021 08:29:35 -0700 (PDT)
X-Received: by 2002:a05:6638:c49:: with SMTP id
 g9mr9752326jal.54.1636126175216; 
 Fri, 05 Nov 2021 08:29:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211104222840.781314-1-robdclark@gmail.com>
 <be2222e2-8fec-84f9-bbcf-bf639a1a63bd@kali.org>
In-Reply-To: <be2222e2-8fec-84f9-bbcf-bf639a1a63bd@kali.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 5 Nov 2021 08:29:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WnTsdU0TzbbFhRzoYtiX6-HG+g=OHiu1LP+tODPGXZKQ@mail.gmail.com>
Message-ID: <CAD=FV=WnTsdU0TzbbFhRzoYtiX6-HG+g=OHiu1LP+tODPGXZKQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/devfreq: Fix OPP refcnt leak
To: Steev Klimaszewski <steev@kali.org>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Nov 4, 2021 at 9:32 PM Steev Klimaszewski <steev@kali.org> wrote:
>
>
> On 11/4/21 5:28 PM, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Reported-by: Douglas Anderson <dianders@chromium.org>
> > Fixes: 9bc95570175a ("drm/msm: Devfreq tuning")
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/msm_gpu_devfreq.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> > index d32b729b4616..9bf8600b6eea 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> > @@ -20,8 +20,6 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
> >       struct msm_gpu *gpu = dev_to_gpu(dev);
> >       struct dev_pm_opp *opp;
> >
> > -     opp = devfreq_recommended_opp(dev, freq, flags);
> > -
> >       /*
> >        * If the GPU is idle, devfreq is not aware, so just ignore
> >        * it's requests
> > @@ -31,6 +29,8 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
> >               return 0;
> >       }
> >
> > +     opp = devfreq_recommended_opp(dev, freq, flags);
> > +
> >       if (IS_ERR(opp))
> >               return PTR_ERR(opp);
> >
>
> Testing this here on the Lenovo Yoga C630, and I'm starting to see in my
> dmesg output
>
> [   36.337061] devfreq 5000000.gpu: Couldn't update frequency transition
> information.
> [   36.388122] devfreq 5000000.gpu: Couldn't update frequency transition
> information.

Ah, I think this makes sense. We're now storing a frequency which
might not match an actual "opp" and I suppose that we must return it
in some cases.

I guess a simple fix is to still call devfreq_recommended_opp() in the
idle case but just call dev_pm_opp_put() to fix the leak.

-Doug
