Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 550694884FC
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jan 2022 18:41:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4A810E185;
	Sat,  8 Jan 2022 17:41:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD9810E185;
 Sat,  8 Jan 2022 17:41:48 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id o30so6027351wms.4;
 Sat, 08 Jan 2022 09:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/unm4dEq29U+9A9+H2q9l5M3g8YNwwQHL3sl9HPMEOc=;
 b=A56B2+9idZXB4ljHp4MA6vbbshXMYE3jxMDTKvEJG8H006EDYL8WTBaZWKOfdYz4o6
 WAS/3d2ve6G3WYLiSQ2p9Af+FWc/+UJAh1NCSP8cDyIXNzBqGyXLTDQIO3USgtrMLhS8
 b24XIxZ79yYi/btgogT2xIbEgkaHj8/pjYQmHnAn/7HLcUJ/X3mq7wNVix73mmlO6JWJ
 tCynh2II4X5LLMdOFpymqw3Zw8mznKJ5212z0LoMyO0k1iKloTJkMvd3m6lhDMXZxfVf
 Bu1sYheCznaW6JvLKSepgp/UDHx/Jzf30JjTMDICkLs0mc0dcKR8fylLxM3IAGElm/Uk
 6ThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/unm4dEq29U+9A9+H2q9l5M3g8YNwwQHL3sl9HPMEOc=;
 b=WpLLKbJczPyA1Hwaw8aSTSdJpKIGxJfzGOIqnto7d1i4iiE8aMzevPOBn2n1PZGT+Q
 N0oFazD3Gf8KYlM6lYnR6tUSE363EKgi0B3HweMEBGO5RNsR68Q71j3LFQmDqJe219rf
 iEcNsuxdfltshLdAgWAbJe6yoJ29sBnqaBqv+zZTR6Z1wObSksW9xfDPhfvUxcmNKdpH
 ANRb6XEyV33/PQeASaVwfRRVwKh91MZcXpdXVB6lAFBqlFbKIdq7Pfb7oab5PEZCbp8r
 ZqwdPP+Aj55rCdKHqS9+o/q0AKbSchCIGH4eLrTKg2MxQ9WNLuuKDmqACl5lGhKvuWgL
 fNvA==
X-Gm-Message-State: AOAM533usI3ZmgULbilsg8g7syaQU4CwJG2vnvHT8Wn+YTJbrIIfUgKJ
 yPica2u+p8encJKk29maCl15gMruKxm9drqPCiM=
X-Google-Smtp-Source: ABdhPJwd0wOlFffJMGuuMGPsuIzurCxyjNc7dAwFocxE2vZTcOuLbPq7fXcRJisaNMg1TR0EEwgzo8+Wew8pQPOOrAg=
X-Received: by 2002:a7b:c3c5:: with SMTP id t5mr15181606wmj.168.1641663706920; 
 Sat, 08 Jan 2022 09:41:46 -0800 (PST)
MIME-Version: 1.0
References: <20220106181449.696988-1-robdclark@gmail.com>
 <20220106181449.696988-2-robdclark@gmail.com>
 <CAE-0n53N0GQ2UXYNpDOf_WVvvUa3cu95ePGYfYk7jZwPTqJ-XA@mail.gmail.com>
In-Reply-To: <CAE-0n53N0GQ2UXYNpDOf_WVvvUa3cu95ePGYfYk7jZwPTqJ-XA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 8 Jan 2022 09:41:35 -0800
Message-ID: <CAF6AEGsO1f5DC8AWjjA+9XLne3CRMGsLfLwWbv3iQVZW3wUTiw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/gpu: Wait for idle before suspending
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 7, 2022 at 4:27 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Rob Clark (2022-01-06 10:14:46)
> > From: Rob Clark <robdclark@chromium.org>
> >
> > System suspend uses pm_runtime_force_suspend(), which cheekily bypasses
> > the runpm reference counts.  This doesn't actually work so well when the
> > GPU is active.  So add a reasonable delay waiting for the GPU to become
> > idle.
>
> Maybe also say:
>
> Failure to wait during system wide suspend leads to GPU hangs seen on
> resume.

The fallout can actually be a lot more than just GPU hangs.. that is
just the case that is easy (for us) to observe because the crash
logging captures them.  But sync/async external aborts are also
possible.. and I think even just undefined behavior (ie. I think if
the timing works out right, it can survive but just "lose" rendering
that hadn't completed yet)

> >
> > Alternatively we could just return -EBUSY in this case, but that has the
> > disadvantage of causing system suspend to fail.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_device.c | 9 +++++++++
> >  drivers/gpu/drm/msm/msm_gpu.c              | 3 +++
> >  drivers/gpu/drm/msm/msm_gpu.h              | 3 +++
> >  3 files changed, 15 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > index 93005839b5da..b677ca3fd75e 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -611,6 +611,15 @@ static int adreno_resume(struct device *dev)
> >  static int adreno_suspend(struct device *dev)
> >  {
> >         struct msm_gpu *gpu = dev_to_gpu(dev);
> > +       int ret = 0;
>
> Please don't assign and then immediately overwrite.
>
> > +
> > +       ret = wait_event_timeout(gpu->retire_event,
> > +                                !msm_gpu_active(gpu),
> > +                                msecs_to_jiffies(1000));
> > +       if (ret == 0) {
>
> The usual pattern is
>
>         long timeleft;
>
>         timeleft = wait_event_timeout(...)
>         if (!timeleft) {
>                 /* no time left; timed out */
>
> Can it be the same pattern here? It helps because people sometimes
> forget that wait_event_timeout() returns the time that is left and not
> an error code when it times out.

ok, I'll update in v2..

BR,
-R

> > +               dev_err(dev, "Timeout waiting for GPU to suspend\n");
> > +               return -EBUSY;
> > +       }
> >
> >         return gpu->funcs->pm_suspend(gpu);
> >  }
