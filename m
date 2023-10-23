Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC2A7D42B7
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 00:37:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B1B10E295;
	Mon, 23 Oct 2023 22:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C851110E293;
 Mon, 23 Oct 2023 22:36:57 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-53ed4688b9fso5599875a12.0; 
 Mon, 23 Oct 2023 15:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698100616; x=1698705416; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uisNEnKiLvzZ+t0alkOWDfQg+z38fVUgSrvIklCPQR0=;
 b=RQ7qZMu2Y09RD4Hl4abVq9AZavQzr6Tf2J6AIerTNiNeZZskjY/yNGtHyb9Oq2YIW8
 HW7F3N+w2CdAkRcKNU6RWMpx0srN6iK/H7bWJLSsxewxQa9+o/vxV0tHYD2drpddYAaT
 THFt4+BfC0nKckxIBAS4bbYPoCFJKvEMehekBnGPXc5ON+b96mhWFASK48N8Suv5m1yd
 hlwXpRLzUggKXFh5ecqZoAdqpQPbbJqlen1bCoIOveF4hpuhlXLSOnouWzyEsNrbLDA/
 WMXa1hD1USzw/WqDwIg05ZVw2ag7H0Se37SwZ8x3Je2tO+x59mQh/ljdh9b+SHk21TGr
 ll7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698100616; x=1698705416;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uisNEnKiLvzZ+t0alkOWDfQg+z38fVUgSrvIklCPQR0=;
 b=mRsxtcbAw2kkliMSyElU2hwDuDMfkoTnHx/sm2eKJdKYflsoCKef0S7WzpOds2LYN1
 IlXqTnuJpNcexoMQLwoRSlh1pFYNV7AO7L42lBO6+OwNxTMm4Vx5N5fevwk0mqKxr8dz
 HtFG4LxYcBQlNXlgwFDhQt3Wwo69SNZenOL+qbv0Ij5iOKi1vK8Dd89gFsCnOUO75iZs
 0k9kyB9adN54h01W6QqR+IzBzWy3xF1lRrwHjViGHQ7XzHLESYEFLOp//D1xtd6KDapP
 yQB+kwB/nAwc7ry/kUtmP8bCLe8b1R5AKq5oIMlEXrkaivbxHFnu0HlsAhiZxH/Tv3sc
 48tQ==
X-Gm-Message-State: AOJu0YyN9xApR1nYIPf6CQ1m//G1/DbpaImVfRk10EwtzxPny7zVHTP8
 8Ml2x2Xxtv/UNAfoZS1dLbZng1CdzV2GTVUE1oQ=
X-Google-Smtp-Source: AGHT+IGMf4UYY5KANcnnRLqOhkjK+BWeCY8aRR86ppUEW/GzT48qdrTYGUAqoH+Qv5NWjSt8GDFg1GsfW00nmZ6iJv8=
X-Received: by 2002:a50:d5d4:0:b0:53f:5b60:8269 with SMTP id
 g20-20020a50d5d4000000b0053f5b608269mr7338766edj.33.1698100615889; Mon, 23
 Oct 2023 15:36:55 -0700 (PDT)
MIME-Version: 1.0
References: <20231023221250.116500-1-robdclark@gmail.com>
 <CAA8EJpqVL5U7yaZsG5F=q7EFP1bsApySdjycywox6cZUd8JqdA@mail.gmail.com>
In-Reply-To: <CAA8EJpqVL5U7yaZsG5F=q7EFP1bsApySdjycywox6cZUd8JqdA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 23 Oct 2023 15:36:43 -0700
Message-ID: <CAF6AEGvbKjHYU6qv4v3017DguEye23yMoYvTbEo=JZ+QW3=Atg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Fix encoder CRC to account for CTM enablement
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Rob Clark <robdclark@chromium.org>, Kalyan Thota <quic_kalyant@quicinc.com>,
 Jeykumar Sankaran <quic_jeykumar@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 open list <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org,
 Arnaud Vrac <rawoul@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 23, 2023 at 3:30=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, 24 Oct 2023 at 01:12, Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Seems like we need to pick INPUT_SEL=3D1 when CTM is enabled.  But not
