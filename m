Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 857757477CC
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 19:30:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BEAB10E304;
	Tue,  4 Jul 2023 17:30:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9F110E304
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 17:30:44 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-bd0a359ca35so5390112276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 10:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688491843; x=1691083843;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lZZYhAMS4P0JlyUoFI/yQ9M0e2zsSOScmdbRcE5pQn0=;
 b=UM9IFKuWSrCweUYM6HcG8i1kc21W08w08Un0FeZKltLdhGE5tddMqCMS0pj3QByN5B
 df/UvjOowmu9NUv7djy8CQVrlZLzd76LgEgJL362lrQKa2z0wAAF9HPIWBEhEe5sMVDc
 saIQRfPg/FIwSHJ0jmqopC0sQ5AM8lMyyJOe2rWz4kQAsF6owJqaPxtDyJaqsEZFFDnd
 7wFNCUVpwICvhKWJ5QJEzE4v0Y+EZRiobt54BSN6kr81pI/JtQ9uzxwEkbhuz0bG1YtK
 3/M5yDLO90U/nuNJYDq16idE6vUbbxhyHObzHc9mwZ6eGXZVbnS9ZlxtISxR/csninvw
 bL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688491843; x=1691083843;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lZZYhAMS4P0JlyUoFI/yQ9M0e2zsSOScmdbRcE5pQn0=;
 b=jsG0eyKoShch5zGr3bR4e3WHvTqXrmTukY8M2ksCJEMLFIhSoSMVpOVUsGfaL2iRup
 Bqk9nabtnxlzDtGY+YbZIF9qdrq6MvH9CH4WNegbzQjVaVootixjFUPwUZuR1gquzoTl
 Mmt2T1/FFSn56tmRGP38t1x/WP5Nfe1eXCcJQxcRXTruEjFUYzykslaxPdT3NcmyyvW2
 SJLu5HM8cSCyeGx0Ly7/aYwcjYTwcoCjkowdttGbD6ejD2LleQmZtlLVeK7SaLhKLQox
 pq1gKdWYJvhfy7gMluqdND5s4A3/fFvaT7fDQ34IzWdouOwmZA0wC0TaXLl8LmENWTYk
 6dDg==
X-Gm-Message-State: ABy/qLZAc6JOgk7cJzkboZ37TTmK2YomGgULT7yKqgVzZKRuxDi2J6HO
 y9x1UBVmgNx8XCpWB/qAIUrBT5hLqH+A3/waLDIrpg==
X-Google-Smtp-Source: APBJJlHigHEYKofayb+OxZT57NxYXwngeV93etDN5bhfqo65aLEQgDJMs3OzGpe0jMPLa/Fx9K3i5sg9dz3n6CXd93s=
X-Received: by 2002:a25:c550:0:b0:c5e:5573:bda with SMTP id
 v77-20020a25c550000000b00c5e55730bdamr1496102ybe.11.1688491843141; Tue, 04
 Jul 2023 10:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230704150354.159882-1-dmitry.baryshkov@linaro.org>
 <20230704150354.159882-6-dmitry.baryshkov@linaro.org>
 <3e31a735-a4d1-c8d4-6a83-53e2687c2f18@quicinc.com>
In-Reply-To: <3e31a735-a4d1-c8d4-6a83-53e2687c2f18@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 4 Jul 2023 20:30:32 +0300
Message-ID: <CAA8EJpos_gPPzyTGc56yQM6h0K8XBJKB2STq6eMZCkRpN4uxbw@mail.gmail.com>
Subject: Re: [PATCH v2 05/14] drm/msm/dpu: handle perf mode in
 _dpu_core_perf_crtc_update_bus()
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

On Tue, 4 Jul 2023 at 18:55, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 7/4/2023 8:03 AM, Dmitry Baryshkov wrote:
> > Move perf mode handling for the bandwidth to
> > _dpu_core_perf_crtc_update_bus() rather than overriding per-CRTC data
> > and then aggregating known values.
> >
> > Note, this changes the fix_core_ab_vote. Previously it would be
> > multiplied per the CRTC number, now it will be used directly for
> > interconnect voting.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Break this out into a separate series. This rework doesnt need to be
> part of this cleanup series.

Sure, why not.

>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 37 +++++++++----------
> >   1 file changed, 18 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > index 348550ac7e51..42c03a5f1f3e 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > @@ -116,21 +116,9 @@ static void _dpu_core_perf_calc_crtc(struct dpu_kms *kms,
> >               return;
> >       }
> >
> > -     memset(perf, 0, sizeof(struct dpu_core_perf_params));
> > -
> > -     if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> > -             perf->bw_ctl = 0;
> > -             perf->max_per_pipe_ib = 0;
> > -             perf->core_clk_rate = 0;
> > -     } else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
> > -             perf->bw_ctl = kms->perf.fix_core_ab_vote;
> > -             perf->max_per_pipe_ib = kms->perf.fix_core_ib_vote;
> > -             perf->core_clk_rate = kms->perf.fix_core_clk_rate;
> > -     } else {
> > -             perf->bw_ctl = _dpu_core_perf_calc_bw(kms, crtc);
> > -             perf->max_per_pipe_ib = kms->catalog->perf->min_dram_ib;
> > -             perf->core_clk_rate = _dpu_core_perf_calc_clk(kms, crtc, state);
> > -     }
> > +     perf->bw_ctl = _dpu_core_perf_calc_bw(kms, crtc);
> > +     perf->max_per_pipe_ib = kms->catalog->perf->min_dram_ib;
> > +     perf->core_clk_rate = _dpu_core_perf_calc_clk(kms, crtc, state);
> >
> >       DRM_DEBUG_ATOMIC(
> >               "crtc=%d clk_rate=%llu core_ib=%llu core_ab=%llu\n",
> > @@ -236,17 +224,28 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
> >       struct dpu_core_perf_params perf = { 0 };
> >       int i, ret = 0;
> >       u32 avg_bw;
> > +     u32 peak_bw;
> >
> >       if (!kms->num_paths)
> >               return 0;
> >
> > -     dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> > +     if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> > +             avg_bw = 0;
> > +             peak_bw = 0;
> > +     } else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
> > +             avg_bw = kms->perf.fix_core_ab_vote;
> > +             peak_bw = kms->perf.fix_core_ib_vote;
> > +     } else {
> > +             dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> > +
> > +             avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
> > +             peak_bw = perf.max_per_pipe_ib;
> > +     }
> >
> > -     avg_bw = perf.bw_ctl;
> > -     do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
> > +     avg_bw /= kms->num_paths;
> >
> >       for (i = 0; i < kms->num_paths; i++)
> > -             icc_set_bw(kms->path[i], avg_bw, perf.max_per_pipe_ib);
> > +             icc_set_bw(kms->path[i], avg_bw, peak_bw);
> >
> >       return ret;
> >   }



-- 
With best wishes
Dmitry
