Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6FD67DD58
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 07:05:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06EAE10E3F8;
	Fri, 27 Jan 2023 06:05:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F25A10E3F6
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 06:05:37 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-50aa54cc7c0so26388047b3.8
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 22:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=odMtKOfoNkQ4B9p3SnpsiAi9zMJKcUAjwtL3wnlE3AA=;
 b=RNyPF0+/ap+ruzzg1wD4e4PQNxBwSYFgd/1RKZQWm7+tGU5pEDz9xHwy9meDhUTt8A
 k01qy6gj7R26es5SVivJcFe/+ZHjxRdStaLCxd07iP+ckGDbcTqYmA+6+jLjIjGr1PAF
 kQf0eXWfctWKX5H28QxZJ65rON5FbTwxGpqKKuyOYNuzNtywDhS6G+MHhtKD69qV/nwW
 6/xql/i2GTvIxTL2DXRbB8FthgaG9V58xWpxwAkBkaOK5esAHwWRhFxvMhlYXymdT8em
 K6uytowwxdf3Qqr6ehsFB9yhOm+s8zEi9fUAlS2f5GTiWjhT0D9iNCN1CwEXfe09njMh
 fM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=odMtKOfoNkQ4B9p3SnpsiAi9zMJKcUAjwtL3wnlE3AA=;
 b=xdvEwS2WD6e0haq3UsVB3HcHOWnxD5s7PkavUorCzOgBtBjbSFXhG6geuUV1dESSA4
 sz/rp9r9GEB17bQBjEYb4NgnMV81HNsVildRl72fiX4sA21KsZA19AJkfNh887JetzXS
 wvzlrlN3QN8bVDE6UOYHoC2LKbhSAHbshNgN0rK5qjon1I2QWld5WhjMKX2mh48rwaTl
 AAhU7gZ546dVfZmtAp4LAl8u53RSRzlZvKD5v16BmlRI9kfKstKmAm7BwpUCBtalFALp
 JVOzfxJixzGjmEjiV7nISJ8XO7cluQUAvVqaP3OTjlhtXCpL0So/JEqfiarSSM0cfbWV
 MV5Q==
X-Gm-Message-State: AFqh2krgIGWYHQWHQpxMLkBBbSUGZrtue5lNGinr7drhDP8hM7KNJpfP
 WQOh0njLbnvOeKhGuCRLZzRtEycu2wkDtRoyyi1zHw==
X-Google-Smtp-Source: AMrXdXtEg1A7UCnm6yhyPrtoBPuOsCDqdR8WlThIEy7XXoaoDuLIrk+YOHX+XdWZcy5CZthipKVrrohYdWsEzfHIRGM=
X-Received: by 2002:a0d:fd07:0:b0:3d6:2151:4038 with SMTP id
 n7-20020a0dfd07000000b003d621514038mr4491500ywf.418.1674799536315; Thu, 26
 Jan 2023 22:05:36 -0800 (PST)
MIME-Version: 1.0
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
 <20221229191856.3508092-6-dmitry.baryshkov@linaro.org>
 <aaeb287f-de41-3f63-fd93-b08532964d59@quicinc.com>
In-Reply-To: <aaeb287f-de41-3f63-fd93-b08532964d59@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 27 Jan 2023 08:05:25 +0200
Message-ID: <CAA8EJprHMyPDmHhqZF-AZpqiLNkK7QuoQz-sZu6kSabZ7y76Dw@mail.gmail.com>
Subject: Re: [PATCH v2 05/27] drm/msm/dpu: drop EAGAIN check from
 dpu_format_populate_layout
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

On Fri, 27 Jan 2023 at 02:52, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/29/2022 11:18 AM, Dmitry Baryshkov wrote:
> > The pipe's layout is not cached, corresponding data structure is zeroed
> > out each time in the dpu_plane_sspp_atomic_update(), right before the
> > call to _dpu_plane_set_scanout() -> dpu_format_populate_layout().
> >
> > Drop plane_addr comparison against previous layout and corresponding
> > EAGAIN handling.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> The change itself LGTM, hence
>
> But, shouldnt we add this EAGAIN validation or in other words fix this
> rather than drop this?

What for? Does it really save us anything? What's the price of
re-programming the SSPP_SRC0_ADDR registers?

>
> Like I wrote in the review last time, this makes sure to fail the commit
> if the same addr is being programmed.

First, there is nothing wrong with committing the same source addr.
For example setting the atomic property incurs an internal
drm_atomic_commit() with no change to addresses at all.
And then, this doesn't make atomic_commit fail. Instead it just
shortcuts a call to SSPP->setup_sourceaddress.

>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 10 +---------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  4 +---
> >   2 files changed, 2 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> > index d95540309d4d..ec1001e10f4f 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> > @@ -918,8 +918,7 @@ int dpu_format_populate_layout(
> >               struct drm_framebuffer *fb,
> >               struct dpu_hw_fmt_layout *layout)
> >   {
> > -     uint32_t plane_addr[DPU_MAX_PLANES];
> > -     int i, ret;
> > +     int ret;
> >
> >       if (!fb || !layout) {
> >               DRM_ERROR("invalid arguments\n");
> > @@ -940,9 +939,6 @@ int dpu_format_populate_layout(
> >       if (ret)
> >               return ret;
> >
> > -     for (i = 0; i < DPU_MAX_PLANES; ++i)
> > -             plane_addr[i] = layout->plane_addr[i];
> > -
> >       /* Populate the addresses given the fb */
> >       if (DPU_FORMAT_IS_UBWC(layout->format) ||
> >                       DPU_FORMAT_IS_TILE(layout->format))
> > @@ -950,10 +946,6 @@ int dpu_format_populate_layout(
> >       else
> >               ret = _dpu_format_populate_addrs_linear(aspace, fb, layout);
> >
> > -     /* check if anything changed */
> > -     if (!ret && !memcmp(plane_addr, layout->plane_addr, sizeof(plane_addr)))
> > -             ret = -EAGAIN;
> > -
> >       return ret;
> >   }
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index cdde7b9ec882..43fb8e00ada6 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -476,9 +476,7 @@ static void _dpu_plane_set_scanout(struct drm_plane *plane,
> >       int ret;
> >
> >       ret = dpu_format_populate_layout(aspace, fb, &pipe_cfg->layout);
> > -     if (ret == -EAGAIN)
> > -             DPU_DEBUG_PLANE(pdpu, "not updating same src addrs\n");
> > -     else if (ret)
> > +     if (ret)
> >               DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
> >       else if (pdpu->pipe_hw->ops.setup_sourceaddress) {
> >               trace_dpu_plane_set_scanout(pdpu->pipe_hw->idx,



-- 
With best wishes
Dmitry
