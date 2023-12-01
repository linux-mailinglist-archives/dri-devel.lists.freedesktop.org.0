Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 104B18005B7
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 09:35:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0302710E80B;
	Fri,  1 Dec 2023 08:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DDDF10E80B
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 08:35:02 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-5d34d85e610so17132787b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Dec 2023 00:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701419701; x=1702024501; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0vyyy44HJ0PCg/k+e1EPUHLw7C4zTOZSquNZFbC/lLQ=;
 b=xBDv2PqnSZnCBqmhJD5H81Fz2f6e58C2+DEfrImfdIKpsBkeskwanzSoi051p4pQ8O
 cYMbcYqmsApY+aBJEFEcMsCV6uSGevPRxf+k1XkG41QQvyD2a1l19n60uDwN+rsq+TUR
 08pSo5k9GvW2aI7XggMKMTG72wyNraImT0rchvKd8qEVw4vzjvVWu92gwTR1liUqIz9G
 ekqe+QUZwgFqI4bscy+y9Q9FSV7AeqWXSpklHp5nqOjWrxTpDtLcIl7PC33+ql1XoJCD
 cjdD3e86YOQXfsbkgMWeve7fGHCHl0azCMQK3EMMzz4NrucJshZPNQLcURCetreDplsh
 Bohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701419701; x=1702024501;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0vyyy44HJ0PCg/k+e1EPUHLw7C4zTOZSquNZFbC/lLQ=;
 b=mX5/jjo3lrTcFL7AZFkwsLt6XBky957zZJP0tI89FE0LCXWAXdmsJKdstkQy2kbp5L
 qqNUoZDdqh4jfk7ofJjJw5xsu5eYUUV0BBQVrwyxtXEIBJhxDiFDzw5VJL5fjMSxh1V+
 ddqCXFzixeM+fzNq1zVysuuog3FRqVGKNzB5/xRWQK0nX76Xyh7tsNCSbbwTerj3XOkv
 a5+KgDq0zxOHSkAK+9kbfXZ5QWK4fSbwP7eAGYCMkV1HF+Je2XU1Ff0E/VG1D2Z25Mx0
 /PvqZfALgEcYulmD9H3Sn3sIuUgb2wF2GvwjBIH9bYLOVdKH/hEsOSYJLh/nFvxtGfqF
 Dw9w==
X-Gm-Message-State: AOJu0YxVIt0O3LK3YgsQfJAOIqcu1dKpD2hPDQXtIlogzTeafU1+vTid
 Y4MktwL+AG8E4G0Ojm5ClC2wECOIwmHOnYNZ26qbEA==
X-Google-Smtp-Source: AGHT+IHsluDiR7TEy0JFz35RPDBZDAZGfERlf830bZCq3ZaKdNXxvA2SrojV1Ox4NklHZlOsNBsTriMfTwHWENQDftA=
X-Received: by 2002:a05:690c:dd2:b0:5d3:9bc7:57d1 with SMTP id
 db18-20020a05690c0dd200b005d39bc757d1mr4087419ywb.10.1701419701383; Fri, 01
 Dec 2023 00:35:01 -0800 (PST)
MIME-Version: 1.0
References: <20231201014101.15802-1-quic_parellan@quicinc.com>
 <20231201014101.15802-3-quic_parellan@quicinc.com>
 <20231201034710.GB1766637@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <20231201034710.GB1766637@hu-bjorande-lv.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 1 Dec 2023 10:34:50 +0200
Message-ID: <CAA8EJpqFya5H+4PPZ8A3CqqqRJXsJ3KKbbcfS=C13QTr1vAtSw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/msm/dpu: Add mutex lock in control vblank irq
To: Bjorn Andersson <quic_bjorande@quicinc.com>
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
Cc: marijn.suijten@somainline.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, steev@kali.org,
 quic_jesszhan@quicinc.com, Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 1 Dec 2023 at 05:47, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> On Thu, Nov 30, 2023 at 05:40:55PM -0800, Paloma Arellano wrote:
