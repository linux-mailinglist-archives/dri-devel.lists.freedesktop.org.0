Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6E268E217
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 21:44:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8397110E5E8;
	Tue,  7 Feb 2023 20:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15DAB10E5E8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 20:44:41 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id u7so4080902ybi.6
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Feb 2023 12:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=N5PXaN+rnDkxZU0a1J/LHZxEMb6BCQd+9g7X1C4pMG0=;
 b=P6G2nj53KX5NnzMLCDglTlx1+uLL5kTHDEQMf+kw3sUQCf8gNO5eC9mXHZsGpYeTO/
 oA4dqLGhV1EcBBDnu4DRpW60ZPV875Cng0qMmSrpiWtZJ1SrGzhIkJhZ6G6cIoNbaM7x
 1UJGRcsPH6hyg6pTKF6IxCB3CPW/AxSF82MqvtBtqgl4aF8EfmW+7797E8SLPM72wQ2B
 ibNRWI629JQ55GxxIpvuHDwz5GuG1WagzkgkBG2yDQ6OW+7bALmis/60GKpbE4Eq75B4
 dKXy0Q0Ya+YkcwQQ3gVxly9AHLb2cQQl2TC/aiTZW4eatrYy5btYpJBXHmI32h/VeWGr
 159w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N5PXaN+rnDkxZU0a1J/LHZxEMb6BCQd+9g7X1C4pMG0=;
 b=bK60K3aRiStUM+OqSsdeMBLTIPi4FSDgYlAoYB7wTA1RPBQjdRHdGTqW8q421tGzOA
 G60PwkAak5MCvAMZ+YZI/rHcotFk9qQkiMCT4TiKkeLXNc3Z76Sk2MJ2xla2I6IRIKP2
 qPpk283LfMUnS55L35PPUZmG9RnvqlGXp42BETfMdQKGrxdZkgJukQ6vCeSBijTeYh0U
 /aBcg/npcP47s+m4yFfwt9cIeZZM+oHtE3zUIKPSlFlv3fZ6NZW1UOT4dwfvoLJuctMz
 a0LRyUBHY6FllOsdcbCklNr11ZkVsLFEc1+rfF76jKl2wNXNO2kxmhPBZ3Namnl2Xn2P
 4h7g==
X-Gm-Message-State: AO0yUKW6LgmePpbR45K+sAkXdE6NBily8/FkrzClhpJp6xG3WUGfqCQj
 qGgRm2Fmq4AEWOU8G/NPOTkVqwXR8uFEPtbeUSuweBvc1fk/8g==
X-Google-Smtp-Source: AK7set+jTbUlrgbo3Pm83+jU9WPdxt8hSIwSlDA1+2fc+XPGtAFWMuNWO85wfvO5Dkec0F+B+ksxrPgD6xywjhbkyWA=
X-Received: by 2002:a25:9345:0:b0:880:1f26:333f with SMTP id
 g5-20020a259345000000b008801f26333fmr605829ybo.15.1675802680164; Tue, 07 Feb
 2023 12:44:40 -0800 (PST)
MIME-Version: 1.0
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-25-dmitry.baryshkov@linaro.org>
 <b4dbe036-81c4-e56f-12fb-75cb8bb59173@quicinc.com>
