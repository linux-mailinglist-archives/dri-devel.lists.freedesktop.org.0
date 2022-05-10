Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA230522330
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 19:54:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EBE510E64F;
	Tue, 10 May 2022 17:54:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2B510E64F;
 Tue, 10 May 2022 17:54:34 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id x18so24912949wrc.0;
 Tue, 10 May 2022 10:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B9zGmm9uit0zU6DRJerw26Jq0jZ7fbTCvayuVnamTbg=;
 b=Yy56CxtjPXYg0OVqf6X+qbPbT81jQgPw0Bo9lYjbafxEM0GPl8owz74yPGYsHVy/4L
 Gp2FKcVpj6+54s7NcdQj3HhhNxWupuMqiC3M+HZcj6TQAsfRFp3YgjHBLSSBUqRWxYGQ
 OfFOv+hWuou1r7N+3HzB0KMqWgiVtntbDVorpxvP2LxZIWSCmHn6aZ+q/TKdu+PWb5Bw
 +vIq3IHQYrWiwpCDLPgnAwUN0rB1Gyw2XBJ9K5MJI77xaKskv2nohg48uj5htIJt7+vt
 XDTtR61ElJpvRPSsWvkUoednS5E/jXIE94UEjtVzAgCUyFuHa2a+4peYMe4Y5SiUvAEM
 f/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B9zGmm9uit0zU6DRJerw26Jq0jZ7fbTCvayuVnamTbg=;
 b=78Ls0tZtt5QD5AmPYVVFwMUf/xbuFUrcBfLCGty2tGwEUmoNi/zmVSqoQPd+nOOLOR
 YpRc//KdB35cyMVcZ8Y/HEbLp6AbCH/nE2yVshxKMqKjSpaXs8L2pNWkmS0Io9Obajhm
 BkPP3iDwLq9fY9JYoEk+Qv3pwyW3HnVy7m0g7xFpNbNBrS/qZ2XU8wkK7sdoawD2/LDg
 oK1GvelOz3j9+yevsLejyM6MGWdMWnJO8B1AQCFFy+85mfKnMeEg8Tb2FhaoW5+TmbH4
 Mq8cKp1CU92wwkQRxG4TZ9cwFzeKPBOgXbTpo4ai4bJwQS15oXbv4PgSbTzXN5JwfJXE
 6/Xw==
X-Gm-Message-State: AOAM533oqgQCg8554c4uRXoKeirdyzoqsb+ub7MZkPCoq+Dp6lqFUWI2
 dGQffCSbIKYqEjpThJXuvz+NTyHnPEQScwa/8KI=
X-Google-Smtp-Source: ABdhPJxUOj0D4hmSiqlmpJsW55ag4yXAlIoU7BblU23/sAk+uYQv/CO0zFq4PTamntycgRV1qG5ks3rn8oHADeqwqFY=
X-Received: by 2002:a05:6000:1a87:b0:20c:687f:6d10 with SMTP id
 f7-20020a0560001a8700b0020c687f6d10mr19038895wry.574.1652205272712; Tue, 10
 May 2022 10:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220510165216.3577068-1-robdclark@gmail.com>
 <CAA8EJprS_Jk_Wowz-nK1nnYF1UUb-4SYUPhsF_qB4rL4GUPygA@mail.gmail.com>
In-Reply-To: <CAA8EJprS_Jk_Wowz-nK1nnYF1UUb-4SYUPhsF_qB4rL4GUPygA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 10 May 2022 10:54:20 -0700
Message-ID: <CAF6AEGsFsCDQgaoSroqQFGS7c8=O-vVA2LxwkpWW1wUU+HF1tg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix fb plane offset calculation
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 10, 2022 at 10:46 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, 10 May 2022 at 19:52, Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The offset got dropped by accident.
> >
> > Fixes: d413e6f97134 ("drm/msm: Drop msm_gem_iova()")
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> > ---
> >  drivers/gpu/drm/msm/msm_fb.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
> > index 362775ae50af..4269da268a4a 100644
> > --- a/drivers/gpu/drm/msm/msm_fb.c
> > +++ b/drivers/gpu/drm/msm/msm_fb.c
> > @@ -118,7 +118,7 @@ uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb,
> >                 struct msm_gem_address_space *aspace, int plane)
> >  {
> >         struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
> > -       return msm_fb->iova[plane];
> > +       return msm_fb->iova[plane] + fb->offsets[plane];
>
> Nit: can we push fb->offsets handling into msm_framebuffer_prepare()
> instead? Then the msm_framebuffer_iova() would become trivial?

I'd briefly considered it, but ended up putting it here simply because
that is where the offset addition was prior to d413e6f97134.  Whether
that is a good reason or not, idk.  (Prior to d413e6f97134 it needed
to be here, now it doesn't)

BR,
-R

> >  }
> >
> >  struct drm_gem_object *msm_framebuffer_bo(struct drm_framebuffer *fb, int plane)
> > --
> > 2.35.1
> >
>
>
> --
> With best wishes
> Dmitry
