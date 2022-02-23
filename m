Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A201C4C185C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 17:18:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A7C210EE6F;
	Wed, 23 Feb 2022 16:18:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B58B710EE6F;
 Wed, 23 Feb 2022 16:18:38 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id f17so15638424wrh.7;
 Wed, 23 Feb 2022 08:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vu8Twnocn3vA4ricnLle2PUL2O6gazUeaL13927N0Bw=;
 b=dU+Uq1hgyWoO4vVyQn1ujrktF0A2z0Zg7WmMjPHYBcM7m32p0tLKDSKQUVOjkCMPLd
 NQHbsrDFQJ+vyYL92d2dYicS/odftSePDJWQl66P3pkpro62ARe5Evkii3sEAMhedGz/
 VFdy0DKVRaEzQRiD/Gvgek/8tfHZlcsqxdoTTboE1sZ6EDbkjpUblB+t7bYdi29J4ezG
 kiAJa5BditVgo5ThrGJQRtTECHC3i0GaVzlOEyfeeg0Hn67Nc3paqFSnSd+LK2M61yQa
 Spy4a7vFsxx5Q9z8kV6/13pMYxzPbFFunOBddsseJsE5vcaC5Sdu4ypUcXOJMIql03aX
 XVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vu8Twnocn3vA4ricnLle2PUL2O6gazUeaL13927N0Bw=;
 b=zoZbXJn0K5QU432ve8QvhXTHxKGCcCtkOZIUcQxowSbhH/3LuzPlK1WylOnuGM7MN+
 4akodoAmk0Qhh8QYTr33IB9zpl6YeurLm3V55jCtb9/2p09tI8SU7jQVaWhPjyRlhFba
 CeWtQtnRy1kTWLez3avx1vxrl/DM/1w6z8s/ngMrIki3zgGfXr90ns9/SjiYwpfZfHn4
 3KUwkLwMr5R+VeA/q7KmIzHhmM9+NptpcZ5zV7ZSXvb6pXtwhei1kHttd5TcM0fr2Hjz
 hapZ1+/VBQC2jIz+M6YrVzxfEdfI/jIG1koKQ69OV4tfDwi7dFss8kB0XL3pWF5LQzMG
 cw+w==
X-Gm-Message-State: AOAM530e/BAHeWsHFMZIHuybEIXRAIq9s9eVF4w72hnjR4mf9FSXA4pg
 BNIPrBl/JVU7kQpWJPXKZAD42IcEL6i0DT+Duzl7YMRoOPs=
X-Google-Smtp-Source: ABdhPJxUxsUu4B6LPuO8RFWw7Yn5lu+ezbPGrbFjXiTTcZQRl7UW8msM5NNY5SAhTMaB4e82kLY55STtgN9hvzTG0J0=
X-Received: by 2002:a05:6000:1202:b0:1ed:b03e:69a0 with SMTP id
 e2-20020a056000120200b001edb03e69a0mr275388wrx.93.1645633117146; Wed, 23 Feb
 2022 08:18:37 -0800 (PST)
MIME-Version: 1.0
References: <20220219193957.577054-1-robdclark@gmail.com>
 <a065a843-e7c3-a75b-aa8e-d4b264146df0@linaro.org>
In-Reply-To: <a065a843-e7c3-a75b-aa8e-d4b264146df0@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 23 Feb 2022 08:18:56 -0800
Message-ID: <CAF6AEGuAq_OT_bFon+WvGr+kU1wA_u=bRirC8BjN=5eYNopiOA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Avoid dirtyfb stalls on video mode displays
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
 freedreno <freedreno@lists.freedesktop.org>, Xu Wang <vulab@iscas.ac.cn>,
 Kalyan Thota <quic_kalyant@quicinc.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Yangtao Li <tiny.windzz@gmail.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 David Heidelberg <david@ixit.cz>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>, Mark Yacoub <markyacoub@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 23, 2022 at 2:00 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 19/02/2022 22:39, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Someone on IRC once asked an innocent enough sounding question:  Why
> > with xf86-video-modesetting is es2gears limited at 120fps.
> >
> > So I broke out the perfetto tracing mesa MR and took a look.  It turns
> > out the problem was drm_atomic_helper_dirtyfb(), which would end up
> > waiting for vblank.. es2gears would rapidly push two frames to Xorg,
> > which would blit them to screen and in idle hook (I assume) call the
> > DIRTYFB ioctl.  Which in turn would do an atomic update to flush the
> > dirty rects, which would stall until the next vblank.  And then the
> > whole process would repeat.
> >
> > But this is a bit silly, we only need dirtyfb for command mode DSI
> > panels.  So lets just skip it otherwise.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 13 +++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |  9 ++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |  1 +
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c |  9 ++++
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  |  1 +
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h  |  1 +
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c |  8 +++
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  |  1 +
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h  |  1 +
> >   drivers/gpu/drm/msm/msm_fb.c              | 64 ++++++++++++++++++++++-
> >   drivers/gpu/drm/msm/msm_kms.h             |  2 +
> >   11 files changed, 109 insertions(+), 1 deletion(-)
> >
>
> I have checked your previous dirtyfb patch (and corresponding discussion).
>
> I'm not fond of the idea of acquiring locks, computing the value, then
> releasing the locks and reacquiring the locks again. I understand the
> original needs_dirtyfb approach was frowned upon. Do we have a chance of
> introducing drm_atomic_helper_dirtyfb_unlocked()? Which would perform
> all the steps of the orignal helper, but without locks acquirement (and
> state allocation/freeing)?
>

The locking is really more just to avoid racing state access with
state being free'd.  The sort of race you could have is perhaps
dirtyfb racing with attaching the fb to a cmd mode
plane->crtc->encoder chain.  I think this is relatively harmless since
that act would flush the fb anyways.

But it did give me an idea for a possibly simpler approach.. we might
be able to just keep a refcnt of cmd mode panels the fb is indirectly
attached to, and then msm_framebuffer_dirtyfb() simply has to check if
that count is greater than zero.  If we increment/decrement the count
in fb->prepare()/cleanup() that should also solve the race.

BR,
-R