In-Reply-To: <b4dbe036-81c4-e56f-12fb-75cb8bb59173@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 7 Feb 2023 22:44:29 +0200
Message-ID: <CAA8EJpqQJdrvx4KML1pFYwM1ogYYie6Wct+ueJYMBAYb2-k=xQ@mail.gmail.com>
Subject: Re: [PATCH v3 24/27] drm/msm/dpu: rework plane CSC setting
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 7 Feb 2023 at 22:05, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
> > Rework the code flushing CSC settings for the plane. Separate out the
> > pipe and pipe_cfg as a preparation for r_pipe support.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 45 +++++++++++++----------
> >   1 file changed, 25 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index e69499490d39..05047192cb37 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -576,29 +576,18 @@ static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
> >       { 0x00, 0x3ff, 0x00, 0x3ff, 0x00, 0x3ff,},
> >   };
> >
> > -static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_plane *pdpu, const struct dpu_format *fmt)
> > +static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_sw_pipe *pipe, const struct dpu_format *fmt)
> >   {
> > -     struct dpu_plane_state *pstate = to_dpu_plane_state(pdpu->base.state);
> >       const struct dpu_csc_cfg *csc_ptr;
> >
> > -     if (!pdpu) {
> > -             DPU_ERROR("invalid plane\n");
> > -             return NULL;
> > -     }
> > -
> >       if (!DPU_FORMAT_IS_YUV(fmt))
> >               return NULL;
> >
> > -     if (BIT(DPU_SSPP_CSC_10BIT) & pstate->pipe.sspp->cap->features)
> > +     if (BIT(DPU_SSPP_CSC_10BIT) & pipe->sspp->cap->features)
> >               csc_ptr = &dpu_csc10_YUV2RGB_601L;
> >       else
> >               csc_ptr = &dpu_csc_YUV2RGB_601L;
> >
> > -     DPU_DEBUG_PLANE(pdpu, "using 0x%X 0x%X 0x%X...\n",
> > -                     csc_ptr->csc_mv[0],
> > -                     csc_ptr->csc_mv[1],
> > -                     csc_ptr->csc_mv[2]);
> > -
> >       return csc_ptr;
> >   }
> >
> > @@ -1049,6 +1038,27 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >       return 0;
> >   }
> >
> > +static void dpu_plane_flush_csc(struct dpu_plane *pdpu, struct dpu_sw_pipe *pipe)
> > +{
> > +     const struct dpu_format *format = to_dpu_format(msm_framebuffer_format(pdpu->base.state->fb));
> > +     const struct dpu_csc_cfg *csc_ptr;
> > +
> > +     if (!pipe->sspp || !pipe->sspp->ops.setup_csc)
> > +             return;
> > +
> > +     csc_ptr = _dpu_plane_get_csc(pipe, format);
> > +     if (!csc_ptr)
> > +             return;
> > +
> > +     DPU_DEBUG_PLANE(pdpu, "using 0x%X 0x%X 0x%X...\n",
> > +                     csc_ptr->csc_mv[0],
> > +                     csc_ptr->csc_mv[1],
> > +                     csc_ptr->csc_mv[2]);
> > +
> > +     pipe->sspp->ops.setup_csc(pipe->sspp, csc_ptr);
> > +
> > +}
> > +
> >   void dpu_plane_flush(struct drm_plane *plane)
> >   {
> >       struct dpu_plane *pdpu;
> > @@ -1072,13 +1082,8 @@ void dpu_plane_flush(struct drm_plane *plane)
> >       else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
> >               /* force 100% alpha */
> >               _dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
> > -     else if (pstate->pipe.sspp && pstate->pipe.sspp->ops.setup_csc) {
> > -             const struct dpu_format *fmt = to_dpu_format(msm_framebuffer_format(plane->state->fb));
> > -             const struct dpu_csc_cfg *csc_ptr = _dpu_plane_get_csc(pdpu, fmt);
> > -
> > -             if (csc_ptr)
> > -                     pstate->pipe.sspp->ops.setup_csc(pstate->pipe.sspp, csc_ptr);
> > -     }
>
> Do we need to check for pipe being valid too (pstate->pipe) &&
> (pstate->pipe.sspp) && pstate->pipe.sspp->ops.setup_csc) ?
>
> Before moving the pipe_hw/sw pipe to the state the code used to check
> for pdpu->pipe_hw to be valid. Since dpu_plane_flush() can be called
> from other files too , dont we need to check for (pstate->pipe)?

pstate->pipe is not a pointer, there is nothing to check.

>
> > +     else
> > +             dpu_plane_flush_csc(pdpu, &pstate->pipe);
> >
> >       /* flag h/w flush complete */
> >       if (plane->state)



-- 
With best wishes
Dmitry
