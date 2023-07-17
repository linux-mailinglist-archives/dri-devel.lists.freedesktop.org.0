Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B843D756C92
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 20:56:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93DE310E2AB;
	Mon, 17 Jul 2023 18:56:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7AC310E2AB
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 18:56:17 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-bcb6dbc477eso3620767276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 11:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689620176; x=1690224976;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VmA5Jfgc3nz1Zl14c2jQILY12tiDI4u1S5jeAvKKy/0=;
 b=GSvJRzB5FkiX2KTMvNw528FeF0WPz6XcJT7AyrHMFPDnfcF5HBiDLkcaQmX4LkR3DW
 zwavBgAoxpMSXTg4u0VFolB5N8PpYDypxdfPrCM3gVETuEGVnvMCXWBHj/k9bhYceN3b
 kz7HEnc+l7gDiEvMhHC5K24EPxWoaHbklerLX5cQLr7oEt1Zsf6m2EFz5/ZhFtpV03Ou
 141tOGlSP17tPP76z/PB0V7llWmuoGjSUb25GNJj35FxD95ykA1qTf7HbU21telKOqyk
 wh7wInk2riLcK99aojYTdZBvps3cwgBrtBWBp3xLyH0FgKfQJ9TWe5QmciQ/s1NZ+WmU
 AZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689620176; x=1690224976;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VmA5Jfgc3nz1Zl14c2jQILY12tiDI4u1S5jeAvKKy/0=;
 b=Z8c63V8Zj0W9XEj0C8jsQBZARZ8GeyEYLvG2iiYgEAjtVPHl3emcowUeSQEI23vEKS
 HKYNJkIpKMLRqzOMJk5RTtK7bVV7CwEse040hEj8YYlSLuxM/PG3zvX1oq+xhG/Fxrpj
 Eq5XE3y+7f6I5u2w6Vd4oyYdQfytpFMmre2xkVmFuOo0NCTw09XDv5+26DcaWzo5bhuu
 8rCnkzOlVgJPYGOiheef7/NrvXcsbIiEJj5/Z8hCAHLPRhcWv+aIO6+VzndZB77fMklv
 GK0ZCXvW9vIUzfcDKSOzb0puhoAoGWTziPGrYQOQsK1Tiu/iia8YmsmLkGa+xsCWQkG1
 gFqA==
X-Gm-Message-State: ABy/qLbZqyPXpA7mRFC1WhadoOs9YcX1lMMcNp/yZd3aPPU+M++O0FpA
 0Qyl35xDv+yW2ciUiX27ut2Oxywuqy5yKLqDAYPLaWIu1ngI79b0JEE=
X-Google-Smtp-Source: APBJJlGFOfQ8DMAEjRZm1xB6A5WX6wGyAbKiz7ErHiDBzOyNhki1Fo0RqAxT25Iys/8wOesoAjMTz/pWLYUClxB6VQU=
X-Received: by 2002:a25:b44:0:b0:cb0:3ce5:2bbc with SMTP id
 65-20020a250b44000000b00cb03ce52bbcmr8967189ybl.16.1689620176514; Mon, 17 Jul
 2023 11:56:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
 <20230712221139.313729-3-dmitry.baryshkov@linaro.org>
 <9c594fdb-095d-0c3f-cdd0-bd92304b42cb@quicinc.com>
In-Reply-To: <9c594fdb-095d-0c3f-cdd0-bd92304b42cb@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 17 Jul 2023 21:56:05 +0300
Message-ID: <CAA8EJpoW9-EXVKNARzgrO99viz5zmcV2H=kP3iNRhd4NDYhe0Q@mail.gmail.com>
Subject: Re: [PATCH v4 02/11] drm/msm/dpu: core_perf: extract bandwidth
 aggregation function
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

On Mon, 17 Jul 2023 at 21:45, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 7/12/2023 3:11 PM, Dmitry Baryshkov wrote:
> > In preparation to refactoring the dpu_core_perf debugfs interface,
> > extract the bandwidth aggregation function from
> > _dpu_core_perf_crtc_update_bus().
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> Drop the core_perf tag from the subject line.

Ack.

>
> The debugfs refactor was dropped from this series if thats what you are
> referring to here.
>
> So even this and the next patch dont serve any purpose in this series
> and should be dropped, Unless you have some reason of keeping them here.

The next patch serves its purpose: it prevents recalculating bandwidth
if there are no ICC paths (useless math).

This patch separates actual math and control paths. It was required
for debugfs, but it serves its own purpose too. I'll reflect that in
the commit message.

>
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 39 +++++++++++--------
> >   1 file changed, 22 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > index 1d9d83d7b99e..333dcfe57800 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > @@ -206,33 +206,38 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
> >       return 0;
> >   }
> >
> > -static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
> > -             struct drm_crtc *crtc)
> > +static void dpu_core_perf_aggregate(struct drm_device *ddev,
> > +                                 enum dpu_crtc_client_type curr_client_type,
> > +                                 struct dpu_core_perf_params *perf)
> >   {
> > -     struct dpu_core_perf_params perf = { 0 };
> > -     enum dpu_crtc_client_type curr_client_type
> > -                                     = dpu_crtc_get_client_type(crtc);
> > -     struct drm_crtc *tmp_crtc;
> >       struct dpu_crtc_state *dpu_cstate;
> > -     int i, ret = 0;
> > -     u64 avg_bw;
> > +     struct drm_crtc *tmp_crtc;
> >
> > -     drm_for_each_crtc(tmp_crtc, crtc->dev) {
> > +     drm_for_each_crtc(tmp_crtc, ddev) {
> >               if (tmp_crtc->enabled &&
> > -                     curr_client_type ==
> > -                             dpu_crtc_get_client_type(tmp_crtc)) {
> > +                 curr_client_type == dpu_crtc_get_client_type(tmp_crtc)) {
> >                       dpu_cstate = to_dpu_crtc_state(tmp_crtc->state);
> >
> > -                     perf.max_per_pipe_ib = max(perf.max_per_pipe_ib,
> > -                                     dpu_cstate->new_perf.max_per_pipe_ib);
> > +                     perf->max_per_pipe_ib = max(perf->max_per_pipe_ib,
> > +                                                 dpu_cstate->new_perf.max_per_pipe_ib);
> >
> > -                     perf.bw_ctl += dpu_cstate->new_perf.bw_ctl;
> > +                     perf->bw_ctl += dpu_cstate->new_perf.bw_ctl;
> >
> > -                     DRM_DEBUG_ATOMIC("crtc=%d bw=%llu paths:%d\n",
> > -                               tmp_crtc->base.id,
> > -                               dpu_cstate->new_perf.bw_ctl, kms->num_paths);
> > +                     DRM_DEBUG_ATOMIC("crtc=%d bw=%llu\n",
> > +                                      tmp_crtc->base.id,
> > +                                      dpu_cstate->new_perf.bw_ctl);
> >               }
> >       }
> > +}
> > +
> > +static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
> > +             struct drm_crtc *crtc)
> > +{
> > +     struct dpu_core_perf_params perf = { 0 };
> > +     int i, ret = 0;
> > +     u64 avg_bw;
> > +
> > +     dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> >
> >       if (!kms->num_paths)
> >               return 0;



-- 
With best wishes
Dmitry
