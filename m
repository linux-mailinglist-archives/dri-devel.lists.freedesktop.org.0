Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CA4524231
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 03:41:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C6E10F1C0;
	Thu, 12 May 2022 01:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B58CE10F1C4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 01:41:22 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 q73-20020a4a334c000000b0035eb110dd0dso1870449ooq.10
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 18:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=rLjJ0ObXm/eG6uFPnmb+hbYQUbWPG5VcdG3gBpulpjA=;
 b=Oy2qCbFWbhJBsSdixvgT7G4jo+4gIjzNLWF7oRirqts3owtmixSElnXy9clxneyVgm
 HRrQZFgEeFiNNneI+TEcUmiy++apz0RYXUvUefMNmFGlbzAbCV7XPcCCNhhsaM4zVQNe
 RSD7V/WP159ERvRINmvoLgqVSgcceUwIGHH/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=rLjJ0ObXm/eG6uFPnmb+hbYQUbWPG5VcdG3gBpulpjA=;
 b=XWs9aMwy+/jcbN4/a1Whdlr9XJ8CpUCKvWvE4U3VwDa2N/WgdEbTq8ZyW68sO/Iu+5
 gusvSL8/DxcLROYILZZLOhwX1n8vdJQtMYD8Ufu/HCxiw7UW6/qFnfyKKGbCswk/iteY
 /SSvkYWalucG3SinYDSBWxmbacIwAjpMtoDef9u3arVkXZ/OX9LVFbcib/rcS93LEK/f
 l2p8f1s9gnr2Cg72ObjOXG+owtD8kJntUTGz9iBzBmam56M+PNRykb8+JwWe7J2XoV3d
 TvuVeNxp6cZ2xaPMYyoYIAXK3fY4Rp5KnSm9SgxxXfu3FiPNup1fp2IX12rEwzjPdBbM
 mkXA==
X-Gm-Message-State: AOAM531fWjnHIvyKi7SfxMyIda4FuOjdbvp5w7xDgyzh4YkwfRLAxzJ5
 PmqGljbOnX2R4C22fDm0o5ss/2kzTbjLUUXaT/vkWg==
X-Google-Smtp-Source: ABdhPJzMsinqtg+1aVXUb6CHbZyRBCYcDG6Dhx4Pikw/1PbPWqg/iWQaAJtoxWKqcuORKe4t/jiMxSg0p15gnHkqdUs=
X-Received: by 2002:a4a:6f49:0:b0:35e:1902:1d3b with SMTP id
 i9-20020a4a6f49000000b0035e19021d3bmr10874934oof.1.1652319681985; Wed, 11 May
 2022 18:41:21 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 May 2022 18:41:21 -0700
MIME-Version: 1.0
In-Reply-To: <d6509c64-3a3e-f13b-6a3f-06f50c427eaf@linaro.org>
References: <20220507010021.1667700-1-dmitry.baryshkov@linaro.org>
 <CAE-0n50tgiNj6j8+90xNw2Sku7rHKOGQYrHRjHCHb8-rqnOAxg@mail.gmail.com>
 <CAA8EJpqFksVc+Lj4-G81z26GH-WbQ3CKOUwgsx0Xar-F+EMNRg@mail.gmail.com>
 <CAE-0n51KAdQHvpgon6-qpLXZT7X8ghZ+9bSeTji-duMOG2wYiQ@mail.gmail.com>
 <d6509c64-3a3e-f13b-6a3f-06f50c427eaf@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 11 May 2022 18:41:21 -0700
Message-ID: <CAE-0n51Bt6VKJb4RjFfNUJVpWu=3jZs7Ym++7oa+-uvMf=hfWA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm: don't free the IRQ if it was not requested
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-05-11 18:30:55)
> On 12/05/2022 04:29, Stephen Boyd wrote:
> > Quoting Dmitry Baryshkov (2022-05-11 18:01:31)
> >> On Thu, 12 May 2022 at 03:54, Stephen Boyd <swboyd@chromium.org> wrote:
> >>>
> >>> Quoting Dmitry Baryshkov (2022-05-06 18:00:20)
> >>>
> >>> Does this supersede commit 01013ba9bbdd ("drm/msm/disp/dpu1: avoid
> >>> clearing hw interrupts if hw_intr is null during drm uninit")? I mean
> >>> that with this patch applied kms->irq_requested makes the check in
> >>> dpu_core_irq_uninstall() irrelevant because it isn't called anymore?
> >>
> >> Yes.
> >>
> >
> > I didn't see it deleted in the second patch so is a revert going to be
> > sent?
>
> No need to. They are separate checks. The older one is superseded (as it
> will be never hit),  but it is still valid and useful (to protect from
> the crash if this code changes again).
>

Ew, gross. The extra conditionals everywhere really makes it hard to
follow along.
