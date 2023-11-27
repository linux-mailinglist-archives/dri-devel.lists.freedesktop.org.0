Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BB37FAE3A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 00:17:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4BBE10E319;
	Mon, 27 Nov 2023 23:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E7E10E319
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 23:17:47 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-5a877e0f0d8so44239627b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 15:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701127066; x=1701731866; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8iD+osMJH4miMmYt9ABPXwXzud5eZygTeF+Khzq6tJ8=;
 b=rzllx5OhkUa9ojuMOV5Tll10XUrITc8L6fCM3jL86OwOWqSCfl9WaymIvXqqLMkvLL
 Mp78mHVVXYBF+hfjj6+tYbc5/bWbOpJbusDQfdRXqxWP0Qg7j87uVtIXjnZJIg/dgV8Q
 C/VZEpTr/yKSKRJHZCplxv+7nhd7ee2fL3xnfGKfloJMyGnHFe1l8flx/2Jc7BHESFhV
 gXQ9/1U81IaYxZ9Gc8NvdL3sGcTmx9/Y2YyhRQvbjul3P4sLAqrwapsnlJhOk0gcMdKo
 fHyTU3xcacGYIpFDdPQ72hWwwtz7+JaYnLprDHF0vIXXyxszHqsY2Rd6Kc1BZVc30Nyn
 l8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701127066; x=1701731866;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8iD+osMJH4miMmYt9ABPXwXzud5eZygTeF+Khzq6tJ8=;
 b=XDbYzrekrzVGu0qX2/6vGa8U7lNCG9sdnlcBZeGDoBuidjPrdIQ9o4sh5WOchH3I8D
 0I3ifOyyVldOu0wy06J///B6eOKYAJO9CSMl7MGPiyFWsaXiRIosXqEoGaUy9ZNNEt0i
 f9Tc83C0KLA2bhG5AfrLBqirgIvaNPYm4it0na+1E1EoAEqbXasmMM81X6JwR5yrVX/t
 cOoMT3ACOK/J32KOueF0sKGb1SwarHUkBDrGS9RdrxGh3xdMkkYpeDJq+8FtHCz5vzLH
 jSSv3GrvF3t0FtELFZ1BtBC/QLzXRb2neTVH6aIzY++NoS84v7wAHr4oSdfzHgQ3acpU
 ZhkA==
X-Gm-Message-State: AOJu0YyRLX+ACfEC3FuysQ+f2xkrxyCXI7RZSK7XeZ4c/bP4eIv8EsGY
 Q7tX7M3vHL74tyR9u3n9zbNbcTDGzdeMoyZxrgJi2g==
X-Google-Smtp-Source: AGHT+IGt0klIWrzaFcrbKa/sHaNCkRqwr4aenl7fiamwe5np9aLxr58NKslxaAawBwEHn9aDhfp9afP2HS3lr6Ny8yM=
X-Received: by 2002:a05:690c:2886:b0:5d0:11b:e9c3 with SMTP id
 ee6-20020a05690c288600b005d0011be9c3mr4765613ywb.7.1701127066496; Mon, 27 Nov
 2023 15:17:46 -0800 (PST)
MIME-Version: 1.0
References: <20231127215401.4064128-1-dmitry.baryshkov@linaro.org>
 <60dc2b72-188f-7b6e-4e14-b90f10997a44@quicinc.com>
In-Reply-To: <60dc2b72-188f-7b6e-4e14-b90f10997a44@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 Nov 2023 01:17:35 +0200
Message-ID: <CAA8EJpoKOPVLC9n_2MC2Es7XssEs5G5O4ESJ_-krA8aGG_fb0Q@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/mdp4: flush vblank event on disable
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 28 Nov 2023 at 00:00, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 11/27/2023 1:54 PM, Dmitry Baryshkov wrote:
> > Flush queued events when disabling the crtc. This avoids timeouts when
> > we come back and wait for dependencies (like the previous frame's
> > flip_done).
> >
> > Fixes: c8afe684c95c ("drm/msm: basic KMS driver for snapdragon")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c | 9 +++++++++
> >   1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> > index 169f9de4a12a..3100957225a7 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> > @@ -269,6 +269,7 @@ static void mdp4_crtc_atomic_disable(struct drm_crtc *crtc,
> >   {
> >       struct mdp4_crtc *mdp4_crtc = to_mdp4_crtc(crtc);
> >       struct mdp4_kms *mdp4_kms = get_kms(crtc);
> > +     unsigned long flags;
> >
> >       DBG("%s", mdp4_crtc->name);
> >
> > @@ -281,6 +282,14 @@ static void mdp4_crtc_atomic_disable(struct drm_crtc *crtc,
> >       mdp_irq_unregister(&mdp4_kms->base, &mdp4_crtc->err);
> >       mdp4_disable(mdp4_kms);
> >
> > +     if (crtc->state->event && !crtc->state->active) {
> > +             WARN_ON(mdp4_crtc->event);
>
> Do you need a WARN_ON() here? Just wondering how often this might happen
> and spam.

Well, it is atomic_disable(), so it happens only on modesets or output
disable. Also, this is a port of mdp5 code, see commit e765ea77b0fd
("drm/msm: Issue queued events when disabling crtc"). We don't have
reports from MDP5 code, so there should be no comparable reports for
MDP4.

> otherwise LGTM.
>
> > +             spin_lock_irqsave(&mdp4_kms->dev->event_lock, flags);
> > +             drm_crtc_send_vblank_event(crtc, crtc->state->event);
> > +             crtc->state->event = NULL;
> > +             spin_unlock_irqrestore(&mdp4_kms->dev->event_lock, flags);
> > +     }
> > +
> >       mdp4_crtc->enabled = false;
> >   }
> >



-- 
With best wishes
Dmitry
