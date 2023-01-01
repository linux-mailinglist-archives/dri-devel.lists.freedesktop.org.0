Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7F265AC0B
	for <lists+dri-devel@lfdr.de>; Sun,  1 Jan 2023 23:18:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA27710E179;
	Sun,  1 Jan 2023 22:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C365710E170;
 Sun,  1 Jan 2023 22:18:24 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-12c8312131fso31558985fac.4; 
 Sun, 01 Jan 2023 14:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yy52nz5EWhcJsvWpjun3W8BAed7Pu6I0tRm9djceBtE=;
 b=aUKgOPghXlTvzrc6u7k5kEW3PvtUpuXnRdFSLQ/HFxtA6NEyFCGeIJl5XEM3oSYvMf
 yYBCOvMvrbLLqsn3ljLul0VQ5m1mief/TwD2BvREIf58XjoWaiKgm+6hfJ6TI46cjZEe
 AaJGQ+Nuy/06MFO1sIE2johDMzmR9gjbY6uzGckDHw+JpdCEZlGlfMQVIzZe4KgGTlXj
 /Kzwr9YunMYk8/bflwQVODouOYRc9Da+KNWAaky0VoTNcP3OzsJbGd/mSE90Knh8mm3k
 uhoVFbWcZ8nqA4GFNaw4ztPW1vXQ6waLEtTUg0JNhL7Q1TwR0Bwj91flhywYpdXOApta
 N/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yy52nz5EWhcJsvWpjun3W8BAed7Pu6I0tRm9djceBtE=;
 b=R6AlniXLPKB9reyGkm2uJr3vHi37ygrs1pByU06VUB+EwgU3nBQKLA3nN0J5vwINb1
 aWgz9/hRF5Fy8WzFTEm/xDtlFWKtkQ6TfrTBmA+xNvMhg870V4sDV2v6WzBs2VHN1pmB
 hqtXi1NbTSXzXuz7Yxq5bsWIqC4OTI9umCRXfA5fkfgj9N9kPIcNBdgo8qHN115cglSr
 PQ10X3FumJr294f65RyM9TcoYOakq6KKdrFFSDqF1h5o9TJJF7C5XSvnlmVNQcrTEYrg
 OemBjsLvR5KE2ciJV4HzOSWaJ593lYvHQggdVJUQwHdf0V55nSRXCVJF8UsDTr+wUHtd
 lyVA==
X-Gm-Message-State: AFqh2koSKMxQpDq1IIeZH+HT31q7lVQv8iA3DoJFoStxbKFf27tgzGSR
 THvVd7fqzfZxwi/q/O+gTh1qTwD4VPJZZo1fO1E=
X-Google-Smtp-Source: AMrXdXte8iX8MMHmEPzIXd/8vUmQGEbPcEziUE4Pov+05WakJv8QOTo5ISycioy38t6wUo32zfYPD4Qn9C2ptiMz+wk=
X-Received: by 2002:a05:6870:513:b0:13d:51fe:3404 with SMTP id
 j19-20020a056870051300b0013d51fe3404mr2226606oao.183.1672611504025; Sun, 01
 Jan 2023 14:18:24 -0800 (PST)
MIME-Version: 1.0
References: <20221229101846.981223-1-konrad.dybcio@linaro.org>
 <20221229104730.guopbgyleb6hif4h@SoMainline.org>
In-Reply-To: <20221229104730.guopbgyleb6hif4h@SoMainline.org>
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 1 Jan 2023 14:18:11 -0800
Message-ID: <CAF6AEGvCT5S0KhcnUwGAbVqZXKxAQk4gfCegucAfQvy+Pgr4+A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: Make adreno quirks not overwrite each
 other
To: Marijn Suijten <marijn.suijten@somainline.org>
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
Cc: freedreno@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, krzysztof.kozlowski@linaro.org,
 agross@kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 29, 2022 at 2:47 AM Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2022-12-29 11:18:45, Konrad Dybcio wrote:
> > So far the adreno quirks have all been assigned with an OR operator,
> > which is problematic, because they were assigned consecutive integer
> > values, which makes checking them with an AND operator kind of no bueno..
> >
> > Switch to using BIT(n) so that only the quirks that the programmer chose
> > are taken into account when evaluating info->quirks & ADRENO_QUIRK_...
> >
> > Fixes: b5f103ab98c7 ("drm/msm: gpu: Add A5XX target support")
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>
> Nice catch!
>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>
> Not sure if it's the right Fixes commit though, as it would have worked
> when ADRENO_QUIRK_LMLOADKILL_DISABLE was added with constant 4 instead
> of 3 in 370063ee427a ("drm/msm/adreno: Add A540 support"), but then
> using bitflags in an enum value type is invalid anyway, AFAIK.

It isn't a thing that c++ like so much, but for c code, gdb will
decode enum bitfields in a sensible way (IIRC).  Also, maybe it
doesn't matter at this point, but it would conflict for stable
backports prior to adding LMLOADKILL_DISABLE.

with the fixes msg corrected,

Reviewed-by: Rob Clark <robdclark@gmail.com>

> - Marijn
>
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 10 ++++------
> >  1 file changed, 4 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > index c85857c0a228..5eb254c9832a 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > @@ -29,11 +29,9 @@ enum {
> >       ADRENO_FW_MAX,
> >  };
> >
> > -enum adreno_quirks {
> > -     ADRENO_QUIRK_TWO_PASS_USE_WFI = 1,
> > -     ADRENO_QUIRK_FAULT_DETECT_MASK = 2,
> > -     ADRENO_QUIRK_LMLOADKILL_DISABLE = 3,
> > -};
> > +#define ADRENO_QUIRK_TWO_PASS_USE_WFI                BIT(0)
> > +#define ADRENO_QUIRK_FAULT_DETECT_MASK               BIT(1)
> > +#define ADRENO_QUIRK_LMLOADKILL_DISABLE              BIT(2)
> >
> >  struct adreno_rev {
> >       uint8_t  core;
> > @@ -65,7 +63,7 @@ struct adreno_info {
> >       const char *name;
> >       const char *fw[ADRENO_FW_MAX];
> >       uint32_t gmem;
> > -     enum adreno_quirks quirks;
> > +     u64 quirks;
> >       struct msm_gpu *(*init)(struct drm_device *dev);
> >       const char *zapfw;
> >       u32 inactive_period;
> > --
> > 2.39.0
> >
