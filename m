Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE833EA99E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 19:40:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C51F86E43D;
	Thu, 12 Aug 2021 17:40:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D4D6E43B;
 Thu, 12 Aug 2021 17:40:49 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id l18so9418213wrv.5;
 Thu, 12 Aug 2021 10:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xtdQLvjPjv0VFnymA3MJ/ZBQrWAvyh02E35C2a4b0fw=;
 b=afrSxcQrgrx5gLO+SX6yckc/hp8/a4L8elF95WR6y2VEUp1eJ0DB02wBANyzJHgwK9
 udmrpXjwtBAYCBeitvcDDgiG/AsQxRoPXYTK+aOS99v+WcAiTU+H09RUcP9DVJMpPJ1p
 XuWPAIGAGldNquoKhvo1xx+XLu7bkZLHNp1e030UYBxdinvoN3STF0NKHAdoSGaAUoi6
 QojGbZTX4WUSGqFQ4d2jQh+cUnu3JWFp/d0EtDO6dzRA3tsFf4w7oPuseILSMrVFZ9sN
 rZsk4kI2TR448qr/xB9E2r1Kgki0MKObTvff4UatSETNAE+/LJI484OojK3TOGmgsbBd
 A9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xtdQLvjPjv0VFnymA3MJ/ZBQrWAvyh02E35C2a4b0fw=;
 b=kFxYglcSQewZrqBGUBURFKlEkZLjwu+DlAXGYMh3smPuT0Kscqc+TZdvUCoPBOstry
 oAVCYgPEuA18B4IdWieIti7ctVv2zOIPq4xfBDqEP4GSLbp0S92DR0tzXdURg3MXnQY+
 8sDWb6GVu6SxQNunAV+oXgZDQe49jXlPc2CYOUjONWzurjTURWeLh4j63bRDIjTFcaPo
 xYvBp1OqYp77d1D1HmNOxrTM31tSVjShmpqQ2g6sWU0D5LN2VA7vsz4N0YdVsPsNUKTZ
 jnw811dEEy4gKIHAf1LkzfwE1FVQej1AnIG6YJWjepTARSRrHxUB8Sd2YfF4mrm51k1F
 a68A==
X-Gm-Message-State: AOAM532YQhlx04xgjg/hUOd4v5j51CdGFMKy8+f0c3RV8lNrLG76xuVC
 njjPZVFqqo8S/2+OuVpZIBbIo1L29BrYjJJtLWA=
X-Google-Smtp-Source: ABdhPJxlE105yhAhGgsHNT7Nc7Yi8zQggP8RT7fprusgr3rX2hm2op41s5yRrlr1/xo3E0R4pxqbOFzarTDjAkfLxpk=
X-Received: by 2002:adf:e3c7:: with SMTP id k7mr5137656wrm.327.1628790048003; 
 Thu, 12 Aug 2021 10:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210811235253.924867-1-robdclark@gmail.com>
 <20210811235253.924867-3-robdclark@gmail.com>
 <YRVa6Wy/24FUQEUw@ravnborg.org>
In-Reply-To: <YRVa6Wy/24FUQEUw@ravnborg.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 12 Aug 2021 10:45:03 -0700
Message-ID: <CAF6AEGu8H7HkC4ML8DEFDrmMdsErnjmo1iET4+kY_i24_LH56w@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/msm/dsi: Support NO_CONNECTOR bridges
To: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Stephen Boyd <swboyd@chromium.org>, 
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@chromium.org>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 open list <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 12, 2021 at 10:31 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Rob,
>
> On Wed, Aug 11, 2021 at 04:52:48PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > For now, since we have a mix of bridges which support this flag, which
> > which do *not* support this flag, or work both ways, try it once with
> > NO_CONNECTOR and then fall back to the old way if that doesn't work.
> > Eventually we can drop the fallback path.
>
> Which bridges are missing support for the NO_CONNECTOR flags that you
> are using?

Currently (as far as things that I am aware of) it is just
ti-sn65dsi86, which the last two patches in this series convert.

But who knows what someone somewhere decides to build ;-)

BR,
-R

> Background for the question is that if you are using one of the bridges
> missing a conversion then we could do the conversion and maybe you could
> help with some tests.
>
> We in the above sentence is likely me, so it may take some weeks,
> but known there is a chance for testing is a good motivator.
>
>         Sam