> > otherwise.
> >
> > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 2 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 ++--
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 3 ++-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 4 ++--
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h | 2 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   | 2 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 5 ++++-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h | 3 ++-
> >  8 files changed, 15 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.c
> > index 2b83a13b3aa9..d93a92ffd5df 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -134,7 +134,7 @@ static void dpu_crtc_setup_encoder_misr(struct drm_=
crtc *crtc)
> >         struct drm_encoder *drm_enc;
> >
> >         drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc->state->enco=
der_mask)
> > -               dpu_encoder_setup_misr(drm_enc);
> > +               dpu_encoder_setup_misr(drm_enc, !!crtc->state->ctm);
> >  }
> >
> >  static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *=
src_name)
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_encoder.c
> > index b0a7908418ed..12ee7acb5ea6 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -241,7 +241,7 @@ int dpu_encoder_get_crc_values_cnt(const struct drm=
_encoder *drm_enc)
> >         return num_intf;
> >  }
> >
> > -void dpu_encoder_setup_misr(const struct drm_encoder *drm_enc)
> > +void dpu_encoder_setup_misr(const struct drm_encoder *drm_enc, bool ha=
s_ctm)
> >  {
> >         struct dpu_encoder_virt *dpu_enc;
> >
> > @@ -255,7 +255,7 @@ void dpu_encoder_setup_misr(const struct drm_encode=
r *drm_enc)
> >                 if (!phys->hw_intf || !phys->hw_intf->ops.setup_misr)
> >                         continue;
> >
> > -               phys->hw_intf->ops.setup_misr(phys->hw_intf, true, 1);
> > +               phys->hw_intf->ops.setup_misr(phys->hw_intf, true, 1, h=
as_ctm);
> >         }
> >  }
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_encoder.h
> > index 4c05fd5e9ed1..510783b2fb24 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > @@ -169,8 +169,9 @@ int dpu_encoder_get_crc_values_cnt(const struct drm=
_encoder *drm_enc);
> >  /**
> >   * dpu_encoder_setup_misr - enable misr calculations
> >   * @drm_enc:    Pointer to previously created drm encoder structure
> > + * @has_ctm:    Is CTM enabled
> >   */
> > -void dpu_encoder_setup_misr(const struct drm_encoder *drm_encoder);
> > +void dpu_encoder_setup_misr(const struct drm_encoder *drm_encoder, boo=
l has_ctm);
> >
> >  /**
> >   * dpu_encoder_get_crc - get the crc value from interface blocks
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_hw_intf.c
> > index e8b8908d3e12..cb06f80cc671 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > @@ -318,9 +318,9 @@ static u32 dpu_hw_intf_get_line_count(struct dpu_hw=
_intf *intf)
> >         return DPU_REG_READ(c, INTF_LINE_COUNT);
> >  }
> >
> > -static void dpu_hw_intf_setup_misr(struct dpu_hw_intf *intf, bool enab=
le, u32 frame_count)
> > +static void dpu_hw_intf_setup_misr(struct dpu_hw_intf *intf, bool enab=
le, u32 frame_count, bool has_ctm)
> >  {
> > -       dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL, enable, frame_coun=
t);
> > +       dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL, enable, frame_coun=
t, has_ctm);
>
> I'm not sure about the dpu_encoder and dpu_hw_intf interfaces. But
> dpu_hw_setup_misr definitely needs the `u8 input_sel` parameter
> instead of `bool has_ctm`.

That seems a bit premature without knowing what the other values are.
(And I also question a bit the whole abstraction layer thing if it is
taking directly register bitfield enum's..)

BR,
-R

> Most likely, I'd use u8 for dpu_hw_intf operation too.
>
> Could you please adjust?
>
> >  }
> >
> >  static int dpu_hw_intf_collect_misr(struct dpu_hw_intf *intf, u32 *mis=
r_value)
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_hw_intf.h
> > index c539025c418b..95aafc4cf58e 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> > @@ -95,7 +95,7 @@ struct dpu_hw_intf_ops {
> >
> >         void (*bind_pingpong_blk)(struct dpu_hw_intf *intf,
> >                         const enum dpu_pingpong pp);
> > -       void (*setup_misr)(struct dpu_hw_intf *intf, bool enable, u32 f=
rame_count);
> > +       void (*setup_misr)(struct dpu_hw_intf *intf, bool enable, u32 f=
rame_count, bool has_ctm);
> >         int (*collect_misr)(struct dpu_hw_intf *intf, u32 *misr_value);
> >
> >         // Tearcheck on INTF since DPU 5.0.0
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_hw_lm.c
> > index d1c3bd8379ea..2efe29396c6a 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> > @@ -83,7 +83,7 @@ static void dpu_hw_lm_setup_border_color(struct dpu_h=
w_mixer *ctx,
> >
> >  static void dpu_hw_lm_setup_misr(struct dpu_hw_mixer *ctx, bool enable=
, u32 frame_count)
> >  {
> > -       dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, enable, frame_count);
> > +       dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, enable, frame_count, =
false);
> >  }
> >
> >  static int dpu_hw_lm_collect_misr(struct dpu_hw_mixer *ctx, u32 *misr_=
value)
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_hw_util.c
> > index 9d2273fd2fed..528b8439209f 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> > @@ -483,7 +483,7 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_ma=
p *c, u32 offset,
> >
> >  void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
> >                 u32 misr_ctrl_offset,
> > -               bool enable, u32 frame_count)
> > +               bool enable, u32 frame_count, bool has_ctm)
> >  {
> >         u32 config =3D 0;
> >
> > @@ -496,6 +496,9 @@ void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c=
,
> >                 config =3D (frame_count & MISR_FRAME_COUNT_MASK) |
> >                         MISR_CTRL_ENABLE | MISR_CTRL_FREE_RUN_MASK;
> >
> > +               if (!has_ctm)
> > +                       config |=3D 1 << 24;
>
> Please define MISR_CTRL_INPUT_SEL instead.
>
> > +
> >                 DPU_REG_WRITE(c, misr_ctrl_offset, config);
> >         } else {
> >                 DPU_REG_WRITE(c, misr_ctrl_offset, 0);
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_hw_util.h
> > index 1f6079f47071..e42d9d00e40e 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> > @@ -360,7 +360,8 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_ma=
p *c, u32 offset,
> >  void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
> >                 u32 misr_ctrl_offset,
> >                 bool enable,
> > -               u32 frame_count);
> > +               u32 frame_count,
> > +               bool has_ctm);
> >
> >  int dpu_hw_collect_misr(struct dpu_hw_blk_reg_map *c,
> >                 u32 misr_ctrl_offset,
> > --
> > 2.41.0
> >
>
>
> --
> With best wishes
> Dmitry
