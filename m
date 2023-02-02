Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCEA688725
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 19:55:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5779110E5C7;
	Thu,  2 Feb 2023 18:55:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E1B10E5C7
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 18:55:29 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id o187so3454125ybg.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Feb 2023 10:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2EWI+WBg5KY/9eCi61QYIZBem7bGrhAfYnGlEtJpAFI=;
 b=Dw7qrEWGpFp15mBZLZs6C86qx6GFsCQXU6WAvtfQYS7UK2xhXEAc2rT+x44cL/N6yd
 HYoLqlB8Zr8WoVrP04o5PnyzD0eKurd2s5vwrvgI1Ewa/GNdyXx90q9TqMbEkKR+NdZ1
 mji3M9qDakBri3GqYzsHKRzaPOvAjxZT4VASoV7YI8M6HJ1DpUC0idY81nL73H0n0L99
 YI2lm0qyvml/yYYS0AgFNSCCglwKvSbf+hy0HOIHBulKdKZFXcwBitvoC17D+QIywxPp
 HOL64wsh9+SEMfB0t3LtshJfAKyvnIV/1kAO7xaEAofyuUIZhB3a/dB//yBH+S/1oBIT
 36fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2EWI+WBg5KY/9eCi61QYIZBem7bGrhAfYnGlEtJpAFI=;
 b=wNr11S9QcBIvYR2K/WszsLKNvlwgZGKnODwsSdv1sTTr409s4Rbf2gNynexYcH96Jz
 F9YN3SYo8S3Bz717ijuI/SGtHdxLgsp8c/LDezaqJCflB0Un57el7dP9ChQvQjv+B4e+
 fQdu4Al1/b13nX3iVgxXvBI6rtfkFEuBpjSkh1CBOhMrWUh57r//R0tDASL2Z94S0vN6
 wi2bSO496fB3xQTH5qNqMJwYrJupSzybBF/4JLN1UaxNfTlLHyPYUKeoij3IDTU9aIZh
 cDhAxdxtgAfS0ftJ/UFSTjTFBhhpO4IQNuvKZY2oEH/tljGXdxceuJDAZT/utw99P5Ss
 YEbQ==
X-Gm-Message-State: AO0yUKV82d8/VO089wThi7FEwUDydNuK1g/a9OuDVTkyxVG5Hl1uc71M
 akMeQojGOgk0bETfNA4TKGu/ZfHawX6dtK666/m3Sg==
X-Google-Smtp-Source: AK7set/NY/z6X5KSWcjD8qAD4d34Gvpc9VnyL15tUDULIyIUAqJLu8OzHj/CCiS5VbcQYWkKDiF4Ls92dsymeYB/j8k=
X-Received: by 2002:a25:b214:0:b0:709:9335:236e with SMTP id
 i20-20020a25b214000000b007099335236emr847700ybj.288.1675364129113; Thu, 02
 Feb 2023 10:55:29 -0800 (PST)
MIME-Version: 1.0
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
 <20221229191856.3508092-12-dmitry.baryshkov@linaro.org>
 <8a9ae8b1-dc2b-896e-353d-bb237fa0663e@quicinc.com>
In-Reply-To: <8a9ae8b1-dc2b-896e-353d-bb237fa0663e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 2 Feb 2023 20:55:18 +0200
Message-ID: <CAA8EJpooKAiZfJqz3nYsHbJfNkqxGikNb7U5P3907+nUwoLiNA@mail.gmail.com>
Subject: Re: [PATCH v2 11/27] drm/msm/dpu: move stride programming to
 dpu_hw_sspp_setup_sourceaddress
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

Hi Abhinav,

On Thu, 2 Feb 2023 at 20:41, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/29/2022 11:18 AM, Dmitry Baryshkov wrote:
> > Move stride programming to dpu_hw_sspp_setup_sourceaddress(), so that
> > dpu_hw_sspp_setup_rects() programs only source and destination
> > rectangles.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Sorry but once again, I dont see a response to my comment
>
> https://patchwork.freedesktop.org/patch/473166/?series=99909&rev=1#comment_875313
>
> So let me repeat that here:
>
> "This separation is logically correct, but there is another codepath
> using this.
>
> _dpu_plane_color_fill() calls pdpu->pipe_hw->ops.setup_rects.
>
> So for solid fill, I presume that stride getting programmed is 0 as
> there is no buffer to fetch from.

Could you please verify with the HW team what should be the correct
stride programming for the solid fill? I'll have to check what is
being programmed ATM.

>
> But with this separation, we will miss re-programming stride and it will
> remain at the old value even for solid fil cases?
>
> You might want to add setup_sourceaddress call there? But that wont make
> sense either because for solid fill there is nothing to fetch from.
>
> Perhaps, another op for stride programming then?
> "
>
> Also, this is the second patch in the series where the previous comments
> were not resolved/responded to.
>
> Hope that this was not just another rebase without looking at the prior
> comments.