> > Add a missing mutex lock to control vblank irq. Thus prevent race
> > conditions when registering/unregistering the irq callback.
> >
>
> I'm guessing that the mutex is needed because vblank_refcount, while
> being an atomic_t, doesn't actually provide any protection during
> concurrency?
>
> I also tried to follow the calls backwards, but I'm uncertain how you
> end up here concurrently.
>
> When wrapped in proper mutual exclusion, can't vblank_refcount just be
> turned into an "int"...given that you're not actually able to rely on
> it's atomic behavior anyways...
>
>
> So, please rewrite the commit message with a detailed description of how
> the concurrency happens, and please review if vblank_refcount should be
> an atomic at all...
>
> > v2: Slightly changed wording of commit message
> > v3: Mistakenly did not change wording in last version. It is done now.
> >
> > Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          | 6 ++++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     | 6 ++++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 2 ++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 ++
> >  4 files changed, 16 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 1cf7ff6caff4e..19ff7d1d5ccad 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -119,6 +119,8 @@ enum dpu_enc_rc_states {
> >   *   Virtual encoder defers as much as possible to the physical encoders.
> >   *   Virtual encoder registers itself with the DRM Framework as the encoder.
> >   * @base:            drm_encoder base class for registration with DRM
> > + * @vblank_ctl_lock: Vblank ctl mutex lock to protect physical encoder
> > + *                                           for IRQ purposes
>
> I think this protects vblank_refcount, so state that instead of the
> vague "for IRQ purposes".
>
> >   * @enc_spinlock:    Virtual-Encoder-Wide Spin Lock for IRQ purposes
> >   * @enabled:         True if the encoder is active, protected by enc_lock
> >   * @num_phys_encs:   Actual number of physical encoders contained.
> > @@ -166,6 +168,7 @@ enum dpu_enc_rc_states {
> >   */
> >  struct dpu_encoder_virt {
> >       struct drm_encoder base;
> > +     struct mutex vblank_ctl_lock;
> >       spinlock_t enc_spinlock;
> >
> >       bool enabled;
> > @@ -2255,6 +2258,7 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
> >       phys_params.dpu_kms = dpu_kms;
> >       phys_params.parent = &dpu_enc->base;
> >       phys_params.enc_spinlock = &dpu_enc->enc_spinlock;
> > +     phys_params.vblank_ctl_lock = &dpu_enc->vblank_ctl_lock;
> >
> >       WARN_ON(disp_info->num_of_h_tiles < 1);
> >
> > @@ -2386,6 +2390,7 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
> >       dpu_enc->enabled = false;
> >       mutex_init(&dpu_enc->enc_lock);
> >       mutex_init(&dpu_enc->rc_lock);
> > +     mutex_init(&dpu_enc->vblank_ctl_lock);
>
> Is this somehow propagated to multiple different dpu_encoder_phys
> instances, or why do you need to initialize it here and pass the pointer
> through 2 different intermediate structures before assigning it to
> phys_enc->vblank_ctl_lock below?

Yes, there can be two phys_enc instances for a single encoder, so this
part is fine.

>
> >
> >       ret = dpu_encoder_setup_display(dpu_enc, dpu_kms, disp_info);
> >       if (ret)
> > @@ -2495,6 +2500,7 @@ void dpu_encoder_phys_init(struct dpu_encoder_phys *phys_enc,
> >       phys_enc->dpu_kms = p->dpu_kms;
> >       phys_enc->split_role = p->split_role;
> >       phys_enc->enc_spinlock = p->enc_spinlock;
> > +     phys_enc->vblank_ctl_lock = p->vblank_ctl_lock;
>
> Could you not just mutex_init() the one and only vblank_ctl_lock here?
>
> >       phys_enc->enable_state = DPU_ENC_DISABLED;
> >
> >       atomic_set(&phys_enc->vblank_refcount, 0);
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > index 6f04c3d56e77c..5691bf6b82ee6 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > @@ -155,6 +155,8 @@ enum dpu_intr_idx {
> >   * @hw_wb:           Hardware interface to the wb registers
> >   * @dpu_kms:         Pointer to the dpu_kms top level
> >   * @cached_mode:     DRM mode cached at mode_set time, acted on in enable
> > + * @vblank_ctl_lock: Vblank ctl mutex lock to protect physical encoder
> > + *                                           for IRQ purposes
>
> Same here.
>
> >   * @enabled:         Whether the encoder has enabled and running a mode
> >   * @split_role:              Role to play in a split-panel configuration
> >   * @intf_mode:               Interface mode
> > @@ -183,6 +185,7 @@ struct dpu_encoder_phys {
> >       struct dpu_hw_wb *hw_wb;
> >       struct dpu_kms *dpu_kms;
> >       struct drm_display_mode cached_mode;
> > +     struct mutex *vblank_ctl_lock;
> >       enum dpu_enc_split_role split_role;
> >       enum dpu_intf_mode intf_mode;
> >       spinlock_t *enc_spinlock;
> > @@ -253,6 +256,8 @@ struct dpu_encoder_phys_cmd {
> >   * @split_role:              Role to play in a split-panel configuration
> >   * @hw_intf:         Hardware interface to the intf registers
> >   * @hw_wb:           Hardware interface to the wb registers
> > + * @vblank_ctl_lock: Vblank ctl mutex lock to protect physical encoder
> > + *                                           for IRQ purposes
>
> And here...
>
> Regards,
> Bjorn
>
> >   * @enc_spinlock:    Virtual-Encoder-Wide Spin Lock for IRQ purposes
> >   */
> >  struct dpu_enc_phys_init_params {
> > @@ -261,6 +266,7 @@ struct dpu_enc_phys_init_params {
> >       enum dpu_enc_split_role split_role;
> >       struct dpu_hw_intf *hw_intf;
> >       struct dpu_hw_wb *hw_wb;
> > +     struct mutex *vblank_ctl_lock;
> >       spinlock_t *enc_spinlock;
> >  };
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > index 25babfe1f001a..dcf1f6a18ad6e 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > @@ -244,6 +244,7 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
> >               return -EINVAL;
> >       }
> >
> > +     mutex_lock(phys_enc->vblank_ctl_lock);
> >       refcount = atomic_read(&phys_enc->vblank_refcount);
> >
> >       /* Slave encoders don't report vblank */
> > @@ -275,6 +276,7 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
> >       }
> >
> >  end:
> > +     mutex_unlock(phys_enc->vblank_ctl_lock);
> >       if (ret) {
> >               DRM_ERROR("vblank irq err id:%u pp:%d ret:%d, enable %s/%d\n",
> >                         DRMID(phys_enc->parent),
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > index 8e905d7267f9f..87bb49763785d 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > @@ -364,6 +364,7 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
> >       int ret = 0;
> >       int refcount;
> >
> > +     mutex_lock(phys_enc->vblank_ctl_lock);
> >       refcount = atomic_read(&phys_enc->vblank_refcount);
> >
> >       /* Slave encoders don't report vblank */
> > @@ -394,6 +395,7 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
> >       }
> >
> >  end:
> > +     mutex_unlock(phys_enc->vblank_ctl_lock);
> >       if (ret) {
> >               DRM_ERROR("failed: id:%u intf:%d ret:%d enable:%d refcnt:%d\n",
> >                         DRMID(phys_enc->parent),
> > --
> > 2.41.0
> >
> >



-- 
With best wishes
Dmitry