I might have missed some of the comments during the rebase, please
excuse me. There was no intent to ignore them.


>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 57 +++++++++++----------
> >   1 file changed, 29 insertions(+), 28 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > index 176cd6dc9a69..2bd39c13d54d 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > @@ -447,7 +447,7 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
> >   {
> >       struct dpu_hw_sspp *ctx = pipe->sspp;
> >       struct dpu_hw_blk_reg_map *c;
> > -     u32 src_size, src_xy, dst_size, dst_xy, ystride0, ystride1;
> > +     u32 src_size, src_xy, dst_size, dst_xy;
> >       u32 src_size_off, src_xy_off, out_size_off, out_xy_off;
> >       u32 idx;
> >
> > @@ -478,44 +478,18 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
> >       dst_size = (drm_rect_height(&cfg->dst_rect) << 16) |
> >               drm_rect_width(&cfg->dst_rect);
> >
> > -     if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
> > -             ystride0 = (cfg->layout.plane_pitch[0]) |
> > -                     (cfg->layout.plane_pitch[1] << 16);
> > -             ystride1 = (cfg->layout.plane_pitch[2]) |
> > -                     (cfg->layout.plane_pitch[3] << 16);
> > -     } else {
> > -             ystride0 = DPU_REG_READ(c, SSPP_SRC_YSTRIDE0 + idx);
> > -             ystride1 = DPU_REG_READ(c, SSPP_SRC_YSTRIDE1 + idx);
> > -
> > -             if (pipe->multirect_index == DPU_SSPP_RECT_0) {
> > -                     ystride0 = (ystride0 & 0xFFFF0000) |
> > -                             (cfg->layout.plane_pitch[0] & 0x0000FFFF);
> > -                     ystride1 = (ystride1 & 0xFFFF0000)|
> > -                             (cfg->layout.plane_pitch[2] & 0x0000FFFF);
> > -             } else {
> > -                     ystride0 = (ystride0 & 0x0000FFFF) |
> > -                             ((cfg->layout.plane_pitch[0] << 16) &
> > -                              0xFFFF0000);
> > -                     ystride1 = (ystride1 & 0x0000FFFF) |
> > -                             ((cfg->layout.plane_pitch[2] << 16) &
> > -                              0xFFFF0000);
> > -             }
> > -     }
> > -
> >       /* rectangle register programming */
> >       DPU_REG_WRITE(c, src_size_off + idx, src_size);
> >       DPU_REG_WRITE(c, src_xy_off + idx, src_xy);
> >       DPU_REG_WRITE(c, out_size_off + idx, dst_size);
> >       DPU_REG_WRITE(c, out_xy_off + idx, dst_xy);
> > -
> > -     DPU_REG_WRITE(c, SSPP_SRC_YSTRIDE0 + idx, ystride0);
> > -     DPU_REG_WRITE(c, SSPP_SRC_YSTRIDE1 + idx, ystride1);
> >   }
> >
> >   static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
> >               struct dpu_hw_pipe_cfg *cfg)
> >   {
> >       struct dpu_hw_sspp *ctx = pipe->sspp;
> > +     u32 ystride0, ystride1;
> >       int i;
> >       u32 idx;
> >
> > @@ -537,6 +511,33 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
> >               DPU_REG_WRITE(&ctx->hw, SSPP_SRC3_ADDR + idx,
> >                               cfg->layout.plane_addr[2]);
> >       }
> > +
> > +     if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
> > +             ystride0 = (cfg->layout.plane_pitch[0]) |
> > +                     (cfg->layout.plane_pitch[1] << 16);
> > +             ystride1 = (cfg->layout.plane_pitch[2]) |
> > +                     (cfg->layout.plane_pitch[3] << 16);
> > +     } else {
> > +             ystride0 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE0 + idx);
> > +             ystride1 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE1 + idx);
> > +
> > +             if (pipe->multirect_index == DPU_SSPP_RECT_0) {
> > +                     ystride0 = (ystride0 & 0xFFFF0000) |
> > +                             (cfg->layout.plane_pitch[0] & 0x0000FFFF);
> > +                     ystride1 = (ystride1 & 0xFFFF0000)|
> > +                             (cfg->layout.plane_pitch[2] & 0x0000FFFF);
> > +             } else {
> > +                     ystride0 = (ystride0 & 0x0000FFFF) |
> > +                             ((cfg->layout.plane_pitch[0] << 16) &
> > +                              0xFFFF0000);
> > +                     ystride1 = (ystride1 & 0x0000FFFF) |
> > +                             ((cfg->layout.plane_pitch[2] << 16) &
> > +                              0xFFFF0000);
> > +             }
> > +     }
> > +
> > +     DPU_REG_WRITE(&ctx->hw, SSPP_SRC_YSTRIDE0 + idx, ystride0);
> > +     DPU_REG_WRITE(&ctx->hw, SSPP_SRC_YSTRIDE1 + idx, ystride1);
> >   }
> >
> >   static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,



-- 
With best wishes
Dmitry
